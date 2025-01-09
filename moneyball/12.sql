SELECT DISTINCT
    players.first_name,
    players.last_name
FROM
    performances
JOIN
    players ON performances.player_id = players.id
JOIN
    salaries ON performances.player_id = salaries.player_id AND performances.year = salaries.year
WHERE
    performances.year = 2001
AND
    performances.player_id IN (
        SELECT player_id
        FROM (
            SELECT
                performances.player_id,
                (salaries.salary / performances.H) AS dollars_per_hit
            FROM
                performances
            JOIN
                salaries ON performances.player_id = salaries.player_id AND performances.year = salaries.year
            WHERE
                performances.year = 2001 AND performances.H > 0
            ORDER BY
                dollars_per_hit ASC
            LIMIT 10
        ) AS least_expensive_per_hit
    )
AND
    performances.player_id IN (
        SELECT player_id
        FROM (
            SELECT
                performances.player_id,
                (salaries.salary / performances.RBI) AS dollars_per_rbi
            FROM
                performances
            JOIN
                salaries ON performances.player_id = salaries.player_id AND performances.year = salaries.year
            WHERE
                performances.year = 2001 AND performances.RBI > 0
            ORDER BY
                dollars_per_rbi ASC
            LIMIT 10
        ) AS least_expensive_per_rbi
    )
ORDER BY
    players.last_name ASC,
    players.first_name ASC;
