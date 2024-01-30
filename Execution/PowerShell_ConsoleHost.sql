SELECT 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.mtime, 'unixepoch')) AS Modified_time,
    f.path,
    (
        SELECT CAST(GROUP_CONCAT(line, CHAR(10)) AS TEXT) 
        FROM grep 
        WHERE pattern IN (CHAR(0), CHAR(10), CHAR(32)) AND path = f.path
    ) AS Console_History,
    'Grep/File' AS Data_Source,
    'PowerShell_ConsoleHistory' AS Query
FROM 
    file f
WHERE 
    (
        f.path LIKE 'C:\Users\%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt'
        OR f.path LIKE 'C:\windows\system32\config\systemprofile\appdata\roaming\microsoft\windows\powershell\psreadline\consolehost_history.txt'
    )
    AND Console_History != '';
