SELECT COUNT(1) AS COUNT, 'dim_payment' AS Table_name FROM dbo.dim_payment
UNION
SELECT COUNT(1) AS COUNT, 'dim_rider' AS Table_name FROM dbo.dim_rider
UNION
SELECT COUNT(1) AS COUNT, 'dim_station' AS Table_name FROM dbo.dim_station
UNION
SELECT COUNT(1) AS COUNT, 'fact_trip' AS Table_name FROM dbo.fact_trip