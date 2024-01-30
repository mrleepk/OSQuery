SELECT
    CAST(strftime('%Y-%m-%dT%H:%M:%SZ', datetime(mtime, 'unixepoch')) AS TEXT) AS Last_Modified,
    path AS Path,
    name AS Name,
    type AS Type,
    data AS Data
FROM
    registry
WHERE
    path LIKE 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\WDigest\%'
    AND name = 'UseLogonCredential'
    AND data = '1'
