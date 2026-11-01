CREATE DATABASE IF NOT EXISTS assistencia_tecnica
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE assistencia_tecnica;

CREATE TABLE pessoa (
  id_pessoa INT NOT NULL AUTO_INCREMENT,
  nome_pessoa VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  telefone VARCHAR(15) NULL,
  email VARCHAR(100) NULL,
  PRIMARY KEY (id_pessoa),
  UNIQUE KEY uq_pessoa_cpf (cpf)
) ENGINE=InnoDB;

CREATE TABLE empresa (
  id_empresa INT NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(150) NOT NULL,
  nome_fantasia VARCHAR(100) NOT NULL,
  cnpj VARCHAR(18) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  situacao_cadastral VARCHAR(30) NOT NULL,
  regime_tributario VARCHAR(30) NOT NULL,
  telefone VARCHAR(15) NULL,
  email VARCHAR(100) NULL,
  PRIMARY KEY (id_empresa),
  UNIQUE KEY uq_empresa_cnpj (cnpj)
) ENGINE=InnoDB;

CREATE TABLE os (
  id_os INT NOT NULL AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  id_empresa INT NOT NULL,
  dt_emissao DATETIME NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  status_os VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_os),
  KEY idx_os_id_pessoa (id_pessoa),
  KEY idx_os_id_empresa (id_empresa),
  CONSTRAINT fk_os_pessoa
    FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa),
  CONSTRAINT fk_os_empresa
    FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  cpf VARCHAR(14) NULL,
  cnpj VARCHAR(18) NULL,
  tipo_cliente VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_cliente),
  UNIQUE KEY uq_cliente_cpf (cpf),
  UNIQUE KEY uq_cliente_cnpj (cnpj),
  CONSTRAINT chk_cliente_pessoa_ou_empresa
    CHECK (
      (cpf IS NOT NULL AND cnpj IS NULL)
      OR (cpf IS NULL AND cnpj IS NOT NULL)
    ),
  CONSTRAINT fk_cliente_pessoa
    FOREIGN KEY (cpf) REFERENCES pessoa (cpf),
  CONSTRAINT fk_cliente_empresa
    FOREIGN KEY (cnpj) REFERENCES empresa (cnpj)
) ENGINE=InnoDB;

CREATE TABLE telefone_pessoa (
  cpf VARCHAR(14) NOT NULL,
  numero_telefone VARCHAR(15) NOT NULL,
  PRIMARY KEY (cpf, numero_telefone),
  CONSTRAINT fk_telefone_pessoa_pessoa
    FOREIGN KEY (cpf) REFERENCES pessoa (cpf)
) ENGINE=InnoDB;

CREATE TABLE email_pessoa (
  cpf VARCHAR(14) NOT NULL,
  email VARCHAR(100) NOT NULL,
  PRIMARY KEY (cpf, email),
  CONSTRAINT fk_email_pessoa_pessoa
    FOREIGN KEY (cpf) REFERENCES pessoa (cpf)
) ENGINE=InnoDB;

CREATE TABLE telefone_empresa (
  cnpj VARCHAR(18) NOT NULL,
  numero_telefone VARCHAR(15) NOT NULL,
  PRIMARY KEY (cnpj, numero_telefone),
  CONSTRAINT fk_telefone_empresa_empresa
    FOREIGN KEY (cnpj) REFERENCES empresa (cnpj)
) ENGINE=InnoDB;

CREATE TABLE email_empresa (
  cnpj VARCHAR(18) NOT NULL,
  email VARCHAR(100) NOT NULL,
  PRIMARY KEY (cnpj, email),
  CONSTRAINT fk_email_empresa_empresa
    FOREIGN KEY (cnpj) REFERENCES empresa (cnpj)
) ENGINE=InnoDB;

CREATE TABLE fornecedor (
  id_fornecedor INT NOT NULL AUTO_INCREMENT,
  nome_fornecedor VARCHAR(100) NOT NULL,
  cnpj VARCHAR(18) NOT NULL,
  telefone VARCHAR(15) NULL,
  email VARCHAR(100) NULL,
  PRIMARY KEY (id_fornecedor),
  UNIQUE KEY uq_fornecedor_cnpj (cnpj)
) ENGINE=InnoDB;

CREATE TABLE produto (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome_produto VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NULL,
  preco DECIMAL(10,2) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_produto)
) ENGINE=InnoDB;

CREATE TABLE estoque (
  id_estoque INT NOT NULL AUTO_INCREMENT,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  quantidade_minima INT NOT NULL,
  localizacao VARCHAR(50) NULL,
  PRIMARY KEY (id_estoque),
  UNIQUE KEY uq_estoque_produto (id_produto),
  CONSTRAINT fk_estoque_produto
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
) ENGINE=InnoDB;

CREATE TABLE funcionario (
  id_funcionario INT NOT NULL AUTO_INCREMENT,
  numero_cracha VARCHAR(20) NOT NULL,
  carteira_trabalho VARCHAR(20) NOT NULL,
  nome_funcionario VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_funcionario),
  UNIQUE KEY uq_funcionario_carteira_trabalho (carteira_trabalho)
) ENGINE=InnoDB;

CREATE TABLE historico_cargo (
  id_historico_cargo INT NOT NULL AUTO_INCREMENT,
  carteira_trabalho VARCHAR(20) NOT NULL,
  nome_cargo VARCHAR(50) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NULL,
  ativo BOOLEAN NOT NULL,
  PRIMARY KEY (id_historico_cargo),
  KEY idx_historico_cargo_carteira (carteira_trabalho),
  CONSTRAINT fk_historico_cargo_funcionario
    FOREIGN KEY (carteira_trabalho)
    REFERENCES funcionario (carteira_trabalho)
) ENGINE=InnoDB;

CREATE TABLE folha_pagamento (
  id_folha INT NOT NULL AUTO_INCREMENT,
  carteira_trabalho VARCHAR(20) NOT NULL,
  mes_salario VARCHAR(20) NOT NULL,
  salario_base DECIMAL(10,2) NOT NULL,
  desconto_inss DECIMAL(10,2) NOT NULL,
  salario_liquido DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_folha),
  KEY idx_folha_pagamento_carteira (carteira_trabalho),
  CONSTRAINT fk_folha_pagamento_funcionario
    FOREIGN KEY (carteira_trabalho)
    REFERENCES funcionario (carteira_trabalho)
) ENGINE=InnoDB;

CREATE TABLE escala (
  id_escala INT NOT NULL AUTO_INCREMENT,
  carteira_trabalho VARCHAR(20) NOT NULL,
  hora_entrada TIME NOT NULL,
  hora_saida TIME NOT NULL,
  horas_extras DECIMAL(4,2) NULL,
  horas_devedoras DECIMAL(4,2) NULL,
  dias_trabalhados INT NOT NULL,
  mes VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_escala),
  KEY idx_escala_carteira (carteira_trabalho),
  CONSTRAINT fk_escala_funcionario
    FOREIGN KEY (carteira_trabalho)
    REFERENCES funcionario (carteira_trabalho)
) ENGINE=InnoDB;

CREATE TABLE ferias (
  id_ferias INT NOT NULL AUTO_INCREMENT,
  carteira_trabalho VARCHAR(20) NOT NULL,
  periodo_aquisitivo VARCHAR(30) NOT NULL,
  periodo_concessivo VARCHAR(30) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_ferias),
  KEY idx_ferias_carteira (carteira_trabalho),
  CONSTRAINT fk_ferias_funcionario
    FOREIGN KEY (carteira_trabalho)
    REFERENCES funcionario (carteira_trabalho)
) ENGINE=InnoDB;

CREATE TABLE ordem_servico (
  numero_os INT NOT NULL AUTO_INCREMENT,
  id_funcionario INT NOT NULL,
  data_abertura DATETIME NOT NULL,
  prazo_entrega DATE NOT NULL,
  data_finalizacao DATETIME NULL,
  defeito_relatado VARCHAR(255) NOT NULL,
  modelo_equipamento VARCHAR(100) NOT NULL,
  software_equipamento VARCHAR(100) NULL,
  forma_pagamento VARCHAR(30) NOT NULL,
  PRIMARY KEY (numero_os),
  KEY idx_ordem_servico_funcionario (id_funcionario),
  CONSTRAINT fk_ordem_servico_funcionario
    FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
) ENGINE=InnoDB;

CREATE TABLE abre_ordem (
  id_cliente INT NOT NULL,
  numero_os INT NOT NULL,
  PRIMARY KEY (id_cliente, numero_os),
  KEY idx_abre_ordem_numero_os (numero_os),
  CONSTRAINT fk_abre_ordem_cliente
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  CONSTRAINT fk_abre_ordem_ordem_servico
    FOREIGN KEY (numero_os) REFERENCES ordem_servico (numero_os)
) ENGINE=InnoDB;

CREATE TABLE financeiro (
  id_financeiro INT NOT NULL AUTO_INCREMENT,
  id_os INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  dt_vencimento DATETIME NOT NULL,
  status_pagamento VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_financeiro),
  KEY idx_financeiro_id_os (id_os),
  CONSTRAINT fk_financeiro_os
    FOREIGN KEY (id_os) REFERENCES os (id_os)
) ENGINE=InnoDB;

CREATE TABLE orcamento (
  id_orcamento INT NOT NULL AUTO_INCREMENT,
  numero_os INT NOT NULL,
  diagnostico VARCHAR(255) NOT NULL,
  peca_necessaria VARCHAR(255) NULL,
  data_orcamento DATETIME NOT NULL,
  PRIMARY KEY (id_orcamento),
  KEY idx_orcamento_numero_os (numero_os),
  CONSTRAINT fk_orcamento_ordem_servico
    FOREIGN KEY (numero_os) REFERENCES ordem_servico (numero_os)
) ENGINE=InnoDB;

CREATE TABLE itens_orcamento (
  numero_os INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  valor_produtos DECIMAL(10,2) NOT NULL,
  taxa_prestacao_servico DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (numero_os, id_produto),
  KEY idx_itens_orcamento_produto (id_produto),
  CONSTRAINT fk_itens_orcamento_ordem_servico
    FOREIGN KEY (numero_os) REFERENCES ordem_servico (numero_os),
  CONSTRAINT fk_itens_orcamento_produto
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
) ENGINE=InnoDB;

CREATE TABLE historico_orcamento (
  id_historico INT NOT NULL AUTO_INCREMENT,
  numero_os INT NOT NULL,
  situacao VARCHAR(20) NOT NULL,
  taxa_reprovado DECIMAL(10,2) NULL,
  data_decisao DATETIME NOT NULL,
  valor_orcamento DECIMAL(10,2) NOT NULL,
  nf_prest_servico VARCHAR(50) NULL,
  PRIMARY KEY (id_historico),
  KEY idx_historico_orcamento_numero_os (numero_os),
  CONSTRAINT fk_historico_orcamento_ordem_servico
    FOREIGN KEY (numero_os) REFERENCES ordem_servico (numero_os)
) ENGINE=InnoDB;

CREATE TABLE tempo_manutencao (
  id_manutencao INT NOT NULL AUTO_INCREMENT,
  numero_os INT NOT NULL,
  tempo_manutencao INT NOT NULL,
  PRIMARY KEY (id_manutencao),
  KEY idx_tempo_manutencao_numero_os (numero_os),
  CONSTRAINT fk_tempo_manutencao_ordem_servico
    FOREIGN KEY (numero_os) REFERENCES ordem_servico (numero_os)
) ENGINE=InnoDB;
