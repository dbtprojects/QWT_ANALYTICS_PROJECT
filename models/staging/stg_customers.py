def model(dbt, session):

    dbt.config(materialized = 'table')

    stg_customers_df = dbt.source("qwt_raw", "customers")
    
    return stg_customers_df