-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
<<<<<<< HEAD
INSERT INTO film_actor(film_id,actor_id)
VALUES(1001,201)
INSERT INTO film_actor(film_id,actor_id)
VALUES(1001,202)
=======
INSERT INTO [dbo].[city]
           ([name]
           ,[countrycode]
           ,[district]
           ,[population])
     VALUES
           ('Smallville',
           'USA',
           'Kansas', 
           45001)

>>>>>>> 14589b62d3768265182ec769a5cbce4ce07cb1cf
-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

INSERT INTO [dbo].[countrylanguage]
           ([countrycode]
           ,[language]
           ,[isofficial]
           ,[percentage])
     VALUES
           ('USA',
           'Kryptonese',
           0,
           .0001)   

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

UPDATE [dbo].[countrylanguage]
   SET 
      [language] = ('Krypto-babble')     
 WHERE language = 'Kryptonese'

-- 4. Set the US captial to Smallville, Kansas in the country table.

UPDATE [dbo].[country]
SET [capital]= 4080
WHERE code = 'USA';

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE FROM [dbo].[city]
      WHERE name = 'Smallville'

It did not succeed because Smallville is a foreign key in country table.
-- 6. Return the US captial to Washington.

UPDATE [dbo].[country]
SET [capital]= 3813
WHERE code = 'USA';

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE FROM [dbo].[city]
      WHERE name = 'Smallville'

Yes because Smallville is no longer reference for foreign key in country table.

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)


UPDATE [dbo].[countrylanguage]
   SET isofficial = 
   (case when isofficial = 0 THEN 1
   when isofficial = 1 THEN 0 END)
FROM countrylanguage
JOIN country c on c.code = countrylanguage.countrycode
WHERE indepyear between 1800 and 1972      

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4068 rows affected)

UPDATE [dbo].[city]
   SET population = 
   (case when population <1000 THEN 1
   else ROUND(population/1000, 0)end)

-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

UPDATE [dbo].[country]
   SET [surfacearea]= surfacearea*1609.34
FROM country
JOIN countrylanguage cl on cl.countrycode = country.code      
WHERE language = 'French' and percentage > 20

