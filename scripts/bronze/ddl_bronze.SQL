
USE DataWarehouse
Go
/* This script create tables into the Bronze schema */

---Create table Customer Info
IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
cust_id INT ,
cst_key VARCHAR(50),
cst_firstname VARCHAR(255),
cst_lastname VARCHAR(255),
cst_marital_status VARCHAR(50),
cst_gndr VARCHAR(10),
cst_create_date DATE
)
---prd_id	prd_key	prd_nm	prd_cost	prd_line	prd_start_dt	prd_end_dt
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
		DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info
(prd_id INT,
prd_key VARCHAR(200),
prd_nm VARCHAR(255),
prd_cost INT,
prd_line varchar(255),
prd_start_dt DATE,
prd_end_dt DATE
)

---table sales_details columns sls_ord_num	sls_prd_key	sls_cust_id	sls_order_dt	sls_ship_dt	sls_due_dt	sls_sales	sls_quantity	sls_price
IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
   DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
)

--- CID	BDATE	GEN

IF OBJECT_ID('bronze.erp_CUST_AZ12','U') IS NOT NULL
	DROP TABLE bronze.erp_CUST_AZ12;
CREATE TABLE bronze.erp_CUST_AZ12(
CID VARCHAR(55),
BDATE DATE,
GEN VARCHAR(55))
--LOC_A101 CID	CNTRY
IF OBJECT_ID('bronze.erp_LOC_A101','U') is not null
	 drop table bronze.erp_LOC_A101;
CREATE TABLE bronze.erp_LOC_A101(
CID VARCHAR(55),
CNTRY VARCHAR(55))
--PX_CAT_G1V2   COLUMNS ID	CAT	SUBCAT	MAINTENANCE
IF OBJECT_ID ('bronze.erp_PX_CAT_G1V2','U') IS NOT NULL
	DROP TABLE bronze.erp_PX_CAT_G1V2;
CREATE TABLE bronze.erp_PX_CAT_G1V2(
ID VARCHAR(55),
CAT VARCHAR(55),
SUBCAT VARCHAR(55),
MAINTENANCE VARCHAR(55))
