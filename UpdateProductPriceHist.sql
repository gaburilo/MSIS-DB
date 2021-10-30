CREATE TRIGGER update_ProductPrice_History ON dbo.Product
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;

DECLARE @ProductID INT
DECLARE @ProductName VARCHAR(30)
DECLARE @ProductPrice INT
DECLARE @Date_Updated DATE = GETDATE()

SELECT @ProductID = ProductID from inserted
SELECT @ProductName = ProductName from inserted
SELECT @ProductPrice = ProductPrice from inserted

INSERT INTO ProductPrice_History (ProductID, ProductName, ProductPrice, Date_Updated)
VALUES (@ProductID, @ProductName, @ProductPrice, @Date_Updated)

END
GO