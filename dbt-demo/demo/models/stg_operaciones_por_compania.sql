{{ 
    config(
        materialized= 'table')
}}

SELECT  TO_DATE(ANYO || '-' || 
            CASE 
                WHEN MES LIKE 'Enero%' THEN '01'
                WHEN MES LIKE 'Febrero%' THEN '02'
                WHEN MES LIKE 'Marzo%' THEN '03'
                WHEN MES LIKE 'Abril%' THEN '04'
                WHEN MES LIKE 'Mayo%' THEN '05'
                WHEN MES LIKE 'Junio%' THEN '06'
                WHEN MES LIKE 'Julio%' THEN '07'
                WHEN MES LIKE 'Agosto%' THEN '08'
                WHEN MES LIKE 'Septiembre%' THEN '09'
                WHEN MES LIKE 'Octubre%' THEN '10'
                WHEN MES LIKE 'Noviembre%' THEN '11'
                WHEN MES LIKE 'Diciembre%' THEN '12'
            END || '-01') FECHA,
        COMPANIA, 
        AEROPUERTO_BASE,
        CLASE AS CLASE_VUELO,
        MOVIMIENTO, 
        PAIS,
        OPERACIONES_TOTALES
  FROM OPC 
 WHERE GRUPO_COMPANIA <> 'Total'