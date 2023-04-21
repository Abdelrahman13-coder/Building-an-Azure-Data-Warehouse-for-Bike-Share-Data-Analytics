IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'data_bikesharedata_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [data_bikesharedata_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://data@bikesharedata.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_rider (
	[Rider_Id] bigint,
	[Address] nvarchar(4000),
	[First_Name] nvarchar(4000),
	[Last_Name] nvarchar(4000),
	[Birthday] varchar(50),
	[Account_start_date] varchar(50),
	[Account_end_date] varchar(50),
	[Is_member] bit
	)
	WITH (
	LOCATION = 'publicrider.txt',
	DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_rider
GO