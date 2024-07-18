use Ultimo_a_Saber;
-- detetive Rafael Leao têm de usar a view rafa dos extras
create user 'rafaleao'@'localhost' identified by 'Password_1';

-- Detetive pode trabalhar na tabela provas e nas do tipo prova
GRANT select,insert,update,delete
ON Ultimo_a_Saber.Provas
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.Audio
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.Visual
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.Fisica
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.TestemunhaAudio
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

GRANT select,insert,update,delete
ON Ultimo_a_Saber.TestemunhaVisual
TO  'rafaleao'@'localhost';
FLUSH PRIVILEGES;

-- O detetive pode ver as informaçoes sobre os casos
GRANT SELECT
ON Ultimo_a_Saber.DescricoesInvRafa
TO 'rafaleao'@'localhost';
FLUSH PRIVILEGES;