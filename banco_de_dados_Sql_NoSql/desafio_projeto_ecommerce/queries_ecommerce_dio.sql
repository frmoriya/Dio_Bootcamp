--- Queries

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce_dio';

use ecommerce_dio;
--  ATRIBUTOS --
desc cliente;
desc produto;
desc pedido;
desc estoque;
desc fornecedor;
desc vendedor;
desc empresa_logistica;
desc entrega;
desc controle_prazos;
desc carteira_cliente;
desc meios_pagamentos;
desc pagamento_cartao;
desc boleto;
desc transferencia_bancaria;
desc pix;

-- SELECT DE TABELAS --
select * from cliente;
select * from produto;
select * from pedido;
select * from estoque;
select * from fornecedor;
select * from vendedor;
select * from empresa_logistica;
select * from entrega;
select * from controle_prazos;
select * from carteira_cliente;
select * from meios_pagamentos;
select * from pagamento_cartao;
select * from boleto;
select * from transferencia_bancaria;
select * from pix;

-- 
select * from produto_vendedor;
select * from produto_pedido;
select * from produto_estoque;
select * from produto_fornecedor;
select * from entrega_logistica;
select * from pedido_controleprazo;
select * from entrega_controleprazo; 

-- xxxx --
select count(*) from cliente;
select * from cliente c, pedido p where c.idcliente = p.idcliente;

-- Relacao pedido / produto
select * from produto_pedido;
select * from cliente;
select * from pedido;

select * from cliente c
				inner join pedido p ON c.idcliente = p.idcliente
                inner join produto_pedido pp on pp.idpedido = p.idpedido
           group by idcliente;     


-- Quantidade de pedidos por cliente
select c.idcliente, nome, count(*) as Number_of_orders from cliente c 
				inner join pedido p ON c.idcliente = p.idpedido
		group by idcliente; 