SELECT
    src_ip,
    dst_ip,
	dst_port,
	SUM(bytes_sent) as Bytes_Sent
FROM
    xgfw_data
WHERE
    dst_country != 'Reserved'
GROUP BY
    src_ip, dst_ip, dst_port
