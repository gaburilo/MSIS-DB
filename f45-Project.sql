Customer (CustomerID, FirstName, LastName, Email, Phone, Weight, Height, Zip, City, Street, State ) 	Primary Key (CustomerID)   Customer_Email (CustomerID, Email)
	Primary Key (CustomerID, Email)
	Foreign Key (CustomerID) Refernces Customer (CustomerID)

Order (OrderID, CustomerID, OrderType) 	Primary Key (OrderID)
	Foreign Key (CustomerID) References Customer (CustomerID)

OrderDetail (OrderID, ProductID, Quantity, Order_Date, Current_Price)
	Primary Key (OrderID, ProductID)
	Foreign Key (OrderID) References Order (OrderID)
	Foreign Key (ProductID) References Product (ProductID)

Product (ProductID, Product_Name, Product_Price,) 	Primary Key (ProductID)  Product_Membership (ProductID, MemebershipType, Duration FK or Partial? ) 	Primary	 Key (ProductID) 	Foreign Key  (ProductID) References Product (ProductID)
 Product_Merchandise (ProductID, Brand, Size FK or Partial?) 	Primary	 Key (ProductID)  	Foreign Key  (ProductID) References Product (ProductID)
 Membership (MembershipID, CustomerID, FK_Product_Membership, Start_Date, End_Date) 	Primary	 Key 	Foreign Key 

Course (CourseID, Course_Name, Category, Description, Duration)
	Primary Key (CourseID)

Employee (EmployeeID, FirstName, LastName, Phone, Email, Profile)
	Primary Key (EmployeeID)

Employee_Email (EmployeeID, Email)
	Primary Key (EmployeeID, Email)
	Foreign Key (EmployeeID) Refernces Employee (EmployeeID)

Trainer (EmployeeID, CourseID, Hourly_Rate, Certification, Rating)
	Prmary Key (EmployeeID)
	Foregin Key (EmployeeID) References Employee (EmployeeID)
	Foregin Key (CourseID) References Course (CourseID)

Sales_Rep (EmployeeID, Salary)
	Prmary Key (EmployeeID)
	Foregin Key (EmployeeID) References Employee (EmployeeID) 

Studio (StudioID, Studio_Name, Zip, State, City, Street, Instagram, Facebook)
	Prmary Key (StudioID)
