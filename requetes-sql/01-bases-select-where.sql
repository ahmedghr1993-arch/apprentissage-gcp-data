-- =====================================================================
-- Session 01 — Bases : SELECT, WHERE, GROUP BY, ORDER BY, LIMIT
-- Source : dataset public bigquery-public-data.usa_names
-- =====================================================================


-- ---------------------------------------------------------------------
-- 1. Top 10 des prénoms masculins depuis 1910
-- Volume traité : ~113 Mo
-- ---------------------------------------------------------------------
SELECT name, SUM(number) AS total
FROM `bigquery-public-data.usa_names.usa_1910_current`
WHERE gender = 'M'
GROUP BY name
ORDER BY total DESC
LIMIT 10;


-- ---------------------------------------------------------------------
-- 2. Même requête pour les prénoms féminins
-- Seule modification : la valeur du filtre gender
-- ---------------------------------------------------------------------
SELECT name, SUM(number) AS total
FROM `bigquery-public-data.usa_names.usa_1910_current`
WHERE gender = 'F'
GROUP BY name
ORDER BY total DESC
LIMIT 10;


-- ---------------------------------------------------------------------
-- 3. Top 5 des prénoms masculins pour la seule année 2000
-- Nouveauté : deux conditions combinées avec AND
-- ---------------------------------------------------------------------
SELECT name, SUM(number) AS Total
FROM `bigquery-public-data.usa_names.usa_1910_current`
WHERE gender = 'M' AND year = 2000
GROUP BY name
ORDER BY Total DESC
LIMIT 5;
