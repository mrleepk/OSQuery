SELECT 
    pid AS "PID",
    name AS "Process_Name",
    path AS "Path",
    cmdline AS "CMDLine",
    parent AS "Parent_PID",
    CASE 
        WHEN on_disk = 1 THEN 'Yes' 
        ELSE 'No' 
    END AS "On_Disk",
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(start_time, 'unixepoch')) AS "Start_Time"
FROM 
    processes 
WHERE
    (
        LOWER(cmdline) LIKE '% tcp 139 %'
        OR LOWER(cmdline) LIKE '% tcp 445 %'
        OR LOWER(cmdline) LIKE '% tcp 3389 %'
        OR LOWER(cmdline) LIKE '% tcp 5985 %'
        OR LOWER(cmdline) LIKE '% tcp 5986 %'
    )
    OR (
        LOWER(cmdline) LIKE '% start %'
        AND LOWER(cmdline) LIKE '%--all %'
        AND LOWER(cmdline) LIKE '%--config %'
        AND LOWER(cmdline) LIKE '%.yml%'
    )
    OR (
        LOWER(name) = 'ngrok.exe'
        AND LOWER(cmdline) LIKE '% tcp %'
        AND LOWER(cmdline) LIKE '% http %'
        AND LOWER(cmdline) LIKE '% authtoken %'
    );
