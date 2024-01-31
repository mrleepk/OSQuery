SELECT
  creation_time, user_id, operation, client_ip, originating_server, parameters
FROM
  xdr_identity_o365
WHERE
  parameters NOT LIKE '%Value":""%'
  AND (operation LIKE '%Mailbox%' OR operation LIKE '%Inbox%')
