SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime) AS "Datetime",
    eventid,
    JSON_EXTRACT(data, '$.EventData.ModifyingUser') AS "ModifyingUser",
    users.username,
    JSON_EXTRACT(data, '$.EventData.EmbeddedContext') AS "EmbeddedContext", 
    JSON_EXTRACT(data, '$.EventData.ModifyingApplication') AS "ModifyingApplication", 
    JSON_EXTRACT(data, '$.EventData.RemoteAddresses') AS "RemoteAddresses", 
    JSON_EXTRACT(data, '$.EventData.RemotePorts') AS "RemotePorts", 
    JSON_EXTRACT(data, '$.EventData.RuleName') AS "RuleName" 
FROM 
    sophos_windows_events
LEFT JOIN 
    users ON ModifyingUser = users.uuid
WHERE 
    source = 'Microsoft-Windows-Windows Firewall With Advanced Security/Firewall';
