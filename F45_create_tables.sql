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
insert into Customer_Phone (CustomerID, Phone) values (501, '153-763-6218');
insert into Customer_Phone (CustomerID, Phone) values (502, '723-584-7407');
insert into Customer_Phone (CustomerID, Phone) values (503, '747-602-9286');
insert into Customer_Phone (CustomerID, Phone) values (504, '345-865-5916');
insert into Customer_Phone (CustomerID, Phone) values (505, '458-650-0762');
insert into Customer_Phone (CustomerID, Phone) values (506, '225-827-9077');
insert into Customer_Phone (CustomerID, Phone) values (507, '116-506-9604');
insert into Customer_Phone (CustomerID, Phone) values (508, '100-152-3304');
insert into Customer_Phone (CustomerID, Phone) values (509, '946-708-1463');
insert into Customer_Phone (CustomerID, Phone) values (510, '430-610-5518');
insert into Customer_Phone (CustomerID, Phone) values (511, '436-733-0065');
insert into Customer_Phone (CustomerID, Phone) values (512, '121-451-3139');
insert into Customer_Phone (CustomerID, Phone) values (513, '862-478-8546');
insert into Customer_Phone (CustomerID, Phone) values (514, '648-335-8357');
insert into Customer_Phone (CustomerID, Phone) values (515, '523-374-5964');
insert into Customer_Phone (CustomerID, Phone) values (516, '424-279-7539');
insert into Customer_Phone (CustomerID, Phone) values (517, '772-158-5244');
insert into Customer_Phone (CustomerID, Phone) values (518, '897-685-4720');
insert into Customer_Phone (CustomerID, Phone) values (519, '412-148-5494');
insert into Customer_Phone (CustomerID, Phone) values (520, '645-870-7394');
insert into Customer_Phone (CustomerID, Phone) values (521, '397-183-7100');
insert into Customer_Phone (CustomerID, Phone) values (522, '300-793-9394');
insert into Customer_Phone (CustomerID, Phone) values (523, '753-510-4801');
insert into Customer_Phone (CustomerID, Phone) values (524, '530-945-1434');
insert into Customer_Phone (CustomerID, Phone) values (525, '648-250-8077');
insert into Customer_Phone (CustomerID, Phone) values (526, '244-127-8724');
insert into Customer_Phone (CustomerID, Phone) values (527, '156-349-3247');
insert into Customer_Phone (CustomerID, Phone) values (528, '364-606-0784');
insert into Customer_Phone (CustomerID, Phone) values (529, '206-370-9848');
insert into Customer_Phone (CustomerID, Phone) values (530, '987-464-6545');
insert into Customer_Phone (CustomerID, Phone) values (531, '349-224-1906');
insert into Customer_Phone (CustomerID, Phone) values (532, '727-927-7184');
insert into Customer_Phone (CustomerID, Phone) values (533, '207-652-4386');
insert into Customer_Phone (CustomerID, Phone) values (534, '940-785-2017');
insert into Customer_Phone (CustomerID, Phone) values (535, '186-184-1300');
insert into Customer_Phone (CustomerID, Phone) values (536, '442-841-9612');
insert into Customer_Phone (CustomerID, Phone) values (537, '455-709-6143');
insert into Customer_Phone (CustomerID, Phone) values (538, '175-356-2076');
insert into Customer_Phone (CustomerID, Phone) values (539, '689-609-1033');
insert into Customer_Phone (CustomerID, Phone) values (540, '535-687-3499');
insert into Customer_Phone (CustomerID, Phone) values (541, '633-170-2115');
insert into Customer_Phone (CustomerID, Phone) values (542, '618-748-5222');
insert into Customer_Phone (CustomerID, Phone) values (543, '783-934-9667');
insert into Customer_Phone (CustomerID, Phone) values (544, '979-721-2421');
insert into Customer_Phone (CustomerID, Phone) values (545, '787-780-3728');
insert into Customer_Phone (CustomerID, Phone) values (546, '436-547-8923');
insert into Customer_Phone (CustomerID, Phone) values (547, '210-873-6129');
insert into Customer_Phone (CustomerID, Phone) values (548, '112-553-9963');
insert into Customer_Phone (CustomerID, Phone) values (549, '550-484-9805');
insert into Customer_Phone (CustomerID, Phone) values (550, '448-937-0263');
insert into Customer_Phone (CustomerID, Phone) values (551, '519-706-6353');
insert into Customer_Phone (CustomerID, Phone) values (552, '431-142-5859');
insert into Customer_Phone (CustomerID, Phone) values (553, '597-722-5783');
insert into Customer_Phone (CustomerID, Phone) values (554, '429-343-2797');
insert into Customer_Phone (CustomerID, Phone) values (555, '463-270-5717');
insert into Customer_Phone (CustomerID, Phone) values (556, '326-953-1994');
insert into Customer_Phone (CustomerID, Phone) values (557, '918-552-5247');
insert into Customer_Phone (CustomerID, Phone) values (558, '292-692-2575');
insert into Customer_Phone (CustomerID, Phone) values (559, '153-315-9724');
insert into Customer_Phone (CustomerID, Phone) values (560, '597-553-5151');
insert into Customer_Phone (CustomerID, Phone) values (561, '259-242-5583');
insert into Customer_Phone (CustomerID, Phone) values (562, '727-569-5649');
insert into Customer_Phone (CustomerID, Phone) values (563, '529-357-4911');
insert into Customer_Phone (CustomerID, Phone) values (564, '903-991-4301');
insert into Customer_Phone (CustomerID, Phone) values (565, '250-213-2038');
insert into Customer_Phone (CustomerID, Phone) values (566, '709-298-1829');
insert into Customer_Phone (CustomerID, Phone) values (567, '246-369-0729');
insert into Customer_Phone (CustomerID, Phone) values (568, '797-650-1640');
insert into Customer_Phone (CustomerID, Phone) values (569, '582-330-7637');
insert into Customer_Phone (CustomerID, Phone) values (570, '227-843-8128');
insert into Customer_Phone (CustomerID, Phone) values (571, '651-460-7192');
insert into Customer_Phone (CustomerID, Phone) values (572, '497-532-4593');
insert into Customer_Phone (CustomerID, Phone) values (573, '965-373-3685');
insert into Customer_Phone (CustomerID, Phone) values (574, '988-831-5539');
insert into Customer_Phone (CustomerID, Phone) values (575, '501-860-2821');
insert into Customer_Phone (CustomerID, Phone) values (576, '409-705-4913');
insert into Customer_Phone (CustomerID, Phone) values (577, '700-200-2085');
insert into Customer_Phone (CustomerID, Phone) values (578, '514-706-3497');
insert into Customer_Phone (CustomerID, Phone) values (579, '641-994-9808');
insert into Customer_Phone (CustomerID, Phone) values (580, '282-833-4405');
insert into Customer_Phone (CustomerID, Phone) values (581, '830-868-3449');
insert into Customer_Phone (CustomerID, Phone) values (582, '746-683-7131');
insert into Customer_Phone (CustomerID, Phone) values (583, '502-867-0880');
insert into Customer_Phone (CustomerID, Phone) values (584, '432-156-2002');
insert into Customer_Phone (CustomerID, Phone) values (585, '429-656-1494');
insert into Customer_Phone (CustomerID, Phone) values (586, '147-561-1567');
insert into Customer_Phone (CustomerID, Phone) values (587, '247-807-3939');
insert into Customer_Phone (CustomerID, Phone) values (588, '151-112-1623');
insert into Customer_Phone (CustomerID, Phone) values (589, '574-578-7044');
insert into Customer_Phone (CustomerID, Phone) values (590, '801-758-7453');
insert into Customer_Phone (CustomerID, Phone) values (591, '652-662-6026');
insert into Customer_Phone (CustomerID, Phone) values (592, '384-574-8622');
insert into Customer_Phone (CustomerID, Phone) values (593, '927-595-2465');
insert into Customer_Phone (CustomerID, Phone) values (594, '158-457-4979');
insert into Customer_Phone (CustomerID, Phone) values (595, '215-692-4616');
insert into Customer_Phone (CustomerID, Phone) values (596, '878-951-8246');
insert into Customer_Phone (CustomerID, Phone) values (597, '394-452-8199');
insert into Customer_Phone (CustomerID, Phone) values (598, '939-758-1800');
insert into Customer_Phone (CustomerID, Phone) values (599, '254-444-8741');
insert into Customer_Phone (CustomerID, Phone) values (600, '401-447-8476');
insert into Customer_Phone (CustomerID, Phone) values (601, '391-172-8308');
insert into Customer_Phone (CustomerID, Phone) values (602, '704-923-3187');
insert into Customer_Phone (CustomerID, Phone) values (603, '874-458-6489');
insert into Customer_Phone (CustomerID, Phone) values (604, '925-387-1344');
insert into Customer_Phone (CustomerID, Phone) values (605, '156-946-3556');
insert into Customer_Phone (CustomerID, Phone) values (606, '886-489-7034');
insert into Customer_Phone (CustomerID, Phone) values (607, '129-847-8184');
insert into Customer_Phone (CustomerID, Phone) values (608, '879-765-1525');
insert into Customer_Phone (CustomerID, Phone) values (609, '529-854-8348');
insert into Customer_Phone (CustomerID, Phone) values (610, '582-524-3832');
insert into Customer_Phone (CustomerID, Phone) values (611, '693-258-2244');
insert into Customer_Phone (CustomerID, Phone) values (612, '831-952-2945');
insert into Customer_Phone (CustomerID, Phone) values (613, '920-749-5993');
insert into Customer_Phone (CustomerID, Phone) values (614, '393-573-4844');
insert into Customer_Phone (CustomerID, Phone) values (615, '962-615-8631');
insert into Customer_Phone (CustomerID, Phone) values (616, '443-407-1981');
insert into Customer_Phone (CustomerID, Phone) values (617, '100-719-7638');
insert into Customer_Phone (CustomerID, Phone) values (618, '616-993-9069');
insert into Customer_Phone (CustomerID, Phone) values (619, '117-338-0804');
insert into Customer_Phone (CustomerID, Phone) values (620, '296-292-2626');
insert into Customer_Phone (CustomerID, Phone) values (621, '676-505-4300');
insert into Customer_Phone (CustomerID, Phone) values (622, '671-275-1265');
insert into Customer_Phone (CustomerID, Phone) values (623, '956-886-5572');
insert into Customer_Phone (CustomerID, Phone) values (624, '423-635-3096');
insert into Customer_Phone (CustomerID, Phone) values (625, '973-471-1920');
insert into Customer_Phone (CustomerID, Phone) values (626, '926-238-9710');
insert into Customer_Phone (CustomerID, Phone) values (627, '993-820-9379');
insert into Customer_Phone (CustomerID, Phone) values (628, '433-533-3853');
insert into Customer_Phone (CustomerID, Phone) values (629, '330-697-8061');
insert into Customer_Phone (CustomerID, Phone) values (630, '791-553-2313');
insert into Customer_Phone (CustomerID, Phone) values (631, '183-290-9307');
insert into Customer_Phone (CustomerID, Phone) values (632, '915-457-7177');
insert into Customer_Phone (CustomerID, Phone) values (633, '292-438-8371');
insert into Customer_Phone (CustomerID, Phone) values (634, '868-655-9145');
insert into Customer_Phone (CustomerID, Phone) values (635, '736-317-2490');
insert into Customer_Phone (CustomerID, Phone) values (636, '460-769-5060');
insert into Customer_Phone (CustomerID, Phone) values (637, '953-529-3534');
insert into Customer_Phone (CustomerID, Phone) values (638, '509-112-6243');
insert into Customer_Phone (CustomerID, Phone) values (639, '727-700-9221');
insert into Customer_Phone (CustomerID, Phone) values (640, '105-113-2014');
insert into Customer_Phone (CustomerID, Phone) values (641, '205-619-7546');
insert into Customer_Phone (CustomerID, Phone) values (642, '924-623-1526');
insert into Customer_Phone (CustomerID, Phone) values (643, '296-135-6189');
insert into Customer_Phone (CustomerID, Phone) values (644, '298-489-6725');
insert into Customer_Phone (CustomerID, Phone) values (645, '373-562-3151');
insert into Customer_Phone (CustomerID, Phone) values (646, '196-498-7652');
insert into Customer_Phone (CustomerID, Phone) values (647, '631-397-6322');
insert into Customer_Phone (CustomerID, Phone) values (648, '735-250-2822');
insert into Customer_Phone (CustomerID, Phone) values (649, '618-871-1945');
insert into Customer_Phone (CustomerID, Phone) values (650, '941-275-4263');
insert into Customer_Phone (CustomerID, Phone) values (651, '572-937-8675');
insert into Customer_Phone (CustomerID, Phone) values (652, '880-730-0697');
insert into Customer_Phone (CustomerID, Phone) values (653, '786-162-1265');
insert into Customer_Phone (CustomerID, Phone) values (654, '364-952-2957');
insert into Customer_Phone (CustomerID, Phone) values (655, '412-731-0176');
insert into Customer_Phone (CustomerID, Phone) values (656, '773-386-3569');
insert into Customer_Phone (CustomerID, Phone) values (657, '485-156-3233');
insert into Customer_Phone (CustomerID, Phone) values (658, '587-259-2396');
insert into Customer_Phone (CustomerID, Phone) values (659, '154-235-0428');
insert into Customer_Phone (CustomerID, Phone) values (660, '540-253-5068');
insert into Customer_Phone (CustomerID, Phone) values (661, '955-463-4276');
insert into Customer_Phone (CustomerID, Phone) values (662, '506-745-4712');
insert into Customer_Phone (CustomerID, Phone) values (663, '627-723-8232');
insert into Customer_Phone (CustomerID, Phone) values (664, '241-989-0580');
insert into Customer_Phone (CustomerID, Phone) values (665, '972-952-0020');
insert into Customer_Phone (CustomerID, Phone) values (666, '835-279-2538');
insert into Customer_Phone (CustomerID, Phone) values (667, '251-875-4438');
insert into Customer_Phone (CustomerID, Phone) values (668, '920-795-6971');
insert into Customer_Phone (CustomerID, Phone) values (669, '664-718-9917');
insert into Customer_Phone (CustomerID, Phone) values (670, '947-466-2506');
insert into Customer_Phone (CustomerID, Phone) values (671, '695-390-0911');
insert into Customer_Phone (CustomerID, Phone) values (672, '628-620-5736');
insert into Customer_Phone (CustomerID, Phone) values (673, '343-254-9599');
insert into Customer_Phone (CustomerID, Phone) values (674, '357-276-8876');
insert into Customer_Phone (CustomerID, Phone) values (675, '923-132-3959');
insert into Customer_Phone (CustomerID, Phone) values (676, '741-155-9721');
insert into Customer_Phone (CustomerID, Phone) values (677, '739-489-5720');
insert into Customer_Phone (CustomerID, Phone) values (678, '875-491-5708');
insert into Customer_Phone (CustomerID, Phone) values (679, '377-774-2417');
insert into Customer_Phone (CustomerID, Phone) values (680, '636-956-4964');
insert into Customer_Phone (CustomerID, Phone) values (681, '807-476-5714');
insert into Customer_Phone (CustomerID, Phone) values (682, '111-535-5925');
insert into Customer_Phone (CustomerID, Phone) values (683, '561-222-2047');
insert into Customer_Phone (CustomerID, Phone) values (684, '820-945-8397');
insert into Customer_Phone (CustomerID, Phone) values (685, '183-723-2052');
insert into Customer_Phone (CustomerID, Phone) values (686, '546-932-0723');
insert into Customer_Phone (CustomerID, Phone) values (687, '941-652-8577');
insert into Customer_Phone (CustomerID, Phone) values (688, '529-542-7397');
insert into Customer_Phone (CustomerID, Phone) values (689, '229-845-1125');
insert into Customer_Phone (CustomerID, Phone) values (690, '548-515-8001');
insert into Customer_Phone (CustomerID, Phone) values (691, '605-720-9497');
insert into Customer_Phone (CustomerID, Phone) values (692, '291-697-2312');
insert into Customer_Phone (CustomerID, Phone) values (693, '541-736-2133');
insert into Customer_Phone (CustomerID, Phone) values (694, '969-156-7741');
insert into Customer_Phone (CustomerID, Phone) values (695, '435-556-5254');
insert into Customer_Phone (CustomerID, Phone) values (696, '228-679-8184');
insert into Customer_Phone (CustomerID, Phone) values (697, '560-964-1690');
insert into Customer_Phone (CustomerID, Phone) values (698, '323-957-4179');
insert into Customer_Phone (CustomerID, Phone) values (699, '871-714-8232');
insert into Customer_Phone (CustomerID, Phone) values (700, '254-404-9872');
insert into Customer_Phone (CustomerID, Phone) values (701, '689-708-9791');
insert into Customer_Phone (CustomerID, Phone) values (702, '472-340-3698');
insert into Customer_Phone (CustomerID, Phone) values (703, '621-996-1628');
insert into Customer_Phone (CustomerID, Phone) values (704, '121-457-2773');
insert into Customer_Phone (CustomerID, Phone) values (705, '301-821-8217');
insert into Customer_Phone (CustomerID, Phone) values (706, '550-212-4679');
insert into Customer_Phone (CustomerID, Phone) values (707, '138-920-7259');
insert into Customer_Phone (CustomerID, Phone) values (708, '870-810-4767');
insert into Customer_Phone (CustomerID, Phone) values (709, '227-945-7594');
insert into Customer_Phone (CustomerID, Phone) values (710, '233-785-6963');
insert into Customer_Phone (CustomerID, Phone) values (711, '432-607-4789');
insert into Customer_Phone (CustomerID, Phone) values (712, '405-373-8322');
insert into Customer_Phone (CustomerID, Phone) values (713, '612-535-5118');
insert into Customer_Phone (CustomerID, Phone) values (714, '610-272-2019');
insert into Customer_Phone (CustomerID, Phone) values (715, '359-533-2488');
insert into Customer_Phone (CustomerID, Phone) values (716, '859-295-6995');
insert into Customer_Phone (CustomerID, Phone) values (717, '576-124-1655');
insert into Customer_Phone (CustomerID, Phone) values (718, '423-470-8847');
insert into Customer_Phone (CustomerID, Phone) values (719, '597-218-2974');
insert into Customer_Phone (CustomerID, Phone) values (720, '869-276-0388');
insert into Customer_Phone (CustomerID, Phone) values (721, '999-175-1895');
insert into Customer_Phone (CustomerID, Phone) values (722, '612-774-1904');
insert into Customer_Phone (CustomerID, Phone) values (723, '946-828-1076');
insert into Customer_Phone (CustomerID, Phone) values (724, '633-871-2853');
insert into Customer_Phone (CustomerID, Phone) values (725, '874-129-4485');
insert into Customer_Phone (CustomerID, Phone) values (726, '826-607-9005');
insert into Customer_Phone (CustomerID, Phone) values (727, '926-496-9168');
insert into Customer_Phone (CustomerID, Phone) values (728, '239-222-8389');
insert into Customer_Phone (CustomerID, Phone) values (729, '370-353-9692');
insert into Customer_Phone (CustomerID, Phone) values (730, '869-784-0286');
insert into Customer_Phone (CustomerID, Phone) values (731, '559-403-3458');
insert into Customer_Phone (CustomerID, Phone) values (732, '261-340-7544');
insert into Customer_Phone (CustomerID, Phone) values (733, '582-270-2567');
insert into Customer_Phone (CustomerID, Phone) values (734, '179-747-7231');
insert into Customer_Phone (CustomerID, Phone) values (735, '137-710-6598');
insert into Customer_Phone (CustomerID, Phone) values (736, '366-808-1601');
insert into Customer_Phone (CustomerID, Phone) values (737, '838-622-8950');
insert into Customer_Phone (CustomerID, Phone) values (738, '563-224-5525');
insert into Customer_Phone (CustomerID, Phone) values (739, '484-674-8565');
insert into Customer_Phone (CustomerID, Phone) values (740, '268-871-8583');
insert into Customer_Phone (CustomerID, Phone) values (741, '267-159-4847');
insert into Customer_Phone (CustomerID, Phone) values (742, '764-665-2703');
insert into Customer_Phone (CustomerID, Phone) values (743, '872-723-6225');
insert into Customer_Phone (CustomerID, Phone) values (744, '258-680-7656');
insert into Customer_Phone (CustomerID, Phone) values (745, '146-841-6844');
insert into Customer_Phone (CustomerID, Phone) values (746, '530-833-9542');
insert into Customer_Phone (CustomerID, Phone) values (747, '164-553-4620');
insert into Customer_Phone (CustomerID, Phone) values (748, '460-591-5563');
insert into Customer_Phone (CustomerID, Phone) values (749, '527-935-1298');
insert into Customer_Phone (CustomerID, Phone) values (750, '510-748-2889');
insert into Customer_Phone (CustomerID, Phone) values (751, '680-643-2616');
insert into Customer_Phone (CustomerID, Phone) values (752, '163-380-8703');
insert into Customer_Phone (CustomerID, Phone) values (753, '407-668-5688');
insert into Customer_Phone (CustomerID, Phone) values (754, '698-474-1048');
insert into Customer_Phone (CustomerID, Phone) values (755, '754-992-1162');
insert into Customer_Phone (CustomerID, Phone) values (756, '576-364-7760');
insert into Customer_Phone (CustomerID, Phone) values (757, '415-484-0077');
insert into Customer_Phone (CustomerID, Phone) values (758, '294-952-1123');
insert into Customer_Phone (CustomerID, Phone) values (759, '156-268-5522');
insert into Customer_Phone (CustomerID, Phone) values (760, '723-101-2937');
insert into Customer_Phone (CustomerID, Phone) values (761, '379-974-9737');
insert into Customer_Phone (CustomerID, Phone) values (762, '667-226-0669');
insert into Customer_Phone (CustomerID, Phone) values (763, '995-809-7165');
insert into Customer_Phone (CustomerID, Phone) values (764, '529-120-0688');
insert into Customer_Phone (CustomerID, Phone) values (765, '420-963-0931');
insert into Customer_Phone (CustomerID, Phone) values (766, '890-146-1570');
insert into Customer_Phone (CustomerID, Phone) values (767, '342-205-4874');
insert into Customer_Phone (CustomerID, Phone) values (768, '318-259-6107');
insert into Customer_Phone (CustomerID, Phone) values (769, '846-366-1909');
insert into Customer_Phone (CustomerID, Phone) values (770, '392-929-1204');
insert into Customer_Phone (CustomerID, Phone) values (771, '404-717-7019');
insert into Customer_Phone (CustomerID, Phone) values (772, '472-346-8856');
insert into Customer_Phone (CustomerID, Phone) values (773, '829-244-3038');
insert into Customer_Phone (CustomerID, Phone) values (774, '157-549-5646');
insert into Customer_Phone (CustomerID, Phone) values (775, '767-591-4665');
insert into Customer_Phone (CustomerID, Phone) values (776, '343-874-3593');
insert into Customer_Phone (CustomerID, Phone) values (777, '804-824-0326');
insert into Customer_Phone (CustomerID, Phone) values (778, '981-961-7474');
insert into Customer_Phone (CustomerID, Phone) values (779, '837-797-5703');
insert into Customer_Phone (CustomerID, Phone) values (780, '754-432-4082');
insert into Customer_Phone (CustomerID, Phone) values (781, '468-751-2961');
insert into Customer_Phone (CustomerID, Phone) values (782, '475-382-2916');
insert into Customer_Phone (CustomerID, Phone) values (783, '951-527-0072');
insert into Customer_Phone (CustomerID, Phone) values (784, '736-999-8053');
insert into Customer_Phone (CustomerID, Phone) values (785, '170-429-0518');
insert into Customer_Phone (CustomerID, Phone) values (786, '878-258-7796');
insert into Customer_Phone (CustomerID, Phone) values (787, '596-825-2066');
insert into Customer_Phone (CustomerID, Phone) values (788, '813-198-2961');
insert into Customer_Phone (CustomerID, Phone) values (789, '125-258-2929');
insert into Customer_Phone (CustomerID, Phone) values (790, '426-526-0577');
insert into Customer_Phone (CustomerID, Phone) values (791, '204-139-9624');
insert into Customer_Phone (CustomerID, Phone) values (792, '695-353-2887');
insert into Customer_Phone (CustomerID, Phone) values (793, '623-222-9532');
insert into Customer_Phone (CustomerID, Phone) values (794, '939-839-6655');
insert into Customer_Phone (CustomerID, Phone) values (795, '587-826-7030');
insert into Customer_Phone (CustomerID, Phone) values (796, '858-562-4255');
insert into Customer_Phone (CustomerID, Phone) values (797, '174-321-8684');
insert into Customer_Phone (CustomerID, Phone) values (798, '866-794-0168');
insert into Customer_Phone (CustomerID, Phone) values (799, '634-629-1679');
insert into Customer_Phone (CustomerID, Phone) values (800, '473-362-1837');
insert into Customer_Phone (CustomerID, Phone) values (801, '257-435-7833');
insert into Customer_Phone (CustomerID, Phone) values (802, '758-911-0140');
insert into Customer_Phone (CustomerID, Phone) values (803, '831-571-7093');
insert into Customer_Phone (CustomerID, Phone) values (804, '361-275-6460');
insert into Customer_Phone (CustomerID, Phone) values (805, '158-341-2077');
insert into Customer_Phone (CustomerID, Phone) values (806, '362-556-4767');
insert into Customer_Phone (CustomerID, Phone) values (807, '510-763-4167');
insert into Customer_Phone (CustomerID, Phone) values (808, '551-147-6922');
insert into Customer_Phone (CustomerID, Phone) values (809, '947-479-0535');
insert into Customer_Phone (CustomerID, Phone) values (810, '501-732-7265');
insert into Customer_Phone (CustomerID, Phone) values (811, '131-846-6289');
insert into Customer_Phone (CustomerID, Phone) values (812, '490-243-5278');
insert into Customer_Phone (CustomerID, Phone) values (813, '974-729-6810');
insert into Customer_Phone (CustomerID, Phone) values (814, '389-700-2687');
insert into Customer_Phone (CustomerID, Phone) values (815, '960-188-7261');
insert into Customer_Phone (CustomerID, Phone) values (816, '524-204-7881');
insert into Customer_Phone (CustomerID, Phone) values (817, '385-765-4418');
insert into Customer_Phone (CustomerID, Phone) values (818, '236-812-7458');
insert into Customer_Phone (CustomerID, Phone) values (819, '571-299-0044');
insert into Customer_Phone (CustomerID, Phone) values (820, '852-261-3634');
insert into Customer_Phone (CustomerID, Phone) values (821, '579-594-6433');
insert into Customer_Phone (CustomerID, Phone) values (822, '178-128-8679');
insert into Customer_Phone (CustomerID, Phone) values (823, '208-862-0217');
insert into Customer_Phone (CustomerID, Phone) values (824, '283-142-6859');
insert into Customer_Phone (CustomerID, Phone) values (825, '562-163-0580');
insert into Customer_Phone (CustomerID, Phone) values (826, '789-793-2217');
insert into Customer_Phone (CustomerID, Phone) values (827, '587-659-6200');
insert into Customer_Phone (CustomerID, Phone) values (828, '791-815-3472');
insert into Customer_Phone (CustomerID, Phone) values (829, '298-143-0953');
insert into Customer_Phone (CustomerID, Phone) values (830, '366-581-9820');
insert into Customer_Phone (CustomerID, Phone) values (831, '729-609-5798');
insert into Customer_Phone (CustomerID, Phone) values (832, '769-299-6413');
insert into Customer_Phone (CustomerID, Phone) values (833, '566-821-3842');
insert into Customer_Phone (CustomerID, Phone) values (834, '822-250-5136');
insert into Customer_Phone (CustomerID, Phone) values (835, '850-804-8793');
insert into Customer_Phone (CustomerID, Phone) values (836, '336-267-4747');
insert into Customer_Phone (CustomerID, Phone) values (837, '587-611-7808');
insert into Customer_Phone (CustomerID, Phone) values (838, '455-480-3948');
insert into Customer_Phone (CustomerID, Phone) values (839, '848-134-1567');
insert into Customer_Phone (CustomerID, Phone) values (840, '173-231-9055');
insert into Customer_Phone (CustomerID, Phone) values (841, '858-750-8217');
insert into Customer_Phone (CustomerID, Phone) values (842, '984-324-4229');
insert into Customer_Phone (CustomerID, Phone) values (843, '870-931-9855');
insert into Customer_Phone (CustomerID, Phone) values (844, '817-406-9589');
insert into Customer_Phone (CustomerID, Phone) values (845, '397-450-8328');
insert into Customer_Phone (CustomerID, Phone) values (846, '320-731-6680');
insert into Customer_Phone (CustomerID, Phone) values (847, '198-579-1862');
insert into Customer_Phone (CustomerID, Phone) values (848, '892-553-1302');
insert into Customer_Phone (CustomerID, Phone) values (849, '802-596-3505');
insert into Customer_Phone (CustomerID, Phone) values (850, '577-732-3062');
insert into Customer_Phone (CustomerID, Phone) values (851, '849-772-7440');
insert into Customer_Phone (CustomerID, Phone) values (852, '429-443-6450');
insert into Customer_Phone (CustomerID, Phone) values (853, '101-831-6869');
insert into Customer_Phone (CustomerID, Phone) values (854, '483-181-0512');
insert into Customer_Phone (CustomerID, Phone) values (855, '291-495-0482');
insert into Customer_Phone (CustomerID, Phone) values (856, '918-865-2271');
insert into Customer_Phone (CustomerID, Phone) values (857, '345-595-1080');
insert into Customer_Phone (CustomerID, Phone) values (858, '305-843-9758');
insert into Customer_Phone (CustomerID, Phone) values (859, '456-579-9014');
insert into Customer_Phone (CustomerID, Phone) values (860, '113-185-2259');
insert into Customer_Phone (CustomerID, Phone) values (861, '854-598-1062');
insert into Customer_Phone (CustomerID, Phone) values (862, '817-224-8615');
insert into Customer_Phone (CustomerID, Phone) values (863, '723-230-6230');
insert into Customer_Phone (CustomerID, Phone) values (864, '585-285-1996');
insert into Customer_Phone (CustomerID, Phone) values (865, '863-392-3318');
insert into Customer_Phone (CustomerID, Phone) values (866, '878-514-6046');
insert into Customer_Phone (CustomerID, Phone) values (867, '690-323-6107');
insert into Customer_Phone (CustomerID, Phone) values (868, '244-348-8378');
insert into Customer_Phone (CustomerID, Phone) values (869, '648-223-7980');
insert into Customer_Phone (CustomerID, Phone) values (870, '158-609-9766');
insert into Customer_Phone (CustomerID, Phone) values (871, '458-924-2107');
insert into Customer_Phone (CustomerID, Phone) values (872, '639-106-2622');
insert into Customer_Phone (CustomerID, Phone) values (873, '635-358-7097');
insert into Customer_Phone (CustomerID, Phone) values (874, '798-828-3356');
insert into Customer_Phone (CustomerID, Phone) values (875, '764-727-5158');
insert into Customer_Phone (CustomerID, Phone) values (876, '978-910-4386');
insert into Customer_Phone (CustomerID, Phone) values (877, '847-905-6580');
insert into Customer_Phone (CustomerID, Phone) values (878, '688-552-0728');
insert into Customer_Phone (CustomerID, Phone) values (879, '199-660-0212');
insert into Customer_Phone (CustomerID, Phone) values (880, '448-119-0217');
insert into Customer_Phone (CustomerID, Phone) values (881, '872-820-8832');
insert into Customer_Phone (CustomerID, Phone) values (882, '168-690-7774');
insert into Customer_Phone (CustomerID, Phone) values (883, '272-808-1247');
insert into Customer_Phone (CustomerID, Phone) values (884, '670-341-8770');
insert into Customer_Phone (CustomerID, Phone) values (885, '424-587-2986');
insert into Customer_Phone (CustomerID, Phone) values (886, '968-527-7913');
insert into Customer_Phone (CustomerID, Phone) values (887, '452-791-9324');
insert into Customer_Phone (CustomerID, Phone) values (888, '979-105-1075');
insert into Customer_Phone (CustomerID, Phone) values (889, '779-863-7131');
insert into Customer_Phone (CustomerID, Phone) values (890, '134-304-4633');
insert into Customer_Phone (CustomerID, Phone) values (891, '221-360-9044');
insert into Customer_Phone (CustomerID, Phone) values (892, '276-905-6998');
insert into Customer_Phone (CustomerID, Phone) values (893, '731-463-5093');
insert into Customer_Phone (CustomerID, Phone) values (894, '639-923-7958');
insert into Customer_Phone (CustomerID, Phone) values (895, '978-548-2606');
insert into Customer_Phone (CustomerID, Phone) values (896, '312-890-5833');
insert into Customer_Phone (CustomerID, Phone) values (897, '750-368-9623');
insert into Customer_Phone (CustomerID, Phone) values (898, '919-856-0266');
insert into Customer_Phone (CustomerID, Phone) values (899, '412-495-9305');
insert into Customer_Phone (CustomerID, Phone) values (900, '612-693-1590');
insert into Customer_Phone (CustomerID, Phone) values (901, '448-230-6017');
insert into Customer_Phone (CustomerID, Phone) values (902, '275-531-0289');
insert into Customer_Phone (CustomerID, Phone) values (903, '356-356-5329');
insert into Customer_Phone (CustomerID, Phone) values (904, '502-887-4855');
insert into Customer_Phone (CustomerID, Phone) values (905, '904-935-7660');
insert into Customer_Phone (CustomerID, Phone) values (906, '164-741-6649');
insert into Customer_Phone (CustomerID, Phone) values (907, '729-767-4355');
insert into Customer_Phone (CustomerID, Phone) values (908, '181-461-9898');
insert into Customer_Phone (CustomerID, Phone) values (909, '108-342-6374');
insert into Customer_Phone (CustomerID, Phone) values (910, '317-841-2623');
insert into Customer_Phone (CustomerID, Phone) values (911, '999-208-9488');
insert into Customer_Phone (CustomerID, Phone) values (912, '443-842-5257');
insert into Customer_Phone (CustomerID, Phone) values (913, '411-911-3040');
insert into Customer_Phone (CustomerID, Phone) values (914, '657-990-0786');
insert into Customer_Phone (CustomerID, Phone) values (915, '703-507-9225');
insert into Customer_Phone (CustomerID, Phone) values (916, '854-203-1621');
insert into Customer_Phone (CustomerID, Phone) values (917, '913-901-4938');
insert into Customer_Phone (CustomerID, Phone) values (918, '497-615-0896');
insert into Customer_Phone (CustomerID, Phone) values (919, '124-305-4733');
insert into Customer_Phone (CustomerID, Phone) values (920, '583-495-8026');
insert into Customer_Phone (CustomerID, Phone) values (921, '111-504-8729');
insert into Customer_Phone (CustomerID, Phone) values (922, '350-371-9899');
insert into Customer_Phone (CustomerID, Phone) values (923, '614-664-7954');
insert into Customer_Phone (CustomerID, Phone) values (924, '736-749-5814');
insert into Customer_Phone (CustomerID, Phone) values (925, '910-652-8396');
insert into Customer_Phone (CustomerID, Phone) values (926, '877-848-4491');
insert into Customer_Phone (CustomerID, Phone) values (927, '934-254-5063');
insert into Customer_Phone (CustomerID, Phone) values (928, '350-597-1472');
insert into Customer_Phone (CustomerID, Phone) values (929, '252-333-1825');
insert into Customer_Phone (CustomerID, Phone) values (930, '935-875-3708');
insert into Customer_Phone (CustomerID, Phone) values (931, '467-639-5323');
insert into Customer_Phone (CustomerID, Phone) values (932, '168-885-7289');
insert into Customer_Phone (CustomerID, Phone) values (933, '475-152-8232');
insert into Customer_Phone (CustomerID, Phone) values (934, '499-520-6556');
insert into Customer_Phone (CustomerID, Phone) values (935, '936-595-6789');
insert into Customer_Phone (CustomerID, Phone) values (936, '247-491-9331');
insert into Customer_Phone (CustomerID, Phone) values (937, '434-249-3428');
insert into Customer_Phone (CustomerID, Phone) values (938, '920-944-5201');
insert into Customer_Phone (CustomerID, Phone) values (939, '154-194-4051');
insert into Customer_Phone (CustomerID, Phone) values (940, '134-265-1453');
insert into Customer_Phone (CustomerID, Phone) values (941, '921-189-2350');
insert into Customer_Phone (CustomerID, Phone) values (942, '694-218-6023');
insert into Customer_Phone (CustomerID, Phone) values (943, '907-597-0650');
insert into Customer_Phone (CustomerID, Phone) values (944, '395-653-6392');
insert into Customer_Phone (CustomerID, Phone) values (945, '286-469-5660');
insert into Customer_Phone (CustomerID, Phone) values (946, '651-808-4189');
insert into Customer_Phone (CustomerID, Phone) values (947, '325-541-0438');
insert into Customer_Phone (CustomerID, Phone) values (948, '192-564-1873');
insert into Customer_Phone (CustomerID, Phone) values (949, '226-551-4542');
insert into Customer_Phone (CustomerID, Phone) values (950, '311-359-7210');
insert into Customer_Phone (CustomerID, Phone) values (951, '748-121-3817');
insert into Customer_Phone (CustomerID, Phone) values (952, '907-503-2604');
insert into Customer_Phone (CustomerID, Phone) values (953, '364-529-7402');
insert into Customer_Phone (CustomerID, Phone) values (954, '594-292-4371');
insert into Customer_Phone (CustomerID, Phone) values (955, '433-525-7553');
insert into Customer_Phone (CustomerID, Phone) values (956, '834-560-9336');
insert into Customer_Phone (CustomerID, Phone) values (957, '809-160-5354');
insert into Customer_Phone (CustomerID, Phone) values (958, '273-886-5069');
insert into Customer_Phone (CustomerID, Phone) values (959, '411-661-6920');
insert into Customer_Phone (CustomerID, Phone) values (960, '146-482-3867');
insert into Customer_Phone (CustomerID, Phone) values (961, '279-141-6901');
insert into Customer_Phone (CustomerID, Phone) values (962, '973-959-9264');
insert into Customer_Phone (CustomerID, Phone) values (963, '976-610-9465');
insert into Customer_Phone (CustomerID, Phone) values (964, '371-544-0209');
insert into Customer_Phone (CustomerID, Phone) values (965, '609-698-3322');
insert into Customer_Phone (CustomerID, Phone) values (966, '926-195-4902');
insert into Customer_Phone (CustomerID, Phone) values (967, '327-309-7829');
insert into Customer_Phone (CustomerID, Phone) values (968, '902-498-9537');
insert into Customer_Phone (CustomerID, Phone) values (969, '427-114-0058');
insert into Customer_Phone (CustomerID, Phone) values (970, '874-462-0511');
insert into Customer_Phone (CustomerID, Phone) values (971, '429-757-6186');
insert into Customer_Phone (CustomerID, Phone) values (972, '584-314-9975');
insert into Customer_Phone (CustomerID, Phone) values (973, '822-720-0930');
insert into Customer_Phone (CustomerID, Phone) values (974, '402-445-4556');
insert into Customer_Phone (CustomerID, Phone) values (975, '981-204-7936');
insert into Customer_Phone (CustomerID, Phone) values (976, '306-173-5796');
insert into Customer_Phone (CustomerID, Phone) values (977, '821-331-9467');
insert into Customer_Phone (CustomerID, Phone) values (978, '557-390-4437');
insert into Customer_Phone (CustomerID, Phone) values (979, '616-325-5068');
insert into Customer_Phone (CustomerID, Phone) values (980, '750-806-5193');
insert into Customer_Phone (CustomerID, Phone) values (981, '588-293-0888');
insert into Customer_Phone (CustomerID, Phone) values (982, '662-161-5640');
insert into Customer_Phone (CustomerID, Phone) values (983, '758-390-0374');
insert into Customer_Phone (CustomerID, Phone) values (984, '714-692-7942');
insert into Customer_Phone (CustomerID, Phone) values (985, '376-118-8703');
insert into Customer_Phone (CustomerID, Phone) values (986, '714-194-3761');
insert into Customer_Phone (CustomerID, Phone) values (987, '958-471-9880');
insert into Customer_Phone (CustomerID, Phone) values (988, '647-142-5893');
insert into Customer_Phone (CustomerID, Phone) values (989, '492-552-1061');
insert into Customer_Phone (CustomerID, Phone) values (990, '417-319-6604');
insert into Customer_Phone (CustomerID, Phone) values (991, '196-162-7046');
insert into Customer_Phone (CustomerID, Phone) values (992, '922-251-8928');
insert into Customer_Phone (CustomerID, Phone) values (993, '298-273-7194');
insert into Customer_Phone (CustomerID, Phone) values (994, '562-965-4268');
insert into Customer_Phone (CustomerID, Phone) values (995, '498-437-6077');
insert into Customer_Phone (CustomerID, Phone) values (996, '343-525-3552');
insert into Customer_Phone (CustomerID, Phone) values (997, '809-836-9078');
insert into Customer_Phone (CustomerID, Phone) values (998, '628-985-3492');
insert into Customer_Phone (CustomerID, Phone) values (999, '219-218-3907');
insert into Customer_Phone (CustomerID, Phone) values (1000, '656-614-0069');


