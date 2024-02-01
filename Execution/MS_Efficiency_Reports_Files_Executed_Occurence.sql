SELECT
    grep.path,
    grep.pattern,
    grep.line,
    COUNT(grep.line) AS occurrence_count
FROM
    file
CROSS JOIN
    grep ON (grep.path = file.path)
WHERE
    file.path LIKE 'C:\ProgramData\Microsoft\Windows\Power Efficiency Diagnostics\%'
    AND grep.pattern IN ('Harddisk')
GROUP BY
    grep.path,
    grep.pattern,
    grep.line
