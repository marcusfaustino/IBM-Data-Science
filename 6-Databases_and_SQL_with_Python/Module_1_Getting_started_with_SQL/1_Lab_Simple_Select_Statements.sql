SELECT FunFacts, Locations FROM FilmLocations;
SELECT Title, Locations, ReleaseYear FROM FilmLocations WHERE ReleaseYear <= 2000;
SELECT Title, ProductionCompany, Locations, ReleaseYear FROM FilmLocations WHERE Writer <> "James Cameron";