SELECT 
grep.path,
regex_match(grep.line, 'filename="([^"]+)"', 1) AS filename
FROM file
CROSS JOIN grep ON (grep.path = file.path)
WHERE
file.path LIKE 'C:\Users\%\AppData\%\Notepad++\session.xml'
AND grep.pattern = 'filename'
