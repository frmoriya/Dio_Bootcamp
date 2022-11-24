# Modulo: Banco de Dados SQL e NoSQL
# Desafio de projeto: Construindo um Projeto Logico de Banco de Dados do Zero

# Descricao do Desafio:
Desenvolver um projeto de Banco de Dados para Oficina Mecanica.
Criar script SQL para a criacao do esquema de Banco de Dados, realizar a persistencia dos dados.
Criar script SQL para carga dos dados.

Criar queries SQL com as clausulas abaixo:
- Recuperacoes simples com SELECT Statement,
- Filtros com WHERE Statement,
- Crie expressoes para gerar atributos derivados,
- Defina ordenacoes dos dados com ORDER BY,
- Condicoes de filtros aos grupos – HAVING Statement,
- Crie juncoes entre tabelas para fornecer uma perspectiva mais complexa dos dados;

# Modelo de Oficina Mecanica
- Ordem de Servico:
A  ordem de servico (OS) devera conter o Numero da OS, a data de Emissao,
A equipe tecnica(Mecanicos) informa o tipo de servico( revisao periodica ou manutencao corretiva) e a data de conclusao do servico,
A equipe tecnica informa o tipo de servico( Mao de Obra) e os insumos(pecas) quando forem trocadas.
A OS apresenta o Status do servico.
A OS podera der composta por mais de um servico e pecas
Os servicos e pecas, informados na OS, são consultados nas tabelas de servicos e pecas e totalizara o valor da OS 

- Cliente:
O cliente Leva o veiculo para a oficina mecanica.
Apos a avaliacao tecnica, o cliente aprova (ou nao) a execucao do servico.

- Veiculo:
A equipe tecnica informa o tipo de servico (Revisao periodica ou Manutencao corretiva)

- Equipe tecnica:
A execucao do servico sera feito pela mesma equipe tecnica que realizou a avaliacao tecnica

- Funcionario (Mecanico)
O cadastro de funcionario conterá o Codigo Funcionario,  o Nome, o Endereco e a Especidade.
O funcionario fara parte da equipe tecnica que atendera as OS conforme a especialidade requisitado na OS

- Tabela de Servico
A tabela de servicos contemplara os tipos de servicos (Mao de Obra) executado e o valor da MO, fornecendo informacoes e valores para a OS

- Tabela de Insumos
A tabela de insumos (pecas e acessorios) comtemplara os tipos de pecas, codigo de identificacao da peca e modelo de veiculo, e o valor de venda, fornecendo informacoes e valores para a OS

# Atividade
- Criacao do Modelo de Entidade Relacional
- Criacao do Modelo Logico
- Criacao de queries para carga de dados
- Criacao de queries para consulta dos dados

# Ferramenta
- MySQL Workbench 8.0
- MySQL Server