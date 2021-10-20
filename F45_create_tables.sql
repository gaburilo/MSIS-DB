DROP TABLE IF EXISTS Customer ;

DROP TABLE IF EXISTS Order_Header;

DROP TABLE IF EXISTS OrderLine ;

DROP TABLE IF EXISTS Product ;

DROP TABLE IF EXISTS Product_Membership;

DROP TABLE IF EXISTS Product_Merchandise ;

DROP TABLE IF EXISTS Membership ;

DROP TABLE IF EXISTS Studio ;

DROP TABLE IF EXISTS Employee ;

DROP TABLE IF EXISTS  Trainer;

DROP TABLE IF EXISTS  Sales_Rep;

DROP TABLE IF EXISTS Studio_Admin ;

DROP TABLE IF EXISTS Course;

DROP TABLE IF EXISTS Schedule;

DROP TABLE IF EXISTS Employee_Email ;

DROP TABLE IF EXISTS Employee_Phone;

DROP TABLE IF EXISTS Customer_Email;

DROP TABLE IF EXISTS Customer_Phone ;


CREATE TABLE Customer (
  CustomerID  INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Weight TINYINT,
  Height TINYINT,
  Street VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(2),
  Zip TINYINT,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Customer_Phone (
  CustomerID INT,
  Phone VARCHAR(15),
  PRIMARY KEY (CustomerID),
  CONSTRAINT FK_Customer_Phone_CustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID)
);

CREATE TABLE Customer_Email (
  CustomerID INT,
  Email VARCHAR(50),
  PRIMARY KEY (CustomerID),
  CONSTRAINT FK_Customer_Email_CustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID )
);

CREATE TABLE Order_Header (
  OrderID  INT,
  CustomerID INT,
  OrderType VARCHAR(50),
  PRIMARY KEY (OrderID),
  CONSTRAINT FK_Order_CustomerID
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID )
);



CREATE TABLE Product (
  ProductID INT,
  ProductName VARCHAR(30),
  ProductPrice INT,
  PRIMARY KEY (ProductID)
);

CREATE TABLE OrderLine (
  OrderID INT,
  ProductID INT,
  Quantity INT,
  Order_Date DATETIME,
  Current_Price  FLOAT,
  PRIMARY KEY (OrderID, ProductID),
  CONSTRAINT FK_OrderLine_OrderID
    FOREIGN KEY (OrderID)
      REFERENCES Order_Header(OrderID),
  CONSTRAINT FK_OrderLine_ProductID
    FOREIGN KEY (ProductID)
      REFERENCES Product(ProductID)
);

CREATE TABLE ProductMembership (
  ProductID INT,
  MembershipType VARCHAR(30),
  Duration VARCHAR(50),
  PRIMARY KEY (ProductID),
  CONSTRAINT FK_ProductMembership_ProductID
    FOREIGN KEY (ProductID)
      REFERENCES Product(ProductID)
);


CREATE TABLE ProductMerchandise (
  ProductID INT,
  Brand VARCHAR(30),
  Size VARCHAR(50),
  PRIMARY KEY (ProductID),
  CONSTRAINT FK_ProductMerchandise_ProductID
    FOREIGN KEY (ProductID)
      REFERENCES Product(ProductID)
);

CREATE TABLE Membership (
  MembershipID INT,
  CustomerID  INT,
  ProductID INT,
  Start_Date DATE,
  End_Date DATE,
  PRIMARY KEY (MembershipID),
  CONSTRAINT FK_Membership_CustomerID 
    FOREIGN KEY (CustomerID)
      REFERENCES Customer(CustomerID),
  CONSTRAINT FK_Membership_ProductID
    FOREIGN KEY (ProductID)
      REFERENCES ProductMembership(ProductID)
);

CREATE TABLE Studio (
  StudioID  INT,
  StudioName VARCHAR(50),
  Street VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(2),
  Zip TINYINT,
  Instagram VARCHAR(50),
  Facebook TINYINT,
  PRIMARY KEY (StudioID)
);

CREATE TABLE Employee (
  EmployeeID  INT,
  StudioID    INT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Profile VARCHAR(1000),
  PRIMARY KEY (EmployeeID),
  CONSTRAINT FK_Employee_StudioID
    FOREIGN KEY (StudioID)
      REFERENCES Studio(StudioID)
);

CREATE TABLE Sales_Rep (
  EmployeeID  INT,
  Salary VARCHAR(50),
  PRIMARY KEY (EmployeeID ),
  CONSTRAINT FK_Sales_Rep_EmployeeID 
    FOREIGN KEY (EmployeeID )
      REFERENCES Employee(EmployeeID)
);

CREATE TABLE Studio_Admin (
  EmployeeID  INT,
  Position VARCHAR(50),
  PRIMARY KEY (EmployeeID ),
  CONSTRAINT FK_Admin_EmployeeID 
    FOREIGN KEY (EmployeeID )
      REFERENCES Employee(EmployeeID)
);

CREATE TABLE Trainer (
  EmployeeID  INT,
  CourseID VARCHAR(50),
  HourlyRate VARCHAR(50),
  Certification TINYINT,
  Rating TINYINT,
  PRIMARY KEY (EmployeeID ),
  CONSTRAINT FK_Trainer_EmployeeID 
    FOREIGN KEY (EmployeeID )
      REFERENCES Employee(EmployeeID)
);


CREATE TABLE Employee_Email (
  EmployeeID  INT,
  Email VARCHAR(50),
  PRIMARY KEY (EmployeeID ),
  CONSTRAINT FK_Employee_Email_EmployeeID 
    FOREIGN KEY (EmployeeID)
      REFERENCES Employee(EmployeeID )
);

CREATE TABLE Employee_Phone (
  EmployeeID  INT,
  Phone VARCHAR(15),
  PRIMARY KEY (EmployeeID ),
  CONSTRAINT FK_Employee_Phone_EmployeeID 
    FOREIGN KEY (EmployeeID)
      REFERENCES Employee(EmployeeID )
);

CREATE TABLE Course (
  CourseID INT,
  EmployeeID INT,
  StudioID INT,
  CourseName TINYINT,
  Category TINYINT,
  Description VARCHAR(1000),
  Duralion VARCHAR(50),
  PRIMARY KEY (CourseID),
  CONSTRAINT FK_Course_StudioID
    FOREIGN KEY (StudioID)
      REFERENCES Studio(StudioID),
  CONSTRAINT FK_Course_EmployeeID
    FOREIGN KEY (EmployeeID)
      REFERENCES Trainer(EmployeeID)
);


CREATE TABLE Schedule (
  MembershipID INT,
  CourseID INT,
  Date DATE,
  Time TIME,
  PRIMARY KEY (MembershipID, CourseID),
  CONSTRAINT FK_Schedule_MembershipID
    FOREIGN KEY (MembershipID)
      REFERENCES Membership(MembershipID),
  CONSTRAINT FK_Schedule_CourseID
    FOREIGN KEY (CourseID)
      REFERENCES Studio(StudioID)
);



