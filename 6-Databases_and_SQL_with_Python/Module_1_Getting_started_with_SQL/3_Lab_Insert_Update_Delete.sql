INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(8, 'Ryan', 'Steve', 'Barlby', 'GB'), (9, 'Sannaredy', 'Ramesh', 'Hyderabad', 'IN');

UPDATE Instructor 
SET city='Markham'
WHERE ins_id=1;

UPDATE Instructor 
SET city='Dhaka', country='BD' 
WHERE ins_id=4;

DELETE FROM instructor
WHERE ins_id = 3;

SELECT * FROM Instructor;