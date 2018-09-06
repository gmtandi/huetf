void (float previous, float next, float timeplayed) LogEventChangeClass = {

	local string event;
	local string previousClass;
	local string nextClass;
	local string classTime;
	local string eventTime;

	event = "{\"type\": \"changeclass\", ";

	previousClass = "\"previousclass\":";
	previousClass = strcat(previousClass, ftos(previous));
	previousClass = strcat(previousClass, ", ");

	nextClass = "\"nextClass\":";
	nextClass = strcat(nextClass, ftos(next));
	classTime = strcat(classTime, ", ");

	classTime = "\"timePlayed\":";
	classTime = strcat(classTime, ftos(timeplayed));
	classTime = strcat(classTime, ", ");

	eventTime = "\"time\":";
	eventTime = strcat(eventTime, ftos(time));

	event = strcat(event, previousClass);
	event = strcat(event, classTime);
	event = strcat(event, nextClass);
	event = strcat(event, eventTime);

	event = strcat(event, "},\n");

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
	local string attackerId;
	local string attackerPlayerClass;
	local string attackerTeam;
	local string targetId;
	local string targetPlayerClass;
	local string targetTeam;
	local string inflictorId;
	local string totalDamage;
	local string eventTime;

	if (attacker != target)
		event = "{\"type\": \"damage\", ";
	else if (attacker.team_no == target.team_no)
		event = "{\"type\": \"damageSelf\", ";
	else
		event = "{\"type\": \"damageTeam\", ";


	attackerId = "\"attacker\":";
	attackerId = strcat(attackerId, attacker.netname);
	attackerId = strcat(attackerId, ", ");

	attackerPlayerClass = "\"attackerClass\": ";
	attackerPlayerClass = strcat(attackerPlayerClass, ftos(attacker.playerclass));
	attackerPlayerClass = strcat(attackerPlayerClass, ", ");

	attackerTeam = "\"attackerTeam\": ";
	attackerTeam = strcat(attackerTeam, ftos(attacker.team_no));
	attackerTeam = strcat(attackerTeam, ", ");

	targetId = "\"target\": \"";
	targetId = strcat(targetId, target.netname);
	targetId = strcat(targetId, "\", ");

	targetPlayerClass = "\"targetClass\": \"";
	targetPlayerClass = strcat(targetPlayerClass, ftos(target.playerclass));
	targetPlayerClass = strcat(targetPlayerClass, "\", ");

	targetTeam = "\"targetTeam\": ";
	targetTeam = strcat(targetTeam, ftos(target.team_no));
	targetTeam = strcat(targetTeam, ", ");

	inflictorId = "\"inflictor\": \"";
	if (inflictor.classname == "player") 
		inflictorId = strcat(inflictorId, GetWeaponName(attacker.current_weapon));
	else
		inflictorId = strcat(inflictorId, inflictor.classname);
	inflictorId = strcat(inflictorId, "\", ");

	totalDamage = "\"damage\": "; 
	totalDamage = strcat(totalDamage, ftos(damage));
	totalDamage = strcat(totalDamage, ", ");

	eventTime = "\"time\":";
	eventTime = strcat(eventTime, ftos(time));

	event = strcat(event, attackerId);
	event = strcat(event, attackerPlayerClass);
	event = strcat(event, attackerTeam);
	event = strcat(event, targetId);
	event = strcat(event, targetPlayerClass);
	event = strcat(event, targetTeam);
	event = strcat(event, inflictorId);
	event = strcat(event, totalDamage);
	event = strcat(event, eventTime);
	event = strcat(event, "},\n");
	logevent(event);
}



 
	
	