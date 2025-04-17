-- 1. Create a credential for Cosmos DB
CREATE CREDENTIAL [cosmosxxxxxxxx]
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'your_cosmos_primary_key'
GO

-- 2. Query TOP 100 records from Cosmos DB
SELECT TOP 100 *
FROM OPENROWSET(
    PROVIDER = 'CosmosDB',
    CONNECTION = 'Account=cosmosxxxxxxxx;Database=AdventureWorks',
    OBJECT = 'Sales',
    SERVER_CREDENTIAL = 'cosmosxxxxxxxx'
) AS [Sales]
GO

-- 3. Query structured (schema-defined) data from Cosmos DB
SELECT *
FROM OPENROWSET(
    PROVIDER = 'CosmosDB',
    CONNECTION = 'Account=cosmosxxxxxxxx;Database=AdventureWorks',
    OBJECT = 'Sales',
    SERVER_CREDENTIAL = 'cosmosxxxxxxxx'
)
WITH (
    OrderID VARCHAR(10) '$.id',
    OrderDate VARCHAR(10) '$.orderdate',
    CustomerID INTEGER '$.customerid',
    CustomerName VARCHAR(40) '$.customerdetails.customername',
    CustomerEmail VARCHAR(30) '$.customerdetails.customeremail',
    Product VARCHAR(30) '$.product',
    Quantity INTEGER '$.quantity',
    Price FLOAT '$.price'
)
AS sales
ORDER BY OrderID;

