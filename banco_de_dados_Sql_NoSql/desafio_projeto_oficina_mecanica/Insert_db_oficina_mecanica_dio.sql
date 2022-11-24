-- INSERT DATA ---
use os_oficina_mecanica_dio;
show tables;

-- INSERT OS ---
insert into ordem_servico (numero_os, data_emissao, data_conclusao, tipo_servico, cod_mo, descricao_mo, cod_peca, descricao_peca, status_os, modelo_carro, placa, ano_modelo, valor_mo, valor_peca, valor_total ) 
				values('OS_0001', 20220115, null, 'Avaliacao', 'MO_001','Avaliacao Tecnica', Null, Null, 'Em Avaliacao', 'Prisma', 'BBA1A99', '2020-2021', 100, 0, 100 ),
					  ('OS_0002', 20220115, null, 'Manutencao Preventiva', 'MO_002','Alinhamento e Balanceamento', 'FB_001', 'Bucha Suspensao Dianteiro', 'Em Execucao', 'Onix', 'LQA4J88', '2020-2021', 150, 60, 210 ),
					  ('OS_0003', 20220501, null, 'Manutencao Preventiva', 'MO_003','Troca de Oleo', 'LB_010', 'Oleo Motor 5W40', 'Aguardando Aprovacao', 'Fastback', 'AQA4J78', '2022-2022', 200, 200, 400 ),
					  ('OS_0004', 20220830, 20220905, 'Manutencao Corretiva', 'MO_004','Troca Escapamento', 'EC_001', 'Catalisador', 'Aprovado', 'Polo', 'DDD4H77', '2020-2021', 600, 2500, 3100 ),
					  ('OS_0005', 20220905, 20220930, 'Manutencao Corretiva', 'MO_005','Retifica Motor', 'CM_090', 'Cabecote 4 Cilindro', 'Nao Autorizado', 'Gol', 'XXA9X88', '1998-1998', 2000, 3000, 5000 ),
					  ('OS_0006', 20221005, 20221030, 'Manutencao Corretiva', 'MO_010','Martelinho Ouro', 'Null', 'Null', 'Entregue', 'BMW M3', 'BMW9B99', '2022-2022', 3000, Null, 3000 );

-- INSERT EQUIPE TECNICA  ---
 insert into equipe_tecnica (ep_cod_funcionario, ep_tipo_servico, ep_modelo_carro, ep_ano_modelo, ep_placa)
					values('AV001','Avaliacao','Prisma', '2020-2021', 'BBA1A99' ),
						  ('MP001','Manutencao Preventiva','Onix', '2020-2021', 'LQA4J88' ),
						  ('MC001','Manutencao Corretiva', 'Gol', '1998-1998', 'XXA9X88' );

-- INSERT FUNCIONARIO  ---
insert into funcionario( cod_funcionario, nome, endereco, especialidade )
				values ('F_001','Marcos Silva', 'Av. Brasil, 1200, Lapa, SP', 'Sistema de Suspensao e Freio'),
					   ('F_002','Jose Carlos', 'Rua Anita Garibaldi, 120, Tatuape, SP', 'Avaliador Tecnico'),
                       ('F_003','Carlos Jose', 'Rua Teodoro Sampaio, 50, Pinheiros, SP', 'Motor e Transmissao'),
                       ('F_004','Camila Fix', 'Rua Pinheiros, 100, Pinheiros, SP', 'Estetica Automotiva');

-- INSERT TABELA DE PECAS  ---
insert into tabela_pecas ( modelo_carro, ano_modelo, cod_peca, descricao, valor )
				  values ( 'Onix', '2020-2021', 'FB_001', 'Bucha Suspensao Dianteiro', 60 ),
						 ( 'Gol', '1998-1998', 'CM_090', 'Cabecote 4 Cilindro', 3000 ),
                         ( 'Polo', '2020-2021', 'EC_001', 'Catalisador', 25000 ),
                         ( 'Fastback',  Null, 'LB_010', 'Oleo Motor 5W40', 200);

-- INSERT TABELA DE MAO DE OBRA (MO)  ---                      
insert into tabela_mo (cod_mo, descricao_mo, valor)                       
			   values ('MO_001','Avaliacao Tecnica', 100 ),
                      ('MO_002','Alinhamento e Balanceamento', 150 ),
					  ('MO_003','Troca de Oleo', 200 ),
					  ('MO_004','Troca Escapamento', 600 ),
					  ('MO_005','Retifica Motor', 2000 ),
					  ('MO_010','Martelinho Ouro', 3000 );

-- INSERT TABELA DE PECAS / TABELA ORDEM SERVICO --
insert into tabela_pecas_has_ordem_servico( id_tpos_idordem_servico, id_tpos_idtabela_pecas)
			values( 1,1),
				  (2,2),
				  (3,3);
			
-- INSERT TABELA DE MAO DE OBRA  ---
insert into tabela_mo_has_ordem_servico( id_tmoos_idordem_servico, id_tmoos_idtabela_mo )
		values (1,1),
			   (2,2),
			   (3,3);
               
select * from tabela_mo_has_ordem_servico;