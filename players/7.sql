SELECT COUNT(*) AS count_of_players
FROM players
WHERE (bats = 'R' AND throws = 'L')
    OR (throws = 'R' AND bats = 'L');
