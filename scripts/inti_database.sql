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

