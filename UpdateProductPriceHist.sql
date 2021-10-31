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