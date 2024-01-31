SELECT creation_time, user_id, operation, client_ip
FROM xdr_identity_o365
WHERE operation IN ('UserLoggedIn');
