# Modulo: Banco de Dados SQL e NoSQL
# Desafio de projeto: Construir um Projeto Logico de Banco de Dados do Zero

# Descricao do Desafio:
Desenvolver um projeto de Banco de Dados para E-Commerce.
Criar script SQL para a criacao do esquema de Banco de Dados, realizar a persistencia dos dados.
Criar script SQL para carga dos dados.

Criar queries SQL com as cláusulas abaixo:
- Recuperações simples com SELECT Statement,
- Filtros com WHERE Statement,
- Crie expressões para gerar atributos derivados,
- Defina ordenações dos dados com ORDER BY,
- Condições de filtros aos grupos – HAVING Statement,
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

# Modelo de E-Commerce
- Produto:
Os produtos são vendidos por uma unica plataforma online. Contudo, estes podem ter vendedores distintos (terceiros)
Cada produto possui um fornecedor
Um ou mais produtos podem compor o pedido

- Cliente:
O cliente pode se cadastrar no site com seu CPF ou CNPJ
O endereço do cliente irá determinar o valor do frete
Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto

- Pedido:
O pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega
Um produto ou mais compoem o pedido
O pedido pode ser cancelado

# Atividade
- Criacao do Modelo de Entidade Relacional
- Criacao do Modelo Logico
- Criacao de queries para carga de dados
- Criacao de queries para consulta dos dados

# Ferramenta
- MySQL Workbench 8.0
- MySQL Server