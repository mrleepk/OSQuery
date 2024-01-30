SELECT
    JSON_EXTRACT(data, '$.EventData.TargetUserName') as Username,
    JSON_EXTRACT(data, '$.EventData.WorkstationName') as Source_Workstation_Name,
    COUNT(*) as Count
FROM
    sophos_windows_events 
WHERE
    source = 'Security'
    AND eventid = 4625
GROUP BY
    JSON_EXTRACT(data, '$.EventData.TargetUserName'), JSON_EXTRACT(data, '$.EventData.WorkstationName');
