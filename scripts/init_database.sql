/*
===============================================================================
 Project: Modern SQL Data Warehouse
 Author: Mthokozisi Seja
 Description:
     This script creates the Data Warehouse database and required schemas
     following the Medallion Architecture (Bronze, Silver, Gold).

  WARNING:
     This script will DROP the existing database if it already exists.
     All data inside the database will be permanently deleted.

     Use with caution, especially in production environments.
===============================================================================
*/

-- Switch to master database to allow database operations
USE master;
GO

-- Check if the database already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'MthoDWH')
BEGIN
    PRINT 'Existing database found. Dropping database MthoDWH...';

    -- Set database to SINGLE_USER mode to force disconnect active connections
    ALTER DATABASE MthoDWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the database
    DROP DATABASE MthoDWH;

    PRINT 'Database dropped successfully.';
END
GO

-- Create fresh database
PRINT 'Creating new database MthoDWH...';
CREATE DATABASE MthoDWH;
GO

-- Switch context to the new database
USE MthoDWH;
GO

/*
===============================================================================
 Creating Schemas Based on Medallion Architecture
===============================================================================
*/

-- Bronze Schema
-- Stores raw ingested data from source systems (CRM, ERP)
CREATE SCHEMA bronze;
GO

-- Silver Schema
-- Stores cleaned, validated, and transformed data
CREATE SCHEMA silver;
GO

-- Gold Schema
-- Stores business-ready data (Fact & Dimension tables)
CREATE SCHEMA gold;
GO

PRINT 'Database and schemas created successfully.';
