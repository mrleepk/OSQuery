SELECT
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(mtime, 'unixepoch')) AS ModifiedTime,
    name,
    data,
    regex_match(path, '(S-[0-9]+(-[0-9]+)+)', '') AS sid,
    u.username
FROM
    registry
LEFT JOIN
    users u ON sid = u.uuid
WHERE
    key LIKE 'HKEY_USERS\%\SOFTWARE\Martin Prikryl\WinSCP 2\Configuration\CDCache'
    OR key LIKE 'HKEY_CURRENT_USER\SOFTWARE\Martin Prikryl\WinSCP 2\Configuration\CDCache'
