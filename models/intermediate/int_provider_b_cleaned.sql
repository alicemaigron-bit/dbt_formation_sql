Select
    forecast_id,

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

    case
        when upper(trim(region)) in ('N. AMERICA', 'NORTH AMERICA') then 'NORTH AMERICA'
        when upper(trim(region)) in ('APAC', 'ASIA PACIFIC') then 'ASIA PACIFIC'
        when upper(trim(region)) in ('LATAM', 'LATIN AMERICA') then 'LATIN AMERICA'
        when upper(trim(region)) in ('W. EUROPE', 'WESTERN EUROPE') then 'WESTERN EUROPE'
        when upper(trim(region)) in ('N EUROPE', 'NORTHERN EUROPE') then 'NORTHERN EUROPE'
        when upper(trim(region)) in ('SOUTH EUROPE', 'SOUTHERN EUROPE') then 'SOUTHERN EUROPE'
        when upper(trim(region)) in ('EAST EUROPE', 'EASTERN EUROPE') then 'EASTERN EUROPE'
        else upper(trim(region))
    end as region,

    forecast_quarter,

    case
        when upper(trim(channel_group)) in ('SPECIALTY', 'SPECIALITY') then 'SPECIALTY'
        when upper(trim(channel_group)) in ('E-COMMERCE', 'ECOMMERCE') then 'E-COMMERCE'
        when upper(trim(channel_group)) in ('RETAIL') then 'RETAIL'
        else upper(trim(channel_group))
    end as channel_group,

    forecast_sales_eur,

    case
        when upper(trim(currency)) in ('EUR', '€', 'EURO') then 'EUR'
        when upper(trim(currency)) = 'USD' then 'USD'
        else upper(trim(currency))
    end as currency
From
    {{ ref('stg_raw_data_provider_b') }}
Where
    forecast_sales_eur > 0