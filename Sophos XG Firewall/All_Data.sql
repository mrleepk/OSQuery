SELECT
	timestamp,
	device_serial_id,
	log_type,
	log_component,
	log_subtype,
	duration,
	user_name,
	app_name,
	app_category,
	app_technology,
	src_ip,
	src_country,
	src_port,
	protocol,
	dst_ip,
	dst_country,
	dst_port,
	bytes_received,
	bytes_sent,
	message,
	url,
	content_type,
	domain,
	http_user_agent,
	http_status,
	http_referer,
	download_file_name,
	download_file_type,
	upload_file_name,
	upload_file_type,
	malware,
	action,
	file_name,
	file_size,
	file_path,
	cmd,
	http_query,
	http_cookie,
	http_method,
	src_host,
	dst_host,
	file_type,
	file_hash,
	hits,
	detection_name
FROM
  xgfw_data
