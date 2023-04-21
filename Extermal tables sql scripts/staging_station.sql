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

CREATE EXTERNAL TABLE dbo.staging_station (
	[Station_Id] nvarchar(4000),
	[Name] nvarchar(4000),
	[Latitude] float,
	[Longitude] float
	)
	WITH (
	LOCATION = 'publicstation.txt',
	DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_station
GO