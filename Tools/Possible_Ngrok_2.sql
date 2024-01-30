SELECT DISTINCT
    process.name AS Process_Name,
    listening.port,
    listening.address,
    process.pid
FROM 
    processes AS process
JOIN 
    listening_ports AS listening ON process.pid = listening.pid
WHERE 
    listening.port = 4040
    AND listening.address = '127.0.0.1'
