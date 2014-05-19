USE GameBook
GO

CREATE PROCEDURE Get_Login_CID
(	@username		[nvarchar])
AS
SELECT CharacterID 
	FROM [Login] 
	WHERE Username = @username