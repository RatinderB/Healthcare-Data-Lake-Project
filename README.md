# Healthcare Data Lake and Analytics Platform

This project is a data engineering pipeline solution designed to address the healthcare data management needs of a large hospital network. It was created to aid in my learning and understanding of end-to-end data pipelining on Azure.

## Project Overview

This project addresses a critical need by building a comprehensive data pipeline on Azure. The goal is to consolidate raw patient data from multiple sources, transform it in the cloud, and generate actionable insights to improve patient care and operational efficiency.

## Business Requirements

The hospital network required a centralized, secure, and efficient way to manage its healthcare data. The key requirements included:

- **Centralized Data Storage:** Consolidate raw healthcare data into a structured and accessible format.
- **Data Transformation:** Clean, deduplicate, and apply a schema to the raw data to ensure consistency.
- **Analytics and Reporting:** Enable SQL-based analytics on transformed data for generating insights.
- **Automation:** Automate the data ingestion and transformation processes for continuous data availability.
- **Security:** Securely manage sensitive healthcare data and related credentials.

## Solution Overview

To meet these requirements, the solution is broken down into the following components:

### Data Ingestion
- **Source:** Raw CSV files stored in the `raw-data` container of **Azure Data Lake Storage Gen2 (ADLS Gen2)**.
- **Process:** An **Azure Data Factory (ADF) pipeline** (`Ingest_Transform_Healthcare_Data`) performs the following tasks:
  - **Get_Raw_Filenames Activity:** Retrieves the names of the CSV files.
  - **ForEach Loop:** Iterates through each file.
  - **Copy_To_Parquet Activity:** Converts and copies CSV files into **Parquet format** in the `healthparquet` container.

### Data Transformation
- **Azure Databricks:**
  - **Notebook: `mountStorage`:** Mounts the `healthparquet` and `healthdelta` containers.
  - **Notebook: `transformHealthCareData`:** Transforms the data by applying a schema, cleaning null values, dropping duplicates, and performing minor data transformations. The output is stored in Delta format in the `healthdelta` container.

### Data Analytics
- **Azure Synapse Analytics:**
  - External tables are created in Synapse to connect to the transformed Delta files.
  - SQL-based views and queries are used to generate analytical insights from the healthcare data.

### Security & Automation
- **Azure Key Vault:** Manages secrets and credentials securely for all the Azure services used in the pipeline.
- **Automation:** The pipeline can be scheduled to run regularly, ensuring continuous data processing and updated analytics.

## Technology Stack

- **Azure Data Factory (ADF):** Orchestrates data ingestion and transformation.
- **Azure Data Lake Storage Gen2 (ADLS Gen2):** Stores raw and processed data.
- **Azure Databricks:** Handles data processing and transformations.
- **Azure Synapse Analytics:** Provides data warehousing and SQL-based analytics.
- **Azure Key Vault:** Secures credentials and secrets.

## Setup Instructions

### Step 1: Azure Environment Setup
- **Resource Group:** Create a new resource group in Azure.
- **Provision Services:**
  - Create an Azure Data Factory instance.
  - Set up Azure Data Lake Storage with the following containers: `raw-data`, `healthparquet`, and `healthdelta`.
  - Create an Azure Databricks workspace.
  - Set up an Azure Synapse Analytics workspace.
  - Configure an Azure Key Vault for secret management.

### Step 2: Data Ingestion
- **ADF Pipeline:** Configure the ADF pipeline to:
  - Extract file metadata from the `raw-data` container.
  - Iterate through each file and convert it to Parquet format in the `healthparquet` container.

### Step 3: Data Transformation
- **Databricks Notebooks:**
  - **mountStorage:** Mount the `healthparquet` and `healthdelta` containers.
  - **transformHealthCareData:** Transform the data by enforcing schema, cleaning data, and storing the results in Delta format.

### Step 4: Data Analytics
- **Synapse Analytics:**
  - Create external tables that link to the transformed data in the `healthdelta` container.
  - Use SQL queries to create views and generate analytical insights.

### Step 5: Security
- **Key Vault:** Ensure that all credentials and connection strings are securely stored in Azure Key Vault.

## Conclusion

This project provides a robust end-to-end solution for centralizing and analyzing healthcare data on Azure. By automating the ingestion, transformation, and analytics processes, it improves data management and supports informed decision-making within the hospital network.

