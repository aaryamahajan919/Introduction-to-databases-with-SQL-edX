SELECT
    COUNT(*) AS "Number of Prints Referring to Eastern Capital or Edo"
FROM
    views
WHERE
    artist = 'Hiroshige'
    AND (english_title LIKE '%Eastern Capital%' OR english_title LIKE '%Edo%');
