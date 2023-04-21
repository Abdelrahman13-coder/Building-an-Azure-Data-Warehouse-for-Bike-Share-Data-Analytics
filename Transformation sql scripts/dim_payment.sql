-- CREATE dim_payment TABLE
IF OBJECT_ID('dbo.dim_payment') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_payment
END

CREATE EXTERNAL TABLE [dbo].[dim_payment] WITH(
    LOCATION = 'Star_schemas/dim_payment',
    DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        PaymentID,
        PaymentDate,
        Amount,
        AccountNumber,
        DATEPART(DAY, CONVERT(Date, PaymentDate)) AS DAY,
        DATEPART(MONTH, CONVERT(Date,PaymentDate)) AS MONTH, 
        DATEPART(QUARTER, CONVERT(Date,PaymentDate)) AS QUARTER,
        DATEPART(YEAR, CONVERT(Date,PaymentDate)) AS  YEAR,
        DATEPART(DAYOFYEAR,CONVERT(Date,PaymentDate)) AS DAY_OF_YEAR,
        DATEPART(WEEKDAY,CONVERT(Date,PaymentDate)) AS DAY_OF_WEEK
    FROM
        dbo.staging_payment
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[dim_payment];
