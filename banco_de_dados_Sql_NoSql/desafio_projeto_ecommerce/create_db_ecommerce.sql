-- CRIACAO DO BANCO DE DADOS DO E-COMMERCE --- 

create database ecommerce_dio;
use ecommerce_dio;

-- CRIAR TABELA DE CLIENTES ---
create table cliente(
		idcliente int auto_increment primary key,
        nome varchar(10),
        nome_Meio char(3),
        sobrenome varchar(20),
        endereco varchar(255),
        celular varchar(11),
        email varchar(45),
        data_nascimento date,
        CPF char(11) not null,
        constraint unique_CPF_Cliente unique (CPF)
);
alter table cliente auto_increment=1;

-- CRIAR TABELA DE PRODUTOS ---
-- size = dimensão do produto
create table produto(
		idproduto int auto_increment primary key,
        nome varchar(40) not null,
        classificacao_kids bool default false,
        categoria enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        avaliação float default 0,
        tamanho varchar(10),
        valor float
);
alter table produto auto_increment=1;

-- CRIAR TABELA DE PEDIDO ---
create table pedido(
	idpedido int auto_increment primary key,
    idcliente int,
    codigo_pedido int,
    descricao_pedido varchar(45),
    status_pedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',    
    valor float,
    quantidade Int,
    constraint fk_pedido_cliente foreign key (idcliente) references cliente(idcliente)
			on update cascade
);
alter table pedido auto_increment=1;

-- CRIAR TABELA DE ESTOQUE ---
create table estoque(
	idestoque int auto_increment primary key,
    localidade varchar(45),
    quantidade int default 0
);
alter table estoque auto_increment=1;

-- CRIAR TABELA FORNECEDORES ---
create table fornecedor(
	idfornecedor int auto_increment primary key,
    razao_social varchar(255) not null,
    CNPJ char(15) not null,
    contato char(11) not null,
    constraint unique_fornecedor unique (CNPJ)
);
alter table fornecedor auto_increment=1;

-- CRIAR TABELA DE VENDEDORES ---
create table vendedor(
	idvendedor int auto_increment primary key,
    razao_social varchar(255) not null,
    nome_fantasia varchar(255),
    CNPJ char(15),
    CPF char(9),
    localidade varchar(255),
    contato char(45) not null,
    constraint unique_cnpj_vendedor unique (CNPJ),
    constraint unique_cpf_vendedor unique (CPF)
);
alter table vendedor auto_increment=1;

-- CRIAR TABELA DE EMPRESA DE DELIVERY( LOGISTICA) ---
create table empresa_logistica(
idempresa_logistica int auto_increment primary key,
razao_social varchar(255) not null,
nome_fantasia varchar(255),
CNPJ char(15),
endereco varchar(45),
responsavel varchar(45),
telefone int,
email varchar(45)
);

-- CRIAR TABELA ENTREGA ---
create table entrega(
	identrega int auto_increment primary key,
    idpedido int,
    idcliente int,
    codigo_rastreio int,
    status_rastreio enum('Não localizado','Entregue','Em transito') default 'Em transito',    
    valor float,
    data_entrega date,
        
    constraint fk_entrega foreign key (identrega) references pedido(idpedido)
			on update cascade
);

-- CRIAR TABELA DE CONTROLE DE PRAZOS ---
create table controle_prazos(
idcontrole_prazos int auto_increment primary key,
data_postagem date,
data_entrega date,
prazo_devolucao date

);

-- CRIAR TABELA DE CARTEIRA DE CLIENTES  ---
-- select * from carteira_cliente;
create table carteira_cliente(
idcarteira_cliente int auto_increment primary key,
tipo_cliente varchar(15),
atividade_economica varchar(45),
CNPJ varchar(15),
CPF varchar(9),
nome varchar(45),

constraint fk_carteira_cliente foreign key (idcarteira_cliente) references cliente(idcliente)
);

-- CRIAR TABELA MEIOS PAGAMENTO ---
create table meios_pagamentos(
idmeios_pagamentos int auto_increment primary key,
idcliente int,
tipo_pagamento enum('Boleto','Cartão','Transferencia', 'pix'),

constraint fk_meios_pagamentos foreign key (idmeios_pagamentos) references cliente(idcliente)
);

-- CRIAR TABELA PAGAMENTO CARTAO ---
create table pagamento_cartao(
idpagamento_cartao int auto_increment primary key,
bandeira varchar(45),
nome_titular varchar(45),
numero_cartao varchar(45),
data_validade date,
numero_parcela int,
valor float,
moeda varchar(10),
forma_pagamento ENUM('Credito', 'Debito' ),
constraint fk_pagamento_cartao foreign key (idpagamento_cartao) references cliente(idcliente)
);

-- CRIAR TABELA PAGAMENTO BOLETO ---
-- select * from boleto;
-- ALTER TABLE boleto DROP COLUMN codigo_barra;
-- alter table boleto add codigo_barra varchar(47);

create table boleto(
idboleto int auto_increment primary key,
instituicao_bancaria varchar(45),
codigo_barra int,
data_vencimento date,
valor float,

constraint fk_boleto foreign key (idboleto) references cliente(idcliente)
);

-- CRIAR TABELA PAGAMENTO TRANSFERENCIA BANCARIA
create table transferencia_bancaria(
idtransferencia_bancaria int auto_increment primary key,
numero_conta int,
titular_conta varchar(45),
modalidade_operacao varchar(45),
valor float,

constraint fk_transferencia_bancaria foreign key (idtransferencia_bancaria) references cliente(idcliente)
);

-- CRIAR TABELA PAGAMENTO PIX 
create table pix(
idpix int auto_increment primary key,
numero_pix varchar(45),
valor float,

constraint fk_pix foreign key(idpix) references cliente(idcliente)
);

-- TABELA RELACIONAMENTO M:N ---
-- TABELA PRODUTO VENDENDOR ---
create table produto_vendedor(
	idvendedor int,
    idproduto int,
    quantidade int default 1,
    primary key (idvendedor, idproduto),
    constraint fk_produto_vendedor foreign key (idvendedor) references vendedor(idvendedor),
    constraint fk_produto_produto foreign key (idproduto) references produto(idproduto)
);

-- TABELA RELACAO PRODUTO / PEDIDO
create table produto_pedido(
	idproduto int,
    idpedido int,
	quantidade int default 1,
	ppstatus enum('Disponível', 'Sem estoque') default 'Disponível',
	primary key (idproduto, idpedido),
	constraint fk_produto_pedido_produto foreign key (idproduto) references produto(idproduto),
	constraint fk_produto_pedido_pedido foreign key (idpedido) references pedido(idpedido)
);

-- TABELA PRODUTO ESTOQUE
create table produto_estoque(
idproduto int,
idestoque int,
localidade varchar(255) not null,
primary key(idproduto, idestoque),
constraint fk_produto_estoque_estoque foreign key (idestoque) references estoque(idestoque),
constraint fk_produto_estoque_produto foreign key (idproduto) references produto(idproduto)
);

-- TABELA PRODUTO FORNECEDOR
create table produto_fornecedor(
idproduto int,
idfornecedor int,
quantidade int not null,
primary key (idproduto, idfornecedor),
constraint fk_produto_fornecedor_fornecedor foreign key (idfornecedor) references fornecedor(idfornecedor),
constraint fk_produto_fornecedor_produto foreign key (idproduto) references produto(idproduto)

);

-- TABELA ENTREGA EMPRESA LOGISTICA
create table entrega_logistica(
identrega int,
idempresa_logistica int,
primary key (identrega, idempresa_logistica),
constraint fk_entrega_logistica_entrega foreign key (identrega) references entrega(identrega),
constraint fk_entrega_logistica_logistica foreign key (idempresa_logistica) references empresa_logistica(idempresa_logistica)

);

-- TABELA PEDIDO CONTROLE PRAZO
create table pedido_controleprazo(
idpedido int,
idcontrole_prazos int,
primary key (idpedido, idcontrole_prazos),
constraint fk_pedido_controleprazo_prazo foreign key (idcontrole_prazos) references controle_prazos(idcontrole_prazos),
constraint fk_pedido_controleprazo_pedido foreign key (idpedido) references pedido(idpedido)

);

-- TABELA ENTREGA CONTROLE PRAZO
create table entrega_controleprazo(
identrega int,
idcontrole_prazos int,
primary key (identrega, idcontrole_prazos),
constraint fk_entrega_controleprazo_prazo foreign key (idcontrole_prazos) references controle_prazos(idcontrole_prazos),
constraint fk_entrega_controleprazo_entrega foreign key (identrega) references entrega(identrega)

);

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce_dio';