SELECT 
    p.path AS process_path, 
    p.name AS process_name, 
    p.cmdline AS process_cmdline, 
    pos.remote_address, 
    pos.remote_port
FROM 
    process_open_sockets pos
LEFT JOIN 
    processes p ON pos.pid = p.pid
WHERE 
    pos.remote_port != 0 
    AND p.name != ''
    AND regex_match(p.cmdline, '\b(?:\d{1,3}\.){3}\d{1,3}\b', 0)
