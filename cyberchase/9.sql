SELECT COUNT(*) AS episode_count
FROM episodes
WHERE air_date >= '2002-01-01' AND air_date <= '2007-12-31';
