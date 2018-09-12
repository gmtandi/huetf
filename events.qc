void (entity player, float previous, float next, float timeplayed) LogEventChangeClass = {

	local string event;
	event = sprintf("{\"type\": \"changeClass\", \"player\": \"%s\", \"previousClass\": %s, \"nextClass\": %s, \"timePlayed\": %s, \"time\": %s},\n",
							player.netname,
							ftos(previous),
							ftos(next),
							ftos(timeplayed),
							ftos(time)
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
}


void (entity attacker, entity target, entity inflictor, float damage) LogEventDamage = {
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
		part1 = sprintf("{\"type\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
						damageType, 
						attackername, 
					   	ftos(attacker.playerclass), 
					   	ftos(attacker.team_no), 
					   	target.netname, 
					   	ftos(target.playerclass), 
					   	ftos(target.team_no));
		part2 = sprintf("\"inflictor\": \"%s\", \"damage\": %s, \"time\": %s},\n", 
						inflictorId,
						ftos(damage),
						ftos(time));

		event = strcat(part1, part2);
		logevent(event);
	}
}

void (entity attacker, entity target, entity inflictor) LogEventKill = {

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

	part1 = sprintf("{\"type\": \"%s\", \"attacker\": \"%s\", \"attackerClass\": %s, \"attackerTeam\": %s, \"target\": \"%s\", \"targetClass\": %s, \"targetTeam\": %s, ",
					killType, 
					attackername, 
				   	ftos(attacker.playerclass), 
				   	ftos(attacker.team_no), 
				   	targetname, 
				   	ftos(target.playerclass), 
				   	ftos(target.team_no));
	part2 = sprintf("\"inflictor\": \"%s\", \"time\": %s},\n", 
					inflictorId,					
					ftos(time));

	event = strcat(part1, part2);
	logevent(event);
}


void (entity player) LogEventGoal = {
	local string event;
	event = sprintf("{\"type\": \"goal\", \"player\": \"%s\", \"time\": %s},\n", player.netname, ftos(time));
	logevent(event);
}

void (entity player) LogEventFumble = {
	local string event;
	event = sprintf("{\"type\": \"fumble\", \"player\": \"%s\", \"time\": %s},\n", player.netname, ftos(time));
	logevent(event);
}

void (entity attacker) LogEventAttack = {
	local string event;
	event = sprintf("{\"type\": \"attack\", \"player\": \"%s\", \"inflictor\": \"%s\", \"time\": %s},\n", attacker.netname, GetWeaponName(attacker.current_weapon), ftos(time));
	logevent(event);
}
