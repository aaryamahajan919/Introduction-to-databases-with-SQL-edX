SELECT COUNT(*) AS episode_count
FROM episodes
WHERE air_date >= '2002-01-01' AND air_date <= '2005-12-31'
AND topic LIKE '%Measurement%';
