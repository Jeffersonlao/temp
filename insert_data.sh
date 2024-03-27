#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
Teams_ADDCOLUMN=$($PSQL "ALTER TABLE teams ADD COLUMN team_id SERIAL PRIMARY KEY, ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL")
Games_ADDCOLUMN=$($PSQL "ALTER TABLE games ADD COLUMN game_id SERIAL PRIMARY KEY, ADD COLUMN year INT NOT NULL, ADD COLUMN round VARCHAR(30) NOT NULL,
ADD COLUMN winner_id INT NOT NULL, ADD COLUMN  opponent_id INT NOT NULL, ADD COLUMN winner_goals INT NOT NULL, ADD COLUMN opponent_goals INT NOT NULL")
ADD_FK=$($PSQL "ALTER TABLE games ADD FOREIGN KEY (winner_id) REFERENCES teams(team_id)")
ADD_FK2=$($PSQL "ALTER TABLE games ADD FOREIGN KEY (opponent_id) REFERENCES teams(team_id)")

cat games.csv | while IFS="," read years rounds winners opponents win_goals opp_goals
do
   
  if [[ $years =~ ^[0-9]+$ ]]
    then
       W_ID=$($PSQL "select team_id from teams where name='$winners'")
	    if [[ -z $W_ID ]]
	      then
	     W_ID=$($PSQL "insert into teams(name) values('$winners')")
	     W_ID=$($PSQL "select team_id from teams where name='$winners'")
	   fi
		
    L_ID=$($PSQL "select team_id from teams where name='$opponents'")
	    if [[ -z $L_ID ]]
	      then
	      L_ID=$($PSQL "insert into teams(name) values('$opponents')")
	      L_ID=$($PSQL "select team_id from teams where name='$opponents'")
	    fi
	
  	INSERT_DATA=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($years, '$rounds', $W_ID, $L_ID, $win_goals, $opp_goals)")
	fi	
	
done