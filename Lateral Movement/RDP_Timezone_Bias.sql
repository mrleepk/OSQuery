SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime) AS "Datetime",
    source,
    eventid,
    JSON_EXTRACT(data, '$.EventData.TimezoneBiasHour') AS "TimezoneBiasHour"
FROM 
    sophos_windows_events
WHERE
    source = 'Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational' 
    AND eventid IN (104)
