SELECT
   strftime('%Y-%m-%dT%H:%M:%SZ', datetime) AS Datetime, 
   eventid AS EventID, 
   CASE
      WHEN eventid = 4624 THEN eventid || ' - Successful Login' 
      WHEN eventid = 4625 THEN eventid || ' - Failed login' 
   END AS Description, 
   'Security' AS Source, 
   JSON_EXTRACT(data, '$.EventData.TargetUserName') AS Username, 
   JSON_EXTRACT(data, '$.EventData.WorkstationName') AS WorkstationName, 
   JSON_EXTRACT(data, '$.EventData.IpAddress') AS Source_IP, 
   JSON_EXTRACT(data, '$.EventData.ProcessName') AS Process_Name, 
   JSON_EXTRACT(data, '$.EventData.LogonType') AS Logon_Type, 
   JSON_EXTRACT(data, '$.EventData.TargetUserSid') AS User_SID
FROM sophos_windows_events 
WHERE 
   source = 'Security'
   AND (eventid = 4624 OR eventid = 4625)
   AND regex_match(WorkstationName, '^[A-Za-z0-9]{16}$', 0);
