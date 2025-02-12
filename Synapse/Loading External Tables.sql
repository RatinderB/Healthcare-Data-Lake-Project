CREATE EXTERNAL TABLE dbo.allergies (
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [SYSTEM] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [TYPE] nvarchar(4000),
    [CATEGORY] nvarchar(4000),
    [REACTION1] nvarchar(4000),
    [DESCRIPTION1] nvarchar(4000),
    [SEVERITY1] nvarchar(4000),
    [REACTION2] nvarchar(4000),
    [DESCRIPTION2] nvarchar(4000),
    [SEVERITY2] nvarchar(4000)
)
WITH (
    LOCATION = 'allergies/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);

CREATE EXTERNAL TABLE dbo.careplans (
    Id nvarchar(4000),
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [REASONCODE] nvarchar(4000),
    [REASONDESCRIPTION] nvarchar(4000)
)
WITH (
    LOCATION = 'careplans/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.claims (
    Id nvarchar(4000),
    PATIENTID nvarchar(4000),
    PROVIDERID nvarchar(4000),
    PRIMARYPATIENTINSURANCEID nvarchar(4000),
    SECONDARYPATIENTINSURANCEID nvarchar(4000),
    DEPARTMENTID int,
    PATIENTDEPARTMENTID int,
    DIAGNOSIS1 nvarchar(4000),
    DIAGNOSIS2 nvarchar(4000),
    DIAGNOSIS3 nvarchar(4000),
    DIAGNOSIS4 nvarchar(4000),
    DIAGNOSIS5 nvarchar(4000),
    DIAGNOSIS6 nvarchar(4000),
    DIAGNOSIS7 nvarchar(4000),
    DIAGNOSIS8 nvarchar(4000),
    REFERRINGPROVIDERID nvarchar(4000),
    APPOINTMENTID nvarchar(4000),
    CURRENTILLNESSDATE datetime2(7),
    SERVICEDATE datetime2(7),
    SUPERVISINGPROVIDERID nvarchar(4000),
    STATUS1 nvarchar(4000),
    STATUS2 nvarchar(4000),
    STATUSP nvarchar(4000),
    OUTSTANDING1 int,
    OUTSTANDING2 int,
    OUTSTANDINGP int,
    LASTBILLEDDATE1 datetime2(7),
    LASTBILLEDDATE2 datetime2(7),
    LASTBILLEDDATEP datetime2(7),
    HEALTHCARECLAIMTYPEID1 int,
    HEALTHCARECLAIMTYPEID2 int
)
WITH (
    LOCATION = 'claims/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.claims_transactions (
    ID nvarchar(4000),
    CLAIMID nvarchar(4000),
    CHARGEID int,
    PATIENTID nvarchar(4000),
    TYPE nvarchar(4000),
    AMOUNT float,
    METHOD nvarchar(4000),
    FROMDATE datetime2(7),
    TODATE datetime2(7),
    PLACEOFSERVICE nvarchar(4000),
    PROCEDURECODE nvarchar(4000),
    MODIFIER1 nvarchar(4000),
    MODIFIER2 nvarchar(4000),
    DIAGNOSISREF1 nvarchar(4000),
    DIAGNOSISREF2 nvarchar(4000),
    DIAGNOSISREF3 nvarchar(4000),
    DIAGNOSISREF4 nvarchar(4000),
    UNITS int,
    DEPARTMENTID int,
    NOTES nvarchar(4000),
    UNITAMOUNT float,
    TRANSFEROUTID nvarchar(4000),
    TRANSFERTYPE nvarchar(4000),
    PAYMENTS float,
    ADJUSTMENTS float,
    TRANSFERS float,
    OUTSTANDING float,
    APPOINTMENTID nvarchar(4000),
    LINENOTE nvarchar(4000),
    PATIENTINSURANCEID nvarchar(4000),
    FEESCHEDULEID int,
    PROVIDERID nvarchar(4000),
    SUPERVISINGPROVIDERID nvarchar(4000)
)
WITH (
    LOCATION = 'claims_transactions/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.conditions (
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [SYSTEM] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000)
)
WITH (
    LOCATION = 'conditions/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.devices (
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [UDI] nvarchar(4000)
)
WITH (
    LOCATION = 'devices/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.encounters (
    Id nvarchar(4000),
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ORGANIZATION] nvarchar(4000),
    [PROVIDER] nvarchar(4000),
    [PAYER] nvarchar(4000),
    [ENCOUNTERCLASS] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [BASE_ENCOUNTER_COST] float,
    [TOTAL_CLAIM_COST] float,
    [PAYER_COVERAGE] float,
    [REASONCODE] nvarchar(4000),
    [REASONDESCRIPTION] nvarchar(4000)
)
WITH (
    LOCATION = 'encounters/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.imaging_studies (
    Id nvarchar(4000),
    [DATE] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [SERIES_UID] nvarchar(4000),
    [BODYSITE_CODE] nvarchar(4000),
    [BODYSITE_DESCRIPTION] nvarchar(4000),
    [MODALITY_CODE] nvarchar(4000),
    [MODALITY_DESCRIPTION] nvarchar(4000),
    [INSTANCE_UID] nvarchar(4000),
    [SOP_CODE] nvarchar(4000),
    [SOP_DESCRIPTION] nvarchar(4000),
    [PROCEDURE_CODE] nvarchar(4000)
)
WITH (
    LOCATION = 'imaging_studies/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.immunizations (
    [DATE] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [BASE_COST] float
)
WITH (
    LOCATION = 'immunizations/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.medications (
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [PAYER] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [BASE_COST] float,
    [PAYER_COVERAGE] float,
    [DISPENSES] int,
    [TOTALCOST] float,
    [REASONCODE] nvarchar(4000),
    [REASONDESCRIPTION] nvarchar(4000)
)
WITH (
    LOCATION = 'medications/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.observations (
    [DATE] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CATEGORY] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [VALUE] nvarchar(4000),
    [UNITS] nvarchar(4000),
    [TYPE] nvarchar(4000)
)
WITH (
    LOCATION = 'observations/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.organizations (
    Id nvarchar(4000),
    [NAME] nvarchar(4000),
    [ADDRESS] nvarchar(4000),
    [CITY] nvarchar(4000),
    [STATE] nvarchar(4000),
    [ZIP] nvarchar(4000),
    [LAT] float,
    [LON] float,
    [PHONE] nvarchar(4000),
    [REVENUE] float,
    [UTILIZATION] float
)
WITH (
    LOCATION = 'organizations/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.patients (
    Id nvarchar(4000),
    [BIRTHDATE] date,
    [DEATHDATE] date,
    [SSN] nvarchar(4000),
    [DRIVERS] nvarchar(4000),
    [PASSPORT] nvarchar(4000),
    [PREFIX] nvarchar(4000),
    [FIRST] nvarchar(4000),
    [MIDDLE] nvarchar(4000),
    [LAST] nvarchar(4000),
    [SUFFIX] nvarchar(4000),
    [MAIDEN] nvarchar(4000),
    [MARITAL] nvarchar(4000),
    [RACE] nvarchar(4000),
    [ETHNICITY] nvarchar(4000),
    [GENDER] nvarchar(4000),
    [BIRTHPLACE] nvarchar(4000),
    [ADDRESS] nvarchar(4000),
    [CITY] nvarchar(4000),
    [STATE] nvarchar(4000),
    [COUNTY] nvarchar(4000),
    [FIPS] nvarchar(4000),
    [ZIP] nvarchar(4000),
    [LAT] float,
    [LON] float,
    [HEALTHCARE_EXPENSES] float,
    [HEALTHCARE_COVERAGE] float,
    [INCOME] float
)
WITH (
    LOCATION = 'patients/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.payer_transitions (
    [PATIENT] nvarchar(4000),
    [MEMBERID] nvarchar(4000),
    [START_DATE] datetime2(7),
    [END_DATE] datetime2(7),
    [PAYER] nvarchar(4000),
    [SECONDARY_PAYER] nvarchar(4000),
    [PLAN_OWNERSHIP] nvarchar(4000),
    [OWNER_NAME] nvarchar(4000)
)
WITH (
    LOCATION = 'payer_transitions/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.payers (
    Id nvarchar(4000),
    [NAME] nvarchar(4000),
    [OWNERSHIP] nvarchar(4000),
    [ADDRESS] nvarchar(4000),
    [CITY] nvarchar(4000),
    [STATE_HEADQUARTERED] nvarchar(4000),
    [ZIP] nvarchar(4000),
    [PHONE] nvarchar(4000),
    [AMOUNT_COVERED] float,
    [AMOUNT_UNCOVERED] float,
    [REVENUE] float,
    [COVERED_ENCOUNTERS] int,
    [UNCOVERED_ENCOUNTERS] int,
    [COVERED_MEDICATIONS] int,
    [UNCOVERED_MEDICATIONS] int,
    [COVERED_PROCEDURES] int,
    [UNCOVERED_PROCEDURES] int,
    [COVERED_IMMUNIZATIONS] int,
    [UNCOVERED_IMMUNIZATIONS] int,
    [UNIQUE_CUSTOMERS] int,
    [QOLS_AVG] float,
    [MEMBER_MONTHS] int
)
WITH (
    LOCATION = 'payers/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.procedures (
    [START] datetime2(7),
    [STOP] datetime2(7),
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [SYSTEM] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [BASE_COST] float,
    [REASONCODE] nvarchar(4000),
    [REASONDESCRIPTION] nvarchar(4000)
)
WITH (
    LOCATION = 'procedures/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.providers (
    Id nvarchar(4000),
    [ORGANIZATION] nvarchar(4000),
    [NAME] nvarchar(4000),
    [GENDER] nvarchar(4000),
    [SPECIALITY] nvarchar(4000),
    [ADDRESS] nvarchar(4000),
    [CITY] nvarchar(4000),
    [STATE] nvarchar(4000),
    [ZIP] nvarchar(4000),
    [LAT] float,
    [LON] float,
    [ENCOUNTERS] int,
    [PROCEDURES] int
)
WITH (
    LOCATION = 'providers/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO

CREATE EXTERNAL TABLE dbo.supplies (
    [DATE] date,
    [PATIENT] nvarchar(4000),
    [ENCOUNTER] nvarchar(4000),
    [CODE] nvarchar(4000),
    [DESCRIPTION] nvarchar(4000),
    [QUANTITY] int
)
WITH (
    LOCATION = 'supplies/',
    DATA_SOURCE = [healthcare_data_source],
    FILE_FORMAT = [SynapseDeltaFormat]
);
GO