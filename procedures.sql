-- Members' procedures

/* 1- The following procedure allows any user to sign up on the gaming network providing his email
  the "type" that the user will provide redirects to one of the three following procedures*/
CREATE  PROC SignUp 
     @email varchar(50), 
     @password varchar(15),  
     @prefered_game_genre varchar(15)
AS 
      INSERT INTO Members VALUES( @email,@password,@prefered_game_genre)  

GO 

/*1-This procedure allows a normal user to sign up in the gaming network providing extra data*/ 

CREATE PROC SignUpAsNU  
   @email varchar(50),
   @first_name varchar(50),
   @last_name  varchar(50),
   @birth_date  datetime
AS
   INSERT INTO Normal_Users (email,first_name,last_name,date_of_birth) VALUES (@email,@first_name,@last_name,@birth_date) 
GO 

/*1-This procedure allows a verified reviewer to sign up in the gaming network providing extra data
  a verified user has a verified bit that is set initially = 0 until the administrator confirms varification to 1*/ 

CREATE PROC SignUpAsVR 
    @email varchar(50), 
    @first_name varchar(50),
    @last_name varchar(50), 
    @years_of_exp int 
AS 
INSERT INTO Verified_Reviewers
(email,first_name,last_name,years_of_experience) VALUES (@email,@first_name,@last_name,@years_of_exp)  
GO
 
/*1-This procedure allows a development team to sign up in the gaming network providing extra data*/ 

CREATE PROC SignUpAsDT
       @email varchar(50), 
       @team_name varchar(50), 
       @company varchar(50), 
       @formation_date datetime 
  AS

    INSERT INTO Development_Teams (email,team_name,company,formation_date) VALUES (@email,@team_name,@company,@formation_date)
 GO 

/*2-this procedure allows the user to search for any game,conference,community,development team by name 
  or verified user by his first name or first and last names*/ 

CREATE PROC Search 
        @input varchar(50),
        @checker bit OUTPUT
AS 
    IF(EXISTS( 
           SELECT * 
           FROM Games 
           WHERE @input = Games.name))  
           BEGIN 
           SELECT *
           FROM Games 
           WHERE @input = Games.name 
           END
   ELSE 
   IF(EXISTS( 
          SELECT *
          FROM Conferences 
          WHERE @input = Conferences.name)) 
           BEGIN
           SELECT *
           FROM Conferences 
           WHERE @input = Conferences.name
           END
   ELSE 
   IF(EXISTS(
           SELECT * 
           FROM Communities
           WHERE @input = Communities.name))
           BEGIN
           SELECT * 
           FROM Communities
           WHERE @input = Communities.name 
           END
  ELSE 
  IF(EXISTS(
           SELECT *
           FROM Verified_Reviewers
           WHERE 
@input = Verified_Reviewers.first_name 
OR  
@input LIKE Verified_Reviewers.first_name ))  
           BEGIN
           SELECT *
           FROM Verified_Reviewers
           WHERE 
           @input = Verified_Reviewers.first_name 
          OR  
          @input LIKE Verified_Reviewers.first_name 
END
ELSE
IF(EXISTS(
            SELECT *
            FROM Development_Teams
            WHERE @input=Development_Teams.team_name)) 
            BEGIN
            SELECT *
            FROM Development_Teams
            WHERE @input=Development_Teams.team_name 
            END
   ELSE 
        BEGIN
        SET @checker = 1 
        END 
GO

-- 3-Viewing games while showing its type
CREATE PROC View_Game_Details 
@game_id int, 
@checker bit OUTPUT
AS 
IF(EXISTS(SELECT *
          FROM Strategy_Games
          WHERE game = @game_id))
BEGIN 
SELECT G.name, G.release_date, G.age_limit, G.development_team_email, S.describe AS 'ScreenShot Describtion', V.describe AS 'Video Describtion', GR.content AS 'Review', SG.real_time
FROM Games G  LEFT OUTER JOIN Screenshots S ON G.game_ID= S.game_ID
	          LEFT OUTER JOIN Videos V ON G.game_ID= V.game_ID
	          LEFT OUTER JOIN Game_Reviews GR ON G.game_ID= GR.game 
			  INNER JOIN Strategy_Games SG ON G.game_ID= SG.game 
WHERE G.game_ID = @game_id
	          
END 
 
ELSE 


IF(EXISTS(SELECT *
          FROM Action_Games
          WHERE game = @game_id))
BEGIN
SELECT G.name, G.release_date, G.age_limit, G.development_team_email, S.describe AS 'ScreenShot Describtion', V.describe AS 'Video Describtion', GR.content AS 'Review', A.sub_genre
FROM Games G LEFT OUTER JOIN Screenshots S ON G.game_ID = S.game_ID
	         LEFT OUTER JOIN Videos V ON G.game_ID = V.game_ID
	         LEFT OUTER JOIN Game_Reviews GR ON G.game_ID = GR.game 
	         INNER JOIN Action_Games A ON G.game_ID= A.game 
WHERE G.game_ID = @game_id
END 

ELSE 


IF(EXISTS(SELECT *
          FROM Sport_Games
          WHERE game = @game_id))
BEGIN
SELECT G.name, G.release_date, G.age_limit, G.development_team_email,S.describe AS 'ScreenShot Describtion', V.describe AS 'Video Describtion', GR.content AS 'Review', SG.s_type
FROM Games G LEFT OUTER JOIN Screenshots S ON G.game_ID = S.game_ID
	         LEFT OUTER JOIN Videos V ON G.game_ID = V.game_ID
	         LEFT OUTER JOIN Game_Reviews GR ON G.game_ID = GR.game 
			 INNER JOIN Sport_Games SG ON G.game_ID=Sg.game 
WHERE G.game_ID = @game_id
	
END 

ELSE 


IF(EXISTS(SELECT *
          FROM RPG_Games
          WHERE game = @game_id))
BEGIN
SELECT G.name, G.release_date, G.age_limit, G.development_team_email,S.describe AS 'ScreenShot Describtion', V.describe AS 'Video Describtion', GR.content AS 'Review', RPG.story_line, RPG.PVP
FROM Games G LEFT OUTER JOIN Screenshots S ON G.game_ID = S.game_ID
	         LEFT OUTER JOIN Videos V ON G.game_ID = V.game_ID
	         LEFT OUTER JOIN Game_Reviews GR ON G.game_ID = GR.game 
			 INNER JOIN RPG_Games RPG ON G.game_ID= RPG.game 
WHERE G.game_ID = @game_id
	
END 

ELSE  

IF (EXISTS(SELECT *
           FROM Games
           WHERE Games.game_ID=@game_id)) 
BEGIN
SELECT G.game_ID,G.name,G.development_team_email,G.age_limit,G.release_date,G.release_conference
FROM Games G
WHERE G.game_ID = @game_id 
END 

ELSE 
  SET @checker=1
    
GO

/*4-this procedure allows the user to rate any game based on the three ratings categories providing the game's id*/ 

CREATE PROC Rate
        @game_id int, 
		@user_email varchar(50),
        @rating1 int, 
        @rating2 int,
        @rating3 int,
        @rating4 int
       
AS 
         
    INSERT INTO Games_Rate_Members (game,member_email,graphics,level_design,interactivity,uniqueness) VALUES (@game_id,@user_email,@rating1,@rating2,@rating3,@rating4) 
GO 

/*5-this procedure calculates the overall rate for any game providing its id*/ 

CREATE PROC GetRate   
		 @game_id int,     
         @rate int OUTPUT 
AS   
          DECLARE @rating1 int, @rating2 int, @rating3 int, @rating4 int  
          SELECT @rating1=R.graphics, @rating2=R.level_design, @rating3=R.interactivity, @rating4=R.uniqueness 
          FROM Games_Rate_Members R
		  WHERE R.game = @game_id
          
          SET @rate= (@rating1 + @rating2 + @rating3 + @rating4) / 4   
 
GO  
/*6-this procedure allows a user to view a list of reviews on the games that he has rated*/
CREATE PROC GetReviews
                    @game_id int,
                    @user_email varchar(50)
       AS       
            SELECT GR.content AS 'Reviews for this game :' ,VR.email AS 'Verified Reviewer', VR.years_of_experience AS 'Years of experience of the verified reviewer'
            FROM Game_Reviews GR INNER JOIN Games_Rate_Members RR ON GR.game= RR.game
                                 INNER JOIN Verified_Reviewers VR ON VR.email = GR.verified_reviewer
            WHERE GR.game = @game_id AND              
                  RR.member_email=@user_email
            ORDER BY VR.years_of_experience DESC
    
GO 

-- 7-View a conference, list of development teams who presented their games in that conference with their game names. Moreover, I should be able to view the list of games that were debuted in that
--conference, as well as the list of reviews on that conference.

CREATE PROC View_Conference_details
@conf_id int
AS
SELECT C.name AS 'Conference name', C.date_start, C.venue, CP.development_team_ID, G1.name AS 'Game Name', CR.conference_review_ID, CR.content
FROM Conferences C LEFT OUTER JOIN Conferences_Present_Development_Teams_Games CP ON C.conference_ID = CP.conference_ID
	LEFT OUTER JOIN Games G ON G.game_ID = CP.game_ID 
	LEFT OUTER JOIN Games G1 ON G1.release_conference = C.conference_ID
	LEFT OUTER JOIN Conference_Reviews CR ON C.conference_ID = CR.conference_ID 
WHERE C.conference_ID = @conf_id 
GO 

-- 8- Add a conference to my list of attended conferences
CREATE PROC Add_conference_to_attended_conferences
@email varchar(50),
@conf_id int
AS
INSERT INTO Conferences_Attend_Members VALUES (@email, @conf_id)
GO

-- 9-Add a conference review to a conference that I have attended
CREATE PROC Add_attended_conference_confReview
@email varchar(50),
@conf_id int,
@content text,
@date datetime, 
@checker bit OUTPUT
AS
IF(EXISTS(SELECT * 
          FROM Conferences_Attend_Members CAM
		  WHERE CAM.conference_ID=@conf_id AND CAM.email=@email))

BEGIN
INSERT INTO Conference_Reviews VALUES(@conf_id, @email, @content, @date)
END 
ELSE 
SET @checker=1
GO

-- 10- Delete a conference review that I have written
CREATE PROC Delete_Conference_Review
@email varchar(50),
@conf_review int
AS
DELETE FROM Conference_Reviews
WHERE email = @email AND @conf_review = conference_review_ID
GO

-- 11- Join a community
CREATE PROC Join_Community
@email varchar(50),
@community_id int
AS 
INSERT INTO Communities_Join_Members VALUES (@community_id, @email)
GO

-- 12-View a community that I have joined and preview its name, description and list of members of that
--community. Also I should be able to view the list of topics posted on that community.
CREATE PROC View_Community_I_joined
@email varchar(50),
@community_id int
AS
IF(EXISTS(SELECT *
          FROM Communities_Join_Members
          WHERE member_ID = @email AND theme = @community_id))
BEGIN
SELECT C.name, C.describe, CM.member_ID, T.topic_ID AS 'Topic ID' , T.describe AS 'Topic describtion'
FROM Communities C INNER JOIN Communities_Join_Members CM ON C.theme = CM.theme
	               LEFT OUTER JOIN Topics T ON T.theme = C.theme
WHERE C.theme = @community_id
END
GO

-- 13-Post a topic on a community that I have joined. I should be able to provide a title and a descriptive
--text for the topic.
CREATE PROC Add_Topic
@email varchar(50),
@community_id int,
@title varchar(50),
@description text
AS
IF(EXISTS(SELECT *
          FROM Communities_Join_Members
          WHERE member_ID = @email AND theme = @community_id))
BEGIN
INSERT INTO Topics VALUES (@community_id, @title, @description, @email)
END
GO

/*14-this procedure allows a normal user to delete a topic that he has posted on a community*/  

CREATE PROC DeleteTopic
  @topic_id int,
  @user_email varchar(50)
 AS
    DELETE FROM Topics
    WHERE Topics.topic_ID = @topic_id AND Topics.member_ID = @user_email  

	DELETE FROM Topic_Comments
	WHERE Topic_Comments.topic_ID=@topic_id AND Topic_Comments.member_ID=@user_email
  GO  
/*15-this procedure allows a normal user to add a comment on a confrence review providing its id*/
      CREATE PROC AddCommentOnCR 
      @user_email varchar(50), 
      @conf_id int,
      @comment text
     AS
       INSERT INTO Conference_Review_Comments VALUES (@conf_id,@comment,@user_email) 
  GO  
 
/*15-this procedure allows a normal user to add a comment on a game review providing its id*/ 

      CREATE PROC AddCommentOnGR
      @user_email varchar(50),
      @game_review_id int,
	  @text text
     AS
       INSERT INTO Game_Review_Comments VALUES (@game_review_id,@user_email, @text) 
  GO  
 
/*15-this procedure allows a normal user to comment on a topic posted on a community that he already joined*/
      
 CREATE PROC AddCommentOnCT 
      @user_email varchar(50),
      @topic_ID int,
      @comment text, 
	  @date datetime
     AS   
      IF(EXISTS(SELECT J.member_ID
                FROM Communities_Join_Members J INNER JOIN Topics T 
                ON J.theme=T.theme 
                WHERE J.member_ID = @user_email))
 
      BEGIN
      INSERT INTO Topic_Comments VALUES (@topic_id,@comment,@date,@user_email) 
      END 
	  GO

-- 16
-- View a list of a conference review comments and the users who commented
CREATE PROC View_comments_oF_a_conf_rev
@conf_rev_id int
AS
SELECT email AS 'User who commented', content AS 'Comment'
FROM Conference_Review_Comments
WHERE conference_review_ID = @conf_rev_id
GO 

--View a list of a game review comments
CREATE PROC View_comments_of_a_game_review
@game_rev_id int
AS
SELECT member AS 'User who commented', content As 'Comment'
FROM Game_Review_Comments
WHERE game_review = @game_rev_id
GO
-- View a list of a topic's comments I joined its community
CREATE PROC View_topic_comments
@email varchar(50),
@topic_id int
AS
IF(EXISTS(SELECT *
          FROM Communities_Join_Members C INNER JOIN Topics T ON C.theme = T.theme
          WHERE C.member_ID = @email AND T.topic_ID = @topic_id))
BEGIN
SELECT T.comment_ID As 'Topic ID', T.date_of_comment AS 'Date of post', T.member_ID As 'Member who commented' , T.content AS 'Comment'
FROM Topic_Comments T
WHERE T.topic_ID = @topic_id
END
GO

-- 17-
--Delete a comment that I have posted on a conference review
CREATE PROC Delete_my_conf_rev_comment
@email varchar(50),
@conf_rev_comment int
AS
DELETE Conference_Review_Comments
WHERE email = @email AND conference_review_comment_ID = @conf_rev_comment
GO
--Delete a comment that I have posted on a game review
CREATE PROC Delete_my_game_rev_comment
@email varchar(50),
@game_rev_comment int
AS
DELETE Game_Review_Comments
WHERE member = @email AND comment_ID = @game_rev_comment
GO
--Delete a comment that I have posted on a topic I joined its community
CREATE PROC Delete_my_topic_rev_comment
@email varchar(50),
@topic int, 
@comment_id int
AS
IF(EXISTS(SELECT * 
          FROM Communities_Join_Members C INNER JOIN Topics T ON C.theme = T.theme
          WHERE C.member_ID = @email AND T.topic_ID = @topic))
BEGIN
DELETE Topic_Comments
WHERE @comment_id = comment_ID AND @topic = topic_ID
END
GO

-- 18-Show top 5 members with the most attended conferences in common with me
CREATE PROC Select_top_5_attended_conferences
@email varchar(50)
AS
SELECT TOP 5 A2.email, COUNT(A2.conference_ID)
FROM Conferences_Attend_Members A1 INNER JOIN Conferences_Attend_Members A2 ON A1.conference_ID = A2.conference_ID
WHERE A1.email = @email AND A1.email <> A2.email
GROUP BY A2.email
ORDER BY COUNT(A2.conference_ID) DESC
GO

-- 19- Show top 10 game recommendations based on how many times they have been recommended by
--other members of the system. This should exclude games that I have rated or have already been
--recommended.
CREATE PROC Select_top_10_recommended_games
@email varchar(50)
AS
SELECT TOP 10 RC.game_ID, COUNT(RC.normal_user1) AS num
FROM Games_Recommended_Normal_Users_Normal_Users RC INNER JOIN Games_Rate_Members RA ON RC.game_ID = RA.game
WHERE RA.member_email <> @email AND RC.normal_user1 <> @email AND RC.normal_user2 <> @email
GROUP BY RC.game_ID
ORDER BY num DESC
GO

-- Development team procedures

-- Update their account's information
CREATE PROC Update_development_teams
@email varchar(50),
@name varchar(50),
@formation_date datetime,
@company varchar(50)
AS
UPDATE Development_Teams
SET team_name = @name, company = @company, formation_date = @formation_date
WHERE email = @email
go

--Adding a game of a development team developed to their list of developed games
CREATE PROC Add_Game
@email varchar(50),
@game_name varchar(50),
@release_date datetime,
@age_limit int,
@release_conference int,  
@checker bit OUTPUT 
AS
IF(EXISTS(SELECT email
          FROM Development_Teams
          WHERE email = @email AND verified=1))
BEGIN
INSERT INTO Games VALUES(@game_name, @release_date, @age_limit, @email, @release_conference) 
END 
ELSE 
SET @checker =1
go

--Adding a screenshot to a game
CREATE PROC Add_Screen_Shots
@email varchar(50),
@game_name varchar(50),
@date datetime,
@screenShot varchar(50)
AS
DECLARE @game_id int
SELECT @game_id = game_id
FROM Games
WHERE @game_name = name AND @email = development_team_email
INSERT INTO Screenshots VALUES (@game_id, @screenShot, @date)
go

--Adding a video to a game
CREATE PROC Add_videos
@email varchar(50),
@game_name varchar(50),
@date datetime,
@video varchar(50)
AS
DECLARE @game_id int
SELECT @game_id = game_id
FROM Games
WHERE @game_name = name AND @email = development_team_email
INSERT INTO Videos VALUES (@game_id, @video, @date)
go

-- Adding a game to a conference a development team attended
CREATE PROC adding_a_presented_game
@email varchar(50),
@game_name varchar(50),
@conference_name varchar(50),
@start_date datetime
AS
DECLARE @game_id int
DECLARE @conf_id int
SELECT @game_id = game_id
FROM Games
WHERE @game_name = name AND @email = development_team_email
SELECT @conf_id = conference_ID
FROM Conferences
WHERE name = @conference_name AND date_start = @start_date
INSERT INTO Conferences_Present_Development_Teams_Games VALUES (@conf_id, @game_id, @email)
GO

-- Adminstrators' Procedures

-- Viewing a list of creating community requests
CREATE PROC View_Community_Requests
AS
SELECT C.theme, C.name, C.describe
FROM Communities C
WHERE EXISTS(
SELECT *
FROM Communities_Create_Normal_Users C1
WHERE C1.theme = C.theme AND C1.accept = 0
)
GO

-- Accept a request for creating a community
CREATE PROC Accept_Community_Request
@community_id int
AS
UPDATE Communities_Create_Normal_Users
SET accept = 1
WHERE theme = @community_id
GO

-- Reject a request for creating a community
CREATE  PROC Reject_Community_Request
@community_id int
AS
DELETE Communities_Create_Normal_Users
WHERE theme = @community_id
DELETE Communities
WHERE theme = @community_id
GO

-- Verify verified reviewers
CREATE PROC Verify_Verified_Reviewers
@email varchar(50)
AS 
UPDATE Verified_Reviewers
SET verified = 1
WHERE email = @email
GO

-- Verify development teams
CREATE PROC Verify_Development_Teams
@email varchar(50)
AS
UPDATE Development_Teams
SET verified = 1
WHERE email = @email
GO

-- Create conference
CREATE PROC Create_Conference
@name varchar(50),
@date_start datetime,
@date_end datetime,
@venue varchar(50)
AS
INSERT INTO Conferences VALUES (@name, @venue, @date_start, @date_end)
GO

-- Create game
CREATE PROC Create_Game
@name varchar(50),
@release_date datetime,
@age_limit int
AS
INSERT INTO Games(name, release_date, age_limit) VALUES (@name, @release_date, @age_limit)
GO

-- Delete a Game
CREATE PROC Delete_Game
@game_id int
AS
DELETE Games
WHERE game_id = @game_id
GO

-- Delete a conference
CREATE PROC Delete_Conference
@conference_id int
AS
DELETE Conferences
WHERE conference_id = @conference_id
GO

-- Delete a community
CREATE PROC Delete_Community
@community_id int
AS
DELETE Communities
WHERE theme = @community_id
DELETE Communities_Create_Normal_Users
WHERE theme = @community_id
GO

-- verified reviewers Procedures
/*1-this procedure allows a verified reviewer to update his information*/
         CREATE PROC UpdateVR 
         @first_name varchar(50), 
         @last_name varchar(50),  
         @user_email varchar(50),
         @years_of_experience int
      AS 
         UPDATE Verified_Reviewers 
         SET first_name=@first_name , last_name=@last_name, years_of_experience=@years_of_experience 
         WHERE Verified_Reviewers.email = @user_email 
     
     GO  

	 /*2-this procedure allows a verified reviewer to add a review on a certain game*/  

       CREATE PROC AddReview
       @user_email varchar(50), 
       @game int,
       @review text 
     AS
       IF(EXISTS(SELECT Verified_Reviewers.email
                   FROM Verified_Reviewers 
                   WHERE Verified_Reviewers.email = @user_email AND Verified_Reviewers.verified=1)) 
       BEGIN 
       INSERT INTO Game_Reviews VALUES (@game,@user_email,CURRENT_TIMESTAMP,@review) 
       END 
    GO  

/*3-this procedure allows a verified reviewers to delete a review providing its id*/ 
   
       CREATE PROC DeleteReview
       @user_email varchar(50), 
       @review_id int,
       @game int 
     AS  
       IF(EXISTS(SELECT Verified_Reviewers.email
                   FROM Verified_Reviewers 
                   WHERE Verified_Reviewers.email = @user_email AND Verified_Reviewers.verified=1))  
       BEGIN 
       DELETE 
       FROM Game_Reviews 
       WHERE Game_Reviews.game_review_ID = @review_id AND Game_Reviews.verified_reviewer = @user_email
       END 
   GO  

   /*View my top 10 game reviews based on the number of comments on them*/ 

CREATE PROC GetTopReviews 
         @user_email varchar(50)
      AS
         IF(EXISTS(SELECT Verified_Reviewers.email
                   FROM Verified_Reviewers 
                   WHERE Verified_Reviewers.email = @user_email AND Verified_Reviewers.verified=1))
          
         BEGIN
         SELECT TOP 10   GR.game_review_ID AS Reviews,COUNT(RC.comment_ID) AS Comments
         FROM Game_Reviews GR INNER JOIN Game_Review_Comments RC ON GR.game_review_ID = RC.game_review
         WHERE GR.verified_reviewer = @user_email
         GROUP BY GR.game_review_ID ORDER BY Comments DESC
         END  
    GO  

	/**Normal Users Procedures**/

--1 updates normal user info given first name, last name, birth date and email
CREATE PROC NormalUser_UpdateInfo
@first_name VARCHAR(15),
@last_name VARCHAR(15),
@date_of_birth datetime,
@email VARCHAR(50)
AS
UPDATE Normal_Users
SET Normal_Users.first_name = @first_name, Normal_Users.last_name = @last_name, Normal_Users.date_of_birth = @date_of_birth
WHERE Normal_Users.email = @email
GO

--2 allows user to send a friend request to another normal user given both their emails
CREATE PROC NormalUser_SendFriendReq
@senderEmail VARCHAR(50),
@receiverEmail VARCHAR(50)
AS
IF 
(EXISTS (SELECT n.email
        FROM Normal_Users n
		WHERE n.email LIKE @receiverEmail)
AND
EXISTS (SELECT n.email
        FROM Normal_Users n
		WHERE n.email LIKE @senderEmail))
BEGIN
INSERT INTO Normal_Users_add_friends_Normal_Users
VALUES(@senderEmail, @receiverEmail,DEFAULT)
END
ELSE
   PRINT('User not found')
GO

--3 allows user to user to search the network for people they can add as friends given user's email
CREATE PROC NormalUser_SearchFriends
@email VARCHAR(50)
AS
SELECT n.email AS 'Email'
FROM Normal_Users n
WHERE n.email NOT LIKE @email
EXCEPT(
SELECT a.email2
FROM Normal_Users_add_friends_Normal_Users a
WHERE a.email1 LIKE @email
UNION	
SELECT a.email1
FROM Normal_Users_add_friends_Normal_Users a
WHERE a.email2 LIKE @email	)		  
GO

--4 allows user to view a list of pending friend requests given user's email
CREATE PROC NormalUser_ViewPendingReqs
@email VARCHAR(50)
AS
SELECT n.first_name AS 'First Name',n.last_name AS 'Last Name', a.email1 AS 'Sender Email'
FROM Normal_Users_add_friends_Normal_Users a, Normal_Users n
WHERE a.email2 = @email AND a.accept = 0 AND n.email = a.email1
GO

--5 allows user to either accept or reject a pending friend request given their email, the sender's email and an accept bit (0 to reject, 1 to accept)
CREATE PROC NormalUser_RespondToReq
@email VARCHAR(50),
@friendEmail VARCHAR(50),
@accept bit
AS
IF @accept = 0
   DELETE FROM Normal_Users_add_friends_Normal_Users WHERE Normal_Users_add_friends_Normal_Users.email1 = @friendEmail 
                                                          AND Normal_Users_add_friends_Normal_Users.email2 = @email
ELSE
   BEGIN
   UPDATE Normal_Users_add_friends_Normal_Users
   SET Normal_Users_add_friends_Normal_Users.accept = 1 WHERE Normal_Users_add_friends_Normal_Users.email1 = @friendEmail 
                                                             AND Normal_Users_add_friends_Normal_Users.email2 = @email
   END
GO

--6 allows user to view their friends' list providing email
CREATE PROC NormalUser_ViewFriends
@email VARCHAR(50)
AS
SELECT n.first_name AS 'First Name', n.last_name AS 'Last Name', n.email AS 'Email'
FROM Normal_Users_add_friends_Normal_Users a, Normal_Users n
WHERE  (n.email = a.email1 AND a.email2 = @email AND a.accept = 1) OR (n.email = a.email2 AND a.email1 = @email AND a.accept = 1)
GO

--7 allows user to view a friend's profile info providing user's email and their friend's email
CREATE PROC NormalUser_ViewFriendProfile
@email VARCHAR(50),
@friend VARCHAR(50)
AS
DECLARE @accept BIT
SELECT @accept = a.accept
FROM Normal_Users_add_friends_Normal_Users a
WHERE (a.email1 = @email AND a.email2 = @friend) OR (a.email1 = @friend AND a.email2 = @email)

IF @accept = 0 
   OR NOT EXISTS(
   SELECT n.email
   FROM Normal_Users n
   WHERE n.email LIKE @friend
   )
    PRINT('User not in your friend list')
ElSE
BEGIN
    SELECT n.first_name AS 'First Name', n.last_name AS 'Last Name', n.age AS 'Age'
    FROM Normal_Users n
    WHERE n.email = @friend

	SELECT c.name AS 'Conferences Attended'
	FROM Conferences_Attend_Members cm, Conferences c
	WHERE cm.conference_ID = c.conference_ID AND cm.email = @friend

	SELECT g.name AS 'Rated Games', gm.graphics AS 'Graphics Rating', gm.interactivity AS 'Interactivity Rating', gm.level_design AS 'Level Design Rating', gm.uniqueness AS 'Uniqueness Rating'
	FROM Games_Rate_Members gm, Games g
	WHERE gm.game = g.game_ID AND gm.member_email = @friend
END
GO

--8 lets user send messages to other users providing their email, their friend's email and the content of the message
CREATE PROC NormalUser_SendsReceivesMessage
@email VARCHAR(50),
@receiver VARCHAR(50),
@content VARCHAR(8000)
AS
DECLARE @time  DATETIME
SET @time = GETDATE()
IF EXISTS(SELECT n.email1
          FROM Normal_Users_add_friends_Normal_Users n
		  WHERE n.accept = 1 AND ((n.email1 = @email AND n.email2 = @receiver) OR (n.email1 = @receiver AND n.email2 = @email)))
BEGIN
    INSERT INTO Normal_Users_Messages_Normal_Users
    VALUES (@email, @receiver, @time, @content)
END
ELSE
   PRINT('User not in your friend list')
GO 

--9 allows user to view all messages sent and received by them providing their email
CREATE PROC NormalUser_ViewMessageThreads
@email VARCHAR(50)
AS
SELECT m.content AS 'Message', m.sender AS 'Sent By', m.receiver AS 'Received By', m.date_of_msg AS 'Date of Message'
FROM Normal_Users_Messages_Normal_Users m
WHERE m.sender = @email OR  m.receiver = @email
ORDER BY m.date_of_msg DESC
GO 

--10 allows a user to recommend a game to another user given their email, the other user's email and the name of the game
CREATE PROC NormalUser_RecommendsGame
@email VARCHAR(50),
@receiver VARCHAR(50),
@game VARCHAR(50)
AS
DECLARE @gameID int
SELECT @gameID = g.game_ID
FROM Games g
WHERE g.name = @game
INSERT INTO Games_Recommended_Normal_Users_Normal_Users
VALUES (@email, @receiver, @gameID)
GO

--11 allows user ot view a list of recommended games given their email
CREATE PROC NormalUser_ViewsRecommendedGames
@email VARCHAR(50)
AS
SELECT g.name AS 'Game'
FROM Games_Recommended_Normal_Users_Normal_Users r, Games g
WHERE g.game_ID = r.game_ID AND r.normal_user2 = @email 
GO

--12 allows a user to request to create a community given ther email and name and description of the community
CREATE PROC NormalUser_RequestToCreateCommunity
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

SET IDENTITY_INSERT Communities_Create_Normal_Users ON
INSERT INTO Communities_Create_Normal_Users(theme,normal_usr_ID,accept)
VALUES(@theme,@email,DEFAULT)
SET IDENTITY_INSERT Communities_Create_Normal_Users OFF
GO


--Drop all procs
/**DECLARE @name VARCHAR(128)
DECLARE @SQL VARCHAR(254)

SELECT @name = (SELECT TOP 1 [name] FROM sysobjects WHERE [type] = 'P' AND category = 0 ORDER BY [name])

WHILE @name is not null
BEGIN
    SELECT @SQL = 'DROP PROCEDURE [dbo].[' + RTRIM(@name) +']'
    EXEC (@SQL)
    PRINT 'Dropped Procedure: ' + @name
    SELECT @name = (SELECT TOP 1 [name] FROM sysobjects WHERE [type] = 'P' AND category = 0 AND [name] > @name ORDER BY [name])
END
GO **/
