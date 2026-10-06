Select
    c.forecast_id,
    coalesce(m.accepted_value, c.category) as category,
    c.country,
    c.region,
    c.forecast_quarter,
    c.channel_group,
    c.forecast_sales_eur,
    c.currency
From
    {{ ref('int_provider_b_cleaned') }} as c
    Left Join {{ ref('retail_category_mapping') }} as m
        on c.category = upper(trim(m.to_be_mapped))