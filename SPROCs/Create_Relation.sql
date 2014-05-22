USE GameBook
GO

CREATE PROCEDURE Create_Relation
(	@UserCID			[int],
	@RescuedCID			[int],
	@RelationshipName	[nvarchar])
AS
INSERT INTO Relations (UserCID, RescuedCID, RelationshipName)
	VALUES (@UserCID, @RescuedCID, @RelationshipName)