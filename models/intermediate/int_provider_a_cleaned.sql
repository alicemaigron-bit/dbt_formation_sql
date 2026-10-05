Select
    regexp_replace(forecast_id, '_(BA|UP|DO|ST)$', '') as forecast_id,
    forecast_id as raw_forecast_id,
    product_id,
    upper(trim(product_name)) as product_name,

    case
        when upper(trim(category)) in ('FOOD', 'FOODS') then 'FOOD'
        when upper(trim(category)) in ('TOY', 'TOYS') then 'TOYS'
        when upper(trim(category)) in ('APPAREL', 'FASHION') then 'FASHION'
        when upper(trim(category)) in ('COSMETICS', 'BEAUTY') then 'BEAUTY'
        when upper(trim(category)) in ('DRINK', 'DRINKS', 'BEVERAGE', 'BEVERAGES') then 'BEVERAGES'
        when upper(trim(category)) in ('ELECTRONIC', 'ELECTRONICS') then 'ELECTRONICS'
        when upper(trim(category)) in ('HOME CARE', 'HOMECARE') then 'HOME CARE'
        when upper(trim(category)) in ('SPORT', 'SPORTS') then 'SPORTS'
        when upper(trim(category)) in ('PETS', 'PET CARE') then 'PET CARE'
        when upper(trim(category)) in ('PERSONALCARE', 'PERSONAL CARE') then 'PERSONAL CARE'
        when upper(trim(category)) in ('OFFICE SUPPLY', 'OFFICE SUPPLIES') then 'OFFICE SUPPLIES'
        when upper(trim(category)) in ('HOME AND KITCHEN', 'HOME & KITCHEN') then 'HOME & KITCHEN'
        else upper(trim(category))
    end as category,

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
    {{ ref('stg_raw_data_provider_a') }}
Where
    forecast_sales_eur > 0
    and forecast_units > 0