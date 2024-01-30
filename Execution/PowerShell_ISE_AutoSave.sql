WITH File_List AS (
    SELECT * 
    FROM file 
    WHERE path LIKE 'C:\Users\%\AppData\%\Microsoft_Corporation\Powershell_ISE.exe\%\AutoSaveFiles\%.ps1'
)

SELECT 
    f.path AS "Path",
    f.filename AS "Filename",
    (
        SELECT CAST(GROUP_CONCAT(line, CHAR(10)) AS TEXT) 
        FROM grep g 
        WHERE g.pattern IN (' ') AND g.path = f.path
    ) AS "Line"
FROM File_List f;
