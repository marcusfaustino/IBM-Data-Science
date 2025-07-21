-- Aggregate function examples:

SELECT SUM(COST) FROM PETRESCUE; -- Sums all costs from the table.

SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE; -- Same as above, renames the result as SUM_OF_COST.

SELECT MAX(QUANTITY) FROM PETRESCUE; -- Retrieves the maximum quantity.

SELECT MIN(QUANTITY) FROM PETRESCUE; -- Retrives the minimum quantity.

SELECT AVG(COST) FROM PETRESCUE; -- Calculates the average cost.

-- Rounding examples:

SELECT ROUND(COST) FROM PETRESCUE; -- Rounds up to closest integer.

SELECT ROUND(COST, 0) FROM PETRESCUE; -- Same as above.

SELECT ROUND(COST, 2) FROM PETRESCUE; -- Rounds to 2 decimal places.

-- String function examples:

SELECT LENGTH(ANIMAL) FROM PETRESCUE; -- Determines the length of each string.

SELECT UCASE(ANIMAL) FROM PETRESCUE; -- Casts all strings as uppercase.

SELECT LCASE(ANIMAL) FROM PETRESCUE; -- Casts all strings as lowercase.

-- Date function examples:

SELECT DAY(RESCUEDATE) FROM PETRESCUE; -- Retrives the day from the rescue date.

SELECT MONTH(RESCUEDATE) FROM PETRESCUE; -- Retrieves the month from the rescue date.

SELECT YEAR(RESCUEDATE) FROM PETRESCUE; -- Retrieves the year from the rescue date.

SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE; -- Adds 3 days to the rescue date.

SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE; -- Adds 2 months to the rescue date.

SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE; -- Subtracts 3 days from the rescue date.

SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE; -- Gets the number of days since the pet's rescue.

SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE; -- Converts previous query to YYYY-MM-DD format.

-- Practice problems:

-- Write a query that displays the average cost of rescuing a single dog. 
-- Note that the cost per dog would not be the same in different instances.

SELECT 
	ROUND(AVG(PETRESCUE.COST / PETRESCUE.QUANTITY), 2) AS 'Avg. cost of rescuing a dog'
FROM PETRESCUE 
WHERE PETRESCUE.ANIMAL = 'DOG';

-- Write a query that displays the animal name in each rescue in uppercase without duplications.

SELECT DISTINCT(UCASE(PETRESCUE.ANIMAL)) FROM PETRESCUE;

-- Write a query that displays the number of rescues in the 5th month.

SELECT SUM(QUANTITY) AS 'Number of rescues in May' FROM PETRESCUE WHERE MONTH(PETRESCUE.RESCUEDATE) = 5;

-- The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. 
-- Write a query that displays the ID and the target date.

SELECT
	ID,
    DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) AS TARGET_DATE
FROM PETRESCUE;