SELECT
'WDigest' as Query,
'A value of 1 means cleartext credentials are stored in memory' as Description,
CAST(strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS TEXT) ModifiedTime,
'n/a' as sid,
'n/a' AS username,
path AS Path,
data AS Data
FROM registry WHERE path LIKE 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\WDigest\%' AND Name = 'UseLogonCredential' AND data = '1'

UNION ALL

select 
'Run MRU' as Query,
'The list of entries executed using the Start > Run command is maintained in this key' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data from registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
where 
key like 'HKEY_USERS\%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'
OR key like 'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'

UNION ALL

select
'Typed URLs' as Query,
'URLs typed by the user' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid,
u.username, 
path AS Path,
data from registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
where key like 'HKEY_USERS\%\Software\Microsoft\Internet Explorer\TypedURLs'
OR key like 'HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs'
AND data NOT LIKE '%http://go.microsoft.com%'

UNION ALL

SELECT
'WinRAR History' as Query,
'WinRAR Archives the usr has interacted with' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime,
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
where key 
like 'HKEY_USERS\%\SOFTWARE\WinRAR\DialogEditHistory\ArcName' 
OR key LIKE 'HKEY_CURRENT_USER\SOFTWARE\WinRAR\DialogEditHistory\ArcName'
like 'HKEY_USERS\%\Software\WinRAR\ArcHistory' 
OR key LIKE 'HKEY_CURRENT_USER\Software\WinRAR\ArcHistory'
like 'HKEY_USERS\%\SOFTWARE\WinRAR\ArcName' 
OR key LIKE 'HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcName'
like 'HKEY_USERS\%\SOFTWARE\Software\WinRAR\DialogEditHistory\ExtrPath' 
OR key LIKE 'HKEY_CURRENT_USER\Software\WinRAR\DialogEditHistory\ExtrPath'

UNION ALL

SELECT 
'Typed Paths' as Query,
'Paths the user has navigated to' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username, 
path AS Path,
data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
WHERE key LIKE 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths'
OR key LIKE 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths'

UNION ALL

SELECT 
'Defender Exclusions' as Query,
'Exclusions for Defender - look at the "Path" key' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
'n/a' as sid,
'n/a' AS username,
path AS Path,
data
FROM registry
WHERE 
key LIKE 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths'
OR key like 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Extensions'
OR key like 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Processes'

UNION ALL

select 
'RDP History' as Query,
'Devices the user has connected to with RDP' Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
from registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
where key like 'HKEY_USERS\%\SOFTWARE\Microsoft\Terminal Server Client\Default' and data <> ''

UNION ALL

SELECT
'Run Key' as Query,
'Commonly used by attackers / malware for persistence' as Description,
CAST(strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS TEXT) ModifiedTime,
'n/a' as sid,
'n/a' AS username,
path AS Path,
data AS Data
FROM registry
WHERE
( key == 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' OR
key == 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run' OR
key == 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Run' OR
key == 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce' OR
key == 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\RunOnce' OR
key == 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices' OR
key == 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce' OR
key == 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\Setup' )

UNION ALL

select 
'Sysinternals' as Query,
'This key shows what Sysinternals tools have been used on that host - see "Path" column' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
from registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
where key like 'HKEY_USERS\%\SOFTWARE\Sysinternals'

UNION ALL 

select 
'Putty' as Query,
'This key shows connections made using Putty' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
WHERE key LIKE 'HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\%' 
OR key LIKE 'HKEY_USERS\%\Software\SimonTatham\PuTTY\%' 

UNION ALL

SELECT
'MUI Cache' as Query,
'Information regarding applications and tools installed and run via a user account' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
WHERE
(
key like 'HKEY_USERS\%_Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache'
)

UNION ALL

SELECT
'AppCompatFlags' as Query,
'Shows program execution for a specific users' as Description,
strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) as ModifiedTime, 
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
REPLACE(path,regex_match(path,'(.+\\)',0),'') AS data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
WHERE
key like 'HKEY_USERS\%\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store'
OR key like 'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store'
OR key like 'HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched'
OR key like 'HKEY_USERS\%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched'

UNION ALL

SELECT 
'Hidden Users' as Query,
'This key shows users that are hidden from the login page' as Description,
CAST(strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS TEXT) ModifiedTime,
'n/a' as sid,
'n/a' AS username,
path AS Path,
data AS Data
FROM registry
WHERE
key LIKE 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\Userlist'

UNION ALL

SELECT
'MS Office Server Cache' as Query,
'Shows URLs connected to by MS Office Documents. Can be useful for identifying the Follina exploit' as Description,
CAST(strftime('%Y-%m-%dT%H:%M:%SZ',datetime(mtime,'unixepoch')) AS TEXT) ModifiedTime,
regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid, 
u.username,
path AS Path,
data
FROM registry
LEFT JOIN users u ON sid = u.uuid AND username != ''
WHERE
key like 'HKEY_USERS\%\Software\Microsoft\Office\%\Common\Internet\Server Cache'
OR key like 'HKEY_CURRENT_USER\Software\Microsoft\Office\%\Common\Internet\Server Cache'
