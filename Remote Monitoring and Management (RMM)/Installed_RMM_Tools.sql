SELECT 
    name, 
    version, 
    install_location, 
    publisher, 
    install_date 
FROM 
    programs 
WHERE
    name LIKE '%anydesk%' OR
    name LIKE '%teamviewer%' OR 
    name LIKE '%atera%' OR
    name LIKE '%splashtop%' OR
    name LIKE '%ITSupport247%' OR
    name LIKE '%NinjaRMM%' OR
    name LIKE '%kaseya%' OR
    name LIKE '%screenconnect%' OR 
    name LIKE '%ConnectWise%' OR
    name LIKE '%tacticalrmm%' OR
    name LIKE '%NinjaOne%' OR 
    name LIKE '%meshcentral%' OR
    name LIKE '%ammy%' OR
    name LIKE '%remotepc%' OR
    name LIKE '%rustdesk%' OR
    name LIKE '%action1%' OR
    name LIKE '%ammyadmin%' OR
    name LIKE '%remote utilities%' OR
    name LIKE '%supremo%' OR
    name LIKE '%Syncro%'
