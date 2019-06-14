string (string text) clearString;

string () ISOTimemillis = {
	local string padding;
    local string timeuse = strftime(0,"%Y-%m-%dT%H:%M:%S.");
    local float randmillis = rint((random()*1000*random()));
    if (randmillis < 10)
        padding = "00";
    else if (randmillis < 100)
        padding = "0";
    local string padded = strcat(padding, ftos(randmillis));
    timeuse = strcat(timeuse, padded);
    timeuse = strcat(timeuse, "Z");
   	return timeuse;
}

string (entity pl) getEntityNameOrLogin = {
	if (loginRequired)
		return pl.login;
	else
		return clearString(pl.netname);
}

void (string evt) logevent = {
	fputs(logfilehandle, evt);
}

void (entity player) LogEventPlayerStart = {
 	if (canLog == 0)
		return;

	local string event;
	event = sprintf(",\n{\"type\": \"playerStart\", \"player\": \"%s\", \"classtime\": %s, \"time\": %s, \"gameTimeStamp\": \"%s\"}", getEntityNameOrLogin(player), ftos(player.classtime), ftos(gametime), gametimestamp);
	logevent(event);
}

void () LogEventGameStart = {
	gametimestamp = ISOTimemillis();
 	if (canLog == 0)
		return;
	local string event;
	local entity player;
	local float numplayers;
	player = find (world, classname, "player");	

	while (player) 
	{
		numplayers++;
		player = find (player, classname, "player");
	}

	event = sprintf("{\"type\": \"gameStart\", \"map\": \"%s\", \"numPlayers\": %s, \"numTeams\": %s, \"time\": %s, \"demo\": \"%s\", \"gameTimeStamp\": \"%s\"}", mapname, ftos(numplayers), ftos(number_of_teams), ftos(gametime), cvar_string("serverdemo"), gametimestamp);
	logevent(event);
}

void (entity player, float previous, float next, float timeplayed) LogEventChangeClass = {
	if (canLog == 0)
		return;
	if (previous == 0) {
		return;
	}
	local string event;
	event = sprintf(",\n{\"type\": \"changeClass\", \"player\": \"%s\", \"previousClass\": %s, \"nextClass\": %s, \"team\": %s, \"timePlayed\": %s, \"time\": %s, \"gameTimeStamp\": \"%s\"}",
							getEntityNameOrLogin(player),
							ftos(previous),
							ftos(next),
							ftos(player.team_no),
							ftos(timeplayed),
							ftos(gametime),
							gametimestamp
							);
	logevent(event);
}

string (float code) GetWeaponName = {
	if (code == 1) {
		return "hook";
	}
	else if (code == 4) {
		return "medikit";
	}
	else if (code == 8) {
		return "spanner";
	}
	else if (code == 16) {
		return "axe";
	}
	else if (code == 32) {
		return "sniperrifle";
	}
	else if (code == 64) {
		return "autorifle";
	}
	else if (code == 128) {
		return "shotgun";
	}
	else if (code == 256) {
		return "supershotgun";
	}
	else if (code == 512) {
		return "nailgun";
	}
	else if (code == 1024) {
		return "supernailgun";
	}
	else if (code == 2048) {
		return "grenadelauncher";
	}
	else if (code == 4096) {
		return "flamethrower";
	}
	else if (code == 8192) {
		return "rocketlauncher";
	}
	else if (code == 16384) {
		return "incendiary";
	}
	else if (code == 32768) {
		return "assaultcannon";
	}
	else if (code == 65536) {
		return "lightning";
	}
	else if (code == 131072) {
		return "plasmagun";
	}
	else if (code == 262144) {
		return "tranquilizer";
	}
	else if (code == 524288) {
		return "railgun";
	}
	else if (code == 1048576) {
		return "tribolt";
	}
	else if (code == 2097152) {
		return "sniperrail";
	}
	else
		return "undefined";
}


void (entity attacker, entity target, entity inflictor, float damage) LogEventDamage = {
	if (canLog == 0)
		return;

	local string event;
	local string part1;
	local string part2;
	local string damageKind;
	local string attackername;
	local string targetname;
	local string inflictorId;

	attackername = getEntityNameOrLogin(attacker);
	targetname = getEntityNameOrLogin(target);
	if (attacker == target)
		damageKind = "self";
	else if (attacker.team_no == target.team_no)
		damageKind = "team";
	else
		damageKind = "enemy";

	
	if (inflictor.classname == "player") 
		inflictorId = GetWeaponName(attacker.current_weapon);
	else {
		inflictorId = inflictor.classname;
		if ((inflictor.classname == "spike") && (attacker.playerclass == 3)) {
			inflictorId = "nailgrenspike";
		}
		else if ((inflictor.classname == "spike") && (attacker.playerclass == 5)) {
			inflictorId = "superspike";
		}
		if (inflictorId == "worldspawn")
			attackername = "world";
		else if (inflictorId == "building_sentrygun") {
			attackername = getEntityNameOrLogin(attacker.real_owner);
			if (damageKind == "damageTeam")
				return;
		}
		else if ((inflictorId == "grenade") && (inflictor.grenadename != ""))
			inflictorId = inflictor.grenadename;
	}


	if (getEntityNameOrLogin(target) != "") {
		part1 = sprintf(",\n{\"type\": \"damage\", \"kind\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
						damageKind, 
						attackername, 
					   	ftos(attacker.playerclass), 
					   	ftos(attacker.team_no), 
					   	getEntityNameOrLogin(target), 
					   	ftos(target.playerclass), 
					   	ftos(target.team_no));
		part2 = sprintf("\"inflictor\": \"%s\", \"damage\": %s, \"time\": %s, \"gameTimeStamp\": \"%s\"}", 
						inflictorId,
						ftos(damage),
						ftos(gametime),
						gametimestamp
						);

		event = strcat(part1, part2);
		logevent(event);
	}
}

void (entity attacker, entity target, entity inflictor) LogEventKill = {
	if (canLog == 0)
		return;

	if ((target.classname != "player") && (target.classname != "building_sentrygun"))
		return;
	
	local string killKind;
	local string attackername;
	local string targetname;
	local string inflictorId;

	attackername = getEntityNameOrLogin(attacker);
	targetname = getEntityNameOrLogin(target);
	if (attacker == target)
		killKind = "self";
	else if (attacker.team_no == target.team_no)
		killKind = "team";
	else
		killKind = "enemy";

	if (inflictor.classname == "player") 
		inflictorId = GetWeaponName(attacker.current_weapon);
	else {
		inflictorId = inflictor.classname;
		if (inflictorId == "worldspawn")
			attackername = "world";
		else if (inflictorId == "building_sentrygun")
			attackername = getEntityNameOrLogin(attacker.real_owner);
		else if ((inflictorId == "grenade") && (inflictor.grenadename != ""))
			inflictorId = inflictor.grenadename;
	}


	local string event;
	local string part1;
	local string part2;

	part1 = sprintf(",\n{\"type\": \"kill\", \"kind\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
					killKind,
					attackername, 
				   	ftos(attacker.playerclass), 
				   	ftos(attacker.team_no), 
				   	targetname, 
				   	ftos(target.playerclass), 
				   	ftos(target.team_no));
	part2 = sprintf("\"inflictor\": \"%s\", \"time\": %s, \"gameTimeStamp\": \"%s\"}", 
					inflictorId,					
					ftos(gametime),
					gametimestamp
					);

	event = strcat(part1, part2);
	logevent(event);
}


void (entity player) LogEventGoal = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"goal\", \"attacker\": \"%s\", \"time\": %s, \"gameTimeStamp\": \"%s\"}", getEntityNameOrLogin(player), ftos(gametime), gametimestamp);
	logevent(event);
}

void (entity player) LogEventFumble = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"fumble\", \"attacker\": \"%s\", \"time\": %s, \"gameTimeStamp\": \"%s\"}", getEntityNameOrLogin(player), ftos(gametime), gametimestamp);
	logevent(event);
}

void (entity attacker) LogEventAttack = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"attack\", \"attacker\": \"%s\", \"inflictor\": \"%s\", \"time\": %s, \"gameTimeStamp\": \"%s\"}", getEntityNameOrLogin(attacker), GetWeaponName(attacker.current_weapon), ftos(gametime), gametimestamp);
	logevent(event);
}

void () LogEventGameEnd = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"gameEnd\", \"time\": %s, \"gameTimeStamp\": \"%s\"}", ftos(gametime), gametimestamp);
	logevent(event);
}

void () LogEventTeamScores = {
	local float win_score = 0;
	local float winning_team = 0;

	if (team1score > win_score) {
		win_score = team1score;
		winning_team = 1;
	}
	
	if (team2score > win_score) {
		win_score = team2score;
		winning_team = 2;
	}
	else if (team2score == win_score) {
		winning_team = 0;
	}


	if (team3score > win_score) {
		win_score = team3score;
		winning_team = 3;
	}
	else if (team3score == win_score) {
		winning_team = 0;
	}

	if (team4score > win_score) {
		win_score = team4score;
		winning_team = 4;
	}
	else if (team4score == win_score) {
		winning_team = 0;
	}

	local string teamscores;
	teamscores = sprintf("\"team1Score\": %s", ftos(team1score));
	if (number_of_teams > 1)
		teamscores = strcat(teamscores, sprintf(", \"team2Score\": %s", ftos(team2score)));
	if (number_of_teams > 2)
		teamscores = strcat(teamscores, sprintf(", \"team3Score\": %s", ftos(team3score)));
	if (number_of_teams > 3)
		teamscores = strcat(teamscores, sprintf(", \"team4Score\": %s", ftos(team4score)));

	local string teamnames;
	teamnames = sprintf("\"team1Name\": \"%s\"", GetTeamName(1));
	if (number_of_teams > 1)
		teamnames = strcat(teamnames, sprintf(", \"team2Name\": \"%s\"", GetTeamName(2)));
	if (number_of_teams > 2)
		teamnames = strcat(teamnames, sprintf(", \"team3Name\": \"%s\"", GetTeamName(3)));
	if (number_of_teams > 3)
		teamnames = strcat(teamnames, sprintf(", \"team4Name\": \"%s\"", GetTeamName(4)));

	local string event;
	event = sprintf(",\n{\"type\": \"teamScores\", %s, %s, \"winningTeam\": %s, \"time\": %s, \"gameTimeStamp\": \"%s\"}", teamscores, teamnames, ftos(winning_team), ftos(gametime), gametimestamp);
	logevent(event);
}