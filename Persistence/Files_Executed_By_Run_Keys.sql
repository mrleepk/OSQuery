SELECT
    CAST(datetime(time, 'unixepoch') AS TEXT) AS 'Datetime',
    JSON_EXTRACT(data, '$.EventData.Command') AS Command
FROM
    sophos_windows_events
WHERE
    source = 'Microsoft-Windows-Shell-Core/Operational'
    AND eventid = 9707
