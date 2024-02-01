SELECT
   datetime,
   eventid,
   JSON_EXTRACT(data, '$.EventData.Name') AS Type,
   JSON_EXTRACT(data, '$.EventData.Value') AS "IP/Hostname"
FROM sophos_windows_events
WHERE
   source = 'Microsoft-Windows-TerminalServices-RDPClient/Operational'
   AND eventid IN(1024,1102)
