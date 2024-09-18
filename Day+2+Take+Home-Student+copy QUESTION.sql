# Use bank_inventory, cricket_1 and cricket_2 tables from Online_Day1_InClass and Online_Day2_InClass to solve the queries.

# # Question 1:
# Q1.Write MySQL query to find highest priced product
USE BANK;
SELECT * FROM bank_inventory;
# Question 2:

# Q2.Write MySQL query to find third lowest run scorer.
use inclass_day2_stuydent;
SELECT DISTINCT runs
FROM cricket_1
ORDER BY runs ASC
LIMIT 1 OFFSET 2;

# Question 3:
# Q3. Write MySQL query to find player_ID and Player_name which contains “D”.
SELECT player_ID, player_name
FROM cricket_1
WHERE player_name LIKE '%D%';
# Question 4:

# Q4.Write MySQL query to extract Player_Name whose name is having second character as 'R'
select player_name from cricket_1 having player_name like '_%R%';
select * from cricket_1;
# Question 5:

# Q5.Write MySQL query to extract Player_Name whose name whose popularity is grater than 10 or charisma is greater than 50
# from tables cricket_1 and cricket_2 using set operator
SELECT Player_Name
FROM cricket_1
WHERE Popularity > 10
UNION
SELECT Player_Name
FROM cricket_2
WHERE Charisma > 50;
/* Prerequisites */
-- Use the bank_inventory table from Online_Day1_Inclass file to answer the below questions
# Question 6:
# 6) Display the Geo_locations in capital letters from the table Bank_Holiday.
#use inclass_day2_stuydent;

USE bank;

SELECT UPPER(Timezone) AS Timezone
FROM Bank_Holidays;
# Question 7:
# 7) Display the position of occurance of the string ‘City’ in the column  Geo_location from the table Bank_Inventory.
SELECT  LOCATE('City', Geo_location) AS Position
FROM Bank_Inventory;
# Question 8:
# 8) Display the column Quantity from the table Bank_Inventory by applying the below formatting: 
-- a) convert the data type from numeric to character 
-- b) Pad the column with 0's  
SELECT LPAD(CAST(Quantity AS CHAR), 5, '0') AS Padded_Quantity
FROM Bank_Inventory;


# To answer 9th question there are few prerquisites to be followed
# PRE - REQUISITE:
Insert into bank_Inventory values ( 'MaxGain',    6 , 220.39, 4690.67, 4890 , 'Riverdale-village' ) ;
Insert into bank_Inventory values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,'Victoria-Town') ;


# Question 9:
# 9) Display the column Geo_location by replacing the underscores with spaces (" ").
SELECT REPLACE(Geo_location, '_', ' ') AS Geo_location
FROM Bank_Inventory;

-- Use the cricket2 table to answer the below questions

# Question 10:
use inclass_day2_stuydent;
# Q10. Display the columns Player_Name, charisma and Runs by combining into a single comma seperated output. (Name the column as : 'Details')

SELECT CONCAT(Player_Name, ', ', Charisma, ', ', Runs) AS Details
FROM cricket_2;