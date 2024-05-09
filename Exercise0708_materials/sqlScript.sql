CREATE DATABASE ARTICLES
GO
USE ARTICLES
GO

CREATE TABLE Article
(
	IDArticle INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(300),
	Link NVARCHAR(300),
	Description NVARCHAR(900),
	PicturePath NVARCHAR(90),
	PublishedDate NVARCHAR(90)
)
GO

CREATE PROCEDURE createArticle
	@Title NVARCHAR(300),
	@Link NVARCHAR(300),
	@Description NVARCHAR(900),
	@PicturePath NVARCHAR(90),
	@PublishedDate NVARCHAR(90),
	@IDArticle INT OUTPUT
AS 
BEGIN 
	INSERT INTO Article VALUES(@Title, @Link, @Description, @PicturePath, @PublishedDate)
	SET @IDArticle = SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE updateArticle
	@Title NVARCHAR(300),
	@Link NVARCHAR(300),
	@Description NVARCHAR(900),
	@PicturePath NVARCHAR(90),
	@PublishedDate NVARCHAR(90),
	@IDArticle INT
	 
AS 
BEGIN 
	UPDATE Article SET 
		Title = @Title,
		Link = @Link,
		Description = @Description,
		PicturePath = @PicturePath,
		PublishedDate = @PublishedDate		
	WHERE 
		IDArticle = @IDArticle
END
GO


CREATE PROCEDURE deleteArticle
	@IDArticle INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Article
	WHERE 
		IDArticle = @IDArticle
END
GO

CREATE PROCEDURE selectArticle
	@IDArticle INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Article
	WHERE 
		IDArticle = @IDArticle
END
GO

CREATE PROCEDURE selectArticles
AS 
BEGIN 
	SELECT * FROM Article
END
GO