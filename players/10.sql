SELECT first_name AS "First Name",
       last_name AS "Last Name",
       height AS "Height"
FROM players
WHERE birth_city = 'New York' AND height > 72
ORDER BY height DESC, first_name;
