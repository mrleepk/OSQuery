WITH File_List AS (
    SELECT * 
    FROM file 
    WHERE
        path LIKE 'C:\Users\%\AppData\LocalLow\Microsoft\CryptnetUrlCache\%%'
        OR path LIKE 'C:\Windows\System32\config\AppData\LocalLow\Microsoft\CryptnetUrlCache\%%'
        OR path LIKE 'C:\Windows\Syswow64\config\AppData\LocalLow\Microsoft\CryptnetUrlCache\%%'
)

SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.btime, 'unixepoch')) AS 'First_Created_On_Disk(btime)', 
    f.path AS path,
    f.filename AS filename,
    (
        SELECT CAST(GROUP_CONCAT(line, CHAR(10)) AS TEXT) 
        FROM grep g 
        WHERE g.pattern IN (' ') AND g.path = f.path
    ) AS line
FROM File_List f
WHERE line != ''
