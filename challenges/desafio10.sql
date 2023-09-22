-- Criação da tabela "Pessoa Usuária"
CREATE TABLE SpotifyClone.pessoa_usuaria (
    ID_Pessoa_Usuaria INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela "Canção"
CREATE TABLE SpotifyClone.cancao (
    ID_Cancao INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela "Favoritos"
CREATE TABLE SpotifyClone.favoritos (
    ID_Pessoa_Usuaria INT,
    ID_Cancao INT,
    PRIMARY KEY (ID_Pessoa_Usuaria, ID_Cancao),
    FOREIGN KEY (ID_Pessoa_Usuaria) REFERENCES SpotifyClone.pessoa_usuaria(ID_Pessoa_Usuaria),
    FOREIGN KEY (ID_Cancao) REFERENCES SpotifyClone.cancao(ID_Cancao)
) ENGINE = InnoDB;


-- Inserção dos dados na tabela "Pessoa Usuária"
INSERT INTO SpotifyClone.pessoa_usuaria (ID_Pessoa_Usuaria, Nome)
VALUES
    (1, 'Barbara Liskov'),
    (2, 'Robert Cecil Martin'),
    (3, 'Ada Lovelace'),
    (4, 'Martin Fowler'),
    (5, 'Sandi Metz'),
    (6, 'Christopher Alexander'),
    (7, 'Judith Butler'),
    (8, 'Jorge Amado');

-- Inserção dos dados na tabela "Canção"
INSERT INTO SpotifyClone.cancao (ID_Cancao, Nome)
VALUES
    (1, 'ALIEN SUPERSTAR'),
    (2, 'Como Nossos Pais'),
    (3, 'Feeling Good'),
    (4, 'Don''t Stop Me Now'),
    (5, 'BREAK MY SOUL'),
    (6, 'VIRGO''S GROOVE'),
    (7, 'O Medo de Amar é o Medo de Ser Livre');

-- Inserção dos dados na tabela "Favoritos"
INSERT INTO SpotifyClone.favoritos (ID_Pessoa_Usuaria, ID_Cancao)
VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '4'),
    ('3', '1'),
    ('3', '5'),
    ('4', '7'),
    ('4', '4'),
    ('5', '3'),
    ('5', '6'),
    ('6', '4'),
    ('7', '7'),
    ('8', '1');
