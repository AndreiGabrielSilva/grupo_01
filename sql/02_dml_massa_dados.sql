USE assistencia_tecnica;

-- Dados ficticios para demonstracao. Execute depois de 01_ddl_estrutura.sql.
-- Os identificadores foram informados para facilitar os testes das consultas.
START TRANSACTION;

INSERT INTO pessoa (id_pessoa, nome_pessoa, cpf, telefone, email) VALUES
(1, 'Maria Oliveira', '111.111.111-11', '(11) 99999-1001', 'maria@email.com'),
(2, 'Carlos Souza', '222.222.222-22', '(11) 99999-1002', 'carlos@email.com'),
(3, 'Juliana Costa', '333.333.333-33', '(11) 99999-1003', 'juliana@email.com');

INSERT INTO empresa (
  id_empresa, razao_social, nome_fantasia, cnpj, endereco,
  situacao_cadastral, regime_tributario, telefone, email
) VALUES
(1, 'TechFix Assistencia Ltda', 'TechFix', '10.100.100/0001-10',
 'Rua Central, 100 - Sao Paulo', 'Ativa', 'Simples Nacional',
 '(11) 3333-1000', 'contato@techfix.com'),
(2, 'Comercio Exemplo Ltda', 'Comercio Exemplo', '20.200.200/0001-20',
 'Avenida Brasil, 200 - Sao Paulo', 'Ativa', 'Lucro Presumido',
 '(11) 3333-2000', 'administrativo@comercioexemplo.com');

INSERT INTO cliente (id_cliente, cpf, cnpj, tipo_cliente) VALUES
(1, '111.111.111-11', NULL, 'Pessoa Física'),
(2, '222.222.222-22', NULL, 'Pessoa Física'),
(3, NULL, '20.200.200/0001-20', 'Pessoa Jurídica');

INSERT INTO telefone_pessoa (cpf, numero_telefone) VALUES
('111.111.111-11', '(11) 99999-1001'),
('222.222.222-22', '(11) 99999-1002'),
('333.333.333-33', '(11) 99999-1003');

INSERT INTO email_pessoa (cpf, email) VALUES
('111.111.111-11', 'maria@email.com'),
('222.222.222-22', 'carlos@email.com'),
('333.333.333-33', 'juliana@email.com');

INSERT INTO telefone_empresa (cnpj, numero_telefone) VALUES
('10.100.100/0001-10', '(11) 3333-1000'),
('20.200.200/0001-20', '(11) 3333-2000');

INSERT INTO email_empresa (cnpj, email) VALUES
('10.100.100/0001-10', 'contato@techfix.com'),
('20.200.200/0001-20', 'administrativo@comercioexemplo.com');

INSERT INTO fornecedor (id_fornecedor, nome_fornecedor, cnpj, telefone, email) VALUES
(1, 'Distribuidora de Informatica', '30.300.300/0001-30',
 '(11) 3222-3000', 'vendas@distribuidora.com'),
(2, 'Pecas e Acessorios Ltda', '40.400.400/0001-40',
 '(11) 3222-4000', 'contato@pecasacessorios.com');

INSERT INTO produto (id_produto, nome_produto, descricao, preco, categoria) VALUES
(1, 'SSD 480 GB', 'Unidade de armazenamento SSD', 250.00, 'Armazenamento'),
(2, 'Memoria RAM 8 GB', 'Modulo de memoria para computador', 180.00, 'Memoria'),
(3, 'Kit de limpeza', 'Materiais para limpeza de equipamentos', 35.00, 'Acessorios');

INSERT INTO estoque (
  id_estoque, id_produto, quantidade, quantidade_minima, localizacao
) VALUES
(1, 1, 8, 3, 'Prateleira A1'),
(2, 2, 1, 3, 'Prateleira A2'),
(3, 3, 20, 5, 'Prateleira B1');

INSERT INTO funcionario (
  id_funcionario, numero_cracha, carteira_trabalho, nome_funcionario, cpf, status
) VALUES
(1, 'FUNC-001', 'CTPS-0001', 'Joao da Silva', '555.555.555-55', 'Ativo'),
(2, 'FUNC-002', 'CTPS-0002', 'Ana Pereira', '666.666.666-66', 'Ativo');

INSERT INTO historico_cargo (
  id_historico_cargo, carteira_trabalho, nome_cargo, data_inicio, data_fim, ativo
) VALUES
(1, 'CTPS-0001', 'Tecnico de Informatica', '2024-01-10', NULL, TRUE),
(2, 'CTPS-0002', 'Tecnica de Informatica', '2024-06-01', NULL, TRUE);

INSERT INTO folha_pagamento (
  id_folha, carteira_trabalho, mes_salario, salario_base, desconto_inss, salario_liquido
) VALUES
(1, 'CTPS-0001', '2026-10', 3000.00, 270.00, 2730.00),
(2, 'CTPS-0002', '2026-10', 3200.00, 288.00, 2912.00);

INSERT INTO escala (
  id_escala, carteira_trabalho, hora_entrada, hora_saida,
  horas_extras, horas_devedoras, dias_trabalhados, mes
) VALUES
(1, 'CTPS-0001', '08:00:00', '17:00:00', 2.00, 0.00, 22, '2026-10'),
(2, 'CTPS-0002', '09:00:00', '18:00:00', 0.00, 1.00, 21, '2026-10');

INSERT INTO ferias (
  id_ferias, carteira_trabalho, periodo_aquisitivo, periodo_concessivo,
  data_inicio, data_fim, status
) VALUES
(1, 'CTPS-0001', '2025-01 a 2025-12', '2026-01 a 2026-12',
 '2026-12-01', '2026-12-30', 'Agendada'),
(2, 'CTPS-0002', '2025-06 a 2026-05', '2026-06 a 2027-05',
 '2027-01-05', '2027-02-03', 'Agendada');

INSERT INTO os (
  id_os, id_pessoa, id_empresa, dt_emissao, valor_total, status_os
) VALUES
(1, 1, 1, '2026-10-20 09:00:00', 630.00, 'Aberta'),
(2, 2, 1, '2026-10-22 10:30:00', 370.00, 'Em andamento'),
(3, 3, 1, '2026-10-28 14:00:00', 115.00, 'Concluida'),
(4, 1, 1, '2026-11-01 08:30:00', 510.00, 'Aberta');

INSERT INTO ordem_servico (
  numero_os, id_funcionario, data_abertura, prazo_entrega, data_finalizacao,
  defeito_relatado, modelo_equipamento, software_equipamento, forma_pagamento
) VALUES
(1, 1, '2026-10-20 09:00:00', '2026-10-25', NULL,
 'Computador lento e com falhas no armazenamento', 'Notebook Pro 15',
 'Windows 11', 'Cartao de credito'),
(2, 2, '2026-10-22 10:30:00', '2026-10-30', NULL,
 'Desligamentos inesperados e memoria insuficiente', 'Desktop Office',
 'Windows 10', 'Pix'),
(3, 1, '2026-10-28 14:00:00', '2026-10-31', '2026-10-30 16:00:00',
 'Revisao preventiva e limpeza interna', 'Notebook Air 14',
 'Linux Ubuntu', 'Dinheiro'),
(4, 2, '2026-11-01 08:30:00', '2026-11-15', NULL,
 'Computador sem inicializar', 'Desktop Gamer',
 'Windows 11', 'Pix');

INSERT INTO abre_ordem (id_cliente, numero_os) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

INSERT INTO financeiro (
  id_financeiro, id_os, valor, dt_vencimento, status_pagamento
) VALUES
(1, 1, 630.00, '2026-10-25 23:59:59', 'Pendente'),
(2, 2, 370.00, '2026-10-30 23:59:59', 'Pendente'),
(3, 3, 115.00, '2026-10-31 23:59:59', 'Pago'),
(4, 4, 510.00, '2026-11-15 23:59:59', 'Pendente');

INSERT INTO orcamento (
  id_orcamento, numero_os, diagnostico, peca_necessaria, data_orcamento
) VALUES
(1, 1, 'SSD com falha e memoria com desempenho reduzido', 'SSD 480 GB e Memoria RAM 8 GB', '2026-10-20 11:00:00'),
(2, 2, 'Memoria insuficiente para a necessidade do cliente', 'SSD 480 GB', '2026-10-22 12:00:00'),
(3, 3, 'Equipamento em boas condicoes apos revisao', 'Kit de limpeza', '2026-10-28 15:00:00'),
(4, 4, 'Falha de inicializacao requer substituicao de memoria', 'Memoria RAM 8 GB', '2026-11-01 10:00:00');

INSERT INTO itens_orcamento (
  numero_os, id_produto, quantidade, valor_produtos, taxa_prestacao_servico
) VALUES
(1, 1, 1, 250.00, 100.00),
(1, 2, 1, 180.00, 100.00),
(2, 1, 1, 250.00, 120.00),
(3, 3, 1, 35.00, 80.00),
(4, 2, 2, 360.00, 150.00);

INSERT INTO historico_orcamento (
  id_historico, numero_os, situacao, taxa_reprovado, data_decisao,
  valor_orcamento, nf_prest_servico
) VALUES
(1, 1, 'Aprovado', NULL, '2026-10-21 09:00:00', 630.00, 'NFS-2026-001'),
(2, 2, 'Aprovado', NULL, '2026-10-23 10:00:00', 370.00, 'NFS-2026-002'),
(3, 3, 'Aprovado', NULL, '2026-10-28 16:00:00', 115.00, 'NFS-2026-003'),
(4, 4, 'Pendente', NULL, '2026-11-01 11:00:00', 510.00, NULL);

INSERT INTO tempo_manutencao (id_manutencao, numero_os, tempo_manutencao) VALUES
(1, 1, 180),
(2, 2, 90),
(3, 3, 60),
(4, 4, 30);

COMMIT;
