-- Criar vista do Diretor e os seus contactos
CREATE VIEW `Ultimo_a_Saber`.`DiretorView` AS
SELECT d.*, c.Email, c.Telefone
 FROM `Ultimo_a_Saber`.`Diretor` AS d
 INNER JOIN `Ultimo_a_Saber`.`ContactoDiretor` AS c
 ON d.idDiretor = c.Diretor_idDiretor;
 
 SELECT * FROM `Ultimo_a_Saber`.`DiretorView`;

-- Criar vista dos Detetives e os seus contactos
CREATE VIEW `Ultimo_a_Saber`.`DetetivesView` AS
SELECT d.*, c.Email, c.Telefone 
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`ContactoDetetive` AS c
ON d.idDetetives = c.Detetives_idDetetives;

 SELECT * FROM `Ultimo_a_Saber`.`DetetivesView`;

-- Criar vista dos Clientes e os seus contactos
CREATE VIEW `Ultimo_a_Saber`.`ClientesView` AS
SELECT cli.*, c.Email, c.Telefone 
FROM `Ultimo_a_Saber`.`Clientes` AS cli
INNER JOIN `Ultimo_a_Saber`.`ContactoCliente` AS c
ON cli.idClientes = c.Clientes_idClientes;

 SELECT * FROM `Ultimo_a_Saber`.`ClientesView`;
--  SELECT * FROM `Ultimo_a_Saber`.Clientes

-- Criar vista de todas as Investigações
CREATE VIEW `Ultimo_a_Saber`.`InvestigacoesView` AS
SELECT * 
FROM `Ultimo_a_Saber`.`Investigacoes`;

 SELECT * FROM `Ultimo_a_Saber`.`InvestigacoesView`;

-- Ver detetives na Investigação 1
CREATE VIEW `Ultimo_a_Saber`.`DetetivesInvestigacao1` AS
SELECT i.Descricao, i.DataInicio, r.DataAlocacao,
CASE 
	WHEN r.dataRemocao IS NOT NULL THEN r.dataRemocao
	ELSE 'Ainda Ativo'
END AS DataRemocao,
CASE i.concluida 
	WHEN 1 THEN 'Sim' 
	ELSE 'Não' 
END AS Concluida,
d.IdDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`Realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE r.Investigacoes_idInvestigacoes = 1;

-- Ver detetives na Investigação 2
CREATE VIEW `Ultimo_a_Saber`.`DetetivesInvestigacao2` AS
SELECT i.Descricao, i.DataInicio, r.DataAlocacao,
CASE 
	WHEN r.dataRemocao IS NOT NULL THEN r.dataRemocao
	ELSE 'Ainda Ativo'
END AS DataRemocao,
CASE i.concluida 
	WHEN 1 THEN 'Sim' 
	ELSE 'Não' 
END AS Concluida,
d.IdDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`Realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE r.Investigacoes_idInvestigacoes = 2;

-- Ver detetives na Investigação 3
CREATE VIEW `Ultimo_a_Saber`.`DetetivesInvestigacao3` AS
SELECT i.Descricao, i.DataInicio, r.DataAlocacao,
CASE 
	WHEN r.dataRemocao IS NOT NULL THEN r.dataRemocao
	ELSE 'Ainda Ativo'
END AS DataRemocao,
CASE i.concluida 
	WHEN 1 THEN 'Sim' 
	ELSE 'Não' 
END AS Concluida,
d.IdDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`Realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE r.Investigacoes_idInvestigacoes = 3;

-- Ver detetives na Investigação 4
CREATE VIEW `Ultimo_a_Saber`.`DetetivesInvestigacao4` AS
SELECT i.Descricao, i.DataInicio, r.DataAlocacao,
CASE 
	WHEN r.dataRemocao IS NOT NULL THEN r.dataRemocao
	ELSE 'Ainda Ativo'
END AS DataRemocao,
CASE i.concluida 
	WHEN 1 THEN 'Sim' 
	ELSE 'Não' 
END AS Concluida,
d.IdDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`Realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE r.Investigacoes_idInvestigacoes = 4;

-- Ver detetives na Investigação 5
CREATE VIEW `Ultimo_a_Saber`.`DetetivesInvestigacao5` AS
SELECT i.Descricao, i.DataInicio, r.DataAlocacao,
CASE 
	WHEN r.dataRemocao IS NOT NULL THEN r.dataRemocao
	ELSE 'Ainda Ativo'
END AS DataRemocao,
CASE i.concluida 
	WHEN 1 THEN 'Sim' 
	ELSE 'Não' 
END AS Concluida,
d.IdDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`Detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`Realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE r.Investigacoes_idInvestigacoes = 5;

 SELECT * FROM `Ultimo_a_Saber`.`DetetivesInvestigacao1`;
 
--  DROP VIEW IF EXISTS `Ultimo_a_Saber`.`nomeView`;


