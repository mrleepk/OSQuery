WITH RECURSIVE for(x) AS (
   VALUES (CAST($$Start Search From$$ AS INT))
   UNION ALL
   SELECT x + 1200 FROM for WHERE x < (CAST($$Start Search From$$ AS INT) + (CAST($$Number of Hours of activity to search$$ AS INT) * 3600))
)

SELECT
    CAST(strftime('%Y-%m-%dT%H:%M:%SZ', datetime(spj.time, 'unixepoch')) AS TEXT) AS DATE_TIME,
    (SELECT spj2.path FROM sophos_process_journal spj2 WHERE spj2.sophos_pid = spj.parent_sophos_pid) AS Parent_Path,
    (SELECT spj2.process_name FROM sophos_process_journal spj2 WHERE spj2.sophos_pid = spj.parent_sophos_pid) AS Parent_Process_Name,
    spj.path AS Path,
    spj.process_name AS Process_Name,
    spj.cmd_line AS Cmd_Line,
    u.username AS Username,
    spj.sha256 AS sha256
FROM for
LEFT JOIN sophos_process_journal spj ON spj.time >= for.x AND spj.time <= for.x + 1200
JOIN users u ON spj.sid = u.uuid
WHERE event_type = 0;

