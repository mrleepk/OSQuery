SELECT
   datetime,
   eventid,
   data
FROM sophos_windows_events
WHERE 
   source = 'System'
   AND eventid IN ('5805', '5723')
   AND (
      data LIKE '%kali%'
      OR data LIKE '%mimikatz%'
   )

UNION ALL

SELECT
   datetime,
   eventid,
   data
FROM sophos_windows_events
WHERE 
   source = 'System'
   AND eventid IN ('5823')
   AND data LIKE '%changed%password%';
