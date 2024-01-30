WITH RDP_Data AS 
(
    SELECT 
        path
    FROM registry
    WHERE 
        path LIKE 'HKEY_USERS\%\Software\Microsoft\Terminal Server Client\Servers\%'
)
SELECT 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(mtime,'unixepoch')) AS 'Date/Time',
    REPLACE(key, regex_match(key, '(.+\\)', 0), '') AS 'Target IP/Device',
    data AS User,
    regex_match(registry.path, '(S-[0-9]+(-[0-9]+)+)', '') AS sid,
    users.username,
    key AS Key,
    registry.path AS Path
FROM 
    registry, 
    RDP_data
LEFT JOIN 
    users ON sid = users.uuid
WHERE 
    registry.path LIKE RDP_Data.path || '\%'
    AND
    Name = 'UsernameHint';
