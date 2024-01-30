SELECT path, cmdline, pid FROM processes WHERE 
    (
        (LOWER(name)='conhost.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\conhost.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\conhost.exe'
        ))
        OR
        (LOWER(name)='dllhost.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\dllhost.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\dllhost.exe'
        ))
        OR
        (LOWER(name)='lsass.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\lsass.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\lsass.exe'
        ))
        OR
        (LOWER(name)='svchost.exe' 
        AND (
	    LOWER(path)!='c:\windows\system32\svchost.exe' 
	    AND LOWER(path) NOT LIKE 'c:\windows\syswow64\svchost.exe'
        ))
        OR
        (LOWER(name)='spoolsv.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\spoolsv.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\spoolsv.exe'
        ))
        OR
        (LOWER(name)='wininit.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\wininit.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\wininit.exe'
        ))
        OR
        (LOWER(name)='winlogon.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\winlogon.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\winlogon.exe'
        ))
        OR
        (LOWER(name)='wuauclt.exe' 
        AND (
            LOWER(path)!='c:\windows\system32\wuauclt.exe' 
            AND LOWER(path) NOT LIKE 'c:\windows\syswow64\wuauclt.exe'
        ))
    );
