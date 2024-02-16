SELECT 
path,
name, 
data,
u.username,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS last_modified_time
FROM registry
LEFT JOIN users u ON data = u.uuid
WHERE
key LIKE 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData\%'
