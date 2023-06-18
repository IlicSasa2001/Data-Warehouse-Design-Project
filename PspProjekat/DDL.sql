if object_id ('European_soccer.Fact_table','U') is not null
	drop table European_soccer.Fact_table;
go
if object_id('European_soccer.SEQ_fact_id','SO') is not null
	drop sequence European_soccer.SEQ_fact_id;
go
if object_id ('European_soccer.League','U') is not null
	drop table European_soccer.League;
go
if object_id('European_soccer.SEQ_league_id','SO') is not null
	drop sequence European_soccer.SEQ_league_id;
go
if object_id ('European_soccer.Country','U') is not null
	drop table European_soccer.Country;
go
if object_id('European_soccer.SEQ_country_id','SO') is not null
	drop sequence European_soccer.SEQ_country_id;
go
if object_id ('European_soccer.Home_Team','U') is not null
	drop table European_soccer.Home_Team;
go
if object_id('European_soccer.SEQ_home_team_id','SO') is not null
	drop sequence European_soccer.SEQ_home_team_id;
go
if object_id ('European_soccer.Away_Team','U') is not null
	drop table European_soccer.Away_Team;
go
if object_id('European_soccer.SEQ_away_team_id','SO') is not null
	drop sequence European_soccer.SEQ_away_team_id;
go
if object_id ('European_soccer.Home_Team_Attributes','U') is not null
	drop table European_soccer.Home_Team_Attributes;
go
if object_id('European_soccer.SEQ_home_team_attributes_id','SO') is not null
	drop sequence European_soccer.SEQ_home_team_attributes_id;
go
if object_id ('European_soccer.Away_Team_Attributes','U') is not null
	drop table European_soccer.Away_Team_Attributes;
go
if object_id('European_soccer.SEQ_away_team_attributes_id','SO') is not null
	drop sequence European_soccer.SEQ_away_team_attributes_id;
go
if object_id ('European_soccer.Season','U') is not null
	drop table European_soccer.Season;
go
if object_id('European_soccer.SEQ_season_id','SO') is not null
	drop sequence European_soccer.SEQ_season_id;
go
if object_id ('European_soccer.Date_dimension','U') is not null
drop table European_soccer.Date_dimension;
go
if schema_id ('European_soccer') is not null
	drop schema European_soccer;
go
create schema European_soccer;
go
create sequence European_soccer.SEQ_fact_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_league_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_country_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_home_team_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_away_team_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_home_team_attributes_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_away_team_attributes_id as int
start with 1
increment by 1
no cycle
go
create sequence European_soccer.SEQ_season_id as int
start with 1
increment by 1
no cycle
go
create table European_soccer.League(
	league_id int not null constraint DFT_League_league_id default(next value for European_soccer.SEQ_league_id),
	league_nid int,
	league_name varchar(100) not null,
	league_abbreviation varchar(4) not null,
	number_of_teams int not null,
	most_successful_team varchar(50),
	founded int,


	constraint PK_League primary key (league_id),
	constraint UQ_League_league_nid unique (league_nid),
	constraint UQ_League_league_name unique (league_nid)
)
create table European_soccer.Country(
	country_id int not null constraint DFT_Country_country_id default(next value for European_soccer.SEQ_country_id),
	country_nid int,
	country_name varchar(50) not null,
	country_abbreviation varchar(5) not null,
	capital varchar(50) not null,
	country_population int,
	continent varchar(30),
	area decimal(20,2)

	constraint PK_Country primary key (country_id),
	constraint UQ_League_country_nid unique (country_nid),
	constraint UQ_League_country_name unique (country_name)
)
create table European_soccer.Season(
	season_id int not null constraint DFT_Season_season_id default(next value for European_soccer.SEQ_season_id),
	period varchar(10) not null,

	constraint PK_Season primary key (season_id)
)
create table European_soccer.Home_Team(
	home_team_id int not null constraint DFT_Home_Team_home_team_id default(next value for European_soccer.SEQ_home_team_id),
	home_team_nid int not null,
	team_long_name varchar(50),
	team_short_name varchar(10),

	constraint PK_Home_Team primary key (home_team_id)
)
create table European_soccer.Away_Team(
	away_team_id int not null constraint DFT_Away_Team_away_team_id default(next value for European_soccer.SEQ_away_team_id),
	away_team_nid int not null,
	team_long_name varchar(50),
	team_short_name varchar(10),

	constraint PK_Away_Team primary key (away_team_id)

)
create table European_Soccer.Home_Team_Attributes(
	home_team_attributes_id int not null constraint DFT_Home_Team_Attributes_id default(next value for European_soccer.SEQ_home_team_attributes_id),
	home_team_attributes_nid int not null,
	buildUpPlaySpeed int,
	buildUpPlayDribbling varchar(10),
	buildUpPlayPassing int,
	chanceCreationShooting int,
	chanceCreationPassing int,
	chanceCreationCrossure int,
	defencePressure int,
	defenceAggresion int,
	date datetime


	constraint PK_Home_Team_Attributes primary key (home_team_attributes_id)
)
create table European_Soccer.Away_Team_Attributes(
	away_team_attributes_id int not null constraint DFT_Away_Team_Attributes_id default(next value for European_soccer.SEQ_away_team_attributes_id),
	away_team_attributes_nid int not null,
	buildUpPlaySpeed int,
	buildUpPlayDribbling int,
	buildUpPlayPassing int,
	chanceCreationShooting int,
	chanceCreationPassing int,
	chanceCreationCrossure int,
	defencePressure int,
	defenceAggresion int,
	date datetime

	constraint PK_Away_Team_Attributes primary key (away_team_attributes_id)

)
create table European_soccer.Fact_table(
	fact_id int not null constraint DFT_Fact_table_fact_id default(next value for European_soccer.SEQ_fact_id),
	country_id int,
	league_id int,
	home_team_id int,
	away_team_id int,
	home_team_attributtes_id int,
	away_team_attributtes_id int,
	season_id int,
	date_id int,
	stage int,
	home_team_gol int,
	away_team_gol int,
	total_goals int,
	cards int,
	corners int,
	total_fouls int,
	shots_on_target int,
	shots_off_target int

	constraint PK_Fact_table primary key (fact_id),
	constraint FK_Fact_table_country_id foreign key (country_id) references European_soccer.Country (country_id),
	constraint FK_Fact_table_league_id foreign key (league_id) references European_soccer.League(league_id),
	constraint FK_Fact_table_home_team_id foreign key (home_team_id) references European_soccer.Home_Team(home_team_id),
	constraint FK_Fact_table_away_team_id foreign key (away_team_id) references European_soccer.Away_Team(away_team_id),
	constraint FK_Fact_table_season_id foreign key (season_id) references European_soccer.Season(season_id),
	constraint FK_Fact_table_home_team_attributes_id foreign key (home_team_attributtes_id) references European_soccer.Home_Team_Attributes(home_team_attributes_id),
	constraint FK_Fact_table_away_team_attributes_id foreign key (away_team_attributtes_id) references European_soccer.Away_Team_Attributes(away_team_attributes_id),
	constraint FK_Fact_table_date_id foreign key (date_id) references European_soccer.Date_dimension (DateKey),
)

