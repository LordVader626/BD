USE `Ultimo_a_Saber` ;

-- View para o Detetive Rafael Leao -- Necessária para correr o teste do users2
Create view DescricoesInvRafa as
select Investigacoes.idInvestigacoes,Descricao,DataInicio,Concluida,DataConclusao
from Investigacoes inner join (realiza inner join Detetives
on idDetetives=Detetives_idDetetives)
on idInvestigacoes=Investigacoes_idInvestigacoes
where idDetetives=7;




-- View de todas as investigacoes Nao concluidas
create view inv_NAOconcluidas as
select *
from Investigacoes
where Investigacoes.Concluida=0;

-- View de todas as investigacoes concluidas
create view inv_concluidas as
select *
from Investigacoes
where Investigacoes.Concluida=1;

-- Todas as investigacoes pedidas por um cliente
DELIMITER $$
Create procedure inv_clientes(in id int)
BEGIN
select * from Clientes inner join Investigacoes
 ON Clientes.idClientes= Investigacoes.Clientes_idClientes
 where Clientes.idClientes=id;
END$$
DELIMITER ;


DELIMITER $$
create procedure ProvasFisicas (in id int)
begin
select idInvestigacoes,idProvas,DataRecolha,Provas.Descricao,Fisica.LocalRecolha from(Investigacoes inner join(
Provas inner join Fisica
on idProvas= Provas_idProvas)
on idInvestigacoes=Investigacoes_idInvestigacoes)
where idInvestigacoes=id;
end $$
Delimiter ;

-- Buscar Provas Visuais
DELIMITER $$
create procedure ProvasVisuais (in id int)
begin
select idInvestigacoes,idProvas,DataRecolha,Provas.Descricao,Fisica.LocalRecolha from(Investigacoes inner join(
Provas inner join (Visuais inner join TestemunhaVisual
on Provas_idProvas=Visual_Provas_idProvas)
on idProvas= Provas_idProvas)
on idInvestigacoes=Investigacoes_idInvestigacoes)
where idInvestigacoes=id;
end$$
DELIMITER ;

-- Buscar Provas Audio
DELIMITER $$
create procedure ProvasAudio (in id int)
begin
select idInvestigacoes,idProvas,DataRecolha,Provas.Descricao,Nome,Telefone from(Investigacoes inner join(
Provas inner join (Audio inner join TestemunhaAudio
on Provas_idProvas=Audio_Provas_idProvas)
on idProvas= Provas_idProvas)
on idInvestigacoes=Investigacoes_idInvestigacoes)
where idInvestigacoes=id;
end$$
DELIMITER ;

-- View da informacao das Investigacoes
Create view InformacaoInvestigacaoView as
select Investigacoes.idInvestigacoes,Descricao,DataInicio,Concluida,DataConclusao
from Investigacoes;

-- View da parte monetaria
Create view Financas as
select idInvestigacoes,Orcamento,Despesas,(Orcamento-Despesas) as Saldo
from Investigacoes;

-- Encontrar todos as investigacoes que deram prejuizo
select * from Investigacoes
where Despesas>Orcamento;
