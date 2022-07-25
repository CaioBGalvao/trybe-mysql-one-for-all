DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    subscription_name VARCHAR(20) NOT NULL,
    subscription_price FLOAT(2) NOT NULL
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Subscription (subscription_name, subscription_price)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

CREATE TABLE SpotifyClone.Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(20) NOT NULL,
    user_age INT NOT NULL,
    user_subscription_date DATE NOT NULL,
    subscription_id INT NOT NULL,
    FOREIGN KEY (subscription_id)
        REFERENCES Subscription (subscription_id)
)  ENGINE=INNODB;

  INSERT INTO SpotifyClone.Users (user_name, user_age, subscription_id , user_subscription_date)
VALUES
  ('Thati', 23, 1 , '2019-10-20'),
  ('Cintia', 35, 4 , '2017-12-30'),
  ('Bill', 20, 2 , '2019-06-05'),
  ('Roger', 45, 3 , '2020-05-13'),
  ('Norman', 58, 3 ,   '2017-02-17'),
  ('Patrick', 33, 4 , '2017-01-06'),
  ('Vivian', 26, 2 , '2018-01-05'),
  ('Carol', 19, 2 , '2018-02-14'),
  ('Angelina', 42 , 2 , '2018-04-29'),
  ('Paul', 46, 4 , '2017-01-17');

CREATE TABLE SpotifyClone.Artist (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(20) NOT NULL
)  ENGINE=INNODB;

  INSERT INTO SpotifyClone.Artist (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

CREATE TABLE SpotifyClone.Following (
    following_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES Artist (artist_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Following (user_id, artist_id)
VALUES
  (1,1),
  (1,3),
  (1,4),
  (2,1),
  (2,3),
  (3,1),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,1),
  (6,3),
  (6,6),
  (7,2),
  (7,5),
  (8,1),
  (8,5),
  (9,3),
  (9,4),
  (9,6),
  (10,2),
  (10,6);

CREATE TABLE SpotifyClone.Album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES Artist (artist_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Album (album_name, release_year, artist_id)
VALUES
  ('Envious', '1990', 1),
  ('Exuberant', '1993', 1),
  ('Hallowed Steam', '1995', 2),
  ('Incandescent', '1998', 3),
  ('Temporary Culture', '2001', 4),
  ('Library of liberty', '2003', 4),
  ('Chained Down', '2007', 5),
  ('Cabinet of fools', '2012', 5),
  ('No guarantees', '2015', 5),
  ('Apparatus', '2015', 6);

CREATE TABLE SpotifyClone.Songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    duration_song INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES Artist (artist_id),
    FOREIGN KEY (album_id)
        REFERENCES Album (album_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Songs (song_name, duration_song, artist_id, album_id)
VALUES
  ('Soul For Us', 200, 1 , 1),
  ('Reflections Of Magic', 163 , 1 , 1),
  ('Dance With Her Own', 116 , 1 , 1),
  
  ('Troubles Of My Inner Fire', 203 , 1 , 2),
  ('Time Fireworks', 152 , 1 , 2),
  
  ('Magic Circus', 105 , 2 , 3),
  ('Honey, So Do I', 207 , 2 , 3),
  ("Sweetie, Let's Go Wild", 139 , 2 , 3),
  ('She Knows', 244 , 2 , 3),
  
  ('Fantasy For Me', 100 , 3 , 4),
  ('Celebration Of More', 146 , 3 , 4),
  ('Rock His Everything', 223 , 3 , 4),
  ('Home Forever', 231 , 3 , 4),
  ('Diamond Power', 241 , 3 , 4),
  ("Let's Be Silly", 132 , 3 , 4),
  
  ('Thang Of Thunder', 240 , 4 , 5),
  ('Words Of Her Life', 185 , 4 , 5),
  ('Without My Streets', 176 , 4 , 5),
  
  ('Need Of The Evening', 190 , 4 , 6),
  ('History Of My Roses', 222 , 4 , 6),
  ('Without My Love', 111 , 4 , 6),
  ('Walking And Game', 123 , 4 , 6),
  ('Young And Father', 197 , 4 , 6),
  
  ('Finding My Traditions', 179 , 5 , 7),
  ('Walking And Man', 229 , 5 , 7),
  ('Hard And Time', 135 , 5 , 7),
  ("Honey, I'm A Lone Wolf", 150 , 5 , 7),
  
  ("She Thinks I Won't Stay Tonight", 166 , 5 , 8),
  ("He Heard You're Bad For Me", 154 , 5 , 8),
  ("He Hopes We Can't Stay", 210 , 5 , 8),
  ("I Know I Know", 117 , 5 , 8),
  
  ("He's Walking Away", 159 , 5 , 9),
  ("He's Trouble", 138 , 5 , 9),
  ('I Heard I Want To Bo Alone', 120 , 5 , 9),
  ('I Ride Alone', 151 , 5 , 9),
  
  ('Honey', 79 , 6 , 10),
  ('You Cheated On Me', 95 , 6 , 10),
  ("Wouldn't It Be Nice", 213 , 6 , 10),
  ('Baby', 136 , 6 , 10),
  ('You Make Me Feel So..', 83 , 6 , 10);


CREATE TABLE SpotifyClone.Reproduction (
    reproduction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES Songs (song_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Reproduction (reproduction_date, user_id, song_id)
VALUES
  ('2020-02-28 10:45:55', 1, 36),
  ('2020-05-02 05:30:35', 1, 25),
  ('2020-03-06 11:22:33', 1, 23),
  ('2020-08-05 08:05:17', 1, 14),
  ('2020-09-14 16:32:22', 1, 15),
  ('2020-01-02 07:40:33', 2, 34),
  ('2020-05-16 06:16:22', 2, 24),
  ('2020-10-09 12:27:48', 2, 21),
  ('2020-09-21 13:14:46', 2, 39),
  ('2020-11-13 16:55:13', 3, 6),
  ('2020-12-05 18:38:30', 3, 3),
  ('2020-07-30 10:00:00', 3, 26),
  ('2021-08-15 17:10:10', 4, 2),
  ('2021-07-10 15:20:30', 4, 35),
  ('2021-01-09 01:44:33', 4, 27),
  ('2020-07-03 19:33:28', 5, 7),
  ('2017-02-24 21:14:22', 5, 12),
  ('2020-08-06 15:23:43', 5, 14),
  ('2020-11-10 13:52:27', 5, 1),
  ('2019-02-07 20:33:48', 6, 38),
  ('2017-01-24 00:31:17', 6, 29),
  ('2017-10-12 12:35:20', 6, 30),
  ('2018-05-29 14:56:41', 6, 22),
  ('2018-05-09 22:30:49', 7, 5),
  ('2020-07-27 12:52:58', 7, 4),
  ('2018-01-16 18:40:43', 7, 11),
  ('2018-03-21 16:56:40', 8, 39),
  ('2020-10-18 13:38:05', 8, 40),
  ('2019-05-25 08:14:03', 8, 32),
  ('2021-08-15 21:37:09', 8, 33),
  ('2021-05-24 17:23:45', 9, 16),
  ('2018-12-07 22:48:52', 9, 17),
  ('2021-03-14 06:14:26', 9, 8),
  ('2020-04-01 03:36:00', 9, 9),
  ('2017-02-06 08:21:34', 10, 20),
  ('2017-12-04 05:33:43', 10, 21),
  ('2017-07-27 05:24:49', 10, 12),
  ('2017-12-25 01:03:57', 10, 13);