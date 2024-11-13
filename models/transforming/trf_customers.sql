{{ config(materialized = 'table', schema = 'transforming', transient = false) }}

select 

customerid,
companyname,
contactname,
city,
country,
d.divisionname as divisionname,
address,
fax,
phone,
postalcode,
iff(stateprovince = '', 'NA', stateprovince) as stateprovince 

from 

{{ ref('stg_customers') }} as c inner join {{ref('lkp_divisions')}} as d 
on c.divisionid = d.divisionid