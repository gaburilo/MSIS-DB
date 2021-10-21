DROP DATABASE F45;
Create DATABASE F45;
USE F45;
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
  Zip CHAR(5),
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
  Zip CHAR(5),
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

insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (1, 'Marmaduke', 'Cattrell', 121, 188, '62 Prentice Parkway', 'Fullerton', 'CA', '92640');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (2, 'Jordan', 'Howett', 169, 210, '813 Grover Place', 'Minneapolis', 'MN', '55470');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (3, 'Gifford', 'Jewson', 204, 163, '5 Anderson Plaza', 'Anchorage', 'AK', '99512');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (4, 'Mayne', 'Dries', 197, 166, '95 Anhalt Point', 'Huntington', 'WV', '25770');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (5, 'Granger', 'Dalloway', 239, 168, '0 American Ash Place', 'Evansville', 'IN', '47737');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (6, 'Dav', 'Budget', 207, 173, '90 Forest Run Hill', 'Arlington', 'TX', '76016');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (7, 'Francoise', 'Irwin', 246, 209, '052 Melrose Circle', 'Providence', 'RI', '02912');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (8, 'Barnett', 'Rugieri', 139, 203, '0860 Spenser Point', 'Lansing', 'MI', '48956');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (9, 'Prudence', 'Sicily', 176, 167, '403 Portage Terrace', 'Reading', 'PA', '19610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (10, 'Kiah', 'Howieson', 231, 187, '490 Sycamore Lane', 'Long Beach', 'CA', '90805');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (11, 'Gayla', 'Bence', 249, 141, '6 Forest Dale Center', 'Salt Lake City', 'UT', '84125');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (12, 'Joyce', 'Corbett', 169, 210, '88763 Luster Center', 'Hartford', 'CT', '06183');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (13, 'Shawn', 'Cornforth', 133, 187, '90837 Fieldstone Point', 'Sacramento', 'CA', '95813');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (14, 'Demott', 'Aucott', 118, 183, '424 Lunder Park', 'Sacramento', 'CA', '95865');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (15, 'Heath', 'Sanger', 242, 206, '10 Twin Pines Crossing', 'Dayton', 'OH', '45403');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (16, 'Ashbey', 'Sumption', 237, 195, '52 Heffernan Street', 'Carol Stream', 'IL', '60351');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (17, 'Nikos', 'Perri', 116, 188, '894 Anniversary Junction', 'San Antonio', 'TX', '78260');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (18, 'Oby', 'McGrotty', 96, 216, '27 Calypso Drive', 'Atlanta', 'GA', '30358');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (19, 'Constancy', 'Shrimpling', 172, 205, '7467 Bowman Junction', 'Battle Creek', 'MI', '49018');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (20, 'Buiron', 'Sandland', 249, 157, '1148 Mockingbird Place', 'Des Moines', 'IA', '50347');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (21, 'Noni', 'Wenman', 163, 152, '0 Quincy Way', 'Memphis', 'TN', '38119');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (22, 'Valry', 'Whittall', 137, 200, '7 Claremont Lane', 'Washington', 'DC', '20397');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (23, 'Lane', 'Seekings', 92, 175, '218 Old Shore Hill', 'Naples', 'FL', '33963');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (24, 'Hugo', 'Murthwaite', 225, 155, '76877 Huxley Pass', 'Kansas City', 'KS', '66112');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (25, 'Marsh', 'Browning', 222, 161, '90 Dryden Center', 'Charlotte', 'NC', '28272');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (26, 'Brana', 'Harwood', 179, 176, '364 Waubesa Crossing', 'Tampa', 'FL', '33686');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (27, 'Raquel', 'Stickland', 173, 159, '6980 Summit Street', 'Athens', 'GA', '30605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (28, 'Casey', 'Nelles', 224, 181, '23893 Kenwood Avenue', 'Fresno', 'CA', '93740');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (29, 'Janka', 'Stubbin', 178, 181, '1120 Dennis Terrace', 'Albany', 'NY', '12237');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (30, 'Augustin', 'Mottinelli', 141, 195, '307 Lakeland Lane', 'Lexington', 'KY', '40524');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (31, 'Alissa', 'Selbach', 104, 161, '42231 Melvin Place', 'New Orleans', 'LA', '70142');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (32, 'Kettie', 'Aneley', 167, 162, '366 Springs Road', 'Sacramento', 'CA', '94257');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (33, 'Thibaud', 'McKaile', 93, 217, '9 Harper Place', 'Indianapolis', 'IN', '46221');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (34, 'Allissa', 'Peet', 193, 204, '2452 Artisan Street', 'London', 'KY', '40745');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (35, 'Baron', 'Crinkley', 166, 140, '1 Riverside Place', 'Garland', 'TX', '75049');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (36, 'Conny', 'Colquit', 173, 213, '538 Stuart Alley', 'Boston', 'MA', '02283');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (37, 'Sheridan', 'Ofener', 241, 155, '2745 Summerview Street', 'Kansas City', 'MO', '64193');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (38, 'Tiphanie', 'Peat', 241, 156, '12 Dovetail Alley', 'Gaithersburg', 'MD', '20883');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (39, 'Ilise', 'Hosburn', 123, 159, '2 Rusk Lane', 'El Paso', 'TX', '79984');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (40, 'Rey', 'Cadore', 180, 177, '7 Birchwood Court', 'Portsmouth', 'NH', '03804');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (41, 'Ulrika', 'Nayshe', 152, 159, '41743 Lunder Alley', 'Dallas', 'TX', '75221');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (42, 'Steven', 'Brumwell', 236, 157, '21677 Vidon Street', 'Rockford', 'IL', '61110');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (43, 'Tailor', 'Salamon', 232, 179, '2807 Katie Place', 'Portland', 'OR', '97240');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (44, 'Miltie', 'Purnell', 107, 194, '88 Dorton Court', 'Birmingham', 'AL', '35244');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (45, 'Easter', 'Gascoigne', 151, 150, '36486 Meadow Valley Point', 'Durham', 'NC', '27705');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (46, 'Tabbie', 'Ockenden', 249, 155, '12852 Fuller Place', 'Pasadena', 'CA', '91186');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (47, 'Gale', 'Thyer', 205, 215, '6134 Kenwood Parkway', 'Detroit', 'MI', '48242');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (48, 'Modestia', 'Rouchy', 137, 193, '45944 High Crossing Road', 'Knoxville', 'TN', '37939');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (49, 'Field', 'Valenta', 181, 166, '722 Miller Center', 'Carson City', 'NV', '89714');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (50, 'Torey', 'Turpey', 114, 185, '0 Westport Hill', 'Washington', 'DC', '20073');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (51, 'Renate', 'Oppie', 99, 166, '1315 Pawling Avenue', 'Glendale', 'CA', '91210');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (52, 'Rosella', 'Cluderay', 181, 146, '206 Butterfield Road', 'Atlanta', 'GA', '30316');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (53, 'Norina', 'Chadwen', 213, 196, '00894 Arizona Point', 'Boulder', 'CO', '80305');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (54, 'Sula', 'Mathers', 110, 160, '89 Cambridge Point', 'Sacramento', 'CA', '94280');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (55, 'Verna', 'Keddey', 240, 168, '6379 La Follette Road', 'Champaign', 'IL', '61825');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (56, 'Jeremiah', 'Cobb', 199, 162, '595 Michigan Court', 'Oakland', 'CA', '94611');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (57, 'Gustie', 'Casaro', 223, 214, '619 Northridge Court', 'Amarillo', 'TX', '79159');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (58, 'Kaspar', 'Tubby', 193, 212, '18 John Wall Plaza', 'Portsmouth', 'NH', '00214');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (59, 'Ora', 'Baitman', 100, 145, '57 Forest Dale Parkway', 'Cincinnati', 'OH', '45213');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (60, 'Alice', 'Hampson', 99, 152, '864 Russell Drive', 'Orlando', 'FL', '32803');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (61, 'Ruthy', 'Dunks', 182, 218, '69449 Valley Edge Junction', 'Atlanta', 'GA', '30392');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (62, 'Sasha', 'Breston', 234, 186, '34 Sheridan Parkway', 'Lynn', 'MA', '01905');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (63, 'Anatollo', 'Speight', 184, 140, '2254 Grim Crossing', 'San Diego', 'CA', '92127');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (64, 'Kerwinn', 'Winnister', 229, 159, '03636 Lien Court', 'San Jose', 'CA', '95173');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (65, 'Emera', 'Barcke', 248, 175, '66 Ilene Drive', 'Anchorage', 'AK', '99599');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (66, 'Adolphus', 'Urrey', 156, 188, '02674 Rutledge Circle', 'Philadelphia', 'PA', '19115');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (67, 'Marji', 'Battison', 163, 193, '1271 Mifflin Terrace', 'Des Moines', 'IA', '50310');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (68, 'Franny', 'Wedlock', 143, 208, '5540 Northwestern Lane', 'Saint Louis', 'MO', '63167');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (69, 'Halsy', 'Melia', 192, 157, '44047 Quincy Crossing', 'San Antonio', 'TX', '78215');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (70, 'Donia', 'Weatherall', 185, 219, '4 Dwight Plaza', 'Chicago', 'IL', '60652');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (71, 'Leilah', 'Treend', 217, 179, '7306 Northport Crossing', 'Atlanta', 'GA', '31132');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (72, 'Elbertina', 'Mewett', 214, 141, '1 Claremont Trail', 'Saint Louis', 'MO', '63121');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (73, 'Rosalia', 'Mosedall', 140, 201, '48 Forest Run Crossing', 'Anniston', 'AL', '36205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (74, 'Torrie', 'Flack', 112, 174, '88708 Village Court', 'Bryan', 'TX', '77806');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (75, 'Elvira', 'Castano', 99, 178, '75201 Kinsman Way', 'Houston', 'TX', '77040');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (76, 'Ralph', 'Covelle', 232, 151, '1934 Grasskamp Avenue', 'Tacoma', 'WA', '98411');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (77, 'Susannah', 'Crosdill', 149, 163, '6487 Morrow Trail', 'Milwaukee', 'WI', '53205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (78, 'Vinny', 'Ship', 185, 214, '9 Gina Way', 'Grand Rapids', 'MI', '49518');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (79, 'Borden', 'Lammers', 217, 176, '93 Victoria Parkway', 'Stamford', 'CT', '06912');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (80, 'Aprilette', 'Songer', 94, 168, '1570 Laurel Trail', 'Portland', 'OR', '97229');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (81, 'Carolus', 'Vassbender', 247, 155, '868 Pine View Junction', 'Akron', 'OH', '44310');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (82, 'Bondy', 'Dominik', 232, 209, '796 Commercial Road', 'Vancouver', 'WA', '98682');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (83, 'Jere', 'Bowdon', 138, 153, '907 American Ash Lane', 'Palm Bay', 'FL', '32909');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (84, 'Armstrong', 'Carus', 146, 141, '39 Mcguire Junction', 'El Paso', 'TX', '88558');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (85, 'Armando', 'Jedryka', 214, 207, '791 Holy Cross Terrace', 'Richmond', 'VA', '23228');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (86, 'Johnathon', 'Reitenbach', 177, 148, '097 Pearson Hill', 'Spring', 'TX', '77388');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (87, 'Hanan', 'Capron', 146, 219, '05039 Johnson Place', 'Rochester', 'NY', '14683');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (88, 'Reynolds', 'Gallimore', 203, 181, '7 Sommers Place', 'Dallas', 'TX', '75372');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (89, 'Karla', 'Pattie', 109, 206, '8222 Browning Parkway', 'Tempe', 'AZ', '85284');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (90, 'Hollyanne', 'Kellogg', 114, 199, '4878 Carioca Lane', 'Washington', 'DC', '20226');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (91, 'Elka', 'Cash', 162, 214, '790 Center Crossing', 'Newark', 'DE', '19714');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (92, 'Bartlett', 'Whitefoot', 109, 182, '23853 Little Fleur Center', 'Lawrenceville', 'GA', '30245');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (93, 'Carver', 'Alekseev', 188, 156, '90838 Cody Center', 'Columbia', 'SC', '29203');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (94, 'Deerdre', 'Monni', 168, 165, '189 Wayridge Hill', 'Salt Lake City', 'UT', '84115');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (95, 'Davina', 'Sey', 195, 198, '6 Browning Hill', 'Sioux Falls', 'SD', '57198');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (96, 'Kimble', 'Radband', 210, 172, '98727 Roxbury Parkway', 'Jacksonville', 'FL', '32230');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (97, 'Fae', 'Heberden', 160, 192, '94326 Harbort Road', 'Fort Wayne', 'IN', '46862');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (98, 'Levon', 'Bysouth', 168, 203, '69 New Castle Street', 'Amarillo', 'TX', '79176');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (99, 'Vinny', 'Tagg', 165, 188, '2 Oxford Pass', 'Saint Petersburg', 'FL', '33710');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (100, 'Nola', 'McKeaney', 197, 194, '6119 Johnson Court', 'Bonita Springs', 'FL', '34135');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (101, 'Helli', 'De Angelis', 231, 167, '834 Thierer Lane', 'Muncie', 'IN', '47306');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (102, 'Gottfried', 'Boot', 96, 141, '03 Summit Lane', 'Nashville', 'TN', '37235');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (103, 'Kirstin', 'Searsby', 154, 218, '2 Crescent Oaks Street', 'Arlington', 'TX', '76011');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (104, 'Edi', 'Ammer', 148, 163, '5566 Mayer Terrace', 'Shreveport', 'LA', '71151');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (105, 'Dawn', 'Sinden', 138, 151, '3100 Talisman Pass', 'Houston', 'TX', '77206');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (106, 'Shae', 'Ruffles', 97, 188, '3204 Hanover Center', 'Dallas', 'TX', '75251');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (107, 'Darelle', 'Dozdill', 221, 185, '38571 Kingsford Junction', 'Pittsburgh', 'PA', '15215');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (108, 'Abrahan', 'Ritchings', 246, 197, '1899 4th Hill', 'Wilmington', 'DE', '19886');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (109, 'Ninetta', 'Kaygill', 102, 213, '907 Barby Hill', 'Topeka', 'KS', '66622');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (110, 'Erma', 'Garn', 95, 192, '62 Crest Line Hill', 'Kansas City', 'MO', '64136');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (111, 'Verna', 'Fernant', 106, 142, '60046 Basil Pass', 'Elizabeth', 'NJ', '07208');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (112, 'Herta', 'Schindler', 147, 169, '82 Gina Center', 'Winter Haven', 'FL', '33884');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (113, 'Mose', 'Pereira', 110, 216, '88 Dahle Court', 'Washington', 'DC', '20062');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (114, 'Valera', 'Pirolini', 176, 184, '810 Oak Hill', 'Madison', 'WI', '53790');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (115, 'Helge', 'Circuitt', 213, 189, '425 Maryland Pass', 'Little Rock', 'AR', '72204');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (116, 'Delly', 'Staddom', 245, 171, '65562 Red Cloud Trail', 'Dayton', 'OH', '45490');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (117, 'Brana', 'Pinnocke', 119, 196, '3631 Springview Road', 'Minneapolis', 'MN', '55402');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (118, 'Nikki', 'Ohanessian', 152, 202, '0143 Burning Wood Hill', 'San Jose', 'CA', '95173');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (119, 'Pebrook', 'Benne', 248, 141, '09771 Coolidge Crossing', 'Corpus Christi', 'TX', '78465');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (120, 'Roxi', 'MacComiskey', 115, 152, '69 Ridgeway Pass', 'Sioux City', 'IA', '51105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (121, 'Cory', 'Speeks', 185, 212, '763 Corscot Center', 'Augusta', 'GA', '30905');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (122, 'Pebrook', 'Rattrie', 232, 192, '09331 Utah Crossing', 'Denver', 'CO', '80291');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (123, 'Ethelbert', 'Pengelly', 178, 150, '515 Spohn Hill', 'San Antonio', 'TX', '78285');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (124, 'Tomkin', 'Walkling', 108, 148, '6391 Manitowish Junction', 'Arlington', 'TX', '76096');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (125, 'Wynny', 'Alldritt', 191, 206, '3 Sycamore Center', 'San Francisco', 'CA', '94132');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (126, 'Annemarie', 'Chaddock', 125, 196, '60143 Prairie Rose Avenue', 'San Diego', 'CA', '92176');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (127, 'Moria', 'Dineen', 241, 180, '280 West Junction', 'Richmond', 'VA', '23208');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (128, 'Natalina', 'Peckett', 188, 180, '734 Eliot Crossing', 'Pompano Beach', 'FL', '33075');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (129, 'Belle', 'Dyble', 90, 191, '933 Londonderry Road', 'Decatur', 'IL', '62525');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (130, 'Benedict', 'Coultish', 187, 198, '5 Blue Bill Park Lane', 'New York City', 'NY', '10039');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (131, 'Crosby', 'Debow', 139, 170, '95 Warbler Parkway', 'Washington', 'DC', '20599');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (132, 'Patric', 'Cazin', 222, 214, '63295 Goodland Lane', 'Melbourne', 'FL', '32919');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (133, 'Raf', 'Vassel', 126, 212, '06 Gateway Park', 'Anaheim', 'CA', '92825');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (134, 'Kristien', 'Crann', 161, 159, '0478 Havey Junction', 'Detroit', 'MI', '48242');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (135, 'Jennica', 'Carlens', 233, 196, '6119 Orin Court', 'Jackson', 'MS', '39216');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (136, 'Reynolds', 'Son', 109, 148, '7 Buena Vista Pass', 'Oakland', 'CA', '94622');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (137, 'Abbi', 'Gerram', 211, 211, '86659 Talmadge Alley', 'Providence', 'RI', '02912');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (138, 'Frankie', 'Necrews', 216, 173, '248 Saint Paul Alley', 'Charleston', 'SC', '29424');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (139, 'Adey', 'Gerlts', 122, 198, '05 Colorado Plaza', 'Lincoln', 'NE', '68524');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (140, 'Noach', 'Archibould', 151, 178, '7825 Pierstorff Crossing', 'San Francisco', 'CA', '94169');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (141, 'Desirae', 'Donan', 195, 184, '53408 Sundown Lane', 'Chattanooga', 'TN', '37405');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (142, 'Jaclyn', 'Pleven', 114, 167, '76251 Gale Trail', 'Baton Rouge', 'LA', '70815');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (143, 'Grantley', 'Justham', 224, 140, '45 Northland Avenue', 'South Bend', 'IN', '46620');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (144, 'Guillema', 'Wynne', 153, 190, '4961 Surrey Street', 'Dallas', 'TX', '75310');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (145, 'Carrissa', 'Tootell', 234, 200, '9 Kim Avenue', 'Tampa', 'FL', '33605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (146, 'Nevin', 'Stevens', 157, 166, '8 Bellgrove Parkway', 'Virginia Beach', 'VA', '23459');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (147, 'Jourdain', 'Poles', 189, 191, '23806 Macpherson Hill', 'Beaufort', 'SC', '29905');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (148, 'Bond', 'Swindell', 210, 207, '4 Derek Avenue', 'Fort Wayne', 'IN', '46852');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (149, 'Jobina', 'Warham', 208, 160, '16 Monument Street', 'Richmond', 'VA', '23277');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (150, 'Irina', 'Imort', 199, 170, '48 Hazelcrest Lane', 'San Francisco', 'CA', '94121');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (151, 'Jessamyn', 'Purchall', 133, 161, '96 Heath Court', 'Richmond', 'VA', '23260');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (152, 'Paddy', 'Bellwood', 238, 169, '6 Eliot Avenue', 'Glendale', 'AZ', '85305');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (153, 'Tomas', 'Ware', 91, 190, '79 Dennis Street', 'Oklahoma City', 'OK', '73142');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (154, 'Emmet', 'Corkitt', 132, 159, '4 Coolidge Road', 'Pensacola', 'FL', '32505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (155, 'Cleopatra', 'Manifold', 203, 191, '02 Chive Alley', 'Spring', 'TX', '77388');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (156, 'Charity', 'Stiffell', 192, 219, '4423 Scofield Avenue', 'Raleigh', 'NC', '27610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (157, 'Claus', 'Bilbrey', 120, 177, '0989 Basil Pass', 'Kansas City', 'MO', '64199');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (158, 'Lucas', 'Rawlins', 124, 201, '01 Moose Center', 'Fort Worth', 'TX', '76192');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (159, 'Kareem', 'McInnery', 247, 141, '46616 Holy Cross Park', 'Fort Worth', 'TX', '76115');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (160, 'Aubrie', 'Flinders', 194, 164, '0 Schlimgen Center', 'Louisville', 'KY', '40298');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (161, 'Garv', 'Eborall', 133, 153, '6 Macpherson Point', 'Houston', 'TX', '77090');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (162, 'Dorry', 'Warry', 183, 205, '319 Leroy Parkway', 'Fort Myers', 'FL', '33913');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (163, 'Jeff', 'Hulson', 216, 220, '0971 Debs Trail', 'Mesa', 'AZ', '85205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (164, 'Ricard', 'Biddles', 231, 190, '156 Schiller Crossing', 'Atlanta', 'GA', '30311');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (165, 'Kevina', 'Ferrea', 140, 200, '75 Crowley Plaza', 'Memphis', 'TN', '38150');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (166, 'Ellene', 'Lambin', 131, 159, '1 Thierer Trail', 'Mobile', 'AL', '36605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (167, 'Finley', 'Hambatch', 185, 208, '632 Schurz Road', 'Saint Louis', 'MO', '63110');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (168, 'Carmencita', 'Mungane', 111, 153, '64 Oak Valley Court', 'Miami', 'FL', '33134');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (169, 'Mischa', 'Enterle', 140, 171, '4269 Bay Lane', 'Fort Lauderdale', 'FL', '33320');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (170, 'Aline', 'Rastall', 204, 199, '8 Ilene Park', 'Boston', 'MA', '02203');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (171, 'Marne', 'Job', 223, 210, '7 Wayridge Center', 'Cleveland', 'OH', '44111');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (172, 'Bryant', 'Bierling', 124, 166, '8 Burning Wood Terrace', 'Cleveland', 'OH', '44130');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (173, 'Burr', 'Peller', 247, 188, '5940 Melvin Court', 'El Paso', 'TX', '88541');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (174, 'Puff', 'Ingry', 167, 193, '656 Florence Junction', 'Newark', 'NJ', '07112');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (175, 'Halsy', 'Limrick', 117, 210, '379 Haas Center', 'Los Angeles', 'CA', '90050');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (176, 'Dom', 'Hasnip', 167, 211, '1 Hansons Terrace', 'Farmington', 'MI', '48335');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (177, 'Ruben', 'McIlreavy', 194, 177, '455 Morningstar Point', 'Chicago', 'IL', '60636');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (178, 'Cristy', 'Furmston', 148, 177, '7337 Bunker Hill Hill', 'Palo Alto', 'CA', '94302');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (179, 'Agnola', 'Resdale', 151, 154, '601 Haas Drive', 'Farmington', 'MI', '48335');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (180, 'Lazarus', 'Howson', 107, 216, '1 Forest Dale Hill', 'Decatur', 'GA', '30089');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (181, 'Jud', 'Chetwind', 181, 149, '4 Donald Crossing', 'Minneapolis', 'MN', '55446');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (182, 'Roby', 'Boundey', 130, 190, '22036 Manufacturers Crossing', 'Decatur', 'GA', '30089');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (183, 'Stevy', 'Cosbey', 180, 156, '25 Division Trail', 'Austin', 'TX', '78715');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (184, 'Reece', 'Cahill', 213, 174, '65 Iowa Avenue', 'Topeka', 'KS', '66611');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (185, 'Susie', 'Sawyer', 228, 182, '83 Toban Court', 'Terre Haute', 'IN', '47805');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (186, 'Viviana', 'Melladew', 96, 206, '90777 Schlimgen Trail', 'Miami', 'FL', '33245');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (187, 'Antonietta', 'Roseby', 142, 203, '73 International Place', 'North Little Rock', 'AR', '72199');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (188, 'Magdalene', 'Cubuzzi', 242, 207, '6 Harbort Pass', 'San Diego', 'CA', '92186');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (189, 'Luci', 'Mont', 193, 159, '9968 Schurz Alley', 'New York City', 'NY', '10249');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (190, 'Adena', 'MacGilmartin', 249, 163, '8236 Trailsway Crossing', 'Austin', 'TX', '78732');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (191, 'Carlye', 'Gathwaite', 229, 173, '399 Eagan Street', 'Sioux Falls', 'SD', '57105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (192, 'Drusy', 'Patriche', 247, 184, '1998 Bayside Terrace', 'Laurel', 'MD', '20709');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (193, 'Timmi', 'Kraut', 182, 193, '4196 Fair Oaks Plaza', 'Indianapolis', 'IN', '46247');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (194, 'Kenna', 'Gillson', 134, 220, '8468 Westerfield Hill', 'Madison', 'WI', '53705');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (195, 'Timmy', 'Renison', 104, 156, '168 Golf View Street', 'Sacramento', 'CA', '95813');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (196, 'Hartwell', 'Loveguard', 142, 216, '103 Sunfield Point', 'Albany', 'NY', '12242');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (197, 'Christel', 'Florey', 154, 140, '18 Dahle Alley', 'Jacksonville', 'FL', '32225');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (198, 'Denys', 'Rawlin', 226, 149, '23 Westend Place', 'Cincinnati', 'OH', '45233');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (199, 'Faye', 'Bruinsma', 173, 207, '4 Esker Trail', 'Newark', 'NJ', '07112');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (200, 'Valentine', 'Norman', 106, 217, '3 Golf View Place', 'Houston', 'TX', '77025');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (201, 'Issiah', 'Creber', 178, 178, '066 Hanover Place', 'Corona', 'CA', '92883');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (202, 'Adan', 'Plane', 162, 178, '8641 Clemons Avenue', 'Fresno', 'CA', '93794');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (203, 'Maribeth', 'Mc Meekan', 142, 166, '95835 Sachs Street', 'Newport News', 'VA', '23605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (204, 'Saloma', 'Garey', 107, 184, '046 Declaration Terrace', 'Baltimore', 'MD', '21265');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (205, 'Bibby', 'Kmietsch', 215, 159, '4043 Ridgeview Circle', 'Springfield', 'IL', '62776');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (206, 'Murdoch', 'Breckwell', 238, 210, '39 Anniversary Park', 'Shreveport', 'LA', '71105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (207, 'Jeddy', 'Caton', 222, 141, '62 Walton Place', 'Tulsa', 'OK', '74116');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (208, 'Tybalt', 'Kalkofen', 161, 176, '98 Straubel Junction', 'Chandler', 'AZ', '85246');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (209, 'Thurston', 'McEvay', 194, 188, '3250 Express Place', 'San Francisco', 'CA', '94147');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (210, 'Templeton', 'Austick', 187, 144, '009 Weeping Birch Hill', 'Phoenix', 'AZ', '85053');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (211, 'Peri', 'Lamke', 156, 160, '074 Butterfield Trail', 'Jamaica', 'NY', '11499');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (212, 'Aridatha', 'Sloey', 151, 214, '4 Warbler Park', 'Shawnee Mission', 'KS', '66215');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (213, 'Aileen', 'Jozwiak', 113, 201, '0 Meadow Ridge Street', 'Rockford', 'IL', '61105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (214, 'Diana', 'Coronado', 170, 202, '6 Drewry Center', 'Hartford', 'CT', '06105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (215, 'Erl', 'Franciotti', 184, 148, '540 Barnett Park', 'Des Moines', 'IA', '50936');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (216, 'Jemimah', 'Bofield', 191, 152, '7599 Golf Course Street', 'Cincinnati', 'OH', '45233');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (217, 'Brenn', 'Mintram', 137, 200, '7 Ohio Park', 'Stockton', 'CA', '95219');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (218, 'Stacy', 'Callingham', 206, 208, '376 Boyd Alley', 'Daytona Beach', 'FL', '32123');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (219, 'Iormina', 'Lozano', 94, 147, '6 Moose Lane', 'Lake Charles', 'LA', '70616');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (220, 'Lou', 'Cauthra', 91, 185, '638 Crowley Circle', 'Atlanta', 'GA', '31132');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (221, 'Roobbie', 'Parsell', 160, 175, '53050 Ryan Road', 'Fort Wayne', 'IN', '46852');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (222, 'Lennie', 'McGrady', 245, 145, '8188 Hansons Terrace', 'Aurora', 'CO', '80045');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (223, 'Marcellina', 'Crosskill', 130, 156, '763 Grasskamp Lane', 'San Diego', 'CA', '92127');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (224, 'Isa', 'Sowthcote', 122, 167, '38 Thompson Way', 'Sacramento', 'CA', '94280');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (225, 'Dave', 'Ickeringill', 97, 180, '9971 Lake View Point', 'Houston', 'TX', '77095');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (226, 'Alex', 'Obern', 118, 177, '9178 International Pass', 'Louisville', 'KY', '40293');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (227, 'Jacquenette', 'Kornel', 93, 171, '5813 Harper Terrace', 'Denver', 'CO', '80262');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (228, 'Myra', 'Palke', 156, 207, '6 Eastwood Terrace', 'Toledo', 'OH', '43605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (229, 'Glennie', 'Blucher', 103, 199, '46 Goodland Terrace', 'Charleston', 'WV', '25362');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (230, 'Immanuel', 'Stimpson', 192, 187, '402 Vernon Circle', 'Louisville', 'KY', '40256');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (231, 'Agustin', 'Castri', 132, 168, '55901 Saint Paul Pass', 'New York City', 'NY', '10125');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (232, 'Fleming', 'Minichi', 148, 151, '6813 Merrick Circle', 'Bronx', 'NY', '10459');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (233, 'Chicky', 'Peasee', 220, 202, '34 Sundown Point', 'Macon', 'GA', '31205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (234, 'Alicia', 'Aucutt', 144, 177, '82 Badeau Trail', 'Knoxville', 'TN', '37919');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (235, 'Gerrie', 'Stucksbury', 212, 142, '4530 Ridgeview Plaza', 'Scottsdale', 'AZ', '85255');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (236, 'Sher', 'Radloff', 207, 211, '12 Michigan Drive', 'Tucson', 'AZ', '85737');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (237, 'Gregg', 'Hryncewicz', 171, 188, '276 Hovde Crossing', 'Richmond', 'VA', '23220');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (238, 'Roy', 'Trotman', 138, 212, '88 Manley Hill', 'Seattle', 'WA', '98109');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (239, 'Alicea', 'Moberley', 179, 152, '82712 Mesta Point', 'Chicago', 'IL', '60646');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (240, 'Matthew', 'Tellenbrook', 246, 216, '7 Bluejay Terrace', 'Sioux Falls', 'SD', '57105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (241, 'Lorilee', 'Youngs', 145, 198, '2 Nova Trail', 'Louisville', 'KY', '40225');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (242, 'Normy', 'Driuzzi', 193, 213, '3799 Jenna Place', 'Tampa', 'FL', '33625');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (243, 'Frederico', 'Kinver', 114, 153, '4849 Barnett Circle', 'Fort Lauderdale', 'FL', '33355');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (244, 'Maxy', 'Fairchild', 136, 190, '520 Vidon Center', 'Sandy', 'UT', '84093');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (245, 'Juanita', 'Stendell', 225, 170, '74 Moland Lane', 'Oklahoma City', 'OK', '73167');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (246, 'Nadia', 'Klimuk', 210, 217, '04061 Emmet Court', 'Rochester', 'NY', '14639');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (247, 'Kristi', 'Durran', 237, 162, '702 Clove Street', 'Los Angeles', 'CA', '90020');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (248, 'Chrotoem', 'Gorvin', 125, 219, '52 Mayfield Junction', 'Independence', 'MO', '64054');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (249, 'Emlyn', 'Stetlye', 124, 196, '25004 Fairview Hill', 'Atlanta', 'GA', '30368');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (250, 'Karlan', 'Laurance', 154, 176, '32212 Vera Circle', 'Amarillo', 'TX', '79118');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (251, 'Marguerite', 'Abramzon', 167, 141, '23312 Marquette Place', 'Garland', 'TX', '75049');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (252, 'Coral', 'Janjusevic', 216, 192, '4 Havey Junction', 'Jackson', 'MS', '39216');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (253, 'Ariel', 'Rickson', 246, 174, '5103 Main Trail', 'San Francisco', 'CA', '94164');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (254, 'Linet', 'Leonarde', 148, 190, '5920 6th Crossing', 'Cleveland', 'OH', '44111');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (255, 'Rutter', 'Van Der Vlies', 238, 207, '2606 Russell Hill', 'Austin', 'TX', '78737');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (256, 'Erina', 'Galilee', 208, 149, '6 Glendale Road', 'Oklahoma City', 'OK', '73142');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (257, 'Maxim', 'Corradi', 187, 211, '554 Old Shore Alley', 'Dallas', 'TX', '75353');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (258, 'Marcelle', 'Hawkings', 189, 178, '11867 Dapin Crossing', 'San Francisco', 'CA', '94116');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (259, 'Shelby', 'McGuire', 167, 204, '92 Melvin Trail', 'Erie', 'PA', '16550');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (260, 'Gordan', 'Mingo', 94, 154, '61502 8th Drive', 'Oklahoma City', 'OK', '73109');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (261, 'Jarret', 'Batchelder', 193, 202, '60 Cherokee Street', 'Tampa', 'FL', '33673');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (262, 'Alyssa', 'Chimienti', 248, 163, '36554 Village Way', 'New York City', 'NY', '10024');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (263, 'Jasmine', 'Robertis', 222, 181, '2043 Coolidge Drive', 'Reading', 'PA', '19610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (264, 'Boyd', 'Kiehl', 149, 204, '0629 Bayside Crossing', 'Los Angeles', 'CA', '90189');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (265, 'Pierette', 'Gooke', 193, 202, '7 Norway Maple Way', 'Harrisburg', 'PA', '17110');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (266, 'Siusan', 'Luxton', 147, 201, '1 Schiller Lane', 'Charleston', 'WV', '25389');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (267, 'Sharline', 'Bend', 101, 184, '58384 Twin Pines Drive', 'Dallas', 'TX', '75387');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (268, 'Bili', 'Fillery', 138, 202, '39 Commercial Avenue', 'Dayton', 'OH', '45432');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (269, 'Sigfried', 'Rubinsztein', 102, 191, '42809 Charing Cross Street', 'Jamaica', 'NY', '11470');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (270, 'Nickolai', 'Oakley', 209, 145, '9 Beilfuss Center', 'Bismarck', 'ND', '58505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (271, 'Emmye', 'Esplin', 132, 190, '5 Pearson Crossing', 'Anchorage', 'AK', '99512');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (272, 'Conny', 'Terrington', 174, 220, '884 Raven Trail', 'Bethesda', 'MD', '20892');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (273, 'Jacqui', 'Lambie', 235, 213, '75 Autumn Leaf Road', 'Monticello', 'MN', '55590');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (274, 'Andreas', 'Organ', 130, 169, '9658 Fairfield Junction', 'Boston', 'MA', '02298');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (275, 'Sammy', 'Corish', 249, 141, '66 Debs Hill', 'Great Neck', 'NY', '11024');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (276, 'Carlos', 'Strutt', 203, 140, '81 Monument Alley', 'San Antonio', 'TX', '78205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (277, 'Jeanna', 'Jeremaes', 237, 168, '5028 Dennis Place', 'London', 'KY', '40745');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (278, 'Moira', 'Metschke', 171, 211, '7 Troy Hill', 'Toledo', 'OH', '43666');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (279, 'Rustin', 'Turfitt', 98, 199, '46603 Tennessee Crossing', 'Oklahoma City', 'OK', '73104');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (280, 'Marietta', 'Aris', 184, 220, '6 Crescent Oaks Avenue', 'El Paso', 'TX', '88530');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (281, 'Arty', 'Manifield', 250, 150, '239 Anniversary Pass', 'Oklahoma City', 'OK', '73190');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (282, 'Tobias', 'Berggren', 176, 204, '590 Hollow Ridge Court', 'Peoria', 'IL', '61614');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (283, 'Kain', 'Redman', 176, 166, '69 Ludington Place', 'Los Angeles', 'CA', '90189');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (284, 'Verney', 'Surmeyers', 158, 168, '2 Alpine Trail', 'Phoenix', 'AZ', '85083');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (285, 'Julian', 'Waghorne', 196, 174, '85 Sunfield Alley', 'Wichita', 'KS', '67205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (286, 'Hall', 'Martyns', 247, 177, '76 Spaight Alley', 'Salt Lake City', 'UT', '84199');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (287, 'Neile', 'Dunstone', 153, 154, '625 Boyd Court', 'Montgomery', 'AL', '36134');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (288, 'Julienne', 'Rheubottom', 240, 173, '1 Corscot Court', 'Houston', 'TX', '77090');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (289, 'Skipper', 'Castelyn', 197, 208, '9655 Hintze Street', 'New York City', 'NY', '10170');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (290, 'Juditha', 'Penburton', 151, 149, '06010 1st Plaza', 'San Antonio', 'TX', '78205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (291, 'Tobiah', 'Enrique', 167, 184, '7 Meadow Vale Park', 'Jamaica', 'NY', '11447');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (292, 'Chariot', 'Brannon', 105, 162, '55823 Esker Circle', 'Washington', 'DC', '20057');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (293, 'Al', 'Lace', 110, 185, '946 Coolidge Road', 'Killeen', 'TX', '76544');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (294, 'Teodoro', 'Choffin', 244, 183, '0564 Surrey Park', 'Knoxville', 'TN', '37931');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (295, 'Ber', 'Colbran', 213, 173, '9 Nova Alley', 'Savannah', 'GA', '31422');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (296, 'Kynthia', 'Peascod', 212, 180, '48852 David Avenue', 'Trenton', 'NJ', '08608');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (297, 'Nydia', 'Hiskey', 142, 169, '1586 Kensington Way', 'Albany', 'NY', '12242');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (298, 'Simonne', 'Snookes', 187, 174, '744 Lakeland Center', 'Silver Spring', 'MD', '20918');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (299, 'Marsiella', 'Elphey', 203, 178, '8 Forest Dale Center', 'Atlanta', 'GA', '31190');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (300, 'Mattheus', 'Okenden', 128, 145, '3712 Kensington Hill', 'New York City', 'NY', '10165');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (301, 'Alfredo', 'Lambrick', 184, 142, '730 Pleasure Lane', 'Flushing', 'NY', '11388');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (302, 'Marietta', 'Gedge', 203, 155, '2 Northland Circle', 'Manassas', 'VA', '22111');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (303, 'Devonna', 'Kibby', 203, 176, '0563 Birchwood Point', 'New York City', 'NY', '10034');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (304, 'Nathaniel', 'Scading', 104, 152, '492 Lyons Junction', 'Reno', 'NV', '89550');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (305, 'Arny', 'Le Grys', 127, 193, '85 Cordelia Place', 'Indianapolis', 'IN', '46295');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (306, 'Dione', 'Sunley', 229, 212, '7 Cambridge Center', 'Long Beach', 'CA', '90847');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (307, 'Othilia', 'Matussow', 92, 172, '11515 Swallow Terrace', 'Atlanta', 'GA', '30316');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (308, 'Aleksandr', 'Gorioli', 92, 156, '1216 Lawn Trail', 'Lafayette', 'LA', '70593');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (309, 'Niall', 'Powers', 238, 190, '69699 Butternut Way', 'Gainesville', 'FL', '32610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (310, 'Wash', 'Davidovsky', 105, 164, '2032 Crowley Drive', 'Torrance', 'CA', '90505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (311, 'Simonette', 'Ledwith', 121, 141, '05 Lotheville Pass', 'Tulsa', 'OK', '74103');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (312, 'Corabella', 'Webbe', 142, 147, '993 Raven Alley', 'Springfield', 'MO', '65810');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (313, 'Darryl', 'McGuiness', 204, 176, '290 Grim Street', 'North Hollywood', 'CA', '91606');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (314, 'Jacinda', 'Casemore', 205, 203, '674 Bashford Hill', 'Miami', 'FL', '33164');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (315, 'Glynn', 'Quinet', 199, 205, '124 Straubel Center', 'Boynton Beach', 'FL', '33436');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (316, 'Gale', 'Twaits', 157, 202, '43793 Del Sol Parkway', 'Corpus Christi', 'TX', '78465');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (317, 'Goldi', 'Bezarra', 114, 189, '33 Summit Way', 'Bellevue', 'WA', '98008');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (318, 'Chariot', 'Pervoe', 249, 193, '16837 Sutherland Crossing', 'Minneapolis', 'MN', '55487');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (319, 'Katine', 'Dempster', 242, 155, '0 Amoth Trail', 'Pasadena', 'CA', '91125');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (320, 'Timoteo', 'Strivens', 117, 164, '31098 Ryan Point', 'Pueblo', 'CO', '81005');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (321, 'Aura', 'ducarme', 233, 180, '07734 Glendale Crossing', 'Pensacola', 'FL', '32595');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (322, 'Torey', 'Ryce', 98, 184, '11 Ryan Way', 'San Bernardino', 'CA', '92424');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (323, 'Joly', 'Minghella', 146, 170, '86 Becker Circle', 'Tucson', 'AZ', '85743');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (324, 'Orlan', 'Tomson', 111, 218, '65920 Menomonie Junction', 'Bronx', 'NY', '10464');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (325, 'Raleigh', 'Domenichini', 114, 173, '9583 Main Court', 'Norfolk', 'VA', '23514');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (326, 'Luciano', 'Wratten', 238, 202, '49 Charing Cross Hill', 'Bellevue', 'WA', '98008');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (327, 'Deborah', 'Bozward', 110, 149, '3 Stuart Park', 'Peoria', 'IL', '61635');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (328, 'Mandy', 'Leng', 214, 210, '774 Bashford Circle', 'Houston', 'TX', '77050');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (329, 'Kylynn', 'Ball', 190, 146, '88 Ludington Crossing', 'San Antonio', 'TX', '78255');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (330, 'Leoine', 'Clue', 123, 193, '12 Park Meadow Street', 'Minneapolis', 'MN', '55487');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (331, 'Monti', 'Guyan', 242, 146, '01 Ruskin Junction', 'Fort Wayne', 'IN', '46857');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (332, 'Barbra', 'Cubitt', 138, 162, '174 Meadow Vale Point', 'Greenville', 'SC', '29615');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (333, 'Artemas', 'Shirer', 176, 149, '9 Cardinal Place', 'Boston', 'MA', '02283');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (334, 'Rosalinda', 'Matiebe', 219, 158, '2 Morrow Junction', 'Washington', 'DC', '20046');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (335, 'Justin', 'Worms', 145, 163, '1 Grover Park', 'Tulsa', 'OK', '74193');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (336, 'Boothe', 'Tweede', 210, 147, '15091 Rigney Point', 'Los Angeles', 'CA', '90071');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (337, 'Barrie', 'O''Cullinane', 239, 166, '18144 Fremont Alley', 'Flint', 'MI', '48505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (338, 'Willetta', 'Vasilechko', 207, 151, '9425 Vermont Terrace', 'Los Angeles', 'CA', '90005');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (339, 'Tatiana', 'Northin', 185, 156, '063 Glacier Hill Terrace', 'Detroit', 'MI', '48275');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (340, 'Timothee', 'Battista', 249, 190, '45 Lindbergh Park', 'Shawnee Mission', 'KS', '66286');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (341, 'Vittoria', 'Forten', 184, 153, '863 Southridge Point', 'Monticello', 'MN', '55585');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (342, 'Carol', 'Clench', 151, 201, '4 Cody Terrace', 'Inglewood', 'CA', '90310');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (343, 'Allene', 'Munnion', 224, 183, '8 Trailsway Parkway', 'San Bernardino', 'CA', '92424');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (344, 'Ricard', 'Holt', 199, 140, '2 Forest Dale Alley', 'Boston', 'MA', '02104');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (345, 'Bronson', 'Mintoft', 107, 159, '87166 Menomonie Court', 'New Orleans', 'LA', '70183');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (346, 'Agnesse', 'Norley', 234, 171, '8 Lillian Trail', 'Jacksonville', 'FL', '32244');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (347, 'Annmarie', 'Mollin', 159, 170, '1663 David Alley', 'Evansville', 'IN', '47719');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (348, 'Reeba', 'Kingshott', 90, 191, '04 Reindahl Court', 'Arvada', 'CO', '80005');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (349, 'Lorie', 'Starsmeare', 182, 147, '06 Onsgard Terrace', 'Visalia', 'CA', '93291');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (350, 'Ferdinanda', 'Creer', 143, 205, '5531 Mallory Parkway', 'Charleston', 'WV', '25336');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (351, 'Lorraine', 'Wilcockes', 208, 191, '6253 Loftsgordon Pass', 'Biloxi', 'MS', '39534');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (352, 'Pacorro', 'Dobbison', 214, 218, '5209 Vahlen Avenue', 'Charlotte', 'NC', '28210');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (353, 'Rochette', 'Timmins', 236, 152, '9 Nevada Crossing', 'Peoria', 'IL', '61651');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (354, 'Evelina', 'Izzett', 221, 218, '94 Springs Circle', 'Houston', 'TX', '77070');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (355, 'Feliks', 'Bowell', 204, 208, '575 Northridge Court', 'Seattle', 'WA', '98121');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (356, 'Shaine', 'Carrick', 146, 167, '3345 Drewry Crossing', 'Houston', 'TX', '77070');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (357, 'Terence', 'Roxburgh', 205, 141, '8754 Ridgeview Trail', 'Newport News', 'VA', '23612');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (358, 'Allayne', 'Javes', 115, 176, '82309 Hintze Junction', 'Corpus Christi', 'TX', '78465');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (359, 'Sunny', 'Marien', 137, 176, '3815 Thackeray Drive', 'Springfield', 'MO', '65805');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (360, 'Teddie', 'Lightoller', 168, 176, '7853 Bartelt Trail', 'El Paso', 'TX', '88563');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (361, 'Lesly', 'Huxton', 215, 142, '519 Meadow Ridge Crossing', 'Bakersfield', 'CA', '93386');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (362, 'Modestia', 'Stelle', 102, 194, '6 Thierer Terrace', 'Pittsburgh', 'PA', '15261');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (363, 'Zerk', 'Huison', 96, 173, '3 Stang Park', 'Raleigh', 'NC', '27626');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (364, 'Titos', 'Emblow', 129, 218, '01 Hudson Way', 'Palm Bay', 'FL', '32909');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (365, 'Andris', 'Hollyard', 153, 154, '393 Summit Trail', 'Anderson', 'IN', '46015');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (366, 'Tiffani', 'Mauro', 165, 152, '0 Kinsman Place', 'Sarasota', 'FL', '34233');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (367, 'Kerry', 'Thredder', 216, 165, '926 Truax Park', 'Atlanta', 'GA', '31106');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (368, 'Melitta', 'Dimont', 160, 189, '959 Sutteridge Way', 'Humble', 'TX', '77346');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (369, 'Rodolphe', 'Paver', 128, 188, '1 Shasta Parkway', 'Fresno', 'CA', '93773');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (370, 'Thain', 'Tiffin', 239, 218, '50717 Bay Alley', 'Richmond', 'VA', '23237');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (371, 'Fee', 'Iggulden', 207, 185, '00 Ridge Oak Alley', 'New Castle', 'PA', '16107');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (372, 'Adina', 'Smaling', 211, 164, '1098 Sundown Avenue', 'Kansas City', 'MO', '64109');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (373, 'Doria', 'Sidnell', 125, 211, '1126 Butternut Court', 'Tulsa', 'OK', '74141');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (374, 'Artur', 'Szymoni', 139, 220, '52938 Bunker Hill Place', 'Atlanta', 'GA', '31136');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (375, 'Brunhilde', 'Lawlance', 120, 153, '562 Golden Leaf Park', 'Baton Rouge', 'LA', '70883');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (376, 'Costa', 'Jaquiss', 105, 158, '20656 Iowa Terrace', 'Pocatello', 'ID', '83206');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (377, 'Allene', 'Thaw', 190, 170, '8768 Anderson Crossing', 'Billings', 'MT', '59105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (378, 'Elden', 'Hessel', 134, 219, '7 Riverside Alley', 'Baton Rouge', 'LA', '70836');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (379, 'Tedi', 'Riatt', 185, 202, '6 Messerschmidt Avenue', 'Richmond', 'VA', '23213');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (380, 'Hector', 'Stanlake', 120, 218, '80037 Fulton Place', 'Los Angeles', 'CA', '90189');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (381, 'Demetre', 'Killich', 210, 166, '80479 Dunning Point', 'Pensacola', 'FL', '32590');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (382, 'Solly', 'D''Alesco', 195, 206, '980 Sommers Crossing', 'Newport News', 'VA', '23612');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (383, 'Ellis', 'Tipperton', 172, 218, '9 Golden Leaf Court', 'Cincinnati', 'OH', '45254');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (384, 'Rowe', 'Hames', 151, 204, '62 Shoshone Park', 'Visalia', 'CA', '93291');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (385, 'Joey', 'Montford', 182, 167, '91443 Reinke Circle', 'Spokane', 'WA', '99252');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (386, 'Jere', 'Raspin', 242, 210, '69 Hansons Pass', 'Washington', 'DC', '20456');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (387, 'Daria', 'Samet', 178, 140, '938 Declaration Crossing', 'Cleveland', 'OH', '44125');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (388, 'Corbie', 'Milliken', 197, 168, '4 Sloan Street', 'Raleigh', 'NC', '27610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (389, 'Bennie', 'Gellately', 235, 160, '65454 John Wall Point', 'Lexington', 'KY', '40591');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (390, 'Lew', 'Gurge', 161, 218, '1 Messerschmidt Court', 'Alexandria', 'VA', '22301');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (391, 'Sheila', 'Dayley', 184, 161, '784 Annamark Road', 'New York City', 'NY', '10034');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (392, 'Tony', 'Asp', 141, 178, '89079 Commercial Place', 'Saint Paul', 'MN', '55127');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (393, 'Gus', 'Ashbolt', 140, 219, '6 Washington Way', 'Macon', 'GA', '31205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (394, 'Veronica', 'Egdell', 162, 142, '2871 Maryland Trail', 'Sarasota', 'FL', '34238');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (395, 'Dagmar', 'Gino', 244, 174, '29761 Mandrake Point', 'Salt Lake City', 'UT', '84189');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (396, 'Eleen', 'Blakeway', 105, 194, '29513 New Castle Lane', 'Colorado Springs', 'CO', '80995');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (397, 'Elizabet', 'Pfeffle', 250, 216, '2 Jenifer Lane', 'Midland', 'TX', '79705');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (398, 'Norene', 'Brigstock', 249, 174, '47272 Lunder Court', 'Escondido', 'CA', '92030');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (399, 'Odessa', 'Daltry', 175, 163, '66 Superior Place', 'Tacoma', 'WA', '98447');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (400, 'Bree', 'le Keux', 116, 151, '2 Independence Crossing', 'New York City', 'NY', '10060');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (401, 'Riobard', 'Prose', 156, 219, '6 Crest Line Pass', 'Chicago', 'IL', '60624');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (402, 'Chad', 'Samms', 242, 193, '90 Tomscot Drive', 'Orlando', 'FL', '32819');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (403, 'Eleen', 'Marielle', 181, 156, '9 School Circle', 'Midland', 'MI', '48670');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (404, 'Jaye', 'Bonick', 92, 208, '045 Stoughton Street', 'Lincoln', 'NE', '68510');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (405, 'Mariele', 'Wreak', 194, 213, '2291 Pine View Point', 'Washington', 'DC', '20036');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (406, 'Brenden', 'Choulerton', 200, 175, '71194 Cottonwood Plaza', 'Charlottesville', 'VA', '22903');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (407, 'Lisa', 'Stut', 219, 168, '9 Bartelt Center', 'Southfield', 'MI', '48076');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (408, 'Revkah', 'Paulo', 136, 145, '1547 John Wall Avenue', 'Fort Smith', 'AR', '72916');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (409, 'Corina', 'Snasel', 130, 158, '28841 Comanche Crossing', 'Grand Junction', 'CO', '81505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (410, 'Sari', 'Daldry', 186, 203, '3452 Walton Plaza', 'Oklahoma City', 'OK', '73114');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (411, 'Helen-elizabeth', 'Dymocke', 157, 168, '445 5th Drive', 'Newark', 'NJ', '07195');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (412, 'Demetria', 'Renison', 187, 152, '599 Express Park', 'Minneapolis', 'MN', '55423');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (413, 'Keeley', 'Cowlas', 222, 215, '54637 Barnett Circle', 'San Antonio', 'TX', '78296');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (414, 'Karlene', 'Gisburn', 239, 162, '97 Butternut Parkway', 'Kansas City', 'MO', '64193');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (415, 'Emmie', 'Aronsohn', 156, 186, '2003 Hallows Road', 'San Francisco', 'CA', '94132');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (416, 'Denny', 'Stothard', 90, 181, '89124 Cody Alley', 'Columbia', 'SC', '29240');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (417, 'Anallese', 'Arnholtz', 90, 215, '358 Moulton Hill', 'Trenton', 'NJ', '08695');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (418, 'Jeanette', 'Galiero', 214, 189, '7 American Ash Drive', 'Saint Paul', 'MN', '55146');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (419, 'Jillian', 'Clapison', 123, 144, '52991 Heath Point', 'Glendale', 'CA', '91205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (420, 'Hebert', 'Quesne', 173, 146, '17 Ramsey Court', 'Salt Lake City', 'UT', '84105');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (421, 'Christina', 'Ruppertz', 143, 166, '0 Glendale Crossing', 'Wilmington', 'NC', '28405');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (422, 'Corene', 'Klemke', 195, 152, '19490 Dakota Hill', 'Saint Paul', 'MN', '55127');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (423, 'Blinnie', 'Ferronier', 236, 163, '0 Prairieview Pass', 'Van Nuys', 'CA', '91411');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (424, 'Daune', 'Longfield', 200, 179, '508 Old Shore Lane', 'Charlotte', 'NC', '28242');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (425, 'Boony', 'Wimpey', 221, 185, '46 Scoville Plaza', 'Houston', 'TX', '77271');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (426, 'Krisha', 'Searjeant', 149, 163, '8 Melody Pass', 'Washington', 'DC', '20057');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (427, 'Renaud', 'Snar', 217, 144, '181 Warrior Court', 'Cincinnati', 'OH', '45999');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (428, 'Roddie', 'Aupol', 182, 151, '30943 Westerfield Hill', 'Denver', 'CO', '80241');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (429, 'Dayle', 'Pahlsson', 159, 149, '71 Montana Court', 'Buffalo', 'NY', '14215');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (430, 'Cherrita', 'Golthorpp', 224, 199, '0 Meadow Ridge Street', 'Charlotte', 'NC', '28299');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (431, 'Serene', 'Shiell', 217, 174, '04971 Spenser Plaza', 'Cincinnati', 'OH', '45218');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (432, 'Lory', 'Louth', 160, 180, '56 Coolidge Lane', 'Gainesville', 'FL', '32627');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (433, 'Darnell', 'Ewenson', 177, 207, '63 Namekagon Avenue', 'Reston', 'VA', '20195');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (434, 'Debby', 'Lenahan', 249, 214, '436 Del Mar Center', 'Seattle', 'WA', '98185');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (435, 'Abbot', 'Dymick', 211, 162, '5749 Randy Lane', 'Saint Louis', 'MO', '63116');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (436, 'Yul', 'Lewing', 215, 149, '3 Fieldstone Junction', 'Huntington', 'WV', '25775');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (437, 'Pyotr', 'Catterson', 123, 149, '957 Amoth Lane', 'Nashville', 'TN', '37240');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (438, 'Vivyan', 'Davisson', 120, 175, '547 Roxbury Court', 'Richmond', 'VA', '23272');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (439, 'Brewer', 'Mustin', 100, 140, '50403 Spohn Pass', 'Vero Beach', 'FL', '32964');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (440, 'Briant', 'Lilbourne', 162, 210, '814 Crest Line Road', 'Fresno', 'CA', '93715');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (441, 'Alasteir', 'Peaseman', 241, 181, '70 Prairieview Center', 'Hollywood', 'FL', '33023');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (442, 'Virginie', 'Mapes', 237, 174, '772 Graceland Drive', 'Frederick', 'MD', '21705');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (443, 'Ibbie', 'Schober', 191, 218, '8 Hovde Park', 'Mesa', 'AZ', '85205');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (444, 'Candi', 'Cohane', 178, 181, '4895 Corben Plaza', 'Palm Bay', 'FL', '32909');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (445, 'Laurene', 'Jiri', 172, 169, '321 Twin Pines Park', 'Louisville', 'KY', '40215');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (446, 'Bronnie', 'Sorsby', 211, 170, '91 Reindahl Court', 'Cincinnati', 'OH', '45296');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (447, 'Leia', 'Wheelwright', 123, 200, '31825 Union Trail', 'Philadelphia', 'PA', '19160');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (448, 'Dehlia', 'Geraudel', 125, 176, '615 Monica Parkway', 'Hialeah', 'FL', '33018');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (449, 'Rupert', 'Brownhill', 230, 143, '02141 Sunfield Way', 'Raleigh', 'NC', '27610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (450, 'Gisella', 'Getten', 184, 181, '02970 Rigney Plaza', 'Santa Barbara', 'CA', '93106');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (451, 'Eberhard', 'Gumn', 215, 159, '913 Dayton Parkway', 'Peoria', 'IL', '61614');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (452, 'Belinda', 'Summerlad', 242, 194, '48 Dottie Trail', 'Rochester', 'NY', '14639');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (453, 'Edgard', 'Curnok', 115, 182, '52825 Welch Street', 'Portland', 'OR', '97206');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (454, 'Darwin', 'Scrogges', 96, 186, '840 Arkansas Parkway', 'Oklahoma City', 'OK', '73167');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (455, 'Jeremy', 'Cavozzi', 202, 140, '3 Lerdahl Place', 'San Jose', 'CA', '95128');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (456, 'Cilka', 'Dainton', 183, 215, '378 Colorado Circle', 'San Luis Obispo', 'CA', '93407');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (457, 'Kiley', 'Gabb', 199, 163, '68 Del Mar Street', 'Birmingham', 'AL', '35220');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (458, 'Hetty', 'Peaple', 217, 173, '7 Hauk Park', 'Pensacola', 'FL', '32595');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (459, 'Emmanuel', 'Cheshir', 214, 195, '77 Kingsford Lane', 'Chicago', 'IL', '60624');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (460, 'Cornelle', 'Garlinge', 232, 215, '03208 Forest Run Hill', 'Torrance', 'CA', '90505');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (461, 'Mariellen', 'Minto', 202, 154, '533 Golf Course Park', 'Peoria', 'IL', '61656');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (462, 'Harp', 'Schoffler', 154, 164, '809 Springs Pass', 'Rochester', 'NY', '14652');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (463, 'Mercie', 'Klaassens', 113, 207, '859 5th Park', 'Richmond', 'VA', '23203');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (464, 'Annmaria', 'Cardenoza', 199, 162, '2482 Tomscot Junction', 'Oklahoma City', 'OK', '73152');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (465, 'Reiko', 'Ladyman', 112, 179, '717 Myrtle Circle', 'Bethesda', 'MD', '20816');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (466, 'Ange', 'Lissandrini', 153, 193, '6791 Sugar Center', 'Lansing', 'MI', '48956');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (467, 'Loralie', 'Chicchelli', 116, 140, '5 Pennsylvania Way', 'Pompano Beach', 'FL', '33075');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (468, 'Camey', 'Ioannidis', 148, 187, '8931 Pawling Junction', 'Arlington', 'TX', '76096');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (469, 'Ginnie', 'Klempke', 90, 220, '39 5th Avenue', 'Akron', 'OH', '44315');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (470, 'Jobie', 'Greenroyd', 179, 210, '4 Emmet Crossing', 'Mobile', 'AL', '36610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (471, 'Katharina', 'Slayton', 226, 183, '66 Blaine Circle', 'Gary', 'IN', '46406');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (472, 'Dotti', 'Biddleston', 95, 185, '72557 David Point', 'Syracuse', 'NY', '13224');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (473, 'Atlanta', 'Allam', 236, 162, '535 Jenifer Lane', 'Hialeah', 'FL', '33018');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (474, 'Marcela', 'Le Gallo', 110, 203, '78 Eastwood Avenue', 'Miami Beach', 'FL', '33141');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (475, 'Maryjo', 'Eynon', 94, 174, '828 Merchant Way', 'Peoria', 'IL', '61614');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (476, 'Shirley', 'Winch', 151, 196, '5 Fairfield Parkway', 'Ocala', 'FL', '34474');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (477, 'Giustino', 'Pittford', 202, 208, '519 Harper Center', 'Chicago', 'IL', '60604');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (478, 'Tarrah', 'Schulkins', 219, 158, '3 Gateway Pass', 'Beaumont', 'TX', '77713');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (479, 'Peri', 'Buckberry', 106, 145, '30 Holmberg Plaza', 'Denver', 'CO', '80243');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (480, 'Arnuad', 'Vidineev', 123, 151, '4 Logan Terrace', 'Denver', 'CO', '80299');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (481, 'Engracia', 'Eble', 242, 147, '1712 Forster Alley', 'Waco', 'TX', '76711');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (482, 'Berty', 'Easthope', 247, 158, '35 Porter Lane', 'El Paso', 'TX', '88530');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (483, 'Rikki', 'Begbie', 243, 202, '851 Riverside Place', 'Des Moines', 'IA', '50320');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (484, 'Thibaut', 'Plews', 159, 153, '9 Blue Bill Park Pass', 'Miami', 'FL', '33175');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (485, 'Dori', 'O'' Dooley', 118, 168, '73 Paget Pass', 'Washington', 'DC', '20016');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (486, 'Lief', 'Marishenko', 174, 206, '2169 Mallory Plaza', 'Terre Haute', 'IN', '47805');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (487, 'Kinna', 'Giacovetti', 150, 216, '2 Union Center', 'Provo', 'UT', '84605');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (488, 'Elva', 'Ashborne', 187, 215, '4 Lotheville Circle', 'Reading', 'PA', '19610');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (489, 'Marcelo', 'Hart', 166, 161, '96 Crowley Alley', 'Saint Joseph', 'MO', '64504');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (490, 'Sim', 'Huegett', 104, 195, '4526 Dryden Trail', 'Greensboro', 'NC', '27425');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (491, 'Nathanial', 'Olwen', 152, 183, '3058 Moose Lane', 'Houston', 'TX', '77240');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (492, 'Brett', 'Atterley', 156, 149, '93604 Stoughton Pass', 'San Diego', 'CA', '92191');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (493, 'Daffy', 'Sciusscietto', 246, 148, '373 Fisk Point', 'Louisville', 'KY', '40298');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (494, 'Kelby', 'Goretti', 119, 190, '10 Gerald Center', 'New York City', 'NY', '10004');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (495, 'Jeniece', 'Shenfisch', 223, 174, '6103 Graceland Plaza', 'Hamilton', 'OH', '45020');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (496, 'Lauren', 'Abbitt', 180, 153, '4 Duke Junction', 'Newark', 'NJ', '07195');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (497, 'Lyndsay', 'Niesel', 108, 217, '84 Boyd Lane', 'Saint Louis', 'MO', '63196');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (498, 'Opaline', 'Cheak', 217, 219, '85155 Lindbergh Avenue', 'Brooklyn', 'NY', '11241');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (499, 'Ellene', 'Redemile', 109, 201, '16 Crowley Crossing', 'Jackson', 'MS', '39216');
insert into Customer (CustomerID, FirstName, LastName, Weight, Height, Street, City, State, Zip) values (500, 'Sylvester', 'Densell', 118, 196, '9 Anniversary Hill', 'Honolulu', 'HI', '96810');

insert into Customer_Phone (CustomerID, Phone) values (1, '942-782-0228');
insert into Customer_Phone (CustomerID, Phone) values (2, '761-220-4470');
insert into Customer_Phone (CustomerID, Phone) values (3, '444-414-6338');
insert into Customer_Phone (CustomerID, Phone) values (4, '621-133-9828');
insert into Customer_Phone (CustomerID, Phone) values (5, '960-649-3609');
insert into Customer_Phone (CustomerID, Phone) values (6, '698-751-9461');
insert into Customer_Phone (CustomerID, Phone) values (7, '132-679-3299');
insert into Customer_Phone (CustomerID, Phone) values (8, '110-655-2542');
insert into Customer_Phone (CustomerID, Phone) values (9, '942-760-0841');
insert into Customer_Phone (CustomerID, Phone) values (10, '803-875-4299');
insert into Customer_Phone (CustomerID, Phone) values (11, '874-551-5070');
insert into Customer_Phone (CustomerID, Phone) values (12, '305-642-6444');
insert into Customer_Phone (CustomerID, Phone) values (13, '452-181-4888');
insert into Customer_Phone (CustomerID, Phone) values (14, '661-400-1095');
insert into Customer_Phone (CustomerID, Phone) values (15, '353-769-9308');
insert into Customer_Phone (CustomerID, Phone) values (16, '157-191-7722');
insert into Customer_Phone (CustomerID, Phone) values (17, '234-186-3406');
insert into Customer_Phone (CustomerID, Phone) values (18, '731-550-9572');
insert into Customer_Phone (CustomerID, Phone) values (19, '848-412-4480');
insert into Customer_Phone (CustomerID, Phone) values (20, '148-280-9888');
insert into Customer_Phone (CustomerID, Phone) values (21, '420-892-1349');
insert into Customer_Phone (CustomerID, Phone) values (22, '157-746-0026');
insert into Customer_Phone (CustomerID, Phone) values (23, '975-779-9751');
insert into Customer_Phone (CustomerID, Phone) values (24, '339-653-2624');
insert into Customer_Phone (CustomerID, Phone) values (25, '941-299-0910');
insert into Customer_Phone (CustomerID, Phone) values (26, '460-850-5975');
insert into Customer_Phone (CustomerID, Phone) values (27, '132-122-2756');
insert into Customer_Phone (CustomerID, Phone) values (28, '558-455-9257');
insert into Customer_Phone (CustomerID, Phone) values (29, '234-573-2970');
insert into Customer_Phone (CustomerID, Phone) values (30, '640-553-9828');
insert into Customer_Phone (CustomerID, Phone) values (31, '607-962-4131');
insert into Customer_Phone (CustomerID, Phone) values (32, '716-501-1644');
insert into Customer_Phone (CustomerID, Phone) values (33, '724-183-7101');
insert into Customer_Phone (CustomerID, Phone) values (34, '588-682-2174');
insert into Customer_Phone (CustomerID, Phone) values (35, '247-335-6164');
insert into Customer_Phone (CustomerID, Phone) values (36, '775-184-6388');
insert into Customer_Phone (CustomerID, Phone) values (37, '980-544-2937');
insert into Customer_Phone (CustomerID, Phone) values (38, '661-745-0031');
insert into Customer_Phone (CustomerID, Phone) values (39, '508-583-6616');
insert into Customer_Phone (CustomerID, Phone) values (40, '211-511-7252');
insert into Customer_Phone (CustomerID, Phone) values (41, '973-929-5955');
insert into Customer_Phone (CustomerID, Phone) values (42, '129-413-4968');
insert into Customer_Phone (CustomerID, Phone) values (43, '214-149-3315');
insert into Customer_Phone (CustomerID, Phone) values (44, '615-499-1476');
insert into Customer_Phone (CustomerID, Phone) values (45, '217-370-4457');
insert into Customer_Phone (CustomerID, Phone) values (46, '787-569-5274');
insert into Customer_Phone (CustomerID, Phone) values (47, '140-288-0308');
insert into Customer_Phone (CustomerID, Phone) values (48, '701-370-7348');
insert into Customer_Phone (CustomerID, Phone) values (49, '107-136-8715');
insert into Customer_Phone (CustomerID, Phone) values (50, '969-723-9997');
insert into Customer_Phone (CustomerID, Phone) values (51, '367-646-4954');
insert into Customer_Phone (CustomerID, Phone) values (52, '357-401-0909');
insert into Customer_Phone (CustomerID, Phone) values (53, '956-552-1712');
insert into Customer_Phone (CustomerID, Phone) values (54, '323-318-1713');
insert into Customer_Phone (CustomerID, Phone) values (55, '954-854-0452');
insert into Customer_Phone (CustomerID, Phone) values (56, '699-415-6018');
insert into Customer_Phone (CustomerID, Phone) values (57, '661-689-0283');
insert into Customer_Phone (CustomerID, Phone) values (58, '561-798-3383');
insert into Customer_Phone (CustomerID, Phone) values (59, '116-253-2756');
insert into Customer_Phone (CustomerID, Phone) values (60, '381-306-8037');
insert into Customer_Phone (CustomerID, Phone) values (61, '906-384-9338');
insert into Customer_Phone (CustomerID, Phone) values (62, '722-114-1057');
insert into Customer_Phone (CustomerID, Phone) values (63, '383-102-5510');
insert into Customer_Phone (CustomerID, Phone) values (64, '308-148-4483');
insert into Customer_Phone (CustomerID, Phone) values (65, '290-978-2374');
insert into Customer_Phone (CustomerID, Phone) values (66, '811-251-0105');
insert into Customer_Phone (CustomerID, Phone) values (67, '993-218-1291');
insert into Customer_Phone (CustomerID, Phone) values (68, '394-285-3802');
insert into Customer_Phone (CustomerID, Phone) values (69, '511-249-0140');
insert into Customer_Phone (CustomerID, Phone) values (70, '570-542-5483');
insert into Customer_Phone (CustomerID, Phone) values (71, '989-568-2204');
insert into Customer_Phone (CustomerID, Phone) values (72, '474-676-6289');
insert into Customer_Phone (CustomerID, Phone) values (73, '459-358-6326');
insert into Customer_Phone (CustomerID, Phone) values (74, '168-304-6256');
insert into Customer_Phone (CustomerID, Phone) values (75, '544-880-6789');
insert into Customer_Phone (CustomerID, Phone) values (76, '786-472-5559');
insert into Customer_Phone (CustomerID, Phone) values (77, '882-784-9703');
insert into Customer_Phone (CustomerID, Phone) values (78, '381-966-5301');
insert into Customer_Phone (CustomerID, Phone) values (79, '889-196-7096');
insert into Customer_Phone (CustomerID, Phone) values (80, '664-763-2383');
insert into Customer_Phone (CustomerID, Phone) values (81, '198-417-7231');
insert into Customer_Phone (CustomerID, Phone) values (82, '133-720-4036');
insert into Customer_Phone (CustomerID, Phone) values (83, '914-386-4149');
insert into Customer_Phone (CustomerID, Phone) values (84, '457-197-6054');
insert into Customer_Phone (CustomerID, Phone) values (85, '507-348-4660');
insert into Customer_Phone (CustomerID, Phone) values (86, '660-209-1697');
insert into Customer_Phone (CustomerID, Phone) values (87, '704-836-8818');
insert into Customer_Phone (CustomerID, Phone) values (88, '253-977-0965');
insert into Customer_Phone (CustomerID, Phone) values (89, '854-171-3958');
insert into Customer_Phone (CustomerID, Phone) values (90, '300-626-7897');
insert into Customer_Phone (CustomerID, Phone) values (91, '598-822-7169');
insert into Customer_Phone (CustomerID, Phone) values (92, '474-470-3180');
insert into Customer_Phone (CustomerID, Phone) values (93, '130-216-9829');
insert into Customer_Phone (CustomerID, Phone) values (94, '604-904-7310');
insert into Customer_Phone (CustomerID, Phone) values (95, '205-617-0862');
insert into Customer_Phone (CustomerID, Phone) values (96, '763-297-5689');
insert into Customer_Phone (CustomerID, Phone) values (97, '512-295-4705');
insert into Customer_Phone (CustomerID, Phone) values (98, '709-220-7880');
insert into Customer_Phone (CustomerID, Phone) values (99, '119-902-2581');
insert into Customer_Phone (CustomerID, Phone) values (100, '976-154-8494');
insert into Customer_Phone (CustomerID, Phone) values (101, '391-740-8293');
insert into Customer_Phone (CustomerID, Phone) values (102, '228-591-2380');
insert into Customer_Phone (CustomerID, Phone) values (103, '749-405-4531');
insert into Customer_Phone (CustomerID, Phone) values (104, '672-960-5331');
insert into Customer_Phone (CustomerID, Phone) values (105, '119-105-3347');
insert into Customer_Phone (CustomerID, Phone) values (106, '259-446-9471');
insert into Customer_Phone (CustomerID, Phone) values (107, '913-510-9990');
insert into Customer_Phone (CustomerID, Phone) values (108, '833-799-4498');
insert into Customer_Phone (CustomerID, Phone) values (109, '242-478-7109');
insert into Customer_Phone (CustomerID, Phone) values (110, '158-839-5158');
insert into Customer_Phone (CustomerID, Phone) values (111, '375-637-9624');
insert into Customer_Phone (CustomerID, Phone) values (112, '589-696-6975');
insert into Customer_Phone (CustomerID, Phone) values (113, '859-938-9079');
insert into Customer_Phone (CustomerID, Phone) values (114, '786-695-9595');
insert into Customer_Phone (CustomerID, Phone) values (115, '402-477-4218');
insert into Customer_Phone (CustomerID, Phone) values (116, '810-391-1009');
insert into Customer_Phone (CustomerID, Phone) values (117, '357-272-1372');
insert into Customer_Phone (CustomerID, Phone) values (118, '849-481-6376');
insert into Customer_Phone (CustomerID, Phone) values (119, '216-485-1223');
insert into Customer_Phone (CustomerID, Phone) values (120, '698-481-4046');
insert into Customer_Phone (CustomerID, Phone) values (121, '437-926-8196');
insert into Customer_Phone (CustomerID, Phone) values (122, '669-618-9269');
insert into Customer_Phone (CustomerID, Phone) values (123, '487-865-1338');
insert into Customer_Phone (CustomerID, Phone) values (124, '589-388-2758');
insert into Customer_Phone (CustomerID, Phone) values (125, '550-798-1298');
insert into Customer_Phone (CustomerID, Phone) values (126, '315-157-7214');
insert into Customer_Phone (CustomerID, Phone) values (127, '232-588-3162');
insert into Customer_Phone (CustomerID, Phone) values (128, '800-189-1931');
insert into Customer_Phone (CustomerID, Phone) values (129, '304-686-4453');
insert into Customer_Phone (CustomerID, Phone) values (130, '318-728-3133');
insert into Customer_Phone (CustomerID, Phone) values (131, '202-848-0739');
insert into Customer_Phone (CustomerID, Phone) values (132, '249-291-9641');
insert into Customer_Phone (CustomerID, Phone) values (133, '600-227-2420');
insert into Customer_Phone (CustomerID, Phone) values (134, '633-833-0274');
insert into Customer_Phone (CustomerID, Phone) values (135, '237-992-3085');
insert into Customer_Phone (CustomerID, Phone) values (136, '751-962-0016');
insert into Customer_Phone (CustomerID, Phone) values (137, '876-984-1405');
insert into Customer_Phone (CustomerID, Phone) values (138, '771-758-8679');
insert into Customer_Phone (CustomerID, Phone) values (139, '693-729-3692');
insert into Customer_Phone (CustomerID, Phone) values (140, '264-267-5563');
insert into Customer_Phone (CustomerID, Phone) values (141, '894-448-2209');
insert into Customer_Phone (CustomerID, Phone) values (142, '215-545-7554');
insert into Customer_Phone (CustomerID, Phone) values (143, '875-818-1986');
insert into Customer_Phone (CustomerID, Phone) values (144, '481-446-0235');
insert into Customer_Phone (CustomerID, Phone) values (145, '322-136-1733');
insert into Customer_Phone (CustomerID, Phone) values (146, '350-350-8433');
insert into Customer_Phone (CustomerID, Phone) values (147, '304-451-8988');
insert into Customer_Phone (CustomerID, Phone) values (148, '218-638-6267');
insert into Customer_Phone (CustomerID, Phone) values (149, '330-164-6132');
insert into Customer_Phone (CustomerID, Phone) values (150, '126-975-9482');
insert into Customer_Phone (CustomerID, Phone) values (151, '988-477-6118');
insert into Customer_Phone (CustomerID, Phone) values (152, '162-491-6941');
insert into Customer_Phone (CustomerID, Phone) values (153, '376-259-0198');
insert into Customer_Phone (CustomerID, Phone) values (154, '859-524-5784');
insert into Customer_Phone (CustomerID, Phone) values (155, '512-174-9146');
insert into Customer_Phone (CustomerID, Phone) values (156, '114-699-3703');
insert into Customer_Phone (CustomerID, Phone) values (157, '446-231-5459');
insert into Customer_Phone (CustomerID, Phone) values (158, '392-710-3704');
insert into Customer_Phone (CustomerID, Phone) values (159, '307-945-4930');
insert into Customer_Phone (CustomerID, Phone) values (160, '364-366-0757');
insert into Customer_Phone (CustomerID, Phone) values (161, '277-464-2762');
insert into Customer_Phone (CustomerID, Phone) values (162, '885-452-6770');
insert into Customer_Phone (CustomerID, Phone) values (163, '788-557-4527');
insert into Customer_Phone (CustomerID, Phone) values (164, '418-140-1070');
insert into Customer_Phone (CustomerID, Phone) values (165, '976-262-2957');
insert into Customer_Phone (CustomerID, Phone) values (166, '490-191-6318');
insert into Customer_Phone (CustomerID, Phone) values (167, '241-648-5316');
insert into Customer_Phone (CustomerID, Phone) values (168, '446-557-5598');
insert into Customer_Phone (CustomerID, Phone) values (169, '331-854-3753');
insert into Customer_Phone (CustomerID, Phone) values (170, '333-720-0427');
insert into Customer_Phone (CustomerID, Phone) values (171, '307-905-9748');
insert into Customer_Phone (CustomerID, Phone) values (172, '283-276-2017');
insert into Customer_Phone (CustomerID, Phone) values (173, '340-564-9790');
insert into Customer_Phone (CustomerID, Phone) values (174, '143-897-4881');
insert into Customer_Phone (CustomerID, Phone) values (175, '269-708-2974');
insert into Customer_Phone (CustomerID, Phone) values (176, '683-827-4121');
insert into Customer_Phone (CustomerID, Phone) values (177, '543-642-1275');
insert into Customer_Phone (CustomerID, Phone) values (178, '186-401-4911');
insert into Customer_Phone (CustomerID, Phone) values (179, '806-977-5982');
insert into Customer_Phone (CustomerID, Phone) values (180, '207-993-4116');
insert into Customer_Phone (CustomerID, Phone) values (181, '472-697-8609');
insert into Customer_Phone (CustomerID, Phone) values (182, '405-314-5543');
insert into Customer_Phone (CustomerID, Phone) values (183, '181-231-9642');
insert into Customer_Phone (CustomerID, Phone) values (184, '788-584-9932');
insert into Customer_Phone (CustomerID, Phone) values (185, '303-976-5827');
insert into Customer_Phone (CustomerID, Phone) values (186, '641-183-2979');
insert into Customer_Phone (CustomerID, Phone) values (187, '659-231-7518');
insert into Customer_Phone (CustomerID, Phone) values (188, '651-874-3856');
insert into Customer_Phone (CustomerID, Phone) values (189, '795-677-6963');
insert into Customer_Phone (CustomerID, Phone) values (190, '275-793-6359');
insert into Customer_Phone (CustomerID, Phone) values (191, '793-216-4702');
insert into Customer_Phone (CustomerID, Phone) values (192, '795-804-9541');
insert into Customer_Phone (CustomerID, Phone) values (193, '533-881-9733');
insert into Customer_Phone (CustomerID, Phone) values (194, '630-698-8697');
insert into Customer_Phone (CustomerID, Phone) values (195, '805-398-3362');
insert into Customer_Phone (CustomerID, Phone) values (196, '451-228-6640');
insert into Customer_Phone (CustomerID, Phone) values (197, '947-637-7559');
insert into Customer_Phone (CustomerID, Phone) values (198, '346-743-3489');
insert into Customer_Phone (CustomerID, Phone) values (199, '997-256-6221');
insert into Customer_Phone (CustomerID, Phone) values (200, '308-758-6495');
insert into Customer_Phone (CustomerID, Phone) values (201, '199-271-7828');
insert into Customer_Phone (CustomerID, Phone) values (202, '419-276-2724');
insert into Customer_Phone (CustomerID, Phone) values (203, '265-580-8398');
insert into Customer_Phone (CustomerID, Phone) values (204, '414-951-9893');
insert into Customer_Phone (CustomerID, Phone) values (205, '522-822-5587');
insert into Customer_Phone (CustomerID, Phone) values (206, '574-255-8398');
insert into Customer_Phone (CustomerID, Phone) values (207, '402-270-5353');
insert into Customer_Phone (CustomerID, Phone) values (208, '262-789-7549');
insert into Customer_Phone (CustomerID, Phone) values (209, '261-113-0499');
insert into Customer_Phone (CustomerID, Phone) values (210, '380-457-2732');
insert into Customer_Phone (CustomerID, Phone) values (211, '210-134-1433');
insert into Customer_Phone (CustomerID, Phone) values (212, '647-257-2308');
insert into Customer_Phone (CustomerID, Phone) values (213, '343-296-0778');
insert into Customer_Phone (CustomerID, Phone) values (214, '137-835-5814');
insert into Customer_Phone (CustomerID, Phone) values (215, '889-547-4103');
insert into Customer_Phone (CustomerID, Phone) values (216, '130-321-6743');
insert into Customer_Phone (CustomerID, Phone) values (217, '183-732-1948');
insert into Customer_Phone (CustomerID, Phone) values (218, '536-260-3833');
insert into Customer_Phone (CustomerID, Phone) values (219, '930-207-8901');
insert into Customer_Phone (CustomerID, Phone) values (220, '921-255-3710');
insert into Customer_Phone (CustomerID, Phone) values (221, '624-244-5979');
insert into Customer_Phone (CustomerID, Phone) values (222, '418-227-9941');
insert into Customer_Phone (CustomerID, Phone) values (223, '969-549-2363');
insert into Customer_Phone (CustomerID, Phone) values (224, '129-948-9564');
insert into Customer_Phone (CustomerID, Phone) values (225, '668-527-6754');
insert into Customer_Phone (CustomerID, Phone) values (226, '898-522-1330');
insert into Customer_Phone (CustomerID, Phone) values (227, '276-281-5757');
insert into Customer_Phone (CustomerID, Phone) values (228, '887-202-7164');
insert into Customer_Phone (CustomerID, Phone) values (229, '495-745-8000');
insert into Customer_Phone (CustomerID, Phone) values (230, '488-753-6975');
insert into Customer_Phone (CustomerID, Phone) values (231, '313-161-8128');
insert into Customer_Phone (CustomerID, Phone) values (232, '931-603-3089');
insert into Customer_Phone (CustomerID, Phone) values (233, '848-958-3825');
insert into Customer_Phone (CustomerID, Phone) values (234, '715-735-6974');
insert into Customer_Phone (CustomerID, Phone) values (235, '413-301-3372');
insert into Customer_Phone (CustomerID, Phone) values (236, '762-953-1500');
insert into Customer_Phone (CustomerID, Phone) values (237, '463-542-3357');
insert into Customer_Phone (CustomerID, Phone) values (238, '329-922-0708');
insert into Customer_Phone (CustomerID, Phone) values (239, '641-124-6549');
insert into Customer_Phone (CustomerID, Phone) values (240, '431-215-7789');
insert into Customer_Phone (CustomerID, Phone) values (241, '834-853-8054');
insert into Customer_Phone (CustomerID, Phone) values (242, '144-913-8665');
insert into Customer_Phone (CustomerID, Phone) values (243, '241-586-3244');
insert into Customer_Phone (CustomerID, Phone) values (244, '142-812-6377');
insert into Customer_Phone (CustomerID, Phone) values (245, '570-676-0345');
insert into Customer_Phone (CustomerID, Phone) values (246, '308-199-6800');
insert into Customer_Phone (CustomerID, Phone) values (247, '226-482-2291');
insert into Customer_Phone (CustomerID, Phone) values (248, '410-658-2659');
insert into Customer_Phone (CustomerID, Phone) values (249, '803-823-0383');
insert into Customer_Phone (CustomerID, Phone) values (250, '820-932-5131');
insert into Customer_Phone (CustomerID, Phone) values (251, '350-700-9306');
insert into Customer_Phone (CustomerID, Phone) values (252, '402-872-0133');
insert into Customer_Phone (CustomerID, Phone) values (253, '320-938-3769');
insert into Customer_Phone (CustomerID, Phone) values (254, '111-158-1733');
insert into Customer_Phone (CustomerID, Phone) values (255, '529-493-9155');
insert into Customer_Phone (CustomerID, Phone) values (256, '232-468-8785');
insert into Customer_Phone (CustomerID, Phone) values (257, '867-579-7486');
insert into Customer_Phone (CustomerID, Phone) values (258, '694-723-0701');
insert into Customer_Phone (CustomerID, Phone) values (259, '409-350-7260');
insert into Customer_Phone (CustomerID, Phone) values (260, '196-914-3092');
insert into Customer_Phone (CustomerID, Phone) values (261, '905-247-4741');
insert into Customer_Phone (CustomerID, Phone) values (262, '175-338-7129');
insert into Customer_Phone (CustomerID, Phone) values (263, '682-568-2867');
insert into Customer_Phone (CustomerID, Phone) values (264, '570-224-8824');
insert into Customer_Phone (CustomerID, Phone) values (265, '839-930-9935');
insert into Customer_Phone (CustomerID, Phone) values (266, '346-516-1703');
insert into Customer_Phone (CustomerID, Phone) values (267, '201-892-0313');
insert into Customer_Phone (CustomerID, Phone) values (268, '961-725-9512');
insert into Customer_Phone (CustomerID, Phone) values (269, '467-579-6057');
insert into Customer_Phone (CustomerID, Phone) values (270, '233-420-7293');
insert into Customer_Phone (CustomerID, Phone) values (271, '628-442-4497');
insert into Customer_Phone (CustomerID, Phone) values (272, '798-966-6476');
insert into Customer_Phone (CustomerID, Phone) values (273, '595-361-0691');
insert into Customer_Phone (CustomerID, Phone) values (274, '316-593-9125');
insert into Customer_Phone (CustomerID, Phone) values (275, '549-323-4999');
insert into Customer_Phone (CustomerID, Phone) values (276, '316-980-8257');
insert into Customer_Phone (CustomerID, Phone) values (277, '924-740-0036');
insert into Customer_Phone (CustomerID, Phone) values (278, '455-792-5585');
insert into Customer_Phone (CustomerID, Phone) values (279, '808-216-5810');
insert into Customer_Phone (CustomerID, Phone) values (280, '911-123-9340');
insert into Customer_Phone (CustomerID, Phone) values (281, '478-496-5802');
insert into Customer_Phone (CustomerID, Phone) values (282, '866-862-5680');
insert into Customer_Phone (CustomerID, Phone) values (283, '188-910-9828');
insert into Customer_Phone (CustomerID, Phone) values (284, '773-402-6533');
insert into Customer_Phone (CustomerID, Phone) values (285, '801-667-6503');
insert into Customer_Phone (CustomerID, Phone) values (286, '312-353-8266');
insert into Customer_Phone (CustomerID, Phone) values (287, '998-483-1997');
insert into Customer_Phone (CustomerID, Phone) values (288, '642-103-1102');
insert into Customer_Phone (CustomerID, Phone) values (289, '322-262-3888');
insert into Customer_Phone (CustomerID, Phone) values (290, '694-390-7086');
insert into Customer_Phone (CustomerID, Phone) values (291, '439-516-0420');
insert into Customer_Phone (CustomerID, Phone) values (292, '392-438-5593');
insert into Customer_Phone (CustomerID, Phone) values (293, '794-889-1270');
insert into Customer_Phone (CustomerID, Phone) values (294, '118-197-7576');
insert into Customer_Phone (CustomerID, Phone) values (295, '448-912-9664');
insert into Customer_Phone (CustomerID, Phone) values (296, '179-485-7003');
insert into Customer_Phone (CustomerID, Phone) values (297, '494-970-6542');
insert into Customer_Phone (CustomerID, Phone) values (298, '806-119-8071');
insert into Customer_Phone (CustomerID, Phone) values (299, '151-599-1702');
insert into Customer_Phone (CustomerID, Phone) values (300, '210-476-5309');
insert into Customer_Phone (CustomerID, Phone) values (301, '719-369-6943');
insert into Customer_Phone (CustomerID, Phone) values (302, '657-398-5515');
insert into Customer_Phone (CustomerID, Phone) values (303, '291-852-5510');
insert into Customer_Phone (CustomerID, Phone) values (304, '303-822-6719');
insert into Customer_Phone (CustomerID, Phone) values (305, '375-832-7690');
insert into Customer_Phone (CustomerID, Phone) values (306, '692-758-3620');
insert into Customer_Phone (CustomerID, Phone) values (307, '631-121-1163');
insert into Customer_Phone (CustomerID, Phone) values (308, '744-645-4219');
insert into Customer_Phone (CustomerID, Phone) values (309, '318-507-2905');
insert into Customer_Phone (CustomerID, Phone) values (310, '498-539-5659');
insert into Customer_Phone (CustomerID, Phone) values (311, '163-231-4819');
insert into Customer_Phone (CustomerID, Phone) values (312, '753-840-3371');
insert into Customer_Phone (CustomerID, Phone) values (313, '759-840-3121');
insert into Customer_Phone (CustomerID, Phone) values (314, '200-975-8544');
insert into Customer_Phone (CustomerID, Phone) values (315, '792-404-3937');
insert into Customer_Phone (CustomerID, Phone) values (316, '995-116-8944');
insert into Customer_Phone (CustomerID, Phone) values (317, '650-807-6056');
insert into Customer_Phone (CustomerID, Phone) values (318, '476-318-9310');
insert into Customer_Phone (CustomerID, Phone) values (319, '916-244-8741');
insert into Customer_Phone (CustomerID, Phone) values (320, '945-989-6655');
insert into Customer_Phone (CustomerID, Phone) values (321, '276-283-3358');
insert into Customer_Phone (CustomerID, Phone) values (322, '321-218-7196');
insert into Customer_Phone (CustomerID, Phone) values (323, '181-301-3192');
insert into Customer_Phone (CustomerID, Phone) values (324, '289-429-0620');
insert into Customer_Phone (CustomerID, Phone) values (325, '467-401-2584');
insert into Customer_Phone (CustomerID, Phone) values (326, '103-546-0317');
insert into Customer_Phone (CustomerID, Phone) values (327, '865-837-8880');
insert into Customer_Phone (CustomerID, Phone) values (328, '671-955-4362');
insert into Customer_Phone (CustomerID, Phone) values (329, '296-678-8602');
insert into Customer_Phone (CustomerID, Phone) values (330, '735-637-5480');
insert into Customer_Phone (CustomerID, Phone) values (331, '524-803-0173');
insert into Customer_Phone (CustomerID, Phone) values (332, '606-518-5213');
insert into Customer_Phone (CustomerID, Phone) values (333, '528-453-6679');
insert into Customer_Phone (CustomerID, Phone) values (334, '475-741-2397');
insert into Customer_Phone (CustomerID, Phone) values (335, '487-471-4784');
insert into Customer_Phone (CustomerID, Phone) values (336, '861-128-0906');
insert into Customer_Phone (CustomerID, Phone) values (337, '210-126-2012');
insert into Customer_Phone (CustomerID, Phone) values (338, '592-512-0041');
insert into Customer_Phone (CustomerID, Phone) values (339, '518-896-9304');
insert into Customer_Phone (CustomerID, Phone) values (340, '410-287-9027');
insert into Customer_Phone (CustomerID, Phone) values (341, '121-154-6500');
insert into Customer_Phone (CustomerID, Phone) values (342, '344-824-1836');
insert into Customer_Phone (CustomerID, Phone) values (343, '244-606-3610');
insert into Customer_Phone (CustomerID, Phone) values (344, '714-496-6070');
insert into Customer_Phone (CustomerID, Phone) values (345, '678-714-9539');
insert into Customer_Phone (CustomerID, Phone) values (346, '264-597-3346');
insert into Customer_Phone (CustomerID, Phone) values (347, '668-230-2515');
insert into Customer_Phone (CustomerID, Phone) values (348, '932-524-0817');
insert into Customer_Phone (CustomerID, Phone) values (349, '796-907-1719');
insert into Customer_Phone (CustomerID, Phone) values (350, '620-319-1528');
insert into Customer_Phone (CustomerID, Phone) values (351, '423-617-5941');
insert into Customer_Phone (CustomerID, Phone) values (352, '308-291-8965');
insert into Customer_Phone (CustomerID, Phone) values (353, '225-695-1068');
insert into Customer_Phone (CustomerID, Phone) values (354, '532-898-9455');
insert into Customer_Phone (CustomerID, Phone) values (355, '335-848-0281');
insert into Customer_Phone (CustomerID, Phone) values (356, '299-428-7034');
insert into Customer_Phone (CustomerID, Phone) values (357, '701-428-3579');
insert into Customer_Phone (CustomerID, Phone) values (358, '509-682-5652');
insert into Customer_Phone (CustomerID, Phone) values (359, '994-523-1420');
insert into Customer_Phone (CustomerID, Phone) values (360, '212-663-1722');
insert into Customer_Phone (CustomerID, Phone) values (361, '679-199-1304');
insert into Customer_Phone (CustomerID, Phone) values (362, '707-298-9699');
insert into Customer_Phone (CustomerID, Phone) values (363, '653-443-9222');
insert into Customer_Phone (CustomerID, Phone) values (364, '963-341-4294');
insert into Customer_Phone (CustomerID, Phone) values (365, '132-469-3170');
insert into Customer_Phone (CustomerID, Phone) values (366, '192-407-3038');
insert into Customer_Phone (CustomerID, Phone) values (367, '379-670-4705');
insert into Customer_Phone (CustomerID, Phone) values (368, '748-685-7456');
insert into Customer_Phone (CustomerID, Phone) values (369, '414-255-7525');
insert into Customer_Phone (CustomerID, Phone) values (370, '451-762-3560');
insert into Customer_Phone (CustomerID, Phone) values (371, '169-934-5582');
insert into Customer_Phone (CustomerID, Phone) values (372, '283-989-2760');
insert into Customer_Phone (CustomerID, Phone) values (373, '362-506-0672');
insert into Customer_Phone (CustomerID, Phone) values (374, '759-351-4264');
insert into Customer_Phone (CustomerID, Phone) values (375, '350-392-7584');
insert into Customer_Phone (CustomerID, Phone) values (376, '753-165-0658');
insert into Customer_Phone (CustomerID, Phone) values (377, '691-712-9300');
insert into Customer_Phone (CustomerID, Phone) values (378, '554-541-6673');
insert into Customer_Phone (CustomerID, Phone) values (379, '400-851-9420');
insert into Customer_Phone (CustomerID, Phone) values (380, '601-106-2396');
insert into Customer_Phone (CustomerID, Phone) values (381, '335-522-7184');
insert into Customer_Phone (CustomerID, Phone) values (382, '453-354-7060');
insert into Customer_Phone (CustomerID, Phone) values (383, '901-310-7751');
insert into Customer_Phone (CustomerID, Phone) values (384, '755-666-5288');
insert into Customer_Phone (CustomerID, Phone) values (385, '234-463-4989');
insert into Customer_Phone (CustomerID, Phone) values (386, '591-237-5059');
insert into Customer_Phone (CustomerID, Phone) values (387, '881-241-9687');
insert into Customer_Phone (CustomerID, Phone) values (388, '691-478-3090');
insert into Customer_Phone (CustomerID, Phone) values (389, '705-911-4152');
insert into Customer_Phone (CustomerID, Phone) values (390, '267-190-4542');
insert into Customer_Phone (CustomerID, Phone) values (391, '297-171-0595');
insert into Customer_Phone (CustomerID, Phone) values (392, '519-495-6145');
insert into Customer_Phone (CustomerID, Phone) values (393, '377-790-4395');
insert into Customer_Phone (CustomerID, Phone) values (394, '230-165-3366');
insert into Customer_Phone (CustomerID, Phone) values (395, '196-966-9402');
insert into Customer_Phone (CustomerID, Phone) values (396, '593-890-1659');
insert into Customer_Phone (CustomerID, Phone) values (397, '365-187-2668');
insert into Customer_Phone (CustomerID, Phone) values (398, '370-197-0969');
insert into Customer_Phone (CustomerID, Phone) values (399, '980-215-4230');
insert into Customer_Phone (CustomerID, Phone) values (400, '488-425-2317');
insert into Customer_Phone (CustomerID, Phone) values (401, '704-654-4812');
insert into Customer_Phone (CustomerID, Phone) values (402, '129-314-7856');
insert into Customer_Phone (CustomerID, Phone) values (403, '212-509-1714');
insert into Customer_Phone (CustomerID, Phone) values (404, '898-813-0828');
insert into Customer_Phone (CustomerID, Phone) values (405, '520-345-2754');
insert into Customer_Phone (CustomerID, Phone) values (406, '734-401-3339');
insert into Customer_Phone (CustomerID, Phone) values (407, '695-714-2320');
insert into Customer_Phone (CustomerID, Phone) values (408, '520-954-1657');
insert into Customer_Phone (CustomerID, Phone) values (409, '930-239-4252');
insert into Customer_Phone (CustomerID, Phone) values (410, '199-297-5591');
insert into Customer_Phone (CustomerID, Phone) values (411, '618-935-7037');
insert into Customer_Phone (CustomerID, Phone) values (412, '351-551-5015');
insert into Customer_Phone (CustomerID, Phone) values (413, '596-770-3049');
insert into Customer_Phone (CustomerID, Phone) values (414, '978-833-7662');
insert into Customer_Phone (CustomerID, Phone) values (415, '980-408-2961');
insert into Customer_Phone (CustomerID, Phone) values (416, '946-770-7806');
insert into Customer_Phone (CustomerID, Phone) values (417, '932-801-6446');
insert into Customer_Phone (CustomerID, Phone) values (418, '687-248-0529');
insert into Customer_Phone (CustomerID, Phone) values (419, '396-315-1004');
insert into Customer_Phone (CustomerID, Phone) values (420, '731-990-3978');
insert into Customer_Phone (CustomerID, Phone) values (421, '425-385-9577');
insert into Customer_Phone (CustomerID, Phone) values (422, '886-381-2827');
insert into Customer_Phone (CustomerID, Phone) values (423, '727-999-2307');
insert into Customer_Phone (CustomerID, Phone) values (424, '419-981-0564');
insert into Customer_Phone (CustomerID, Phone) values (425, '315-128-4989');
insert into Customer_Phone (CustomerID, Phone) values (426, '616-616-5082');
insert into Customer_Phone (CustomerID, Phone) values (427, '890-937-0188');
insert into Customer_Phone (CustomerID, Phone) values (428, '578-821-0113');
insert into Customer_Phone (CustomerID, Phone) values (429, '181-868-8816');
insert into Customer_Phone (CustomerID, Phone) values (430, '299-567-7325');
insert into Customer_Phone (CustomerID, Phone) values (431, '682-515-6823');
insert into Customer_Phone (CustomerID, Phone) values (432, '331-481-5122');
insert into Customer_Phone (CustomerID, Phone) values (433, '690-452-6810');
insert into Customer_Phone (CustomerID, Phone) values (434, '966-889-8536');
insert into Customer_Phone (CustomerID, Phone) values (435, '166-535-2166');
insert into Customer_Phone (CustomerID, Phone) values (436, '152-391-0502');
insert into Customer_Phone (CustomerID, Phone) values (437, '935-685-2432');
insert into Customer_Phone (CustomerID, Phone) values (438, '448-715-1683');
insert into Customer_Phone (CustomerID, Phone) values (439, '403-121-4639');
insert into Customer_Phone (CustomerID, Phone) values (440, '461-727-9384');
insert into Customer_Phone (CustomerID, Phone) values (441, '752-695-7974');
insert into Customer_Phone (CustomerID, Phone) values (442, '773-701-9355');
insert into Customer_Phone (CustomerID, Phone) values (443, '951-928-4983');
insert into Customer_Phone (CustomerID, Phone) values (444, '590-837-8079');
insert into Customer_Phone (CustomerID, Phone) values (445, '380-411-5303');
insert into Customer_Phone (CustomerID, Phone) values (446, '478-744-7164');
insert into Customer_Phone (CustomerID, Phone) values (447, '806-934-1654');
insert into Customer_Phone (CustomerID, Phone) values (448, '508-247-9325');
insert into Customer_Phone (CustomerID, Phone) values (449, '485-154-7525');
insert into Customer_Phone (CustomerID, Phone) values (450, '442-978-8000');
insert into Customer_Phone (CustomerID, Phone) values (451, '180-250-1026');
insert into Customer_Phone (CustomerID, Phone) values (452, '832-119-9759');
insert into Customer_Phone (CustomerID, Phone) values (453, '858-556-7963');
insert into Customer_Phone (CustomerID, Phone) values (454, '532-437-7289');
insert into Customer_Phone (CustomerID, Phone) values (455, '651-816-9175');
insert into Customer_Phone (CustomerID, Phone) values (456, '973-334-8715');
insert into Customer_Phone (CustomerID, Phone) values (457, '222-555-4271');
insert into Customer_Phone (CustomerID, Phone) values (458, '970-201-2814');
insert into Customer_Phone (CustomerID, Phone) values (459, '957-715-1855');
insert into Customer_Phone (CustomerID, Phone) values (460, '780-228-8420');
insert into Customer_Phone (CustomerID, Phone) values (461, '820-414-1841');
insert into Customer_Phone (CustomerID, Phone) values (462, '974-446-6168');
insert into Customer_Phone (CustomerID, Phone) values (463, '602-536-1659');
insert into Customer_Phone (CustomerID, Phone) values (464, '101-556-0108');
insert into Customer_Phone (CustomerID, Phone) values (465, '609-924-5215');
insert into Customer_Phone (CustomerID, Phone) values (466, '368-508-5677');
insert into Customer_Phone (CustomerID, Phone) values (467, '920-268-2485');
insert into Customer_Phone (CustomerID, Phone) values (468, '113-799-1852');
insert into Customer_Phone (CustomerID, Phone) values (469, '349-885-8351');
insert into Customer_Phone (CustomerID, Phone) values (470, '369-910-6855');
insert into Customer_Phone (CustomerID, Phone) values (471, '414-282-1448');
insert into Customer_Phone (CustomerID, Phone) values (472, '820-677-2018');
insert into Customer_Phone (CustomerID, Phone) values (473, '150-106-0975');
insert into Customer_Phone (CustomerID, Phone) values (474, '122-643-4248');
insert into Customer_Phone (CustomerID, Phone) values (475, '761-214-1732');
insert into Customer_Phone (CustomerID, Phone) values (476, '675-104-2127');
insert into Customer_Phone (CustomerID, Phone) values (477, '947-867-6328');
insert into Customer_Phone (CustomerID, Phone) values (478, '684-302-2764');
insert into Customer_Phone (CustomerID, Phone) values (479, '947-685-6979');
insert into Customer_Phone (CustomerID, Phone) values (480, '303-811-5111');
insert into Customer_Phone (CustomerID, Phone) values (481, '508-625-0881');
insert into Customer_Phone (CustomerID, Phone) values (482, '587-171-7631');
insert into Customer_Phone (CustomerID, Phone) values (483, '673-327-2208');
insert into Customer_Phone (CustomerID, Phone) values (484, '339-136-5487');
insert into Customer_Phone (CustomerID, Phone) values (485, '684-707-5149');
insert into Customer_Phone (CustomerID, Phone) values (486, '912-906-2823');
insert into Customer_Phone (CustomerID, Phone) values (487, '725-980-8311');
insert into Customer_Phone (CustomerID, Phone) values (488, '339-939-0571');
insert into Customer_Phone (CustomerID, Phone) values (489, '756-152-8095');
insert into Customer_Phone (CustomerID, Phone) values (490, '570-519-7929');
insert into Customer_Phone (CustomerID, Phone) values (491, '538-641-9792');
insert into Customer_Phone (CustomerID, Phone) values (492, '957-430-3509');
insert into Customer_Phone (CustomerID, Phone) values (493, '627-857-7456');
insert into Customer_Phone (CustomerID, Phone) values (494, '653-496-3705');
insert into Customer_Phone (CustomerID, Phone) values (495, '463-729-3442');
insert into Customer_Phone (CustomerID, Phone) values (496, '857-495-1612');
insert into Customer_Phone (CustomerID, Phone) values (497, '511-704-7506');
insert into Customer_Phone (CustomerID, Phone) values (498, '166-531-6747');
insert into Customer_Phone (CustomerID, Phone) values (499, '688-491-3057');
insert into Customer_Phone (CustomerID, Phone) values (500, '882-545-0059');



insert into Customer_Email (CustomerID, Email) values (1, 'agong0@hhs.gov');
insert into Customer_Email (CustomerID, Email) values (2, 'gkellet1@xinhuanet.com');
insert into Customer_Email (CustomerID, Email) values (3, 'mdrife2@ftc.gov');
insert into Customer_Email (CustomerID, Email) values (4, 'jburtenshaw3@intel.com');
insert into Customer_Email (CustomerID, Email) values (5, 'kramalhete4@ifeng.com');
insert into Customer_Email (CustomerID, Email) values (6, 'spillman5@examiner.com');
insert into Customer_Email (CustomerID, Email) values (7, 'cbraizier6@indiatimes.com');
insert into Customer_Email (CustomerID, Email) values (8, 'wcaswill7@chronoengine.com');
insert into Customer_Email (CustomerID, Email) values (9, 'rstanaway8@linkedin.com');
insert into Customer_Email (CustomerID, Email) values (10, 'nstrodder9@eepurl.com');
insert into Customer_Email (CustomerID, Email) values (11, 'dpepyea@cargocollective.com');
insert into Customer_Email (CustomerID, Email) values (12, 'fmcgaraghanb@bbc.co.uk');
insert into Customer_Email (CustomerID, Email) values (13, 'abrindedc@marketwatch.com');
insert into Customer_Email (CustomerID, Email) values (14, 'bmcjarrowd@xrea.com');
insert into Customer_Email (CustomerID, Email) values (15, 'dcansdalee@flavors.me');
insert into Customer_Email (CustomerID, Email) values (16, 'dklimovf@ucoz.com');
insert into Customer_Email (CustomerID, Email) values (17, 'mdegliantonig@networksolutions.com');
insert into Customer_Email (CustomerID, Email) values (18, 'cgellandh@google.es');
insert into Customer_Email (CustomerID, Email) values (19, 'jdagworthyi@vistaprint.com');
insert into Customer_Email (CustomerID, Email) values (20, 'dpolsinj@yahoo.com');
insert into Customer_Email (CustomerID, Email) values (21, 'kmaciejewskik@biglobe.ne.jp');
insert into Customer_Email (CustomerID, Email) values (22, 'gstoffell@admin.ch');
insert into Customer_Email (CustomerID, Email) values (23, 'mdunsmorem@bing.com');
insert into Customer_Email (CustomerID, Email) values (24, 'efairnn@fema.gov');
insert into Customer_Email (CustomerID, Email) values (25, 'rraffo@histats.com');
insert into Customer_Email (CustomerID, Email) values (26, 'dnoldap@networkadvertising.org');
insert into Customer_Email (CustomerID, Email) values (27, 'gpetyankinq@geocities.jp');
insert into Customer_Email (CustomerID, Email) values (28, 'kbricknerr@webmd.com');
insert into Customer_Email (CustomerID, Email) values (29, 'pnoads@studiopress.com');
insert into Customer_Email (CustomerID, Email) values (30, 'washbornet@over-blog.com');
insert into Customer_Email (CustomerID, Email) values (31, 'greallyu@dropbox.com');
insert into Customer_Email (CustomerID, Email) values (32, 'dcruickshanksv@ucsd.edu');
insert into Customer_Email (CustomerID, Email) values (33, 'phostanw@linkedin.com');
insert into Customer_Email (CustomerID, Email) values (34, 'bcoppenx@bloglovin.com');
insert into Customer_Email (CustomerID, Email) values (35, 'jhuygensy@exblog.jp');
insert into Customer_Email (CustomerID, Email) values (36, 'ttomczykowskiz@privacy.gov.au');
insert into Customer_Email (CustomerID, Email) values (37, 'rsloyan10@cnet.com');
insert into Customer_Email (CustomerID, Email) values (38, 'mmcaughtry11@ebay.com');
insert into Customer_Email (CustomerID, Email) values (39, 'bburwin12@ameblo.jp');
insert into Customer_Email (CustomerID, Email) values (40, 'dchalcraft13@liveinternet.ru');
insert into Customer_Email (CustomerID, Email) values (41, 'sbraunes14@google.pl');
insert into Customer_Email (CustomerID, Email) values (42, 'psumner15@edublogs.org');
insert into Customer_Email (CustomerID, Email) values (43, 'rstoffers16@dagondesign.com');
insert into Customer_Email (CustomerID, Email) values (44, 'clinden17@naver.com');
insert into Customer_Email (CustomerID, Email) values (45, 'nmccord18@walmart.com');
insert into Customer_Email (CustomerID, Email) values (46, 'cduffree19@oracle.com');
insert into Customer_Email (CustomerID, Email) values (47, 'cpurdy1a@is.gd');
insert into Customer_Email (CustomerID, Email) values (48, 'tbelchambers1b@woothemes.com');
insert into Customer_Email (CustomerID, Email) values (49, 'bickowics1c@people.com.cn');
insert into Customer_Email (CustomerID, Email) values (50, 'evoak1d@zdnet.com');
insert into Customer_Email (CustomerID, Email) values (51, 'bborge1e@bbc.co.uk');
insert into Customer_Email (CustomerID, Email) values (52, 'aawty1f@house.gov');
insert into Customer_Email (CustomerID, Email) values (53, 'ebesse1g@mapquest.com');
insert into Customer_Email (CustomerID, Email) values (54, 'jhastewell1h@boston.com');
insert into Customer_Email (CustomerID, Email) values (55, 'cmasding1i@squidoo.com');
insert into Customer_Email (CustomerID, Email) values (56, 'khammell1j@over-blog.com');
insert into Customer_Email (CustomerID, Email) values (57, 'jalvar1k@networkadvertising.org');
insert into Customer_Email (CustomerID, Email) values (58, 'ehargess1l@scientificamerican.com');
insert into Customer_Email (CustomerID, Email) values (59, 'cmariet1m@foxnews.com');
insert into Customer_Email (CustomerID, Email) values (60, 'mnewcome1n@phoca.cz');
insert into Customer_Email (CustomerID, Email) values (61, 'prodolphe1o@tripod.com');
insert into Customer_Email (CustomerID, Email) values (62, 'ldiano1p@psu.edu');
insert into Customer_Email (CustomerID, Email) values (63, 'mflaws1q@flickr.com');
insert into Customer_Email (CustomerID, Email) values (64, 'hcappineer1r@wordpress.com');
insert into Customer_Email (CustomerID, Email) values (65, 'ajakubiak1s@mozilla.com');
insert into Customer_Email (CustomerID, Email) values (66, 'cmunnion1t@woothemes.com');
insert into Customer_Email (CustomerID, Email) values (67, 'gvann1u@csmonitor.com');
insert into Customer_Email (CustomerID, Email) values (68, 'emarchington1v@microsoft.com');
insert into Customer_Email (CustomerID, Email) values (69, 'jcollinge1w@imgur.com');
insert into Customer_Email (CustomerID, Email) values (70, 'brhoades1x@netscape.com');
insert into Customer_Email (CustomerID, Email) values (71, 'wscourge1y@chron.com');
insert into Customer_Email (CustomerID, Email) values (72, 'thogben1z@phoca.cz');
insert into Customer_Email (CustomerID, Email) values (73, 'kblesing20@goo.gl');
insert into Customer_Email (CustomerID, Email) values (74, 'hodowgaine21@vimeo.com');
insert into Customer_Email (CustomerID, Email) values (75, 'ewainwright22@nih.gov');
insert into Customer_Email (CustomerID, Email) values (76, 'lmcgrory23@msu.edu');
insert into Customer_Email (CustomerID, Email) values (77, 'rharrison24@kickstarter.com');
insert into Customer_Email (CustomerID, Email) values (78, 'agorries25@cloudflare.com');
insert into Customer_Email (CustomerID, Email) values (79, 'rwilstead26@cdc.gov');
insert into Customer_Email (CustomerID, Email) values (80, 'blemoucheux27@who.int');
insert into Customer_Email (CustomerID, Email) values (81, 'mmantripp28@usgs.gov');
insert into Customer_Email (CustomerID, Email) values (82, 'rhodgon29@reddit.com');
insert into Customer_Email (CustomerID, Email) values (83, 'rgater2a@mail.ru');
insert into Customer_Email (CustomerID, Email) values (84, 'ljewster2b@networksolutions.com');
insert into Customer_Email (CustomerID, Email) values (85, 'tcorke2c@trellian.com');
insert into Customer_Email (CustomerID, Email) values (86, 'rvaszoly2d@mlb.com');
insert into Customer_Email (CustomerID, Email) values (87, 'crussel2e@pen.io');
insert into Customer_Email (CustomerID, Email) values (88, 'beustes2f@guardian.co.uk');
insert into Customer_Email (CustomerID, Email) values (89, 'dbacher2g@weather.com');
insert into Customer_Email (CustomerID, Email) values (90, 'iatwood2h@reverbnation.com');
insert into Customer_Email (CustomerID, Email) values (91, 'tgiannotti2i@blogger.com');
insert into Customer_Email (CustomerID, Email) values (92, 'edunridge2j@spiegel.de');
insert into Customer_Email (CustomerID, Email) values (93, 'eyakunkin2k@businessweek.com');
insert into Customer_Email (CustomerID, Email) values (94, 'csavile2l@dion.ne.jp');
insert into Customer_Email (CustomerID, Email) values (95, 'ndoxsey2m@independent.co.uk');
insert into Customer_Email (CustomerID, Email) values (96, 'mstutard2n@columbia.edu');
insert into Customer_Email (CustomerID, Email) values (97, 'mcanacott2o@theglobeandmail.com');
insert into Customer_Email (CustomerID, Email) values (98, 'gfantini2p@google.com.hk');
insert into Customer_Email (CustomerID, Email) values (99, 'jsaggs2q@mlb.com');
insert into Customer_Email (CustomerID, Email) values (100, 'phanington2r@hp.com');
insert into Customer_Email (CustomerID, Email) values (101, 'mbaume2s@meetup.com');
insert into Customer_Email (CustomerID, Email) values (102, 'tstempe2t@bigcartel.com');
insert into Customer_Email (CustomerID, Email) values (103, 'wvannini2u@whitehouse.gov');
insert into Customer_Email (CustomerID, Email) values (104, 'rszymonwicz2v@sfgate.com');
insert into Customer_Email (CustomerID, Email) values (105, 'mbrody2w@wordpress.com');
insert into Customer_Email (CustomerID, Email) values (106, 'zpead2x@ehow.com');
insert into Customer_Email (CustomerID, Email) values (107, 'lhighwood2y@pen.io');
insert into Customer_Email (CustomerID, Email) values (108, 'hhasty2z@ed.gov');
insert into Customer_Email (CustomerID, Email) values (109, 'mdegowe30@domainmarket.com');
insert into Customer_Email (CustomerID, Email) values (110, 'ajacques31@twitter.com');
insert into Customer_Email (CustomerID, Email) values (111, 'hwilletts32@tinypic.com');
insert into Customer_Email (CustomerID, Email) values (112, 'jshepperd33@home.pl');
insert into Customer_Email (CustomerID, Email) values (113, 'srudiger34@shinystat.com');
insert into Customer_Email (CustomerID, Email) values (114, 'astonehouse35@adobe.com');
insert into Customer_Email (CustomerID, Email) values (115, 'sdobbin36@marriott.com');
insert into Customer_Email (CustomerID, Email) values (116, 'gsaylor37@flavors.me');
insert into Customer_Email (CustomerID, Email) values (117, 'hbariball38@cdc.gov');
insert into Customer_Email (CustomerID, Email) values (118, 'obordiss39@sciencedirect.com');
insert into Customer_Email (CustomerID, Email) values (119, 'ljewes3a@ebay.co.uk');
insert into Customer_Email (CustomerID, Email) values (120, 'tgregoriou3b@seattletimes.com');
insert into Customer_Email (CustomerID, Email) values (121, 'dtowl3c@friendfeed.com');
insert into Customer_Email (CustomerID, Email) values (122, 'aalvy3d@macromedia.com');
insert into Customer_Email (CustomerID, Email) values (123, 'celsmore3e@nih.gov');
insert into Customer_Email (CustomerID, Email) values (124, 'rplumridege3f@sohu.com');
insert into Customer_Email (CustomerID, Email) values (125, 'atizzard3g@google.es');
insert into Customer_Email (CustomerID, Email) values (126, 'dpigeon3h@google.cn');
insert into Customer_Email (CustomerID, Email) values (127, 'vfullilove3i@chronoengine.com');
insert into Customer_Email (CustomerID, Email) values (128, 'abrobyn3j@bloglines.com');
insert into Customer_Email (CustomerID, Email) values (129, 'awonham3k@auda.org.au');
insert into Customer_Email (CustomerID, Email) values (130, 'cgossart3l@howstuffworks.com');
insert into Customer_Email (CustomerID, Email) values (131, 'jtuminelli3m@parallels.com');
insert into Customer_Email (CustomerID, Email) values (132, 'rvickar3n@facebook.com');
insert into Customer_Email (CustomerID, Email) values (133, 'rnendick3o@biblegateway.com');
insert into Customer_Email (CustomerID, Email) values (134, 'mboulden3p@ow.ly');
insert into Customer_Email (CustomerID, Email) values (135, 'hpatifield3q@psu.edu');
insert into Customer_Email (CustomerID, Email) values (136, 'rmoreinu3r@dailymail.co.uk');
insert into Customer_Email (CustomerID, Email) values (137, 'hbohden3s@washingtonpost.com');
insert into Customer_Email (CustomerID, Email) values (138, 'lcrutch3t@hao123.com');
insert into Customer_Email (CustomerID, Email) values (139, 'claneham3u@army.mil');
insert into Customer_Email (CustomerID, Email) values (140, 'ksidney3v@i2i.jp');
insert into Customer_Email (CustomerID, Email) values (141, 'lgeany3w@moonfruit.com');
insert into Customer_Email (CustomerID, Email) values (142, 'faspenlon3x@seesaa.net');
insert into Customer_Email (CustomerID, Email) values (143, 'mtheobold3y@blinklist.com');
insert into Customer_Email (CustomerID, Email) values (144, 'pyellowlea3z@tuttocitta.it');
insert into Customer_Email (CustomerID, Email) values (145, 'rconigsby40@edublogs.org');
insert into Customer_Email (CustomerID, Email) values (146, 'ldyet41@youtube.com');
insert into Customer_Email (CustomerID, Email) values (147, 'bvittori42@cbc.ca');
insert into Customer_Email (CustomerID, Email) values (148, 'rcluitt43@google.cn');
insert into Customer_Email (CustomerID, Email) values (149, 'lholdin44@intel.com');
insert into Customer_Email (CustomerID, Email) values (150, 'adinisco45@feedburner.com');
insert into Customer_Email (CustomerID, Email) values (151, 'hpennetta46@newyorker.com');
insert into Customer_Email (CustomerID, Email) values (152, 'mscrivinor47@odnoklassniki.ru');
insert into Customer_Email (CustomerID, Email) values (153, 'jfairham48@nsw.gov.au');
insert into Customer_Email (CustomerID, Email) values (154, 'gwhitcher49@cyberchimps.com');
insert into Customer_Email (CustomerID, Email) values (155, 'fwoodland4a@pcworld.com');
insert into Customer_Email (CustomerID, Email) values (156, 'gkleinschmidt4b@mayoclinic.com');
insert into Customer_Email (CustomerID, Email) values (157, 'tnavarre4c@salon.com');
insert into Customer_Email (CustomerID, Email) values (158, 'vodevey4d@slideshare.net');
insert into Customer_Email (CustomerID, Email) values (159, 'sescreet4e@reference.com');
insert into Customer_Email (CustomerID, Email) values (160, 'jgarfirth4f@vistaprint.com');
insert into Customer_Email (CustomerID, Email) values (161, 'fmunby4g@yale.edu');
insert into Customer_Email (CustomerID, Email) values (162, 'gorgen4h@theglobeandmail.com');
insert into Customer_Email (CustomerID, Email) values (163, 'tcamilli4i@geocities.jp');
insert into Customer_Email (CustomerID, Email) values (164, 'skleynen4j@imageshack.us');
insert into Customer_Email (CustomerID, Email) values (165, 'jpetrakov4k@indiegogo.com');
insert into Customer_Email (CustomerID, Email) values (166, 'cmorais4l@moonfruit.com');
insert into Customer_Email (CustomerID, Email) values (167, 'jdury4m@jalbum.net');
insert into Customer_Email (CustomerID, Email) values (168, 'mroddell4n@ucla.edu');
insert into Customer_Email (CustomerID, Email) values (169, 'icokely4o@t.co');
insert into Customer_Email (CustomerID, Email) values (170, 'rmcmurtyr4p@nationalgeographic.com');
insert into Customer_Email (CustomerID, Email) values (171, 'hdrillingcourt4q@businessweek.com');
insert into Customer_Email (CustomerID, Email) values (172, 'gorigin4r@geocities.jp');
insert into Customer_Email (CustomerID, Email) values (173, 'dreddan4s@storify.com');
insert into Customer_Email (CustomerID, Email) values (174, 'hferrillo4t@joomla.org');
insert into Customer_Email (CustomerID, Email) values (175, 'ppietruszka4u@edublogs.org');
insert into Customer_Email (CustomerID, Email) values (176, 'mivain4v@netlog.com');
insert into Customer_Email (CustomerID, Email) values (177, 'dboyda4w@rediff.com');
insert into Customer_Email (CustomerID, Email) values (178, 'adrage4x@hhs.gov');
insert into Customer_Email (CustomerID, Email) values (179, 'ccliburn4y@wikimedia.org');
insert into Customer_Email (CustomerID, Email) values (180, 'jgudyer4z@nba.com');
insert into Customer_Email (CustomerID, Email) values (181, 'lgirault50@paypal.com');
insert into Customer_Email (CustomerID, Email) values (182, 'dgowans51@icq.com');
insert into Customer_Email (CustomerID, Email) values (183, 'ctavner52@aol.com');
insert into Customer_Email (CustomerID, Email) values (184, 'imellor53@geocities.jp');
insert into Customer_Email (CustomerID, Email) values (185, 'bhuffey54@plala.or.jp');
insert into Customer_Email (CustomerID, Email) values (186, 'nsands55@boston.com');
insert into Customer_Email (CustomerID, Email) values (187, 'ebeedham56@businessweek.com');
insert into Customer_Email (CustomerID, Email) values (188, 'jmcarley57@themeforest.net');
insert into Customer_Email (CustomerID, Email) values (189, 'pglave58@tiny.cc');
insert into Customer_Email (CustomerID, Email) values (190, 'ndunstan59@cloudflare.com');
insert into Customer_Email (CustomerID, Email) values (191, 'rzincke5a@nature.com');
insert into Customer_Email (CustomerID, Email) values (192, 'mseywood5b@g.co');
insert into Customer_Email (CustomerID, Email) values (193, 'ogeldert5c@weebly.com');
insert into Customer_Email (CustomerID, Email) values (194, 'cfreear5d@mediafire.com');
insert into Customer_Email (CustomerID, Email) values (195, 'vpridden5e@theglobeandmail.com');
insert into Customer_Email (CustomerID, Email) values (196, 'hmorando5f@berkeley.edu');
insert into Customer_Email (CustomerID, Email) values (197, 'jflucker5g@shop-pro.jp');
insert into Customer_Email (CustomerID, Email) values (198, 'sraimbauld5h@istockphoto.com');
insert into Customer_Email (CustomerID, Email) values (199, 'jscarlett5i@reference.com');
insert into Customer_Email (CustomerID, Email) values (200, 'bwindeatt5j@telegraph.co.uk');
insert into Customer_Email (CustomerID, Email) values (201, 'iswinley5k@flavors.me');
insert into Customer_Email (CustomerID, Email) values (202, 'pdipietro5l@ask.com');
insert into Customer_Email (CustomerID, Email) values (203, 'fdaborne5m@cornell.edu');
insert into Customer_Email (CustomerID, Email) values (204, 'dmacneice5n@odnoklassniki.ru');
insert into Customer_Email (CustomerID, Email) values (205, 'bruit5o@bluehost.com');
insert into Customer_Email (CustomerID, Email) values (206, 'jbrekonridge5p@ow.ly');
insert into Customer_Email (CustomerID, Email) values (207, 'ocankett5q@networksolutions.com');
insert into Customer_Email (CustomerID, Email) values (208, 'escorer5r@netscape.com');
insert into Customer_Email (CustomerID, Email) values (209, 'swherrit5s@multiply.com');
insert into Customer_Email (CustomerID, Email) values (210, 'msnalum5t@studiopress.com');
insert into Customer_Email (CustomerID, Email) values (211, 'mkilfether5u@cnet.com');
insert into Customer_Email (CustomerID, Email) values (212, 'sklimus5v@rediff.com');
insert into Customer_Email (CustomerID, Email) values (213, 'dpollastro5w@flickr.com');
insert into Customer_Email (CustomerID, Email) values (214, 'gwillishire5x@kickstarter.com');
insert into Customer_Email (CustomerID, Email) values (215, 'bhickinbottom5y@ameblo.jp');
insert into Customer_Email (CustomerID, Email) values (216, 'cisaaksohn5z@ask.com');
insert into Customer_Email (CustomerID, Email) values (217, 'sscouller60@acquirethisname.com');
insert into Customer_Email (CustomerID, Email) values (218, 'gstockoe61@mozilla.com');
insert into Customer_Email (CustomerID, Email) values (219, 'eredfern62@topsy.com');
insert into Customer_Email (CustomerID, Email) values (220, 'tgreenmon63@mozilla.org');
insert into Customer_Email (CustomerID, Email) values (221, 'kdrakes64@mit.edu');
insert into Customer_Email (CustomerID, Email) values (222, 'gcaherny65@bbb.org');
insert into Customer_Email (CustomerID, Email) values (223, 'mrushby66@hao123.com');
insert into Customer_Email (CustomerID, Email) values (224, 'lraggitt67@about.com');
insert into Customer_Email (CustomerID, Email) values (225, 'ojuares68@php.net');
insert into Customer_Email (CustomerID, Email) values (226, 'asheara69@com.com');
insert into Customer_Email (CustomerID, Email) values (227, 'gornillos6a@google.nl');
insert into Customer_Email (CustomerID, Email) values (228, 'wanselmi6b@theguardian.com');
insert into Customer_Email (CustomerID, Email) values (229, 'mmastrantone6c@go.com');
insert into Customer_Email (CustomerID, Email) values (230, 'varnaudin6d@hp.com');
insert into Customer_Email (CustomerID, Email) values (231, 'cdemicoli6e@51.la');
insert into Customer_Email (CustomerID, Email) values (232, 'eforgan6f@fc2.com');
insert into Customer_Email (CustomerID, Email) values (233, 'kdownse6g@aol.com');
insert into Customer_Email (CustomerID, Email) values (234, 'cdeaconson6h@comcast.net');
insert into Customer_Email (CustomerID, Email) values (235, 'cpassie6i@dropbox.com');
insert into Customer_Email (CustomerID, Email) values (236, 'dbrind6j@arstechnica.com');
insert into Customer_Email (CustomerID, Email) values (237, 'vsquire6k@arstechnica.com');
insert into Customer_Email (CustomerID, Email) values (238, 'ssidon6l@goo.gl');
insert into Customer_Email (CustomerID, Email) values (239, 'ntembridge6m@usa.gov');
insert into Customer_Email (CustomerID, Email) values (240, 'mtinwell6n@shinystat.com');
insert into Customer_Email (CustomerID, Email) values (241, 'lolsson6o@wikia.com');
insert into Customer_Email (CustomerID, Email) values (242, 'mtompkins6p@mediafire.com');
insert into Customer_Email (CustomerID, Email) values (243, 'pgonin6q@simplemachines.org');
insert into Customer_Email (CustomerID, Email) values (244, 'tfewkes6r@ebay.co.uk');
insert into Customer_Email (CustomerID, Email) values (245, 'cmacwhirter6s@imdb.com');
insert into Customer_Email (CustomerID, Email) values (246, 'wfrediani6t@patch.com');
insert into Customer_Email (CustomerID, Email) values (247, 'bwinman6u@redcross.org');
insert into Customer_Email (CustomerID, Email) values (248, 'gblenkinship6v@issuu.com');
insert into Customer_Email (CustomerID, Email) values (249, 'jfonzo6w@wikispaces.com');
insert into Customer_Email (CustomerID, Email) values (250, 'lgostall6x@miitbeian.gov.cn');
insert into Customer_Email (CustomerID, Email) values (251, 'cadamovitch6y@smh.com.au');
insert into Customer_Email (CustomerID, Email) values (252, 'ibeldan6z@prweb.com');
insert into Customer_Email (CustomerID, Email) values (253, 'theselwood70@fastcompany.com');
insert into Customer_Email (CustomerID, Email) values (254, 'torvis71@toplist.cz');
insert into Customer_Email (CustomerID, Email) values (255, 'tbrunker72@cmu.edu');
insert into Customer_Email (CustomerID, Email) values (256, 'ccrutch73@cmu.edu');
insert into Customer_Email (CustomerID, Email) values (257, 'jfoltin74@admin.ch');
insert into Customer_Email (CustomerID, Email) values (258, 'npeschke75@state.gov');
insert into Customer_Email (CustomerID, Email) values (259, 'ukennelly76@github.io');
insert into Customer_Email (CustomerID, Email) values (260, 'zladlow77@sina.com.cn');
insert into Customer_Email (CustomerID, Email) values (261, 'khuske78@wisc.edu');
insert into Customer_Email (CustomerID, Email) values (262, 'ktomalin79@redcross.org');
insert into Customer_Email (CustomerID, Email) values (263, 'dcleynaert7a@newyorker.com');
insert into Customer_Email (CustomerID, Email) values (264, 'htrencher7b@storify.com');
insert into Customer_Email (CustomerID, Email) values (265, 'lmcdermottrow7c@aboutads.info');
insert into Customer_Email (CustomerID, Email) values (266, 'rmudd7d@ezinearticles.com');
insert into Customer_Email (CustomerID, Email) values (267, 'mwithrington7e@weibo.com');
insert into Customer_Email (CustomerID, Email) values (268, 'qglazyer7f@theglobeandmail.com');
insert into Customer_Email (CustomerID, Email) values (269, 'alegood7g@microsoft.com');
insert into Customer_Email (CustomerID, Email) values (270, 'aoakenfield7h@technorati.com');
insert into Customer_Email (CustomerID, Email) values (271, 'rgoodrum7i@bbb.org');
insert into Customer_Email (CustomerID, Email) values (272, 'gcolthard7j@indiatimes.com');
insert into Customer_Email (CustomerID, Email) values (273, 'ctierney7k@mac.com');
insert into Customer_Email (CustomerID, Email) values (274, 'fhugett7l@slideshare.net');
insert into Customer_Email (CustomerID, Email) values (275, 'ccoltherd7m@netlog.com');
insert into Customer_Email (CustomerID, Email) values (276, 'rmcgrirl7n@virginia.edu');
insert into Customer_Email (CustomerID, Email) values (277, 'mbanyard7o@miibeian.gov.cn');
insert into Customer_Email (CustomerID, Email) values (278, 'dbeining7p@squidoo.com');
insert into Customer_Email (CustomerID, Email) values (279, 'lmcilhone7q@bloglovin.com');
insert into Customer_Email (CustomerID, Email) values (280, 'lstidston7r@privacy.gov.au');
insert into Customer_Email (CustomerID, Email) values (281, 'psansun7s@mashable.com');
insert into Customer_Email (CustomerID, Email) values (282, 'mbarbey7t@friendfeed.com');
insert into Customer_Email (CustomerID, Email) values (283, 'kkolodziejski7u@aol.com');
insert into Customer_Email (CustomerID, Email) values (284, 'rmcquaker7v@wikimedia.org');
insert into Customer_Email (CustomerID, Email) values (285, 'bgile7w@fda.gov');
insert into Customer_Email (CustomerID, Email) values (286, 'sillem7x@dailymotion.com');
insert into Customer_Email (CustomerID, Email) values (287, 'mlebrum7y@google.ca');
insert into Customer_Email (CustomerID, Email) values (288, 'washwell7z@squarespace.com');
insert into Customer_Email (CustomerID, Email) values (289, 'djozsef80@indiegogo.com');
insert into Customer_Email (CustomerID, Email) values (290, 'fcondliffe81@myspace.com');
insert into Customer_Email (CustomerID, Email) values (291, 'lbritney82@unc.edu');
insert into Customer_Email (CustomerID, Email) values (292, 'kcatlow83@twitter.com');
insert into Customer_Email (CustomerID, Email) values (293, 'lasprey84@apple.com');
insert into Customer_Email (CustomerID, Email) values (294, 'kdaubney85@ocn.ne.jp');
insert into Customer_Email (CustomerID, Email) values (295, 'cmattioni86@go.com');
insert into Customer_Email (CustomerID, Email) values (296, 'sgreydon87@adobe.com');
insert into Customer_Email (CustomerID, Email) values (297, 'idines88@wiley.com');
insert into Customer_Email (CustomerID, Email) values (298, 'ureihm89@cloudflare.com');
insert into Customer_Email (CustomerID, Email) values (299, 'oblackhurst8a@umich.edu');
insert into Customer_Email (CustomerID, Email) values (300, 'ecosser8b@cpanel.net');
insert into Customer_Email (CustomerID, Email) values (301, 'nhourston8c@dedecms.com');
insert into Customer_Email (CustomerID, Email) values (302, 'zzavattero8d@t-online.de');
insert into Customer_Email (CustomerID, Email) values (303, 'dwakely8e@bluehost.com');
insert into Customer_Email (CustomerID, Email) values (304, 'cbiggans8f@wiley.com');
insert into Customer_Email (CustomerID, Email) values (305, 'gfoard8g@rediff.com');
insert into Customer_Email (CustomerID, Email) values (306, 'jpigden8h@shop-pro.jp');
insert into Customer_Email (CustomerID, Email) values (307, 'adettmar8i@google.pl');
insert into Customer_Email (CustomerID, Email) values (308, 'kbondar8j@uol.com.br');
insert into Customer_Email (CustomerID, Email) values (309, 'mhellis8k@java.com');
insert into Customer_Email (CustomerID, Email) values (310, 'nbayfield8l@mayoclinic.com');
insert into Customer_Email (CustomerID, Email) values (311, 'nrickhuss8m@sphinn.com');
insert into Customer_Email (CustomerID, Email) values (312, 'gdrillot8n@timesonline.co.uk');
insert into Customer_Email (CustomerID, Email) values (313, 'corrock8o@si.edu');
insert into Customer_Email (CustomerID, Email) values (314, 'dgerrens8p@cbc.ca');
insert into Customer_Email (CustomerID, Email) values (315, 'lodriscoll8q@illinois.edu');
insert into Customer_Email (CustomerID, Email) values (316, 'aoldey8r@biglobe.ne.jp');
insert into Customer_Email (CustomerID, Email) values (317, 'dantoszewski8s@ning.com');
insert into Customer_Email (CustomerID, Email) values (318, 'kheadingham8t@usnews.com');
insert into Customer_Email (CustomerID, Email) values (319, 'smacguigan8u@springer.com');
insert into Customer_Email (CustomerID, Email) values (320, 'ccrockley8v@creativecommons.org');
insert into Customer_Email (CustomerID, Email) values (321, 'bfuge8w@epa.gov');
insert into Customer_Email (CustomerID, Email) values (322, 'cbrowncey8x@histats.com');
insert into Customer_Email (CustomerID, Email) values (323, 'odishman8y@ucsd.edu');
insert into Customer_Email (CustomerID, Email) values (324, 'wbraxay8z@gov.uk');
insert into Customer_Email (CustomerID, Email) values (325, 'kkarmel90@google.cn');
insert into Customer_Email (CustomerID, Email) values (326, 'pstigger91@naver.com');
insert into Customer_Email (CustomerID, Email) values (327, 'cmouncher92@census.gov');
insert into Customer_Email (CustomerID, Email) values (328, 'asilbermann93@alibaba.com');
insert into Customer_Email (CustomerID, Email) values (329, 'bakers94@wordpress.org');
insert into Customer_Email (CustomerID, Email) values (330, 'sboyton95@psu.edu');
insert into Customer_Email (CustomerID, Email) values (331, 'lklewer96@ebay.com');
insert into Customer_Email (CustomerID, Email) values (332, 'mcaswill97@free.fr');
insert into Customer_Email (CustomerID, Email) values (333, 'npanther98@so-net.ne.jp');
insert into Customer_Email (CustomerID, Email) values (334, 'cblasoni99@cnet.com');
insert into Customer_Email (CustomerID, Email) values (335, 'gclemmey9a@joomla.org');
insert into Customer_Email (CustomerID, Email) values (336, 'siacovacci9b@oaic.gov.au');
insert into Customer_Email (CustomerID, Email) values (337, 'shawgood9c@ycombinator.com');
insert into Customer_Email (CustomerID, Email) values (338, 'emitro9d@istockphoto.com');
insert into Customer_Email (CustomerID, Email) values (339, 'jkinghorn9e@earthlink.net');
insert into Customer_Email (CustomerID, Email) values (340, 'tnotman9f@businessinsider.com');
insert into Customer_Email (CustomerID, Email) values (341, 'hgartshore9g@upenn.edu');
insert into Customer_Email (CustomerID, Email) values (342, 'scordeau9h@amazon.de');
insert into Customer_Email (CustomerID, Email) values (343, 'bstannah9i@scientificamerican.com');
insert into Customer_Email (CustomerID, Email) values (344, 'badne9j@oracle.com');
insert into Customer_Email (CustomerID, Email) values (345, 'rtender9k@earthlink.net');
insert into Customer_Email (CustomerID, Email) values (346, 'alambird9l@amazon.co.jp');
insert into Customer_Email (CustomerID, Email) values (347, 'eturvie9m@house.gov');
insert into Customer_Email (CustomerID, Email) values (348, 'mcraze9n@theguardian.com');
insert into Customer_Email (CustomerID, Email) values (349, 'cbrettle9o@dion.ne.jp');
insert into Customer_Email (CustomerID, Email) values (350, 'klannen9p@pinterest.com');
insert into Customer_Email (CustomerID, Email) values (351, 'dburstow9q@paypal.com');
insert into Customer_Email (CustomerID, Email) values (352, 'bscardifield9r@xrea.com');
insert into Customer_Email (CustomerID, Email) values (353, 'kschwanden9s@lycos.com');
insert into Customer_Email (CustomerID, Email) values (354, 'bnasi9t@yandex.ru');
insert into Customer_Email (CustomerID, Email) values (355, 'mmorehall9u@ezinearticles.com');
insert into Customer_Email (CustomerID, Email) values (356, 'jpanichelli9v@blinklist.com');
insert into Customer_Email (CustomerID, Email) values (357, 'wfalshaw9w@statcounter.com');
insert into Customer_Email (CustomerID, Email) values (358, 'garchbald9x@yahoo.com');
insert into Customer_Email (CustomerID, Email) values (359, 'gbrookzie9y@geocities.com');
insert into Customer_Email (CustomerID, Email) values (360, 'ymorgan9z@imageshack.us');
insert into Customer_Email (CustomerID, Email) values (361, 'pjeppersona0@sitemeter.com');
insert into Customer_Email (CustomerID, Email) values (362, 'lleithharveya1@freewebs.com');
insert into Customer_Email (CustomerID, Email) values (363, 'aelmhirsta2@dyndns.org');
insert into Customer_Email (CustomerID, Email) values (364, 'lhemphreya3@t-online.de');
insert into Customer_Email (CustomerID, Email) values (365, 'biorizzoa4@msu.edu');
insert into Customer_Email (CustomerID, Email) values (366, 'odangeloa5@google.es');
insert into Customer_Email (CustomerID, Email) values (367, 'vcanadinea6@jugem.jp');
insert into Customer_Email (CustomerID, Email) values (368, 'bneillansa7@samsung.com');
insert into Customer_Email (CustomerID, Email) values (369, 'bchalka8@intel.com');
insert into Customer_Email (CustomerID, Email) values (370, 'fgentlea9@irs.gov');
insert into Customer_Email (CustomerID, Email) values (371, 'awodhamaa@ycombinator.com');
insert into Customer_Email (CustomerID, Email) values (372, 'cdufaurab@psu.edu');
insert into Customer_Email (CustomerID, Email) values (373, 'dreuvenac@sun.com');
insert into Customer_Email (CustomerID, Email) values (374, 'bleybornead@aol.com');
insert into Customer_Email (CustomerID, Email) values (375, 'sbeavenae@friendfeed.com');
insert into Customer_Email (CustomerID, Email) values (376, 'eluckmanaf@abc.net.au');
insert into Customer_Email (CustomerID, Email) values (377, 'adechelleag@4shared.com');
insert into Customer_Email (CustomerID, Email) values (378, 'mfunnellah@list-manage.com');
insert into Customer_Email (CustomerID, Email) values (379, 'wsigarsai@is.gd');
insert into Customer_Email (CustomerID, Email) values (380, 'jtrenearaj@amazon.co.jp');
insert into Customer_Email (CustomerID, Email) values (381, 'apitkeathleyak@scribd.com');
insert into Customer_Email (CustomerID, Email) values (382, 'jcopinsal@ycombinator.com');
insert into Customer_Email (CustomerID, Email) values (383, 'lpetrouam@mlb.com');
insert into Customer_Email (CustomerID, Email) values (384, 'ascottesmooran@arstechnica.com');
insert into Customer_Email (CustomerID, Email) values (385, 'lgashao@arizona.edu');
insert into Customer_Email (CustomerID, Email) values (386, 'jwindressap@mashable.com');
insert into Customer_Email (CustomerID, Email) values (387, 'jtunsleyaq@dmoz.org');
insert into Customer_Email (CustomerID, Email) values (388, 'lrodgersar@arizona.edu');
insert into Customer_Email (CustomerID, Email) values (389, 'spavlishchevas@netlog.com');
insert into Customer_Email (CustomerID, Email) values (390, 'ljurekat@homestead.com');
insert into Customer_Email (CustomerID, Email) values (391, 'grobelinau@nationalgeographic.com');
insert into Customer_Email (CustomerID, Email) values (392, 'cinstonav@europa.eu');
insert into Customer_Email (CustomerID, Email) values (393, 'jjorisaw@dailymail.co.uk');
insert into Customer_Email (CustomerID, Email) values (394, 'smckertonax@instagram.com');
insert into Customer_Email (CustomerID, Email) values (395, 'beagletonay@unblog.fr');
insert into Customer_Email (CustomerID, Email) values (396, 'kgeraschaz@dailymail.co.uk');
insert into Customer_Email (CustomerID, Email) values (397, 'dstonehewerb0@slideshare.net');
insert into Customer_Email (CustomerID, Email) values (398, 'nkingswoldb1@tuttocitta.it');
insert into Customer_Email (CustomerID, Email) values (399, 'mpeceyb2@wunderground.com');
insert into Customer_Email (CustomerID, Email) values (400, 'aghilardib3@tinypic.com');
insert into Customer_Email (CustomerID, Email) values (401, 'gbeckleyb4@shop-pro.jp');
insert into Customer_Email (CustomerID, Email) values (402, 'ceilersb5@hibu.com');
insert into Customer_Email (CustomerID, Email) values (403, 'ehenrychb6@hc360.com');
insert into Customer_Email (CustomerID, Email) values (404, 'ppletb7@rediff.com');
insert into Customer_Email (CustomerID, Email) values (405, 'fbremmellb8@epa.gov');
insert into Customer_Email (CustomerID, Email) values (406, 'braymentb9@desdev.cn');
insert into Customer_Email (CustomerID, Email) values (407, 'ivakhoninba@hugedomains.com');
insert into Customer_Email (CustomerID, Email) values (408, 'cbenianbb@artisteer.com');
insert into Customer_Email (CustomerID, Email) values (409, 'tlefortbc@weebly.com');
insert into Customer_Email (CustomerID, Email) values (410, 'cliccardibd@jigsy.com');
insert into Customer_Email (CustomerID, Email) values (411, 'ohurrenbe@biblegateway.com');
insert into Customer_Email (CustomerID, Email) values (412, 'edevaenbf@over-blog.com');
insert into Customer_Email (CustomerID, Email) values (413, 'lcostarbg@gmpg.org');
insert into Customer_Email (CustomerID, Email) values (414, 'kgoodalebh@sciencedirect.com');
insert into Customer_Email (CustomerID, Email) values (415, 'jdowdingbi@gmpg.org');
insert into Customer_Email (CustomerID, Email) values (416, 'dbranwhitebj@chicagotribune.com');
insert into Customer_Email (CustomerID, Email) values (417, 'amaclarenbk@dot.gov');
insert into Customer_Email (CustomerID, Email) values (418, 'cpiddlesdenbl@liveinternet.ru');
insert into Customer_Email (CustomerID, Email) values (419, 'araisbeckbm@123-reg.co.uk');
insert into Customer_Email (CustomerID, Email) values (420, 'smacphersonbn@npr.org');
insert into Customer_Email (CustomerID, Email) values (421, 'lwattsbo@marketwatch.com');
insert into Customer_Email (CustomerID, Email) values (422, 'hwalklotbp@over-blog.com');
insert into Customer_Email (CustomerID, Email) values (423, 'clitsterbq@cdbaby.com');
insert into Customer_Email (CustomerID, Email) values (424, 'aschwantbr@imdb.com');
insert into Customer_Email (CustomerID, Email) values (425, 'awoollcottbs@1688.com');
insert into Customer_Email (CustomerID, Email) values (426, 'ntraherbt@tmall.com');
insert into Customer_Email (CustomerID, Email) values (427, 'pbradneckbu@dyndns.org');
insert into Customer_Email (CustomerID, Email) values (428, 'ycollishawbv@go.com');
insert into Customer_Email (CustomerID, Email) values (429, 'ctetsallbw@ox.ac.uk');
insert into Customer_Email (CustomerID, Email) values (430, 'bbrestonbx@vistaprint.com');
insert into Customer_Email (CustomerID, Email) values (431, 'cbillingby@google.nl');
insert into Customer_Email (CustomerID, Email) values (432, 'tgilhouleybz@walmart.com');
insert into Customer_Email (CustomerID, Email) values (433, 'djzhakovc0@walmart.com');
insert into Customer_Email (CustomerID, Email) values (434, 'mhaightonc1@wikimedia.org');
insert into Customer_Email (CustomerID, Email) values (435, 'hreinc2@google.pl');
insert into Customer_Email (CustomerID, Email) values (436, 'acrossanc3@yellowpages.com');
insert into Customer_Email (CustomerID, Email) values (437, 'ksirec4@yellowbook.com');
insert into Customer_Email (CustomerID, Email) values (438, 'hhyltonc5@baidu.com');
insert into Customer_Email (CustomerID, Email) values (439, 'fcorhardc6@harvard.edu');
insert into Customer_Email (CustomerID, Email) values (440, 'cbayliec7@time.com');
insert into Customer_Email (CustomerID, Email) values (441, 'grimec8@google.ca');
insert into Customer_Email (CustomerID, Email) values (442, 'mdaoutc9@behance.net');
insert into Customer_Email (CustomerID, Email) values (443, 'mfreyneca@kickstarter.com');
insert into Customer_Email (CustomerID, Email) values (444, 'vmcleviecb@mozilla.org');
insert into Customer_Email (CustomerID, Email) values (445, 'zpygottcc@elegantthemes.com');
insert into Customer_Email (CustomerID, Email) values (446, 'jabelescd@bigcartel.com');
insert into Customer_Email (CustomerID, Email) values (447, 'rhaslegravece@upenn.edu');
insert into Customer_Email (CustomerID, Email) values (448, 'bchestlecf@prweb.com');
insert into Customer_Email (CustomerID, Email) values (449, 'fscrubycg@wix.com');
insert into Customer_Email (CustomerID, Email) values (450, 'iskiggsch@msn.com');
insert into Customer_Email (CustomerID, Email) values (451, 'csamterci@homestead.com');
insert into Customer_Email (CustomerID, Email) values (452, 'jdownagecj@digg.com');
insert into Customer_Email (CustomerID, Email) values (453, 'dverneck@squidoo.com');
insert into Customer_Email (CustomerID, Email) values (454, 'lscaysbrookcl@ning.com');
insert into Customer_Email (CustomerID, Email) values (455, 'hrobbekecm@canalblog.com');
insert into Customer_Email (CustomerID, Email) values (456, 'mcapenorcn@ameblo.jp');
insert into Customer_Email (CustomerID, Email) values (457, 'gcraneyco@cloudflare.com');
insert into Customer_Email (CustomerID, Email) values (458, 'lalesiocp@prlog.org');
insert into Customer_Email (CustomerID, Email) values (459, 'tpettittcq@army.mil');
insert into Customer_Email (CustomerID, Email) values (460, 'lwhiffcr@arizona.edu');
insert into Customer_Email (CustomerID, Email) values (461, 'dfyldescs@nih.gov');
insert into Customer_Email (CustomerID, Email) values (462, 'cbrundlect@pagesperso-orange.fr');
insert into Customer_Email (CustomerID, Email) values (463, 'pbagshawecu@va.gov');
insert into Customer_Email (CustomerID, Email) values (464, 'kvasenkovcv@mysql.com');
insert into Customer_Email (CustomerID, Email) values (465, 'clambartoncw@si.edu');
insert into Customer_Email (CustomerID, Email) values (466, 'ptretheweycx@unblog.fr');
insert into Customer_Email (CustomerID, Email) values (467, 'hrasorcy@hp.com');
insert into Customer_Email (CustomerID, Email) values (468, 'sslessorcz@nps.gov');
insert into Customer_Email (CustomerID, Email) values (469, 'dsegraved0@cloudflare.com');
insert into Customer_Email (CustomerID, Email) values (470, 'cemmerd1@gravatar.com');
insert into Customer_Email (CustomerID, Email) values (471, 'rsimecekd2@nymag.com');
insert into Customer_Email (CustomerID, Email) values (472, 'rfoisterd3@tiny.cc');
insert into Customer_Email (CustomerID, Email) values (473, 'nsweynsond4@wikia.com');
insert into Customer_Email (CustomerID, Email) values (474, 'lshelbourned5@clickbank.net');
insert into Customer_Email (CustomerID, Email) values (475, 'kcoxalld6@live.com');
insert into Customer_Email (CustomerID, Email) values (476, 'emarrand7@google.pl');
insert into Customer_Email (CustomerID, Email) values (477, 'lmcanalleyd8@buzzfeed.com');
insert into Customer_Email (CustomerID, Email) values (478, 'tcampioned9@senate.gov');
insert into Customer_Email (CustomerID, Email) values (479, 'egjerdeda@sbwire.com');
insert into Customer_Email (CustomerID, Email) values (480, 'sgirogettidb@themeforest.net');
insert into Customer_Email (CustomerID, Email) values (481, 'brenisondc@sogou.com');
insert into Customer_Email (CustomerID, Email) values (482, 'wdengatedd@instagram.com');
insert into Customer_Email (CustomerID, Email) values (483, 'btudgede@eepurl.com');
insert into Customer_Email (CustomerID, Email) values (484, 'mbrockelsbydf@xing.com');
insert into Customer_Email (CustomerID, Email) values (485, 'ataylourdg@51.la');
insert into Customer_Email (CustomerID, Email) values (486, 'dpalserdh@smugmug.com');
insert into Customer_Email (CustomerID, Email) values (487, 'bmillierdi@digg.com');
insert into Customer_Email (CustomerID, Email) values (488, 'scushdj@cnn.com');
insert into Customer_Email (CustomerID, Email) values (489, 'wtulipdk@biglobe.ne.jp');
insert into Customer_Email (CustomerID, Email) values (490, 'pchrismasdl@mtv.com');
insert into Customer_Email (CustomerID, Email) values (491, 'ccurrindm@last.fm');
insert into Customer_Email (CustomerID, Email) values (492, 'bdysondn@reverbnation.com');
insert into Customer_Email (CustomerID, Email) values (493, 'nfareweatherdo@yale.edu');
insert into Customer_Email (CustomerID, Email) values (494, 'lmaccauleydp@omniture.com');
insert into Customer_Email (CustomerID, Email) values (495, 'wgainsburghdq@apple.com');
insert into Customer_Email (CustomerID, Email) values (496, 'lyakuntsovdr@bloomberg.com');
insert into Customer_Email (CustomerID, Email) values (497, 'gdunbards@bbc.co.uk');
insert into Customer_Email (CustomerID, Email) values (498, 'tmaruskadt@reuters.com');
insert into Customer_Email (CustomerID, Email) values (499, 'jjuzadu@bbc.co.uk');
insert into Customer_Email (CustomerID, Email) values (500, 'yhotchkindv@people.com.cn');


