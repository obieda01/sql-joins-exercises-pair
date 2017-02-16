-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
--    Expected rows: 36

SELECT city.name, city.population, country.name from city
JOIN country on city.countrycode = country.code
WHERE city.population>1000000 and continent = 'Europe';

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
--    Expected rows: 2

SELECT city.name, city.population, country.name from city
JOIN country on city.countrycode = country.code
JOIN countrylanguage cl on country.code = cl.countrycode
WHERE city.population>1000000 and language = 'French' and isofficial = 'true';

-- 3. The name of the countries and continents where the language Javanese is spoken
--    Expected rows: 1

SELECT name, continent from country
JOIN countrylanguage cl on cl.countrycode = country.code
WHERE language = 'Javanese';


-- 4. The names of all of the countries in Africa that speak French as an official language
--    Expected rows: 5

SELECT name, continent from country
JOIN countrylanguage cl on cl.countrycode = country.code
WHERE language = 'French' and continent = 'Africa' and isofficial = 'true';

-- 5. The average city population of cities in Europe
--    Expected: 287,684

SELECT AVG(city.population) from city
JOIN country c on city.countrycode = c.code
WHERE continent = 'Europe';

-- 6. The average city population of cities in Asia
--    Expected: 395,019

SELECT AVG(city.population) from city
JOIN country c on city.countrycode = c.code
WHERE continent = 'Asia';

-- 7. The number of cities in countries where English is an official language
--    Expected: 523

SELECT count(name) from city
JOIN countrylanguage cl on cl.countrycode = city.countrycode
WHERE language = 'English' and isofficial = 'true';

-- 8. The average population of cities in countries where the official language is English
--    Expected: 285,809

SELECT avg(city.population) from city
JOIN countrylanguage cl on cl.countrycode = city.countrycode
JOIN country c on c.code = city.countrycode
WHERE language = 'English' and isofficial = 'true';

-- 9. The names of all of the continents and the population of the continent’s largest city
--    Expected rows: 6, largest population for North America: 8,591,309


SELECT MAX (city.population), continent from city 
JOIN country c on c.code = city.countrycode
GROUP by continent
ORDER by MAX(city.population) DESC;


-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
--     Expected rows: 29

SELECT city.name, language from city
JOIN countrylanguage cl on cl.countrycode = city.countrycode
JOIN country c on c.code= city.countrycode
WHERE continent = 'South America' and city.population >1000000 and isofficial = 'true';