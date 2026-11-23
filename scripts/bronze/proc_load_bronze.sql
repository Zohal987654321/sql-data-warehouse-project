---INSERTING DATA INTO OUR TABLES
/*

===================
CRM TABLES INSERTS
====================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

    BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME
    DECLARE @batch_start_time DATETIME, @batch_end_time DATETIME
    set @batch_start_time=getdate() 
    BEGIN TRY

        PRINT '=================================================';
        PRINT'           LOADING BRONZE LAYER                     ';
        PRINT' ==================================================';

    
        PRINT '---------------------------------------------------';
        PRINT'           LOADING CRM TABLES                   ';
        PRINT' ---------------------------------------------------';

        ---Table bronze.crm_cust_info
        set @start_time=GETDATE();

        PRINT'>>> TRUNCATING bronze.crm_cust_info'


        TRUNCATE TABLE bronze.crm_cust_info;

         PRINT'>>> INSERTING DATA INTO bronze.crm_cust_info'

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_crm\cust_info.csv'
        WITH(
	        FIRSTROW=2,
	        FIELDTERMINATOR=',',
	        TABLOCK
        );
        set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';

        ---Table bronze.crm_prd_info
        set @start_time=GETDATE();
        
        PRINT'>>> TRUNCATING bronze.crm_prd_info'

        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>>>INSERTING DATA INTO bronze.crm_prd_info'

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_crm\prd_info.csv'
        WITH(
	        FIRSTROW=2,
	        FIELDTERMINATOR=',',
	        TABLOCK
        );
        
        set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';

        ---Table bronze.crm_sales_details

        PRINT ' >>> TRUNCATING bronze.crm_sales_details'
        set @start_time=GETDATE()

        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT' >>> INSERTING DATA INTO bronze.crm_sales_details'
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_crm\sales_details.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
 
            TABLOCK
        );
        
        set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';

         PRINT '---------------------------------------------------';
        PRINT'           LOADING ERP TABLES                   ';
        PRINT' ---------------------------------------------------';

        ---Table bronze.erp_CUST_AZ12
        set @start_time=GETDATE()

        PRINT'>>> TRUNCATING bronze.erp_CUST_AZ12'

        TRUNCATE TABLE bronze.erp_CUST_AZ12;

        PRINT'>>> INSERTING DATA INTO bronze.erp_CUST_AZ12'

        BULK INSERT bronze.erp_CUST_AZ12
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_erp\CUST_AZ12.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
 
            TABLOCK
        );
        
        set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';
        ---Table bronze.erp_LOC_A101

        SET @start_time=GETDATE()

        PRINT'>>> TRUNCATING bronze.erp_LOC_A101';

        TRUNCATE TABLE bronze.erp_LOC_A101;
        PRINT'>>> INSERTING DATA INTO bronze.erp_LOC_A101'
        BULK INSERT bronze.erp_LOC_A101
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_erp\LOC_A101.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
 
            TABLOCK
        );
        set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';



        ---Table bronze.erp_CUST_AZ12
        SET @start_time=GETDATE()

        PRINT'TRUNCATING bronze.erp_PX_CAT_G1V2'
        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
        PRINT'INSERTING DATA INTO bronze.erp_PX_CAT_G1V2'
        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM 'C:\Users\dzoha\OneDrive\Desktop\Data with Baraa\source_erp\PX_CAT_G1V2.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
 
            TABLOCK
        );
       set @end_time=GETDATE();

        print'>>> Duration:'+ cast(datediff(second,@end_time,@start_time) as varchar) + ' seconds';

        print'------------------------------------------------------------';
END TRY
BEGIN CATCH
   PRINT'============================================'
   PRINT' ERROR OCCURED DURING LOADING BRONZE LAYER '
   PRINT'============================================'
   PRINT 'ERROR_MESSAGE:'+ ERROR_MESSAGE();
   PRINT 'ERROR_NUMBER:'+ CAST(ERROR_NUMBER() AS VARCHAR(300));
   

END CATCH
SET @batch_end_time =getdate()

PRINT'  TOTAL LOAD DURATION:'+ cast(datediff(second,@batch_end_time,@batch_start_time) as varchar) + ' seconds';
END

