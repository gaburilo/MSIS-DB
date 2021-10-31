/* A View */

CREATE OR ALTER VIEW customerTrainer AS
	SELECT c.CustomerID,
			CONCAT(c.Firstname,' ',c.Lastname) as CustomerName,
			ce.Email,cr.CourseName,st.StudioName,cl.Date,Time
			,CONCAT(em.Firstname,' ',em.Lastname) as TrainerName
	From Customer AS c
	LEFT OUTER JOIN Customer_Email AS ce ON c.CustomerID=ce.CustomerID
	INNER JOIN Membership AS m ON c.CustomerID=m.CustomerID  
	INNER JOIN Schedule AS s ON m.MembershipID=s.MembershipID  
	INNER JOIN Class AS cl ON s.ClassID=cl.ClassID
	INNER JOIN Course as cr ON cl.CourseID=cr.CourseID
   	INNER JOIN Trainer as tr ON cl.EmployeeID=tr.EmployeeID
	INNER JOIN Employee as em ON tr.EmployeeID=em.EmployeeID
	INNER JOIN Studio AS st ON cl.StudioID=st.StudioID;

Select * from CustomerTrainer
Order by CustomerName;


-- Trigger
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

-- Store Procedure
Select * from Customer;
CREATE OR ALTER PROCEDURE addCustomer

  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @Weight TINYINT,
  @Height TINYINT,
  @Street VARCHAR(50),
  @City VARCHAR(50),
  @State VARCHAR(2),
  @Zip CHAR(5),
  @Email VARCHAR(50),
  @ProductId INT

  AS 
  BEGIN
	DECLARE @CustomerID INT;
	DECLARE @OrderID INT;
	DECLARE @Current_Price FLOAT;
	

	Select @CustomerID=count(CustomerID)+1 from Customer;
	Select @OrderID=count(OrderID)+1 from Order_Header;
	Select @Current_Price=0 
	BEGIN TRANSACTION
		
		--- Customer
		INSERT INTO Customer(CustomerId,FirstName, LastName, Weight, Height, Street, City, State, Zip)
		VALUES (@CustomerID, @FirstName, @LastName, @Weight, @Height, @Street, @City, @State, @Zip) 
		
		--- Customer Email
		INSERT INTO Customer_Email (CustomerID,Email)
		VALUES (@CustomerId,@Email)
				
		---- Order_Header 
		INSERT INTO Order_Header
		VALUES (@OrderID,@CustomerID,'Merchandise')

		---- 
		INSERT INTO OrderLine
		VALUES (@OrderID, @ProductId,1,GETDATE(),@Current_Price) 

		COMMIT;

	END;


EXECUTE addCustomer
  @FirstName = 'Gabriela',
  @LastName = 'Rivera',
  @Weight = 127,
  @Height = 159,
  @Street = '299 N C St',
  @City = 'Murray',
  @State = 'UT',
  @Zip = 84103,
  @Email = 'khds@gmail.com',
  @ProductID = 10
  
  Select * from Customer;
  SELECT * from Customer_Email;
  SELECT * FROM Order_Header;
  SELECT * from Membership;
  SELECT * from OrderLine;
  SELECT * from Product;

  --- User-Defined Functions

CREATE OR ALTER FUNCTION CalculateTotal
(	@Quantity INT,
	@Product_Price INT
)

RETURNS FLOAT
AS
BEGIN
	RETURN (@Quantity * @Product_Price);
END;

SELECT ol.OrderId,
		CONCAT(c.FirstName,' ',c.LastName) as CustomerName,
		SUM(dbo.CalculateTotal(ol.Quantity,ol.Current_Price) ) as Total
FROM OrderLine as ol
INNER JOIN Order_Header as oh ON ol.OrderID=oh.OrderID
INNER JOIN Customer as c ON oh.CustomerID=c.CustomerID
Group By ol.OrderID,CONCAT(c.FirstName,' ',c.LastName);

----------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION MembershipXMonth
(	@Start_Date DATE
)

RETURNS INT
AS
BEGIN
	RETURN  DATEPART(month, @Start_Date);
END;



Select (dbo.MembershipMonth (Start_Date)) as Month, count(CustomerId) as 'Total Customers'
  from Membership
  Group by (dbo.MembershipMonth (Start_Date))




