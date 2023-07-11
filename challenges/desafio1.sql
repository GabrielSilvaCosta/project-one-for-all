
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- Utiliza o banco de dados
USE SpotifyClone;

-- Criação da tabela "Planos"
CREATE TABLE SpotifyClone.Planos (
    plano_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    detalhes VARCHAR(100)
) engine = InnoDB;

-- Criação da tabela "PessoasArtistas"
CREATE TABLE SpotifyClone.PessoasArtistas (
    pessoa_artista_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) engine = InnoDB;

-- Criação da tabela "Albums"
CREATE TABLE SpotifyClone.Albums (
    album_id INT PRIMARY KEY,
    pessoa_artista_id INT,
    nome VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    FOREIGN KEY (pessoa_artista_id) REFERENCES PessoasArtistas(pessoa_artista_id)
) engine = InnoDB;

-- Criação da tabela "Musicas"
CREATE TABLE SpotifyClone.Musicas (
    musica_id INT PRIMARY KEY,
    album_id INT,
    nome VARCHAR(100) NOT NULL,
    duracao_segundos INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
) engine = InnoDB;

-- Criação da tabela "PessoasUsuarios"
CREATE TABLE SpotifyClone.PessoasUsuarios (
    pessoa_usuario_id INT PRIMARY KEY,
    plano_id INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES Planos(plano_id)
) engine = InnoDB;

-- Criação da tabela "HistoricoReproducao"
CREATE TABLE SpotifyClone.HistoricoReproducao (
    historico_id INT PRIMARY KEY,
    pessoa_usuario_id INT,
    musica_id INT,
    data_reproducao DATETIME,
    FOREIGN KEY (pessoa_usuario_id) REFERENCES PessoasUsuarios(pessoa_usuario_id),
    FOREIGN KEY (musica_id) REFERENCES Musicas(musica_id)
) engine = InnoDB;

-- Criação da tabela "PessoasSeguidas"
CREATE TABLE SpotifyClone.PessoasSeguidas (
    pessoa_seguida_id INT,
    pessoa_usuario_id INT,
    pessoa_artista_id INT,
    PRIMARY KEY (pessoa_seguida_id, pessoa_usuario_id),
    FOREIGN KEY (pessoa_usuario_id) REFERENCES PessoasUsuarios(pessoa_usuario_id),
    FOREIGN KEY (pessoa_artista_id) REFERENCES PessoasArtistas(pessoa_artista_id)
) engine = InnoDB;


-- Tabela "Planos"
INSERT INTO Planos (plano_id, nome, detalhes) VALUES
(1, 'gratuito', '...'),
(2, 'familiar', '...'),
(3, 'pessoal', '...'),
(4, 'universitário', '...');

-- Tabela "PessoasArtistas"
INSERT INTO PessoasArtistas (pessoa_artista_id, nome) VALUES
(1, 'Barbara Liskov'),
(2, 'Robert Cecil Martin'),
(3, 'Ada Lovelace'),
(4, 'Martin Fowler'),
(5, 'Sandi Metz'),
(6, 'Paulo Freire'),
(7, 'Bell Hooks'),
(8, 'Christopher Alexander'),
(9, 'Judith Butler'),
(10, 'Jorge Amado');

-- Tabela "Albums"
INSERT INTO Albums (album_id, pessoa_artista_id, nome, ano_lancamento) VALUES
(1, 1, 'Renaissance', 2022),
(2, 2, 'Jazz', 1978),
(3, 2, 'Hot Space', 1982),
(4, 3, 'Falso Brilhante', 1998),
(5, 3, 'Vento de Maio', 2001),
(6, 6, 'QVVJFA?', 2003),
(7, 7, 'Somewhere Far Beyond', 2007),
(8, 8, 'I Put A Spell On You', 2012);

-- Tabela "Musicas"
INSERT INTO Musicas (musica_id, album_id, nome, duracao_segundos) VALUES
(1, 1, 'BREAK MY SOUL', 279),
(2, 1, 'VIRGO\'S GROOVE', 369),
(3, 1, 'ALIEN SUPERSTAR', 116),
(4, 2, 'Don\'t Stop Me Now', 203),
(5, 3, 'Under Pressure', 152),
(6, 4, 'Como Nossos Pais', 105),
(7, 5, 'O Medo de Amar é o Medo de Ser Livre', 207),
(8, 6, 'Samba em Paris', 267),
(9, 7, 'The Bard\'s Song', 244),
(10, 8, 'Feeling Good', 100);

-- Tabela "PessoasUsuarios"
INSERT INTO PessoasUsuarios (pessoa_usuario_id, plano_id, nome) VALUES
(1, 1, 'Barbara Liskov'),
(2, 1, 'Robert Cecil Martin'),
(3, 2, 'Ada Lovelace'),
(4, 2, 'Martin Fowler'),
(5, 2, 'Sandi Metz'),
(6, 4, 'Paulo Freire'),
(7, 4, 'Bell Hooks'),
(8, 3, 'Christopher Alexander'),
(9, 3, 'Judith Butler'),
(10, 3, 'Jorge Amado');

-- Tabela "HistoricoReproducao"
INSERT INTO HistoricoReproducao (historico_id, pessoa_usuario_id, musica_id, data_reproducao) VALUES
(1, 1, 2, '2022-02-28 10:45:55'),
(2, 1, 8, '2020-05-02 05:30:35'),
(3, 1, 10, '2020-03-06 11:22:33'),
(4, 2, 8, '2022-08-05 08:05:17'),
(5, 2, 7, '2020-01-02 07:40:33'),
(6, 3, 8, '2020-11-13 16:55:13'),
(7, 3, 5, '2020-12-05 18:38:30'),
(8, 4, 8, '2021-08-15 17:10:10'),
(9, 5, 8, '2022-01-09 01:44:33'),
(10, 5, 5, '2020-08-06 15:23:43');

-- Tabela "PessoasSeguidas"
INSERT INTO PessoasSeguidas (pessoa_seguida_id, pessoa_usuario_id, pessoa_artista_id) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 2, 3),
(4, 3, 5),
(5, 4, 6),
(6, 4, 10),
(7, 5, 1),
(8, 6, 7),
(9, 7, 9),
(10, 8, 2);
