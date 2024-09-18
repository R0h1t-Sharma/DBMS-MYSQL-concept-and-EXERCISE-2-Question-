-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------
create database inclass_day2_stuydent;
use inclass_day2_stuydent;


# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.
 SELECT * FROM cricket_1
UNION
SELECT * FROM cricket_2;

# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
SELECT Player_Id, Runs, Player_Name 
FROM cricket_1 
WHERE Runs > 50;



# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
SELECT * 
FROM cricket_1 
WHERE Player_Name LIKE 'y%v';

# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
SELECT * 
FROM cricket_1 
WHERE Player_Name NOT LIKE '%t';


# Q5.Extract Player_Id and Player_name of those columns where charisma is null.
select player_id , player_name from cricket_2 where charisma = null;

# Q6.Write MySQL query to extract Player_Id , Player_Name , charisma where charisma is greater than 25.
select Player_Id , Player_Name , charisma from new_cricket where charisma > 25;

# Q7.Write MySQL query to extract Player_Id , Player_Name who scored fifty and above
select Player_Id , Player_Name from new_cricket where runs<50;


# Q8.Write MySQL query to extract Player_Id , Player_Name who have popularity in the range of 10 to 12.

select Player_Id , Player_Name from new_cricket where popularity between 10 and 20 ;
# Question 10:

# Q9.Write MySQL query to extract Player_id, Player_Name where the Runs and Charisma both are greater than 50.
select Player_id, Player_Name from new_cricket where runs and Charisma >50;


-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------
SELECT * FROM cric_combined;

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)



-- Step 1: Check current values and calculated ratios
SELECT Player_Id, Player_Name, Popularity, Charisma, 
       Popularity / Charisma AS Calculated_Ratio 
FROM cric_combined;

-- Step 2: Adjust the PC_Ratio data type if necessary
ALTER TABLE cric_combined 
MODIFY COLUMN PC_Ratio DECIMAL(12, 4);

-- Step 3: Update the PC_Ratio with calculated values
UPDATE cric_combined 
SET PC_Ratio = CASE 
    WHEN Charisma > 0 THEN 
        Popularity / Charisma 
    ELSE 
        NULL 
END;

-- Step 4: Check the results
SELECT * FROM cric_combined;








# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
SELECT Player_Id, Player_Name, Popularity, Charisma, 
       Popularity / Charisma AS Popularity_Charisma_Ratio
FROM cric_combined
WHERE Charisma > 0  -- Ensure no division by zero
ORDER BY Popularity_Charisma_Ratio DESC
LIMIT 5;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.
SELECT Player_Id, Player_Name
FROM cric_combined
WHERE Player_Name LIKE '%D%';

# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
SELECT Player_Id, PC_Ratio
FROM cric_combined
WHERE PC_Ratio BETWEEN 0.12 AND 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
SELECT Player_Id, Player_Name
FROM cric_combined
WHERE Charisma IS NULL;

 
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
 SELECT Player_Id, Player_Name, 
       COALESCE(Charisma, 0) AS Charisma
FROM cric_combined;

# Q11. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
 SELECT Player_Id, 
       SUBSTRING(Player_Id, 3) AS Numeric_Id
FROM cric_combined;

# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
SELECT Player_Id, Player_Name, Charisma
FROM cric_combined
WHERE Charisma > 25;

-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------
select * from churn1;
ALTER TABLE churn_details RENAME TO Churn1;

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
SELECT 
    FLOOR(MonthlyServiceCharges) AS LowestIntegerMonthlyServiceCharges
FROM Churn1
WHERE PaymentMethod = 'Electronic check';




# Q14. Rename the table churn1 to “Churn_Details”.
ALTER TABLE churn1 RENAME TO Churn_Details;
describe Churn_Details;


# Q15. Write a query to create a display a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
SELECT 
    MonthlyServiceCharges,
    (MonthlyServiceCharges + 0) AS new_Amount  -- Assuming TotalAmount is 0 since it doesn't exist
FROM Churn_Details;

SELECT 
    MonthlyServiceCharges AS new_Amount
FROM Churn_Details;


 -- Use the new table name here

# Q16. Rename column new_Amount to Amount.
ALTER TABLE Churn_Details
RENAME COLUMN new_Amount TO Amount;

    
-- ALTER TABLE Churn_Details #this also exact
-- CHANGE new_Amount Amount DOUBLE;


  -- Adjust the data type as needed

SELECT 
    MonthlyServiceCharges, 
    MonthlyServiceCharges AS new_Amount
FROM Churn_Details;


DESCRIBE Churn_Details;


# Q17. Drop the column “Amount” from the table “Churn_Details”.

ALTER TABLE Churn_Details
DROP COLUMN Amount;


DESCRIBE Churn_Details;

# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
SELECT 
    customerID, 
    InternetConnection, 
    gender
FROM Churn_Details
WHERE SUBSTR(InternetConnection, 2, 1) = 'i';


# Q19. Find the records where the tenure is 6x, where x is any number.
SELECT *
FROM Churn_Details
WHERE tenure % 6 = 0;

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
SELECT 
    UPPER(player_Name) AS playerName,
    COALESCE(charisma, 0) AS charisma
FROM 
    cricket_2
ORDER BY 
    player_Name;
