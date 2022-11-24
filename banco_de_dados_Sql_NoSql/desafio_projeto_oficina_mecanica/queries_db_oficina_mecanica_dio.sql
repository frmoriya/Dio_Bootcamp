-- QUERIES --
use os_oficina_mecanica_dio;

-- 
select * from ordem_servico;
select * from equipe_tecnica;
select * from funcionario;
select * from tabela_pecas;
select * from tabela_mo;

select * from tabela_pecas_has_ordem_servico;
select * from tabela_mo_has_ordem_servico;
--
--  Tabelas: ordem_servico; equipe_tecnica; funcionario; tabela_pecas; tabela_mo;
--  Tabelas: tabela_pecas_has_ordem_servico; tabela_mo_has_ordem_servico;
select count(*) from ordem_servico;
select count(*) from tabela_mo;

-- 
select * from ordem_servico os, equipe_tecnica et where os.idordem_servico = et.idequipe_tecnica;
select count(*) from ordem_servico os, equipe_tecnica et where os.idordem_servico = et.idequipe_tecnica;
-- 
-- recuperação os / equipe tecnica
select * from ordem_servico os 
				inner join equipe_tecnica et ON os.idordem_servico = et.idequipe_tecnica
                inner join tabela_mo_has_ordem_servico tmos on tmos.id_tmoos_idordem_servico = et.idequipe_tecnica
		group by idordem_servico; 
        