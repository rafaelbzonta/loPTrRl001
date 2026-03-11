SELECT

    -- ativo
    entity_name AS 'Conta',
    make AS 'Fabricante',
    model AS 'Modelo',
    serial_number AS 'Número de Série',
    asset_id AS 'ID do Ativo',
    
    -- rede
    ip_address AS 'Endereço IP',
    mac_address AS 'Mac Address',

    DATETIME(first_meter_timestamp) AS 'Data Primeiro Medidor',
    DATETIME(last_meter_timestamp) AS 'Data Último Medidor',
    -- coleta ultimo medidor
    last_pageCounts_life_a3 AS 'Medidor A3',
    
    -- obs: se o medidor foi resetado ou a placa trocada, este valor pode vir negativo
    (last_pageCounts_life_a3 - first_pageCounts_life_a3) AS 'Volume Total A3' 

FROM meters

WHERE 
    managed = true 
    AND model LIKE '%WF-C878R%'

ORDER BY 
    entity_name ASC, 
    make ASC, 
    model ASC;
