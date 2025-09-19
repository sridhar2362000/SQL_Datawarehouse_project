/*
Create Database and schemas : 
This scripts create the new database named as 'DataWarehouse' and schemas like 'bronze', 'silver', 'gold'
*/




create database DataWarehouse;

use DataWarehouse;

create schema bronze;
create schema silver;
create schema gold;