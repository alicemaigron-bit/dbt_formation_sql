Select
    c.forecast_id,
    c.raw_forecast_id,
    c.product_id,
    c.product_name,
    coalesce(m.accepted_value, c.category) as category,
    c.country,
    c.sales_channel,
    c.forecast_month,
    c.scenario,
    c.forecast_sales_eur,
    c.forecast_units,
    c.currency
From
    {{ ref('int_provider_a_cleaned') }} as c
    Left Join {{ ref('retail_category_mapping') }} as m
        on c.category = upper(trim(m.to_be_mapped))