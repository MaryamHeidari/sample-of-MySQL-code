#create schema
create schema MaryamHeidari_week4;

#create table

CREATE TABLE `MaryamHeidari_week4`.`Demographics`
(
  Zip_Code CHAR(45) NOT NULL,
  City CHAR(45) NOT NULL,
  Country CHAR(45) NOT NULL,
  PRIMARY KEY (Zip_Code)
);

CREATE TABLE `MaryamHeidari_week4`.`Demographics_OK`
(
  zip_code CHAR(45) NOT NULL,
  City CHAR(45) NOT NULL,
  Country CHAR(45) NOT NULL,
  PRIMARY KEY (zip_code),
  FOREIGN KEY (Zip_Code) REFERENCES Demographics(Zip_Code)
);

CREATE TABLE `MaryamHeidari_week4`.`BRFSS_OK`
(
  Question CHAR NOT NULL,
  Response CHAR NOT NULL,
  Break_Out CHAR NOT NULL,
  Break_Out_Category CHAR NOT NULL,
  Sample_Size INT NOT NULL,
  Data_Value_ INT NOT NULL,
  zip_code CHAR NOT NULL,
  FOREIGN KEY (Zip_Code) REFERENCES Demographics_OK(Zip_Code)
);


LOAD DATA INFILE '/Users/niloofarheidari/Desktop/Northeastern University/term4 , Fall 2019/ALY 6030-SQL and Data warehouse/week 4/Demographics_OK.csv' 
INTO TABLE `MaryamHeidari_week4`.`BRFSS_OK` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT ZipCode 
WHEN Break_Out_Category is 'Education Attained' and Break_Out is 'College graduate'
OR 
WHEN Break_Out_Category is 'Age Group' and Break_Out is '18-24'
FROM BRFSS_OK
GROUP BY ZipCode;


ALTER TABLE `MaryamHeidari_week4`.`Demographics_OK` 
ADD CONSTRAINT `ZipCode`
  FOREIGN KEY (`ZipCode`)
  REFERENCES `MaryamHeidari_week4`.`Demographics` (`ZipCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `MaryamHeidari_week4`.`BRFSS_OK` 
ADD INDEX `ZipCode_idx` (`ZipCode` ASC) VISIBLE;
ALTER TABLE `MaryamHeidari_week4`.`BRFSS_OK` 
ADD CONSTRAINT `ZipCode`
  FOREIGN KEY (`ZipCode`)
  REFERENCES `MaryamHeidari_week4`.`Demographics_OK` (`ZipCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  Select MAX(Data_Value) as highest_number_response from BRFSS_OK;
  select min(Data_Value) as lowest_number_response from BRFSS_OK;
  
  SELECT ZipCode FROM BRFSS_OK WHERE Data_Value=highest_number_response;
  SELECT ZipCode FROM BRFSS_OK WHERE Data_Value=lowest_number_response;
  
  