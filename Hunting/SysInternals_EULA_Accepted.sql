SELECT r.name,
       r.path,
       DATETIME(mtime, 'unixepoch') AS ModifiedTime
FROM registry AS r
WHERE r.key LIKE 'HKEY_USERS\%\SOFTWARE\Sysinternals';
