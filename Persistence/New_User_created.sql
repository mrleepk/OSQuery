SELECT
   source,
   eventid,
   CAST(datetime(time, 'unixepoch') AS TEXT) AS 'Change Made',
   JSON_EXTRACT(data, '$.EventData.SubjectUserName') AS 'Who Made The Change',
   JSON_EXTRACT(data, '$.EventData.TargetUserName') AS 'New User'
FROM sophos_windows_events
WHERE source = 'Security'
   AND eventid = 4720;
