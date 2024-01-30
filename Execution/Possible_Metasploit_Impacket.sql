SELECT
   datetime,
   eventid,
   JSON_EXTRACT(data, '$.EventData.AccountName') AS AccountName,
   JSON_EXTRACT(data, '$.EventData.ServiceName') AS ServiceName,
   JSON_EXTRACT(data, '$.EventData.ImagePath') AS ImagePath,
   JSON_EXTRACT(data, '$.EventData.ServiceType') AS ServiceType,
   JSON_EXTRACT(data, '$.EventData.StartType') AS StartType
FROM sophos_windows_events
WHERE 
   source = 'System'
   AND eventid = 7045
   AND (
      regex_match(ImagePath, '^%systemroot%\\[a-zA-Z]{8}\.exe$', 0) 
      OR regex_match(ServiceName, '(^[a-zA-Z]{4}$)|(^[a-zA-Z]{8}$)|(^[a-zA-Z]{16}$)', 0)
   )
