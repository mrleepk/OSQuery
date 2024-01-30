SELECT
   datetime,
   eventid,
   JSON_EXTRACT(data, '$.EventData.LogonType') AS LogonType,
   JSON_EXTRACT(data, '$.EventData.ProcessName') AS ProcessName,
   JSON_EXTRACT(data, '$.EventData.SubjectDomainName') AS SubjectDomainName,
   JSON_EXTRACT(data, '$.EventData.SubjectUserName') AS SubjectUserName,
   JSON_EXTRACT(data, '$.EventData.TargetUserName') AS TargetUserName
FROM sophos_windows_events
WHERE
   eventid = 4624
   AND
   JSON_EXTRACT(data, '$.EventData.LogonType') = '9'
   AND
   JSON_EXTRACT(data, '$.EventData.SubjectUserName') NOT LIKE '%$'
