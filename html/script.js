/*
  MONTAGEM DA TABELA
  ------------------

  Este arquivo gera as linhas do dicionário de dados com base no arquivo config.js.
*/

function criarCelula(valor) {
  const celula = document.createElement("td");
  celula.textContent = valor;
  return celula;
}

function preencherTabela(idTabela, campos) {
  const corpoDaTabela = document.querySelector(`#${idTabela}`);

  if (!corpoDaTabela) {
    return;
  }

  campos.forEach((campo) => {
    const linha = document.createElement("tr");

    linha.appendChild(criarCelula(campo.nome));
    linha.appendChild(criarCelula(campo.tipo));
    linha.appendChild(criarCelula(campo.tamanho));
    linha.appendChild(criarCelula(campo.nulo));
    linha.appendChild(criarCelula(campo.chave));
    linha.appendChild(criarCelula(campo.descricao));

    corpoDaTabela.appendChild(linha);
  });
}

const dicionarioTabelas = [
  { id: "tabela-pessoa", campos: campoPessoa },
  { id: "tabela-os", campos: campoOS },
  { id: "tabela-empresa", campos: campoEmpresa },
  { id: "tabela-cliente", campos: campoCliente },
  { id: "tabela-telefone-pessoa", campos: campoTelefonePessoa },
  { id: "tabela-email-pessoa", campos: campoEmailPessoa },
  { id: "tabela-telefone-empresa", campos: campoTelefoneEmpresa },
  { id: "tabela-email-empresa", campos: campoEmailEmpresa },
  { id: "tabela-estoque", campos: campoEstoque },
  { id: "tabela-fornecedor", campos: campoFornecedor },
  { id: "tabela-financeiro", campos: campoFinanceiro },
  { id: "tabela-produto", campos: campoProduto },
  { id: "tabela-funcionario", campos: campoFuncionario },
  { id: "tabela-historico-cargo", campos: campoHistoricoCargo },
  { id: "tabela-folha-pagamento", campos: campoFolhaPagamento },
  { id: "tabela-escala", campos: campoEscala },
  { id: "tabela-ferias", campos: campoFerias },
  { id: "tabela-abre-ordem", campos: campoAbreOrdem },
  { id: "tabela-ordem-servico", campos: campoOrdemServico },
  { id: "tabela-orcamento", campos: campoOrcamento },
  { id: "tabela-itens-orcamento", campos: campoItensOrcamento },
  { id: "tabela-historico-orcamento", campos: campoHistoricoOrcamento },
  { id: "tabela-tempo-manutencao", campos: campoTempoManutencao }
];

dicionarioTabelas.forEach(({ id, campos }) => preencherTabela(id, campos));
