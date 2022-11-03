
Este repositorio contempla o EER de um E-Commerce.

Descrição do Desafio
O esquema deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.

Objetivo:
Refine o modelo apresentado acrescentando os seguintes pontos:

Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
Entrega – Possui status e código de rastreio;


Escopo do projeto: Vendas de produtos atraves do E-commerce

Entidades do projeto:

Narrativa - Cliente
- O cliente pode se cadastrar no site com seu CPF ou CNPJ
- O Endereço do cliente irá determinar o valor do frete
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto

Narrativa – Pedido
- O pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega
- Um produto ou mais compoem o pedido
- O pedido pode ser cancelado

Narrativa - Produto
- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros)
- Cada produto possui um fornecedor
- Um ou mais produtos podem compor um pedido

Narrativa - Fornecedor
- Fornecedor disponibiliza um unico tipo de produto

Narrativa - Estoque
- O estoque é consultado para validar o pedido.
- Quando o estoque do produto se encerra, é acionado o fornecedor para a reposicao do produto 

Refinamento
Narrativa - Carteira de Cliente
- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações
- Registra os dados do cliente informando se o mesmo é PF ou PJ

Narrativa - Meios de Pagamento
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento
- Ao informar o meio de pagamento, é direcionado para a forma de pagamento selecionado para que seje coletado as respectivas informacoes do meio de pagamento selecionado, classificado como:
 - Pagamento com Cartao
 - Boleto
 - Transferencia Bancaria
 - Pix

Narrativa - Entrega
- Entrega – Possui status e código de rastreio
- Registra e controla o ciclo de vida de um pedido até a conclusão da entrega.
- Aciona a empresa de logistica

Narrativa - Controle de Prazo
- Controla as datas do ciclo de vida do pedido
- Identifica o prazo de devolucao

Ferramenta:
MySQL Workbench