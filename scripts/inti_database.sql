/* 

     =========================================
           Create database and schemas 
     =========================================
Script Purpose:
     This script creates a new database names 'DataWarehouse' after checking if it already exists.
     If the database exists , it is dropped and recreated.Additionally, the script sets up three schemas
     within the database:'bronze','silver' and 'gold'.

WARNING:
    Running this script will drop the entire database 'DataWarehouse' if it exists.
    All data in the database will be permanently deleted.Proceed with caution and ensure you have 
    proper backups before running this script.
*/



---Create Database DataWarehouse
USE MASTER;
GO

---Drop and recreate the Datawarehouse database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
  Alter DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
  DROP DATABASE DataWarehouse;
END;
GO
--Creating Database

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

---Creating schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

