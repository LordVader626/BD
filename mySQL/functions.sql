-- função que calcula há quanto tempo a investigação está ativa ou quanto tempo durou
-- DROP FUNCTION contaInvestigacoesAtivas;
DELIMITER $$
CREATE FUNCTION `Ultimo_a_Saber`.calcularDuracaoInvestigacao(idInvestigacao INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duracao INT;
    DECLARE inicio DATE;
    DECLARE fim DATE;

    SELECT dataInicio INTO inicio FROM `Ultimo_a_Saber`.`investigacoes` WHERE idInvestigacoes = idInvestigacao;
    SELECT dataConclusao INTO fim FROM `Ultimo_a_Saber`.`investigacoes` WHERE idInvestigacoes = idInvestigacao;
    
     IF inicio IS NULL THEN
        return -1; -- If dataInicio is NULL, return NULL
    END IF;
    
    IF fim IS NOT NULL THEN
        SET duracao = DATEDIFF(fim, inicio);
    ELSE
        SET fim = CURDATE();
        SET duracao = DATEDIFF(fim, inicio);
    END IF;
    
    RETURN duracao;
END $$
DELIMITER ;

SELECT calcularDuracaoInvestigacao(1);

-- Conta em quantas investigações ativas um detetive está a participar

DELIMITER $$
CREATE FUNCTION `Ultimo_a_Saber`.contaInvestigacoesAtivasDetetive(detective_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE nInvestigacoes INT;
    SELECT COUNT(*)
    INTO nInvestigacoes
    FROM `Ultimo_a_Saber`.`Realiza` AS r
    INNER JOIN `Ultimo_a_Saber`.`investigacoes` AS i 
    ON i.idInvestigacoes = r.Investigacoes_idInvestigacoes
    WHERE r.Detetives_idDetetives = detective_id 
    AND (r.dataRemocao IS NULL AND i.concluida = 0);
    
    RETURN nInvestigacoes;
END $$
DELIMITER ;

SELECT contaInvestigacoesAtivasDetetive(3);


DELIMITER $$
CREATE FUNCTION `Ultimo_a_Saber`.contaInvestigacoesAtivas() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE nInvestigacoes INT;
    SELECT COUNT(*)
    INTO nInvestigacoes 
    FROM `Ultimo_a_Saber`.`Investigacoes`
    WHERE `Investigacoes`.DataConclusao IS NULL;
    
    RETURN nInvestigacoes;
END $$
DELIMITER ;

-- SELECT * FROM `Ultimo_a_Saber`.`Investigacoes`
SELECT contaInvestigacoesAtivas();