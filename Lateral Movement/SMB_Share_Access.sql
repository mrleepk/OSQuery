SELECT
   datetime,
   eventid,
   source,
   JSON_EXTRACT(data, '$.EventData.IpAddress') AS IpAddress,
   JSON_EXTRACT(data, '$.EventData.ObjectType') AS ObjectType,
   JSON_EXTRACT(data, '$.EventData.ShareLocalPath') AS ShareLocalPath,
   JSON_EXTRACT(data, '$.EventData.ShareName') AS ShareName,
   JSON_EXTRACT(data, '$.EventData.SubjectDomainName') AS SubjectDomainName,
   JSON_EXTRACT(data, '$.EventData.SubjectLogonId') AS SubjectLogonId,
   JSON_EXTRACT(data, '$.EventData.SubjectUserName') AS SubjectUserName,
   JSON_EXTRACT(data, '$.EventData.SubjectUserSid') AS SubjectUserSid
FROM sophos_windows_events
WHERE
   source = 'Security'
   AND
   eventid IN(5140)
