SELECT
    english_title AS "Title",
    entropy AS "Entropy Value"
FROM
    views
WHERE
    artist = 'Hokusai'
ORDER BY
    entropy DESC
LIMIT 8;
