-- How many entries in the database are from Africa?
SELECT COUNT(*) AS number_of_african_countries FROM countries WHERE continent = 'Africa'; 

-- What was the total population of Oceania in 2005?
SELECT SUM(population) FROM population_years 
INNER JOIN countries ON population_years.country_id = countries.id 
WHERE countries.continent = 'Oceania' AND population_years.year = 2005; 

-- What is the average population of countries in South America in 2003?
SELECT AVG(population) FROM population_years 
INNER JOIN countries ON population_years.country_id = countries.id 
WHERE countries.continent = 'South America' AND population_years.year = 2003 ; 

-- What country had the smallest population in 2007?
SELECT name FROM countries 
INNER JOIN population_years on population_years.country_id = countries.id 
WHERE population_years.year = 2007 AND population = (SELECT MIN(population) FROM population_years WHERE year = 2007); 

-- What is the average population of Poland during the time period covered by this dataset?
SELECT AVG(population) FROM population_years 
INNER JOIN countries on population_years.country_id = countries.id 
WHERE countries.name = 'Poland' AND year > (SELECT MIN(year) FROM population_years) AND year < (SELECT MAX(year) FROM population_years) ; 

-- How many countries have the word "The" in their name?
SELECT name FROM countries WHERE name LIKE '%The%' ; 

-- What was the total population of each continent in 2010?
SELECT DISTINCT continent, SUM(population) AS total_population FROM population_years 
INNER JOIN countries on population_years.country_id = countries.id GROUP BY continent ; 

