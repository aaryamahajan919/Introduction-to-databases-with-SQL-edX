SELECT debut, first_name, last_name
FROM players
WHERE birth_city = 'Pittsburgh' AND birth_state = 'PA'
ORDER BY debut DESC, first_name, last_name;
