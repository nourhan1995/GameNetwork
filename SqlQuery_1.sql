--DROP PROC NormalUser_RequestToCreateCommunity
CREATE FUNCTION Check_Normal_User(@email varchar(50))
RETURNS bit
BEGIN
DECLARE @return_value bit
IF(EXISTS(
SELECT *
FROM Normal_Users
WHERE @email = email))
SET @return_value = 1
ELSE
SET @return_value = 0
RETURN @return_value
END
GO

CREATE PROCEDURE View_All_Communities
AS
	SELECT theme, name, describe
	FROM Communities
GO

--12 allows a user to request to create a community given ther email and name and description of the community
ALTER PROC NormalUser_RequestToCreateCommunity
@email VARCHAR(50),
@name VARCHAR(15),
@description TEXT
AS
INSERT INTO Communities
VALUES(@name,@description)

DECLARE @theme int
SELECT @theme = c.theme
FROM Communities c
WHERE c.name = @name AND c.describe LIKE @description

INSERT INTO Communities_Create_Normal_Users(theme,normal_usr_ID,accept)
VALUES(@theme,@email,DEFAULT)
GO

CREATE PROC View_a_community
@theme int
AS
SELECT name, describe
FROM Communities
WHERE theme = @theme
GO

CREATE PROC Topics_of_a_community
@theme int
AS
SELECT topic_ID, title
FROM Topics
WHERE @theme = theme
GO

CREATE FUNCTION Check_member_of_community(@email varchar(50), @theme int)
RETURNS bit
BEGIN
DECLARE @return bit
IF(EXISTS(
SELECT *
FROM Communities_Join_Members
WHERE theme = @theme AND member_ID = @email))
SET @return = 1
ELSE
SET @return = 0
RETURN @return
END
GO

CREATE PROC View_Topic_Details
@topic_id int
AS
SELECT title, describe, member_ID
FROM Topics
WHERE topic_ID = @topic_id
GO

CREATE PROC View_Comments_Of_a_Topic
@topic_id int 
AS
SELECT comment_ID, content, date_of_comment, member_ID
FROM Topic_Comments
WHERE topic_ID = @topic_id
GO

CREATE FUNCTION Check_same_email(@useremail varchar(50), @authoremail varchar(50))
RETURNS BIT
BEGIN
DECLARE @returnValue bit
IF(@useremail = @authoremail)
SET @returnValue = 1
ELSE
SET @returnValue = 0
RETURN @returnValue
END
GO

CREATE FUNCTION Get_email(@comment_id int)
RETURNS varchar(50)
BEGIN
DECLARE @email varchar(50)
SELECT @email = member_ID
FROM Topic_Comments
WHERE comment_ID = @comment_id
RETURN @email
END
GO

 
/*15-this procedure allows a normal user to comment on a topic posted on a community that he already joined*/
      
ALTER PROC AddCommentOnCT 
@user_email varchar(50),
@topic_ID int,
@comment text
AS   
IF(EXISTS(
SELECT J.member_ID
FROM Communities_Join_Members J INNER JOIN Topics T ON J.theme=T.theme 
WHERE J.member_ID = @user_email))
BEGIN
--DECLARE @date datetime
--SET @date = NOW
INSERT INTO Topic_Comments VALUES (@topic_id,@comment,GETDATE(),@user_email) 
END
GO

CREATE FUNCTION check_type_of_member(@email varchar(50))
RETURNS int
BEGIN
DECLARE @type int
IF(EXISTS(
SELECT *
FROM Normal_Users
WHERE email = @email))
SET @type = 1
ELSE
BEGIN
IF(EXISTS(
SELECT *
FROM Verified_Reviewers
WHERE email = @email))
SET @type = 2
ELSE
BEGIN
IF(EXISTS(
SELECT *
FROM Development_Teams
WHERE email = @email))
SET @type = 3
ELSE
SET @type = -1
END
END
RETURN @type
END
GO

----- Maha's added procedures



CREATE PROC IfVR 
	   @email varchar(50),
	   @if int OUTPUT 
	   AS 
	   IF(EXISTS(SELECT Verified_Reviewers.email
	             FROM Verified_Reviewers 
				 WHERE Verified_Reviewers.email = @email AND Verified_Reviewers.verified=1)) 
				 begin
				 set @if=1
				 end 
go 

CREATE PROC IfNU
				 @email varchar(50),
				 @if int OUTPUT
				 AS
				 IF(EXISTS(SELECT *
				           FROM Normal_Users 
						   WHERE Normal_Users.email = @email)) 
						   begin
						   set @if=1
						   end 
go 

CREATE PROC getGameType 
@game_id int,
@type varchar(15) OUTPUT

AS 
IF(EXISTS(SELECT Games.game_ID 
          FROM   Games INNER JOIN Strategy_Games
		  ON Games.game_ID = Strategy_Games.game
		  WHERE Games.game_ID = @game_id)) 
 BEGIN 
 SET @type = 'Strategy Game'
 END  

 IF(EXISTS(SELECT Games.game_ID 
          FROM   Games INNER JOIN Action_Games
		  ON Games.game_ID = Action_Games.game
		  WHERE Games.game_ID = @game_id)) 
 BEGIN 
 SET @type = 'Action Game'
 END  
 
 IF(EXISTS(SELECT Games.game_ID 
          FROM   Games INNER JOIN Sport_Games
		  ON Games.game_ID = Sport_Games.game
		  WHERE Games.game_ID = @game_id))  
 BEGIN 
 SET @type = 'Sports Game' 
 END   

 IF(EXISTS(SELECT Games.game_ID 
          FROM   Games INNER JOIN RPG_Games
		  ON Games.game_ID = RPG_Games.game
		  WHERE Games.game_ID = @game_id))   
 BEGIN 
 SET @type = 'RPG Game' 
 END 
go 

CREATE PROC GetGameRev
@game_id int,  
@checker bit OUTPUT
AS 
IF(EXISTS(SELECT Game_Reviews.content
FROM Game_Reviews 
WHERE Game_Reviews.game = @game_id)) 
BEGIN
SELECT Game_Reviews.content AS 'Content', Game_Reviews.verified_reviewer AS 'Reviewer' , Game_Reviews.game_review_ID AS 'ID'
FROM Game_Reviews 
WHERE Game_Reviews.game = @game_id 
END 

ELSE  
set @checker=1 
go 

CREATE PROC GetComments 
 @game int,
 @rev int,
 @if int output
 AS 
 IF(EXISTS (SELECT *
            FROM Game_Reviews INNER JOIN Game_Review_Comments 
			ON Game_Reviews.game_review_ID = Game_Review_Comments.game_review
			WHERE Game_Reviews.game_review_ID =@rev AND Game_Reviews.game=@game))
			BEGIN  
			SELECT Game_Review_Comments.content , Game_Review_Comments.member , Game_Review_Comments.comment_ID
            FROM Game_Reviews INNER JOIN Game_Review_Comments 
			ON Game_Reviews.game_review_ID = Game_Review_Comments.game_review
			WHERE Game_Reviews.game_review_ID =@rev AND Game_Reviews.game=@game
			END 
 ELSE 
 SET @if =1 
go 

CREATE PROC gameisthere 
@game int,
@y int OUTPUT
AS
IF(NOT EXISTS(SELECT Games.game_ID 
              FROM Games 
			  WHERE Games.game_ID = @game)) 
			begin 
			set @y=1
			end 
go




------ Rana's procedures


CREATE PROC ViewConference
@conf_id int 
AS
SELECT c.name AS 'Conference Name', c.venue AS 'Venue', c.date_start AS 'Start Date', c.date_end AS 'End Date'
FROM Conferences c
WHERE c.conference_ID = @conf_id
GO

CREATE PROC ViewDevTeamGamesOFConf
@conf_id int
AS
SELECT d.team_name AS 'Team Name', g.name AS 'Game Name'
FROM Conferences_Present_Development_Teams_Games c, Games g, Development_Teams d
WHERE c.conference_ID = @conf_id AND d.email = c.development_team_ID AND g.game_ID = c.game_ID
ORDER BY d.team_name
GO


ALTER PROC GetReviews
@conf_id int
AS
SELECT cr.conference_review_ID AS 'Title'
FROM Conference_Reviews cr
WHERE cr.conference_ID = @conf_id
GO

CREATE PROC ViewReview
@review_id int
AS
SELECT cr.conference_review_ID AS 'Title', cr.email AS 'Member', cr.content AS 'Review', c.name AS 'Conf'
FROM Conference_Reviews cr, Conferences c
WHERE cr.conference_review_ID = @review_id AND cr.conference_ID = c.conference_ID
GO

CREATE PROC ViewReviewComments
@review_id int
AS
SELECT crc.email AS 'Member', crc.content AS 'Comment'
FROM Conference_Review_Comments crc
WHERE crc.conference_review_ID = @review_id
GO


CREATE PROC ViewAllConfs
AS
SELECT c.conference_ID AS 'ID',c.name AS 'Name'
FROM Conferences c
GO


CREATE PROC ReviewConference
@conf_id int,
@email VARCHAR(50),
@content TEXT,
@res VARCHAR(10) OUTPUT
AS
IF(EXISTS(SELECT *
          FROM Conferences_Attend_Members c
		  WHERE c.email = @email AND c.conference_ID = @conf_id))
BEGIN
DECLARE @time  DATETIME
SET @time = GETDATE()
SET @res = 'true'
INSERT INTO Conference_Reviews
VALUES(@conf_id,@email,@content,@time)
END
ELSE
SET @res = 'false'
GO

CREATE PROC ConfReviewComment
@review_id int,
@email VARCHAR(50),
@content TEXT
AS
INSERT INTO Conference_Review_Comments 
VALUES(@review_id,@content,@email)
GO

CREATE PROC DeleteCommentOnConfReview
@email varchar(50),
@conf_rev_comment int,
@response VARCHAR(20) OUTPUT
AS
IF(EXISTS(SELECT *
          FROM Conference_Review_Comments crc
		  WHERE crc.email = @email AND conference_review_comment_ID = @conf_rev_comment))
BEGIN
DELETE Conference_Review_Comments
WHERE email = @email AND conference_review_comment_ID = @conf_rev_comment
SET @response = 'true'
END
ELSE
SET @response = 'false'
GO



--EXEC ViewConference 1
--EXEC ViewDevTeamGamesOFConf 7
--EXEC GetReviews 8
--EXEC ViewReview 5
--EXEC ViewReviewComments 5
--EXEC ViewAllConfs
--EXEC Member_AttendConference "elbob@yahoo.com" , 7
--EXEC ConfReviewComment 7,"elbob@yahoo.com", "yoooo oh"

/**DECLARE @res VARCHAR(50)
EXEC DevelopmentTeam_AddConferencePresentedIn "Maha_Ehab@hotmail.com",'Punch',6, @res OUTPUT
PRINT @res
**/
/**
DECLARE @res VARCHAR(10)
EXEC ReviewConference 1,"Ghada_Hossam@hotmail.com", "awesome sauce", @res OUTPUT
PRINT @res
**/

CREATE PROC Member_AttendConference
@email varchar(50),
@conf_id int,
@msg VARCHAR(30) OUTPUT
AS
IF(NOT EXISTS(SELECT *
              FROM Conferences_Attend_Members c
			  WHERE c.conference_ID = @conf_id AND c.email = @email))
BEGIN
INSERT INTO Conferences_Attend_Members VALUES (@email, @conf_id)
SET @msg = 'true'
END
ELSE
SET @msg = 'false'
GO

CREATE PROC DevelopmentTeam_AddConferencePresentedIn
@email VARCHAR(50),
@game_name VARCHAR(50),
@conf_id int,
@response VARCHAR(50) OUTPUT
AS
IF(EXISTS(SELECT *
          FROM Games g
		  WHERE g.name = @game_name AND g.development_team_email = @email))
BEGIN
DECLARE @game_id int

SELECT @game_id = g.game_ID
FROM Games g
WHERE g.name = @game_name AND g.development_team_email = @email

INSERT INTO Conference_Development_Team_Presents_Game
VALUES(@conf_id, @game_id, @email)

UPDATE Games
SET Games.release_conference = @conf_id
WHERE Games.game_ID = @game_id

SET @response = 'Added correctly'
END
ELSE
  SET @response = 'Your team has not developped this game'
GO


-- added BY Nadin
CREATE FUNCTION exisFUNC  (@Email varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF( NOT EXISTS( 
           SELECT * 
           FROM Members 
           WHERE @Email = Email))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		GO
CREATE PROC request
@Email varchar (50)


 
AS 
            SELECT email1
           FROM Normal_Users_add_friends_Normal_Users
           WHERE @Email = email2 AND accept = 0   
            
    go    

	Create PROC FindNormal
@Email varchar (50),
@FirstName Varchar(50) output,
@lastName Varchar(50) output,
@B DateTime output,
@age int output

 
AS 
            SELECT first_name,last_name,date_of_birth,age
           FROM Normal_Users
           WHERE @Email = email 
		   go


CREATE FUNCTION exisFUNCN  (@Email varchar (50),@Password varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF( NOT EXISTS( 
           SELECT * 
           FROM Members 
           WHERE @Email = Email and @Password =pass ))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		go


	


	Create FUNCTION FindN  (@Email varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF( EXISTS( 
           SELECT * 
           FROM Normal_Users 
           WHERE @Email = Email))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		go

	create FUNCTION FindD  (@Email varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF(  EXISTS( 
           SELECT * 
           FROM Development_Teams 
           WHERE @Email = Email))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		go


	create FUNCTION Findv  (@Email varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF(  EXISTS( 
           SELECT * 
           FROM Verified_Reviewers 
           WHERE @Email = Email))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		go

		Create PROC FindDev
@Email varchar (50),
@TeamName Varchar(50) output,
@company Varchar(50) output,
@found DateTime output


 
AS 
            SELECT team_name,company,formation_date
           FROM Development_Teams
           WHERE @Email = email 
		   go

		   	Create PROC Findver
@Email varchar (50),
@FirstName Varchar(50) output,
@LastName Varchar(50) output,
@year int output


 
AS 
            SELECT first_name,last_name,years_of_experience
           FROM Verified_Reviewers
           WHERE @Email = email 
		   go



 CREATE FUNCTION FUNCN  (@Email varchar (50),@Password varchar (50))
RETURNS  BIT
BEGIN
DECLARE @checker bit 
    IF(  EXISTS( 
           SELECT * 
           FROM Members 
           WHERE @Email = Email and @Password =pass ))  
        SET @checker = 1 
		ELSE
		SET @checker = 0
		RETURN @checker
		END
		go

