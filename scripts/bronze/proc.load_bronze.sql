
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @Start_time DATETIME, @End_time DATETIME;
	BEGIN TRY
	PRINT '===================================';
	PRINT 'LOAD BRONZE LAYER';
	PRINT '===================================';

	PRINT '===================================';
	PRINT 'LOAD CRM TABLES';
	PRINT '===================================';


		SET @Start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_customer_info;

		BULK INSERT bronze.crm_customer_info
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE();
		PRINT 'LOAD DURATION :' + CAST(DATEDIFF(second, @Start_time, @End_time) AS NVARCHAR) + ' SECONDS';


		/***************************************************************************************************************************/

		TRUNCATE TABLE bronze.crm_product_info;

		BULK INSERT bronze.crm_product_info
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		/***************************************************************************************************************************/

		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		/***************************************************************************************************************************/

		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		/***************************************************************************************************************************/

		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		/***************************************************************************************************************************/

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\rahul\OneDrive\Documents\Sridhar\project-SQL\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT '======================================================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER '
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '======================================================'
	END CATCH;
END;

--DROP PROCEDURE bronze.load_bronze;
EXEC bronze.load_bronze;
