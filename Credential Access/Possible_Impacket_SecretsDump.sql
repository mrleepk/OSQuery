SELECT
    f.path AS Path,
    f.directory AS Directory,
    f.filename AS Filename,
    f.size AS Size,
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.btime, 'unixepoch')) AS 'First_Created_On_Disk(btime)', 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.ctime, 'unixepoch')) AS 'Last_Status_Change(ctime)', 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.mtime, 'unixepoch')) AS 'Last_Modified(mtime)', 
    strftime('%Y-%m-%dT%H:%M:%SZ', datetime(f.atime, 'unixepoch')) AS 'Last_Accessed(atime)',
    h.sha256 AS SHA256,
    h.sha1 AS SHA1,
    h.md5 AS MD5,
    f.attributes AS Attributes
FROM 
    file f 
JOIN 
    hash h ON f.path = h.path
WHERE 
    (f.path LIKE 'C:\Windows\System32\%.tmp' OR f.path LIKE 'C:\Windows\Temp\%.tmp')
    AND f.filename LIKE '________.tmp';
