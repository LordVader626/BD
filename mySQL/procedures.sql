--  DROP PROCEDURE IF EXISTS `Ultimo_a_Saber`.`concluirInvestigacao`;
-- Procedure para adicionar um detetive a uma investigação

DELIMITER $$
CREATE PROCEDURE adicionarDetetiveAInvestigacao(
    IN idDetective INT,
    IN idInvestigacao INT
)
BEGIN
    INSERT INTO `Ultimo_a_Saber`.`realiza` (`dataAlocacao`, `Investigacoes_idInvestigacoes`, `Detetives_idDetetives`)
    VALUES (CURDATE(), idInvestigacao, idDetective);
END $$
DELIMITER ;

CALL adicionarDetetiveAInvestigacao(3, 1);

-- Procedure para remover um detetive de uma investigação (atribui-lhe uma data de remoção

DELIMITER $$
CREATE PROCEDURE removerDetetiveInvestigacao(
    IN idDetective INT,
    IN idInvestigacao INT
)
BEGIN
    UPDATE `Ultimo_a_Saber`.`realiza`
    -- SET `dataRemocao` = '2024-03-25' -- exemplo de remoção antes do prazo final
    SET `dataRemocao` = CURDATE()
    WHERE `Detetives_idDetetives` = idDetective
    AND `Investigacoes_idInvestigacoes` = idInvestigacao;
END $$
DELIMITER ;

CALL removerDetetiveInvestigacao(3, 1);

-- Procedure para adicionar provas recolhidas a uma determinada investigação

DELIMITER $$
CREATE PROCEDURE adicionarProvaInvestigacao(
    IN descricao VARCHAR(500),
    IN investigacao_id INT,
    IN local_de_recolha VARCHAR(100), -- pode ser null
    IN tipo INT -- tipo = 1 é visual tipo = 0 é fisica
)
BEGIN
	DECLARE data_recolha DATE;
    DECLARE prova_id INT;
    
    SET data_recolha = CURDATE();	

    INSERT INTO `Ultimo_a_Saber`.`Provas` (DataRecolha, Descricao, Investigacoes_idInvestigacoes)
    VALUES (data_recolha, descricao, investigacao_id);

    SET prova_id = LAST_INSERT_ID();

    IF local_de_recolha IS NULL THEN
		INSERT INTO `Ultimo_a_Saber`.`Audio` (Provas_idProvas)
		VALUES (prova_id);
    ELSEIF tipo = 1 THEN
		INSERT INTO `Ultimo_a_Saber`.`Visual` (Provas_idProvas, LocalRecolha)
		VALUES (prova_id, local_de_recolha);
    ELSE 
		INSERT INTO `Ultimo_a_Saber`.`Fisica` (Provas_idProvas, LocalRecolha)
		VALUES (prova_id, local_de_recolha);
    END IF;
END $$
DELIMITER ;

-- CALL 

-- Procedure para concluir uma investigação

DELIMITER $$
CREATE PROCEDURE concluirInvestigacao(
    IN id_Investigacao INT
)
BEGIN
    UPDATE `Ultimo_a_Saber`.`investigacoes` 
    SET concluida = 1, dataConclusao = CURDATE()
    WHERE idInvestigacoes = id_Investigacao;
END $$
DELIMITER ;

CALL concluirInvestigacao(1);