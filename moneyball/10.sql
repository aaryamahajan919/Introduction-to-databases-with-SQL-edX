SELECT
    players.first_name,
    players.last_name,
    salaries.salary,
    performances.HR AS home_runs,
    performances.year
FROM
    performances
JOIN
    players ON performances.player_id = players.id
JOIN
    salaries ON performances.player_id = salaries.player_id AND performances.year = salaries.year
ORDER BY
    performances.player_id ASC,
    performances.year DESC,
    performances.HR DESC,
    salaries.salary DESC;
