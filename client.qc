//=-=-=-=-=
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
void (entity eng) Engineer_RemoveBuildings;
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
					sprint2 (p, AS_MELEE, tmp, "\n");
					stuffcmd (p, "rate ");
					stuffcmd (p, tmp);
					stuffcmd (p, "\n");
				}
				if (((player_rate < minrate) && (minrate < maxrate)))
				{
					sprint (p, 2, "\nYour עבפו setting is too low for this server.\n");
					tmp = ftos (minrate);
					sprint (p, 2, "Rate set to ");
					sprint2 (p, AS_MELEE, tmp, "\n");
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


         if (self.netname == "lunga") {
            stuffcmd (self,"name tang\n");
            stuffcmd (self,"\n");
         }


	if ((maxrate || minrate))
	{
		if (((player_rate > maxrate) && (maxrate != 0)))
		{
			sprint (self, 2, "\nYour עבפו setting is too high for this server.\n");
			tmp = ftos (maxrate);
			sprint (self, 2, "Rate set to ");
			sprint2 (self, AS_MELEE, tmp, "\n");
			stuffcmd (self, "rate ");
			stuffcmd (self, tmp);
			stuffcmd (self, "\n");
		}
		if (((player_rate < minrate) && (minrate < maxrate)))
		{
			sprint (self, 2, "\nYour עבפו setting is too low for this server.\n");
			tmp = ftos (minrate);
			sprint (self, 2, "Rate set to ");
			sprint2 (self, AS_MELEE, tmp, "\n");
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
	localcmd ("serverinfo huetf 1.45\n");
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
				number_of_teams = AS_MISSILE;
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
				number_of_teams = AS_MISSILE;
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


      // display grenade timer in status bar [on]
        grentimers = CF_GetSetting("gt", "grentimers", "on");

      // Replaces caltrop with impact grenade
        impactgren = CF_GetSetting("ig", "impactgren", "on");


      // Toggle 24 bits skins
        skins24b = CF_GetSetting("s24b", "skins24b", "off");


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
			WriteByte (2, AS_MELEE);
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
				WriteByte (2, AS_MELEE);
				WriteByte (2, 31);
				WriteString (2, "The Rune of Black Magic throbs evilly in\nyour hand && whispers dark thoughts\ninto your brain. You learn the inmost\nlore of the Hell-Mother; Shub-Niggurath!\nYou now know that she is behind all the\nterrible plotting which has led to so\nmuch death...");
				return;
			}
			else
			{
				if ((world.model == "maps/e3m6.bsp"))
				{
					WriteByte (2, space);
					WriteByte (2, 2);
					WriteByte (2, AS_MELEE);
					WriteByte (2, 31);
					WriteString (2, "The charred viscera of diabolic horrors\nbubble viscously as you seize the Rune\nof Hell Magic. Its heat scorches your\nhand, && its terrible secrets blight\nyour mind. Gathering the shreds of your\ncourage, you shake the devil's shackles\nfrom your ...");
					return;
				}
				else
				{
					if ((world.model == "maps/e4m7.bsp"))
					{
						WriteByte (2, space);
						WriteByte (2, 2);
						WriteByte (2, AS_MELEE);
						WriteByte (2, 31);
						WriteString (2, "Despite the awful might of the Elder\nWorld, you have achieved the Rune of\nElder Magic, capstone of all types of\narcane wisdom. Beyond good && evil,\nbeyond life && death, the Rune\npulsates, heavy with import. Patient and\npotent, the Elder Being...");
						return;
					}
				}
			}
		}
		GotoNextMap ();
	}
	if ((intermission_running == AS_MELEE))
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
	WriteByte (2, AS_MELEE);
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
	if (((cvar ("samelevel") == 2) || ((cvar ("samelevel") == AS_MELEE) && (mapname != "start"))))
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
	self.deadflag = AS_MELEE;
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
			if ((team_num == AS_MELEE))
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
				if ((team_num == AS_MISSILE))
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
	self.solid = AS_MELEE;
	self.movetype = AS_MELEE;
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
	self.on_hook = 0;
	self.hook_out = 0;
	self.fire_held_down = 0;
	self.mapcount = _d;
	self.gravity = 1;
	self.camdist = 0;
	DecodeLevelParms ();
	if (self.team_no)
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
	if (!self.playerclass)
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
		self.deadflag = AS_MELEE;
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
				sound (self, AS_MISSILE, "misc/water1.wav", 1, 1);
			}
			else
			{
				sound (self, AS_MISSILE, "misc/water2.wav", 1, 1);
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
	sound (self, AS_MISSILE, "player/plyrjmp8.wav", 1, 1);
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
	return;
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
	if ((self.waterlevel != AS_MELEE))
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
			sound (self, AS_MISSILE, "misc/outwater.wav", 1, 1);
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
				T_Damage (self, world, world, (AS_MISSILE * self.waterlevel));
			}
		}
	}
	if (!(self.flags & 16))
	{
		if ((self.watertype == -5))
		{
			sound (self, AS_MISSILE, "player/inlava.wav", 1, 1);
		}
		if ((self.watertype == -3))
		{
			sound (self, AS_MISSILE, "player/inh2o.wav", 1, 1);
		}
		if ((self.watertype == -4))
		{
			sound (self, AS_MISSILE, "player/slimbrn2.wav", 1, 1);
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
	if ((self.is_feigning && (self.waterlevel == 1)))
	{
		self.watertype = -3;
		self.waterlevel = AS_MELEE;
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
		if ((self.effects & (8 | AS_MISSILE)))
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
				self.invisible_sound = (time + ((random () * AS_MELEE) + 1));
			}
			if ((self.invisible_finished < (time + AS_MELEE)))
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
		if ((self.invincible_finished < (time + AS_MELEE)))
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
		if ((self.super_damage_finished < (time + AS_MELEE)))
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
		if ((self.radsuit_finished < (time + AS_MELEE)))
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
					sound (self, AS_MISSILE, "player/h2ojump.wav", 1, 1);
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
	if ((self.cheat_check <= time))
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
			self.is_admin = AS_MELEE;
		}
	}
};

void () ClientConnect =
{
	local entity te;
	local string st;
	local string st2;
	local float res;

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
			self.StatusBarSize = AS_MELEE;
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
	local entity te;
	local string st;
	local float fr;

	fr = rint (self.frags);
	st = ftos (fr);
	bprint4 (2, self.netname, " left the game with ", st, " frags\n");
	sound (self, AS_MISSILE, "player/tornoff2.wav", 1, 0);
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
};

void (entity targ, entity attacker) ClientObituary =
{
	local float rnum;
	local string deathstring;
	local string deathstring2;
	local float attackerteam;
	local float targteam;
	local entity te;

	rnum = random ();
	if (cb_prematch)
	{
		return;
	}
	if ((targ.classname == "player"))
	{
		if ((attacker.classname == "teledeath"))
		{
			bprint (1, targ.netname);
			bprint (1, " was telefragged by ");
			bprint (1, attacker.owner.netname);
			bprint (1, "\n");
			if (((attacker.owner.team_no != targ.team_no) || (attacker.owner.team_no < 1)))
			{
				TF_AddFrags (attacker.owner, 1, 0);
			}
			return;
		}
		if ((attacker.classname == "teledeath2"))
		{
			bprint (1, "Satan's power deflects ");
			bprint (1, targ.netname);
			bprint (1, "'s telefrag\n");
			TF_AddFrags (targ, -1, 0);
			logfrag (targ, targ);
			return;
		}
		if ((deathmsg == 37))
		{
			bprint (1, targ.netname);
			bprint (1, " shoots his teammate one too many times.\n");
			return;
		}
		if (((attacker.classname == "info_tfgoal") || (attacker.classname == "item_tfgoal")))
		{
			if ((attacker.deathtype != ""))
			{
				bprint (1, targ.netname);
				bprint (1, attacker.deathtype);
			}
			logfrag (targ, targ);
			return;
		}
		if ((attacker.classname == "player"))
		{
			if ((targ == attacker))
			{
				TF_AddFrags (attacker, -1, 0);
				bprint (1, targ.netname);
				if ((deathmsg == 8))
				{
					if ((targ.playerclass == 2))
					{
						deathstring = " got splattered by his own grenade\n";
					}
					else
					{
						if ((targ.playerclass == AS_MELEE))
						{
							deathstring = " sat on his own grenade\n";
						}
						else
						{
							if ((targ.playerclass == AS_MISSILE))
							{
								deathstring = " got to know his grenade too well\n";
							}
							else
							{
								if ((targ.playerclass == 5))
								{
									deathstring = " caught the end of his own grenade\n";
								}
								else
								{
									if ((targ.playerclass == 6))
									{
										deathstring = " got too close to his own grenade\n";
									}
									else
									{
										if ((targ.playerclass == 7))
										{
											deathstring = " let his own grenade get the best of him\n";
										}
										else
										{
											if ((targ.playerclass == 8))
											{
												deathstring = " tiptoed over his own grenade\n";
											}
											else
											{
												if ((targ.playerclass == 9))
												{
													deathstring = " stared at his grenade too long\n";
												}
												else
												{
													deathstring = " grenades himself\n";
												}
											}
										}
									}
								}
							}
						}
					}
				}
				else
				{
					if ((deathmsg == 9))
					{
						deathstring = " hammers himself\n";
					}
					else
					{
						if ((deathmsg == enter))
						{
							if ((targ.playerclass == AS_MISSILE))
							{
								deathstring = " practiced his own Mirv dance\n";
							}
							else
							{
								if ((targ.playerclass == 6))
								{
									deathstring = " allowed his Mirv to turn against him\n";
								}
								else
								{
									deathstring = " goes to pieces\n";
								}
							}
						}
						else
						{
							if ((deathmsg == 11))
							{
								deathstring = " ambushes himself with his own pipebombs\n";
							}
							else
							{
								if ((deathmsg == 40))
								{
									deathstring = " tried to juggle his own pipebombs\n";
								}
								else
								{
									if ((deathmsg == 24))
									{
										deathstring = " chokes on his own gas\n";
									}
									else
									{
										if ((deathmsg == 30))
										{
											deathstring = " explodes his ammo && body\n";
										}
										else
										{
											if ((deathmsg == 41))
											{
												deathstring = " stepped on too many of his own caltrops\n";
											}
											else
											{
												if ((deathmsg == 35))
												{
													deathstring = " is charred by his own flash grenade\n";
												}
												else
												{
													if ((deathmsg == 31))
													{
														deathstring = " detonates an ammo box too close to him\n";
													}
													else
													{
														if ((deathmsg == 12))
														{
															deathstring = " set the detpack && forgot to run\n";
														}
														else
														{
															if ((deathmsg == 13))
															{
																deathstring = " died impossibly!\n";
															}
															else
															{
																if ((deathmsg == 6))
																{
																	if (rnum)
																	{
																		deathstring = " becomes bored with life\n";
																	}
																	else
																	{
																		deathstring = " checks if his weapon is loaded\n";
																	}
																}
																else
																{
																	if ((deathmsg == 33))
																	{
																		deathstring = " chars himself with an incendiary rocket\n";
																	}
																	else
																	{
																		if ((deathmsg == 5))
																		{
																			deathstring = " tries to put the pin back in\n";
																		}
																		else
																		{
																			if ((deathmsg == 15))
																			{
																				deathstring = " torches himself\n";
																			}
																			else
																			{
																				if (((deathmsg == 7) && (targ.waterlevel > 1)))
																				{
																					bprint (1, " discharges into the water.\n");
																					return;
																				}
																				else
																				{
																					if ((deathmsg == 38))
																					{
																						deathstring = " gets too friendly with his sentrygun.\n";
																					}
																					else
																					{
																						if ((deathmsg == 39))
																						{
																							deathstring = " dispenses with himself.\n";
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				bprint (1, deathstring);
				return;
			}
			else
			{
				if (((teamplay && (attacker.team_no == targ.team_no)) && (attacker.team_no > 0)))
				{
					TF_AddFrags (attacker, -1, 0);
					if ((targ.undercover_team == 0))
					{
						attacker.teamkills = (attacker.teamkills + 1);
					}
					deathstring2 = "\n";
					if ((rnum < 0.25))
					{
						deathstring = " mows down teammate ";
						deathstring2 = "\n";
					}
					else
					{
						if ((rnum < 0.5))
						{
							deathstring = " checks his glasses after killing ";
							deathstring2 = "\n";
						}
						else
						{
							if ((rnum < 0.75))
							{
								deathstring = " gets a frag for the other team with ";
								deathstring2 = "'s death\n";
							}
							else
							{
								deathstring = " killed his supposed friend ";
								deathstring2 = "\n";
							}
						}
					}
					if ((deathmsg == 23))
					{
						bprint (1, targ.netname);
						bprint (1, " didn't survive the operation by ");
						bprint (1, attacker.netname);
						bprint (1, "\n");
						return;
					}
					bprint (1, attacker.netname);
					bprint (1, deathstring);
					bprint (1, targ.netname);
					bprint (1, deathstring2);
					CheckAutoKick (attacker);
					return;
				}
				else
				{
					TF_AddFrags (attacker, 1, 1);
					logfrag (attacker, targ);
					if ((deathmsg == 8))
					{
						if ((attacker.playerclass == 2))
						{
							deathstring = " got up-close && personal with ";
							deathstring2 = "'s grenade\n";
						}
						else
						{
							if ((attacker.playerclass == AS_MELEE))
							{
								deathstring = " played catch with ";
								deathstring2 = "'s grenade\n";
							}
							else
							{
								if ((attacker.playerclass == AS_MISSILE))
								{
									deathstring = " received a pineapple enema from ";
									deathstring2 = "\n";
								}
								else
								{
									if ((attacker.playerclass == 5))
									{
										deathstring = " fetched ";
										deathstring2 = "'s pineapple\n";
									}
									else
									{
										if ((attacker.playerclass == 6))
										{
											deathstring = " caught too much shrapnel from ";
											deathstring2 = "'s grenade\n";
										}
										else
										{
											if ((attacker.playerclass == 7))
											{
												deathstring = " tried to pick up ";
												deathstring2 = "'s hot potato\n";
											}
											else
											{
												if ((attacker.playerclass == 8))
												{
													deathstring = " thought ";
													deathstring2 = " was tossing him a spare grenade\n";
												}
												else
												{
													if ((attacker.playerclass == 9))
													{
														deathstring = " stops to ponder the technical details of ";
														deathstring2 = "'s grenade\n";
													}
													else
													{
														deathstring = " surfs on a grenade from ";
														deathstring2 = "\n";
													}
												}
											}
										}
									}
								}
							}
						}
					}
					else
					{
						if ((deathmsg == 9))
						{
							deathstring = " gets flayed by ";
							deathstring2 = "'s nail grenade\n";
						}
						else
						{
							if ((deathmsg == enter))
							{
								if ((attacker.playerclass == AS_MISSILE))
								{
									deathstring = " does a dance on ";
									deathstring2 = "'s Mirv grenade\n";
								}
								else
								{
									deathstring = " gets spammed by ";
									deathstring2 = "'s Mirv grenade\n";
								}
							}
							else
							{
								if ((deathmsg == 11))
								{
									deathstring = " is caught by ";
									deathstring2 = "'s pipebomb trap\n";
								}
								else
								{
									if ((deathmsg == 40))
									{
										deathstring = " fell victim to ";
										deathstring2 = "'s fireworks\n";
									}
									else
									{
										if ((deathmsg == 24))
										{
											deathstring = " gags on ";
											deathstring2 = "'s noxious gasses\n";
										}
										else
										{
											if ((deathmsg == 30))
											{
												deathstring = "'s ammo detonates him as ";
												deathstring2 = "'s EMP fries it\n";
											}
											else
											{
												if ((deathmsg == 41))
												{
													deathstring = " stepped on too many of ";
													deathstring2 = "'s caltrops\n";
												}
												else
												{
													if ((deathmsg == 35))
													{
														deathstring = " is charred by ";
														deathstring2 = "'s flash grenade\n";
													}
													else
													{
														if ((deathmsg == 31))
														{
															deathstring = " stands near some ammo as ";
															deathstring2 = "'s EMP nukes it\n";
														}
														else
														{
															if ((deathmsg == 12))
															{
																deathstring = " reaches orbit via ";
																deathstring2 = "'s detpack\n";
															}
															else
															{
																if ((deathmsg == 16))
																{
																	deathstring = " cut the red wire of ";
																	deathstring2 = "'s detpack\n";
																}
																else
																{
																	if ((deathmsg == 13))
																	{
																		deathstring = " dies from ";
																		deathstring2 = "'s mysterious tropical disease\n";
																	}
																	else
																	{
																		if ((deathmsg == 14))
																		{
																			deathstring = " escapes infection from ";
																			deathstring2 = " by dying first\n";
																		}
																		else
																		{
																			if ((deathmsg == 5))
																			{
																				deathstring = " eats ";
																				deathstring2 = "'s pineapple\n";
																				if ((targ.health < -40))
																				{
																					deathstring = " was gibbed by ";
																					deathstring2 = "'s grenade\n";
																				}
																			}
																			else
																			{
																				if ((deathmsg == 6))
																				{
																					deathstring = " rides ";
																					deathstring2 = "'s rocket\n";
																					if ((targ.health < -40))
																					{
																						deathstring = " was gibbed by ";
																						deathstring2 = "'s rocket\n";
																					}
																				}
																				else
																				{
																					if ((deathmsg == 15))
																					{
																						if ((rnum < 0.2))
																						{
																							deathstring = " is burnt up by ";
																							deathstring2 = "'s flame\n";
																						}
																						else
																						{
																							if ((rnum < 0.4))
																							{
																								deathstring = " is fried by ";
																								deathstring2 = "'s fire\n";
																							}
																							else
																							{
																								if ((rnum < 0.6))
																								{
																									deathstring = " feels ";
																									deathstring2 = "'s fire of wrath\n";
																								}
																								else
																								{
																									if ((rnum < 0.8))
																									{
																										deathstring = " is reduced to ashes by ";
																										deathstring2 = "\n";
																									}
																									else
																									{
																										deathstring = " is grilled by ";
																										deathstring2 = "'s flame\n";
																									}
																								}
																							}
																						}
																					}
																					else
																					{
																						if ((deathmsg == 17))
																						{
																							deathstring2 = "\n";
																							if ((attacker.playerclass == 8))
																							{
																								deathstring = " was knife-murdered by ";
																							}
																							else
																							{
																								if ((attacker.playerclass == 1))
																								{
																									deathstring = "'s mellon was split by ";
																								}
																								else
																								{
																									if ((attacker.playerclass == 2))
																									{
																										deathstring = " was put on the chop block by ";
																									}
																									else
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " was sliced && diced by ";
																											deathstring2 = "'s blade\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == AS_MISSILE))
																											{
																												deathstring = " is split from crotch to sternum by ";
																												deathstring2 = "'s axe swing\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 6))
																												{
																													deathstring = " is split in two with a powerful axe blow from ";
																												}
																												else
																												{
																													if ((attacker.playerclass == 7))
																													{
																														deathstring = "'s death put another notch on ";
																														deathstring2 = "'s axe\n";
																													}
																													else
																													{
																														deathstring = " was ax-murdered by ";
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																						else
																						{
																							if ((deathmsg == space))
																							{
																								deathstring = " was spanner-murdered by ";
																								deathstring2 = "\n";
																							}
																							else
																							{
																								if ((deathmsg == 1))
																								{
																									if ((attacker.playerclass == 1))
																									{
																										deathstring = " got too close to ";
																										deathstring2 = "'s muzzleflash\n";
																									}
																									else
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " practices being ";
																											deathstring2 = "'s clay pigeon\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == AS_MISSILE))
																											{
																												deathstring = " was on the receiving end of ";
																												deathstring2 = "'s shotgun barrel\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 5))
																												{
																													deathstring = " was fed a lead diet by ";
																													deathstring2 = "\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 6))
																													{
																														deathstring = " got blasted by ";
																														deathstring2 = "'s last resort\n";
																													}
																													else
																													{
																														if ((attacker.playerclass == 7))
																														{
																															deathstring = " got more than a powderburn from ";
																															deathstring2 = "'s shotgun blast\n";
																														}
																														else
																														{
																															deathstring = " chewed on ";
																															deathstring2 = "'s boomstick\n";
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																								else
																								{
																									if ((deathmsg == 2))
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " was turned into swiss cheese by ";
																											deathstring2 = "'s buckshot\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == 5))
																											{
																												deathstring = " got a double-dose of ";
																												deathstring2 = "'s buckshot\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 6))
																												{
																													deathstring = " unfortunately forgot ";
																													deathstring2 = " carried a super-shotgun\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 8))
																													{
																														deathstring = " gets ventilated by ";
																														deathstring2 = "'s super-shotgun blast\n";
																													}
																													else
																													{
																														if ((attacker.playerclass == 9))
																														{
																															deathstring = "'s body got chuck full of ";
																															deathstring2 = "'s lead pellets\n";
																														}
																														else
																														{
																															deathstring = " ate 2 loads of ";
																															deathstring2 = "'s buckshot\n";
																														}
																													}
																												}
																											}
																										}
																									}
																									else
																									{
																										if ((deathmsg == AS_MELEE))
																										{
																											if ((attacker.playerclass == 1))
																											{
																												deathstring = " caught one too many nails from ";
																												deathstring2 = "\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 2))
																												{
																													deathstring = " ran into ";
																													deathstring2 = "'s nails\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 8))
																													{
																														deathstring = " was turned into ";
																														deathstring2 = "'s pin-cushion\n";
																													}
																													else
																													{
																														deathstring = " was nailed by ";
																														deathstring2 = "\n";
																													}
																												}
																											}
																										}
																										else
																										{
																											if ((deathmsg == AS_MISSILE))
																											{
																												deathstring = " was punctured by ";
																												deathstring2 = "\n";
																											}
																											else
																											{
																												if ((deathmsg == 7))
																												{
																													deathstring = " accepts ";
																													if ((attacker.waterlevel > 1))
																													{
																														deathstring2 = "'s discharge\n";
																													}
																													else
																													{
																														deathstring2 = "'s shaft\n";
																													}
																												}
																												else
																												{
																													if ((deathmsg == 21))
																													{
																														deathstring = " grappled with ";
																														deathstring2 = "\n";
																													}
																													else
																													{
																														if ((deathmsg == COLOR_GREEN))
																														{
																															if ((rnum <= 0.3))
																															{
																																deathstring = " takes a bullet in the chest from ";
																																deathstring2 = "\n";
																															}
																															else
																															{
																																deathstring = " succumbs to sniperfire from ";
																																deathstring2 = "\n";
																															}
																														}
																														else
																														{
																															if ((deathmsg == 29))
																															{
																																if ((rnum <= 0.5))
																																{
																																	deathstring = " gets a third eye from ";
																																	deathstring2 = "\n";
																																}
																																else
																																{
																																	deathstring = " gets his head blown off by ";
																																	deathstring2 = "\n";
																																}
																															}
																															else
																															{
																																if ((deathmsg == 28))
																																{
																																	if ((rnum <= 0.5))
																																	{
																																		deathstring = " is made legless by ";
																																		deathstring2 = "\n";
																																	}
																																	else
																																	{
																																		deathstring = " gets his legs blown off by ";
																																		deathstring2 = "\n";
																																	}
																																}
																																else
																																{
																																	if ((deathmsg == 19))
																																	{
																																		deathstring = " collects ";
																																		deathstring2 = "'s bullet spray.\n";
																																	}
																																	else
																																	{
																																		if ((deathmsg == 20))
																																		{
																																			deathstring = " gets sawn in half by ";
																																			deathstring2 = "\n";
																																		}
																																		else
																																		{
																																			if ((deathmsg == 22))
																																			{
																																				deathstring = " gets knifed from behind by ";
																																				deathstring2 = "\n";
																																			}
																																			else
																																			{
																																				if ((deathmsg == 25))
																																				{
																																					deathstring = " is put to sleep by ";
																																					deathstring2 = "\n";
																																				}
																																				else
																																				{
																																					if ((deathmsg == 26))
																																					{
																																						deathstring = " gets a hole in his heart from ";
																																						deathstring2 = "'s railgun\n";
																																					}
																																					else
																																					{
																																						if ((deathmsg == 33))
																																						{
																																							deathstring = " gets well done by ";
																																							deathstring2 = "'s incendiary rocket\n";
																																						}
																																						else
																																						{
																																							if ((deathmsg == 38))
																																							{
																																								deathstring = " gets destroyed by ";
																																								deathstring2 = "'s exploding sentrygun\n";
																																							}
																																							else
																																							{
																																								if ((deathmsg == 39))
																																								{
																																									deathstring = " didn't insert the correct change into ";
																																									deathstring2 = "'s dispenser.\n";
																																								}
																																							}
																																						}
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					if (((attacker.has_disconnected == 1) || (attacker.netname == string_null)))
					{
						deathstring = " died.";
						deathstring2 = "\n";
					}
					bprint (1, targ.netname);
					bprint (1, deathstring);
					bprint (1, attacker.netname);
					bprint (1, deathstring2);
				}
			}
			return;
		}
		else
		{
			if ((attacker.classname == "building_sentrygun"))
			{
				if ((targ == attacker.real_owner))
				{
					if ((deathmsg == quote))
					{
						deathstring = " intercepts his sentry gun's rocket\n";
					}
					else
					{
						if ((deathmsg == 27))
						{
							deathstring = " crossed his sentry gun's line of fire\n";
						}
						else
						{
							if ((deathmsg == 7))
							{
								deathstring = " crossed his sentry gun's shaft\n";
							}
						}
					}
					bprint (1, targ.netname);
					bprint (1, deathstring);
				}
				else
				{
					if (((teamplay && (attacker.team_no == targ.team_no)) && (attacker.team_no > 0)))
					{
						bprint (1, targ.netname);
						bprint (1, " obstructs his team's sentry gun\n");
					}
					else
					{
						TF_AddFrags (attacker.real_owner, 1, 1);
						logfrag (attacker.real_owner, targ);
						if ((deathmsg == quote))
						{
							deathstring = " hates ";
							deathstring2 = "'s sentry gun\n";
						}
						else
						{
							if ((deathmsg == 27))
							{
								deathstring = " is mown down by ";
								deathstring2 = "'s sentry gun\n";
							}
							else
							{
								if ((deathmsg == 7))
								{
									deathstring = " is electrocuted by ";
									deathstring2 = "'s sentry gun\n";
								}
							}
						}
						bprint (1, targ.netname);
						bprint (1, deathstring);
						bprint (1, attacker.real_owner.netname);
						bprint (1, deathstring2);
					}
				}
			}
			else
			{
				logfrag (targ, targ);
				TF_AddFrags (targ, -1, 0);
				rnum = targ.watertype;
				bprint (1, targ.netname);
				if ((rnum == -3))
				{
					if ((random () < 0.5))
					{
						deathstring = " sleeps with the fishes\n";
					}
					else
					{
						deathstring = " sucks it down\n";
					}
				}
				else
				{
					if ((rnum == -4))
					{
						if ((random () < 0.5))
						{
							deathstring = " gulped a load of slime\n";
						}
						else
						{
							deathstring = " can't exist on slime alone\n";
						}
					}
					else
					{
						if ((rnum == -5))
						{
							if ((targ.health < -15))
							{
								deathstring = " burst into flames\n";
							}
							else
							{
								if ((random () < 0.5))
								{
									deathstring = " turned into hot slag\n";
								}
								else
								{
									deathstring = " visits the Volcano God\n";
								}
							}
						}
						else
						{
							if ((attacker.classname == "explo_box"))
							{
								deathstring = " blew up\n";
							}
							else
							{
								if (((attacker.solid == AS_MISSILE) && (attacker != world)))
								{
									deathstring = " was squished\n";
								}
								else
								{
									if ((targ.deathtype == "falling"))
									{
										targ.deathtype = string_null;
										deathstring = " fell to his death\n";
									}
									else
									{
										if (((attacker.classname == "trap_shooter") || (attacker.classname == "trap_spikeshooter")))
										{
											deathstring = " was spiked\n";
										}
										else
										{
											if ((attacker.classname == "fireball"))
											{
												deathstring = " ate a lavaball\n";
											}
											else
											{
												if ((attacker.classname == "trigger_changelevel"))
												{
													deathstring = " tried to leave\n";
												}
												else
												{
													deathstring = " died\n";
												}
											}
										}
									}
								}
							}
						}
					}
				}
				bprint (1, deathstring);
			}
		}
	}
	else
	{
		if ((targ.classname == "building_sentrygun"))
		{
			if ((attacker.classname == "teledeath"))
			{
				bprint (1, targ.real_owner.netname);
				bprint (1, "'s sentrygun was telefragged by ");
				bprint (1, attacker.owner.netname);
				bprint (1, "\n");
				return;
			}
			if ((attacker.classname == "player"))
			{
				if ((attacker == targ.real_owner))
				{
					bprint (1, targ.real_owner.netname);
					bprint (1, " destroys his sentrygun\n");
					return;
				}
				bprint (1, targ.real_owner.netname);
				bprint (1, "'s sentrygun was destroyed by ");
				bprint (1, attacker.netname);
				bprint (1, "\n");
				if (((attacker.team_no > 0) && (attacker.team_no == targ.real_owner.team_no)))
				{
					TF_AddFrags (attacker, -1, 0);
					attacker.teamkills = (attacker.teamkills + 1);
					CheckAutoKick (attacker);
				}
				else
				{
					TF_AddFrags (attacker, 1, 1);
				}
				return;
			}
		}
		else
		{
			if ((targ.classname == "building_dispenser"))
			{
				if (((attacker.team_no > 0) && (attacker.team_no == targ.real_owner.team_no)))
				{
					TF_AddFrags (attacker, -1, 0);
					attacker.teamkills = (attacker.teamkills + 1);
					CheckAutoKick (attacker);
				}
			}
		}
	}
};
