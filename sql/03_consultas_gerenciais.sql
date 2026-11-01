USE assistencia_tecnica;

-- 1. Pecas e produtos mais utilizados nos itens de orcamento.
SELECT
  p.id_produto,
  p.nome_produto,
  SUM(i.quantidade) AS quantidade_utilizada,
  SUM(i.valor_produtos) AS valor_total_dos_itens
FROM itens_orcamento AS i
INNER JOIN produto AS p ON p.id_produto = i.id_produto
GROUP BY p.id_produto, p.nome_produto
ORDER BY quantidade_utilizada DESC, p.nome_produto;

-- 2. Ordens de servico em atraso que ainda nao foram finalizadas.
SELECT
  o.numero_os,
  COALESCE(p.nome_pessoa, e.nome_fantasia) AS cliente,
  f.nome_funcionario AS funcionario_responsavel,
  o.data_abertura,
  o.prazo_entrega,
  DATEDIFF(CURDATE(), o.prazo_entrega) AS dias_em_atraso,
  o.defeito_relatado
FROM ordem_servico AS o
INNER JOIN abre_ordem AS ao ON ao.numero_os = o.numero_os
INNER JOIN cliente AS c ON c.id_cliente = ao.id_cliente
LEFT JOIN pessoa AS p ON p.cpf = c.cpf
LEFT JOIN empresa AS e ON e.cnpj = c.cnpj
INNER JOIN funcionario AS f ON f.id_funcionario = o.id_funcionario
WHERE o.data_finalizacao IS NULL
  AND o.prazo_entrega < CURDATE()
ORDER BY o.prazo_entrega;

-- 3. Quantidade de ordens abertas, em andamento, concluidas e atrasadas.
SELECT
  CASE
    WHEN data_finalizacao IS NOT NULL THEN 'Concluida'
    WHEN prazo_entrega < CURDATE() THEN 'Em atraso'
    ELSE 'Em andamento/no prazo'
  END AS situacao_atual,
  COUNT(*) AS quantidade_ordens
FROM ordem_servico
GROUP BY situacao_atual
ORDER BY quantidade_ordens DESC;

-- 4. Faturamento e valores pendentes agrupados pela situacao financeira.
SELECT
  status_pagamento,
  COUNT(*) AS quantidade_lancamentos,
  SUM(valor) AS valor_total
FROM financeiro
GROUP BY status_pagamento
ORDER BY valor_total DESC;

-- 5. Desempenho por funcionario: ordens atribuidas, concluidas e tempo registrado.
SELECT
  f.id_funcionario,
  f.nome_funcionario,
  COUNT(DISTINCT o.numero_os) AS ordens_atribuidas,
  COUNT(DISTINCT CASE WHEN o.data_finalizacao IS NOT NULL THEN o.numero_os END)
    AS ordens_concluidas,
  COALESCE(SUM(tm.tempo_manutencao), 0) AS minutos_de_manutencao
FROM funcionario AS f
LEFT JOIN ordem_servico AS o ON o.id_funcionario = f.id_funcionario
LEFT JOIN tempo_manutencao AS tm ON tm.numero_os = o.numero_os
GROUP BY f.id_funcionario, f.nome_funcionario
ORDER BY ordens_atribuidas DESC, f.nome_funcionario;

-- 6. Produtos abaixo do estoque minimo.
SELECT
  p.id_produto,
  p.nome_produto,
  e.quantidade,
  e.quantidade_minima,
  e.localizacao
FROM estoque AS e
INNER JOIN produto AS p ON p.id_produto = e.id_produto
WHERE e.quantidade < e.quantidade_minima
ORDER BY (e.quantidade_minima - e.quantidade) DESC;

-- 7. Quantidade de ordens e valor de orcamentos por cliente.
-- Considera somente a decisao mais recente de cada orcamento.
SELECT
  c.id_cliente,
  COALESCE(p.nome_pessoa, e.nome_fantasia) AS cliente,
  COUNT(DISTINCT o.numero_os) AS quantidade_ordens,
  COALESCE(SUM(ho.valor_orcamento), 0) AS valor_orcado
FROM cliente AS c
LEFT JOIN pessoa AS p ON p.cpf = c.cpf
LEFT JOIN empresa AS e ON e.cnpj = c.cnpj
LEFT JOIN abre_ordem AS ao ON ao.id_cliente = c.id_cliente
LEFT JOIN ordem_servico AS o ON o.numero_os = ao.numero_os
LEFT JOIN historico_orcamento AS ho
  ON ho.numero_os = o.numero_os
  AND NOT EXISTS (
    SELECT 1
    FROM historico_orcamento AS ho_mais_recente
    WHERE ho_mais_recente.numero_os = ho.numero_os
      AND (
        ho_mais_recente.data_decisao > ho.data_decisao
        OR (
          ho_mais_recente.data_decisao = ho.data_decisao
          AND ho_mais_recente.id_historico > ho.id_historico
        )
      )
  )
GROUP BY c.id_cliente, p.nome_pessoa, e.nome_fantasia
ORDER BY quantidade_ordens DESC, cliente;

-- 8. Tempo medio de manutencao por mes de abertura (tempo armazenado em minutos).
SELECT
  DATE_FORMAT(o.data_abertura, '%Y-%m') AS mes,
  COUNT(tm.id_manutencao) AS manutencoes_registradas,
  ROUND(AVG(tm.tempo_manutencao), 2) AS media_minutos
FROM ordem_servico AS o
INNER JOIN tempo_manutencao AS tm ON tm.numero_os = o.numero_os
GROUP BY DATE_FORMAT(o.data_abertura, '%Y-%m')
ORDER BY mes;
