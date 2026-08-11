/*

***Create Database and Schemas***

Script Purpose:

This script creates a new database named 'DataWarehouse' after checking if it already exists.

If the database exists, it is dropped and recreated. Additionaly, the script sets up three schemas within the database: Bronze -> Silver -> Gold

Warning:

Running this script will drop the entire DataWarehouse databse if it exists.
All the data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.


*/

use master;
GO

--drop and recreate the datawarehouse database
IF EXISTS(SELECT 1 FROM SYS.DATABASES WHERE NAME = 'DataWarehouse')
Begin
alter Database DataWarehouse SET single_user with rollback immediate;
drop database DataWarehouse;
end;
go

--Create the 'DataWarehouse' Datgabase
CREATE DATABASE DataWarehouse;
GO

use DataWarehouse;
GO

--create medalion schemas
create schema Bronze;
go
create schema Silver;
go
create schema Gold;

