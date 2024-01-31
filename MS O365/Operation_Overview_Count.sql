SELECT
  user_id,
  client_ip,
  operation,
  COUNT(*) as operation_count
FROM
  xdr_identity_o365
GROUP BY
  user_id,
  client_ip,
  operation
ORDER BY
  operation_count DESC;
