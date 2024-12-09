CREATE DATABASE IF NOT EXISTS movie_streaming;
use movie_streaming;

-------------------
-- Create tables
-------------------
DROP Table IF EXISTS users;
DROP Table IF EXISTS movies;
DROP Table IF EXISTS movie_genre;
DROP Table IF EXISTS ratings;
DROP Table IF EXISTS subscriptions;
DROP Table IF EXISTS payments;
DROP TABLE IF EXISTS trigger_user;


CREATE TABLE users (
  userID int NOT NULL AUTO_INCREMENT,
  userName varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password char(64) NOT NULL,
  date_of_birth date DEFAULT NULL,
  PRIMARY KEY (userID)
);

CREATE TABLE movies (
  movieid int NOT NULL AUTO_INCREMENT,
  title varchar(255) DEFAULT NULL,
  release_date date DEFAULT NULL,
  duration varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  PRIMARY KEY (movieid)
);

CREATE TABLE movie_genre (
  movie_genre varchar(255) DEFAULT NULL,
  movieid int DEFAULT NULL,
  KEY movieid (movieid),
  CONSTRAINT movie_genre_ibfk_1 FOREIGN KEY (movieid) REFERENCES movies (movieid)
);

CREATE TABLE ratings (
  userID int NOT NULL,
  movieid int NOT NULL,
  ratingScore float DEFAULT NULL,
  review varchar(255) DEFAULT NULL,
  ratingDate date DEFAULT NULL,
  PRIMARY KEY (userID, movieid),
  KEY movieid (movieid),
  CONSTRAINT ratings_ibfk_1 FOREIGN KEY (userID) REFERENCES users (userID),
  CONSTRAINT ratings_ibfk_2 FOREIGN KEY (movieid) REFERENCES movies (movieid),
  CONSTRAINT ratings_chk_1 CHECK (ratingScore >= 0.0 AND ratingScore <= 5.0)
);

CREATE TABLE subscriptions (
  subscription_id int NOT NULL AUTO_INCREMENT,
  userID int DEFAULT NULL,
  startdate date DEFAULT NULL,
  end_Date date DEFAULT NULL,
  subscription_status enum(Active, Inactive) DEFAULT NULL,
  PRIMARY KEY (subscription_id),
  KEY userID (userID),
  CONSTRAINT subscriptions_ibfk_1 FOREIGN KEY (userID) REFERENCES users (userID)
);

CREATE TABLE payments (
  payment_id int NOT NULL AUTO_INCREMENT,
  payment_amount int DEFAULT NULL,
  card_no varbinary(256) DEFAULT NULL,
  payment_date date DEFAULT NULL,
  payment_method enum(VISA, MASTERCARD) DEFAULT NULL,
  subscription_id int DEFAULT NULL,
  PRIMARY KEY (payment_id),
  KEY subscription_id (subscription_id),
  CONSTRAINT payments_ibfk_1 FOREIGN KEY (subscription_id) REFERENCES subscriptions (subscription_id)
);



-------------
-- Populate Database
-------------
INSERT INTO users (userName, email, password, date_of_birth)
VALUES 
('Alice', 'alice@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1990-01-15'),
('Bob', 'bob@example.com', 'e99a18c428cb38d5f260853678922e03', '1985-03-22'),
('Charlie', 'charlie@example.com', '098f6bcd4621d373cade4e832627b4f6', '1992-07-30');

INSERT INTO movies (title, release_date, duration, description)
VALUES
('The Matrix', '1999-03-31', '136 min', 'A computer hacker learns about the true nature of his reality and his role in the war against its controllers.'),
('Inception', '2010-07-16', '148 min', 'A thief who enters the dreams of others to steal secrets from their subconscious is given the task of planting an idea into the mind of a CEO.'),
('The Dark Knight', '2008-07-18', '152 min', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.'); 

INSERT INTO movie_genre (movie_genre, movieid)
VALUES
('Action', 1),
('Sci-Fi', 1),
('Action', 2),
('Sci-Fi', 2),
('Action', 3),
('Crime', 3);

INSERT INTO ratings (userID, movieid, ratingScore, review, ratingDate)
VALUES
(1, 1, 5.0, 'Great movie with mind-bending action!', '2024-12-01'),
(2, 2, 4.5, 'Incredible visuals and story, a must-watch!', '2024-12-02'),
(3, 3, 5.0, 'A masterpiece in every sense.', '2024-12-03');

INSERT INTO subscriptions (userID, startdate, end_Date, subscription_status)
VALUES
(1, '2024-01-01', '2025-01-01', 'Active'),
(2, '2024-05-01', '2025-05-01', 'Inactive'),
(3, '2024-06-15', '2025-06-15', 'Active');

INSERT INTO payments (payment_amount, card_no, payment_date, payment_method, subscription_id)
VALUES
(100, CAST('1234567890123456' AS VARBINARY(256)), '2024-12-01', 'VISA', 1),
(50, CAST('9876543210987654' AS VARBINARY(256)), '2024-12-02', 'MASTERCARD', 2),
(75, CAST('1122334455667788' AS VARBINARY(256)), '2024-12-03', 'VISA', 3);



----------------------
-- Add Stored Procedures and Functions
-----------------------
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_usercount`(movieName VARCHAR(50)) RETURNS int
DETERMINISTIC
BEGIN 
    DECLARE countuser INT;
    SELECT count(*) into countuser FROM ratings WHERE movieName = movieName;
    RETURN countuser;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addmovies`(
    IN movie_title VARCHAR(255),
    IN movie_release_date DATE,
    IN movie_duration TIME,
    IN movie_description VARCHAR(255),
    OUT new_movie_id INT
)
BEGIN
    INSERT INTO movies(title, release_date, duration, description)
    VALUES (movie_title, movie_release_date, movie_duration, movie_description);

    SET new_movie_id = LAST_INSERT_ID();
END ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSubscription`(
    IN user_id INT,
    IN start_date DATE,
    IN end_date DATE,
    IN new_subscription_status ENUM('Active','Inactive'),
    OUT new_subscription_id INT
)
BEGIN
    INSERT INTO subscriptions(userID, startdate, end_Date, subscription_status)
    VALUES (user_id, start_date, end_date, new_subscription_status);

    SET new_subscription_id = LAST_INSERT_ID();
END ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(
    IN new_username VARCHAR(255),
    IN new_email VARCHAR(255),
    IN new_password CHAR(64),
    IN new_date_of_birth DATE,
    OUT new_userID INT
)
BEGIN
    INSERT INTO users(username, email, password, date_of_birth)
    VALUES (new_username, new_email, new_password, new_date_of_birth);
    
    SET new_userID = LAST_INSERT_ID();
END ;;
DELIMITER ;