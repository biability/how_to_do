{{ 
    config(
        materialized= 'incremental',
		unique_key='id')
}}  
  
select  
        md5(to_char(oc.fecha) || '-' || oc.movimiento || '-' || ca.codigo_iata) id,
        oc.fecha,
        ca.codigo_iata, 
        oc.compania,
        oc.movimiento,
        sum(oc.operaciones_totales) operaciones_totales 
  from catalogo_aeropuertos ca
  inner join STG_OPERACIONES_POR_COMPANIA oc
  on ca.nombre_aeropouerto = oc.aeropuerto_base
  group by 
        oc.fecha,
        ca.codigo_iata, 
        oc.compania,
        oc.movimiento