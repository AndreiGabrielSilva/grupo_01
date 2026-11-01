/*
  ARQUIVO DE CONFIGURAÇÃO DO DICIONÁRIO
  -------------------------------------

  Cada objeto dentro da constante representa uma coluna vinculada à tabela.
  A estrutura é usada pelo script.js para preencher automaticamente as tabelas.
*/
const campoPessoa = [
  {
    nome: "id_pessoa",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária da pessoa."
  },
  {
    nome: "nome_pessoa",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Nome completo da pessoa."
  },
  {
    nome: "cpf",
    tipo: "Varchar",
    tamanho: "14",
    nulo: "Não",
    chave: "-",
    descricao: "CPF da pessoa."
  },
  {
    nome: "telefone",
    tipo: "Varchar",
    tamanho: "15",
    nulo: "Sim",
    chave: "-",
    descricao: "Telefone para contato."
  },
  {
    nome: "email",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Sim",
    chave: "-",
    descricao: "E-mail para contato."
  }
];

const campoOS = [
  {
    nome: "id_os",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária da ordem de serviço."
  },
  {
    nome: "id_pessoa",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Pessoa responsável pela ordem de serviço."
  },
  {
    nome: "id_empresa",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Empresa vinculada à ordem de serviço."
  },
  {
    nome: "dt_emissao",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data e hora em que a ordem de serviço foi emitida."
  },
  {
    nome: "valor_total",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor total da ordem de serviço."
  },
  {
    nome: "status_os",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Status da ordem de serviço."
  }
];

const campoEmpresa = [
  {
    nome: "id_empresa",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária da empresa."
  },
  {
    nome: "razao_social",
    tipo: "Varchar",
    tamanho: "150",
    nulo: "Não",
    chave: "-",
    descricao: "Razão social oficial da empresa, conforme documentação cadastral."
  },
  {
    nome: "nome_fantasia",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Nome comercial da empresa utilizado no atendimento e no relacionamento com clientes."
  },
  {
    nome: "cnpj",
    tipo: "Varchar",
    tamanho: "18",
    nulo: "Não",
    chave: "-",
    descricao: "CNPJ da empresa, único e obrigatório."
  },
  {
    nome: "endereco",
    tipo: "Varchar",
    tamanho: "200",
    nulo: "Não",
    chave: "-",
    descricao: "Endereço comercial da empresa."
  },
  {
    nome: "situacao_cadastral",
    tipo: "Varchar",
    tamanho: "30",
    nulo: "Não",
    chave: "-",
    descricao: "Situação cadastral da empresa, como ativa, inativa ou em análise."
  },
  {
    nome: "regime_tributario",
    tipo: "Varchar",
    tamanho: "30",
    nulo: "Não",
    chave: "-",
    descricao: "Regime tributário da empresa, conforme regra fiscal vigente."
  },
  {
    nome: "telefone",
    tipo: "Varchar",
    tamanho: "15",
    nulo: "Sim",
    chave: "-",
    descricao: "Telefone do contato da empresa."
  },
  {
    nome: "email",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Sim",
    chave: "-",
    descricao: "E-mail da empresa."
  }
];

const campoCliente = [
  {
    nome: "id_cliente",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do cliente e da relação entre cliente e empresa."
  },
  {
    nome: "cpf",
    tipo: "Varchar",
    tamanho: "14",
    nulo: "Sim",
    chave: "FK",
    descricao: "CPF da pessoa física vinculada ao cliente, quando existir."
  },
  {
    nome: "cnpj",
    tipo: "Varchar",
    tamanho: "18",
    nulo: "Sim",
    chave: "FK",
    descricao: "CNPJ da empresa vinculada ao cliente, quando se tratar de pessoa jurídica."
  },
  {
    nome: "tipo_cliente",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Classificação do cliente como pessoa física ou jurídica."
  }
];

const campoTelefonePessoa = [
  {
    nome: "cpf",
    tipo: "Varchar",
    tamanho: "14",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "CPF da pessoa que possui o telefone cadastrado."
  },
  {
    nome: "numero_telefone",
    tipo: "Varchar",
    tamanho: "15",
    nulo: "Não",
    chave: "PK",
    descricao: "Número de telefone da pessoa, usado como parte da chave composta."
  }
];

const campoEmailPessoa = [
  {
    nome: "cpf",
    tipo: "Varchar",
    tamanho: "14",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "CPF da pessoa vinculada ao e-mail cadastrado."
  },
  {
    nome: "email",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "PK",
    descricao: "Endereço eletrônico da pessoa; um e-mail representa um registro único para a chave composta."
  }
];

const campoTelefoneEmpresa = [
  {
    nome: "cnpj",
    tipo: "Varchar",
    tamanho: "18",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "CNPJ da empresa que possui o telefone cadastrado."
  },
  {
    nome: "numero_telefone",
    tipo: "Varchar",
    tamanho: "15",
    nulo: "Não",
    chave: "PK",
    descricao: "Número de telefone corporativo, parte da chave composta."
  }
];

const campoEmailEmpresa = [
  {
    nome: "cnpj",
    tipo: "Varchar",
    tamanho: "18",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "CNPJ da empresa vinculado ao e-mail cadastrado."
  },
  {
    nome: "email",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "PK",
    descricao: "E-mail da empresa; usado para identificação do contato oficial."
  }
];

const campoEstoque = [
  {
    nome: "id_estoque",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária do estoque."
  },
  {
    nome: "id_produto",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Produto relacionado ao estoque."
  },
  {
    nome: "quantidade",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Quantidade disponível em estoque."
  },
  {
    nome: "quantidade_minima",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Quantidade mínima permitida no estoque."
  },
  {
    nome: "localizacao",
    tipo: "Varchar",
    tamanho: "50",
    nulo: "Sim",
    chave: "-",
    descricao: "Setor ou local de armazenamento."
  }
];

const campoFornecedor = [
  {
    nome: "id_fornecedor",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária do fornecedor."
  },
  {
    nome: "nome_fornecedor",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Nome do fornecedor."
  },
  {
    nome: "cnpj",
    tipo: "Varchar",
    tamanho: "18",
    nulo: "Não",
    chave: "-",
    descricao: "CNPJ do fornecedor."
  },
  {
    nome: "telefone",
    tipo: "Varchar",
    tamanho: "15",
    nulo: "Sim",
    chave: "-",
    descricao: "Contato do fornecedor."
  },
  {
    nome: "email",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Sim",
    chave: "-",
    descricao: "E-mail do fornecedor."
  }
];

const campoFinanceiro = [
  {
    nome: "id_financeiro",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária do financeiro."
  },
  {
    nome: "id_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Ordem de serviço vinculada ao lançamento financeiro."
  },
  {
    nome: "valor",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor do movimento financeiro."
  },
  {
    nome: "dt_vencimento",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data de vencimento do pagamento."
  },
  {
    nome: "status_pagamento",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Status do pagamento."
  }
];

const campoProduto = [
  {
    nome: "id_produto",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Chave primária do produto."
  },
  {
    nome: "nome_produto",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Nome do produto."
  },
  {
    nome: "descricao",
    tipo: "Varchar",
    tamanho: "255",
    nulo: "Sim",
    chave: "-",
    descricao: "Descrição detalhada do produto."
  },
  {
    nome: "preco",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Preço unitário do produto."
  },
  {
    nome: "categoria",
    tipo: "Varchar",
    tamanho: "50",
    nulo: "Não",
    chave: "-",
    descricao: "Categoria ou tipo do produto."
  }
];

const campoFuncionario = [
  {
    nome: "id_funcionario",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do funcionário da empresa."
  },
  {
    nome: "numero_cracha",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Número do crachá do funcionário para identificação interna."
  },
  {
    nome: "carteira_trabalho",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Número da carteira de trabalho, chave de identidade empregatícia."
  },
  {
    nome: "nome_funcionario",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Nome completo do funcionário."
  },
  {
    nome: "cpf",
    tipo: "Varchar",
    tamanho: "14",
    nulo: "Não",
    chave: "-",
    descricao: "CPF do funcionário."
  },
  {
    nome: "status",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Status do vínculo empregatício, como ativo ou inativo."
  }
];

const campoHistoricoCargo = [
  {
    nome: "id_historico_cargo",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do histórico de cargo do funcionário."
  },
  {
    nome: "carteira_trabalho",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "FK",
    descricao: "Funcionário ao qual o histórico de cargo está relacionado."
  },
  {
    nome: "nome_cargo",
    tipo: "Varchar",
    tamanho: "50",
    nulo: "Não",
    chave: "-",
    descricao: "Cargo ocupado em um determinado período."
  },
  {
    nome: "data_inicio",
    tipo: "Date",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data de início do vínculo com o cargo."
  },
  {
    nome: "data_fim",
    tipo: "Date",
    tamanho: "-",
    nulo: "Sim",
    chave: "-",
    descricao: "Data de fim do cargo, quando houver movimentação."
  },
  {
    nome: "ativo",
    tipo: "Boolean",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Indica se o cargo está em vigência no momento atual."
  }
];

const campoFolhaPagamento = [
  {
    nome: "id_folha",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador da folha de pagamento do mês."
  },
  {
    nome: "carteira_trabalho",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "FK",
    descricao: "Funcionário ao qual a folha de pagamento pertence."
  },
  {
    nome: "mes_salario",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Mês referente ao cálculo salarial."
  },
  {
    nome: "salario_base",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor base do salário antes dos descontos."
  },
  {
    nome: "desconto_inss",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor do desconto do INSS sobre o salário base."
  },
  {
    nome: "salario_liquido",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Salário líquido do funcionário após descontos."
  }
];

const campoEscala = [
  {
    nome: "id_escala",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador da escala trabalhada."
  },
  {
    nome: "carteira_trabalho",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "FK",
    descricao: "Funcionário associado à escala."
  },
  {
    nome: "hora_entrada",
    tipo: "Time",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Hora de entrada do funcionário."
  },
  {
    nome: "hora_saida",
    tipo: "Time",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Hora de saída do funcionário."
  },
  {
    nome: "horas_extras",
    tipo: "Decimal",
    tamanho: "4,2",
    nulo: "Sim",
    chave: "-",
    descricao: "Valor de horas extras acumuladas."
  },
  {
    nome: "horas_devedoras",
    tipo: "Decimal",
    tamanho: "4,2",
    nulo: "Sim",
    chave: "-",
    descricao: "Horas a compensar quando houver afastamento ou atraso."
  },
  {
    nome: "dias_trabalhados",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Número de dias trabalhados no período."
  },
  {
    nome: "mes",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Mês de referência da escala."
  }
];

const campoFerias = [
  {
    nome: "id_ferias",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do período de férias."
  },
  {
    nome: "carteira_trabalho",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "FK",
    descricao: "Funcionário ao qual o período de férias está vinculado."
  },
  {
    nome: "periodo_aquisitivo",
    tipo: "Varchar",
    tamanho: "30",
    nulo: "Não",
    chave: "-",
    descricao: "Período de aquisição do direito às férias."
  },
  {
    nome: "periodo_concessivo",
    tipo: "Varchar",
    tamanho: "30",
    nulo: "Não",
    chave: "-",
    descricao: "Período em que o empregador pode conceder as férias."
  },
  {
    nome: "data_inicio",
    tipo: "Date",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data de início das férias."
  },
  {
    nome: "data_fim",
    tipo: "Date",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data de fim das férias."
  },
  {
    nome: "status",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Status do período de férias, como agendado, em curso ou concluído."
  }
];

const campoAbreOrdem = [
  {
    nome: "id_cliente",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "Cliente que abre a ordem de serviço."
  },
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "PK/FK",
    descricao: "Número da ordem de serviço associada ao cliente."
  }
];

const campoOrdemServico = [
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Número da ordem de serviço como identificador principal."
  },
  {
    nome: "id_funcionario",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Funcionário responsável pela execução ou acompanhamento da manutenção."
  },
  {
    nome: "data_abertura",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data e hora de abertura da ordem de serviço."
  },
  {
    nome: "prazo_entrega",
    tipo: "Date",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Prazo estimado para a entrega do equipamento."
  },
  {
    nome: "data_finalizacao",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Sim",
    chave: "-",
    descricao: "Data em que a ordem de serviço foi concluída."
  },
  {
    nome: "defeito_relatado",
    tipo: "Varchar",
    tamanho: "255",
    nulo: "Não",
    chave: "-",
    descricao: "Descrição do defeito informado pelo cliente."
  },
  {
    nome: "modelo_equipamento",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Não",
    chave: "-",
    descricao: "Modelo do equipamento em manutenção."
  },
  {
    nome: "software_equipamento",
    tipo: "Varchar",
    tamanho: "100",
    nulo: "Sim",
    chave: "-",
    descricao: "Software ou sistema operacional do equipamento."
  },
  {
    nome: "forma_pagamento",
    tipo: "Varchar",
    tamanho: "30",
    nulo: "Não",
    chave: "-",
    descricao: "Forma de pagamento selecionada para a manutenção ou orçamento."
  }
];

const campoOrcamento = [
  {
    nome: "id_orcamento",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do orçamento associado à ordem de serviço."
  },
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Ordem de serviço à qual o orçamento pertence."
  },
  {
    nome: "diagnostico",
    tipo: "Varchar",
    tamanho: "255",
    nulo: "Não",
    chave: "-",
    descricao: "Diagnóstico técnico do equipamento."
  },
  {
    nome: "peca_necessaria",
    tipo: "Varchar",
    tamanho: "255",
    nulo: "Sim",
    chave: "-",
    descricao: "Peça necessária para a manutenção do equipamento."
  },
  {
    nome: "data_orcamento",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data em que o orçamento foi gerado."
  }
];

const campoItensOrcamento = [
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Ordem de serviço que contém o item do orçamento."
  },
  {
    nome: "id_produto",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Produto associado ao item do orçamento."
  },
  {
    nome: "quantidade",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Quantidade do produto requerida pela manutenção."
  },
  {
    nome: "valor_produtos",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor total dos produtos incluídos no orçamento."
  },
  {
    nome: "taxa_prestacao_servico",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Taxa do serviço prestado para a manutenção."
  }
];

const campoHistoricoOrcamento = [
  {
    nome: "id_historico",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do histórico do orçamento."
  },
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Ordem de serviço vinculada ao histórico de orçamento."
  },
  {
    nome: "situacao",
    tipo: "Varchar",
    tamanho: "20",
    nulo: "Não",
    chave: "-",
    descricao: "Situação do orçamento, como aprovado, reprovado ou pendente."
  },
  {
    nome: "taxa_reprovado",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Sim",
    chave: "-",
    descricao: "Taxa aplicada quando o orçamento é reprovado, conforme regra de negócio da empresa."
  },
  {
    nome: "data_decisao",
    tipo: "Datetime",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Data em que o cliente decidiu aprovar ou rejeitar o orçamento."
  },
  {
    nome: "valor_orcamento",
    tipo: "Decimal",
    tamanho: "10,2",
    nulo: "Não",
    chave: "-",
    descricao: "Valor total do orçamento decidido."
  },
  {
    nome: "nf_prest_servico",
    tipo: "Varchar",
    tamanho: "50",
    nulo: "Sim",
    chave: "-",
    descricao: "Número da nota fiscal de prestação de serviço, quando houver."
  }
];

const campoTempoManutencao = [
  {
    nome: "id_manutencao",
    tipo: "Inteiro",
    tamanho: "AutoIncremento",
    nulo: "Não",
    chave: "PK",
    descricao: "Identificador do tempo de manutenção registrado."
  },
  {
    nome: "numero_os",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "FK",
    descricao: "Ordem de serviço para a qual o tempo de manutenção foi registrado."
  },
  {
    nome: "tempo_manutencao",
    tipo: "Inteiro",
    tamanho: "-",
    nulo: "Não",
    chave: "-",
    descricao: "Tempo gasto na manutenção do equipamento, em horas ou minutos conforme padrão da empresa."
  }
];
