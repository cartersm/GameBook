USE GameBook
GO

CREATE PROCEDURE Get_User
(	@username		[nvarchar],
	@password		[nvarchar])
AS
SELECT * 
	FROM [User] 
	WHERE Username = @username 
		AND Password = @password