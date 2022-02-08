SELECT * FROM `permutive-bigquery-staging.l2_challenge.pageviews` LIMIT 1000;  /*check results, shuld they be more than 20?*/

/*List of unique titles in pageviews from mynews.com domain.

The report should show the unique instances of titles for the specific domain requested. 
The SELECT DISTINCT clause retrieves all of the distinct titles included in the pageviews table, without taking into account duplicates. 
The WHERE clause filters the results and retrieves only the distinct instances associated to that domanin*/

SELECT DISTINCT title
from `permutive-bigquery-staging.l2_challenge.pageviews`
WHERE domain='mynews.com';

/*List of all pageviews (all columns) where user_id is replaced with Anonymous if the user tier is 0, Free if 1, Premium if 2. 
The report should show all of the columns of the "pageviews" table, however the user_id column should be replaced with a specific string value based on the tier the user belongs to. 
The tier is included in the users table and as mentioned in the assignment, the main table "pageviews" refers to "users" table using the foreign key "user_id". 
We can amend the values in the "user_id" column of the "pageviwes" table by referring to its foreign key in the "users" table, using the INNER JOIN clause which joins the entries on
the foreign key user_id.*/

SELECT pageviews.event_id, CASE
WHEN users.tier =0 THEN 'Anonymous'
WHEN users.tier =1 THEN 'Free'
ELSE 'Premium'
END AS user_id, pageviews.domain, pageviews.location, pageviews.date, pageviews.title, 
FROM `permutive-bigquery-staging.l2_challenge.users`as users
INNER JOIN
`permutive-bigquery-staging.l2_challenge.pageviews`as pageviews
ON pageviews.user_id=users.user_id
ORDER BY pageviews.event_id;

/*List date, title and country (null if no data on location is present) of all pageviews from `awesome.com` domain. 

The report should show two columns belonging to the "pageviews" table (date and title) and the user country, which can be found in the "locations" table. 
As mentioned in the assignment, "location" in the "pageviews" table - foreign key to the "locations" table - can be null. 
We can retrieve the values of the first two columns requested simply by selecting them. 
In regard to the location, I have used a LEFT JOIN, which allows to retrieve all of the results of the "location" column in the "pageviews" table- therefore also the null ones -
and joined the "pageviews" table on the foreign key "location".
The report shoul also be filtered for a specific domanin, therefore I added the WHERE clause to retrieve only the results linked to the domain 'awesome.com'. */

SELECT pageviews.date, pageviews.title, IFNULL(locations.country,'Null') AS country
FROM `permutive-bigquery-staging.l2_challenge.pageviews` AS pageviews
LEFT JOIN `permutive-bigquery-staging.l2_challenge.locations` as locations
ON pageviews.location = locations.location_id 
WHERE pageviews.domain = 'awesome.com'
ORDER BY pageviews.date;

/*List of domains and number of pageviews per domain.

The clause SELECT COUNT(*) allows to count all of the instances included in the report for a particular domain. 
The GROUP BY command groups the results according to the domain.*/ 

SELECT pageviews.domain, COUNT(*) as number_of_pageviews
FROM `permutive-bigquery-staging.l2_challenge.pageviews` AS pageviews
GROUP BY pageviews.domain;

/*Breakdown of domains and tiers (their id is enough) and number of pageviews per domain/tier combination. Sorted first by the domain and than tier (ascending).

The report should show the distinct domains and their tiers, which can be retrieved through a LEFT JOIN (can it be a normal join?) joining the user tiers to the domains in the "pageviews" table thanks to the foreign key "user_id". 
As there are multiple entries with the same domain, the GROUP command allows to show the results according to the combination domain/tier. The second part
of the query asks for the number of pageviews regarding each specific domain/tier combination, which can be found using the COUNT(*) command iin the initial SELECT statement.
I gave it an alias to make clear in the report what the third column is referring to. Finally, I ordered the results using the ORDER ASC commmand to make sure they 
are sorted first by domain and ascendentally by user tier.*/

SELECT pageviews.domain, users.tier, COUNT(*) as number_of_pageviews
FROM `permutive-bigquery-staging.l2_challenge.pageviews` AS pageviews
LEFT JOIN `permutive-bigquery-staging.l2_challenge.users`as users
ON pageviews.user_id=users.user_id
GROUP BY pageviews.domain, users.tier
ORDER BY pageviews.domain, users.tier ASC;