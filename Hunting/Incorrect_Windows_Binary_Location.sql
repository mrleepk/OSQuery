SELECT * FROM processes WHERE 
    (
        LOWER(name)='conhost.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\conhost.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\conhost.exe%'
        )
    )
    AND
    (
        LOWER(name)='dllhost.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\dllhost.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\dllhost.exe%'
        )
    )
    AND
    (
        LOWER(name)='lsass.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\lsass.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\lsass.exe%'
        )
    )
    AND
    (
        LOWER(name)='svchost.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\svchost.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\svchost.exe%'
        )
    )
    AND
    (
        LOWER(name)='spoolsv.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\spoolsv.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\spoolsv.exe%'
        )
    )
    AND
    (
        LOWER(name)='wininit.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\wininit.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\wininit.exe%'
        )
    )
    AND
    (
        LOWER(name)='winlogon.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\winlogon.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\winlogon.exe%'
        )
    )
    AND
    (
        LOWER(name)='wuauclt.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\wuauclt.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\wuauclt.exe%'
        )
    );
