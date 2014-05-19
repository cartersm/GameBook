USE GameBook
GO

CREATE PROCEDURE Update_Image
(	@imagepath			[varchar],
	@CID				[int])
AS
UPDATE [Character] 
	SET ImagePath = @imagePath 
	WHERE CharacterID = @CID