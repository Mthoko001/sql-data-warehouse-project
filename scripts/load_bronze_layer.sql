# 🥉 Bronze Layer – Full Load Stored Procedure

## 📌 Procedure: `bronze.load_bronze`

---

## 📖 Overview

This stored procedure performs a **FULL LOAD** of the Bronze layer in the Modern SQL Data Warehouse.

The Bronze layer stores **raw data** ingested directly from CRM and ERP source systems.  
This procedure:

- Truncates existing Bronze tables
- Reloads fresh data from CSV files using `BULK INSERT`
- Logs execution progress
- Handles runtime errors using `TRY...CATCH`

---

## ⚠ WARNING – IMPORTANT

- This is a **FULL REFRESH** process.
- All existing data in Bronze tables will be permanently deleted.
- Ensure CSV files exist at the specified file paths.
- SQL Server must have file system access permissions.
- Do NOT execute in production unless intentional.

---

## 🛠 Stored Procedure Code

```sql
/*
===============================================================================
 Project: Modern SQL Data Warehouse
 Layer: Bronze (Raw Data Load)
 Procedure: bronze.load_bronze
 Author: Mthokozisi Seja

 Description:
     This stored procedure performs a FULL LOAD of the Bronze layer.
     It truncates existing data and reloads fresh data from CSV source files
     (CRM and ERP systems).

 WARNING:
     - This is a FULL REFRESH process.
     - All existing data in Bronze tables will be permanently deleted.
     - Ensure source files exist at the specified file paths.
     - BULK INSERT requires appropriate SQL Server file access permissions.
     - Do NOT run in production unless intentional.
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

        PRINT '========================================';
        PRINT '      FULL LOAD - BRONZE LAYER          ';
        PRINT '========================================';


        /* ================================================================
           CRM TABLES
        ================================================================= */

        PRINT '----------------------------------------';
        PRINT ' Loading CRM Tables';
        PRINT '----------------------------------------';

        PRINT 'Truncating bronze.crm_cust_info...';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT 'Loading bronze.crm_cust_info...';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.crm_cust_info loaded successfully.';


        PRINT 'Truncating bronze.crm_prd_info...';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT 'Loading bronze.crm_prd_info...';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.crm_prd_info loaded successfully.';


        PRINT 'Truncating bronze.crm_sales_details...';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT 'Loading bronze.crm_sales_details...';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.crm_sales_details loaded successfully.';



        /* ================================================================
           ERP TABLES
        ================================================================= */

        PRINT '----------------------------------------';
        PRINT ' Loading ERP Tables';
        PRINT '----------------------------------------';

        PRINT 'Truncating bronze.erp_cust_az12...';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT 'Loading bronze.erp_cust_az12...';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.erp_cust_az12 loaded successfully.';


        PRINT 'Truncating bronze.erp_loc_a101...';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT 'Loading bronze.erp_loc_a101...';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.erp_loc_a101 loaded successfully.';


        PRINT 'Truncating bronze.erp_px_cat_g1v2...';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT 'Loading bronze.erp_px_cat_g1v2...';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\nonhl\OneDrive\Desktop\Mthoko\DA 2026\DWH- MyProject\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        PRINT 'bronze.erp_px_cat_g1v2 loaded successfully.';


        PRINT '========================================';
        PRINT ' Bronze Layer Full Load Completed';
        PRINT '========================================';

    END TRY
    BEGIN CATCH

        PRINT '========================================';
        PRINT ' ERROR OCCURRED DURING BRONZE LOAD';
        PRINT '========================================';

        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO
```

---

## ▶️ How to Execute

```sql
EXEC bronze.load_bronze;
```

---

## 📂 Expected Dataset Structure

```
datasets/
│
├── source_crm/
│   ├── cust_info.csv
│   ├── prd_info.csv
│   └── sales_details.csv
│
└── source_erp/
    ├── CUST_AZ12.csv
    ├── LOC_A101.csv
    └── PX_CAT_G1V2.csv
```

---

## 🎯 Why This Is Important

This implementation demonstrates:

- Full-load ETL strategy
- Multi-system ingestion (CRM + ERP)
- Structured logging
- Enterprise-style SQL scripting
- Medallion Architecture design

---

**Author:**  
Mthokozisi Seja  
SQL | Data Warehousing | Power BI | Analytics
