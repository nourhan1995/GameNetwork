# GameNetwork

#Project Description

Nowadays, the gaming world is attracting more people with its vast growth. Social networks are currently
used as a method to know what are the latest updates of the gaming world through exchanging news
about the gaming conferences frequently held. These conferences provide the chance for gamers to meet
up with each other as well as the development teams behind the games in the market. Such networks
enable the users to choose which games, based on others reviews and recommendations, are compatible
with their interests. Moreover, they can share their feedback about different gaming conferences that they
have attended. In addition, it helps cultivating the gaming communities to discuss the novelties within
the gaming world.

This project builds upon the ongoing success of the gaming world and various reviewing and recommen-
dation systems. You are required to implement a robust system based on a well designed database that
stores interactions between its different users in addition to the different types of ratings and assessments
the users provide about the different games. The system has to satisfy the specifications described below.

#Project Specifications
The network differentiates between different types of members: normal user, verified reviewer, and deve-
lopment team. All members join the network by signing up for accounts using their emails. The system
keeps track of the email, password and preferred game genre for each member. For normal users, the
system keeps track of their first name, last name, date of birth and age. The information stored for the
development team include the team name, the company they work for (if any), and the team formation
date. As for the verified reviewer, the system keeps track of their first name, last name and years of expe-
rience. For the development team and verified reviewers, their accounts have to be verified by the system
administrator before they can proceed with joining the network. A system administrator is responsible
for maintaining and accessing the system including the system’s backend, and is not considered as any
of the member types. Normal users could add other normal users as friends on the system. A friendship
is confirmed if and only if the added person accepts the friend request. Friends can send a thread of
messages to each other.

Games are developed by development teams and have different genres: Strategy, Action, Sport, and Role
Playing Games (RPGs). Each game is defined by its name, release date, age limit (PG), and a rating. A
game should also include screen-shots and videos of the gameplay. Sports games are defined by the type
of the sport. Action games are defined by their sub-genre, for example: first-person shooter genre, third-
person shooter, etc.. . Strategy games can either be real-time 1 or not. RPGs can have a storyline and can
allow a Player vs. Player (PvP) option. A game can be rated by any member on the network based on
the following criteria: graphics, interactivity, uniqueness, and level design. Members of the network can
add a comment on a game review written by a verified reviewer. Normal users can recommend games to
each other.

Games are debuted and released at one of the yearly-held gaming conferences. Such conferences are
held to connect gamers and developers together. The network should keep track of the different gaming
conferences including their names, start date, end date, duration and venue. In general, members of thenetwork can attend these conferences, add conference reviews or comment on a conference review. A
development team can have the opportunity to present their game at a conference.

A community is a group for discussing any gaming-related topics. normal users can request for creating a
specific community given a name and a description of it. The request is sent to the system administrator
whom in turn replies with acceptance or rejection. A request to form a community can be rejected in case
of having an already existing community with the same theme. In case of acceptance, the community is
created and any member of the network can join the community. Any member can join a community on
the network. Only members of a community can post topics and comment on different topics posted on
the community. A topic has a title and a descriptive text about the topic.
