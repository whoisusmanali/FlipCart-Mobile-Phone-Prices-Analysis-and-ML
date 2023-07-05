-- Creating new DataBase
CREATE DATABASE Phone_data

USE Phone_data
--Looking for data
SELECT * FROM Mobile_phone_dataset


--In the first column there is Phone Names which has also the the name of the company so let's extract the company name.
SELECT "Phone Name",
CASE
	WHEN "Phone Name" LIKE '%POCO%' THEN 'POCO'
	WHEN "Phone Name" LIKE '%[Rr]ealme%' THEN 'REALME'
	WHEN "Phone Name" LIKE '%APPLE%' THEN 'APPLE'
	WHEN "Phone Name" LIKE '%samsung%' THEN 'SAMSUNG'
	WHEN "Phone Name" LIKE '%oppo%' THEN 'OPPO'
	WHEN "Phone Name" LIKE '%GOOGLE%' THEN 'GOOGLE'
	WHEN "Phone Name" LIKE '%VIVO%' THEN 'VIVO'
	WHEN "Phone Name" LIKE '%NOTHING%' THEN 'NOTHING'
	WHEN "Phone Name" LIKE '%NOKIA%' THEN 'NOKIA'
	WHEN "Phone Name" LIKE 'MOTOROLA%' THEN 'MOTOROLA'
	WHEN "Phone Name" LIKE '%ONEPLUS%' THEN 'ONEPLUS'
	WHEN "Phone Name" LIKE '%HUAWEI%' THEN 'HUAWEI'
	WHEN "Phone Name" LIKE '%ALCATEL%' THEN 'ALCATEL'
	WHEN "Phone Name" LIKE '%LENOVO%' THEN 'LENOVO'
	WHEN "Phone Name" LIKE '%INFINIX%' THEN 'INFINIX'
	WHEN "Phone Name" LIKE '%MI%' THEN 'MI'
	ELSE 'MOTOROLA'
END
FROM Mobile_phone_dataset

--Add new column for these values
		--Adding new column
ALTER TABLE Mobile_phone_dataset
ADD Company_name varchar(50)

update Mobile_phone_dataset
set Company_name = CASE
	WHEN "Phone Name" LIKE '%POCO%' THEN 'POCO'
	WHEN "Phone Name" LIKE '%[Rr]ealme%' THEN 'REALME'
	WHEN "Phone Name" LIKE '%APPLE%' THEN 'APPLE'
	WHEN "Phone Name" LIKE '%samsung%' THEN 'SAMSUNG'
	WHEN "Phone Name" LIKE '%oppo%' THEN 'OPPO'
	WHEN "Phone Name" LIKE '%GOOGLE%' THEN 'GOOGLE'
	WHEN "Phone Name" LIKE '%VIVO%' THEN 'VIVO'
	WHEN "Phone Name" LIKE '%NOTHING%' THEN 'NOTHING'
	WHEN "Phone Name" LIKE '%NOKIA%' THEN 'NOKIA'
	WHEN "Phone Name" LIKE 'MOTOROLA%' THEN 'MOTOROLA'
	WHEN "Phone Name" LIKE '%ONEPLUS%' THEN 'ONEPLUS'
	WHEN "Phone Name" LIKE '%HUAWEI%' THEN 'HUAWEI'
	WHEN "Phone Name" LIKE '%ALCATEL%' THEN 'ALCATEL'
	WHEN "Phone Name" LIKE '%LENOVO%' THEN 'LENOVO'
	WHEN "Phone Name" LIKE '%INFINIX%' THEN 'INFINIX'
	WHEN "Phone Name" LIKE '%MI%' THEN 'MI'
	ELSE 'MOTOROLA'
END

		--look at the table now and check for any null value
SELECT *
FROM Mobile_phone_dataset
WHERE Company_name is null
--Every thing is Ok


--Let's extract the Ram size only
		--First let only get the correct values of RAM
SELECT *,
CASE
	WHEN RAM LIKE '%RAM%' THEN RAM
	ELSE '0'
END AS RAM_SIZE
FROM Mobile_phone_dataset

--Adding new column
ALTER TABLE Mobile_phone_dataset
add RAM_Size varchar(50)
--Adding the new values
UPDATE Mobile_phone_dataset
set RAM_Size = CASE
	WHEN RAM LIKE '%RAM%' THEN RAM
	ELSE '0'
END

--Getting the Ram size
SELECT ram_size ,
--SUBSTRING(ram_size,1,CHARINDEX(' ',ram_size)),
CASE
	WHEN RAM_SIZE='0' THEN '0'
	ELSE SUBSTRING(ram_size,1,CHARINDEX(' ',ram_size))
END
FROM Mobile_phone_dataset
--Updating the values into Table
UPDATE Mobile_phone_dataset
set ram_size = CASE
	WHEN RAM_SIZE='0' THEN '0'
	ELSE SUBSTRING(ram_size,1,CHARINDEX(' ',ram_size))
END


--Now do the same with ROM/Storage Column
		--Firstly, let's get the those values that are in RAM column of Rom
SELECT *,
CASE
	WHEN "ROM/STORAGE" LIKE '%ROM' THEN "ROM/STORAGE"
	ELSE RAM
END
FROM Mobile_phone_dataset

		--Create new column
ALTER TABLE Mobile_phone_dataset
ADD STORAGE_SIZE VARCHAR(255)

		--Update the values
UPDATE Mobile_phone_dataset
set STORAGE_SIZE = CASE
	WHEN "ROM/STORAGE" LIKE '%ROM' THEN "ROM/STORAGE"
	ELSE RAM
END

		--Now get the only size of the Storage

SELECT "STORAGE_SIZE",
CASE
	WHEN STORAGE_SIZE LIKE 'NA%' THEN '0'
	WHEN STORAGE_SIZE LIKE '%ROM' THEN SUBSTRING("STORAGE_SIZE",1,CHARINDEX(' ',"STORAGE_SIZE"))
	ELSE '0'
END
FROM Mobile_phone_dataset

--Update the final values
UPDATE Mobile_phone_dataset
SET STORAGE_SIZE = CASE
	WHEN STORAGE_SIZE LIKE 'NA%' THEN '0'
	WHEN STORAGE_SIZE LIKE '%ROM' THEN SUBSTRING("STORAGE_SIZE",1,CHARINDEX(' ',"STORAGE_SIZE"))
	ELSE '0'
END


--Now we have to remove the useless columns from this table for now
ALTER TABLE Mobile_phone_dataset
DROP COLUMN RAM
ALTER TABLE Mobile_phone_dataset
DROP COLUMN "ROM/STORAGE", "DATE OF SCRAPING"

--Change the datatypes of RAm_size and storage column
ALTER TABLE Mobile_phone_dataset
ALTER COLUMN RAM_Size INT

ALTER TABLE Mobile_phone_dataset
ALTER COLUMN PRICE_IN_INR INT

ALTER TABLE MOBILE_PHONE_DATASET
ALTER COLUMN STORAGE_SIZE FLOAT

SELECT * FROM Mobile_phone_dataset