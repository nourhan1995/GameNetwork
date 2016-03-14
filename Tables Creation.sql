--CREATE DATABASE MrRobot 

CREATE TABLE Members( 
email VARCHAR(50) PRIMARY KEY,
pass VARCHAR(15) NOT NULL,
prefered_game_genre VARCHAR(15) NOT NULL
)

CREATE TABLE Normal_Users(
email VARCHAR(50) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth datetime NOT NULL,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(date_of_birth)),
FOREIGN KEY (email) references Members ON DELETE CASCADE ON UPDATE CASCADE
)

/*relation */
CREATE TABLE Normal_Users_add_friends_Normal_Users(
PRIMARY KEY (email1, email2),
email1 VARCHAR(50),
email2 VARCHAR(50),
accept bit DEFAULT 0,
FOREIGN KEY (email1) references Normal_Users ,
FOREIGN KEY (email2) references Normal_Users
)

/*relation */
CREATE TABLE Normal_Users_Messages_Normal_Users(
PRIMARY KEY(message_ID, sender, receiver),
message_ID int IDENTITY,
sender VARCHAR(50),
receiver VARCHAR(50),
date_of_msg datetime ,
content text,
FOREIGN KEY (sender) references Normal_Users,
FOREIGN KEY (receiver) references Normal_Users 
)

CREATE TABLE Development_Teams(
email VARCHAR(50) PRIMARY KEY,
team_name VARCHAR(50) NOT NULL,
company VARCHAR(50),
formation_date datetime NOT NULL,
verified bit DEFAULT 0,
FOREIGN KEY (email) references Members ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Verified_Reviewers(
email VARCHAR(50) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
years_of_experience int NOT NULL,
verified bit DEFAULT 0,
FOREIGN KEY (email) references Members ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Communities(
theme int  IDENTITY PRIMARY KEY,
name  VARCHAR(50) NOT NULL,
describe TEXT NOT NULL
)

/*relation */
CREATE TABLE Communities_Create_Normal_Users(
theme int PRIMARY KEY,
normal_usr_ID VARCHAR(50),
accept bit  DEFAULT 0 NOT NULL,
FOREIGN KEY (theme) references Communities ,
FOREIGN KEY (normal_usr_ID) references Normal_Users , 
)

/*relation */
CREATE TABLE Communities_Join_Members(
PRIMARY KEY (theme, member_ID), 
theme int,
member_ID VARCHAR(50),
FOREIGN KEY (theme) references Communities,
FOREIGN KEY (member_ID) references Members
)
CREATE TABLE Topics(
topic_ID int IDENTITY PRIMARY KEY,
theme int,
title VARCHAR(50) NOT NULL,
describe text NOT NULL,
member_ID VARCHAR(50),
FOREIGN KEY (theme) references Communities ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (member_ID) references Members 
)
CREATE TABLE Topic_Comments(
comment_ID int IDENTITY PRIMARY KEY,
topic_ID int,
content text NOT NULL,
date_of_comment datetime NOT NULL,
member_ID VARCHAR(50),
FOREIGN KEY (topic_ID) references Topics,
FOREIGN KEY (member_ID) references Members 
)

CREATE TABLE Conferences(
conference_ID int PRIMARY KEY IDENTITY,
name VARCHAR(50) NOT NULL,
venue VARCHAR(50) NOT NULL,
date_start datetime NOT NULL,
date_end datetime NOT NULL,
duration AS (DAY(date_end - date_start))
)

CREATE TABLE Conference_Reviews(
conference_review_ID int IDENTITY PRIMARY KEY,
conference_ID int,
email VARCHAR(50),
content text ,
date_of_conf_review datetime NOT NULL,
FOREIGN KEY (conference_ID) references Conferences ,
FOREIGN KEY (email) references Members 
)

CREATE TABLE Conference_Review_Comments(
conference_review_comment_ID int IDENTITY PRIMARY KEY,
conference_review_ID int,
content text,
email VARCHAR(50),
FOREIGN KEY (conference_review_ID) references Conference_Reviews,
FOREIGN KEY (email) references Members 
)

/*relation*/
CREATE TABLE Conferences_Attend_Members(
PRIMARY KEY (email, conference_ID),
email VARCHAR(50),
conference_ID int ,
FOREIGN KEY (email) references Members ,
FOREIGN KEY (conference_ID) references Conferences 
)

CREATE  TABLE Games(
game_ID int IDENTITY PRIMARY KEY,
name VARCHAR(50) NOT NULL,
release_date datetime NOT NULL,
age_limit int NOT NULL,
development_team_email VARCHAR(50),
release_conference int,
FOREIGN KEY (development_team_email) references Development_Teams ,
FOREIGN KEY (release_conference) references Conferences 
)

CREATE TABLE Game_Reviews(
game_review_ID int IDENTITY PRIMARY KEY,
game int,
verified_reviewer VARCHAR(50),
date_of_game_review datetime NOT NULL,
content text,
FOREIGN KEY (game) references Games,
FOREIGN KEY (verified_reviewer) references Verified_Reviewers 
)

CREATE TABLE Game_Review_Comments(
comment_ID int IDENTITY PRIMARY KEY,
game_review int,
member VARCHAR(50),
content text,
FOREIGN KEY (game_review) references Game_Reviews,
FOREIGN KEY (member) references Members
)

CREATE TABLE Screenshots(
PRIMARY KEY(screen_shot_ID, game_ID),
screen_shot_ID int IDENTITY,
game_ID int,
describe VARCHAR(50),
date_of_screenshot datetime,
FOREIGN KEY (game_ID) references Games 
)

CREATE TABLE Videos(
PRIMARY KEY(video_ID, game_ID),
video_ID int IDENTITY,
game_ID int,
describe VARCHAR(50),
date_of_video datetime,
FOREIGN KEY (game_ID) references Games 
)

CREATE TABLE Strategy_Games(
game int  PRIMARY KEY,
real_time bit NOT NULL,
FOREIGN KEY (game) references Games ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Action_Games(
game int PRIMARY KEY,
sub_genre VARCHAR(15) NOT NULL,
FOREIGN KEY (game) references Games ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Sport_Games(
game int PRIMARY KEY,
s_type VARCHAR(15) NOT NULL,
FOREIGN KEY (game) references Games ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE RPG_Games(
game int PRIMARY KEY,
story_line bit NOT NULL,
PVP bit NOT NULL,
FOREIGN KEY (game) references Games ON DELETE CASCADE ON UPDATE CASCADE
)

/*relation*/
CREATE TABLE Games_Rate_Members(
PRIMARY KEY (rate_ID,game),
rate_ID int IDENTITY,
game int,
member_email VARCHAR(50),
graphics int,
level_design int,
interactivity int,
uniqueness int,
FOREIGN KEY (game) references Games,
FOREIGN KEY (member_email) references Members 
)

/*realtion*/
CREATE TABLE Conferences_Present_Development_Teams_Games(
PRIMARY KEY(conference_ID, game_ID),
conference_ID int,
game_ID int,
development_team_ID VARCHAR(50),
FOREIGN KEY (conference_ID) references Conferences ,
FOREIGN KEY (game_ID) references Games,
FOREIGN KEY (development_team_ID) references Development_Teams 
)

/*relation*/
CREATE TABLE Games_Recommended_Normal_Users_Normal_Users(
PRIMARY KEY (normal_user1, normal_user2, game_ID),
normal_user1 VARCHAR(50),
normal_user2 VARCHAR(50),
game_ID int,
FOREIGN KEY (normal_user1) references Normal_Users ,
FOREIGN KEY (normal_user2) references Normal_Users,
FOREIGN KEY (game_ID) references Games 
)

