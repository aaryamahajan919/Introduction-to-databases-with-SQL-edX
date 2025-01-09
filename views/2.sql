SELECT
    average_color AS "Average Color"
FROM
    views
WHERE
    artist = 'Hokusai'
    AND english_title LIKE '%river%';
