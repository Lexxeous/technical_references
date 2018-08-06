SQL Reference:

/* Comment */
/* KPI = Key Performance Indicator */
/* DAU = Daily Active Users */
  /* WAU = Weekly Active Users */
  /* MAU = Monthly Active Users*/
/* DARPPU = Daily Average Revenue Per Purchasing User */
  /*      = sum(revenue)/# purchases daily */
/* DARPU = Daily Average Revenue Per User */
  /*     = sum(revenue)/# of users */
/* CTE = Common Table Expression */
/* Retention = The number of players who returned the next ___ divided by the number of original players, per ___. */

sqlite3 -line db/development.sqlite3
.quit
/* use SQL commands to select desired data from the database */

/*---------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE table_name (
   column_1 data_type, 
   column_2 data_type, 
   column_3 data_type
);


CREATE TABLE celebs (
   id INTEGER, 
   name TEXT, 
   age INTEGER
);


CREATE TABLE awards 
(
  id INTEGER PRIMARY KEY, /* These columns are used to uniquely identify rows. Identical rows are prohibited. */
  recipient TEXT NOT NULL, /* must contain a value when row created */
  award_name TEXT DEFAULT "Grammy" /* sets the default value */
  another TEXT UNIQUE /* must have a different value for every row */
);

/*---------------------------------------------------------------------------------------------------------------------------*/

SELECT name,
  CASE
    WHEN genre = 'comedy' THEN 'Chill'
    WHEN genre = 'romance' THEN 'Chill'
    ELSE 'Intense'
 END AS 'Mood'
FROM movies ORDER BY name ASC;


SELECT
    CASE
        WHEN elevation < 250 THEN 'Low'
        WHEN elevation BETWEEN 250 AND 1749 THEN 'Medium'
        WHEN elevation >= 1750 THEN 'High'
        ELSE 'Unknown'
    END AS elevation_tier
    , COUNT(*)
FROM airports
GROUP BY 1;


SELECT
  CASE name
    WHEN 'kale-smoothie'    THEN 'smoothie'
    WHEN 'banana-smoothie'  THEN 'smoothie'
    WHEN 'orange-juice'     THEN 'drink'
    WHEN 'soda'             THEN 'drink'
    WHEN 'blt'              THEN 'sandwich'
    WHEN 'grilled-cheese'   THEN 'sandwich'
    WHEN 'tikka-masala'     THEN 'dinner'
    WHEN 'chicken-parm'     THEN 'dinner'
    ELSE 'other'
  END AS category, 
  round(1.0 * sum(amount_paid) / (SELECT sum(amount_paid) FROM order_items) * 100, 2) AS pct
FROM order_items
GROUP BY 1
ORDER BY 2 DESC;


SELECT state, COUNT(),
    COUNT(CASE WHEN elevation < 1000 THEN 1 ELSE NULL END) 
    AS count_low_elevation_airports 
FROM airports 
GROUP BY state
ORDER BY 3;


SELECT origin, 
sum(distance) AS total_flight_distance, 
sum(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END) AS total_delta_flight_distance 
FROM flights 
GROUP BY origin;


SELECT origin, 
    100.0*(sum(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END)/sum(distance))
    AS percentage_flight_distance_from_delta
    FROM flights 
GROUP BY origin;


SELECT state,
100.0*sum(CASE WHEN elevation >= 2000 THEN 1 ELSE 0 END)/ count(*)  
  AS percentage_high_elevation_airports 
FROM airports
GROUP BY state;

/*---------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO celebs (id, name, age) 
VALUES (1, 'Justin Bieber', 21);

/*---------------------------------------------------------------------------------------------------------------------------*/

SELECT * FROM tableName; /* selects all information from the the table */
SELECT colName1, colName2, ... FROM tableName /* selects only a certain column of info from the table */
SELECT DISTINCT colName FROM tableName; /* removes duplicates and includes NULL type */
SELECT name AS 'Movies' FROM movies; /* returns */
SELECT colName FROM celebs WHERE twitter_handle IS NOT NULL; /* filtering using the WHERE keyword */
SELECT * FROM tableName WHERE colName LIKE 'Se_en'; /*  '_' as a wildcard character */
SELECT * FROM tableName WHERE colName LIKE '%man%'; /* '%' as a wildcard character for colName that contain the string "man" */
/* A% for begins with 'A' */
/* a% for ends with 'a' */
/* The LIKE keyword is not case sensitive */
SELECT * FROM tableName WHERE colName BETWEEN 'D' AND 'G';
SELECT * FROM movies WHERE year BETWEEN 1990 AND 1999;
/* BETWEEN letters is not inclusive of the latter letter */
/* BETWEEN numbers is inclusive of the latter number */
SELECT * FROM tableName ORDER BY colName DESC; /* always put ORDER BY after WHERE but before LIMIT */
/* DESC will sort high to low */
/* ASC will sort low to high */
SELECT * FROM tableName LIMIT 10; /* the LIMIT keyword always goes at the very end of a query */
SELECT year, AVG(imdb_rating) FROM movies GROUP BY year ORDER BY year DESC;
/* SQL lets us use column reference(s) in GROUP BY that makes it easier */
/* where integer i refers to the i'th column in the SELECT statement rather than the explicti colName */
SELECT year, genre, COUNT(name) FROM movies GROUP BY 1, 2 HAVING COUNT(name) > 10;
/* HAVING is very similar to WHERE and comes after GROUP BY but before ORDER BY and LIMIT */
SELECT DATETIME(delivery_time) FROM baked_goods;
/* DATETIME returns the date-timestamp in the form of YYYY:MM:DD hh:mm:ss */
SELECT DATE(delivery_time), COUNT(*) AS count_baked_goods FROM baked_goods GROUP BY DATE(delivery_time);
/* DATE returns the datestamp in the form of YYY:MM::DD exlcusive from the timestamp */
SELECT DATETIME(delivery_time, '+5 hours', '20 minutes', '2 days') AS package_time FROM baked_goods;
/* can use DATETIME to look into the future by specific time amounts */
SELECT first_name || ' ' || last_name AS full_name FROM bakeries ORDER BY full_name ASC;
/* string concatenation is acheived by this weird 3 part operator: ||''|| */
/* put whatever you want to be in the middle of the strings inside the single quotes ; most often a single space */
SELECT DATE(ordered_at), COUNT(1) FROM orders GROUP BY 1 ORDER BY 1;
/* can also reference the colName inside othere colName functions ; aggregation */
SELECT name, round(sum(amount_paid) / (SELECT sum(amount_paid) FROM order_items) * 100.0, 2) AS "Pct" FROM order_items GROUP BY 1 ORDER BY 2 DESC;
/* using sub-query calculations for more advanced aggregation */
SELECT DATE(created_at), platform, COUNT(DISTINCT user_id) AS "DAU" FROM gameplays GROUP BY 1,2 ORDER BY 1,2;
/* selects the distinct DAUs for each day for each gaming platform and ordered accordingly */
SELECT DATE(created_at), ROUND(SUM(price) / COUNT(distinct user_id), 2) AS "DARPPU" FROM purchases WHERE refunded_at IS NULL GROUP BY 1 ORDER BY 1;
/* computatoin of DARPPU */

/*---------------------------------------------------------------------------------------------------------------------------*/

SELECT *
FROM orders
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';
/* JOIN statements merge the rows */

SELECT *
FROM newspaper
LEFT JOIN online /* LEFT JOIN keeps all rows from the first table regardless of whether there is a match in the second table */
  ON newspaper.id = online.id;

SELECT *
FROM classes
JOIN students
  ON classes.id = students.class_id; /* primary_key = foreign_key */

SELECT *
FROM table1
UNION /* tables must have the same number of cols and the cols must have the same data types in the same order as table1 */
SELECT *
FROM table2;
/* UNION statements merge the columns */
/* must use UNION ALL to allow duplicates */

/* template of a CTE */
WITH previous_results AS 
(
    SELECT ...
)
SELECT *
FROM previous_results
JOIN other_table
  ON ... = ...;


/* examples of CTE */
WITH daily_revenue AS 
(
  SELECT
    DATE(created_at) AS dt,
    ROUND(SUM(price), 2) AS rev
  FROM purchases
  WHERE refunded_at IS NULL
  GROUP BY 1
)
SELECT * FROM daily_revenue ORDER BY dt;


WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;


/* computing DARPU */
WITH daily_revenue AS 
(
  SELECT
    DATE(created_at) AS dt,
    ROUND(SUM(price), 2) AS rev
  FROM purchases
  WHERE refunded_at IS NULL
  GROUP BY 1
), 
daily_players AS 
(
  SELECT
    DATE(created_at) AS dt,
    COUNT(distinct user_id) AS players
  FROM gameplays
  GROUP BY 1
)
SELECT
  daily_revenue.dt,
  daily_revenue.rev / daily_players.players AS "DARPU"
FROM daily_revenue
  JOIN daily_players USING (dt);
/* in this case the JOIN has a USING clause for a special case */
/* when both columns to join have the same name in both tables, USING (colName) is then equivalent to the alternative */
/* The alternative being:
FROM daily_revenue
  JOIN daily_players ON
    daily_revenue.dt = daily_players.dt;
*/


/* calculating retention */
SELECT
  DATE(g1.created_at) AS dt,
  ROUND(100 * COUNT(distinct g2.user_id) /
    COUNT(distinct g1.user_id)) AS retention
FROM gameplays AS g1
  LEFT JOIN gameplays AS g2 ON
    g1.user_id = g2.user_id
    AND DATE(g1.created_at) = DATE(DATETIME(g2.created_at, '-1 day'))
GROUP BY 1
ORDER BY 1
LIMIT 100;


SELECT * 
FROM tableName1 
WHERE colName1 IN 
(
    SELECT colName2 
    FROM tableName2 
    WHERE condCol > 2000
);


SELECT a.dep_month,
       a.dep_day_of_week,
       AVG(a.flight_distance) AS average_distance
  FROM (
        SELECT dep_month,
              dep_day_of_week,
               dep_date,
               sum(distance) AS flight_distance
          FROM flights
         GROUP BY 1,2,3
       ) a
 GROUP BY 1,2
 ORDER BY 1,2;


 SELECT origin, id,
    (
      SELECT COUNT(*)
      FROM flights AS f
      WHERE f.id < flights.id
      AND f.origin = flights.origin
    ) + 1
    AS flight_sequence_number
    FROM flights;


SELECT id, AVG(a.sale_price) AS 'Avg_Price' FROM 
(
  SELECT id, sale_price FROM order_items
  UNION ALL
  SELECT id, sale_price FROM order_items_historic
) AS a 
  GROUP BY 1;


SELECT category FROM new_products
INTERSECT /* returns only rows that are identical from the first to the second SELECT statement */
SELECT category FROM legacy_products;


SELECT category FROM legacy_products
EXCEPT /* returns only rows that are not included from the first to the second SELECT statement */
SELECT category FROM new_products;


SELECT name, 
round(1.0*COUNT(distinct order_id) /
  COUNT(distinct orders.delivered_to), 2) AS reorder_rate
FROM order_items
  JOIN orders ON
    orders.id = order_items.order_id
GROUP BY 1
ORDER BY 2 DESC;
/* if reorder_rate is low -> first purchases ; if reorder_rate is high -> reorders */

/*---------------------------------------------------------------------------------------------------------------------------*/

UPDATE celebs /* updates the specified value at (col,row) */
SET age = 22 
WHERE id = 1; 

/*---------------------------------------------------------------------------------------------------------------------------*/

ALTER TABLE celebs ADD COLUMN twitter_handle TEXT; /* obvious */
/* upon creation and non initialization, all unknown or missing values are simply NULL */

/*---------------------------------------------------------------------------------------------------------------------------*/

DELETE FROM celebs WHERE twitter_handle IS NULL; /* manipulation */

/*---------------------------------------------------------------------------------------------------------------------------*/

COUNT(): /* count the number of rows */
SUM(): /* the sum of the values in a column */
MAX()/MIN(): /* the largest/smallest value */
AVG(): /* the average of the values in a column */
ROUND(arg, numDecimalPlaces): /* round the values in the column */
CAST(type1 AS type2); /* just like other datatype casting */
REPLACE(stringCol,from_this,to_that)

/*---------------------------------------------------------------------------------------------------------------------------*/

