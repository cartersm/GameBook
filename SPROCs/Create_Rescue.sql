USE GameBook
GO

CREATE PROCEDURE Create_Rescue
(	@Hero			[int],
	@Damsel			[int],
	@Rescue_Status	[int])
AS
INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status)
	VALUES (@Hero, @Damsel, @Rescue_Status)