USE GameBook
GO

CREATE PROCEDURE Get_Num_Username
(	@username		[nvarchar])
AS
SELECT COUNT(Username) 
	FROM [User] 
	WHERE Username = @username