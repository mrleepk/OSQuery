SELECT
   datetime,
   eventid,
   data
FROM sophos_windows_events
WHERE
   source = 'Security'
   AND eventid IN(5379)
   AND data like '%ZipFolder%'
