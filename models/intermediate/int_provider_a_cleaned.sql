Select
    regexp_replace(forecast_id, '_(BA|UP|DO|ST)$', '') as forecast_id,
    forecast_id as raw_forecast_id,
    product_id,
    upper(trim(product_name)) as product_name,

    -- Mapping via le seed retail_category_mapping
    upper(coalesce(m.accepted_value, trim(a.category))) as category,

    upper(trim(country)) as country,
    upper(trim(sales_channel)) as sales_channel,
    forecast_month,
    upper(trim(scenario)) as scenario,
    forecast_sales_eur,
    forecast_units,

    case
        when upper(trim(currency)) in ('EUR', '€', 'EURO') then 'EUR'
        when upper(trim(currency)) = 'USD' then 'USD'
        else upper(trim(currency))
    end as currency
From
    {{ ref('stg_raw_data_provider_a') }} as a
    Left Join {{ ref('retail_category_mapping') }} as m
        on upper(trim(a.category)) = upper(trim(m.to_be_mapped))
Where
    forecast_sales_eur > 0
    and forecast_units > 0