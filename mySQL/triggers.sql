--  DROP TRIGGER IF EXISTS `Ultimo_a_Saber`.`atualizarDetetivesTrigger`;

-- Trigger que quando uma investigação é concluída muda a data de remoção dos detetives ainda ativos para a data de conclusão da investigação

DELIMITER $$
CREATE TRIGGER atualizarDetetivesTrigger AFTER UPDATE ON `Ultimo_a_Saber`.`Investigacoes`
FOR EACH ROW
BEGIN
    IF NEW.Concluida = 1 THEN
		UPDATE `Ultimo_a_Saber`.`realiza`
		SET `dataRemocao` = IF(`dataRemocao` IS NULL, CURDATE(), `dataRemocao`)
		WHERE `Investigacoes_idInvestigacoes` = NEW.idInvestigacoes;
	END IF;
END $$
DELIMITER ;