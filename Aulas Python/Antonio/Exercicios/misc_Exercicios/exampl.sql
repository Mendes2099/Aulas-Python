// Empresa de Importação - DBML Diagram (Corrected Types)
Table fornecedor {
  codigo_fornecedor int [primary key]
  nome varchar
  telefone varchar
  fax varchar
  rua varchar
  numPorta varchar
  codPostal varchar
  localidade varchar
}

Table mercadoria {
  id int [primary key]
  nome varchar
  unidade_medida varchar
}

Table contratos {
  id int [primary key]
  data_assinatura date
  prazo_validade int
  moeda varchar
  valor_total decimal
  fornecedor_id int [not null]
}

Table mercadoria_contrato {
  contrato_id int [not null]
  mercadoria_id int [not null]
  preco_unitario decimal
  quantidade int
}

Table transporte {
  id int [primary key]
  tipo varchar
  data_partida date
  data_chegada date
  contrato_id int [not null]
}

// Relationships
Ref: contratos.fornecedor_id > fornecedor.codigo_fornecedor
Ref: mercadoria_contrato.contrato_id > contratos.id
Ref: mercadoria_contrato.mercadoria_id > mercadoria.id
Ref: transporte.contrato_id > contratos.id