SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ',datetime) AS Datetime,
    source,
    eventid,
data
FROM sophos_windows_events
WHERE
    source = 'Security' 
AND eventid = 4611
AND data LIKE '%User32LogonProcesss%'
