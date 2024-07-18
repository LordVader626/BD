-- Povoar Detetives e contactos
INSERT INTO `Ultimo_a_Saber`.`Detetives` (`idDetetives`, `Nome`, `DataNascimento`, `CasosBemSucedidos`, `NomeCodigo`) 
VALUES
(1, 'José Bernardo', '1990-05-15', 10, 'Maça'),
(2, 'Sofio Santos', '1985-09-20', 15, 'Banana'),
(3, 'Ze Manel o taxista', '1982-03-10', 12, 'Taxi'),
(4, 'Peter Griffin', '1995-07-08', 8, 'Clamp'),
(5, 'Nuno Aveirense', '1988-11-25', 18, 'Beira-Mar'),
(6, 'Miguel de Bragança', '1983-08-12', 14, 'Pêssego'),
(7, 'Rafael Leão', '1992-04-25', 11, 'RL10'),
(8, 'Darwin Nuñez', '1987-11-03', 20, 'Flop'),
(9, 'Gregório Casa', '1990-10-15', 9, 'Pêra'),
(10, 'Lisa Ann', '1985-06-30', 17, 'Ananás');

INSERT INTO `Ultimo_a_Saber`.`contactodetetive` (`Email`, `Telefone`, `Detetives_idDetetives`)
VALUES
('JoseBernardoB@example.com', '1234567890', 1),
('raisingzifo@example.com', '0987654321', 2),
('taxistaze@example.com', '1112223333', 3),
('peterthemeateater@example.com', '4445556666', 4),
('Beiramaromaior@example.com', '7778889999', 5),
('dmigueldebragança@example.com', '1112223333', 6),
('rafaleaoslb@example.com', '4445556666', 7),
('darwin.nunez@example.com', '7778889999', 8),
('dr.casa@example.com', '1234567890', 9),
('LizzieQueen@example.com', '0987654321', 10);

-- Povoar Diretores e contactos
INSERT INTO `Ultimo_a_Saber`.`Diretor` (`idDiretor`, `Nome`, `DataNascimento`, `DataAdmissao`)
VALUES
(1, 'Paulo Borges', '1975-05-10', '2020-01-01');

INSERT INTO `Ultimo_a_Saber`.`contactodiretor` (`Email`, `Telefone`, `Diretor_idDiretor`)
VALUES
('paulo.borges@example.com', '9998887777', 1);

-- Povoar Clientes e contactos
INSERT INTO `Ultimo_a_Saber`.`Clientes` (`idClientes`, `Genero`, `DataNascimento`, `NIF`, `Nome`, `Morada`)
VALUES
(1, 'M', '1980-05-12', '123456789', 'Ana Silva', 'Rua da Amizade, Lisboa'),
(2, 'F', '1975-09-20', '987654321', 'José Santos', 'Avenida Central, Porto'),
(3, 'F', '1992-03-10', '456789123', 'Manuela Costa', 'Travessa das Flores, Braga'),
(4, 'M', '1988-07-08', '321654987', 'Miguel Ferreira', 'Rua das Oliveiras, Coimbra'),
(5, 'F', '1985-11-25', '789123456', 'Sofia Martins', 'Praceta dos Girassóis, Faro');

INSERT INTO `Ultimo_a_Saber`.`contactoCliente` (`Email`, `Telefone`, `Clientes_idClientes`)
VALUES
('ana.silva@example.com', '123456789', 1),
('jose.santos@example.com', '987654321', 2),
('manuela.costa@example.com', '456789123', 3),
('miguel.ferreira@example.com', '321654987', 4),
('sofia.martins@example.com', '789123456', 5);

-- Povoar Investigações
INSERT INTO `Ultimo_a_Saber`.`Investigacoes` (`idInvestigacoes`, `Despesas`, `Orcamento`, `Descricao`, `Clientes_idClientes`, `Diretor_idDiretor`, `DataInicio`, `DataConclusao`, `Concluida`)
VALUES
(1, 500.00, 1000.00, 'Investigação de Pessoa Desaparecida - Clínica Navarro', 1, 1, '2024-03-15', NULL, 0),
(2, 1000.00, 2000.00, 'Investigação de Fraude Financeira - Simão Navarro', 2, 1, '2024-04-20', NULL, 0),
(3, 800.00, 1500.00, 'Investigação de Homicídio - Ponte de Lima', 3, 1, '2024-05-10', NULL, 0),
(4, 600.00, 1200.00, 'Investigação de Pessoa Desaparecida - Colégio da Barra', 4, 1, '2024-06-05', NULL, 0),
(5, 1200.00, 2500.00, 'Investigação de Homicídio - Francisca', 5, 1, '2024-07-12', NULL, 0);

INSERT INTO `Ultimo_a_Saber`.`realiza` (`dataAlocacao`, `Investigacoes_idInvestigacoes`, `Detetives_idDetetives`)
VALUES
('2024-03-15', 1, 1),
('2024-03-15', 1, 2),
('2024-04-20', 2, 3),
('2024-04-20', 2, 4),
('2024-05-10', 3, 5),
('2024-05-10', 3, 6),
('2024-06-05', 4, 7),
('2024-06-05', 4, 8),
('2024-07-12', 5, 9),
('2024-07-12', 5, 10);

-- Adicionar provas à base de dados
SELECT * FROM `Ultimo_a_Saber`.`Provas`;

INSERT INTO `Ultimo_a_Saber`.`Provas` (`idProvas`, `DataRecolha`, `Descricao`, `Investigacoes_idInvestigacoes`) VALUES
(1, '2023-01-10', 'Fotografias do local do crime.', 1),
(2, '2023-02-20', 'Testemunho da vítima.', 2),
(3, '2023-03-15', 'Fotografias de objetos no local do crime.', 3),
(4, '2023-04-05', 'Fotografias de Pegadas.', 4),
(5, '2023-05-25', 'Objeto encontrado por civil.', 5),
(6, '2023-06-10', 'Registros bancários alterados.', 1),
(7, '2023-07-20', 'Equipamento de espionagem encontrado.', 2),
(8, '2023-08-10', 'Mensagens difamatórias em redes sociais.', 3),
(9, '2023-09-25', 'Provas de suborno.', 4),
(10, '2023-10-15', 'Apólices de seguros falsificadas.', 5),
(11, '2024-05-05', 'Pessoa suspeita avistada.', 5),
(12, '2024-05-01', 'Relato de veiculo suspeito.', 1),
(13, '2024-05-02', 'Gravação de vozes no local.', 2),
(14, '2024-05-03', 'Relato de civil.', 3),
(15, '2024-05-04', 'Relato da vítima.', 4),
(16, '2024-05-05', 'Gravação de testemunha.', 5);

INSERT INTO `Ultimo_a_Saber`.`Visual` (`LocalRecolha`, `Provas_idProvas`) VALUES
('Rua das Flores, Lisboa', 1),
('Parque Central, Porto', 11),
('Escritório Central, Faro', 3),
('Prefeitura, Coimbra', 4),
('Fábrica Industrial, Braga', 5);

INSERT INTO `Ultimo_a_Saber`.`Fisica` (`LocalRecolha`, `Provas_idProvas`) VALUES
('Casa da Testemunha, Lisboa', 6),
('Local do Crime, Porto', 7),
('Escritório do Suspeito, Faro', 8),
('Departamento Governamental, Coimbra', 9),
('Local do Acidente, Braga', 10);

INSERT INTO `Ultimo_a_Saber`.`Audio` (`Provas_idProvas`) VALUES
(2),
(12),
(13),
(14),
(15);

INSERT INTO `Ultimo_a_Saber`.`TestemunhaAudio` (`Nome`, `Telefone`, `Audio_Provas_idProvas`) VALUES
('Ana Silva', '123-456-7890', 2),
('Pedro Costa', '234-567-8901', 12),
('Marta Sousa', '345-678-9012', 13),
('João Santos', '456-789-0123', 14),
('Sofia Gomes', '567-890-1234', 15);

INSERT INTO `Ultimo_a_Saber`.`TestemunhaVisual` (`Nome`, `Telefone`, `Visual_Provas_idProvas`) VALUES
('Miguel Silva', '123-456-7890', 1),
('Sara Santos', '234-567-8901', 11),
('José Almeida', '345-678-9012', 3),
('Inês Pereira', '456-789-0123', 4),
('Rui Mendes', '567-890-1234', 5);