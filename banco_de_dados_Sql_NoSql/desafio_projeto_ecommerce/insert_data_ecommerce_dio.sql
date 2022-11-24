-- inserção de dados e queries
use ecommerce_dio;

show tables;
select * from cliente;
select * from produto;
--  delete from orders where idOrderClient in  (1,2,3,4);

-- INSERT CLIENTES --
insert into cliente (nome, nome_Meio, sobrenome, endereco, email, data_nascimento, CPF, celular) 
	   values('Maria','M','Silva', 'rua silva de prata 29, Carangola - Cidade das flores','msilva@gmail.com',2000120 ,912346789,1199299999),
		     ('Matheus','O','Pimentel','rua alemeda 289, Centro - Cidade das flores','pimentel@yahoo.com',19691001,987654321,21944445566),
			 ('Ricardo','F','Silva', 'avenida alemeda vinha 1009, Centro - Cidade das flores','ricardo_silva@gmail.com',19700630,45678913,12944417896),
			 ('Julia','S','França', 'rua lareijras 861, Centro - Cidade das flores','julia_franca@outlook.com',19800810,789123456,11941745555),
			 ('Roberta','G','Assis', 'avenidade koller 19, Centro - Cidade das flores','roberta_g@gmail.com',19901215,98745631,11948881212),
			 ('Isabela','M','Cruz', 'rua alemeda das flores 28, Centro - Cidade das flores','isabela_001@gmail.com',20101010,654789123,11978789966);

-- INSERT PRODUTO --
insert into produto (nome, classificacao_kids, categoria, avaliação, tamanho, valor) values
							  ('Fone de ouvido',false,'Eletrônico','4',null, 50),
                              ('Barbie Elsa',true,'Brinquedos','3',null, 150),
                              ('Body Carters',true,'Vestimenta','5',null, 200),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null, 250),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80', 1500),
                              ('Farinha de arroz',False,'Alimentos','2',null, 5),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null, 300);

-- INSERT PEDIDO --
insert into pedido( idcliente, codigo_pedido, descricao_pedido, status_pedido, valor, quantidade ) values
				   (37, 1,'Fone de ouvido','Em processamento', 50,1 ),
                   (39,5,'Sofá retrátil','Cancelado',1500,1),
                   (42,6,'Farinha de arroz','Confirmado',5,2 );
                         
-- INSERT ESTOQUE ---
insert into estoque(localidade, quantidade) values 
				   ('Rio de Janeiro',1000),
				   ('Rio de Janeiro',500),
				   ('São Paulo',10),
				   ('São Paulo',100),
				   ('São Paulo',10),
				   ('Brasília',60);

-- INSERT FORNECEDOR ---
insert into fornecedor(razao_social, CNPJ, contato) values
					  ('Eletro Import',22333444000111,'Paulo Silva'),
					  ('Moveis Delux',99888777000122,'Lucia Pena'),
					  ('Tudo Tem emporio', 66777888000133,'Ze do Couve');
                      
-- INSERT VENDEDOR ---
insert into vendedor (razao_social, nome_fantasia, CNPJ, CPF, localidade, contato ) values 
					  ('Almeida e filhos','Tem tudo', 123456789123456, 21985474,'São Paulo','Almeida'),
					  ('Eletrônicos Silva','Tec Toy', 854519649143457, 21985484,'Manaus','Ricardo'),
					  ('Eletrônicos Valma','Multi', 934567893934695, 21975474, 'Curitiba', 'Paulo');

-- INSERT LOGISTICA ---                           
insert into empresa_logistica (razao_social, nome_fantasia, CNPJ, endereco, responsavel, telefone, email) values
						 ('Correio Brasil','Correios',123456789000100,'Rua Pinheiros, 1000, Sao Paulo, SP', 'Gomes', 114459999, 'contato_correios@correios.com.br'),
                         ('DHL Services', 'DHL',11333444000199,'Av. Brasil, 1500, Rio de Janeiro', 'Max',219444499, 'dhl@dhl.com'),
                         ('Federal Express', 'FedEx',225557777000199,'Av. Independencia, 1001, Curitiba','Pal',519777333,'fedex@fedex.com');

-- INSERT ENTREGA -----
insert into entrega ( idpedido, idcliente, codigo_rastreio, status_rastreio, valor, data_entrega) values 
				    (1,37,1,'Entregue',50,20220630),
					(3,42,6,'Em transito',10,20220501),
					(2,39,5,'Não Localizado',1500,20220915);

-- INSERT CONTROLE PRAZO
insert into controle_prazos (data_postagem, data_entrega, prazo_devolucao) values 
						 (20220130,20220215,20220315),
                         (20220410,20220430,20220530),
                         (20220830,20221015,20221115);
          
-- INSERT CARTEIRA CLIENTE ---
-- select * from cliente;
-- select * from carteira_cliente;
-- SET FOREIGN_KEY_CHECKS=0;

insert into carteira_cliente( tipo_cliente, atividade_economica, CNPJ, CPF, nome ) values
							( 'Pessoa Fisica','Comercio',Null,912346789,'Maria' ),
                            ( 'Pessoa Juridica', 'Importacao', 11222333000199, null,'John Sena');

-- INSERT MEIOS PAGAMENTO ---
insert into meios_pagamentos ( tipo_pagamento) values
							 ('Boleto'),
                             ('Cartão'),
                             ('Transferencia'),
                             ('Pix');

-- INSERT PAGAMENTO CARTAO ---
insert into pagamento_cartao (bandeira, nome_titular, numero_cartao, data_validade, numero_parcela , valor, moeda, forma_pagamento ) values
							 ('Visa', 'Maria m Silva', 9999888877776666, 20270601, 3, 100, 'Brz', 'Credito' ),
							 ('Mastercard', 'Isabela M Cruz', 6666777788889999, 20230101, 1, 100, 'Brz','Debito');

-- INSERT BOLETO ---
insert into boleto ( instituicao_bancaria, data_vencimento, valor, codigo_barra ) values
				   ('Itau Unibanco', 20220510, 100,033996992558700022930793359020171913400007300 ),
				   ('Caixa Economica', 20220801, 200, 0339969925587000229307933590101719134000073802);

-- INSERT TRANSFERENCIA BANCARIA ---
select * from cliente;
select * from transferencia_bancaria;
insert into transferencia_bancaria (numero_conta, titular_conta, modalidade_operacao, valor ) values
								   ( 001, 'Maria m Silva', 'Ted', 110),
								   ( 005, 'Ricardo F Silva', 'Doc', 220);

-- INSERT PIX ---
select * from pix;
insert into pix ( numero_pix, valor) values
				(11999057878, 1500),
                (11155503850, 20),
				('jk@gmail.com', 100);  

-- INSERT RELACAO PRODUTO PEDIDO
insert produto_pedido ( idproduto, idpedido, quantidade,ppstatus) values
					  ( 1,1,10,'Disponivel'),
					  ( 5,2, 0, 'Sem estoque');

