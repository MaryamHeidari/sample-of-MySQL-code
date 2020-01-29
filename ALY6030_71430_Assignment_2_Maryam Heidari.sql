#create schema
CREATE SCHEMA `MaryamHeidari_Week2`;

#creat Table
CREATE TABLE `MaryamHeidari_Week2`.`movies` (
  `Year` INT NULL,
  `Lenght` INT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `movieSubjet` VARCHAR(45) NULL,
  `Actor` VARCHAR(45) NULL,
  `Actress` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Popularity` INT NULL,
  `award` VARCHAR(45) NULL,
  PRIMARY KEY (`Title`));
  
#import data by right click on movies table or 
#LOAD DATA INFILE '/Users/niloofarheidari/Desktop/movies.csv'   ## address of the csv file
#INTO TABLE movies
#FIELDS TERMINATED BY ',' 
#LINES TERMINATED BY '\r\n' 
#IGNORE 1 ROWS;  
  
  #create separate tables
   CREATE TABLE `MaryamHeidari_Week2`.`Movie_subject` (
  `Subject_ID` INT NOT NULL auto_increment,
  `moviesubject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Subject_ID`));
  
  CREATE TABLE `MaryamHeidari_Week2`.`Director` (
  `Director_ID` INT NOT NULL auto_increment,
  `Director_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Director_ID`));
  CREATE TABLE `MaryamHeidari_Week2`.`actor` (
  `actor_ID` INT NOT NULL auto_increment,
  `actor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_ID`));
  CREATE TABLE `MaryamHeidari_Week2`.`actress` (
  `actress_ID` INT NOT NULL auto_increment,
  `actress_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actress_ID`));
  CREATE TABLE `MaryamHeidari_Week2`.`popularity` (
  `Popularity_ ID` INT NOT NULL auto_increment,
  `Popularity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Popularity_ ID`));
  
#fill tables
use MaryamHeidari_Week2;  
INSERT INTO Movie_subject(moviesubject) SELECT DISTINCT movieSubjet From movies;
INSERT INTO Director(Director_name) SELECT DISTINCT Director From movies;
INSERT INTO actor(actor_name) SELECT DISTINCT Actor From movies;
INSERT INTO actress(actress_name) SELECT DISTINCT Actress From movies;
INSERT INTO popularity(Popularity) SELECT DISTINCT Popularity From movies;

# delete missing values
SET SQL_SAFE_UPDATES = 0; 
SELECT * FROM Movie_subject WHERE moviesubject IS NULL or moviesubject = "";
delete  FROM Movie_subject WHERE moviesubject IS NULL OR moviesubject = "";

SELECT * FROM Director WHERE Director_name IS NULL or Director_name = "";
delete  FROM Director WHERE Director_name IS NULL OR Director_name = "";

SELECT * FROM actor WHERE actor_name IS NULL or actor_name = "";
delete  FROM actor WHERE actor_name IS NULL OR actor_name = "";

SELECT * FROM actress WHERE actress_name IS NULL or actress_name = "";
delete  FROM actress WHERE actress_name IS NULL OR actress_name = "";

SELECT * FROM popularity WHERE Popularity IS NULL or Popularity = "";
delete  FROM popularity WHERE Popularity IS NULL OR Popularity = "";

## part 2
SELECT movies.Director, movies.movieSubjet, Director_ID, Subject_ID
FROM movies
     JOIN Director ON movies.Director= Director.Director_name
     JOIN Movie_subject ON movies.movieSubjet = Movie_subject.moviesubject;

SELECT movies.Actor, movies.Actress, actor_ID, actress_ID
FROM movies
     JOIN actor ON movies.Actor= actor.actor_name
     JOIN actress ON movies.Actress = actress.actress_name;

SELECT movies.Actor, movies.Actress, actor_ID, actress_ID
FROM movies
     RIGHT JOIN actor ON movies.Actor= actor.actor_name
     RIGHT JOIN actress ON movies.Actress = actress.actress_name;

 
  