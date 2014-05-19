USE GameBook
GO

CREATE PROCEDURE Get_FirstName
(	@CID		[int])
AS
SELECT FirstName 
	FROM [Character] 
	WHERE CharacterID = @CID