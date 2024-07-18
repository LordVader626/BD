use Ultimo_a_Saber;

-- Diretor Jose Bond
create user 'pauloB'@'localhost' identified by 'Password_2';

-- O diretor controla a tabela clientes
GRANT select,insert,update,delete
ON Ultimo_a_Saber.Clientes
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

-- O diretor controla a tabela Contacto_clientes
GRANT select,insert,update,delete
ON Ultimo_a_Saber.ContactoCliente
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

-- O diretor controla a tabela Detetives
GRANT select,insert,update,delete
ON Ultimo_a_Saber.Detetives
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

-- O diretor pode ver a tabela provas,assim como todas as tabelas relacionadas
GRANT Select
ON Ultimo_a_Saber.Provas
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

GRANT Select
ON Ultimo_a_Saber.Fisica
TO 'josebond'@'localhost';
FLUSH PRIVILEGES;

GRANT Select
ON Ultimo_a_Saber.Visual
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

GRANT Select
ON Ultimo_a_Saber.Audio
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

GRANT Select
ON Ultimo_a_Saber.TestemunhaAudio
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

GRANT Select
ON Ultimo_a_Saber.TestemunhaVisual
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.realiza
TO 'pauloB'@'localhost';
FLUSH PRIVILEGES;