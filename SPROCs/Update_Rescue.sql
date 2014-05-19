USE GameBook
GO

CREATE PROCEDURE Update_Rescue
(	@Hero			[int],
	@Damsel			[int])
AS
UPDATE [Rescue] 
	SET Rescue_Status = 1 
	WHERE Hero = @Hero
		AND Damsel = @Damsel