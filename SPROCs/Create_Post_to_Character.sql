USE GameBook
GO

CREATE PROCEDURE Create_Post_to_Character
(	@postID			[int],
	@charID			[int])
AS
INSERT INTO [PostToCharacter] (PostID, CharacterID) 
	VALUES ( @postID, @charID)