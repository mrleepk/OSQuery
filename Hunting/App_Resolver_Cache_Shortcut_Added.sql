	SELECT
	   CAST(datetime(time, 'unixepoch') AS TEXT) AS 'DATE_TIME',
	   JSON_EXTRACT(data, '$.EventData.AppID') AS AppID,
	   JSON_EXTRACT(data, '$.EventData.Name') AS Name
	FROM sophos_windows_events
	WHERE
	   source = 'Microsoft-Windows-Shell-Core/Operational'
	   AND eventid = 28115 


