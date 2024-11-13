{{ config(materialized = 'table', schema = env_var('DBT_STAGESCHEMA', 'STAGING') ) }}

select 
empid ,
lastname ,
firstname ,
title ,
to_date(hiredate, 'MM/DD/YY') as hiredate ,
office ,
extension ,
reportsto ,
yearsalary
from 
{{ source('qwt_raw', 'employees') }}