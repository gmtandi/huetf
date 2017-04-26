void () player_pain;
void () player_stand1;
void (vector org) spawn_tfog;
void (vector org, entity death_owner) spawn_tdeath;
float modelindex_eyes;
float modelindex_player;
float modelindex_null;
void () TeamFortress_CheckTeamCheats;
void (entity Viewer, float pc, float rpc) TeamFortress_PrintClassName;
void () TeamFortress_RemoveTimers;
void () TeamFortress_SetupRespawn;
float (float pc) IsLegalClass;
void () CeaseFire_think;
void () StartRound;
void () RemoveVotes;
void (string halias, float himpulse1, float himpulse2) TeamFortress_Alias;
void (entity p) CheckAutoKick;
void (entity p) TeamFortress_ExecClassScript;
void (entity p) TeamFortress_ExecMapScript;
void () PreMatch_Think;
void (entity p) SetTeamName;
void () autokick_think;
float (float tno, float pc) ClassIsRestricted;
float (float tno) CheckClassAvailable;
void () Service_Grapple;
void (entity AD) ParseTFDetect;
entity (float ino) Finditem;
void (entity Item, entity AP, entity Goal) tfgoalitem_GiveToPlayer;
void () CTF_FlagCheck;
string nextmap;
float intermission_running;
float intermission_exittime;

void () updateMaxClients = {
	float playersCount = PlayerCount();
	float spectatorsCount = SpectatorCount();

	if (stof (infokey (world, "automaxclients"))) {
		if (playersCount + spectatorsCount < 31) {
			localcmd ("maxspectators ");
			localcmd (ftos(spectatorsCount + 1));
			localcmd ("\n");

			localcmd ("maxclients ");
			localcmd (ftos(31 - spectatorsCount));
			localcmd ("\n");
		} else {
			localcmd ("maxspectators 0\n");

			localcmd ("maxclients 32\n");
		}
	}
};

void () CheckAllRates =
{
	local float player_rate;
	local float maxrate;
	local float minrate;
	local string tmp;
	local entity p;

	maxrate = stof (infokey (world, "maxrate"));
	minrate = stof (infokey (world, "minrate"));
	if (((maxrate != 0) || (minrate != 0)))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				player_rate = stof (infokey (p, "rate"));
				if (((player_rate > maxrate) && (maxrate != 0)))
				{
					sprint (p, 2, "\nYour עבפו setting is too high for this server.\n");
					tmp = ftos (maxrate);
					sprint (p, 2, "Rate set to ");
					sprint2 (p, 3, tmp, "\n");
					stuffcmd (p, "rate ");
					stuffcmd (p, tmp);
					stuffcmd (p, "\n");
				}
				if (((player_rate < minrate) && (minrate < maxrate)))
				{
					sprint (p, 2, "\nYour עבפו setting is too low for this server.\n");
					tmp = ftos (minrate);
					sprint (p, 2, "Rate set to ");
					sprint2 (p, 3, tmp, "\n");
					stuffcmd (p, "rate ");
					stuffcmd (p, tmp);
					stuffcmd (p, "\n");
				}
			}
			p = find (p, classname, "player");
		}
	}
};

void () CheckConnectRate =
{
	local float player_rate;
	local float maxrate;
	local float minrate;
	local string tmp;

	player_rate = stof (infokey (self, "rate"));
	maxrate = stof (infokey (world, "maxrate"));
	minrate = stof (infokey (world, "minrate"));


/*         if (self.netname == "lunga") {
            stuffcmd (self,"name tang\n");
            stuffcmd (self,"\n");
         }*/

	updateMaxClients();


	if ((maxrate || minrate))
	{
		if (((player_rate > maxrate) && (maxrate != 0)))
		{
			sprint (self, 2, "\nYour עבפו setting is too high for this server.\n");
			tmp = ftos (maxrate);
			sprint (self, 2, "Rate set to ");
			sprint2 (self, 3, tmp, "\n");
			stuffcmd (self, "rate ");
			stuffcmd (self, tmp);
			stuffcmd (self, "\n");
		}
		if (((player_rate < minrate) && (minrate < maxrate)))
		{
			sprint (self, 2, "\nYour עבפו setting is too low for this server.\n");
			tmp = ftos (minrate);
			sprint (self, 2, "Rate set to ");
			sprint2 (self, 3, tmp, "\n");
			stuffcmd (self, "rate ");
			stuffcmd (self, tmp);
			stuffcmd (self, "\n");
		}
	}
};

void () info_intermission =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void () SetChangeParms =
{
	if ((self.health <= 0))
	{
		SetNewParms ();
		return;
	}
	self.items = (self.items - (self.items & (((((131072 | 262144) | 524288) | 1048576) | 2097152) | 4194304)));
	if ((self.health > _d))
	{
		self.health = _d;
	}
	if ((self.health < _2))
	{
		self.health = _2;
	}
	parm1 = self.items;
	parm2 = self.health;
	parm3 = self.armorvalue;
	if ((self.ammo_shells < 25))
	{
		parm4 = 25;
	}
	else
	{
		parm4 = self.ammo_shells;
	}
	parm5 = self.ammo_nails;
	parm6 = self.ammo_rockets;
	parm7 = self.ammo_cells;
	parm8 = self.current_weapon;
	parm9 = (self.armortype * _d);
	parm10 = 0;
	parm11 = 0;
	parm12 = 0;
	parm13 = self.StatusBarRes;
	parm14 = self.StatusBarSize;
	parm15 = self.is_admin;
};

void () SetNewParms =
{
	parm1 = 0;
	parm2 = _d;
	parm3 = 0;
	parm4 = 25;
	parm5 = 0;
	parm6 = 0;
	parm7 = 0;
	parm8 = 1;
	parm9 = 0;
	parm10 = 0;
	parm11 = 0;
	parm12 = 0;
	parm13 = 0;
	parm14 = 0;
	parm15 = 0;
};

void () autokick_think =
{
	self.owner.teamkills = 0;
	dremove (self);
};
void () Check_illclasses;


//huetf - classic team fortress
float (string ps_short, string ps_setting, string ps_default) CF_GetSetting = {
    local string st;

    st = infokey(world, ps_short);
    if (st == string_null) {
        st = infokey(world, ps_setting);
    }

    if (st == "on") {
        return TRUE;
    } else if (st == "off") {
        return FALSE;
    } else if (stof(st) != 0) {
        return stof(st);
    } else if (ps_default == "on") {
        return TRUE;
    } else if (ps_default == "off") {
        return FALSE;
    } else if (stof(ps_default) != 0) {
        return stof(ps_default);
    }

    return 0;
};


void () DecodeLevelParms =
{
	local string st;
	local entity ent;
	local entity te;
	local float fl;

	if (serverflags)
	{
		if ((world.model == "maps/start.bsp"))
		{
			SetNewParms ();
		}
	}

	self.items = parm1;
	self.health = parm2;
	self.armorvalue = parm3;
	self.ammo_shells = parm4;
	self.ammo_nails = parm5;
	self.ammo_rockets = parm6;
	self.ammo_cells = parm7;
	self.current_weapon = parm8;
	self.armortype = (parm9 * 0.01);

	if (!(toggleflags & 256))
	{

		localcmd ("serverinfo huetf 1.45\n");
		Initialise_Teams();

		flagem_checked = 0;
		if ((coop || !deathmatch))
		{
			toggleflags = (toggleflags | 1);
		}
		nextmap = mapname;
		ent = find (world, classname, "info_tfdetect");
		if ((ent != world))
		{
			if ((teamplay == 0))
			{
				cvar_set ("teamplay", "21?TeamFortress");
			}
			ParseTFDetect (ent);
			if (((number_of_teams <= 0) || (number_of_teams >= 5)))
			{
				number_of_teams = 4;
			}
		}
		else
		{
			ent = find (world, classname, "info_player_team1");
			if (((ent != world) || (CTF_Map == 1)))
			{
				CTF_Map = 1;
				if ((teamplay == 0))
				{
					cvar_set ("teamplay", "21?TeamFortress");
				}
				ent = spawn ();
				ent.nextthink = (time + 30);
				ent.think = CTF_FlagCheck;
				number_of_teams = 2;
			}
			else
			{
				number_of_teams = 4;
			}
			team1maxplayers = _d;
			team2maxplayers = _d;
			team3maxplayers = _d;
			team4maxplayers = _d;
		}
		ent = find (world, classname, "func_bomb_target");
		if ((ent != world))
		{
			tfstrike = 1;
			rounds = -1;
			number_of_teams = 2;
		}
		ent = find (world, classname, "func_hostage_rescue");
		if ((ent != world))
		{
			tfstrike = 1;
			rounds = -1;
			number_of_teams = 2;
		}
		ent = find (world, classname, "info_soccer_goal");
		if ((ent != world))
		{
			rounds = -1;
		}
		bprint (2, "Mapname: ");
		bprint (2, mapname);
		bprint (2, "\n");
		team4frags = 0;
		team3frags = 0;
		team2frags = 0;
		team1frags = 0;
		team4score = 0;
		team3score = 0;
		team2score = 0;
		team1score = 0;
		autokick_kills = 0;
		autokick_time = 0;
		cease_fire = 0;
		if (1)
		{
			toggleflags = (toggleflags - (toggleflags & 128));
		}
		if (0)
		{
			toggleflags = (toggleflags | 128);
		}
		toggleflags = (toggleflags - (toggleflags & 2));
		toggleflags = (toggleflags | 256);
		st = infokey (world, "temp1");
		fl = stof (st);
		if (fl)
		{
			toggleflags = (toggleflags | fl);
		}
		st = infokey (world, "highlander");
		if ((st == "on"))
		{
			localcmd ("localinfo cr_scout 1\n");
			localcmd ("localinfo cr_sniper 1\n");
			localcmd ("localinfo cr_soldier 1\n");
			localcmd ("localinfo cr_demoman 1\n");
			localcmd ("localinfo cr_medic 1\n");
			localcmd ("localinfo cr_hwguy 1\n");
			localcmd ("localinfo cr_pyro 1\n");
			localcmd ("localinfo cr_spy 1\n");
			localcmd ("localinfo cr_engineer 1\n");
			localcmd ("localinfo cr_random 1\n");
		}
		else
		{
			Check_illclasses ();
		}
		st = infokey (world, "tfstrike");
		if ((st == "on"))
		{
			tfstrike = 1;
			rounds = -1;
		}
		st = infokey (world, "duel");
		if ((st == "on"))
		{
			duel = 1;
			rounds = -1;
		}
		st = infokey (world, "speedcap");
		if ((st == "on"))
		{
			speedcap = 1;
			rounds = -1;
		}


      	sgbuildlvl2 = CF_GetSetting("sgb2", "sgbuildlvl2", "off");
      	sglvl2to3 = CF_GetSetting("sgnl2", "sglvl2to3", "off");

      	autospanner = CF_GetSetting("aspanner", "autospanner", "off");
      	sniperpower = CF_GetSetting("spow", "sniperpower", "off");

      	automaxclients = CF_GetSetting("automaxclients", "automaxclients", "on");

      // display grenade timer in status bar [on]
        grentimers = CF_GetSetting("gt", "grentimers", "on");

      // Replaces caltrop with impact grenade
        impactgren = CF_GetSetting("ig", "impactgren", "on");


      // Toggle 24 bits skins
        skins24b = CF_GetSetting("s24b", "skins24b", "off");

        headshots = CF_GetSetting("hs", "headshots", "on");

        shortergrens = CF_GetSetting("shgrens", "shortergrens", "on");


		st = infokey (world, "rounds");
		if ((st == "on"))
		{
			rounds = -1;
		}
		else
		{
			if ((stof (st) > 0))
			{
				rounds = (stof (st) + 1);
			}
		}
		st = infokey (world, "practice");
		if ((st == "on"))
		{
			practice = 1;
		}
		else
		{
			practice = 0;
		}
		st = infokey (world, "clan");
		if ((st == "on"))
		{
			localcmd ("serverinfo status Standby\n");
			clanbattle = 1;
			practice = 0;
			cb_prematch = 1;
			st = infokey (world, "freeze");
			if ((st == "on"))
			{
				freeze = 1;
			}
			else
			{
				if (((mapname == "spaz4") || (mapname == "canalzon")))
				{
					localcmd ("localinfo freeze on\n");
					freeze = 1;
				}
			}
			pmtime = stof (infokey (world, "prematch"));
			if (pmtime)
			{
				StartTimer ();
			}
			if (!pmtime)
			{
				st = infokey (world, "cft");
				pmtime = stof (st);
				if (pmtime)
				{
					cease_fire = 1;
					bprint (2, "CEASE FIRE\n");
					te = find (world, classname, "player");
					while (te)
					{
						centerprint (te, "CEASE FIRE\n");
						te.immune_to_check = (time + 5);
						te.tfstate = (te.tfstate | 65536);
						TeamFortress_SetSpeed (te);
						te = find (te, classname, "player");
					}
					te = spawn ();
					te.classname = "ceasefire";
					te.think = CeaseFire_think;
					te.nextthink = (time + 5);
					te.weapon = 1;
					StartTimer ();
				}
			}
		}
		else
		{
			clanbattle = 0;
			localcmd ("serverinfo status Normal\n");
		}
		if (rounds)
		{
			if (tfstrike)
			{
				st = infokey (world, "grenpacks");
				if ((st == "on"))
				{
					localcmd ("localinfo grenpacks off\n");
				}
				allow_grenpack = 0;
			}
			st = infokey (world, "round_time");
			round_over = 1;
			te = spawn ();
			te.owner = world;
			te.classname = "round";
			te.cnt = stof (st);
			if (!clanbattle)
			{
				StartRound ();
			}
		}
		st = infokey (world, "tfvsdm");
		if ((st == "on"))
		{
			civilianteams = enter;
			tfvsdm = 1;
		}
		Calibrate_Level ();
	}
	if (parm11)
	{
		self.tfstate = parm11;
	}
	if (!self.playerclass)
	{
		self.playerclass = parm12;
	}
	if (parm13)
	{
		self.StatusBarRes = parm13;
	}
	if (parm14)
	{
		self.StatusBarSize = parm14;
	}
	if (parm15)
	{
		self.is_admin = parm15;
	}
};

entity () FindIntermission =
{
	local entity spot;
	local float cyc;

	spot = find (world, classname, "info_intermission");
	if (spot)
	{
		cyc = (random () * 1);
		return (spot);
	}
	spot = find (world, classname, "info_player_start");
	if (spot)
	{
		return (spot);
	}
	spot = find (world, classname, "info_player_deathmatch");
	if (spot)
	{
		cyc = (random () * 6);
		while ((cyc > 1))
		{
			spot = find (spot, classname, "info_player_deathmatch");
			if (!spot)
			{
				spot = find (spot, classname, "info_player_deathmatch");
			}
			cyc = (cyc - 1);
		}
		return (spot);
	}
	objerror ("FindIntermission: no spot");
};

entity (entity start_point) FindNextIntermission =
{
	local entity spot;
	local float cyc;

	if (deathmatch)
	{
		if (((start_point.classname == "info_intermission") || (start_point == world)))
		{
			spot = find (start_point, classname, "info_intermission");
			if (spot)
			{
				return (spot);
			}
			else
			{
				start_point = world;
			}
		}
		if (((start_point.classname == "info_player_deathmatch") || (start_point == world)))
		{
			spot = find (start_point, classname, "info_player_deathmatch");
			if (spot)
			{
				return (spot);
			}
		}
		spot = find (world, classname, "info_intermission");
		if (spot)
		{
			return (spot);
		}
		spot = find (world, classname, "info_player_deathmatch");
		if (spot)
		{
			return (spot);
		}
	}
	else
	{
		spot = find (world, classname, "info_player_start");
		if (spot)
		{
			return (spot);
		}
	}
	return (FindIntermission ());
};

void () TF_MovePlayer =
{
	local entity place;

	place = FindNextIntermission (self.observer_list);
	self.observer_list = place;
	setorigin (self, (place.origin + '0 0 1'));
	self.angles = place.angles;
	self.fixangle = 1;
};

void () GotoNextMap =
{
	local float nextlevel;
	local string sl;
	local string st;
	local entity te;

	if ((nextmap != mapname))
	{
		changelevel (nextmap);
		already_chosen_map = 1;
	}
	sl = infokey (world, mapname);
	if ((sl != string_null))
	{
		nextmap = sl;
		already_chosen_map = 1;
		return;
	}
	if (!already_chosen_map)
	{
		sl = infokey (world, "n");
		nextlevel = stof (sl);
		nextlevel = (nextlevel + 1);
		sl = ftos (nextlevel);
		localcmd ("localinfo n ");
		localcmd (sl);
		localcmd ("\n");
		st = infokey (world, "cd");
		if ((st == string_null))
		{
			st = infokey (world, "cycledir");
		}
		if ((st != string_null))
		{
			localcmd ("exec ");
			localcmd (st);
			localcmd ("/map");
		}
		else
		{
			localcmd ("exec qwmcycle/map");
		}
		localcmd (sl);
		localcmd (".cfg\n");
		already_chosen_map = 1;
	}
	if ((infokey (world, "n") == "0"))
	{
		already_chosen_map = 0;
	}
};

void () ExitIntermission =
{
	dprint ("Exiting intermission...\n");
	if (deathmatch)
	{
		dprint ("Exit Intermission in Deathmatch.\n");
		GotoNextMap ();
		return;
	}
	intermission_exittime = (time + 1);
	intermission_running = (intermission_running + 1);
	if ((intermission_running == 2))
	{
		if ((world.model == "maps/e1m7.bsp"))
		{
			WriteByte (2, space);
			WriteByte (2, 2);
			WriteByte (2, 3);
			if (!cvar ("registered"))
			{
				WriteByte (2, 31);
				WriteString (2, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task in...");
			}
			else
			{
				WriteByte (2, 31);
				WriteString (2, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task. A...");
			}
			return;
		}
		else
		{
			if ((world.model == "maps/e2m6.bsp"))
			{
				WriteByte (2, space);
				WriteByte (2, 2);
				WriteByte (2, 3);
				WriteByte (2, 31);
				WriteString (2, "The Rune of Black Magic throbs evilly in\nyour hand and whispers dark thoughts\ninto your brain. You learn the inmost\nlore of the Hell-Mother; Shub-Niggurath!\nYou now know that she is behind all the\nterrible plotting which has led to so\nmuch death...");
				return;
			}
			else
			{
				if ((world.model == "maps/e3m6.bsp"))
				{
					WriteByte (2, space);
					WriteByte (2, 2);
					WriteByte (2, 3);
					WriteByte (2, 31);
					WriteString (2, "The charred viscera of diabolic horrors\nbubble viscously as you seize the Rune\nof Hell Magic. Its heat scorches your\nhand, and its terrible secrets blight\nyour mind. Gathering the shreds of your\ncourage, you shake the devil's shackles\nfrom your ...");
					return;
				}
				else
				{
					if ((world.model == "maps/e4m7.bsp"))
					{
						WriteByte (2, space);
						WriteByte (2, 2);
						WriteByte (2, 3);
						WriteByte (2, 31);
						WriteString (2, "Despite the awful might of the Elder\nWorld, you have achieved the Rune of\nElder Magic, capstone of all types of\narcane wisdom. Beyond good and evil,\nbeyond life and death, the Rune\npulsates, heavy with import. Patient and\npotent, the Elder Being...");
						return;
					}
				}
			}
		}
		GotoNextMap ();
	}
	if ((intermission_running == 3))
	{
		if (!cvar ("registered"))
		{
			WriteByte (2, 33);
			return;
		}
		if (((serverflags & 15) == 15))
		{
			WriteByte (2, 31);
			WriteString (2, "Now, you have all four Runes. You sense\ntremendous invisible forces moving to\nunseal ancient barriers. Shub-Niggurath\nhad hoped to use the Runes Herself to\nclear off the Earth, but now instead,\nyou will use them to enter her home and\nconfront he...");
			return;
		}
	}
	dprint ("Exit Intermission.\n");
	GotoNextMap ();
};

void () IntermissionThink =
{
	local float minp;
	local float maxp;
	local float currp;
	local string sl;
	local string st;

	if ((time < intermission_exittime))
	{
		return;
	}
	if ((infokey (world, "serverdemo") != string_null))
	{
		localcmd ("stop\n");
		st = infokey (world, "demo_auto_left");
		currp = stof (st);
		if ((currp > 0))
		{
			currp = (currp - 1);
			st = ftos (currp);
			localcmd ("localinfo demo_auto_left ");
			localcmd (st);
			localcmd ("\n");
		}
	}
	if (((!self.button0 && !self.button1) && !self.button2))
	{
		return;
	}
	dprint ("Intermission think.\n");
	GotoNextMap ();
	sl = infokey (world, "nmap");
	if ((sl != string_null))
	{
		st = infokey (world, "minp");
		minp = stof (st);
		st = infokey (world, "maxp");
		maxp = stof (st);
		currp = TeamFortress_GetNoPlayers ();
		dprint ("MAP CYCLING: Player Counting... ");
		if (((currp >= minp) && (currp <= maxp)))
		{
			dprint ("within range. Changing maps...\n");
			st = infokey (world, "cd");
			if ((st == string_null))
			{
				st = infokey (world, "cycledir");
			}
			if ((st != string_null))
			{
				localcmd ("exec ");
				localcmd (st);
				localcmd ("/");
			}
			else
			{
				localcmd ("exec qwmcycle/");
			}
			localcmd (sl);
			localcmd (".cfg\n");
		}
		else
		{
			dprint ("outside range. Next map.\n");
			already_chosen_map = 0;
		}
		localcmd ("localinfo minp \"\"\n");
		localcmd ("localinfo maxp \"\"\n");
		localcmd ("localinfo nmap \"\"\n");
	}
};

void () execute_changelevel =
{
	local entity pos;

	dprint ("execute_changelevel()\n");
	intermission_running = 1;
	intermission_exittime = (time + 5);
	pos = FindIntermission ();
	WriteByte (2, space);
	WriteByte (2, 3);
	WriteByte (2, 30);
	WriteCoord (2, pos.origin_x);
	WriteCoord (2, pos.origin_y);
	WriteCoord (2, pos.origin_z);
	WriteAngle (2, pos.mangle_x);
	WriteAngle (2, pos.mangle_y);
	WriteAngle (2, pos.mangle_z);
	localcmd ("serverinfo status Standby\n");
	other = find (world, classname, "player");
	while ((other != world))
	{
		stuffcmd (other, "play endgame.wav\n");
		ShowFrags (other);
		other.takedamage = 0;
		other.solid = 0;
		other.movetype = 0;
		other.modelindex = 0;
		other = find (other, classname, "player");
	}
};

void () changelevel_touch =
{
	local entity pos;
	local float ne;
	local string st;

	if ((other.classname != "player"))
	{
		return;
	}
	if (((cvar ("samelevel") == 2) || ((cvar ("samelevel") == 3) && (mapname != "start"))))
	{
		return;
	}
	bprint (2, other.netname);
	bprint (2, " exited the level\n");
	nextmap = self.map;
	SUB_UseTargets ();
	if (((self.spawnflags & 1) && (deathmatch == 0)))
	{
		GotoNextMap ();
		return;
	}
	self.touch = SUB_Null;
	self.think = execute_changelevel;
	self.nextthink = (time + 0.1);
};

void () trigger_changelevel =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.map)
	{
		objerror ("changelevel trigger doesn't have map");
	}
	InitTrigger ();
	self.touch = changelevel_touch;
};
void () set_suicide_frame;

void () respawn =
{
	if ((self.has_disconnected == 1))
	{
		return;
	}
	if (cease_fire)
	{
		return;
	}
	CopyToBodyQue (self);
	setspawnparms (self);
	PutClientInServer ();
};

void () ClientKill =
{
	local entity te;

        if ((self.classname == "botcam"))
        {
                return;
        }
	if ((self.has_disconnected == 1))
	{
		return;
	}
	if ((self.respawn_time > time))
	{
		return;
	}
	if (self.deadflag)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (practice)
	{
		self.respawn_time = (time + 1);
	}
	else
	{
		self.respawn_time = (time + 5);
	}
	if (self.playerclass)
	{
		bprint (1, self.netname);
		bprint (1, " suicides\n");
		TF_AddFrags (self, -1, 0);
		set_suicide_frame ();
		self.modelindex = modelindex_player;
		if ((self.tfstate & 16))
		{
			te = find (world, classname, "timer");
			while (te)
			{
				if (((te.owner == self) && (te.think == BioInfection_Decay)))
				{
					logfrag (te, self);
					TF_AddFrags (te.enemy, 1, 1);
				}
				te = find (te, classname, "timer");
			}
		}
		else
		{
			logfrag (self, self);
		}
	}
	self.weaponmodel = "";
	self.view_ofs = '0 0 -8';
	self.movetype = 0;
	TeamFortress_RemoveTimers ();
	TeamFortress_SetupRespawn ();
	self.health = -1;
	self.th_die ();
	self.deadflag = 3;
	self.takedamage = 0;
};
entity lastspawn_team1;
entity lastspawn_team2;
entity lastspawn_team3;
entity lastspawn_team4;

entity (float team_num) FindTeamSpawnPoint =
{
	local entity spot;
	local entity at_spot;
	local float spot_found;
	local float attempts;

	if ((team_num == 1))
	{
		spot = lastspawn_team1;
		attempts = 0;
		while (1)
		{
			attempts = (attempts + 1);
			if (tfstrike)
			{
				spot = find (spot, classname, "info_player_start");
			}
			else
			{
				spot = find (spot, team_str_home, "ts1");
			}
			if ((spot == world))
			{
				if (tfstrike)
				{
					spot = find (world, classname, "info_player_start");
				}
				else
				{
					spot = find (world, team_str_home, "ts1");
				}
			}
			if ((spot == world))
			{
				return (world);
			}
			at_spot = findradius (spot.origin, 40);
			spot_found = 1;
			while ((at_spot != world))
			{
				if (((at_spot.classname == "player") && (at_spot.deadflag == 0)))
				{
					spot_found = 0;
				}
				at_spot = at_spot.chain;
			}
			if (!Activated (spot, self))
			{
				spot_found = 0;
			}
			if ((spot_found || (attempts >= 30)))
			{
				lastspawn_team1 = spot;
				return (spot);
			}
		}
	}
	else
	{
		if ((team_num == 2))
		{
			spot = lastspawn_team2;
			attempts = 0;
			while (1)
			{
				attempts = (attempts + 1);
				if (tfstrike)
				{
					spot = find (spot, classname, "info_player_deathmatch");
				}
				else
				{
					spot = find (spot, team_str_home, "ts2");
				}
				if ((spot == world))
				{
					if (tfstrike)
					{
						spot = find (world, classname, "info_player_deathmatch");
					}
					else
					{
						spot = find (world, team_str_home, "ts2");
					}
				}
				if ((spot == world))
				{
					return (world);
				}
				at_spot = findradius (spot.origin, 40);
				spot_found = 1;
				while ((at_spot != world))
				{
					if (((at_spot.classname == "player") && (at_spot.deadflag == 0)))
					{
						spot_found = 0;
					}
					at_spot = at_spot.chain;
				}
				if (!Activated (spot, self))
				{
					spot_found = 0;
				}
				if ((spot_found || (attempts >= 30)))
				{
					lastspawn_team2 = spot;
					return (spot);
				}
			}
		}
		else
		{
			if ((team_num == 3))
			{
				spot = lastspawn_team3;
				attempts = 0;
				while (1)
				{
					attempts = (attempts + 1);
					spot = find (spot, team_str_home, "ts3");
					if ((spot == world))
					{
						spot = find (world, team_str_home, "ts3");
					}
					if ((spot == world))
					{
						return (world);
					}
					at_spot = findradius (spot.origin, 40);
					spot_found = 1;
					while ((at_spot != world))
					{
						if (((at_spot.classname == "player") && (at_spot.deadflag == 0)))
						{
							spot_found = 0;
						}
						at_spot = at_spot.chain;
					}
					if (!Activated (spot, self))
					{
						spot_found = 0;
					}
					if ((spot_found || (attempts >= 30)))
					{
						lastspawn_team3 = spot;
						return (spot);
					}
				}
			}
			else
			{
				if ((team_num == 4))
				{
					spot = lastspawn_team4;
					attempts = 0;
					while (1)
					{
						attempts = (attempts + 1);
						spot = find (spot, team_str_home, "ts4");
						if ((spot == world))
						{
							spot = find (world, team_str_home, "ts4");
						}
						if ((spot == world))
						{
							return (world);
						}
						at_spot = findradius (spot.origin, 40);
						spot_found = 1;
						while ((at_spot != world))
						{
							if (((at_spot.classname == "player") && (at_spot.deadflag == 0)))
							{
								spot_found = 0;
							}
							at_spot = at_spot.chain;
						}
						if (!Activated (spot, self))
						{
							spot_found = 0;
						}
						if ((spot_found || (attempts >= 30)))
						{
							lastspawn_team4 = spot;
							return (spot);
						}
					}
				}
			}
		}
	}
	return (world);
};

void (entity e) ValidateUser =
{
};

entity () SelectSpawnPoint =
{
	local entity spot;
	local entity at_spot;
	local float spot_found;
	local float attempts;

	if ((self.team_no != 0))
	{
		spot = FindTeamSpawnPoint (self.team_no);
		if ((spot != world))
		{
			return (spot);
		}
	}
	if (coop)
	{
		lastspawn = find (lastspawn, classname, "info_player_coop");
		if ((lastspawn == world))
		{
			lastspawn = find (world, classname, "info_player_coop");
		}
		if ((lastspawn != world))
		{
			return (lastspawn);
		}
	}
	else
	{
		if (deathmatch)
		{
			spot = find (lastspawn, classname, "info_player_deathmatch");
			if ((spot == world))
			{
				spot = find (world, classname, "info_player_deathmatch");
			}
			attempts = 0;
			while (((spot != world) && (attempts < _d)))
			{
				attempts = (attempts + 1);
				at_spot = findradius (spot.origin, 40);
				spot_found = 1;
				while (at_spot)
				{
					if (((at_spot.classname == "player") && (at_spot.deadflag == 0)))
					{
						spot_found = 0;
					}
					at_spot = at_spot.chain;
				}
				if ((spot_found || (attempts >= enter)))
				{
					lastspawn = spot;
					return (spot);
				}
				spot = find (spot, classname, "info_player_deathmatch");
				if ((spot == world))
				{
					spot = find (world, classname, "info_player_deathmatch");
				}
			}
		}
	}
	if (serverflags)
	{
		spot = find (world, classname, "info_player_start2");
		if (spot)
		{
			return (spot);
		}
	}
	spot = find (world, classname, "info_player_start");
	if (!spot)
	{
		error ("PutClientInServer: no info_player_start on level\n");
	}
	return (spot);
};
void () PlayerDie;
void () TeamFortress_SetHealth;
void () TeamFortress_SetEquipment;
void () player_touch;

void () PutClientInServer =
{
	local string st;
	local float iszoom;
	local entity spot;
	local entity te;
	local float oldclass;

	self.immune_to_check = (time + 5);
	self.touch = player_touch;
	self.classname = "player";
	self.health = _d;
	self.solid = 3;
	self.movetype = 3;
	self.show_hostile = 0;
	self.max_health = _d;
	self.flags = 8;
	self.air_finished = (time + 12);
	self.dmg = 2;
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.invisible_finished = 0;
	self.invincible_finished = 0;
	self.effects = 0;
	self.invincible_time = 0;
	self.reload_shotgun = 0;
	self.reload_super_shotgun = 0;
	self.reload_grenade_launcher = 0;
	self.reload_rocket_launcher = 0;
	self.reload_sniper_rifle = 0;
	self.on_hook = 0;
	self.hook_out = 0;
	self.fire_held_down = 0;
	self.mapcount = _d;
	self.gravity = 1;
	self.camdist = 0;
	DecodeLevelParms ();
	if (self.team_no && !captainmode)
	{
		if (!self.playerclass)
		{
			if (TeamFortress_TeamIsCivilian (self.team_no))
			{
				self.nextpc = 11;
			}
		}
	}
	iszoom = 0;
	if ((self.tfstate & 4096))
	{
		iszoom = 1;
	}
	if (round_active)
	{
		self.playerclass = 0;
	}
	else
	{
		if ((self.nextpc != 0))
		{
			self.playerclass = self.nextpc;
			self.nextpc = 0;
			if ((self.playerclass == enter))
			{
				self.tfstate = (self.tfstate | 8);
			}
			else
			{
				self.tfstate = (self.tfstate - (self.tfstate & 8));
				TeamFortress_ExecClassScript (self);
			}
		}
	}
	if ((self.tfstate & 8))
	{
		if (round_active)
		{
			self.playerclass = 0;
		}
		else
		{
			if (CheckClassAvailable (self.team_no))
			{
				oldclass = self.playerclass;
				self.playerclass = (1 + floor ((random () * (enter - 1))));
				while (((!IsLegalClass (self.playerclass) || (self.playerclass == oldclass)) || ClassIsRestricted (self.team_no, self.playerclass)))
				{
					self.playerclass = (1 + floor ((random () * (enter - 1))));
				}
			}
			else
			{
				sprint (self, 2, "All classes disabled, returning to Observer mode.\n");
				self.playerclass = 0;
			}
			self.tfstate = 8;
			TeamFortress_ExecClassScript (self);
		}
	}
	else
	{
		self.tfstate = 0;
	}
	if ((iszoom == 1))
	{
		self.oldheight = stof (infokey (self, "fov"));
		self.tfstate = (self.tfstate | 4096);
	}
	if ((self.playerclass != 9))
	{
		Engineer_RemoveBuildings (self);
	}
	self.takedamage = 2;
	TeamFortress_PrintClassName (self, self.playerclass, (self.tfstate & 8));
	TeamFortress_SetEquipment ();
	TeamFortress_SetHealth ();
	TeamFortress_SetSpeed (self);
	TeamFortress_SetSkin (self);
	stuffcmd (self, "v_cshift; wait; bf\n");
	W_SetCurrentAmmo ();
	self.attack_finished = (time + 0.3);
	self.th_pain = player_pain;
	self.th_die = PlayerDie;
	self.deadflag = 0;
	self.pausetime = 0;
	spot = SelectSpawnPoint ();
	if (self.playerclass)
	{
		spawn_tdeath (spot.origin, self);
	}
	self.observer_list = spot;
	self.origin = (spot.origin + '0 0 1');
	self.angles = spot.angles;
	self.fixangle = 1;
	if (((spot.classname == "info_player_teamspawn") && !cb_prematch))
	{
		if ((spot.items != 0))
		{
			te = Finditem (spot.items);
			if (te)
			{
				tfgoalitem_GiveToPlayer (te, self, self);
			}
			if (!(spot.goal_activation & 1))
			{
				spot.items = 0;
			}
		}
		if (spot.message)
		{
			CenterPrint (self, spot.message);
			if (!(spot.goal_activation & 2))
			{
				spot.message = string_null;
			}
		}
		if ((spot.activate_goal_no != 0))
		{
			te = Findgoal (spot.activate_goal_no);
			if (te)
			{
				AttemptToActivate (te, self, spot);
			}
		}
		if ((spot.goal_effects == 1))
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + 1);
			spot.think = SUB_Remove;
		}
	}
	setmodel (self, string_null);
	modelindex_null = self.modelindex;
	setmodel (self, "progs/eyes.mdl");
	modelindex_eyes = self.modelindex;
	setmodel (self, "progs/player.mdl");
	modelindex_player = self.modelindex;
	if (!self.playerclass && !captainmode)
	{
		self.modelindex = modelindex_null;
		if ((round_active || (self.playerclass == -1)))
		{
			self.current_menu = 0;
		}
		if (!self.camdist)
		{
			self.camdist = 160;
		}
		self.movetype = 5;
		stuffcmd (self, "color ");
		iszoom = (TeamFortress_TeamGetColor (self.team_no) - 1);
		st = ftos (iszoom);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		SetTeamName (self);
	}
	setsize (self, '-16 -16 -24', '16 16 32');
	self.view_ofs = '0 0 22';
	self.velocity = '0 0 0';
	player_stand1 ();
	if ((deathmatch || coop))
	{
		makevectors (self.angles);
		if (self.playerclass)
		{
			spawn_tfog ((self.origin + (v_forward * 20)));
		}
	}
	if ((stof (infokey (world, "rj")) != 0))
	{
		rj = stof (infokey (world, "rj"));
	}
	else
	{
		rj = 1;
	}
	if (cease_fire)
	{
		sprint (self, 2, "\n\nCEASE FIRE MODE\n");
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | 65536);
		TeamFortress_SetSpeed (self);
	}
};

void () info_player_start =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void () info_player_start2 =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void () testplayerstart =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void () info_player_deathmatch =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void () info_player_coop =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
};

void (entity c) PrintClientScore =
{
	if (((c.frags > -10) && (c.frags < 0)))
	{
		bprint (1, " ");
	}
	else
	{
		if ((c.frags >= 0))
		{
			if ((c.frags < _d))
			{
				bprint (1, " ");
			}
			if ((c.frags < enter))
			{
				bprint (1, " ");
			}
		}
	}
	bprint (c.frags, ftos (c.frags));
	bprint (1, " ");
	bprint (1, c.netname);
	bprint (1, "\n");
};

void () DumpScore =
{
	local entity e;
	local entity sort;
	local entity walk;

	if (world.chain)
	{
		error ("DumpScore: world.chain is set");
	}
	e = find (world, classname, "player");
	sort = world;
	while (e)
	{
		if (!sort)
		{
			sort = e;
			e.chain = world;
		}
		else
		{
			if ((e.frags > sort.frags))
			{
				e.chain = sort;
				sort = e;
			}
			else
			{
				walk = sort;
				do
				{
					if (!walk.chain)
					{
						e.chain = world;
						walk.chain = e;
					}
					else
					{
						if ((walk.chain.frags < e.frags))
						{
							e.chain = walk.chain;
							walk.chain = e;
						}
						else
						{
							walk = walk.chain;
						}
					}

				} while ((walk.chain != e));
			}
		}
		e = find (e, classname, "player");
	}
	bprint (1, "\n");
	while (sort)
	{
		PrintClientScore (sort);
		sort = sort.chain;
	}
	bprint (1, "\n");
};
float already_cycled;

void () NextLevel =
{
	local entity o;

	if (already_cycled)
	{
		return;
	}
	already_cycled = 1;
	o = spawn ();
	o.map = nextmap;
	o.think = execute_changelevel;
	o.nextthink = (time + 0.1);
};

void () CheckRules =
{
	if (!clanbattle)
	{
		if ((timelimit && (time >= timelimit)))
		{
			NextLevel ();
		}
	}
	if ((fraglimit && (self.frags >= fraglimit)))
	{
		NextLevel ();
	}
};

void () PlayerDeathThink =
{
	local float fwd;

	if ((self.flags & 512))
	{
		fwd = vlen (self.velocity);
		fwd = (fwd - 20);
		if ((fwd <= 0))
		{
			self.velocity = '0 0 0';
		}
		else
		{
			self.velocity = (fwd * normalize (self.velocity));
		}
	}
	if ((self.deadflag == 2))
	{
		if (((self.button2 || self.button1) || self.button0))
		{
			return;
		}
		self.deadflag = 3;
		return;
	}
	if ((round_over == 2))
	{
		self.button0 = 0;
		self.button1 = 0;
		self.button2 = 0;
		return;
	}
	if ((round_active && !duel))
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = 0;
			self.button1 = 0;
			self.button2 = 0;
			respawn ();
		}
		return;
	}
	if (((!self.button2 && !self.button1) && !self.button0))
	{
		if (self.respawn_time)
		{
			if ((self.respawn_time <= time))
			{
				self.button0 = 0;
				self.button1 = 0;
				self.button2 = 0;
			}
			return;
		}
	}
	else
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = 0;
			self.button1 = 0;
			self.button2 = 0;
			respawn ();
		}
		return;
	}
	if ((self.impulse == 171))
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = 0;
			self.button1 = 0;
			self.button2 = 0;
			respawn ();
		}
		self.impulse = 0;
		return;
	}
};

void () PlayerJump =
{
	local entity te;
	local float stumble;

	if ((self.has_disconnected == 1))
	{
		return;
	}
	if ((self.flags & 2048))
	{
		return;
	}
	if ((self.tfstate & 65536))
	{
		return;
	}

	if (!self.playerclass)
	{
		if ((self.waterlevel >= 2))
		{
			self.velocity_z = 350;
		}
		else
		{
			self.velocity_z = 200;
		}
		if ((self.flags & 4096))
		{
			self.flags = (self.flags - (self.flags & 4096));
		}
		self.button2 = 0;
		return;
	}
	if ((self.waterlevel >= 2))
	{
		if ((self.watertype == -3))
		{
			self.velocity_z = _d;
		}
		else
		{
			if ((self.watertype == -4))
			{
				self.velocity_z = _P;
			}
			else
			{
				self.velocity_z = _2;
			}
		}
		if ((self.swim_flag < time))
		{
			self.swim_flag = (time + 1);
			if ((random () < 0.5))
			{
				sound (self, 4, "misc/water1.wav", 1, 1);
			}
			else
			{
				sound (self, 4, "misc/water2.wav", 1, 1);
			}
		}
		if ((self.fire_held_down && (self.current_weapon == 32768)))
		{
			self.tfstate = (self.tfstate - (self.tfstate & 2048));
			TeamFortress_SetSpeed (self);
			self.weaponframe = 0;
			self.heat = 0;
			self.count = 1;
			player_assaultcannondown1 ();
		}
		return;
	}
	if (!(self.flags & 512))
	{
		return;
	}
	if (!(self.flags & 4096))
	{
		return;
	}
	self.flags = (self.flags - (self.flags & 4096));
	self.button2 = 0;
	sound (self, 4, "player/plyrjmp8.wav", 1, 1);
	te = find (world, classname, "timer");
	while ((((te.owner != self) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
	{
		te = find (te, classname, "timer");
	}
	if (((te != world) && (te != self)))
	{
		if (!self.is_feigning)
		{
			crandom ();
			crandom ();
			stumble = (crandom () * (te.health / _d));
			if ((crandom () < 0))
			{
				self.velocity_x = (self.velocity_y + stumble);
				self.velocity_y = (self.velocity_x + stumble);
			}
			else
			{
				self.velocity_x = ((-1 * self.velocity_y) + stumble);
				self.velocity_y = ((-1 * self.velocity_x) + stumble);
			}
		}
	}
	if ((self.button0 && (self.current_weapon == 32768)))
	{
		sprint (self, 1, "You cannot fire the assault cannon without your feet on the ground...\n");
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.weaponframe = 0;
		self.count = 1;
		self.heat = 0;
		player_assaultcannondown1 ();
	}
        if (!self.ishuman)
        {
                self.velocity_z = (self.velocity_z + 270);
        }
	return;	return;
};
.float dmgtime;

void () WaterMove =
{
	if ((self.movetype == 8))
	{
		return;
	}
	if ((self.health < 0))
	{
		return;
	}
	if ((self.waterlevel != 3))
	{
		if ((self.air_finished < time))
		{
			sound (self, 2, "player/gasp2.wav", 1, 1);
		}
		else
		{
			if ((self.air_finished < (time + 9)))
			{
				sound (self, 2, "player/gasp1.wav", 1, 1);
			}
		}
		self.air_finished = (time + 12);
		self.dmg = 2;
	}
	else
	{
		if ((self.air_finished < time))
		{
			if ((self.pain_finished < time))
			{
				self.dmg = (self.dmg + 2);
				if ((self.dmg > 15))
				{
					self.dmg = enter;
				}
				TF_T_Damage (self, world, world, self.dmg, 1, 0);
				self.pain_finished = (time + 1);
			}
		}
	}
	if (!self.waterlevel)
	{
		if ((self.flags & 16))
		{
			sound (self, 4, "misc/outwater.wav", 1, 1);
			self.flags = (self.flags - 16);
		}
		return;
	}
	if ((self.watertype == -5))
	{
		if ((self.dmgtime < time))
		{
			if ((self.radsuit_finished > time))
			{
				self.dmgtime = (time + 1);
			}
			else
			{
				self.dmgtime = (time + 0.2);
			}
			TF_T_Damage (self, world, world, (enter * self.waterlevel), 0, 16);
		}
	}
	else
	{
		if ((self.watertype == -4))
		{
			if (((self.dmgtime < time) && (self.radsuit_finished < time)))
			{
				self.dmgtime = (time + 1);
				T_Damage (self, world, world, (4 * self.waterlevel));
			}
		}
	}
	if (!(self.flags & 16))
	{
		if ((self.watertype == -5))
		{
			sound (self, 4, "player/inlava.wav", 1, 1);
		}
		if ((self.watertype == -3))
		{
			sound (self, 4, "player/inh2o.wav", 1, 1);
		}
		if ((self.watertype == -4))
		{
			sound (self, 4, "player/slimbrn2.wav", 1, 1);
		}
		self.flags = (self.flags + 16);
		self.dmgtime = 0;
	}
};

void () CheckWaterJump =
{
	local vector start;
	local vector end;

	makevectors (self.angles);
	start = self.origin;
	start_z = (start_z + 8);
	v_forward_z = 0;
	normalize (v_forward);
	end = (start + (v_forward * 24));
	traceline (start, end, 1, self);
	if ((trace_fraction < 1))
	{
		start_z = ((start_z + self.maxs_z) - 8);
		end = (start + (v_forward * 24));
		self.movedir = (trace_plane_normal * -50);
		traceline (start, end, 1, self);
		if ((trace_fraction == 1))
		{
			self.flags = (self.flags | 2048);
			self.velocity_z = 225;
			self.flags = (self.flags - (self.flags & 4096));
			self.teleport_time = (time + 2);
			return;
		}
	}
};

void () PlayerPreThink =
{

        if (BotPreFrame ())
        {
                return;
        }

	if ((self.is_feigning && (self.waterlevel == 1)))
	{
		self.watertype = -3;
		self.waterlevel = 3;
	}
	if (intermission_running)
	{
		IntermissionThink ();
		return;
	}
	CheckFps ();
	makevectors (self.v_angle);
	if ((self.view_ofs == '0 0 0'))
	{
		return;
	}
	CheckRules ();
	if ((self.deadflag >= 2))
	{
		self.movetype = 6;
		PlayerDeathThink ();
		return;
	}
	if (((self.undercover_team || self.undercover_skin) || self.is_undercover))
	{
		if ((self.effects & (8 | 4)))
		{
			sprint (self, 1, "The glowing removes your disguise.\n");
			Spy_RemoveDisguise (self);
		}
		if ((tfstrike && self.ammo_detpack))
		{
			sprint (self, 1, "The bomb removes your disguise.\n");
			Spy_RemoveDisguise (self);
		}
	}
	if ((self.deadflag == 1))
	{
		return;
	}
	if (!self.is_feigning)
	{
		if (self.button2)
		{
			PlayerJump ();
		}
		else
		{
			self.flags = (self.flags | 4096);
		}
	}
	else
	{
		if (self.waterlevel)
		{
			self.velocity_z = -100;
		}
	}
	if (((time < self.pausetime) || (cease_fire == 1)))
	{
		self.velocity = '0 0 0';
	}
	if ((((time > self.attack_finished) && (self.currentammo == 0)) && (self.weapon > 16)))
	{
		self.weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
	}
	if (self.on_hook)
	{
		Service_Grapple ();
	}
};

void () CheckPowerups =
{
	local float lighton;
	local entity te;

	if ((self.health <= 0))
	{
		return;
	}
	if (!self.playerclass)
	{
		self.modelindex = modelindex_null;
	}
	else
	{
		if (self.invisible_finished)
		{
			if ((self.tfstate & 64))
			{
				if ((self.invisible_finished < (time + enter)))
				{
					self.invisible_finished = (time + 666);
				}
			}
			if ((self.invisible_sound < time))
			{
				sound (self, 0, "items/inv3.wav", 0.5, 2);
				self.invisible_sound = (time + ((random () * 3) + 1));
			}
			if ((self.invisible_finished < (time + 3)))
			{
				if ((self.invisible_time == 1))
				{
					sprint (self, 2, "Ring of Shadows magic is fading\n");
					stuffcmd (self, "bf\n");
					sound (self, 0, "items/inv2.wav", 1, 1);
					self.invisible_time = (time + 1);
				}
				if ((self.invisible_time < time))
				{
					self.invisible_time = (time + 1);
					stuffcmd (self, "bf\n");
				}
			}
			if ((self.invisible_finished < time))
			{
				self.items = (self.items - 524288);
				self.invisible_finished = 0;
				self.invisible_time = 0;
			}
			self.frame = 0;
			self.modelindex = modelindex_eyes;
		}
		else
		{
			self.modelindex = modelindex_player;
		}
	}
	if (self.invincible_finished)
	{
		if ((self.tfstate & space))
		{
			if ((self.invincible_finished < (time + enter)))
			{
				self.invincible_finished = (time + 666);
			}
		}
		if ((self.invincible_finished < (time + 3)))
		{
			if ((self.invincible_time == 1))
			{
				sprint (self, 2, "Protection is almost burned out\n");
				stuffcmd (self, "bf\n");
				sound (self, 0, "items/protect2.wav", 1, 1);
				self.invincible_time = (time + 1);
			}
			if ((self.invincible_time < time))
			{
				self.invincible_time = (time + 1);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.invincible_finished < time))
		{
			self.items = (self.items - 1048576);
			self.invincible_time = 0;
			self.invincible_finished = 0;
		}
		if ((self.invincible_finished > time))
		{
			self.effects = (self.effects | 8);
			self.effects = (self.effects | 128);
		}
		else
		{
			lighton = 0;
			te = find (world, classname, "item_tfgoal");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.goal_activation & 1))
					{
						lighton = 1;
					}
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!lighton)
			{
				self.effects = (self.effects - (self.effects & 8));
				self.effects = (self.effects - (self.effects & space));
				self.effects = (self.effects - (self.effects & 128));
			}
		}
	}
	if (self.super_damage_finished)
	{
		if ((self.tfstate & 128))
		{
			if ((self.super_damage_finished == (time + enter)))
			{
				self.super_damage_finished = (time + 666);
			}
		}
		if ((self.super_damage_finished < (time + 3)))
		{
			if ((self.super_time == 1))
			{
				sprint (self, 2, "Quad Damage is wearing off\n");
				stuffcmd (self, "bf\n");
				sound (self, 0, "items/damage2.wav", 1, 1);
				self.super_time = (time + 1);
			}
			if ((self.super_time < time))
			{
				self.super_time = (time + 1);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.super_damage_finished < time))
		{
			self.items = (self.items - 4194304);
			self.super_damage_finished = 0;
			self.super_time = 0;
		}
		if ((self.super_damage_finished > time))
		{
			self.effects = (self.effects | 8);
			self.effects = (self.effects | 64);
		}
		else
		{
			lighton = 0;
			te = find (world, classname, "item_tfgoal");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.goal_activation & 1))
					{
						lighton = 1;
					}
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!lighton)
			{
				self.effects = (self.effects - (self.effects & 8));
				self.effects = (self.effects - (self.effects & 16));
				self.effects = (self.effects - (self.effects & 64));
			}
		}
	}
	if (self.radsuit_finished)
	{
		self.air_finished = (time + 12);
		if ((self.tfstate & 256))
		{
			if ((self.radsuit_finished == (time + enter)))
			{
				self.radsuit_finished = (time + 666);
			}
		}
		if ((self.radsuit_finished < (time + 3)))
		{
			if ((self.rad_time == 1))
			{
				sprint (self, 2, "Air supply in Biosuit expiring\n");
				stuffcmd (self, "bf\n");
				sound (self, 0, "items/suit2.wav", 1, 1);
				self.rad_time = (time + 1);
			}
			if ((self.rad_time < time))
			{
				self.rad_time = (time + 1);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.radsuit_finished < time))
		{
			self.items = (self.items - 2097152);
			self.rad_time = 0;
			self.radsuit_finished = 0;
		}
	}
};

void () Admin_Aliases =
{
	TeamFortress_Alias ("countplayers", 192, 0);
	TeamFortress_Alias ("deal", 189, 0);
	TeamFortress_Alias ("kick", 190, 0);
	TeamFortress_Alias ("next", 195, 0);
	TeamFortress_Alias ("ceasefire", 193, 0);
	TeamFortress_Alias ("listips", 198, 0);
	TeamFortress_Alias ("timedown", 200, 0);
	TeamFortress_Alias ("timeup", 201, 0);
	TeamFortress_Alias ("pmdown", 228, 0);
	TeamFortress_Alias ("pmup", 229, 0);
	TeamFortress_Alias ("cfdown", 96, 0);
	TeamFortress_Alias ("cfup", _a, 0);
	TeamFortress_Alias ("otdown", _b, 0);
	TeamFortress_Alias ("otup", _c, 0);
	TeamFortress_Alias ("startmatch", 202, 0);
	TeamFortress_Alias ("fragsdown", 204, 0);
	TeamFortress_Alias ("fragsup", 205, 0);
	TeamFortress_Alias ("tp", 206, 0);
	TeamFortress_Alias ("clan", 207, 0);
	TeamFortress_Alias ("restartmap", 208, 0);
	TeamFortress_Alias ("gspeed", 213, 0);
	TeamFortress_Alias ("silence", 214, 0);
	TeamFortress_Alias ("freeze", 215, 0);
	TeamFortress_Alias ("tfvsdm", 216, 0);
	TeamFortress_Alias ("flashlight", 217, 0);
	TeamFortress_Alias ("calibrate", 218, 0);
	TeamFortress_Alias ("reset", 220, 0);
	TeamFortress_Alias ("teamfrags", 221, 0);
	TeamFortress_Alias ("fullts", 222, 0);
	TeamFortress_Alias ("grapple", 223, 0);
	TeamFortress_Alias ("clansetup", 224, 0);
	TeamFortress_Alias ("fbskins", 225, 0);
	TeamFortress_Alias ("enemy", 226, 0);
	TeamFortress_Alias ("pointing", 227, 0);
	TeamFortress_Alias ("grenpack", 233, 0);
	TeamFortress_Alias ("gibs", 230, 0);
	TeamFortress_Alias ("highlander", 231, 0);
	TeamFortress_Alias ("sgtype", 232, 0);
	TeamFortress_Alias ("sgfire", 191, 0);
	TeamFortress_Alias ("pipedelay", 234, 0);
	TeamFortress_Alias ("soliddet", 235, 0);
	TeamFortress_Alias ("flag_model", 236, 0);
	TeamFortress_Alias ("frjump", 238, 0);
	TeamFortress_Alias ("adminmenu", 239, 0);
	TeamFortress_Alias ("rounds", _O, 0);
	TeamFortress_Alias ("duel", _P, 0);
	TeamFortress_Alias ("speedcap", _Q, 0);
	TeamFortress_Alias ("practice", 94, 0);
	TeamFortress_Alias ("tfstrike", _N, 0);
	self.get_admin_aliases = 0;
};

void () PlayerPostThink =
{
	local float g;
	local float speedpos;
	local float speedneg;
	local float fdmg;

        if (BotPostFrame ())
        {
                return;
        }

	if ((self.motd <= _A))
	{
		TeamFortress_MOTD ();
	}
	else
	{
		if (((time > self.StatusRefreshTime) && (self.StatusBarSize != 0)))
		{
			RefreshStatusBar ();
		}
		if (self.is_admin)
		{
			if (self.get_admin_aliases)
			{
				Admin_Aliases ();
			}
		}
	}
	if ((self.view_ofs == '0 0 0'))
	{
		return;
	}
	if (self.deadflag)
	{
		if ((self.impulse && !self.has_disconnected))
		{
			if (DeadImpulses ())
			{
				return;
			}
			CommandImpulses ();
			self.impulse = 0;
		}
		self.movetype = 6;
		return;
	}
	if (self.playerclass)
	{
		WaterMove ();
		if ((self.flags & 512))
		{
			if ((gspeed >= 1))
			{
				speedpos = (0 + (self.maxspeed * gspeed));
				speedneg = (0 - (self.maxspeed * gspeed));
				if ((self.velocity_y > speedpos))
				{
					self.velocity_y = speedpos;
				}
				if ((self.velocity_y < speedneg))
				{
					self.velocity_y = speedneg;
				}
				if ((self.velocity_x > speedpos))
				{
					self.velocity_x = speedpos;
				}
				if ((self.velocity_x < speedneg))
				{
					self.velocity_x = speedneg;
				}
			}
			if (((self.jump_flag < -300) && (self.health > 0)))
			{
				if ((self.watertype == -3))
				{
					sound (self, 4, "player/h2ojump.wav", 1, 1);
				}
				else
				{
					if ((self.jump_flag < -650))
					{
						if ((infokey (world, "fallbunny") != "off"))
						{
							fdmg = 5;
							fdmg = ((fdmg * (self.jump_flag / 300)) * -1);
							if ((self.playerclass == 1))
							{
								fdmg = (fdmg / 2);
							}
							else
							{
								if ((self.playerclass == 6))
								{
									fdmg = (fdmg * 1.5);
								}
							}
							fdmg = rint (fdmg);
							TF_T_Damage (self, world, world, fdmg, 1, 0);
							self.deathtype = "falling";
						}
						sound (self, 2, "player/land2.wav", 1, 1);
					}
					else
					{
						sound (self, 2, "player/land.wav", 1, 1);
					}
				}
			}
		}
	}
	else
	{
		if ((self.impulse == 171))
		{
			UseSpecialSkill ();
			self.impulse = 0;
		}
		if (!clanbattle)
		{
			Check_Track ();
		}
	}
	self.jump_flag = self.velocity_z;
	CheckPowerups ();
	W_WeaponFrame ();
	if ((self.cheat_check <= time) && (!captainmode))
	{
		TeamFortress_CheckTeamCheats ();
		self.cheat_check = (time + 2);
	}
};

void (string cl_pwd) Admin_Check =
{
	local string st2;

	st2 = infokey (world, "adminpwd");
	if ((cl_pwd != string_null))
	{
		stuffcmd (self, "setinfo adminpwd \"");
		stuffcmd (self, "\"\n");
		if (((st2 != string_null) && (cl_pwd == st2)))
		{
			self.is_admin = 3;
		}
	}
};

void () ClientConnect =
{
	local entity te;
	local string st;
	local string st2;
	local float res;

	ClientInRankings();

	st = infokey (self, "*FuhQuake");
	if ((st == string_null))
	{
		st = infokey (self, "*client");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*z_ver");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*z_version");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*ver");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*prov");
	}

	st2 = infokey (world, "ban_oldclient");
	res = stof (st2);
	if ((st != string_null))
	{
		dprint ("Client version: ");
		dprint (st);
		dprint ("\n");
		if ((res == 2))
		{
			if (((((st != "0.26") && (st != "0.27")) && (st != "0.28")) && (st != "GryMQ 0.11")))
			{
				sprint (self, 2, "Client Version Illegal!\nPlease update your client to the latest FuhQuake || GreyMQuake clients.\n\n");
				sprint (self, 2, "FuhQuake client available at http://www.fuhquake.net/\n");
				sprint (self, 2, "GreyMQuake client available at http://qwtf.ausfortress.com/greymquake/\n\n");
				stuffcmd (self, "disconnect\n");
				stuffcmd (self, "cmd drop\n");
				return;
			}
		}
	}
	else
	{
		if ((res == 1))
		{
			sprint (self, 2, "Client Version Unknown. Please update your client.\n");
			stuffcmd (self, "disconnect\n");
			return;
		}
		if ((res == 2))
		{
			sprint (self, 2, "Client Version Illegal!\nPlease update your client to the latest FuhQuake || GreyMQuake clients.\n\n");
			sprint (self, 2, "FuhQuake client available at http://www.fuhquake.net/\n");
			sprint (self, 2, "GreyMQuake client available at http://qwtf.ausfortress.com/greymquake/\n\n");
			stuffcmd (self, "disconnect\n");
			stuffcmd (self, "cmd drop\n");
			return;
		}
	}
	bprint (2, self.netname);
	bprint (2, " entered the game\n");
	stuffcmd (self, "say -d\n");

	if ((0 == 0))
	{
		self.tfstate = (self.tfstate | 4096);
	}
	self.motd = 0;
	self.get_aliases = 1;
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}

	TeamFortress_Alias ("id", 185, 0);
	st = infokey (self, "tfk");
	if ((st != string_null))
	{
		self.tfkey = stof (st);
	}
	st = infokey (self, "sbr");
	if ((st == string_null))
	{
		st = infokey (self, "sbar_res");
	}
	res = stof (st);
	if ((res == 768))
	{
		self.StatusBarRes = SBAR_768;
	}
	else
	{
		if ((res == 600))
		{
			self.StatusBarRes = SBAR_600;
		}
		else
		{
			if ((res == 480))
			{
				self.StatusBarRes = SBAR_480;
			}
			else
			{
				if ((res == 400))
				{
					self.StatusBarRes = SBAR_400;
				}
				else
				{
					if ((res == 384))
					{
						self.StatusBarRes = SBAR_384;
					}
					else
					{
						if ((res == 350))
						{
							self.StatusBarRes = SBAR_350;
						}
						else
						{
							if ((res == 300))
							{
								self.StatusBarRes = SBAR_300;
							}
							else
							{
								if ((res == 240))
								{
									self.StatusBarRes = SBAR_240;
								}
								else
								{
									if ((res == 200))
									{
										self.StatusBarRes = SBAR_200;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	st = infokey (self, "sbs");
	if ((st == string_null))
	{
		st = infokey (self, "sbar_size");
	}
	self.StatusBarSize = stof (st);
	if (((self.StatusBarSize > enter) || (self.StatusBarSize < 1)))
	{
		if ((self.tfkey & 8))
		{
			self.StatusBarSize = 3;
		}
		else
		{
			self.StatusBarSize = 0;
		}
	}
	CheckConnectRate ();
	TeamFortress_ExecMapScript (self);
	self.has_disconnected = 0;
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}
	if (intermission_running)
	{
		GotoNextMap ();
	}
	st = infokey (self, "adminpwd");
	Admin_Check (st);
	if (self.is_admin)
	{
		self.get_admin_aliases = 1;
	}
	if (cb_prematch)
	{
		sprint (self, 2, "CURRENTLY IN PREMATCH TIME\n");
	}

};

void () ClientDisconnect =
{

        if (self.ishuman)
        {
                clientSetFree (self.fClientNo);
        }

	local entity te;
	local string st;
	local float fr;

	fr = rint (self.frags);
	st = ftos (fr);
	bprint4 (2, self.netname, " left the game with ", st, " frags\n");

	if (self.captain > 0 && self.captain < 5) {
		disableCaptain();
	}

	sound (self, 4, "player/tornoff2.wav", 1, 0);

	self.has_disconnected = 1;
	TeamFortress_RemoveTimers ();
	RemoveVotes ();
	Engineer_RemoveBuildings (self);

	if (!tfstrike)
	{
		te = find (world, classname, "detpack");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((te.weaponmode == 1))
				{
					TeamFortress_SetSpeed (te.enemy);
					dremove (te.oldenemy);
					dremove (te.observer_list);
				}
				dremove (te);
				te = world;
			}
			te = find (te, classname, "detpack");
		}
	}
	else
	{
		if (self.is_detpacking)
		{
			self.ammo_detpack = 1;
		}
		Drop_detpack ();
	}
	set_suicide_frame ();
	self.netname = string_null;
	self.team_no = 0;
	self.infection_team_no = 0;
	self.solid = 0;
	self.is_building = 0;
	self.is_detpacking = 0;
	self.is_undercover = 0;
	self.is_feigning = 0;
	self.is_unabletospy = 0;
	self.ammo_medikit = 0;
	self.maxammo_medikit = 0;
	self.ammo_detpack = 0;
	self.maxammo_detpack = 0;
	self.items_allowed = 0;
	self.armor_allowed = 0;
	self.maxarmor = 0;
	self.weaponmode = 0;
	self.respawn_time = 0;
	self.heat = 0;
	self.ammo_rockets = 0;
	self.ammo_nails = 0;
	self.ammo_shells = 0;
	self.ammo_cells = 0;
	self.maxammo_rockets = 0;
	self.maxammo_nails = 0;
	self.maxammo_shells = 0;
	self.maxammo_cells = 0;
	self.no_grenades_1 = 0;
	self.no_grenades_2 = 0;
	self.tp_grenades_1 = 0;
	self.tp_grenades_2 = 0;
	self.tf_items = 0;
	self.ScannerOn = 0;
	self.armorclass = 0;
	self.armortype = 0;
	self.armorvalue = 0;
	self.current_weapon = 0;
	self.items = 0;
	self.weapons_carried = 0;
	self.touch = SUB_Null;
	self.classname = string_null;
	self.health = 0;
	self.movetype = 0;
	self.show_hostile = 0;
	self.max_health = 0;
	self.flags = 0;
	self.air_finished = 0;
	self.dmg = 0;
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.invisible_finished = 0;
	self.invincible_finished = 0;
	self.effects = 0;
	self.invincible_time = 0;
	self.reload_shotgun = 0;
	self.reload_super_shotgun = 0;
	self.reload_grenade_launcher = 0;
	self.reload_rocket_launcher = 0;
    self.reload_sniper_rifle = 0;
	self.on_hook = 0;
	self.hook_out = 0;
	self.fire_held_down = 0;
	self.mapcount = 0;
	self.motd = 0;
	self.menu_count = 0;
	self.menu_displaytime = 0;
	self.current_menu = 0;
	self.tfstate = 0;
	self.cheat_check = 0;
	self.maxspeed = 0;
	self.attack_finished = 0;
	self.gravity = 0;
	self.walkframe = 0;
	self.frame = 0;
	self.watertype = 0;
	self.colormap = 0;
	self.skin = 0;
	self.weapon = 0;
	self.weaponmodel = string_null;
	self.pain_finished = 0;
	self.playerclass = 0;
	self.has_dispenser = 0;
	self.has_sentry = 0;
	self.deaths = 0;
	self.real_frags = 0;
	self.teamkills = 0;
	self.last_weaponmode = 0;
	self.heat = 0;
	self.immune_to_check = 0;
	self.last_sound = 0;
	self.on_hook = 0;
	self.fire_held_down = 0;
	self.StatusRefreshTime = 0;
	self.StatusBarSize = 0;
	self.StatusBarRes = 0;
	self.currentammo = 0;
	self.takedamage = 0;
	self.dmg_inflicted = 0;
	self.dmg_recieved = 0;
	self.dmg_self = 0;
	self.dmg_team = 0;
	self.vote = 0;
	self.bvote = 0;
	self.is_admin = 0;
	self.admin_mode = 0;
	self.velocity = '0 0 0';
	self.angles = '0 0 0';
	self.avelocity = '0 0 0';
	self.origin = '0 0 0';
	self.v_angle = '0 0 0';
	self.view_ofs = '0 0 0';
	self.absmin = '0 0 0';
	self.absmax = '0 0 0';
	self.noise = string_null;
	self.th_pain = SUB_Null;
	self.th_die = SUB_Null;
	setsize (self, '0 0 0', '0 0 0');
	self.nextthink = 0;
	self.think = SUB_Null;

	updateMaxClients();
};

string (entity pe_target, entity pe_attacker, float pf_deathmsg) GetDeathMessage = {
    local string s_deathstring = "", s_deathstring2 = "\n";
    local float rnum;

    rnum = random();

    if (pe_target.classname == "player") {
        if (pe_attacker.classname == "teledeath2") {
            return strcat("Satan's power deflects ",
                    strcat(pe_target.netname, "'s telefrag\n"));
        }
        if (pe_attacker.classname == "teledeath") {
            return strcat(pe_target.netname,
                    strcat(" was telefragged by ",
                    strcat(pe_attacker.owner.netname, "\n")));
        }
        if (pf_deathmsg == 37) {
            return strcat(pe_attacker.netname, " shoots his teammate one too many times\n");
        }
        if (pe_attacker.classname == "player" || pe_attacker.classname == "bot") {
            if (pe_target == pe_attacker) {

                if (pf_deathmsg == DMSG_GREN_HAND) {

                    if (pe_target.playerclass == PC_SNIPER)
                        s_deathstring = " got splattered by his own grenade\n";
                    else if (pe_target.playerclass == PC_SOLDIER)
                        s_deathstring = " sat on his own grenade\n";
                    else if (pe_target.playerclass == PC_DEMOMAN)
                        s_deathstring = " got to know his grenade too well\n";
                    else if (pe_target.playerclass == PC_MEDIC)
                        s_deathstring = " caught the end of his own grenade\n";
                    else if (pe_target.playerclass == PC_HVYWEAP)
                        s_deathstring = " got too close to his own grenade\n";
                    else if (pe_target.playerclass == PC_PYRO)
                        s_deathstring = " let his own grenade get the best of him\n";
                    else if (pe_target.playerclass == PC_SPY)
                        s_deathstring = " tiptoed over his own grenade\n";
                    else if (pe_target.playerclass == PC_ENGINEER)
                        s_deathstring = " stared at his grenade too long\n";
                    else
                        s_deathstring = " grenades himself\n";

                    return strcat(pe_target.netname, s_deathstring);

                } else if (pf_deathmsg == DMSG_GREN_NAIL) {

                    return strcat(pe_target.netname, " hammers himself\n");

                } else if (pf_deathmsg == DMSG_GREN_MIRV) {

                    if (pe_target.playerclass == PC_DEMOMAN)
                        s_deathstring = " practiced his own Mirv dance\n";
                    else if (pe_target.playerclass == PC_HVYWEAP)
                        s_deathstring = " allowed his Mirv to turn against him\n";
                    else
                        s_deathstring = " goes to pieces\n";

                    return strcat(pe_target.netname, s_deathstring);

                } else if (pf_deathmsg == DMSG_GREN_PIPE) {

                    return strcat(pe_target.netname, " ambushes himself with his own pipebombs\n");

                }

                else if (pf_deathmsg == 40)
                    s_deathstring = " tried to juggle his own pipebombs\n";
                else if (pf_deathmsg == DMSG_GREN_GAS)
                    s_deathstring = " chokes on his own gas\n";
                else if (pf_deathmsg == DMSG_GREN_EMP)
                    s_deathstring = " explodes his ammo and body\n";
                else if (pf_deathmsg == 41)
                    s_deathstring = " stepped on too many of his own caltrops\n";
                else if (pf_deathmsg == DMSG_GREN_FLASH)
                    s_deathstring = " is charred by his own flash grenade\n";
                else if (pf_deathmsg == DMSG_GREN_EMP_AMMO)
                    s_deathstring = " detonates an ammo box too close to him\n";
                else if (pf_deathmsg == DMSG_DETPACK)
                    s_deathstring = " set the detpack and forgot to run\n";
                else if (pf_deathmsg == DMSG_BIOWEAPON)
                    s_deathstring = " died impossibly!\n";
                else if (pf_deathmsg == DMSG_ROCKETL) {
                    if (rnum)
                        s_deathstring = " becomes bored with life\n";
                    else
                        s_deathstring = " checks if his weapon is loaded\n";
                } else if (pf_deathmsg == DMSG_INCENDIARY)
                    s_deathstring = " chars himself with an incendiary rocket\n";
                else if (pf_deathmsg == DMSG_GRENADEL)
                    s_deathstring = " tries to put the pin back in\n";
                else if (pf_deathmsg == DMSG_FLAME)
                    s_deathstring = " torches himself\n";
                else if (pf_deathmsg == DMSG_LIGHTNING && pe_target.waterlevel > 1)
                    s_deathstring = " discharges into the water\n";
                else if (pf_deathmsg == 38)
                    s_deathstring = " gets too friendly with his sentry gun\n";
                else if (pf_deathmsg == 39)
                    s_deathstring = " dispenses with himself\n";

                return strcat(pe_target.netname, s_deathstring);

            } else if ((teamplay && (pe_attacker.team_no == pe_target.team_no)) && (pe_attacker.team_no > 0)) {

                if (rnum < 0.25)
                    s_deathstring = " mows down teammate ";
                else if (rnum < 0.5)
                    s_deathstring = " checks his glasses after killing ";
                else if (rnum < 0.75) {
                    s_deathstring = " gets a frag for the other team with ";
                    s_deathstring2 = "'s death\n";
                } else
                    s_deathstring = " killed his supposed friend ";

                if (pf_deathmsg == DMSG_MEDIKIT)
                    return strcat(pe_target.netname,
                            strcat(" didn't survive the operation by ",
                            strcat(pe_attacker.netname, "\n")));

                return strcat(pe_attacker.netname,
                        strcat(s_deathstring,
                        strcat(pe_target.netname, s_deathstring2)));

            } else {

                if (pf_deathmsg == DMSG_GREN_HAND) {
                    if (pe_attacker.playerclass == PC_SNIPER) {
                        s_deathstring = " got up-close and personal with ";
                        s_deathstring2 = "'s grenade\n";
                    } else if (pe_attacker.playerclass == PC_SOLDIER) {
                        s_deathstring = " played catch with ";
                        s_deathstring2 = "'s grenade\n";
                    } else if (pe_attacker.playerclass == PC_DEMOMAN) {
                        s_deathstring = " received a pineapple enema from ";
                        s_deathstring2 = "\n";
                    } else if (pe_attacker.playerclass == PC_MEDIC) {
                        s_deathstring = " fetched ";
                        s_deathstring2 = "'s pineapple\n";
                    } else if (pe_attacker.playerclass == PC_HVYWEAP) {
                        s_deathstring = " caught too much shrapnel from ";
                        s_deathstring2 = "'s grenade\n";
                    } else if (pe_attacker.playerclass == PC_PYRO) {
                        s_deathstring = " tried to pick up ";
                        s_deathstring2 = "'s hot potato\n";
                    } else if (pe_attacker.playerclass == PC_SPY) {
                        s_deathstring = " thought ";
                        s_deathstring2 = " was tossing him a spare grenade\n";
                    } else if (pe_attacker.playerclass == PC_ENGINEER) {
                        s_deathstring = " stops to ponder the technical details of ";
                        s_deathstring2 = "'s grenade\n";
                    } else {
                        s_deathstring = " surfs on a grenade from ";
                        s_deathstring2 = "\n";
                    }

                } else if (pf_deathmsg == DMSG_GREN_NAIL) {
                    s_deathstring = " gets flayed by ";
                    s_deathstring2 = "'s nail grenade\n";
                } else if (pf_deathmsg == DMSG_GREN_MIRV) {
                    if (pe_attacker.playerclass == PC_DEMOMAN) {
                        s_deathstring = " does a dance on ";
                        s_deathstring2 = "'s Mirv grenade\n";
                    } else {
                        s_deathstring = " gets spammed by ";
                        s_deathstring2 = "'s Mirv grenade\n";
                    }
                } else if (pf_deathmsg == DMSG_GREN_PIPE) {
                    s_deathstring = " is caught by ";
                    s_deathstring2 = "'s pipebomb trap\n";
                } else if (pf_deathmsg == 40) {
                    s_deathstring = " fell victim to ";
                    s_deathstring2 = "'s fireworks\n";
                } else if (pf_deathmsg == DMSG_GREN_GAS) {
                    s_deathstring = " gags on ";
                    s_deathstring2 = "'s noxious gasses\n";
                } else if (pf_deathmsg == DMSG_GREN_EMP) {
                    s_deathstring = "'s ammo detonates him as ";
                    s_deathstring2 = "'s EMP fries it\n";
                } else if (pf_deathmsg == 41) {
                    s_deathstring = " stepped on too many of ";
                    s_deathstring2 = "'s caltrops\n";
                } else if (pf_deathmsg == DMSG_GREN_FLASH) {
                    s_deathstring = " is charred by ";
                    s_deathstring2 = "'s flash grenade\n";
                } else if (pf_deathmsg == DMSG_GREN_EMP_AMMO) {
                    s_deathstring = " stands near some ammo as ";
                    s_deathstring2 = "'s EMP nukes it\n";
                } else if (pf_deathmsg == DMSG_DETPACK) {
                    s_deathstring = " reaches orbit via ";
                    s_deathstring2 = "'s detpack\n";
                } else if (pf_deathmsg == DMSG_DETPACK_DIS) {
                    s_deathstring = " cut the red wire of ";
                    s_deathstring2 = "'s detpack\n";
                } else if (pf_deathmsg == DMSG_BIOWEAPON) {
                    s_deathstring = " dies from ";
                    s_deathstring2 = "'s mysterious tropical disease\n";
                } else if (pf_deathmsg == DMSG_BIOWEAPON_ATT) {
                    s_deathstring = " escapes infection from ";
                    s_deathstring2 = " by dying first\n";
                } else if (pf_deathmsg == DMSG_GRENADEL) {
                    s_deathstring = " eats ";
                    s_deathstring2 = "'s pineapple\n";
                    if (pe_target.health < -40) {
                        s_deathstring = " was gibbed by ";
                        s_deathstring2 = "'s grenade\n";
                    }
                } else if (pf_deathmsg == DMSG_ROCKETL) {
                    s_deathstring = " rides ";
                    s_deathstring2 = "'s rocket\n";
                    if (pe_target.health < -40) {
                        s_deathstring = " was gibbed by ";
                        s_deathstring2 = "'s rocket\n";
                    }
                } else if (pf_deathmsg == DMSG_FLAME) {
                    if (rnum < 0.2) {
                        s_deathstring = " is burnt up by ";
                        s_deathstring2 = "'s flame\n";
                    } else if (rnum < 0.4) {
                        s_deathstring = " is fried by ";
                        s_deathstring2 = "'s fire\n";
                    } else if (rnum < 0.6) {
                        s_deathstring = " feels ";
                        s_deathstring2 = "'s fire of wrath\n";
                    } else if (rnum < 0.8) {
                        s_deathstring = " is reduced to ashes by ";
                        s_deathstring2 = "\n";
                    } else {
                        s_deathstring = " is grilled by ";
                        s_deathstring2 = "'s flame\n";
                    }
                } else if (pf_deathmsg == DMSG_AXE) {
                    s_deathstring2 = "\n";
                    if (pe_attacker.playerclass == PC_SPY)
                        s_deathstring = " was knife-murdered by ";
                    else if (pe_attacker.playerclass == PC_SCOUT)
                        s_deathstring = "'s mellon was split by ";
                    else if (pe_attacker.playerclass == PC_SNIPER)
                        s_deathstring = " was put on the chop block by ";
                    else if (pe_attacker.playerclass == PC_SOLDIER) {
                        s_deathstring = " was sliced and diced by ";
                        s_deathstring2 = "'s blade\n";
                    } else if (pe_attacker.playerclass == PC_DEMOMAN) {
                        s_deathstring = " is split from crotch to sternum by ";
                        s_deathstring2 = "'s axe swing\n";
                    } else if (pe_attacker.playerclass == PC_HVYWEAP)
                        s_deathstring = " is split in two with a powerful axe blow from ";
                    else if (pe_attacker.playerclass == PC_PYRO) {
                        s_deathstring = "'s death put another notch on ";
                        s_deathstring2 = "'s axe\n";
                    } else
                        s_deathstring = " was ax-murdered by ";
                } else if (pf_deathmsg == DMSG_SPANNER) {
                    s_deathstring = " was spanner-murdered by ";
                    s_deathstring2 = "\n";
                } else if (pf_deathmsg == DMSG_SHOTGUN) {
                    if (pe_attacker.playerclass == PC_SCOUT) {
                        s_deathstring = " got too close to ";
                        s_deathstring2 = "'s muzzleflash\n";
                    } else if (pe_attacker.playerclass == PC_SOLDIER) {
                        s_deathstring = " practices being ";
                        s_deathstring2 = "'s clay pigeon\n";
                    } else if (pe_attacker.playerclass == PC_DEMOMAN) {
                        s_deathstring = " was on the receiving end of ";
                        s_deathstring2 = "'s shotgun barrel\n";
                    } else if (pe_attacker.playerclass == PC_MEDIC) {
                        s_deathstring = " was fed a lead diet by ";
                        s_deathstring2 = "\n";
                    } else if (pe_attacker.playerclass == PC_HVYWEAP) {
                        s_deathstring = " got blasted by ";
                        s_deathstring2 = "'s last resort\n";
                    } else if (pe_attacker.playerclass == PC_PYRO) {
                        s_deathstring = " got more than a powderburn from ";
                        s_deathstring2 = "'s shotgun blast\n";
                    } else {
                        s_deathstring = " chewed on ";
                        s_deathstring2 = "'s boomstick\n";
                    }
                } else if (pf_deathmsg == DMSG_SSHOTGUN) {
                    if (pe_attacker.playerclass == PC_SOLDIER) {
                        s_deathstring = " was turned into swiss cheese by ";
                        s_deathstring2 = "'s buckshot\n";
                    } else if (pe_attacker.playerclass == PC_MEDIC) {
                        s_deathstring = " got a double-dose of ";
                        s_deathstring2 = "'s buckshot\n";
                    } else if (pe_attacker.playerclass == PC_HVYWEAP) {
                        s_deathstring = " unfortunately forgot ";
                        s_deathstring2 = " carried a super-shotgun\n";
                    } else if (pe_attacker.playerclass == PC_SPY) {
                        s_deathstring = " gets ventilated by ";
                        s_deathstring2 = "'s super-shotgun blast\n";
                    } else if (pe_attacker.playerclass == PC_ENGINEER) {
                        s_deathstring = "'s body got chuck full of ";
                        s_deathstring2 = "'s lead pellets\n";
                    } else {
                        s_deathstring = " ate 2 loads of ";
                        s_deathstring2 = "'s buckshot\n";
                    }
                } else if (pf_deathmsg == DMSG_NAILGUN) {
                    if (pe_attacker.playerclass == PC_SCOUT) {
                        s_deathstring = " caught one too many nails from ";
                        s_deathstring2 = "\n";
                    } else if (pe_attacker.playerclass == PC_SNIPER) {
                        s_deathstring = " ran into ";
                        s_deathstring2 = "'s nails\n";
                    } else if (pe_attacker.playerclass == PC_SPY) {
                        s_deathstring = " was turned into ";
                        s_deathstring2 = "'s pin-cushion\n";
                    } else {
                        s_deathstring = " was nailed by ";
                        s_deathstring2 = "\n";
                    }
                } else if (pf_deathmsg == DMSG_SNAILGUN) {
                    s_deathstring = " was punctured by ";
                    s_deathstring2 = "\n";
                } else if (pf_deathmsg == DMSG_LIGHTNING) {
                    s_deathstring = " accepts ";
                    if (pe_attacker.waterlevel > 1)
                        s_deathstring2 = "'s discharge\n";
                    else
                        s_deathstring2 = "'s shaft\n";
                } else if (pf_deathmsg == DMSG_SNIPERRIFLE) {
                    if (rnum <= 0.3) {
                        s_deathstring = " takes a bullet in the chest from ";
                        s_deathstring2 = "\n";
                    } else {
                        s_deathstring = " succumbs to sniperfire from ";
                        s_deathstring2 = "\n";
                    }
                } else if (pf_deathmsg == DMSG_SNIPERHEADSHOT) {
                    if (rnum <= 0.5) {
                        s_deathstring = " gets a third eye from ";
                        s_deathstring2 = "\n";
                    } else {
                        s_deathstring = " gets his head blown off by ";
                        s_deathstring2 = "\n";
                    }
                } else if (pf_deathmsg == DMSG_SNIPERLEGSHOT) {
                    if (rnum <= 0.5) {
                        s_deathstring = " is made legless by ";
                        s_deathstring2 = "\n";
                    } else {
                        s_deathstring = " gets his legs blown off by ";
                        s_deathstring2 = "\n";
                    }
                } else if (pf_deathmsg == DMSG_AUTORIFLE) {
                    s_deathstring = " collects ";
                    s_deathstring2 = "'s bullet spray.\n";
                } else if (pf_deathmsg == DMSG_ASSAULTCANNON) {
                    s_deathstring = " gets sawn in half by ";
                    s_deathstring2 = "\n";
                } else if (pf_deathmsg == DMSG_BACKSTAB) {
                    s_deathstring = " gets knifed from behind by ";
                    s_deathstring2 = "\n";
                } else if (pf_deathmsg == DMSG_TRANQ) {
                    s_deathstring = " is put to sleep by ";
                    s_deathstring2 = "\n";
                } else if (pf_deathmsg == DMSG_LASERBOLT) {
                    s_deathstring = " gets a hole in his heart from ";
                    s_deathstring2 = "'s railgun\n";
                } else if (pf_deathmsg == DMSG_INCENDIARY) {
                    s_deathstring = " gets well done by ";
                    s_deathstring2 = "'s incendiary rocket\n";
                } else if (pf_deathmsg == 38) {
                    s_deathstring = " gets destroyed by ";
                    s_deathstring2 = "'s exploding sentrygun\n";
                } else if (pf_deathmsg == 39) {
                    s_deathstring = " didn't insert the correct change into ";
                    s_deathstring2 = "'s dispenser.\n";
                }

                if (pe_attacker.has_disconnected == 1 || pe_attacker.netname == string_null) {
                    s_deathstring = " died.";
                    s_deathstring2 = "\n";
                }

                return strcat(pe_target.netname,
                        strcat(s_deathstring,
                        strcat(pe_attacker.netname, s_deathstring2)));

            }

        } else if (pe_attacker.classname == "building_sentrygun") {

            if (pe_target == pe_attacker.real_owner) {

                if (pf_deathmsg == DMSG_SENTRYGUN_ROCKET)
                    s_deathstring = " intercepts his sentry gun's rocket\n";
                else if (pf_deathmsg == DMSG_SENTRYGUN_BULLET)
                    s_deathstring = " crossed his sentry gun's line of fire\n";

                return strcat(pe_target.netname, s_deathstring);

            } else if ((teamplay && (pe_attacker.team_no == pe_target.team_no)) && (pe_attacker.team_no > 0)) {

                return strcat(pe_target.netname, " obstructs his team's sentry gun\n");

            } else {

                if (pf_deathmsg == DMSG_SENTRYGUN_ROCKET) {
                    s_deathstring = " hates ";
                    s_deathstring2 = "'s sentry gun\n";
                } else if (pf_deathmsg == DMSG_SENTRYGUN_BULLET) {
                    s_deathstring = " is mown down by ";
                    s_deathstring2 = "'s sentry gun\n";
                }

                return strcat(pe_target.netname,
                        strcat(s_deathstring,
                        strcat(pe_attacker.real_owner.netname, s_deathstring2)));

            }

        } else {

            rnum = pe_target.watertype;

            if (rnum == -3) {
                if (random() < 0.5)
                    s_deathstring = " sleeps with the fishes\n";
                else
                    s_deathstring = " sucks it down\n";
            } else if (rnum == -4) {
                if (random() < 0.5)
                    s_deathstring = " gulped a load of slime\n";
                else
                    s_deathstring = " can't exist on slime alone\n";
            } else if (rnum == -5) {
                if (pe_target.health < -15)
                    s_deathstring = " burst into flames\n";
                else if (random() < 0.5)
                    s_deathstring = " turned into hot slag\n";
                else
                    s_deathstring = " visits the Volcano God\n";
            } else if (pe_attacker.classname == "explo_box")
                s_deathstring = " blew up\n";
            else if ((pe_attacker.solid == SOLID_BSP) && (pe_attacker != world))
                s_deathstring = " was squished\n";
            else if (pe_target.deathtype == "falling") {
                s_deathstring = " fell to his death\n";
            } else if ((pe_attacker.classname == "trap_shooter")
                       || (pe_attacker.classname == "trap_spikeshooter"))
                s_deathstring = " was spiked\n";
            else if (pe_attacker.classname == "fireball")
                s_deathstring = " ate a lavaball\n";
            else if (pe_attacker.classname == "trigger_changelevel")
                s_deathstring = " tried to leave\n";
            else
                s_deathstring = " died\n";

            return strcat(pe_target.netname, s_deathstring);

        }

    } else if (pe_target.classname == "building_sentrygun") {

        if (pe_attacker.classname == "teledeath") {
            return strcat(pe_target.real_owner.netname,
                    strcat("'s sentrygun was telefragged by ",
                    strcat(pe_attacker.owner.netname, "\n")));
        }
        if (pe_attacker.classname == "player") {
            if (pe_attacker == pe_target.real_owner) {
                return strcat(pe_target.real_owner.netname, " destroys his sentrygun\n");
            }
            return strcat(pe_target.real_owner.netname,
                    strcat("'s sentrygun was destroyed by ",
                    strcat(pe_attacker.netname, "\n")));
        }

    }

    return "";
};

void (entity targ, entity attacker) ClientObituary = {
    local string deathstring;

    //Sniper_ZoomReset(targ);

    if (cb_prematch) {
		return;
	}

    deathstring = GetDeathMessage(targ, attacker, deathmsg);
    bprint(PRINT_MEDIUM, deathstring);

    if (targ.classname == "player") {
        if (attacker.classname == "teledeath") {

            if (attacker.owner.team_no != targ.team_no || attacker.owner.team_no < 1)
                TF_AddFrags(attacker.owner, 1);

        }
        if (attacker.classname == "teledeath2") {

            TF_AddFrags(targ, -1);
            logfrag(targ, targ);

        }
        if (attacker.classname == "info_tfgoal" || attacker.classname == "item_tfgoal") {

            if (attacker.deathtype != "")
                bprint(PRINT_MEDIUM, targ.netname, attacker.deathtype);

            logfrag(targ, targ);

        }
        if (attacker.classname == "player" || attacker.classname == "bot") {

            if (targ == attacker) {

                // killed self
                TF_AddFrags(attacker, -1);
                return;

            } else if ((teamplay && attacker.team_no == targ.team_no) && attacker.team_no > 0) {

                // killed a team member
                TF_AddFrags(attacker, -1);

                if (targ.undercover_team == 0)
                    attacker.teamkills = attacker.teamkills + 1;

                CheckAutoKick(attacker);
                return;

            } else {

                TF_AddFrags(attacker, 1);
                logfrag(attacker, targ);

            }

        } else if (attacker.classname == "building_sentrygun") {

            if (targ != attacker.real_owner) {

                TF_AddFrags(attacker.real_owner, 1);
                logfrag(attacker.real_owner, targ);

            }

        } else {

            logfrag(targ, targ);
            TF_AddFrags(targ, -1);

        }

    } else if (targ.classname == "building_sentrygun") {

        if (attacker.team_no > 0 && attacker.team_no == targ.real_owner.team_no) {

            TF_AddFrags(attacker, -1);
            attacker.teamkills = attacker.teamkills + 1;
            CheckAutoKick(attacker);

        } else {

            TF_AddFrags(attacker, 1);

        }

    } else if (targ.classname == "building_dispenser") {

        if (attacker.team_no > 0 && attacker.team_no == targ.real_owner.team_no) {
            TF_AddFrags(attacker, -1);
            attacker.teamkills = attacker.teamkills + 1;
            CheckAutoKick(attacker);
        }

    }

};
