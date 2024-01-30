SELECT
    r.path,
    r.name,
    r.data,
    REPLACE(REPLACE(REPLACE(REGEX_SPLIT(r.data, ' [-/]', 0), '"', ''), '%windir%', 'C:\Windows'), '%SystemRoot%', 'C:\Windows') AS filepath,
    p.ml_score,
    p.pua_score,
    p.local_rep,
    p.global_rep,
    json_extract(p.local_rep_data, '$.reputationData.isSigned') AS is_signed,
    json_extract(p.local_rep_data, '$.reputationData.signerInfo[0].isValid') AS isValid,
    json_extract(p.local_rep_data, '$.reputationData.signerInfo[0].signer') AS signer,
    p.sha256 as sha256
FROM
    registry AS r
JOIN
    sophos_file_properties p ON p.path = REPLACE(REPLACE(REPLACE(REGEX_SPLIT(r.data, ' [-/]', 0), '"', ''), '%windir%', 'C:\Windows'), '%SystemRoot%', 'C:\Windows')
WHERE
    ( r.key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' OR
      r.key = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run' OR
      r.key = 'HKEY_USERS\Software\Microsoft\Windows\CurrentVersion\Run' OR
      r.key = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce' OR
      r.key = 'HKEY_USERS\Software\Microsoft\Windows\CurrentVersion\RunOnce' OR
      r.key = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices' OR
      r.key = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce' OR
      r.key = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\Setup' );
