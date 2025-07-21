-- This query would raise an error when trying to get which employees earn less than the average:
--SELECT * 
--FROM EMPLOYEES 
--WHERE salary < AVG(salary);

-- We can use this query instead:
SELECT *
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

-- This query allows us to compare each employee's salary with the max salary.
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY 
FROM EMPLOYEES;

-- This query fetches the oldest employees from the table.
SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);

-- This query fetches the average salary for the top 5 earners in the company.
SELECT AVG(SALARY) 
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY DESC 
      LIMIT 5) AS SALARY_TABLE;

-- Practice problems

-- Write a query to find the average salary of the five least-earning employees.

SELECT AVG(SALARY)
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY 
      LIMIT 5) AS LOWEST_5_SALARIES;

-- Write a query to find the records of employees older than the average age of all employees.

SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, EMPLOYEES.B_DATE))) > 
	(SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, EMPLOYEES.B_DATE)))) 
     FROM EMPLOYEES);

-- From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.

SELECT 
	JOB_HISTORY.EMPL_ID, 
    YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, JOB_HISTORY.START_DATE))) AS YEARS_OF_SERVICE,
    (SELECT ROUND(AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, JOB_HISTORY.START_DATE)))), 2)
     FROM JOB_HISTORY) AS AVG_YEARS_OF_SERVICE
FROM JOB_HISTORY;