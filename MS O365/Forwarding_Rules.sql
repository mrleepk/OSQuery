SELECT
creation_time, user_id, client_ip, originating_server,
  JSON_EXTRACT(parameters, '$[0].Value') AS Server,
  JSON_EXTRACT(parameters, '$[1].Value') AS Forwarded_Address,
  JSON_EXTRACT(parameters, '$[2].Name') AS Rule_Name
FROM
  xdr_identity_o365
WHERE
  workload = 'Exchange'
  AND operation = 'Set-Mailbox'
  AND (
    parameters LIKE '%ForwardingSmtpAddress%'
    OR parameters LIKE '%ForwardingAddress%'
  )
  AND parameters NOT LIKE '%Value":""%'
