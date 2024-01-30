SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime) AS Datetime,
    eventid AS EventID,
    JSON_EXTRACT(data, '$.EventData.Category Name') AS Name,
    JSON_EXTRACT(data, '$.EventData.Detection Time') AS 'Detection Time',
    JSON_EXTRACT(data, '$.EventData.Detection User') AS 'Detection User',
    JSON_EXTRACT(data, '$.EventData.Process Name') AS 'Parent Process Name',
    JSON_EXTRACT(data, '$.EventData.Origin Name') AS 'Origin Name',
    JSON_EXTRACT(data, '$.EventData.Path') AS Path,
    JSON_EXTRACT(data, '$.EventData.Threat Name') AS 'Threat Name'
FROM
    sophos_windows_events swe
WHERE
    swe.source = 'Microsoft-Windows-Windows Defender/Operational'
    AND eventid IN ('1116');
