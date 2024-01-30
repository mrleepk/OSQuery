SELECT grep.*
FROM file
CROSS JOIN grep ON (grep.path = file.path)
WHERE
    file.path LIKE 'C:\Users\%\AppData\Roaming\FileZilla\recentservers.xml'
    OR file.path LIKE 'C:\Users\%\Documents\FileZillaPortable\Data\settings\recentservers.xml'
    OR file.path LIKE 'C:\Users\%\AppData\Roaming\FileZilla\filezilla.xml'
    AND grep.pattern IN ('Host', 'Port', 'User', 'RemotePath', 'LocalPath');
