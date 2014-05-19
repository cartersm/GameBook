USE GameBook
GO

CREATE PROCEDURE Create_Character_Profile
(	@FName			[nvarchar],
	@LName			[nvarchar],
	@Title			[nvarchar],
	@about			[ntext],
	@DOB			[date],
	@Gender			[nchar],
	@ImagPath		[varchar])
AS
INSERT INTO [Character] (FirstName ,LastName ,Title ,About ,DOB ,Gender ,ImagePath) 
	VALUES (@FName, @LName, @Title, @about, @DOB, @Gender, @ImagPath); 
SELECT SCOPE_IDENTITY()