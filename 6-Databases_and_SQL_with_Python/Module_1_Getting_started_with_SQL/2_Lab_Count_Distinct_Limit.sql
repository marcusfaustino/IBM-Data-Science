SELECT * FROM FilmLocations LIMIT 1;

SELECT COUNT(Locations) FROM FilmLocations WHERE Director = "Woody Allen";
SELECT COUNT(Title) FROM FilmLocations WHERE Locations = "Russian Hill";
SELECT COUNT(*) FROM FilmLocations WHERE ReleaseYear < 1950;

SELECT DISTINCT Title, ReleaseYear  FROM FilmLocations WHERE ReleaseYear > 2000;
SELECT DISTINCT Director, Title FROM FilmLocations WHERE Locations = "City Hall";
SELECT COUNT(DISTINCT(Distributor)) FROM FilmLocations WHERE Actor1 = "Clint Eastwood";

SELECT DISTINCT Title FROM FilmLocations LIMIT 50;
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 10;
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear = 2015 LIMIT 3 OFFSET 5;