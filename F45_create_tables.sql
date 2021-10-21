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

SELECT * FROM Customer;

