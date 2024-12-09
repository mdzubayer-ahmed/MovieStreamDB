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
) ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE movies (
  movieid int NOT NULL AUTO_INCREMENT,
  title varchar(255) DEFAULT NULL,
  release_date date DEFAULT NULL,
  duration varchar(20) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE movie_genre (
  movie_genre varchar(255) DEFAULT NULL,
  movieid int DEFAULT NULL,
  KEY movieid (movieid),
  CONSTRAINT movie_genre_ibfk_1 FOREIGN KEY (movieid) REFERENCES movies (movieid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE ratings (
  `userID` int NOT NULL,
  `movieid` int NOT NULL,
  `ratingScore` float DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `ratingDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`,`movieid`),
  KEY `movieid` (`movieid`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `ratings_chk_1` CHECK (((`ratingScore` >= 0.0) and (`ratingScore` <= 5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE subscriptions (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `end_Date` date DEFAULT NULL,
  `subscription_status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `userID` (`userID`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE payments (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_amount` int DEFAULT NULL,
  `card_no` varbinary(256) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` enum('VISA','MASTERCARD') DEFAULT NULL,
  `subscription_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `subscription_id` (`subscription_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-------------
-- Populate Database
-------------
INSERT INTO users (userName, email, password, date_of_birth) VALUES ('JaneDoe', 'janedoe@example.com', 'hashedpassword456', '1992-07-20'),('AliceSmith', 'alicesmith@example.com', 'hashedpassword789', '1988-11-02'),('BobJohnson', 'bobjohnson@example.com', 'hashedpassword321', '1995-03-10');
INSERT INTO movies VALUES ('MOVIE1','2000-12-20','03:02:00','1ST DESCRIPTION'),('Movie2','2000-12-20','03:02:00','Second Descriptionor'),('Movie3','2000-12-20','03:02:00','Third Description'),('Movie4','2024-11-10','02:07:00','Descriuption \n with an enter');
INSERT INTO movie_genre VALUES ('ACTION',1), ('Drama',2), ('genre3',3);
INSERT INTO ratings VALUES (1,1,3,'It is a good movie','2001-12-19'),(2,1,1,'It is a wow movie','2001-12-19'),(3,1,5,'It is a beautifulmovie','2001-12-19');
INSERT INTO subscriptions VALUES (1,1,'2024-02-11','2024-05-11','Active'),(2,1,'2024-02-11','2024-05-11','Active'),(3,1,'2024-02-11','2024-05-11','Active'),(4,1,'2024-02-11','2024-05-11','Active');
INSERT INTO payments (payment_amount, card_no, payment_date, payment_method, subscription_id) VALUES (150, CAST('9876543210987654' AS VARBINARY(256)), '2024-12-05', 'MASTERCARD', 1),(200, CAST('1234567890123456' AS VARBINARY(256)), '2024-12-06', 'VISA', 2),(50, CAST('1122334455667788' AS VARBINARY(256)), '2024-12-07', 'VISA', 3);
