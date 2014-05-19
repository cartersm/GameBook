USE GameBook
GO

CREATE PROCEDURE Create_Login
(	@username		[nvarchar],
	@CID			[int])
AS
INSERT INTO [Login] (Username, CharacterID) 
	VALUES (@username, @CID)