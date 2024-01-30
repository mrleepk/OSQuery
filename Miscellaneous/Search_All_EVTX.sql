WITH evtx_files AS (
    SELECT
        filename
    FROM 
        file
    WHERE 
        path LIKE 'C:\Windows\System32\winevt\Logs\%'
        AND filename LIKE '%.evtx'
)

SELECT
    datetime,
    eventid,
    source,
    data
FROM
    sophos_windows_events
WHERE 
    source IN (SELECT replace(replace(filename, '.evtx', ''), '%4', '/') FROM evtx_files)
    AND time > $$begin$$
    AND time < $$end$$
    AND data LIKE '%$$value$$%';
