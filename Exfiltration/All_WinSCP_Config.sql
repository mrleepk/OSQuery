SELECT
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
name, 
data,
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, u.username
FROM registry
LEFT JOIN users u ON sid = u.uuid
WHERE
(
key like 'HKEY_USERS\%\Software\Martin Prikryl\WinSCP 2\Configuration\%%'
)
