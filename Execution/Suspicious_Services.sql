SELECT
   datetime,
   eventid,
   JSON_EXTRACT(data, '$.EventData.AccountName') AS AccountName,
   JSON_EXTRACT(data, '$.EventData.ServiceName') AS ServiceName,
   JSON_EXTRACT(data, '$.EventData.ImagePath') AS ImagePath,
   JSON_EXTRACT(data, '$.EventData.ServiceType') AS ServiceType,
   JSON_EXTRACT(data, '$.EventData.StartType') AS StartType
FROM sophos_windows_events
WHERE 
    source = 'System'
    AND eventid = 7045
    AND (
        ImagePath LIKE '%rundll32.exe%'
        OR ImagePath LIKE '%shell32.dll%'
        OR ImagePath LIKE '%programdata%'
        OR ImagePath LIKE '%shell32.dll%'
        OR ImagePath LIKE '%powershell%'
        OR ImagePath LIKE '%&&%'
        OR ImagePath LIKE '%comspec%'
        OR ImagePath LIKE '%iex%'
        OR ImagePath LIKE '%value%'
        OR ImagePath LIKE '%vbscript:createobject%'
        OR ImagePath LIKE '%.run%'
        OR ImagePath LIKE '%(window.close)%'
        OR ImagePath LIKE '%(Clipboard|i%'
        OR ImagePath LIKE '%new-object%'
        OR ImagePath LIKE '%text.encoding]::ascii%'
        OR ImagePath LIKE '%readtoend%'
        OR ImagePath LIKE '%cmd%'
        OR ServiceName LIKE '%fgexec%'
        OR ServiceName LIKE '%dumpsvc%'
        OR ServiceName LIKE '%cachedump%'
        OR ServiceName LIKE '%mimidrv%'
        OR ServiceName LIKE '%gsecdump%'
        OR ServiceName LIKE '%servpw%'
        OR ServiceName LIKE '%pwdump%'
        OR ServiceName LIKE '%tor%service%'
        OR ServiceName LIKE '%DumpSvc%'
        OR ImagePath LIKE '%JAB%'
        OR ImagePath LIKE '%SUVYI%'
        OR ImagePath LIKE '%SQBFAFgA%'
        OR ImagePath LIKE '%aWV4I%'
        OR ImagePath LIKE '%IAB%'
        OR ImagePath LIKE '%PAA%'
        OR ImagePath LIKE '%aQBlAHgA%'
        OR ImagePath LIKE '%tor.exe%'
        OR ImagePath LIKE '%\\pipe%'
        OR ImagePath LIKE '%\Windows\Temp\%'
        OR ImagePath LIKE '%.downloadstring(%'
        OR ImagePath LIKE '%.downloadfile(%'
        OR ImagePath LIKE '% -w hidden %'
        OR ImagePath LIKE '% -nop %'
        OR ImagePath LIKE '%\Users\Public\%'
        OR ImagePath LIKE '%Perflogs%'
        OR ServiceName LIKE '%ProcessHacker%'
        OR ImagePath LIKE '%krbrelay%'
        OR ImagePath LIKE '%lsass%'
        OR ServiceName LIKE '%KrbSCM%'
        OR ServiceName LIKE '%cloudflared%'
    )
    AND ImagePath NOT LIKE '%Windows Defender\Definition Updates%'
    AND ServiceName NOT LIKE 'cpuz%';
