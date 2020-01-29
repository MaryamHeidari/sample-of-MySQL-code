#CREATE A NEW DATABASE NAMED crystaldb
create database Maryam_movies;

#CREATE AN EMPTY TABLE 
CREATE TABLE `Maryam_movies`.`movies` (
  `year_movie` INT NOT NULL,
  `lenght` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `subject_movie` VARCHAR(45) NOT NULL,
  `actor` VARCHAR(45) NOT NULL,
  `actress` VARCHAR(45) NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  `popularity` INT NOT NULL,
  `Awards` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Title`));

#insert data to table
LOAD DATA INFILE 'c:/ALY-6030 71430- Maryam Heidari-Week 1.csv' 
INTO TABLE movies 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#question 1
SELECT director, avg(popularity)  # select rows
FROM movies
group by director                 #group by
order by avg(popularity) desc;    #arrenge it 

#question 2
SELECT year_movie,subject_movie, avg(popularity)   # select rows
FROM movies
group by year_movie, subject_movie                 #group by
order by year_movie,subject_movie;                 #arrenge it

# question 2
SELECT year_movie, count(Title) # select rows
FROM movies
group by year_movie             #group by
order by count(Title) desc;    #arrenge it

