DROP DATABASE IF EXISTS ronald_livros;
CREATE DATABASE IF NOT EXISTS ronald_livros;
USE ronald_livros;

CREATE TABLE IF NOT EXISTS AUTOR (
id_autor SMALLINT AUTO_INCREMENT PRIMARY KEY,
nome_autor VARCHAR(100) NOT NULL,
nome_completo VARCHAR(100) NOT NULL 
);

DELIMITER $$
CREATE PROCEDURE adicionar_autor(nome VARCHAR(100), nomeCompleto VARCHAR(100))
BEGIN
INSERT INTO AUTOR (nome_autor, nome_completo)
VALUES
(nome, nomeCompleto);
END $$
DELIMITER;
-- Passar como parametros nome/nomeCompleto strings
-- CALL adicionar_autor('Philip Pullman', 'Philip Pullman');
-- SELECT * FROM ronald_livros.AUTOR;

INSERT INTO AUTOR (nome_autor, nome_completo)
VALUES
('J. R. R. Tolkien', 'John Ronald Reuel Tolkien'),
('Bernard Cornwell', 'Bernard Cornwell'),
('Christian Jacq', 'Christian Jacq'),
('Conn Iggulden', 'Conn Iggulden'),
('George R. R. Martin', 'George Raymond Richard Martin'),
('J. K. Rowling', 'Joanne Rowling'),
('Patrick Rothfuss', 'Patrick James Rothfuss'),
('Christopher Paolini', 'Christopher Paolini'),
('Oliver Bowden', 'Anton Gill'),
('Andrzej Sapkowski', 'Andrzej Sapkowski'),
('S. L. Farrell', 'Stephen Leigh'),
('Raymond E. Feist', 'Raymond Elias Feist'),
('Suzanne Collins', 'Suzanne Marie Collins'),
('Marion Zimmer Bradley', 'Marion Eleanor Zimmer Bradley'),
('Valerio Massimo Manfredi', 'Valerio Massimo Manfredi'),
('Margaret Weis', 'Margaret Edith Weis'),
('Terry Brooks', 'Terence Dean Brooks'),
('Frank Herbert', 'Frank Patrick Herbert'),
('Raphael Draccon', 'Rafael Albuquerque Pereira'),
('Colleen Houck', 'Colleen Houck'),
('T. H. White', 'Terence Hanbury White'),
('Orlando Paes Filho', 'Orlando Paes Filho'),
('Anthony Ryan', 'Anthony Ryan'),
('Scott Lynch', 'Scott Lynch'),
('David Malouf', 'David George Joseph Malouf '),
('David Gibbins', 'David Gibbins'),
('Eduardo Spohr', 'Eduardo Spohr'),
('George Lucas', 'George Walton Lucas Jr.'),
('Robert E. Vardeman', 'Robert Edward Vardeman'),
('Terry Pratchett', 'Terence David John Pratchett'),
('Nate Kenyon', 'Nate Kenyon'),
('Ernest Cline', 'Ernest Christy Cline'),
('Ken Follett', 'Kenneth Martin Follett'),
('David Colbert', 'David Colbert'),
('Clive Staples Lewis', 'C. S. Lewis'),
('Erik Durschmied', 'Erik Durschmied'),
('Terence David John Pratchett', 'Terry Pratchett');

CREATE TABLE IF NOT EXISTS CATEGORIA (
id_categoria SMALLINT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR(50) NOT NULL
);

DELIMITER $$
CREATE PROCEDURE adicionar_categoria(nome VARCHAR(50))
BEGIN
INSERT INTO CATEGORIA (nome_categoria)
VALUES
(nome);
END $$
DELIMITER;
-- Passar como parametros nome string
-- CALL adicionar_categoria('Terror');
-- SELECT * FROM ronald_livros.CATEGORIA;

INSERT INTO CATEGORIA (nome_categoria)
VALUES
('Literatura fantástica'),
('Ficção histórica'),
('Ficção científica');

CREATE TABLE IF NOT EXISTS EDITORA (
id_editora SMALLINT AUTO_INCREMENT PRIMARY KEY,
nome_editora VARCHAR(50) NOT NULL
);

DELIMITER $$
CREATE PROCEDURE adicionar_editora(nome VARCHAR(50))
BEGIN
INSERT INTO EDITORA (nome_editora)
VALUES
(nome);
END $$
DELIMITER;
-- Passar como parametros nome string
-- CALL adicionar_editora('Intrínseca');
-- SELECT * FROM ronald_livros.EDITORA;

INSERT INTO EDITORA (nome_editora)
VALUES
('Martins Fontes'),
('Leya'),
('Record'),
('Galera'),
('Bertrand Brasil'),
('Arqueiro'),
('Saída de Emergência'),
('Rocco'),
('Publicações Europa-América'),
('Conrad'),
('Planeta'),
('Verus'),
('Wizards'),
('Aleph'),
('DarkSide'),
('Imago'),
('Francis'),
('Sextante'),
('Ediouro');

CREATE TABLE IF NOT EXISTS COLECAO (
id_colecao SMALLINT AUTO_INCREMENT PRIMARY KEY,
nome_colecao VARCHAR(70) NOT NULL,
volumes SMALLINT NOT NULL
);

DELIMITER $$
CREATE PROCEDURE adicionar_colecao(nome VARCHAR(70), volumes SMALLINT)
BEGIN
INSERT INTO COLECAO (nome_colecao, volumes)
VALUES
(nome, volumes);
END $$
DELIMITER;
-- Passar como parametros nome string, volumes int
-- CALL adicionar_colecao('Fronteiras do Universo', 3);
-- SELECT * FROM ronald_livros.COLECAO;


INSERT INTO COLECAO (nome_colecao, volumes)
VALUES
('Sem Coleção', 1),
('O Senhor dos Anéis', 3),
('O Conquistador', 5),
('O Imperador', 5),
('As Crônicas de Artur', 3),
('A Busca do Graal', 4),
('As Aventuras de Sharpe', 21),
('As Crônicas Saxônicas', 11),
('Jogos Vorazes', 3),
('Harry Potter', 8),
('Assassin`s Creed', 11),
('O Trono do Sol - O Ciclo Nessântico', 3),
('Ramsés', 5),
('Pedra da Luz', 4),
('Ciclo da Herança', 5),
('The Witcher', 7),
('Duna', 6),
('As Brumas de Avalon', 4),
('A Saga do Império', 3),
('A Saga do Mago', 4),
('Saga do Assassino', 3),
('Crônicas de Dragonlance', 4),
('Dragões de Éter', 3),
('Crônicas de Gelo e Fogo', 5),
('A Crônica do Matador do Rei', 3),
('A Saga do Tigre', 6),
('Alexandros', 3),
('A Espada de Shannara', 3),
('God of War', 2),
('O Único e Eterno Rei', 5),
('Angus', 3),
('Filhos do Éden', 3),
('Os Nobres Vigaristas', 7),
('A Sombra do Corvo', 3),
('Diablo III', 4),
('Star Wars', 3),
('As Crônicas de Nárnia', 7),
('Discoworld', 41);

CREATE TABLE IF NOT EXISTS LIVROS (
id_livro SMALLINT AUTO_INCREMENT PRIMARY KEY,
id_colecao SMALLINT NOT NULL,
nome_livro VARCHAR(100) NOT NULL,
id_autor SMALLINT NOT NULL,
tenho BOOL NOT NULL,
lido BOOL NOT NULL,
nota SMALLINT NOT NULL,
id_categoria SMALLINT NOT NULL,
id_editora SMALLINT NOT NULL,
FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor),
FOREIGN KEY (id_editora) REFERENCES EDITORA(id_editora),
FOREIGN KEY (id_colecao) REFERENCES COLECAO(id_colecao),
FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

DELIMITER $$
CREATE PROCEDURE adicionar_livro(colecao SMALLINT, nome VARCHAR(100), autor SMALLINT, tenho BOOL, lido BOOL, nota SMALLINT, categoria SMALLINT, editora SMALLINT)
BEGIN
INSERT INTO LIVROS(id_colecao, nome_livro, id_autor, tenho, lido, nota, id_categoria, id_editora)
VALUES
(colecao, nome, autor, tenho, lido, nota, categoria, editora);
END $$
DELIMITER;
-- Passar como parametros colecao int, nome string, autor int, tenho bool, lido bool, nota int, categoria int, editora int
-- CALL adicionar_livro(1, 'O Condenado', 2, 0, 0, 0, 2, 3);
-- SELECT * FROM ronald_livros.LIVROS;

INSERT INTO LIVROS(id_colecao, nome_livro, id_autor, tenho, lido, nota, id_categoria, id_editora)
VALUES
(2, 'A Sociedade do Anel', 1, 1, 1, 10, 1, 1),
(2, 'As Duas Torres', 1, 1, 1, 10, 1, 1),
(2, 'O Retorno do Rei', 1, 1, 1, 10, 1, 1),
(6,'O Arqueiro', 2, 1, 1, 8, 2, 3),
(6,'O Andarilho', 2, 1, 1, 8, 2, 3),
(6,'O Herege', 2, 1, 1, 8, 2, 3),
(6,'1356', 2, 1, 0, 0, 2, 3),
(5,'O Rei do Inverno', 2, 1, 1, 9, 2, 3),
(5,'O Inimigo de Deus', 2, 1, 1, 9, 2, 3),
(5,'Excalibur', 2, 1, 1, 9, 2, 3),
(8,'O Último Reino', 2, 1, 1, 10, 2, 3),
(8,'O Cavaleiro da Morte', 2, 1, 1, 10, 2, 3),
(8,'Os Senhores do Norte', 2, 1, 1, 10, 2, 3),
(8,'A Canção da Espada', 2, 1, 1, 10, 2, 3),
(8,'Terra em Chamas', 2, 1, 1, 10, 2, 3),
(8,'Morte dos Reis', 2, 1, 1, 9, 2, 3),
(8,'O Guerreiro Pagão', 2, 1, 1, 9, 2, 3),
(8,'O Trono Vazio', 2, 1, 1, 9, 2, 3),
(8,'Guerreiros da Tempestade', 2, 1, 1, 8, 2, 3),
(8,'O Portador do Fogo', 2, 1, 0, 0, 2, 3),
(8,'A Guerra do Lobo', 2, 0, 0, 0, 2, 3),
(8,'A Espada dos Reis', 2, 0, 0, 0, 2, 3),
(8,'O Senhor da Guerra', 2, 0, 0, 0, 2, 3),
(7,'A Fortaleza de Sharpe', 2, 1, 0, 0, 2, 3),
(13,'O Filho da Luz', 3, 1, 1, 8, 2, 5),
(13,'O Templo de Milhões de Anos', 3, 1, 1, 8, 2, 5),
(13,'A Batalha de Kadesh', 3, 1, 1, 8, 2, 5),
(13,'A Dama de Abu-Simbel', 3, 1, 1, 8, 2, 5),
(13,'Sob a Acácia do Ocidente', 3, 1, 1, 8, 2, 5),
(14,'Nefer, o Silencioso', 3, 1, 1, 8, 2, 5),
(14,'A Mulher Sábia', 3, 1, 1, 8, 2, 5),
(14,'Paneb, o Ardoroso', 3, 1, 1, 8, 2, 5),
(14,'O Lugar da Verdade', 3, 1, 1, 8, 2, 5),
(3,'O Lobo das Planicies', 4, 1, 1, 9, 2, 3),
(3,'Os Senhores do Arco ', 4, 1, 1, 9, 2, 3),
(3,'Os Ossos das Colinas', 4, 1, 1, 9, 2, 3),
(3,'Império da Prata', 4, 1, 0, 0, 2, 3),
(3,'Conquistador', 4, 0, 0, 0, 2, 3),
(4,'Os Portões de Roma ', 4, 1, 1, 9, 2, 3),
(4,'A Morte dos Reis', 4, 1, 1, 9, 2, 3),
(4,'Campo de Espadas', 4, 1, 1, 9, 2, 3),
(4,'Os Deuses da Guerra', 4, 1, 1, 9, 2, 3),
(4,'Sangue dos Deuses', 4, 0, 0, 0, 2, 3),
(12,'A magia da alvorada', 11, 1, 1, 7, 1, 2),
(12,'A Magia do Anoitecer', 11, 1, 1, 7, 1, 2),
(12,'A Magia da Aurora', 11, 1, 1, 7, 1, 2),
(19,'Aprendiz', 12, 1, 1, 10, 1, 6),
(19,'Mestre', 12, 1, 1, 10, 1, 6),
(19,'Espinho de Prata', 12, 1, 1, 10, 1, 6),
(19,'As Trevas de Sethanon', 12, 1, 1, 10, 1, 6),
(20,'A Filha do Império', 12, 1, 1, 10, 1, 6),
(20,'A Serva do Império', 12, 1, 1, 10, 1, 6),
(20,'A senhora do império', 12, 1, 1, 10, 1, 6),
(11,'Renascença', 9, 1, 1, 8, 1, 3),
(11,'Irmandade', 9, 1, 1, 8, 1, 3),
(11,'A Cruzada Secreta', 9, 1, 1, 8, 1, 3),
(11,'Revelações', 9, 1, 1, 7, 1, 3),
(11,'Renegado', 9, 1, 1, 7, 1, 3),
(11,'Bandeira Negra', 9, 1, 1, 7, 1, 3),
(11,'União', 9, 0, 0, 0, 1, 3),
(11,'Submundo', 9, 1, 1, 7, 1, 3),
(11,'Juramento do Deserto', 9, 0, 0, 0, 1, 3),
(15,'Eragon', 8, 1, 1, 9, 1, 8),
(15,'Eldest', 8, 1, 1, 9, 1, 8),
(15,'Brisingr', 8, 1, 1, 9, 1, 8),
(15,'Herança', 8, 1, 1, 9, 1, 8),
(15,'O garfo, a bruxa e o dragão', 8, 0, 0, 0, 1, 8),
(9,'Jogos Vorazes', 13, 1, 1, 8, 1, 8),
(9,'Em Chamas', 13, 1, 1, 8, 1, 8),
(9,'A Esperança', 13, 1, 1, 8, 1, 8),
(9,'A Cantiga dos pássaros e das serpentes', 13, 0, 0, 0, 1, 8),
(26,'A Maldição do Tigre', 20, 1, 1, 7, 1, 6),
(26,'O Resgate do Tigre', 20, 1, 1, 7, 1, 6),
(26,'A Viagem do Tigre', 20, 1, 1, 7, 1, 6),
(26,'O Destino do Tigre', 20, 1, 1, 7, 1, 6),
(26,'A Promessa do Tigre', 20, 0, 0, 0, 1, 6),
(26,'O Sonho do Tigre', 20, 0, 0, 0, 1, 6),
(25,'O Nome do Vento', 7, 1, 1, 10, 1, 6),
(25,'O Temor do Sábio', 7, 1, 1, 10, 1, 6),
(25,'Doors of Stone', 7, 0, 0, 0, 1, 6),
(18,'A Senhora da Magia', 14, 1, 1, 8, 1, 16),
(18,'A Grande Rainha', 14, 1, 1, 8, 1, 16),
(18,'O Gamo-Rei', 14, 1, 1, 8, 1, 16),
(18,'O Prisioneiro da Árvore', 14, 1, 1, 8, 1, 16),
(10,'Pedra Filosofal', 6, 1, 1, 8, 1, 8),
(10,'Câmara Secreta', 6, 1, 1, 8, 1, 8),
(10,'Prisioneiro de Azkaban', 6, 0, 0, 0, 1, 8),
(10,'Cálice de Fogo', 6, 0, 0, 0, 1, 8),
(10,'Ordem da Fênix', 6, 0, 0, 0, 1, 8),
(10,'Enigma do Príncipe', 6, 0, 0, 0, 1, 8),
(10,'Relíquias da Morte', 6, 0, 0, 0, 1, 8),
(10,'Criança Amaldiçoada', 6, 0, 0, 0, 1, 8),
(27,'O Sonho de Olympias', 15, 1, 1, 8, 2, 8),
(27,'As areias de Ammon', 15, 1, 1, 8, 2, 8),
(27,'Os Confins do Mundo', 15, 1, 1, 8, 2, 8),
(16,'O Último Desejo', 10, 1, 1, 10, 1, 1),
(16,'A Espada do Destino', 10, 1, 1, 10, 1, 1),
(16,'O Sangue dos Elfos', 10, 1, 1, 10, 1, 1),
(16,'Tempo do Desprezo', 10, 1, 1, 10, 1, 1),
(16,'Batismo de Fogo', 10, 1, 1, 10, 1, 1),
(16,'A Torre da Andorinha', 10, 1, 1, 10, 1, 1),
(16,'A Senhora do Lago', 10, 1, 1, 10, 1, 1),
(16,'Tempo de Tempestade', 10, 1, 1, 10, 1, 1),
(22,'Dragões do Crepúsculo do Outono', 16, 0, 1, 9, 1, 13),
(22,'Dragões da Noite de Inverno', 16, 1, 1, 9, 1, 13),
(22,'Dragões do Alvorecer da Primavera', 16, 1, 1, 9, 1, 13),
(22,'Dragões de Uma Chama de Verão', 16, 1, 0, 0, 1, 13),
(24,'A Guerra dos Tronos', 5, 0, 1, 9, 1, 2),
(24,'A Fúria dos Reis', 5, 1, 1, 9, 1, 2),
(24,'A Senhora do Lago', 5, 1, 1, 9, 1, 2),
(24,'A Tormenta de Espadas', 5, 1, 1, 9, 1, 2),
(24,'O Festim dos Corvos', 5, 1, 1, 9, 1, 2),
(24,'A Dança dos Dragões', 5, 1, 1, 9, 1, 2),
(24,'Os Ventos do Inverno', 5, 0, 0, 0, 1, 2),
(28,'A Espada de Shannara', 17, 1, 0, 0, 1, 7),
(28,'As Pedras Élficas de Shannara', 17, 1, 0, 0, 1, 7),
(28,'A Canção de Shannara', 17, 0, 0, 0, 1, 7),
(23,'Caçadores de Bruxas', 19, 1, 1, 9, 1, 2),
(23,'Corações de Neve', 19, 1, 1, 9, 1, 2),
(23,'Círculos de Chuva', 19, 1, 1, 9, 1, 2),
(29,'God Of War (vol. 1)', 29, 1, 1, 6, 1, 2),
(29,'God Of War (vol. 2)', 29, 1, 1, 6, 1, 2),
(30,'A Espada na Pedra', 21, 1, 0, 0, 1, 17),
(30,'A Rainha do Ar e das Sombras', 21, 1, 0, 0, 1, 17),
(30,'O Cavaleiro Imperfeito', 21, 1, 0, 0, 1, 17),
(30,'A Chama ao Vento', 21, 0, 0, 0, 1, 17),
(30,'O Livro de Merlin', 21, 0, 0, 0, 1, 17),
(31,'O Primeiro Guerreiro', 22, 1, 1, 8, 1, 11),
(31,'O Guerreiro de Deus', 22, 1, 1, 8, 1, 11),
(31,'As Cruzadas de 2020', 22, 1, 1, 8, 1, 11),
(32,'Herdeiros de Atlântida', 27, 1, 0, 0, 1, 12),
(32,'Anjos da Morte', 27, 0, 0, 0, 1, 12),
(32,'Paraíso Perdido', 27, 0, 0, 0, 1, 12),
(33,'As Mentiras de Locke Lamora', 24, 0, 0, 0, 1, 12),
(33,'Mares de Sangue', 24, 0, 0, 0, 1, 12),
(33,'República de Ladrões', 24, 1, 0, 0, 1, 12),
(33,'The Thorn of Emberlain ', 24, 0, 0, 0, 1, 12),
(33,'The Ministry of Necessity', 24, 0, 0, 0, 1, 12),
(33,'The Mage and the Master Spy', 24, 0, 0, 0, 1, 12),
(33,'Inherit the Night', 24, 0, 0, 0, 1, 12),
(34,'A Canção do Sangue', 23, 1, 0, 0, 1, 2),
(34,'O Senhor da Torre', 23, 0, 0, 0, 1, 2),
(34,'A Rainha do Fogo', 23, 0, 0, 0, 1, 2),
(35,'A Ordem', 31, 1, 1, 8, 1, 4),
(35,'Tempestade de Luz', 31, 0, 0, 0, 1, 4),
(35,'Livro de Cain', 31, 0, 0, 0, 1, 4),
(35,'Livro de Tyrael', 31, 0, 0, 0, 1, 4),
(36,'Uma Nova Esperança', 28, 1, 0, 0, 3, 15),
(36,'Império Contra-Ataca', 28, 1, 0, 0, 3, 15),
(36,'O Retorno de Jedi', 28, 1, 0, 0, 3, 15),
(37,'O Sobrinho do Mago ', 35, 0, 1, 9, 3, 15),
(37,'O Leão, A Feiticeira e o Guarda-roupa', 35, 0, 1, 9, 3, 15),
(37,'O Cavalo e seu Menino', 35, 0, 1, 9, 3, 15),
(37,'O Príncipe Caspian', 35, 0, 1, 9, 3, 15),
(37,'A Viagem do Peregrino da Alvorada', 35, 0, 1, 9, 3, 15),
(37,'A Cadeira de Prata', 35, 0, 1, 9, 3, 15),
(37,'A Última Batalha', 35, 0, 1, 9, 3, 15),
(38,'A Cor da Magia', 37, 1, 1, 8, 1, 10),
(1,'A Queda De Artur', 1, 1, 0, 0, 1, 1),
(1,'A Lenda de Sigurd e Gudrún', 1, 1, 0, 0, 1, 1),
(1,'Mestre Gil de Ham', 1, 1, 0, 0, 1, 1),
(1,'Roverandom', 1, 1, 1, 7, 1, 1),
(1,'Contos inacabados', 1, 1, 1, 9, 1, 1),
(1,'As Cartas de J. R. R. Tolkien', 1, 1, 0, 0, 1, 1),
(1,'O Silmarillion', 1, 1, 1, 9, 1, 1),
(1,'O Hobbit', 1, 1, 1, 9, 1, 1),
(1,'Atlantis', 26, 1, 1, 7, 2, 11),
(1,'O Coração Dos Heróis', 25, 1, 0, 0, 1, 2),
(1,'Jogador Nº 1', 32, 1, 1, 9, 3, 2),
(1,'Ruas Estranhas', 5, 0, 0, 0, 3, 2),
(1,'Os Pilares da Terra', 33, 1, 1, 8, 2, 8),
(1,'Stonehenge', 2, 0, 0, 0, 2, 3),
(1,'O Mundo Magico Do Senhor Dos Aneis', 34, 0, 0, 0, 1, 18),
(1,'Os Filhos de Húrin', 1, 1, 1, 9, 1, 9),
(1,'Fora de Controle', 36, 0, 0, 0, 2, 19);

