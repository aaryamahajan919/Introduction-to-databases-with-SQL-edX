SELECT
    COUNT(*) AS "Number of Prints with 'Fuji' in Title"
FROM
    views
WHERE
    artist = 'Hokusai'
    AND english_title LIKE '%Fuji%';
