-- Accessing multiple tables with subqueries:
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000 );

-- Accessing multiple tables with Implicit Joins:
SELECT *
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

-- Practice Problems:

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

-- Using sub-queries

SELECT * 
FROM EMPLOYEES 
WHERE EMPLOYEES.JOB_ID IN (SELECT JOBS.JOB_IDENT 
                           FROM JOBS 
                           WHERE JOBS.JOB_TITLE = 'Jr. Designer');

-- Using Implicit Joins

SELECT * 
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT 
AND J.JOB_TITLE = 'Jr. Designer';

-- Retrieve JOB information and a list of employees whose birth year is after 1976.

-- Using sub-queries

SELECT *
FROM JOBS
WHERE JOBS.JOB_IDENT IN (SELECT EMPLOYEES.JOB_ID
                         FROM EMPLOYEES
                         WHERE EMPLOYEES.B_DATE > 1976);

-- Using implicit join

SELECT J.JOB_IDENT, J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY
FROM JOBS J, EMPLOYEES E
WHERE J.JOB_IDENT = E.JOB_ID
AND E.B_DATE > 1976;