SELECT
   processes.path,
   processes.name AS process_name, 
   processes.cmdline,
   authenticode.subject_name AS signer,
   authenticode.serial_number AS serial_number
FROM
   processes 
LEFT JOIN authenticode ON processes.path = authenticode.path
WHERE
    authenticode.serial_number = '0dbf152deaf0b981a8a938d53f769db8'
