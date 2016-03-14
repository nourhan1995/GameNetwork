
EXEC SignUP 'mahaelleci@gmail.com','Maha','Sport' 

/*if type output is normal user/verified reviewer/development team one the following will be excuted (handeled later)*/
EXEC SignUpAsNU 'mahaelleci@gmail.com','Maha','Ehab','1995-05-16' 
EXEC SignUpAsVR 'ahmadkhaled@gmail.com','Ahmad','Khaled',5 
EXEC SignUpAsDT 'theteam@gmail.com','The Team','Intel','2015/06/09'  

DECLARE @check bit /*the value of check variable is 1 if no matching results was found*/
EXEC Search 'shit' , @check OUTPUT PRINT @check 

EXEC Rate 3,'Maha@gmail.com',1,3,4,0   

DECLARE @rate int
EXEC GetRate 3, @rate OUTPUT PRINT @rate  

/*there are some games in the Games table which is not categorized as a certain game type (strategy,action,sport,rpg)
the result of such games will give details for games standard attributes (name,developer,agelimit..)*/ 
DECLARE @checker bit --checker bit gives 1 if the user enteretd a game id with no matching results 
EXEC View_Game_Details 90, @checker OUTPUT PRINT @checker --game 90 include all required data but not all games does

EXEC GetReviews 4,'Ma_ha@hotmail.com' --ordered by years of experience descedingly 

EXEC UpdateVR 'Ahmad' , 'Khaled' , 'ahmadkhaled@gmail.com',4  

EXEC GetTopReviews 'ahmadkhaled@gmail.com'  

EXEC AddReview 'ahmadkhaled@gmail.com',5,'Great game!' /*this will only give a result if the admin verified the account*/  

EXEC DeleteTopic 4,'Rima@hotmail.com'

EXEC DeleteTopic 3,'maha@gmail.com'  ----

EXEC AddCommentOnCR 'maha@gmail.com',3,'GREAT CONFERENCE' 

EXEC AddCommentOnGR 'maha@gmail.com',7,'Very good Game review!'  

EXEC AddCommentOnCT 'NH@hotmail.com',1,'loved this Topic!','2/5/2009'   

EXEC View_comments_oF_a_conf_rev 3

EXEC View_comments_of_a_game_review 12 

EXEC View_topic_comments 'NH@hotmail.com',6 

EXEC Delete_my_conf_rev_comment 'Rana@hotmail.com',10 

EXEC Delete_my_game_rev_comment 'ahmadkhaled@gmail.com',2 

EXEC Delete_my_topic_rev_comment 'NH@hotmail.com',8,8 

EXEC Select_top_5_attended_conferences 'Ghada_Hossam@hotmail.com'

EXEC Select_top_10_recommended_games 'Raya@hotmail.com' /*the procedure requires the top 10 however no enough data inserted
                                                        so the result is top 4 however the logic is correct*/
EXEC View_Conference_details 4

EXEC Add_conference_to_attended_conferences 'NH@hotmail.com',12   

DECLARE @c bit
EXEC Add_attended_conference_confReview 'Nourhan@hotmail.com',3,'awesome','4/5/2015' , @c OUTPUT PRINT @c

EXEC Delete_Conference_Review 'Maha@gmail.com',4

EXEC Join_Community 'ana@yahoo.com',1 
 
EXEC View_Community_I_joined 'Maha@gmail.com',5 

EXEC Add_Topic 'homa@yahoo.com',1,'Topic of the day','Lilac wine is sweet and heady'  

EXEC Update_development_teams 'theteam@hotmail.com','The Team','10/3/10','Apple' 

DECLARE @checking bit /*if the development team was not verified or does no exist in the table checke bit is set to 1*/
EXEC Add_Game 'Raya@hotmail.com', 'New Game', '9/9/2008',18,9 , @checker OUTPUT PRINT @checking 

EXEC Add_Screen_Shots 'Raya@hotmail.com','woow','8/8/2015','Cool game scene'

EXEC Add_videos 'Tia_Ibrahem@hotmail.com', 'xoxo','6/9/2015', 'Video of the game'

EXEC adding_a_presented_game 'Nadin_Hossam@hotmail.com', 'omg', 'Done','6/3/2003'




