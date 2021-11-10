/**********************************************************************
 * NAME: Daniel Hoberman
 * CLASS: CPSC 321
 * DATE: 11/8/2021
 * HOMEWORK: HW7
 * DESCRIPTION: SQL Queries
 **********************************************************************/


-- TODO: add queries with comments below

SELECT AVG(gdp), AVG(inflation) -- Question A (Done)
FROM country;

SELECT SUM(p.area), AVG(p.area) -- Question B (Done)
FROM country c, province p
WHERE c.country_code = p.country_code AND c.country_name = 'Mexico';

SELECT AVG(k.population_) -- Question C (Done)
FROM country c, city k
WHERE c.country_code = k.country_code AND c.gdp >= 100 AND c.inflation < 5;

SELECT SUM(k.population_) -- Question D (Done)
FROM province p, country c, city k
WHERE c.country_code = p.country_code = k.country_code AND p.area <= 200000 AND c.inflation < 5;



SELECT AVG(k1.population_) -- This one is confusing me
FROM city k1, city k2, province p
WHERE k2.province_name = p.province_name AND k2.city_name = 'Spokane' AND k1.province_name =p.province_name AND k1.city_name != k2.city_name 



SELECT COUNT(b.country_code_1), AVG(b.border_length) -- QUESTION F (Done)
FROM border b
WHERE b.country_code_1 ='USA';

CREATE VIEW SymmetricBorder AS  -- Question G (Done)
SELECT b.country_code_1, b.country_code_2, b.border_length
FROM border b
UNION
SELECT b.country_code_2, b.country_code_1, b.border_length
FROM border b;




SELECT COUNT(*) -- Question H (Done) (Should double check this is correct)
FROM SymmetricBorder s, country c1, country c2
WHERE c1.country_code = s.country_code_1 AND c2.country_code=s.country_code_2 AND c1.gdp < c2.gdp AND c1.inflation> c2.inflation;

SELECT c1.country_code, c2.country_code, c1.inflation, c1.gdp, c2.inflation, c2.gdp -- QUESTION I (Not sure)
FROM SymmetricBorder s, country c1, country c2
ORDER BY c1.country_code, c2.inflation ASC, c2.gdp DESC, c2.country_code
WHERE c1.country_code = s.country_code_1 AND c2.country_code=s.country_code_2 AND c1.inflation < (c2.inflation * .9) AND c1.gdp > (c2.gdp *1.2);

-- SELECT  -- QUESTION J (Not Sure)


