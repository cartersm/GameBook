USE GameBook
GO

CREATE PROCEDURE Create_Note
(	@posterID		[int],
	@NoteText		[nvarchar])
AS
INSERT INTO [Note] (PosterID, Message, PowerUpNumber) 
	VALUES (@posterID, @NoteText, 0); 
SELECT SCOPE_IDENTITY()