void () LogEventGameStart = {
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

	event = sprintf("{\"type\": \"gameStart\", \"numplayers\": %s, \"numteams\": %s, \"time\": %s, \"gametimestamp\": \"%s\"}", ftos(numplayers), ftos(number_of_teams), ftos(gametime), timemillis());
	logevent(event);
}

void (entity player, float previous, float next, float timeplayed) LogEventChangeClass = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"changeClass\", \"player\": \"%s\", \"previousClass\": %s, \"nextClass\": %s, \"timePlayed\": %s, \"time\": %s, \"gametimestamp\": \"%s\"}",
							player.netname,
							ftos(previous),
							ftos(next),
							ftos(timeplayed),
							ftos(gametime),
							timemillis()
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
	local string damageType;
	local string attackername;
	local string targetname;
	local string inflictorId;

	attackername = attacker.netname;
	targetname = target.netname;
	if (attacker == target)
		damageType = "damageSelf";
	else if (attacker.team_no == target.team_no)
		damageType = "damageTeam";
	else
		damageType = "damage";

	
	if (inflictor.classname == "player") 
		inflictorId = GetWeaponName(attacker.current_weapon);
	else {
		inflictorId = inflictor.classname;
		if (inflictorId == "worldspawn")
			attackername = "world";
		else if (inflictorId == "building_sentrygun")
			attackername = attacker.real_owner.netname;
		else if ((inflictorId == "grenade") && (inflictor.grenadename != ""))
			inflictorId = inflictor.grenadename;
	}


	if (target.netname != "") {
		part1 = sprintf(",\n{\"type\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
						damageType, 
						attackername, 
					   	ftos(attacker.playerclass), 
					   	ftos(attacker.team_no), 
					   	target.netname, 
					   	ftos(target.playerclass), 
					   	ftos(target.team_no));
		part2 = sprintf("\"inflictor\": \"%s\", \"damage\": %s, \"time\": %s, \"gametimestamp\": \"%s\"}", 
						inflictorId,
						ftos(damage),
						ftos(gametime),
						timemillis()
						);

		event = strcat(part1, part2);
		logevent(event);
	}
}

void (entity attacker, entity target, entity inflictor) LogEventKill = {
	if (canLog == 0)
		return;

	local string killType;
	local string attackername;
	local string targetname;
	local string inflictorId;

	attackername = attacker.netname;
	targetname = target.netname;
	if (attacker == target)
		killType = "killSelf";
	else if (attacker.team_no == target.team_no)
		killType = "killTeam";
	else
		killType = "kill";

	if (inflictor.classname == "player") 
		inflictorId = GetWeaponName(attacker.current_weapon);
	else {
		inflictorId = inflictor.classname;
		if (inflictorId == "worldspawn")
			attackername = "world";
		else if (inflictorId == "building_sentrygun")
			attackername = attacker.real_owner.netname;
		else if ((inflictorId == "grenade") && (inflictor.grenadename != ""))
			inflictorId = inflictor.grenadename;
	}


	local string event;
	local string part1;
	local string part2;

	part1 = sprintf(",\n{\"type\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
					killType, 
					attackername, 
				   	ftos(attacker.playerclass), 
				   	ftos(attacker.team_no), 
				   	targetname, 
				   	ftos(target.playerclass), 
				   	ftos(target.team_no));
	part2 = sprintf("\"inflictor\": \"%s\", \"time\": %s, \"gametimestamp\": \"%s\"}", 
					inflictorId,					
					ftos(gametime),
					timemillis()
					);

	event = strcat(part1, part2);
	logevent(event);
}


void (entity player) LogEventGoal = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"goal\", \"player\": \"%s\", \"time\": %s, \"gametimestamp\": \"%s\"}", player.netname, ftos(gametime), timemillis());
	logevent(event);
}

void (entity player) LogEventFumble = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"fumble\", \"player\": \"%s\", \"time\": %s, \"gametimestamp\": \"%s\"}", player.netname, ftos(gametime), timemillis());
	logevent(event);
}

void (entity attacker) LogEventAttack = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"attack\", \"player\": \"%s\", \"inflictor\": \"%s\", \"time\": %s, \"gametimestamp\": \"%s\"}", attacker.netname, GetWeaponName(attacker.current_weapon), ftos(gametime), timemillis());
	logevent(event);
}

void () LogEventGameEnd = {
	if (canLog == 0)
		return;
	local string event;
	event = sprintf(",\n{\"type\": \"gameEnd\", \"time\": %s, \"gametimestamp\": \"%s\"}", ftos(gametime), timemillis());
	logevent(event);
}