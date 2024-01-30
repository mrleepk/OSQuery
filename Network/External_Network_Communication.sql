WITH network_data AS (
    SELECT
        strftime('%Y-%m-%dT%H:%M:%SZ', datetime(time,'unixepoch')) AS date_time,
        sophos_pid,
        destination,
        destination_port
    FROM sophos_network_journal
    WHERE
        destination NOT LIKE '192.168.%.%'
        AND destination NOT GLOB '172.1[6-9].*.*'
        AND destination NOT GLOB '172.2[0-9].*'
        AND destination NOT GLOB '172.3[0-1].*'
        AND destination NOT LIKE '10.%'
        AND destination NOT LIKE '127.%'
        AND destination NOT LIKE '%:%'
        AND destination NOT LIKE '%0.0.0.0%'
        AND destination != '1.0.0.1'
    GROUP BY date_time, sophos_pid
)

SELECT
    nd.date_time,
    spj.path,
    spj.process_name,
    spj.cmd_line,
    nd.sophos_pid,
    nd.destination,
    nd.destination_port,
    spj.sid,
    u.username
FROM 
    network_data nd
LEFT JOIN sophos_process_journal spj USING (sophos_pid)
LEFT JOIN users u ON spj.sid = u.uuid
