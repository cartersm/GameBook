USE GameBook
GO

CREATE PROCEDURE Create_User
(	@username		[nvarchar],
	@password		[nvarchar])
AS
INSERT INTO [User] (Username, Password) 
	VALUES (@username, @password)