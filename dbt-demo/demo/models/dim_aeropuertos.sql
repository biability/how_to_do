{{ 
    config(
        materialized= 'incremental',
		unique_key='codigo_iata')
}}

select  distinct 
		ca.iso_region, 
        ca.iso_pais, 
        ca.codigo_iata, 
        ca.nombre_aeropouerto,
        current_date() fecha_creacion,
        current_date() fecha_modificacion
  from {{ ref('catalogo_aeropuertos') }} ca 
  inner join {{ ref('stg_operaciones_por_compania') }} oc
  on ca.nombre_aeropouerto = oc.aeropuerto_base