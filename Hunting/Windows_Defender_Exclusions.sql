SELECT 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(mtime, 'unixepoch')) as ModifiedTime,
    name,
    key
FROM 
    registry
WHERE 
    key IN (
        'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths',
        'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Extensions',
        'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Processes'
    )
