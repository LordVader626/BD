-- Listar as investigações onde o cliente mora em Braga
SELECT i.idInvestigacoes, i.despesas, i.orcamento, i.descricao, i.datainicio, i.dataconclusao, c.morada
FROM `Ultimo_a_Saber`.`investigacoes` AS i
INNER JOIN  `Ultimo_a_Saber`.`clientes` AS c
WHERE c.morada LIKE "%, Braga";

-- Criar uma lista dos detetives que começaram a trabalhar na investigação 1 desde o primeiro dia
-- Ordenados do mais novo para o mais velho

SELECT d.* 
FROM `Ultimo_a_Saber`.`detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`realiza` AS r
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE i.idInvestigacoes = 1 AND r.dataAlocacao = i.DataInicio
ORDER BY d.dataNascimento DESC;

-- Detetives que trabalham numa investigacao do cliente de id 3

SELECT c.idClientes, c.Nome, d.idDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos,  i.idInvestigacoes, i.Descricao
FROM `Ultimo_a_Saber`.`Clientes` AS c
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i
ON c.idClientes = i.Clientes_idClientes
INNER JOIN `Ultimo_a_Saber`.`realiza` AS r
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
INNER JOIN `Ultimo_a_Saber`.`detetives` AS d
ON d.idDetetives = r.Detetives_idDetetives
WHERE c.idClientes=3;

-- Encontrar todos os casos em que trabalhou o detetive com id 3 no ano de 2024

SELECT d.idDetetives, d.Nome, d.NomeCodigo, i.idInvestigacoes, i.DataInicio, i.Descricao, i.Concluida
FROM `Ultimo_a_Saber`.`investigacoes` AS i
INNER JOIN `Ultimo_a_Saber`.`realiza` AS r
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
INNER JOIN `Ultimo_a_Saber`.`detetives` AS d
ON d.idDetetives= r.Detetives_idDetetives
WHERE idDetetives = 3 AND DataInicio >'2023-12-31' AND DataInicio <'2025-01-01';

-- Encontrar as Provas Físicas da Investigação com id = 2

SELECT i.idInvestigacoes, i.Descricao, p.idProvas,  p.Descricao, p.DataRecolha, f.LocalRecolha
FROM `Ultimo_a_Saber`.`investigacoes` AS i
INNER JOIN  `Ultimo_a_Saber`.`provas` AS p
ON i.idInvestigacoes = p.Investigacoes_idInvestigacoes
INNER JOIN `Ultimo_a_Saber`.`fisica` AS f
ON p.idProvas = f.Provas_idProvas
WHERE idInvestigacoes=2;

-- Detetives que participaram numa investigacao com Data de inicio depois 2023 e com 10+ casos bem sucedidos 
-- Escolhemos o maior id para garantir que se um detetive aparece mais de uma vez ele só vai ser contabilizado uma

SELECT d.idDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
FROM `Ultimo_a_Saber`.`detetives` AS d
INNER JOIN `Ultimo_a_Saber`.`realiza` AS r 
ON d.idDetetives = r.Detetives_idDetetives
INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i 
ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
WHERE i.DataInicio > '2022-12-31' AND d.CasosBemSucedidos >= 10
GROUP BY d.idDetetives, d.Nome, d.NomeCodigo, d.CasosBemSucedidos
ORDER BY d.CasosBemSucedidos DESC;