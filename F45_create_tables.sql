CREATE TABLE [Product] (
  [ProductID] INT,
  [ProductName] VARCHAR(30),
  [ProductPrice] INT,
  PRIMARY KEY ([ProductID])
);

CREATE TABLE [Employee] (
  [EmployeeID ] INT,
  [FirstName] VARCHAR(50),
  [LastName] VARCHAR(50),
  [Profile] VARCHAR(1000),
  PRIMARY KEY ([EmployeeID ])
);

CREATE TABLE [Trainer] (
  [EmployeeID ] INT,
  [CourseID] VARCHAR(50),
  [HourlyRate] VARCHAR(50),
  [Certification] TINYINT,
  [Rating] TINYINT,
  PRIMARY KEY ([EmployeeID ]),
  CONSTRAINT [FK_Trainer.EmployeeID ]
    FOREIGN KEY ([EmployeeID ])
      REFERENCES [Employee]([EmployeeID ])
);

CREATE TABLE [Customer] (
  [CustomerID ] INT,
  [FirstName] VARCHAR(50),
  [LastName] VARCHAR(50),
  [Weight] TINYINT,
  [Height] TINYINT,
  [Street] VARCHAR(50),
  [City] VARCHAR(50),
  [State] VARCHAR(2),
  [Zip] TINYINT,
  PRIMARY KEY ([CustomerID ])
);

CREATE TABLE [Order] (
  [OrderID ] INT,
  [CustomerID] INT,
  [OrderType] VARCHAR(50),
  PRIMARY KEY ([OrderID ], [CustomerID]),
  CONSTRAINT [FK_Order.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([CustomerID ])
);

CREATE TABLE [OrderLine] (
  [OrderID] INT,
  [ProductID] INT,
  [Quantity] INT,
  [Order_Date] DATETIME,
  [Current_Price]  FLOAT,
  PRIMARY KEY ([OrderID], [ProductID]),
  CONSTRAINT [FK_OrderLine.OrderID]
    FOREIGN KEY ([OrderID])
      REFERENCES [Order]([OrderID ]),
  CONSTRAINT [FK_OrderLine.ProductID]
    FOREIGN KEY ([ProductID])
      REFERENCES [Product]([ProductID])
);

CREATE TABLE [ProductMembership] (
  [ProductID] INT,
  [MembershipType] VARCHAR(30),
  [Duration] VARCHAR(50),
  PRIMARY KEY ([ProductID]),
  CONSTRAINT [FK_ProductMembership.ProductID]
    FOREIGN KEY ([ProductID])
      REFERENCES [Product]([ProductID])
);

CREATE TABLE [Membership] (
  [MembershipID] INT,
  [CustomerID ] INT,
  [ProductID] INT,
  [Start_Date] DATE,
  [End_Date] DATE,
  PRIMARY KEY ([MembershipID], [CustomerID ], [ProductID]),
  CONSTRAINT [FK_Membership.CustomerID ]
    FOREIGN KEY ([CustomerID ])
      REFERENCES [Customer]([CustomerID ]),
  CONSTRAINT [FK_Membership.ProductID]
    FOREIGN KEY ([ProductID])
      REFERENCES [ProductMembership]([ProductID])
);

CREATE TABLE [Studio] (
  [StudioID ] INT,
  [StudioName] VARCHAR(50),
  [Street] VARCHAR(50),
  [City] VARCHAR(50),
  [State] VARCHAR(2),
  [Zip] TINYINT,
  [Instagram] VARCHAR(50),
  [Facebook] TINYINT,
  PRIMARY KEY ([StudioID ])
);

CREATE TABLE [Course] (
  [CourseID] INT,
  [EmployeeID] VARCHAR(50),
  [StudioID] VARCHAR(50),
  [CourseName] TINYINT,
  [Category] TINYINT,
  [Description] VARCHAR(1000),
  [Duralion] VARCHAR(50),
  PRIMARY KEY ([CourseID]),
  CONSTRAINT [FK_Course.StudioID]
    FOREIGN KEY ([StudioID])
      REFERENCES [Studio]([StudioID ]),
  CONSTRAINT [FK_Course.EmployeeID]
    FOREIGN KEY ([EmployeeID])
      REFERENCES [Trainer]([EmployeeID ])
);

CREATE TABLE [ProductMerchandise] (
  [ProductID] INT,
  [Brand] VARCHAR(30),
  [Size] VARCHAR(50),
  PRIMARY KEY ([ProductID]),
  CONSTRAINT [FK_ProductMerchandise.ProductID]
    FOREIGN KEY ([ProductID])
      REFERENCES [Product]([ProductID])
);

CREATE TABLE [Schedule] (
  [MembershipID] INT,
  [CourseID] INT,
  [Date] DATE,
  [Time] TIME,
  PRIMARY KEY ([MembershipID], [CourseID]),
  CONSTRAINT [FK_Schedule.MembershipID]
    FOREIGN KEY ([MembershipID])
      REFERENCES [Membership]([MembershipID]),
  CONSTRAINT [FK_Schedule.CourseID]
    FOREIGN KEY ([CourseID])
      REFERENCES [Studio]([StudioID ])
);

CREATE TABLE [Sales_Rep] (
  [EmployeeID ] INT,
  [Salary] VARCHAR(50),
  PRIMARY KEY ([EmployeeID ]),
  CONSTRAINT [FK_Sales_Rep.EmployeeID ]
    FOREIGN KEY ([EmployeeID ])
      REFERENCES [Employee]([EmployeeID ])
);

CREATE TABLE [Admin] (
  [EmployeeID ] INT,
  [Position] VARCHAR(50),
  PRIMARY KEY ([EmployeeID ]),
  CONSTRAINT [FK_Admin.EmployeeID ]
    FOREIGN KEY ([EmployeeID ])
      REFERENCES [Employee]([EmployeeID ])
);

CREATE TABLE [Employee_Email] (
  [EmployeeID ] INT,
  [Email] VARCHAR(50),
  PRIMARY KEY ([EmployeeID ]),
  CONSTRAINT [FK_Employee_Email.EmployeeID ]
    FOREIGN KEY ([EmployeeID ])
      REFERENCES [Employee]([EmployeeID ])
);

CREATE TABLE [Employee_Phone] (
  [EmployeeID ] INT,
  [Phone] VARCHAR(15),
  PRIMARY KEY ([EmployeeID ]),
  CONSTRAINT [FK_Employee_Phone.EmployeeID ]
    FOREIGN KEY ([EmployeeID ])
      REFERENCES [Employee]([EmployeeID ])
);

CREATE TABLE [Customer_Phone] (
  [CustomerID] INT,
  [Phone] VARCHAR(15),
  PRIMARY KEY ([CustomerID]),
  CONSTRAINT [FK_Customer_Phone.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([CustomerID ])
);

CREATE TABLE [Customer_Email] (
  [CustomerID] INT,
  [Email] VARCHAR(50),
  PRIMARY KEY ([CustomerID]),
  CONSTRAINT [FK_Customer_Email.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([CustomerID ])
);

