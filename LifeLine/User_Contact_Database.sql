--Create and drop tables for login, user info and contact list.


--Drop statements with If-Exits to check and not drop if the table is not in the server. 
--The drop statements are ordered so no drop constraint statments are needed
 
IF EXISTS (SELECT 1 FROM sysobjects
WHERE id=object_id('Contact_List') AND  type='U')
DROP TABLE Contact_List
GO

IF EXISTS (SELECT 1 FROM sysobjects
WHERE id=object_id('Contact_Info') AND  type='U')
DROP TABLE Contact_Info
GO

IF EXISTS (SELECT 1 FROM sysobjects
WHERE id=object_id('User_Info') AND  type='U')
DROP TABLE User_Info
GO

IF EXISTS (SELECT 1 FROM sysobjects
WHERE id=object_id('User_Login') AND  type='U')
DROP TABLE User_Login
GO



--All 4 tables are created, along with the Primary key constraints for esch table.

CREATE TABLE User_Login
(
	User_ID_Num uniqueidentifier not null,
	User_Email varchar(60) not null,
	User_Password varchar(30) not null,

	Constraint pk_User_ID_Num PRIMARY KEY (User_ID_Num)
)
GO

CREATE TABLE User_Info
(
	User_ID_Num uniqueidentifier not null,
	User_First_Name varchar(30) not null,
	User_Last_Name varchar(30) not null,
	User_Phone_Num varchar(10) not null,

	--Constraint pk_User_ID_Num PRIMARY KEY (User_ID_Num)
)
GO

CREATE TABLE Contact_List
(
	User_ID_Num uniqueidentifier not null,
	Contact_List_ID uniqueidentifier not null,
	Contact_ID_1 uniqueidentifier not null,
	Contact_ID_2 uniqueidentifier not null,
	Contact_ID_3 uniqueidentifier not null,
	Contact_ID_4 uniqueidentifier not null,
	Contact_ID_5 uniqueidentifier not null,

	Constraint pk_Contact_List_ID PRIMARY KEY (Contact_List_ID)

)
GO

CREATE TABLE Contact_Info
(
	Contact_ID uniqueidentifier not null,
	Contact_First_Name varchar(30) not null,
	Coantact_Last_Name varchar(30) not null,
	Contact_Email varchar(50) not null,
	Contact_Phone_Num varchar(10) not null,

	Constraint pk_Contact_ID PRIMARY KEY (Contact_ID)

)
GO

--Tables are altered with the creation of the foregin keys for all the tables.

ALTER TABLE Contact_List
ADD Constraint fk_Contact_ID_1
FOREIGN KEY (Contact_ID_1) 
REFERENCES Contact_Info(Contact_ID) 
go
 
ALTER TABLE Contact_List
ADD Constraint fk_Contact_ID_2
FOREIGN KEY (Contact_ID_2) 
REFERENCES Contact_Info(Contact_ID) 
go

ALTER TABLE Contact_List
ADD Constraint fk_Contact_ID_3
FOREIGN KEY (Contact_ID_3) 
REFERENCES Contact_Info(Contact_ID) 
go

ALTER TABLE Contact_List
ADD Constraint fk_Contact_ID_4
FOREIGN KEY (Contact_ID_4) 
REFERENCES Contact_Info(Contact_ID) 
go

ALTER TABLE Contact_List
ADD Constraint fk_Contact_ID_5
FOREIGN KEY (Contact_ID_5) 
REFERENCES Contact_Info(Contact_ID) 
go

ALTER TABLE Contact_List
ADD Constraint fk_User_ID_Num
FOREIGN KEY (User_ID_Num)
REFERENCES User_Login(User_ID_Num)
go

ALTER TABLE User_Info
ADD Constraint fk_User_ID_Num_2
FOREIGN KEY (User_ID_Num)
REFERENCES User_Login(User_ID_Num)
go

--Joins linking the tables and consrtints together are created. 
 
 --Join User_ID from User info, and Contact list ID form Contact List
SELECT        User_Info.User_ID_Num, Contact_List.Contact_List_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_2 AND 
						 Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5 INNER JOIN
                         User_Login ON Contact_List.User_ID_Num = User_Login.User_ID_Num INNER JOIN
                         User_Info ON User_Login.User_ID_Num = User_Info.User_ID_Num

Go


--Join Contact_ID_1 from list to contact ID form Contact Info
SELECT        Contact_List.Contact_ID_1, Contact_Info.Contact_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_2 AND 
						 Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5 INNER JOIN
                         User_Login ON Contact_List.User_ID_Num = User_Login.User_ID_Num INNER JOIN
                         User_Info ON User_Login.User_ID_Num = User_Info.User_ID_Num
GO


--Join Contact_ID_2 from list to contact ID form Contact Info
SELECT        Contact_List.Contact_ID_2, Contact_Info.Contact_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND 
						 Contact_Info.Contact_ID = Contact_List.Contact_ID_2 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5
GO


--Join Contact_ID_3 from list to contact ID form Contact Info
SELECT        Contact_List.Contact_ID_3, Contact_Info.Contact_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_2
						  AND Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5
GO


--Join Contact_ID_4 from list to contact ID form Contact Info
SELECT        Contact_List.Contact_ID_4, Contact_Info.Contact_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_2 
						 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5
GO


--Join Contact_ID_5 from list to contact ID form Contact Info
SELECT        Contact_List.Contact_ID_5, Contact_Info.Contact_ID
FROM            Contact_Info INNER JOIN
                         Contact_List ON Contact_Info.Contact_ID = Contact_List.Contact_ID_1 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_2 
						 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_3 AND 
                         Contact_Info.Contact_ID = Contact_List.Contact_ID_4 AND Contact_Info.Contact_ID = Contact_List.Contact_ID_5
GO

--Join User_ID from User login and User_ID from User_Info
SELECT        User_Login.User_ID_Num, User_Info.User_ID_Num AS Expr1
FROM            User_Login INNER JOIN
                         User_Info ON User_Login.User_ID_Num = User_Info.User_ID_Num INNER JOIN
                         Contact_List ON User_Login.User_ID_Num = Contact_List.User_ID_Num INNER JOIN
                         Contact_Info ON Contact_List.Contact_ID_1 = Contact_Info.Contact_ID AND Contact_List.Contact_ID_2 = Contact_Info.Contact_ID 
						 AND Contact_List.Contact_ID_3 = Contact_Info.Contact_ID AND 
                         Contact_List.Contact_ID_4 = Contact_Info.Contact_ID AND Contact_List.Contact_ID_5 = Contact_Info.Contact_ID
Go


