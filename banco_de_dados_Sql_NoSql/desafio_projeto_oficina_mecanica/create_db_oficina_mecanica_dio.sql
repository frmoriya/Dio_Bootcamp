-- CRIACAO DO BANCO DE DADOS: ORDEM DE SERVICO DE OFICINA MECANICA --- 
show databases;
show tables;
drop database os_oficina_mecanica_dio;
create database os_oficina_mecanica_dio;
use os_oficina_mecanica_dio;

-- CRIAR TABELA: ORDEM SERVICO ---

create table ordem_servico(
		idordem_servico int auto_increment primary key,
        numero_os varchar(8),
        data_emissao date,
        data_conclusao date,
        tipo_servico enum('Avaliacao', 'Manutencao Preventiva', 'Manutencao Corretiva') not null,
        cod_mo varchar(10),
        descricao_mo varchar(255),
        cod_peca varchar(10),
        descricao_peca varchar(255),
        status_os enum('Em Avaliacao', 'Em Execucao', 'Aguardando Aprovacao', 'Aprovado', 'Nao Autorizado', 'Entregue') not null,
        modelo_carro varchar(45),
        placa varchar(8),
        ano_modelo varchar(9),
        valor_mo float,
        valor_peca float,
        valor_total float,

        constraint unique_numero_os unique (numero_os)
);
alter table ordem_servico auto_increment=1;

-- CRIAR TABELA: EQUIPE TECNICA --
create table equipe_tecnica (
		idequipe_tecnica int auto_increment primary key,
        ep_cod_funcionario varchar(10),
        ep_tipo_servico varchar(45),
        ep_modelo_carro varchar(45),
        ep_ano_modelo varchar(9),
        ep_placa varchar(8),

		constraint fk_equipe_tecnica_ordem_servico foreign key ( idequipe_tecnica ) references ordem_servico ( idordem_servico )
);
alter table equipe_tecnica auto_increment=1;

-- drop table funcionario;
-- CRIAR TABELA: FUNCIONARIOS --
create table funcionario(
		idfuncionario int auto_increment primary key,
        cod_funcionario varchar(10),
        nome varchar(45),
        endereco varchar(100),
        especialidade varchar(45)
                      
        
);
alter table funcionario auto_increment=1;

-- CRIAR TABELA: TABELA PECAS --
create table tabela_pecas(
		idtabela_pecas int auto_increment primary key,
        modelo_carro varchar(45),
        ano_modelo varchar(9),
        cod_peca varchar(8),
        descricao varchar(100),
        valor float
);
alter table tabela_pecas auto_increment=1;

-- CRIAR TABELA: MAO DE OBRA --
create table tabela_mo(
		idtabela_mo int auto_increment primary key,
        cod_mo varchar(8),
        descricao_mo varchar(100),
        valor float
);
alter table tabela_mo auto_increment=1;

-- TABELA RELACIONAMENTO M:N ---
-- CRIAR TABELA: tabela_pecas_has_ordem_servico --
create table tabela_pecas_has_ordem_servico(
		id_tpos_idordem_servico int,
        id_tpos_idtabela_pecas int,
            
		primary key ( id_tpos_idordem_servico, id_tpos_idtabela_pecas ),
		constraint fk_tabela_pecas_has_ordem_servivo_ordem_servico foreign key ( id_tpos_idordem_servico ) references ordem_servico( idordem_servico ),
		constraint fk_tabela_pecas_has_ordem_servivo_tabela_pecas foreign key ( id_tpos_idtabela_pecas ) references tabela_pecas( idtabela_pecas )
);

-- CRIAR TABELA: tabela_mo_has_ordem_servico --
create table tabela_mo_has_ordem_servico(
		id_tmoos_idordem_servico int,
		id_tmoos_idtabela_mo int,
        
        primary key ( id_tmoos_idordem_servico, id_tmoos_idtabela_mo ),
        constraint fk_tabela_mo_has_ordem_servico_ordem_servico foreign key ( id_tmoos_idordem_servico ) references ordem_servico ( idordem_servico ),
		constraint fk_tabela_mo_has_ordem_servico_tabela_mo foreign key ( id_tmoos_idtabela_mo ) references tabela_mo ( idtabela_mo )
);

desc tabela_pecas_has_ordem_servico;
desc tabela_mo_has_ordem_servico;

show tables;

show databases;
use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'os_oficina_mecanica_dio';