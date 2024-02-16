-- Pulls data from the registry regarding currently active RDP sessions. The ClientName key specifies the hostname of the connecting machine.
SELECT 
path,
name, 
data,
u.username,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS last_modified_time
FROM registry
LEFT JOIN users u ON data = u.uuid
WHERE
key LIKE 'HKEY_USERS\%\Volatile Environment\%%'
