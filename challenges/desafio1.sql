-- Criação do banco de dados SpotifyClone (se já existir, será excluído)
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

-- Uso do banco de dados SpotifyClone
USE SpotifyClone;

-- Criação da tabela subscription
CREATE TABLE IF NOT EXISTS subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    subscription_type VARCHAR(45) NOT NULL,
    subscription_price DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela artist
CREATE TABLE IF NOT EXISTS artist (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela album
CREATE TABLE IF NOT EXISTS album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(45) NOT NULL,
    artist_id INT NOT NULL,
    release_year INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) ENGINE = InnoDB;

-- Criação da tabela track
CREATE TABLE IF NOT EXISTS track (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    track_name VARCHAR(45) NOT NULL,
    track_duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;

-- Criação da tabela customer
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(45) NOT NULL,
    customer_age INT NOT NULL,
    subscription_id INT NOT NULL,
    customer_subscription_sign_date DATE NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id)
) ENGINE = InnoDB;

-- Criação da tabela following
CREATE TABLE IF NOT EXISTS following (
    customer_id INT,
    artist_id INT,
    PRIMARY KEY (customer_id, artist_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) ENGINE = InnoDB;

-- Criação da tabela history
CREATE TABLE IF NOT EXISTS history (
    customer_id INT,
    track_id INT,
    history_date DATETIME NOT NULL,
    PRIMARY KEY (customer_id, track_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
) ENGINE = InnoDB;

-- Inserção de dados na tabela subscription
INSERT INTO subscription (subscription_type, subscription_price)
VALUES
    ('free', 0.00),
    ('family', 7.99),
    ('student', 5.99),
    ('personal', 6.99);

-- Inserção de dados na tabela artist
INSERT INTO artist (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

-- Inserção de dados na tabela album
INSERT INTO album (album_name, release_year, artist_id)
VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

-- Inserção de dados na tabela track
INSERT INTO track (track_name, track_duration, album_id)
VALUES
    ('BREAK MY SOUL', 279, 1),
    ("VIRGO'S GROOVE", 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ("Don't Stop Me Now", 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ("The Bard's Song", 244, 7),
    ('Feeling Good', 100, 8);

-- Inserção de dados na tabela customer
INSERT INTO customer (customer_name, customer_age, customer_subscription_sign_date, subscription_id)
VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

-- Inserção de dados na tabela following
INSERT INTO following (customer_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

-- Inserção de dados na tabela history
INSERT INTO history (customer_id, track_id, history_date)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
