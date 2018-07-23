//=-=-=-=-=
void () UseSpecialSkill;
void (float inp) TeamFortress_ChangeClass;
void () TeamFortress_DisplayLegalClasses;
void (float grenade) TeamFortress_Inventory_PrintGrenades;
void () TeamFortress_Inventory;
void () TeamFortress_ShowTF;
void () TeamFortress_GrenadePrimed;
void () GrenadeTimer;
void () RemoveGrenadeTimers
string (float grenade) TeamFortress_GetGrenadeName;
void () TeamFortress_PrimeGrenade;
void () TeamFortress_GrenadePrimed;
void () TeamFortress_ThrowGrenade;
float (float pc) IsLegalClass;
void (entity p) TeamFortress_SetSpeed;
string(entity p) TeamFortress_GetSkin;
void (entity p) TeamFortress_SetSkin;
void () TeamFortress_SetEquipment;
float (entity Retriever, float AmmoType) TeamFortress_GetMaxAmmo;
float (entity Retriever, float WeaponType) TeamFortress_CanGetWeapon;
void (entity Player, float Armorclass) TeamFortress_DescribeArmor;
void (entity Retriever, entity Items) TeamFortress_AddBackpackItems;
string (float pc) TeamFortress_GetClassName;
void (entity Viewer, float pc, float rpc) TeamFortress_PrintClassName;
void () TeamFortress_RemoveTimers;
void () TeamFortress_SetupRespawn;
void () TeamFortress_CheckClassStats;
void () TeamFortress_AssaultWeapon;
void (entity Gren) TeamFortress_ExplodePerson;
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;
void () TeamFortress_DisplayDetectionItems;
void () BioInfection_Decay;
void () BioInfection_MonsterDecay;
void (string halias, float himpulse1, float himpulse2) TeamFortress_Alias;
float (vector veca, vector vecb) crossproduct;
void (entity pl, float fr, float type) TF_AddFrags;
void (entity p) TeamFortress_ExecClassScript;
void (entity p) TeamFortress_ExecMapScript;

void (entity Goal, entity Player, entity Item) DisplayItemStatus;


void () UseSpecialSkill =
{
	local vector src;

	self.impulse = 0;
	switch (self.playerclass) 
	{
		case PC_SCOUT:
			self.impulse = 159;
			break;
		case PC_SNIPER:		
			self.impulse = 174;
			break;	
		case PC_SOLDIER:
			self.impulse = 173;
			break;
		case PC_DEMOMAN:
			self.impulse = 170;
			break;
		case PC_MEDIC:
			if (self.current_weapon == WEAP_SUPER_NAILGUN)
				self.impulse = 176;
			else
				self.impulse = 5;
			break;
		case PC_HWGUY:						
			if (self.current_weapon == WEAP_ASSAULT_CANNON)
			{
				if ((self.tfstate & 2048))
					sprint (self, 1, "Cannot switch weapons while firing.\n");
				else
					self.impulse = 3;
			}
			else
				self.impulse = 7;
			break;
		case PC_PYRO:							
			if ((self.current_weapon == WEAP_FLAMETHROWER))
				self.impulse = 6;
			else
				self.impulse = 5;
			break;
		case PC_SPY:
			self.impulse = 177;
			break;
		case PC_ENGINEER:
			self.impulse = 179;
			break;
		default:
			if (clanbattle)
			{
				sprint (self, 2, "Clan Battle in progress....\n");
				self.impulse = 0;
				return;
			}
			src = (self.origin + (v_forward * 10));
			src_z = (self.absmin_z + (self.size_z * 0.7));
			traceline (src, (src + (v_forward * 2048)), 0, self);
			if ((trace_ent != world))
			{
				if ((trace_ent.netname != string_null))
				{
					sprint3 (self, 2, "Locked onto ", trace_ent.netname, "\n");
				}
				else
				{
					sprint3 (self, 2, "Locked onto ", trace_ent.classname, "\n");
				}
				self.goalentity = trace_ent;
				if (!self.tracking)
				{
					Toggle_Tracking ();
				}
			}
			break;	
	}
	return;
};

void (float inp) TeamFortress_ChangeClass =
{
	local entity spot;
	local entity te;
	local string st;
	local float tc;
	local float oldclass;

	if (!self.playerclass)
	{
		if (round_active)
		{
			if (!IsLegalClass (inp))
			{
				sprint (self, 2, "Your team cannot play that class.\n");
				TeamFortress_DisplayLegalClasses ();
				return;
			}
			if (ClassIsRestricted (self.team_no, inp))
			{
				sprint (self, 2, "Your team already has enough of that class.\n");
				return;
			}
			if (TeamFortress_TeamIsCivilian (self.team_no))
			{
				sprint (self, 2, "You cannot change class.\n");
				self.nextpc = 11;
				return;
			}
			self.nextpc = inp;
			sprint (self, 2, "Next Round, you will return as a ");
			TeamFortress_PrintClassName (self, self.nextpc, (self.tfstate & 8));
			return;
		}
	}
	else
	{
		if (!IsLegalClass (inp))
		{
			sprint (self, 2, "Your team cannot play that class.\n");
			TeamFortress_DisplayLegalClasses ();
			return;
		}
		if (ClassIsRestricted (self.team_no, inp))
		{
			sprint (self, 2, "Your team already has enough of that class.\n");
			return;
		}
		if (TeamFortress_TeamIsCivilian (self.team_no))
		{
			inp = 11;
		}
		self.nextpc = inp;
		if (rounds)
		{
			sprint (self, 2, "Next Round, you will return as a ");
		}
		else
		{
			sprint (self, 2, "After dying, you will return as a ");
		}
		TeamFortress_PrintClassName (self, self.nextpc, (self.tfstate & 8));
		return;
	}
	if (teamplay && (self.team_no == 0) && !captainmode)
	{
		if (toggleflags & 64)
		{
			if ((TeamFortress_TeamPutPlayerInTeam () == 0))
			{
				return;
			}
		}
		else
		{
			sprint (self, 2, "You must join a team first. \n");
			return;
		}
	}
	if (self.respawn_time > time)
	{
		return;
	}
	if (round_over == 2)
	{
		return;
	}
	if (!IsLegalClass (inp) && (inp != 11))
	{
		sprint (self, 2, "You cannot play that playerclass on this map. \n");
		TeamFortress_DisplayLegalClasses ();
		return;
	}
	if (ClassIsRestricted (self.team_no, inp))
	{
		sprint (self, 2, "Your team has enough of that class.\n");
		return;
	}
	TeamFortress_ExecClassScript (self);
	if ((inp > 0) && (inp < 12))
	{
		self.playerclass = inp;
	}
	else
	{
		self.playerclass = 0;
	}
	self.nextpc = 0;
	self.takedamage = 2;
	self.movetype = 3;
	self.flags = (8 | 512);
	self.waterlevel = 0;
	self.air_finished = (time + 12);
	self.solid = 3;
	self.pausetime = 0;
	self.gravity = 1;
	spot = SelectSpawnPoint ();
	self.origin = (spot.origin + '0 0 1');
	self.velocity = '0 0 0';
	self.angles = spot.angles;
	self.fixangle = 1;
	setmodel (self, string_null);
	modelindex_null = self.modelindex;
	setmodel (self, "progs/eyes.mdl");
	modelindex_eyes = self.modelindex;
	setmodel (self, "progs/player.mdl");
	modelindex_player = self.modelindex;
	setsize (self, '-16 -16 -24', '16 16 32');
	self.view_ofs = '0 0 22';
	player_stand1 ();
	if (deathmatch || coop)
	{
		makevectors (self.angles);
		spawn_tfog (self.origin + (v_forward * 20));
	}
	if (self.playerclass == 10)
	{
		sprint (self, 2, "Random Playerclass.\n");
		self.tfstate = (self.tfstate | 8);
		self.playerclass = (1 + floor ((random () * (10 - 1))));
		if (CheckClassAvailable (self.team_no))
		{
			oldclass = self.playerclass;
			self.playerclass = (1 + floor ((random () * (10 - 1))));
			while ((self.playerclass == oldclass) || ClassIsRestricted (self.team_no, self.playerclass))
			{
				self.playerclass = (1 + floor ((random () * (10 - 1))));
			}
		}
		else
		{
			sprint (self, 2, "All classes disabled, returning to Observer mode.\n");
			self.playerclass = 0;
		}
	}
	if ((spot.classname == "info_player_teamspawn") && !cb_prematch)
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
		if (spot.activate_goal_no != 0)
		{
			te = Findgoal (spot.activate_goal_no);
			if (te)
			{
				AttemptToActivate (te, self, spot);
			}
		}
		if (spot.goal_effects == 1)
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + 1);
			spot.think = SUB_Remove;
		}
	}
	spot = find (world, classname, "player");
	while (spot)
	{
		if ((spot.team_no == self.team_no) && (spot != self))
		{
			sprint (spot, 2, self.netname);
			sprint (spot, 2, " is playing as a ");
			TeamFortress_PrintClassName (spot, self.playerclass, (self.tfstate & 8));
		}
		spot = find (spot, classname, "player");
	}
	TeamFortress_PrintClassName (self, self.playerclass, (self.tfstate & 8));
	TeamFortress_SetEquipment ();
	TeamFortress_SetSpeed (self);
	TeamFortress_SetSkin (self);
	TeamFortress_ExecClassScript (self);
	stuffcmd (self, "color ");
	tc = (TeamFortress_TeamGetColor (self.team_no) - 1);
	st = ftos (tc);
	stuffcmd (self, st);
	stuffcmd (self, "\n");
	SetTeamName (self);
	if (cease_fire)
	{
		sprint (self, 2, "\n\nCEASE FIRE MODE\n");
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | 65536);
		TeamFortress_SetSpeed (self);
	}
};

void () TeamFortress_DisplayLegalClasses =
{
	local float gotone;
	local float ill;

	sprint (self, 2, "Legal Classes for your team are:\n");
	gotone = 0;
	ill = TeamFortress_TeamGetIllegalClasses (self.team_no);
	if (!(illegalclasses & 1) && !(ill & 1))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Scout");
	}
	if (!(illegalclasses & 2) && !(ill & 2))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Sniper");
	}
	if (!(illegalclasses & 4) && !(ill & 4))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Soldier");
	}
	if (!(illegalclasses & 8) && !(ill & 8))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Demolitions Man");
	}
	if (!(illegalclasses & 16) && !(ill & 16))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Combat Medic");
	}
	if (!(illegalclasses & 32) && !(ill & 32))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Heavy Weapons Guy");
	}
	if (!(illegalclasses & 64) && !(ill & 64))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Pyro");
	}
	if (!(illegalclasses & 256) && !(ill & 256))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Spy");
	}
	if (!(illegalclasses & 512) && !(ill & 512))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "Engineer");
	}
	if (!(illegalclasses & 128) && !(ill & 128))
	{
		if (gotone)
		{
			sprint (self, 2, ", ");
		}
		gotone = 1;
		sprint (self, 2, "RandomPC");
	}
	sprint (self, 2, "\n");
};

void (float grenade) TeamFortress_Inventory_PrintGrenades = 
{
	local string num;
	switch (grenade) {
		case GR_TYPE_NORMAL:
			sprint (self, 2, " Normal(");
			break;
		case GR_TYPE_CONCUSSION:
			sprint (self, 2, " Concussion(");
			break;
		case GR_TYPE_NAIL:
			sprint (self, 2, " Nail(");
			break;
		case GR_TYPE_MIRV:
			sprint (self, 2, " Mirv(");
			break;
		case GR_TYPE_NAPALM:
			sprint (self, 2, " Napalm(");
			break;
		case GR_TYPE_FLARE:
			sprint (self, 2, " Flare(");
			break;
		case GR_TYPE_GAS:
			sprint (self, 2, " Hallucinogenic(");
			break;
		case GR_TYPE_EMP:
			sprint (self, 2, " EMP(");
			break;
		case GR_TYPE_FLASH:
			sprint (self, 2, " Flash(");
			break;
		case GR_TYPE_CALTROP:
			sprint (self, 2, " Caltrop(");
			break;
		case GR_TYPE_IMPACT:
			sprint (self, 2, " Impact(");
			break;
		default:
			sprint (self, 2, "N/A(");
			break;
	}
	num = ftos (self.no_grenades_1);
	sprint (self, 2, num);
	sprint (self, 2, ")\n");
};

void () TeamFortress_Inventory =
{
	local entity tg;
	local string ac;
	local float col;

	col = (TeamFortress_GetColor (self.team_no) - 1);
	sprint (self, 2, "You're in team ");
	ac = ftos (self.team_no);
	sprint (self, 2, ac);
	sprint (self, 2, ", color ");
	ac = ftos (col);
	sprint (self, 2, ac);
	sprint (self, 2, ".\n");
	if ((self.no_grenades_1 > 0))
	{
		sprint (self, 2, "Gren.Type 1 : ");
		TeamFortress_Inventory_PrintGrenades(self.tp_grenades_1);		
	}
	if ((self.no_grenades_2 > 0))
	{
		sprint (self, 2, "Gren.Type 2 : ");
		TeamFortress_Inventory_PrintGrenades(self.tp_grenades_2);
	}
	if ((self.tf_items & 1))
	{
		sprint (self, 2, "Scanner. ");
	}
	if ((self.weapons_carried & 4))
	{
		sprint (self, 2, "Medikit (");
		ac = ftos (self.ammo_medikit);
		sprint (self, 2, ac);
		sprint (self, 2, ") ");
	}
	if ((self.weapons_carried & 131072))
	{
		if ((self.ammo_detpack > 0))
		{
			ac = ftos (self.ammo_detpack);
			sprint (self, 2, ac);
			if (tfstrike)
			{
				sprint (self, 2, " Bomb");
			}
			else
			{
				sprint (self, 2, " Detpack");
			}
			if ((self.ammo_detpack > 1))
			{
				sprint (self, 2, "s");
			}
			sprint (self, 2, ". ");
		}
	}
	tg = find (world, classname, "item_tfgoal");
	while (tg)
	{
		if ((tg.owner == self))
		{
			sprint (self, 2, tg.netname);
			sprint (self, 2, ". ");
		}
		tg = find (tg, classname, "item_tfgoal");
	}
	if ((self.armorvalue > 0))
	{
		TeamFortress_DescribeArmor (self, self.armorclass);
	}
	if ((self.playerclass == PC_SPY))
	{
		sprint (self, 2, "Skin : ");
		if ((self.undercover_skin != 0))
		{
			TeamFortress_PrintClassName (self, self.undercover_skin, 0);
		}
		else
		{
			sprint (self, 2, "Spy\n");
		}
		sprint (self, 2, "Colors : Team ");
		if ((self.undercover_team != 0))
		{
			ac = ftos (self.undercover_team);
		}
		else
		{
			ac = ftos (self.team_no);
		}
		sprint (self, 2, ac);
	}
	sprint (self, 2, "\n");
};

void () TeamFortress_ShowTF =
{
	local string st;

	if ((toggleflags & 1))
	{
		sprint (self, 2, "Class Persistence On.\n");
	}
	else
	{
		sprint (self, 2, "Class Persistence Off.\n");
	}
	if ((toggleflags & 2))
	{
		sprint (self, 2, "Cheat Checking On.\n");
	}
	else
	{
		sprint (self, 2, "Cheat Checking Off.\n");
	}
	if ((toggleflags & 64))
	{
		sprint (self, 2, "AutoTeam On.\n");
	}
	if ((toggleflags & 4))
	{
		st = ftos (respawn_delay_time);
	}
	else
	{
		st = "No";
	}
	sprint (self, 2, st);
	if ((st != "No"))
	{
		sprint (self, 2, " second");
	}
	sprint (self, 2, " Respawn Delay.\n");
	if ((toggleflags & 128))
	{
		sprint (self, 2, "TeamFrags On.\n");
	}
	else
	{
		sprint (self, 2, "TeamFrags Off.\n");
	}
	if (allow_hook)
	{
		sprint (self, 2, "Grapple On.\n");
	}
	if (allow_flash)
	{
		sprint (self, 2, "Grapple On.\n");
	}
	if ((toggleflags & 2048))
	{
		sprint (self, 2, "Full TeamScore On.\n");
	}
	else
	{
		sprint (self, 2, "Full TeamScore Off.\n");
	}
};

void () GrenadeTimer = {
    self.heat = self.heat - 1;
    self.nextthink = time + 1;
    self.owner.StatusGrenTime = self.heat;

    if (!self.heat) {
        dremove(self);
    }
};

void () RemoveGrenadeTimers = {
    local entity te = find(world, classname, "gtimer");
    while (te != world) {
        if (te.owner == self)
            dremove(te);
        te = find(te, classname, "gtimer");
    }
};

string (float grenade) TeamFortress_GetGrenadeName =
{
	local string gs;
	switch (grenade) 
	{
		case GR_TYPE_NORMAL:
			gs = "Grenade";
			break;
		case GR_TYPE_CONCUSSION:
			gs = "Concussion grenade";
			break;
		case GR_TYPE_NAIL:
			gs = "Nail grenade";
			break;
		case GR_TYPE_MIRV:
			gs = "Mirv grenade";
			break;
		case GR_TYPE_NAPALM:
			gs = "Napalm grenade";
			break;
		case GR_TYPE_FLARE:
			gs = "Flare";
			break;
		case GR_TYPE_GAS:
			gs = "Gas grenade";
			break;
		case GR_TYPE_EMP:
			gs = "EMP grenade";
			break;
		case GR_TYPE_FLASH:
			gs = "Flash grenade";
			break;
		case GR_TYPE_CALTROP:
			gs = "Caltrop canister";
			break;
		case GR_TYPE_IMPACT:
			gs = "Impact Grenade";
			break;
		default:
			break;
	}
	return gs;
};

void () TeamFortress_PrimeGrenade =
{
	local float gtype;
	local string gs;
	local string ptime;
	local entity tGrenade;
	local entity timer;


	if (self.playerclass == PC_CIVILIAN)
	{
		return;
	}
	if (((self.tfstate & 1) || (self.tfstate & 1024)))
	{
		return;
	}
	if ((self.impulse == 150))
	{
		gtype = self.tp_grenades_1;
		gs = TeamFortress_GetGrenadeName(self.tp_grenades_1);

		if ((self.no_grenades_1 > 0))
		{
			if (!practice)
			{
				self.no_grenades_1 = (self.no_grenades_1 - 1);
			}
			if ((gtype == 6))
			{
				newmis = spawn ();
				newmis.owner = self;
				newmis.movetype = 6;
				newmis.solid = 2;
				newmis.classname = "grenade";
				makevectors (self.v_angle);
				newmis.velocity = ((v_forward * 600) + (v_up * 25));
				newmis.velocity = (newmis.velocity * 700);
				newmis.angles = vectoangles (newmis.velocity);
				newmis.weapon = self.team_no;
				newmis.think = FlareGrenadeExplode;
				newmis.nextthink = (time + 0.8);
				newmis.touch = FlareGrenadeTouch;
				newmis.skin = 1;
				newmis.mdl = "flare";
				setmodel (newmis, "progs/flare.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
				setorigin (newmis, self.origin);
				return;
			}
			if ((gtype == 10))
			{
				ptime = ftos (0.5);
				sprint (self, 2, "Opening ");
				sprint (self, 2, gs);
				sprint (self, 2, "...\n");
			}
			else
			{
				ptime = ftos (3);
				sprint (self, 2, gs);
				sprint (self, 2, " primed, ");
				sprint (self, 2, ptime);
				sprint (self, 2, " seconds...\n");
			}
		}
		else
		{
			sprint (self, 2, "No ");
			sprint (self, 2, gs);
			sprint (self, 2, "s left.\n");
			return;
		}
	}
	if ((self.impulse == 151))
	{
		gtype = self.tp_grenades_2;
		gs = TeamFortress_GetGrenadeName(self.tp_grenades_2);
		if ((self.no_grenades_2 > 0))
		{
			if (!practice)
			{
				self.no_grenades_2 = (self.no_grenades_2 - 1);
			}
			if ((gtype == 6))
			{
				newmis = spawn ();
				newmis.owner = self;
				newmis.movetype = 6;
				newmis.solid = 2;
				newmis.classname = "grenade";
				makevectors (self.v_angle);
				if (self.v_angle_x)
				{
					newmis.velocity = ((v_forward * 1200) + (v_up * 200));
				}
				else
				{
					newmis.velocity = aim (self, 10000);
					newmis.velocity = (newmis.velocity * 1200);
					newmis.velocity_z = _K;
				}
				newmis.angles = vectoangles (newmis.velocity);
				newmis.weapon = self.team_no;
				newmis.think = FlareGrenadeExplode;
				newmis.nextthink = (time + 0.8);
				newmis.touch = FlareGrenadeTouch;
				newmis.skin = 1;
				newmis.mdl = "flare";
				setmodel (newmis, "progs/flare.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
				setorigin (newmis, self.origin);
				return;
			}
			if ((gtype == 10))
			{
				ptime = ftos (0.5);
				sprint (self, 2, "Opening ");
				sprint (self, 2, gs);
				sprint (self, 2, "...\n");
			}
			else
			{
				ptime = ftos (3);
				sprint (self, 2, gs);
				sprint (self, 2, " primed, ");
				sprint (self, 2, ptime);
				sprint (self, 2, " seconds...\n");
			}
		}
		else
		{
			sprint (self, 2, "No ");
			sprint (self, 2, gs);
			sprint (self, 2, "s left.\n");
			return;
		}
	}
	self.tfstate = (self.tfstate | 1);
	tGrenade = spawn ();
	tGrenade.owner = self;
	tGrenade.weapon = gtype;
	tGrenade.classname = "timer";
	tGrenade.impulse = self.impulse;
	tGrenade.nextthink = (time + 0.8);
	if (gtype == GR_TYPE_CALTROP)
	{
		tGrenade.heat = ((time + 0.5) + 0.5);
	}
	else
	{
		tGrenade.heat = ((time + 3) + 0.8);
        RemoveGrenadeTimers();
        local float grensound = stof(infokey(self, "grensound"));
        if (grentimers == 1) {
			timer = spawn();
			timer.nextthink = time + 0.8;
			timer.think = GrenadeTimer;
			timer.heat = 4;
			timer.owner = self;
			timer.classname = "gtimer";
			if (grensound == 1) {
				stuffcmd(self, "play grentimer\n");
			}
		}
	}
	tGrenade.think = TeamFortress_GrenadePrimed;
};

void () TeamFortress_GrenadePrimed =
{
	local entity user;
	local entity oldself;

	user = self.owner;
	if ((!(user.tfstate & 1024) && !user.deadflag))
	{
		self.nextthink = (time + 0.1);
		if (!self.think)
		{
			dremove (self);
		}
		if ((time > self.heat) && (self.weapon != GR_TYPE_CALTROP))
		{
			TeamFortress_ExplodePerson (self);
		}
		return;
	}
	if (!(user.tfstate & 1))
	{
		dprint ("GrenadePrimed logic error\n");
	}
	user.tfstate = (user.tfstate - (user.tfstate & 1));
	user.tfstate = (user.tfstate - (user.tfstate & 1024));
	sound (user, 1, "weapons/ax1.wav", 1, 1);
	KickPlayer (-1, user);
	newmis = spawn ();
	newmis.owner = user;
	newmis.movetype = 10;
	newmis.solid = 2;
	newmis.classname = "grenade";
	makevectors (user.v_angle);
	if (user.deadflag)
	{
		newmis.velocity = '0 0 200';
	}
	else
	{
		if (user.v_angle_x)
		{
			newmis.velocity = ((((v_forward * 600) + (v_up * 200)) + ((crandom () * v_right) * 10)) + ((crandom () * v_up) * 10));
		}
		else
		{
			newmis.velocity = aim (user, 10000);
			newmis.velocity = (newmis.velocity * 600);
			newmis.velocity_z = 200;
		}
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = SUB_Null;
	newmis.nextthink = self.heat;
	switch(self.weapon) {
		case GR_TYPE_NORMAL:
			newmis.touch = NormalGrenadeTouch;
			newmis.think = NormalGrenadeExplode;
			newmis.skin = 0;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
			break;
		case GR_TYPE_CONCUSSION:
			newmis.touch = ConcussionGrenadeTouch;
			newmis.think = ConcussionGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
			break;
		case GR_TYPE_NAIL:
			newmis.touch = NailGrenadeTouch;
			newmis.think = NailGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_MIRV:
			newmis.touch = MirvGrenadeTouch;
			newmis.think = MirvGrenadeExplode;
			newmis.skin = 0;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_NAPALM:
			newmis.touch = NapalmGrenadeTouch;
			newmis.think = NapalmGrenadeExplode;
			newmis.skin = 2;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_FLARE:
			newmis.touch = FlareGrenadeTouch;
			newmis.weapon = self.team_no;
			newmis.think = FlareGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '300 300 300';
			newmis.mdl = "flare";
			setmodel (newmis, "progs/flare.mdl");
			break;
		case GR_TYPE_GAS:
			newmis.touch = GasGrenadeTouch;
			newmis.think = GasGrenadeExplode;
			newmis.skin = 3;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/grenade2.mdl");
			break;
		case GR_TYPE_EMP:
			newmis.touch = EMPGrenadeTouch;
			newmis.think = EMPGrenadeExplode;
			newmis.skin = 4;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/grenade2.mdl");
			break;
		case GR_TYPE_FLASH:			
			break;
		case GR_TYPE_CALTROP:
			newmis.touch = CanisterTouch;
			newmis.think = ScatterCaltrops;
			newmis.skin = 0;
			newmis.avelocity = '0 0 0';
			break;
		case GR_TYPE_IMPACT:
			newmis.weapon = 11;
			newmis.touch = ConcussionGrenadeTouch;
			newmis.think = ConcussionGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
			break;
	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, user.origin);
	oldself = self;
	self = self.owner;
	self = oldself;
	dremove (self);
};

void () TeamFortress_ThrowGrenade =
{
	if (!(self.tfstate & 1))
	{
		return;
	}
	self.tfstate = (self.tfstate | 1024);
};

float (float pc) IsLegalClass =
{
	local float bit;

	switch (pc) {
		case PC_SCOUT:
			bit = 1;
			break;
		case PC_SNIPER:
			bit = 2;
			break;
		case PC_SOLDIER:
			bit = 4;
			break;
		case PC_DEMOMAN:
			bit = 8;
			break;
		case PC_MEDIC:
			bit = 16;
			break;
		case PC_HWGUY:
			bit = 32;
			break;
		case PC_PYRO:
			bit = 64;
			break;
		case PC_SPY:
			bit = 256;
			break;
		case PC_ENGINEER:
			bit = 512;
			break;
		case PC_RANDOM:
			bit = 128;
			break;
		default:
			break;
	}

	if (((illegalclasses & bit) || (TeamFortress_TeamGetIllegalClasses (self.team_no) & bit)))
	{
		return (0);
	}
	return (1);
};

void (entity p) TeamFortress_SetSpeed =
{
	local string sp;
	local float tf;
	local entity te;
	local string st;

	stuffcmd (p, "cl_movespeedkey 1\n");
	if ((p.tfstate & 65536))
	{
		if ((0 == 1))
		{
			stuffcmd (p, "m_forward 0\n");
			stuffcmd (p, "m_side 0\n");
		}
		p.velocity = '0 0 0';
		stuffcmd (p, "cl_backspeed 0\n");
		stuffcmd (p, "cl_forwardspeed 0\n");
		stuffcmd (p, "cl_sidespeed 0\n");
		p.maxspeed = 0;
		return;
	}
	else
	{
		if ((0 == 1))
		{
			stuffcmd (p, "m_forward 1\n");
			stuffcmd (p, "m_side 0.8\n");
		}
	}
	switch(p.playerclass) {
		case PC_SCOUT:
			p.maxspeed = PC_SCOUT_MAXSPEED;
			break;
		case PC_SNIPER:
			p.maxspeed = PC_SNIPER_MAXSPEED;
			break;
		case PC_SOLDIER:
			p.maxspeed = PC_SOLDIER_MAXSPEED;
			break;
		case PC_DEMOMAN:
			p.maxspeed = PC_DEMOMAN_MAXSPEED;
			break;
		case PC_MEDIC:
			p.maxspeed = PC_MEDIC_MAXSPEED;
			break;
		case PC_HWGUY:
			p.maxspeed = PC_HWGUY_MAXSPEED;
			break;
		case PC_PYRO:
			p.maxspeed = PC_PYRO_MAXSPEED;
			break;
		case PC_SPY:
			p.maxspeed = PC_SPY_MAXSPEED;
			break;
		case PC_ENGINEER:
			p.maxspeed = PC_ENGINEER_MAXSPEED;
			break;
		case PC_CIVILIAN:
			if ((tfvsdm == 1))
				p.maxspeed = PC_CIVILIAN_DM_MAXSTRAFESPEED;
			else
				p.maxspeed = PC_CIVILIAN_MAXSPEED;
			break;
		default:
			st = infokey (world, "clan");
			if ((st == "on"))
				p.maxspeed = 0;
			else
				p.maxspeed = PC_SCOUT_MAXSPEED;												
			break;
	}
	tf = 0;
	te = find (world, classname, "item_tfgoal");
	while (((te != world) && (tf == 0)))
	{
		if ((te.owner == p))
		{
			if ((te.goal_activation & 2))
			{
				tf = 1;
				p.maxspeed = (p.maxspeed / 2);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if ((p.tfstate & 32768))
	{
		p.maxspeed = (p.maxspeed / 2);
	}
	if (p.leg_damage)
	{
		if ((p.leg_damage > 6))
		{
			p.leg_damage = 6;
		}
		p.maxspeed = (p.maxspeed * ((10 - p.leg_damage) / 10));
	}
	if ((p.tfstate & 2048))
	{
		if ((p.current_weapon == 32768))
		{
			if ((p.maxspeed > (p.maxspeed / 2)))
			{
				p.maxspeed = (p.maxspeed / 2);
			}
		}
		else
		{
			if ((p.maxspeed > _P))
			{
				p.maxspeed = _P;
			}
		}
	}
	sp = ftos (p.maxspeed);
	sp = "9999";
	stuffcmd (p, "cl_backspeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
	stuffcmd (p, "cl_forwardspeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
	stuffcmd (p, "cl_sidespeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
};

string(entity p) TeamFortress_GetSkin =
{
    local float tn;
    local float pc;
    local string st;
    local string skin = "base";

    tn = p.team_no;
    pc = p.playerclass;
    if (p.playerclass == PC_SPY) {
        if (p.undercover_team != 0) {
            tn = p.undercover_team;
        }
        if (p.undercover_skin != 0) {
            pc = p.undercover_skin;
        }
    }

	if (skins24b) {
	    if (tn == 4) {
	    	switch(pc) {
	    		case PC_SCOUT:
		    		st = infokey(world, "sk_t4_scout");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "gren_sco";
	    			break;
				case PC_SNIPER:
					st = infokey(world, "sk_t4_sniper");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "gren_sni";
	    			break;
				case PC_SOLDIER:
					st = infokey(world, "sk_t4_soldier");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "gren_sol";
	    			break;
				case PC_DEMOMAN:
					st = infokey(world, "sk_t4_demoman");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "gren_dem";
	    			break;
				case PC_MEDIC:
					st = infokey(world, "sk_t4_medic");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "gren_med";
	    			break;
				case PC_HWGUY:
					st = infokey(world, "sk_t4_hwguy");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "gren_hwg";
	    			break;
				case PC_PYRO:
					st = infokey(world, "sk_t4_pyro");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "gren_pyr";
	    			break;
				case PC_SPY:
					st = infokey(world, "sk_t4_spy");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "gren_spy";
	    			break;
				case PC_ENGINEER:
					st = infokey(world, "sk_t4_engineer");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "gren_eng";
	    			break;
				case PC_CIVILIAN:
		            	skin = "gren_civ";
	    			break;
	    		default:
	    			break;
	    	}
	    } else if (tn == 3) {
	    	switch(pc) {
	    		case PC_SCOUT:
		    		st = infokey(world, "sk_t3_scout");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "yell_sco";
	    			break;
				case PC_SNIPER:
					st = infokey(world, "sk_t3_sniper");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "yell_sni";
	            	break;
				case PC_SOLDIER:
					st = infokey(world, "sk_t3_soldier");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "yell_sol";
	    			break;
				case PC_DEMOMAN:
					st = infokey(world, "sk_t3_demoman");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "yell_dem";
	    			break;
				case PC_MEDIC:
					st = infokey(world, "sk_t3_medic");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "yell_med";
	    			break;
				case PC_HWGUY:
					st = infokey(world, "sk_t3_hwguy");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "yell_hwg";
	    			break;
				case PC_PYRO:
					st = infokey(world, "sk_t3_pyro");
		            if (st != string_null) {
		                skin = st;
		            }
		            else	            
		            	skin = "yell_pyr";
	    			break;
				case PC_SPY:
					st = infokey(world, "sk_t3_spy");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "yell_spy";
	    			break;
				case PC_ENGINEER:
					st = infokey(world, "sk_t3_engineer");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "yell_eng";
	    			break;
				case PC_CIVILIAN:
		            	skin = "yell_civ";
	    			break;
	    		default:
	    			break;
	    	}
	    } else if (tn == 2) {
	    	switch(pc) {
	    		case PC_SCOUT:
		    		st = infokey(world, "sk_t2_scout");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "red_sco";
	    			break;
				case PC_SNIPER:
					st = infokey(world, "sk_t2_sniper");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "red_sni";
	    			break;
				case PC_SOLDIER:
					st = infokey(world, "sk_t2_soldier");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "red_sol";
	    			break;
				case PC_DEMOMAN:
					st = infokey(world, "sk_t2_demoman");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "red_dem";
	    			break;
				case PC_MEDIC:
					st = infokey(world, "sk_t2_medic");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "red_med";
	    			break;
				case PC_HWGUY:
					st = infokey(world, "sk_t2_hwguy");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "red_hwg";
	    			break;
				case PC_PYRO:
					st = infokey(world, "sk_t2_pyro");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "red_pyr";
	    			break;
				case PC_SPY:
					st = infokey(world, "sk_t2_spy");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "red_spy";
	    			break;
				case PC_ENGINEER:
					st = infokey(world, "sk_t2_engineer");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "red_eng";
	    			break;
				case PC_CIVILIAN:
		            	skin = "red_civ";
	    			break;
	    		default:
	    			break;
	    	}
	    } else if (tn == 1) {
	    	switch(pc) {
	    		case PC_SCOUT:
		    		st = infokey(world, "sk_t1_scout");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "blue_sco";
	    			break;
				case PC_SNIPER:
					st = infokey(world, "sk_t1_sniper");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "blue_sni";
	    			break;
				case PC_SOLDIER:
					st = infokey(world, "sk_t1_soldier");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "blue_sol";
	    			break;
				case PC_DEMOMAN:
					st = infokey(world, "sk_t1_demoman");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "blue_dem";
	    			break;
				case PC_MEDIC:
					st = infokey(world, "sk_t1_medic");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "blue_med";
	    			break;
				case PC_HWGUY:
					st = infokey(world, "sk_t1_hwguy");
		            if (st != string_null) 
		                skin = st;	            
		            else	            
		            	skin = "blue_hwg";
	    			break;
				case PC_PYRO:
					st = infokey(world, "sk_t1_pyro");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "blue_pyr";
	    			break;
				case PC_SPY:
					st = infokey(world, "sk_t1_spy");
		            if (st != string_null) 
		                skin = st;
		            else	            
		            	skin = "blue_spy";
	    			break;
				case PC_ENGINEER:
					st = infokey(world, "sk_t1_engineer");
		            if (st != string_null)
		                skin = st;	            
		            else	            
		            	skin = "blue_eng";
	    			break;
				case PC_CIVILIAN:
					skin = "blue_civ";
	    			break;
	    		default:
	    			break;
	    	}
	    }

	} else {
		if ((tn == 4))
		{
			if ((tfvsdm == 1))
			{
				if ((pc == 1))
				{
					st = infokey (world, "sk_t4_civilian");
					if ((st != string_null))
						skin = st;
					else
						skin = "base";
				}
			}
			else
			{
				switch(pc) {
					case PC_SCOUT:
						st = infokey (world, "sk_t4_scout");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_scout";
						break;
					case PC_SNIPER:
						st = infokey (world, "sk_t4_sniper");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_snipe";
						break;
					case PC_SOLDIER:
						st = infokey (world, "sk_t4_soldier");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_sold";
						break;
					case PC_DEMOMAN:
						st = infokey (world, "sk_t4_demoman");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_demo";
						break;
					case PC_MEDIC:
						st = infokey (world, "sk_t4_medic");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_medic";
						break;
					case PC_HWGUY:
						st = infokey (world, "sk_t4_hwguy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_hwguy";
						break;
					case PC_PYRO:
						st = infokey (world, "sk_t4_pyro");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_pyro";
						break;
					case PC_SPY:
						st = infokey (world, "sk_t4_spy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_spy";
						break;
					case PC_ENGINEER:
						st = infokey (world, "sk_t4_engineer");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_eng";
						break;
				}			
			}
		}
		else if ((tn == 3))
		{
			if ((tfvsdm == 1))
			{
				if ((pc == 1))
				{
					st = infokey (world, "sk_t3_civilian");
					if ((st != string_null))
						skin = st;
					else
						skin = "base";
				}
			}
			else
			{
				switch(pc) {
					case PC_SCOUT:
						st = infokey (world, "sk_t3_scout");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_scout";
						break;
					case PC_SNIPER:
						st = infokey (world, "sk_t3_sniper");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_snipe";
						break;
					case PC_SOLDIER:
						st = infokey (world, "sk_t3_soldier");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_sold";
						break;
					case PC_DEMOMAN:
						st = infokey (world, "sk_t3_demoman");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_demo";
						break;
					case PC_MEDIC:
						st = infokey (world, "sk_t3_medic");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_medic";
						break;
					case PC_HWGUY:
						st = infokey (world, "sk_t3_hwguy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_hwguy";
						break;
					case PC_PYRO:
						st = infokey (world, "sk_t3_pyro");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_pyro";
						break;
					case PC_SPY:
						st = infokey (world, "sk_t3_spy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_spy";
						break;
					case PC_ENGINEER:
						st = infokey (world, "sk_t3_engineer");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_eng";
						break;
				}			
			}
		}
		else if ((tn == 2))
		{
			if ((tfvsdm == 1))
			{
				if ((pc == 1))
				{
					st = infokey (world, "sk_t2_civilian");
					if ((st != string_null))
						skin = st;
					else
						skin = "base";
				}
			}
			else
			{
				switch(pc) {
					case PC_SCOUT:
						st = infokey (world, "sk_t2_scout");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_scout";
						break;
					case PC_SNIPER:
						st = infokey (world, "sk_t2_sniper");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_snipe";
						break;
					case PC_SOLDIER:
						st = infokey (world, "sk_t2_soldier");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_sold";
						break;
					case PC_DEMOMAN:
						st = infokey (world, "sk_t2_demoman");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_demo";
						break;
					case PC_MEDIC:
						st = infokey (world, "sk_t2_medic");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_medic";
						break;
					case PC_HWGUY:
						st = infokey (world, "sk_t2_hwguy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_hwguy";
						break;
					case PC_PYRO:
						st = infokey (world, "sk_t2_pyro");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_pyro";
						break;
					case PC_SPY:
						st = infokey (world, "sk_t2_spy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_spy";
						break;
					case PC_ENGINEER:
						st = infokey (world, "sk_t2_engineer");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_eng";
						break;
				}			
			}
		}
		else
		{
			if ((tfvsdm == 1))
			{
				if ((pc == 1))
				{
					st = infokey (world, "sk_t1_civilian");
					if ((st != string_null))
						skin = st;
					else
						skin = "base";
				}
			}
			else
			{
				switch(pc) {
					case PC_SCOUT:
						st = infokey (world, "sk_t1_scout");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_scout";
						break;
					case PC_SNIPER:
						st = infokey (world, "sk_t1_sniper");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_snipe";
						break;
					case PC_SOLDIER:
						st = infokey (world, "sk_t1_soldier");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_sold";
						break;
					case PC_DEMOMAN:
						st = infokey (world, "sk_t1_demoman");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_demo";
						break;
					case PC_MEDIC:
						st = infokey (world, "sk_t1_medic");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_medic";
						break;
					case PC_HWGUY:
						st = infokey (world, "sk_t1_hwguy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_hwguy";
						break;
					case PC_PYRO:
						st = infokey (world, "sk_t1_pyro");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_pyro";
						break;
					case PC_SPY:
						st = infokey (world, "sk_t1_spy");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_spy";
						break;
					case PC_ENGINEER:
						st = infokey (world, "sk_t1_engineer");
						if (st != string_null)
							skin = st;
						else
							skin = "tf_eng";
						break;
				}			
			}
		}
	}
    return skin;
};

void (entity p) TeamFortress_SetSkin =
{
	local string st;
	local float tn;

	if ((p.playerclass == PC_SPY) && (p.undercover_skin != 0))
	{
		p.skin = p.undercover_skin;
	}
	else
	{
		p.skin = p.playerclass;
	}
	if (p.skin != 0)
	{
		stuffcmd (p, "skin ");
		st = TeamFortress_GetSkin (p);
		stuffcmd (p, st);
		stuffcmd (p, "\n");
	}
	else
	{
		stuffcmd (p, "skin base\n");
	}
};

void () TeamFortress_SetEquipment =
{
	
	local string st;
	local float kept_items;
	local float noitems;

	if ((self.classname != "player"))
	{
		return;
	}
	kept_items = (self.tf_items & (131072 | 262144));
	self.items = 0;
	self.last_weaponmode = 0;
	self.last_weapon = 0;
	self.current_weapon = 0;
	self.weapons_carried = 0;
	self.tf_items = 0;
	if ((self.playerclass != 1))
	{
		self.tf_items_flags = 0;
	}
	self.armorclass = 0;
	self.impulse = 0;
	self.undercover_skin = 0;
	if ((self.undercover_team != 0))
	{
		self.immune_to_check = (time + 5);
		self.undercover_team = 0;
		stuffcmd (self, "color ");
		st = ftos ((TeamFortress_GetColor (self.team_no) - 1));
		stuffcmd (self, st);
		stuffcmd (self, "\n");
	}
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
	self.tfstate = (self.tfstate - (self.tfstate & 2));
	self.items = (self.items | kept_items);
	switch (self.playerclass) {
		case PC_SCOUT:
			TeamFortress_Scout();
			break;
		case PC_SNIPER:
			TeamFortress_Sniper();
			break;
		case PC_SOLDIER:		
			TeamFortress_Soldier();
			break;
		case PC_DEMOMAN:			
			TeamFortress_Demoman();
			break;	
		case PC_MEDIC:
			TeamFortress_Medic();
			break;
 		case PC_HWGUY:			
			TeamFortress_Hwguy();
			break;
		case PC_PYRO:			
			TeamFortress_Pyro();
			break;		
		case PC_SPY:			
			TeamFortress_Spy();
			break;
		case PC_ENGINEER:			
			TeamFortress_Engineer();
			break;
		case PC_CIVILIAN:			
			TeamFortress_Civilian();
			break;
		default:
			self.items = 0;
			self.ammo_rockets = 0;
			self.ammo_nails = 0;
			self.ammo_shells = 0;
			self.ammo_cells = 0;
			self.no_grenades_1 = 0;
			self.no_grenades_2 = 0;
			self.tp_grenades_1 = 0;
			self.tp_grenades_2 = 0;
			self.armorclass = 0;
			self.armortype = 0;
			self.armorvalue = 0;
			self.weapon = 0;
			self.current_weapon = 0;
			self.weapons_carried = 0;
			self.flags = 8;
			self.gravity = 1;
			self.waterlevel = -1;
			self.takedamage = 0;
			self.solid = 0;
			self.model = string_null;
			self.mdl = string_null;
			self.modelindex = 0;
			self.weaponmodel = string_null;
			modelindex_player = 0;
			self.tfstate = (self.tfstate | 2);
			self.max_health = 1;
			self.takedamage = 0;
			setmodel (self, string_null);
			break;
	}
	self.health = self.max_health;
	if (self.playerclass)
	{
		if (rounds)
		{
			self.armorvalue = self.maxarmor;
			self.ammo_detpack = self.maxammo_detpack;
			self.no_grenades_1 = 4;
			self.ammo_rockets = ceil ((self.maxammo_rockets / 2));
			if ((self.playerclass == PC_MEDIC))
			{
				self.ammo_nails = 100;
			}
			else
			{
				self.ammo_nails = ceil ((self.maxammo_nails / 2));
			}
			if (((self.playerclass != 6) && (self.playerclass != 8)))
			{
				self.ammo_shells = ceil ((self.maxammo_shells / 2));
			}
			self.ammo_cells = ceil ((self.maxammo_cells / 2));
		}
		if (tfstrike)
		{
			self.ammo_detpack = 0;
			if ((self.team_no == 2))
			{
				self.maxammo_detpack = 1;
				self.weapons_carried = (self.weapons_carried | 131072);
				self.items_allowed = (self.items_allowed | 131072);
			}
			else
			{
				self.maxammo_detpack = 0;
				self.weapons_carried = (self.weapons_carried - (self.weapons_carried & 131072));
				self.items_allowed = (self.items_allowed - (self.items_allowed & 131072));
			}
		}
		if (allow_hook)
		{
			self.weapons_carried = (self.weapons_carried | 1);
		}
	}
	if ((self.armortype >= 0.8))
	{
		self.items = (self.items | 32768);
	}
	else if ((self.armortype >= 0.6))
	{
		self.items = (self.items | 16384);
	}		
	else if ((self.armortype >= 0.3))
	{
		self.items = (self.items | 8192);
	}
	
	noitems = stof (infokey (world, "noitems"));
	if (noitems & 1)
	{
		self.no_grenades_1 = 0;
		self.tp_grenades_1 = 0;
	}
	if (noitems & 2)
	{
		self.no_grenades_2 = 0;
		self.tp_grenades_2 = 0;
	}
	if (noitems & 4)
	{
		self.ammo_detpack = 0;
		self.maxammo_detpack = 0;
	}
	if (practice)
	{
		self.armorvalue = 0;
		self.health = 1000;
		self.ammo_rockets = self.maxammo_rockets;
		self.ammo_nails = self.maxammo_nails;
		self.ammo_shells = self.maxammo_shells;
		self.ammo_cells = self.maxammo_cells;
	}
	W_SetCurrentAmmo ();
};

float (entity Retriever, float AmmoType) TeamFortress_GetMaxAmmo =
{
	local float maxammo = 0
	switch (AmmoType) {
		case ITEM_MEDKIT:
			maxammo = Retriever.maxammo_medikit;
			break;
		case ITEM_SHELLS:
			maxammo = Retriever.maxammo_shells;
			break;
		case ITEM_NAILS:
			maxammo = Retriever.maxammo_nails;
			break;
		case ITEM_ROCKETS:
			maxammo = Retriever.maxammo_rockets;
			break;
		case ITEM_CELLS:
			maxammo = Retriever.maxammo_cells;
			break;
		case ITEM_DETPACK:
			maxammo = Retriever.maxammo_detpack;
			break;
	}
//	dprint ("Error in TeamFortress_GetMaxAmmo()\n");
//	dprint ("Invalid ammo type passed.\n");
	return (maxammo);
};

float (entity Retriever, float WeaponType) TeamFortress_CanGetWeapon =
{
	if (Retriever.items_allowed & WeaponType)
	{
		return (1);
	}
	return (0);
};

void (entity Player, float Armorclass) TeamFortress_DescribeArmor =
{
	local string st;

	if (Armorclass == 0)
	{
		return;
	}
	if (Armorclass & 16)
	{
		sprint (Player, 2, "Asbestos ");
	}
	if (Armorclass & 2)
	{
		sprint (Player, 2, "Wooden ");
	}
	if (Armorclass & 4)
	{
		sprint (Player, 2, "Blast ");
	}
	if (Armorclass & 8)
	{
		sprint (Player, 2, "Shockproof ");
	}
	if (Armorclass & 1)
	{
		sprint (Player, 2, "Kevlar ");
	}
	sprint (Player, 2, "armor\n");
};

void (entity Retriever, entity Items) TeamFortress_AddBackpackItems =
{
	return;
};

string (float pc) TeamFortress_GetClassName =
{
	local string name = "Observer";
	switch(pc) {
		case PC_OBSERVER:
			name = "Observer";
			break;
		case PC_SCOUT:
			name = "Scout";
			break;
		case PC_SNIPER:
			name = "Sniper";
			break;
		case PC_SOLDIER:
			name = "Soldier";
			break;
		case PC_DEMOMAN:
			name = "Demolitions Man";
			break;
		case PC_MEDIC:
			name = "Combat Medic";
			break;
		case PC_HWGUY:
			name = "Heavy Weapons Guy";
			break;
		case PC_PYRO:
			name = "Pyro";
			break;
		case PC_SPY:
			name = "Spy";
			break;
		case PC_ENGINEER:
			name = "Engineer";
			break;
		case PC_RANDOM:
			name = "Random Playerclass";
			break;
		case PC_CIVILIAN:
			if (tfvsdm == 1)			
				name = "Ranger";
			else
				name = "Civilian";
			break;
	}
	return name;
};

void (entity Viewer, float pc, float rpc) TeamFortress_PrintClassName =
{
	local string st;

	st = TeamFortress_GetClassName (pc);
	sprint (Viewer, 2, st);
	if (rpc != 0)
	{
		sprint (Viewer, 2, " (Random)");
	}
	sprint (Viewer, 2, "\n");
};

void () TeamFortress_RemoveTimers =
{
	local entity te;

	self.leg_damage = 0;
	self.is_undercover = 0;
	self.is_building = 0;
	self.building = world;
	if (self.tfstate & TFSTATE_AIMING)
	{
		self.tfstate = (self.tfstate - TFSTATE_AIMING);
		TeamFortress_SetSpeed (self);
		self.heat = 0;
	}
	if (self.tfstate & TFSTATE_INFECTED)
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_INFECTED));
	}
	if (self.tfstate & TFSTATE_HALLUCINATING)
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_HALLUCINATING));
	}
	te = find (world, classname, "timer");
	while (te != world)
	{
		if ((te.owner == self) && (te.no_active_gas_grens <= 0))
		{
			dremove (te);
			te = find (world, classname, "timer");
		}
		else
		{
			te = find (te, classname, "timer");
		}
	}
	te = find (world, classname, "grentimer");
	while (te != world)
	{
		if ((te.owner == self) && (te.no_active_napalm_grens <= 0))
		{
			dremove (te);
			te = find (world, classname, "grentimer");
		}
		else
		{
			te = find (te, classname, "grentimer");
		}
	}
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if (te.owner == self)
		{
			if (!(te.goal_activation & 256) || (self.has_disconnected == 1))
			{
				tfgoalitem_RemoveFromPlayer (te, self, 0);
			}
			if ((CTF_Map == 1) && (te.goal_no == 1))
			{
				bprint (2, self.netname);
				bprint (2, " лост the блуе flag!\n");
			}
			else if ((CTF_Map == 1) && (te.goal_no == 2))
			{
				bprint (2, self.netname);
				bprint (2, " лост the ред flag!\n");
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if ((te.weaponmode == 1) && (te.enemy == self))
		{
			te.weaponmode = 0;
		}
		te = find (te, classname, "detpack");
	}
	TeamFortress_DetonatePipebombs ();
	if (self.has_disconnected == 1)
	{
		te = find (world, classname, "grenade");
		while (te)
		{
			if ((te.owner == self) && (te.model == "progs/caltrop.mdl"))
			{
				dremove (te);
				te = find (world, classname, "grenade");
			}
			else
			{
				te = find (te, classname, "grenade");
			}
		}
	}
	self.item_list = 0;
	CenterPrint (self, "\n");
	if (!round_active)
	{
		self.menu_count = 30;
		self.current_menu = 1;
	}
	self.impulse = 0;
};

void () TeamFortress_SetupRespawn =
{
	local float restime;
	local string db;

	if (self.respawn_time > time)
	{
		return;
	}
	if (toggleflags & TFLAG_RESPAWNDELAY)
	{
		restime = respawn_delay_time;
	}
	else
	{
		restime = 0;
	}
	if (!restime)
	{
		self.respawn_time = 0;
	}
	else
	{
		self.respawn_time = (time + restime);
		if ((restime > 3))
		{
			db = ftos (restime);
			sprint (self, 2, db);
			sprint (self, 2, " seconds till respawn.\n");
		}
	}
};

void () TeamFortress_CheckClassStats =
{
	if ((self.armortype > self.armor_allowed))
	{
		self.armortype = self.armor_allowed;
	}
	if ((self.armorvalue > self.maxarmor))
	{
		self.armorvalue = self.maxarmor;
	}
	if ((self.armortype < 0))
	{
		self.armortype = 0;
	}
	if ((self.armorvalue < 0))
	{
		self.armorvalue = 0;
	}
	if ((self.ammo_shells > TeamFortress_GetMaxAmmo (self, ITEM_SHELLS)))
	{
		self.ammo_shells = TeamFortress_GetMaxAmmo (self, ITEM_SHELLS);
	}
	if ((self.ammo_shells < 0))
	{
		self.ammo_shells = 0;
	}
	if ((self.ammo_nails > TeamFortress_GetMaxAmmo (self, ITEM_NAILS)))
	{
		self.ammo_nails = TeamFortress_GetMaxAmmo (self, ITEM_NAILS);
	}
	if ((self.ammo_nails < 0))
	{
		self.ammo_nails = 0;
	}
	if ((self.ammo_rockets > TeamFortress_GetMaxAmmo (self, ITEM_ROCKETS)))
	{
		self.ammo_rockets = TeamFortress_GetMaxAmmo (self, ITEM_ROCKETS);
	}
	if ((self.ammo_rockets < 0))
	{
		self.ammo_rockets = 0;
	}
	if ((self.ammo_cells > TeamFortress_GetMaxAmmo (self, ITEM_CELLS)))
	{
		self.ammo_cells = TeamFortress_GetMaxAmmo (self, ITEM_CELLS);
	}
	if ((self.ammo_cells < 0))
	{
		self.ammo_cells = 0;
	}
	if ((self.ammo_medikit > TeamFortress_GetMaxAmmo (self, ITEM_MEDKIT)))
	{
		self.ammo_medikit = TeamFortress_GetMaxAmmo (self, ITEM_MEDKIT);
	}
	if ((self.ammo_medikit < 0))
	{
		self.ammo_medikit = 0;
	}
	if ((self.ammo_detpack > TeamFortress_GetMaxAmmo (self, ITEM_DETPACK)))
	{
		self.ammo_detpack = TeamFortress_GetMaxAmmo (self, ITEM_DETPACK);
	}
	if ((self.ammo_detpack < 0))
	{
		self.ammo_detpack = 0;
	}
	if ((self.no_grenades_1 < 0))
	{
		self.no_grenades_1 = 0;
	}
	if ((self.no_grenades_2 < 0))
	{
		self.no_grenades_2 = 0;
	}
	if ((self.health > self.max_health) && !(self.items & ITEM_SUPERHEALTH))
	{
		TF_T_Damage (self, world, world, (self.max_health - self.health), 0, 256);
	}
	if ((self.health < 0))
	{
		T_Heal (self, (self.health - self.health), 0);
	}
	self.items = (self.items - (self.items & (ITEM_ARMOR1 | ITEM_ARMOR2 | ITEM_ARMOR3)));
	if ((self.armortype >= 0.8))
	{
		self.items = (self.items | ITEM_ARMOR3);
	}
	else if ((self.armortype >= 0.6))
	{
			self.items = (self.items | ITEM_ARMOR2);
	}
	else if ((self.armortype >= 0.3))
	{
		self.items = (self.items | ITEM_ARMOR1);
	}
};

void () TeamFortress_AssaultWeapon =
{
	local float it;

	self.impulse = 0;
	if (self.tfstate & TFSTATE_RELOADING)
	{
		return;
	}
	if !(self.weapons_carried & WEAP_ASSAULT_CANNON)
	{
		return;
	}
	if (self.heat > 0)
	{
		sprint (self, 2, "the assault cannon is still overheated.\n");
		return;
	}
	if (self.ammo_shells < 1)
	{
		sprint (self, 2, "not enough ammo.\n");
		return;
	}
	if (self.ammo_cells < 6)
	{
		sprint (self, 2, "not enough cells to power the assault cannon.\n");
		return;
	}
	self.current_weapon = WEAP_ASSAULT_CANNON;
	W_SetCurrentAmmo ();
};

void (entity Gren) TeamFortress_ExplodePerson =
{
	local entity te;

	Gren.owner.tfstate = (Gren.owner.tfstate - (Gren.owner.tfstate & TFSTATE_GRENPRIMED));
	KickPlayer (-2, Gren.owner);
	newmis = spawn ();
	newmis.movetype = 10;
	newmis.solid = 2;
	newmis.classname = "grenade";
	newmis.team_no = Gren.owner.team_no;
	newmis.owner = Gren.owner;
	newmis.velocity = '0 0 0';
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = SUB_Null;
	newmis.nextthink = (time + 0.1);
	switch(Gren.weapon) {
		case GR_TYPE_NORMAL:
			newmis.touch = NormalGrenadeTouch;
			newmis.think = NormalGrenadeExplode;
			newmis.skin = 0;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
			break;
		case GR_TYPE_CONCUSSION:
			newmis.touch = ConcussionGrenadeTouch;
			newmis.think = ConcussionGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
			break;
		case GR_TYPE_NAIL:
			newmis.touch = NailGrenadeTouch;
			newmis.think = NailGrenadeExplode;
			newmis.skin = 1;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_MIRV:
			newmis.touch = MirvGrenadeTouch;
			newmis.think = MirvGrenadeExplode;
			newmis.skin = 0;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_NAPALM:
			newmis.touch = NapalmGrenadeTouch;
			newmis.think = NapalmGrenadeExplode;
			newmis.skin = 2;
			newmis.avelocity = '0 300 0';
			setmodel (newmis, "progs/biggren.mdl");
			break;
		case GR_TYPE_FLARE:
			sprint (Gren.owner, 2, "Flare lit.\n");
			te = spawn ();
			te.touch = SUB_Null;
			te.think = RemoveFlare;
			te.nextthink = (time + 25);
			te.owner = Gren.owner;
			te.solid = 0;
			Gren.owner.effects = (Gren.owner.effects | 4);
			dremove (Gren);
			dremove (newmis);
			break;
		case GR_TYPE_GAS:
			newmis.touch = GasGrenadeTouch;
			newmis.think = GasGrenadeExplode;
			newmis.skin = 2;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/grenade2.mdl");
			break;
		case GR_TYPE_EMP:
			newmis.touch = EMPGrenadeTouch;
			newmis.think = EMPGrenadeExplode;
			newmis.skin = 4;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/grenade2.mdl");
			break;
		case GR_TYPE_FLASH:
			break;
		case GR_TYPE_CALTROP:
			newmis.touch = CaltropTouch;
			newmis.think = ScatterCaltrops;
			break;
		case GR_TYPE_IMPACT:
			newmis.weapon = 11;
            newmis.touch = ConcussionGrenadeTouch;
            newmis.think = ConcussionGrenadeExplode;
            newmis.skin = 1;
            newmis.avelocity = '300 300 300';
            setmodel (newmis, "progs/hgren2.mdl");
			break;

	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, Gren.owner.origin);
	switch  (Gren.owner.playerclass) {
		case PC_SCOUT:
			if (Gren.weapon != GR_TYPE_CALTROP)
				bprint3 (1, "No ", Gren.owner.netname, ", swallowing the grenade isn't very effective!\n");
			break;
		case PC_SNIPER:
				bprint3 (1, "Well ", Gren.owner.netname, ", don't quit your day job!\n");
			break;
		case PC_SOLDIER:
				bprint3 (1, "Ummm, ", Gren.owner.netname, ", you're supposed to THROW the grenade!\n");
			break;
		case PC_DEMOMAN:
				bprint3 (1, "Ack! ", Gren.owner.netname, "! The grenade is your friend for another reason!\n");				
			break;
		case PC_MEDIC:
				bprint3 (1, "No ", Gren.owner.netname, "! Assist your own suicide some other time!\n");
			break;
		case PC_HWGUY:
				bprint3 (1, "Hey ", Gren.owner.netname, ", you're not THAT heavy!\n");
			break;
		case PC_PYRO:
				bprint3 (1, "Yes ", Gren.owner.netname, ", the grenade does explode on '3'!\n");
			break;
		case PC_SPY:
				bprint3 (1, "You do realize ", Gren.owner.netname, ", you can blow your cover in easier ways!\n");
			break;
		case PC_ENGINEER:
			bprint3 (1, "Hey ", Gren.owner.netname, ", study grenade dynamics on your own time!\n");
			break;
		default:
			bprint3 (1, "No ", Gren.owner.netname, ", throw the grenade, not the pin!\n");
			break;
	}
	dremove (Gren);
};

void () NormalGrenadeTouch =
{
	if (other == self.owner)
	{
		return;
	}
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NormalGrenadeExplode =
{
	deathmsg = 8;
	T_RadiusDamage (self, self.owner, 180, world);
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};

void () TeamFortress_DisplayDetectionItems =
{
	local entity Goal;
	local entity te;

	Goal = find (world, classname, "info_tfdetect");
	if (!Goal)
	{
		return;
	}
	if (Goal.display_item_status1 != 0)
	{
		te = Finditem (Goal.display_item_status1);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, 2, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if (Goal.display_item_status2 != 0)
	{
		te = Finditem (Goal.display_item_status2);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, 2, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if (Goal.display_item_status3 != 0)
	{
		te = Finditem (Goal.display_item_status3);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, 2, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if (Goal.display_item_status4 != 0)
	{
		te = Finditem (Goal.display_item_status4);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, 2, "Item is missing.\n");
		}
	}
};

void () BioInfection_Decay =
{
	local entity te;
	local entity Bio;

	if (((teamplay & 16) && (self.owner.team_no == self.enemy.team_no)) && (self.owner.team_no != 0))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_INFECTED));
		dremove (self);
		return;
	}
	else
	{
		if (self.invincible_finished > time)
		{
			self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_INFECTED));
			dremove (self);
			return;
		}
	}
	if (!(self.owner.tfstate & TFSTATE_INFECTED) || (self.owner.playerclass == PC_MEDIC))
	{
		dremove (self);
		return;
	}
	te = findradius (self.owner.origin, _P);
	while ((te != world) && (te != self.owner))
	{
		if (((te.classname == "player") && (te.deadflag == 0)) && te.playerclass)
		{
			if !(te.tfstate & TFSTATE_INFECTED)
			{
				if (te.playerclass != PC_MEDIC)
				{
					if !(((teamplay & TEAMPLAY_NOEXPLOSIVE) && (self.owner.team_no == self.enemy.team_no)) && (self.owner.team_no != 0))
					{
						Bio = spawn ();
						Bio.nextthink = 2;
						Bio.think = BioInfection_Decay;
						Bio.owner = te;
						Bio.classname = "timer";
						Bio.enemy = self.enemy;
						te.tfstate = (te.tfstate | 16);
						te.infection_team_no = self.owner.infection_team_no;
						sprint (te, 1, "You have been infected by ");
						sprint (te, 1, self.owner.netname);
						sprint (te, 1, "!\n");
						sprint (self.owner, 1, "You have infected ");
						sprint (self.owner, 1, te.netname);
						sprint (self.owner, 1, "!\n");
					}
				}
			}
		}
		te = te.chain;
	}
	self.nextthink = (time + 3);
	deathmsg = 13;
	TF_T_Damage (self.owner, self, self.enemy, 8, 1, 0);
	SpawnBlood (self.owner.origin, 30);
};

void () BioInfection_MonsterDecay =
{
	self.nextthink = (time + 2);
	T_Damage (self.enemy, self, self.owner, 5);
	SpawnBlood (self.enemy.origin, 20);
	if ((self.enemy.health < 1))
	{
		dremove (self);
	}
};

void (string halias, float himpulse1, float himpulse2) TeamFortress_Alias =
{
	local string imp;

	stuffcmd (self, "alias ");
	stuffcmd (self, halias);
	stuffcmd (self, " \"impulse ");
	imp = ftos (himpulse1);
	stuffcmd (self, imp);
	if (himpulse2 != 0)
	{
		stuffcmd (self, ";wait; impulse ");
		imp = ftos (himpulse2);
		stuffcmd (self, imp);
	}
	stuffcmd (self, "\"\n");
};

float (vector veca, vector vecb) crossproduct =
{
	local float result;

	result = ((veca_x * vecb_y) - (vecb_x * veca_y));
	return (result);
};

void (entity pl, float fr, float type) TF_AddFrags =
{
	local entity e;

	if ((intermission_running != 0) || (intermission_exittime > time))
	{
		return;
	}
	if ((type == 1))
	{
		pl.real_frags = (pl.real_frags + fr);
	}
	if (!pl.team_no)
	{
		return;
	}
	if ((toggleflags & TFLAG_FULLTEAMSCORE))
	{
		if ((pl.team_no == 1))
			team1score = (team1score + fr);
		else if ((pl.team_no == 2))
			team2score = (team2score + fr);
		else if ((pl.team_no == 3))
			team3score = (team3score + fr);
		else if ((pl.team_no == 4))
			team4score = (team4score + fr);
	}
	if (pl.team_no == 1)
		team1frags = (team1frags + fr);
	else if (pl.team_no == 2)
		team2frags = (team2frags + fr);
	else if (pl.team_no == 3)
		team3frags = (team3frags + fr);
	else if (pl.team_no == 4)
		team4frags = (team4frags + fr);
	if (toggleflags & TFLAG_FULLTEAMSCORE)
	{
		e = find (world, classname, "player");
		while (e)
		{
			if ((e.team_no == pl.team_no))
			{
				e.frags = TeamFortress_TeamGetScore (e.team_no);
			}
			e = find (e, classname, "player");
		}
	}
	else if (!(toggleflags & TFLAG_TEAMFRAGS))
	{
		pl.frags = (pl.frags + fr);
	}
};

void (entity p) TeamFortress_ExecClassScript =
{
	local string st;

	st = infokey (p, "ec");
	if (st == string_null)
	{
		st = infokey (p, "exec_class");
	}
	if ((st == "on") || (self.tfkey & 2))
	{
		switch(p.playerclass) {
			case PC_SCOUT:
				stuffcmd (p, "exec scout.cfg\n");
				break;
			case PC_SNIPER:
				stuffcmd (p, "exec sniper.cfg\n");
				break;
			case PC_SOLDIER:
				stuffcmd (p, "exec soldier.cfg\n");
				break;
			case PC_DEMOMAN:
				stuffcmd (p, "exec demoman.cfg\n");
				break;
			case PC_MEDIC:
				stuffcmd (p, "exec medic.cfg\n");
				break;
			case PC_HWGUY:
				stuffcmd (p, "exec hwguy.cfg\n");
				break;
			case PC_PYRO:
				stuffcmd (p, "exec pyro.cfg\n");
				break;
			case PC_SPY:
				stuffcmd (p, "exec spy.cfg\n");
				break;
			case PC_ENGINEER:
				stuffcmd (p, "exec engineer.cfg\n");
				break;
			case PC_CIVILIAN:
				stuffcmd (p, "exec dm.cfg\n");
				break;
		}
	}
};

void (entity p) TeamFortress_ExecMapScript =
{
	local string st;

	st = infokey (p, "em");
	if (st == string_null)
	{
		st = infokey (p, "exec_map");
	}
	if ((st == "on") || (self.tfkey & 4))
	{
		stuffcmd (p, "exec mapdefault.cfg\n");
		stuffcmd (p, "exec ");
		stuffcmd (p, mapname);
		stuffcmd (p, ".cfg\n");
	}
};