SELECT
grep.path,
grep.pattern,
grep.line
FROM file
CROSS JOIN grep ON (grep.path = file.path)
WHERE
(
file.path LIKE 'C:\ProgramData\Microsoft\Windows\Power Efficiency Diagnostics\%'
)
AND grep.pattern IN('rclone','MEGA')
