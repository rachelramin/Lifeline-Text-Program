USE [MK_IW_MK_Student5]
GO

--The test data that will occupy our database


--test data for User_login
INSERT INTO User_Login (User_ID_Num, User_Email, User_Password)
	
	Values ( NEWID(), 'thisisafake_email@gmail.com', '12345')
GO

INSERT INTO User_Login (User_ID_Num, User_Email, User_Password)
	
	Values ( NEWID(), 'theregoodtestdatabraunt@weratedogs.com', 'he*k')
GO

INSERT INTO User_Login (User_ID_Num, User_Email, User_Password)
	
	Values ( NEWID(), 'janiceformaccounting@lastweektonight.com', 'shegaveaf*ck')
GO

--Test Data for User_info

DECLARE @TempID1 as uniqueidentifier

SELECT @TempID1 = User_ID_Num FROM User_Login WHERE User_Email = 'thisisafake_email@gmail.com' 

INSERT INTO User_Info ( User_Id_Num, User_First_Name, User_Last_Name, User_Phone_Num )

	VALUES ( @TempID1 , 'Edith', 'Lux' , '1804737856' )
GO

DECLARE @TempID1 as uniqueidentifier

SELECT @TempID1 = User_ID_Num FROM User_Login WHERE User_Email = 'theregoodtestdatabraunt@weratedogs.com' 

INSERT INTO User_Info ( User_Id_Num, User_First_Name, User_Last_Name, User_Phone_Num )

	VALUES ( @TempID1 , 'Brent', 'Dog' , '1334674456' )
GO


DECLARE @TempID1 as uniqueidentifier

SELECT @TempID1 = User_ID_Num FROM User_Login WHERE User_Email = 'janiceformaccounting@lastweektonight.com' 

INSERT INTO User_Info ( User_Id_Num, User_First_Name, User_Last_Name, User_Phone_Num )

	VALUES ( @TempID1 , 'Janice', 'FromAccounting' , '66666666' )
GO


--Test Data for contact_Info

INSERT INTO Contact_Info ( Contact_ID, Contact_First_Name, Coantact_Last_Name, Contact_Email, Contact_Phone_Num )

	VALUES ( NEWID(), 'Tim', 'Gun', 'timgunemail@email.com', '21566768970')

GO


INSERT INTO Contact_Info ( Contact_ID, Contact_First_Name, Coantact_Last_Name, Contact_Email, Contact_Phone_Num )

	VALUES ( NEWID(), 'Jim', 'Smith', 'jimsmith@email.com', '215646753')

GO


INSERT INTO Contact_Info ( Contact_ID, Contact_First_Name, Coantact_Last_Name, Contact_Email, Contact_Phone_Num )

	VALUES ( NEWID(), 'John', 'Doe', 'cadaver@email.com', '0000000000')

GO

INSERT INTO Contact_Info ( Contact_ID, Contact_First_Name, Coantact_Last_Name, Contact_Email, Contact_Phone_Num )

	VALUES ( NEWID(), 'Jane', 'Doe', 'mrs.cadaver@email.com', '1000000001')

GO

INSERT INTO Contact_Info ( Contact_ID, Contact_First_Name, Coantact_Last_Name, Contact_Email, Contact_Phone_Num )

	VALUES ( NEWID(), 'Janice', 'FromAccounting', 'janiceformaccounting@lastweektonight.com', '66666666')

GO

--Contact list test Data

DECLARE @TempID1 as uniqueidentifier
DECLARE @TempID2 as uniqueidentifier
DECLARE @TempID3 as uniqueidentifier
DECLARE @TempID4 as uniqueidentifier
DECLARE @TempID5 as uniqueidentifier
DECLARE @TempID6 as uniqueidentifier

SELECT @TempID1 = User_ID_Num FROM User_Login WHERE User_Email = 'theregoodtestdatabraunt@weratedogs.com'
SELECT @TempID2 = Contact_ID FROM Contact_Info WHERE Contact_Email = 'janiceformaccounting@lastweektonight.com'
SELECT @TempID3 = Contact_ID FROM Contact_Info WHERE Contact_Email = 'cadaver@email.com'
SELECT @TempID4 = Contact_ID FROM Contact_Info WHERE Contact_Email = 'jimsmith@email.com'
SELECT @TempID5 = Contact_ID FROM Contact_Info WHERE Contact_Email = 'timgunemail@email.com'
SELECT @TempID6 = Contact_ID FROM Contact_Info WHERE Contact_Email = 'mrs.cadaver@email.com'

INSERT INTO Contact_List ( User_ID_Num, Contact_List_ID, Contact_ID_1, Contact_ID_2, Contact_ID_3, Contact_ID_4, Contact_ID_5 )

	VALUES ( @TempID1, NEWID(), @TempID2, @TempID3, @TempID4, @TempID5, @TempID6 )
GO

