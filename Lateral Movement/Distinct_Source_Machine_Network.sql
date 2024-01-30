SELECT
DISTINCT(JSON_EXTRACT(data, '$.EventData.WorkstationName')) AS Source_Machine_Network
FROM sophos_windows_events 
WHERE source = 'Security'
AND (eventid = 4624 OR eventid = 4625)
AND time > $$begin$$
