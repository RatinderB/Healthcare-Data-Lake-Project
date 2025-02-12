-- Check if the external file format 'SynapseDeltaFormat' already exists.
-- If it does not exist, create it for reading and writing Delta Lake files.
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDeltaFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDeltaFormat] 
	WITH ( FORMAT_TYPE = DELTA )
GO

-- Check if the external data source 'healthcare_data_source' already exists.
-- If it does not exist, create it to reference an Azure Data Lake Storage Gen2 container.
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'healthcare_data_source') 
	CREATE EXTERNAL DATA SOURCE [healthcare_data_source] 
	WITH (
		LOCATION = 'abfss://healthdelta@healthcarestoreage.dfs.core.windows.net'
	)
GO