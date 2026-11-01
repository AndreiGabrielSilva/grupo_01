USE assistencia_tecnica;

-- 1. Clientes cuja categoria nao corresponde ao CPF/CNPJ informado.
SELECT id_cliente, cpf, cnpj, tipo_cliente
FROM cliente
WHERE (cpf IS NOT NULL AND (cnpj IS NOT NULL OR tipo_cliente <> 'Pessoa Física'))
   OR (cnpj IS NOT NULL AND (cpf IS NOT NULL OR tipo_cliente <> 'Pessoa Jurídica'))
   OR (cpf IS NULL AND cnpj IS NULL);

-- 2. Ordens sem exatamente um cliente associado pela tabela abre_ordem.
SELECT
  o.numero_os,
  COUNT(ao.id_cliente) AS quantidade_clientes
FROM ordem_servico AS o
LEFT JOIN abre_ordem AS ao ON ao.numero_os = o.numero_os
GROUP BY o.numero_os
HAVING COUNT(ao.id_cliente) <> 1;

-- 3. Clientes associados a uma ordem inexistente (integridade da tabela associativa).
SELECT ao.id_cliente, ao.numero_os
FROM abre_ordem AS ao
LEFT JOIN cliente AS c ON c.id_cliente = ao.id_cliente
LEFT JOIN ordem_servico AS o ON o.numero_os = ao.numero_os
WHERE c.id_cliente IS NULL OR o.numero_os IS NULL;

-- 4. Ordens com datas incoerentes ou ainda abertas depois do prazo.
SELECT
  numero_os,
  data_abertura,
  prazo_entrega,
  data_finalizacao,
  CASE
    WHEN prazo_entrega < DATE(data_abertura) THEN 'Prazo anterior a abertura'
    WHEN data_finalizacao < data_abertura THEN 'Finalizacao anterior a abertura'
    WHEN data_finalizacao IS NULL AND prazo_entrega < CURDATE() THEN 'Aberta em atraso'
  END AS inconsistencia
FROM ordem_servico
WHERE prazo_entrega < DATE(data_abertura)
   OR data_finalizacao < data_abertura
   OR (data_finalizacao IS NULL AND prazo_entrega < CURDATE())
ORDER BY numero_os;

-- 5. Itens com quantidade/preco inconsistente em relacao ao cadastro atual do produto.
-- Divergencias podem ser legitimas se o preco do produto mudou apos o orcamento.
SELECT
  i.numero_os,
  p.id_produto,
  p.nome_produto,
  i.quantidade,
  p.preco AS preco_atual,
  i.valor_produtos AS valor_registrado,
  p.preco * i.quantidade AS valor_calculado
FROM itens_orcamento AS i
INNER JOIN produto AS p ON p.id_produto = i.id_produto
WHERE i.quantidade <= 0
   OR i.valor_produtos < 0
   OR i.taxa_prestacao_servico < 0
   OR ABS(i.valor_produtos - (p.preco * i.quantidade)) > 0.01;

-- 6. Folhas com salario liquido diferente da base menos descontos.
SELECT
  id_folha,
  carteira_trabalho,
  mes_salario,
  salario_base,
  desconto_inss,
  salario_liquido,
  salario_base - desconto_inss AS liquido_calculado
FROM folha_pagamento
WHERE salario_base < 0
   OR desconto_inss < 0
   OR salario_liquido < 0
   OR ABS(salario_liquido - (salario_base - desconto_inss)) > 0.01;

-- 7. Funcionarios com mais de um cargo marcado como ativo.
SELECT
  f.carteira_trabalho,
  f.nome_funcionario,
  COUNT(*) AS cargos_ativos
FROM funcionario AS f
INNER JOIN historico_cargo AS hc
  ON hc.carteira_trabalho = f.carteira_trabalho
WHERE hc.ativo = TRUE
GROUP BY f.carteira_trabalho, f.nome_funcionario
HAVING COUNT(*) > 1;

-- 8. Lancamentos financeiros com valores invalidos ou pendencias vencidas.
SELECT
  id_financeiro,
  id_os,
  valor,
  dt_vencimento,
  status_pagamento,
  CASE
    WHEN valor <= 0 THEN 'Valor menor ou igual a zero'
    WHEN status_pagamento = 'Pendente' AND dt_vencimento < NOW() THEN 'Pagamento pendente vencido'
  END AS inconsistencia
FROM financeiro
WHERE valor <= 0
   OR (status_pagamento = 'Pendente' AND dt_vencimento < NOW());

-- 9. Estoque negativo, quantidade minima negativa ou produtos sem cadastro.
SELECT
  e.id_estoque,
  e.id_produto,
  e.quantidade,
  e.quantidade_minima
FROM estoque AS e
LEFT JOIN produto AS p ON p.id_produto = e.id_produto
WHERE p.id_produto IS NULL
   OR e.quantidade < 0
   OR e.quantidade_minima < 0;

-- 10. Candidatos a duplicidade de CPF entre funcionarios.
SELECT cpf, COUNT(*) AS quantidade_funcionarios
FROM funcionario
GROUP BY cpf
HAVING COUNT(*) > 1;
