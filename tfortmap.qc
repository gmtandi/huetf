//=-=-=-=-=
void () TF_PlaceItem;
void () TF_StartItem;
void () TF_PlaceGoal;
void () TF_StartGoal;
void () info_tfdetect;
void () info_player_teamspawn;
void () info_tfgoal;
void () info_tfgoal_timer;
void () item_tfgoal;
entity (float gno) Findteamspawn;
void (entity Goal) InactivateGoal;
void (entity Goal) RestoreGoal;
void (entity Goal) RemoveGoal;
float (entity Goal, entity Player, entity AP) IsAffectedBy;
void (entity Goal, entity Player, entity AP, float addb) Apply_Results;
float (entity Goal, entity AP) APMeetsCriteria;
void (entity Goal) SetupRespawn;
void () DoRespawn;
void (entity Item, entity AP) DoItemGroupWork;
void (entity Goal, entity AP) DoTriggerWork;
void (entity Goal, entity Player) RemoveResults;
void () info_tfgoal_use;
void () tfgoal_timer_tick;
void () item_tfgoal_touch;
void () tfgoalitem_remove;
void (entity Item, float PAlive, entity P) tfgoalitem_drop;
void (entity Item) tfgoalitem_checkgoalreturn;
void (entity P) ForceRespawn;

void () CheckModel =
{
	if ((self.mdl == "models/flag.mdl"))
	{
		self.mdl = "progs/tf_stan.mdl";
		if ((self.skin == SBAR_GRENS))
		{
			self.skin = SBAR_PRINT;
		}
		else
		{
			if ((self.skin == SBAR_PRINT))
			{
				self.skin = SBAR_GRENS;
			}
		}
	}
	if ((self.mdl == "models/backpack.mdl"))
	{
		self.mdl = "progs/backpack.mdl";
	}
	if ((self.mdl == "models/keycard.mdl"))
	{
		if ((self.owned_by == SBAR_GRENS))
		{
			self.mdl = "progs/basbkey.bsp";
		}
		else
		{
			if ((self.owned_by == SBAR_PRINT))
			{
				self.mdl = "progs/basrkey.bsp";
			}
		}
	}
	if ((self.mdl == "models/w_suit.mdl"))
	{
		self.mdl = "progs/suit.mdl";
	}
	if ((self.mdl == "models/r_armor.mdl"))
	{
		self.mdl = "progs/armor.mdl";
	}
	if ((self.mdl == "models/ball.mdl"))
	{
		self.mdl = "progs/ball2.mdl";
	}
};

void (entity Goal) UpdateAbbreviations =
{
	local string st;
	local float flag;

	if ((Goal.has_abbreviated == 0))
	{
		if (((Goal.g_a != 0) && (Goal.goal_activation == 0)))
		{
			Goal.goal_activation = Goal.g_a;
		}
		if (((Goal.g_e != 0) && (Goal.goal_effects == 0)))
		{
			Goal.goal_effects = Goal.g_e;
		}
		if (((Goal.h_i_g != 0) && (Goal.has_item_from_group == 0)))
		{
			Goal.has_item_from_group = Goal.h_i_g;
		}
		if (((Goal.hn_i_g != 0) && (Goal.hasnt_item_from_group == 0)))
		{
			Goal.hasnt_item_from_group = Goal.hn_i_g;
		}
		if (((Goal.r_i_g != 0) && (Goal.remove_item_group == 0)))
		{
			Goal.remove_item_group = Goal.r_i_g;
		}
		if (((Goal.a_s != 0) && (Goal.ammo_shells == 0)))
		{
			Goal.ammo_shells = Goal.a_s;
		}
		if (((Goal.a_n != 0) && (Goal.ammo_nails == 0)))
		{
			Goal.ammo_nails = Goal.a_n;
		}
		if (((Goal.a_r != 0) && (Goal.ammo_rockets == 0)))
		{
			Goal.ammo_rockets = Goal.a_r;
		}
		if (((Goal.a_c != 0) && (Goal.ammo_cells == 0)))
		{
			Goal.ammo_cells = Goal.a_c;
		}
		if (((Goal.rv_s_h != 0) && (Goal.remove_spawngroup == 0)))
		{
			Goal.remove_spawngroup = Goal.rv_s_h;
		}
		if (((Goal.rs_s_h != 0) && (Goal.restore_spawngroup == 0)))
		{
			Goal.restore_spawngroup = Goal.rs_s_h;
		}
		if (((Goal.rv_gr != 0) && (Goal.remove_group_no == 0)))
		{
			Goal.remove_group_no = Goal.rv_gr;
		}
		if (((Goal.rs_gr != 0) && (Goal.restore_group_no == 0)))
		{
			Goal.restore_group_no = Goal.rs_gr;
		}
		if (((Goal.rv_g != 0) && (Goal.remove_goal_no == 0)))
		{
			Goal.remove_goal_no = Goal.rv_g;
		}
		if (((Goal.rs_g != 0) && (Goal.restore_goal_no == 0)))
		{
			Goal.restore_goal_no = Goal.rs_g;
		}
		if ((Goal.t_s_h != string_null))
		{
			Goal.team_str_home = Goal.t_s_h;
		}
		if ((Goal.t_s_m != string_null))
		{
			Goal.team_str_moved = Goal.t_s_m;
		}
		if ((Goal.t_s_c != string_null))
		{
			Goal.team_str_carried = Goal.t_s_c;
		}
		if ((Goal.n_s_h != string_null))
		{
			Goal.non_team_str_home = Goal.n_s_h;
		}
		if ((Goal.n_s_m != string_null))
		{
			Goal.non_team_str_moved = Goal.n_s_m;
		}
		if ((Goal.n_s_c != string_null))
		{
			Goal.non_team_str_carried = Goal.n_s_c;
		}
		if ((Goal.b_b != string_null))
		{
			Goal.broadcast = Goal.b_b;
		}
		if ((Goal.b_t != string_null))
		{
			Goal.team_broadcast = Goal.b_t;
		}
		if ((Goal.b_n != string_null))
		{
			Goal.non_team_broadcast = Goal.b_n;
		}
		if ((Goal.b_o != string_null))
		{
			Goal.owners_team_broadcast = Goal.b_o;
		}
		if ((Goal.n_b != string_null))
		{
			Goal.netname_broadcast = Goal.n_b;
		}
		if ((Goal.n_t != string_null))
		{
			Goal.netname_team_broadcast = Goal.n_t;
		}
		if ((Goal.n_n != string_null))
		{
			Goal.netname_non_team_broadcast = Goal.n_n;
		}
		if ((Goal.n_o != string_null))
		{
			Goal.netname_owners_team_broadcast = Goal.n_o;
		}
		if ((Goal.d_t != string_null))
		{
			Goal.team_drop = Goal.d_t;
		}
		if ((Goal.d_n != string_null))
		{
			Goal.non_team_drop = Goal.d_n;
		}
		if ((Goal.d_n_t != string_null))
		{
			Goal.netname_team_drop = Goal.d_n_t;
		}
		if ((Goal.d_n_n != string_null))
		{
			Goal.netname_non_team_drop = Goal.d_n_n;
		}
		if ((flagem_checked == 0))
		{
			st = infokey (world, "flag_drop");
			if ((st == "on"))
			{
				toggleflags = (toggleflags | 8);
			}
			st = infokey (world, "flag_solid");
			if ((st == "on"))
			{
				toggleflags = (toggleflags | SBAR_240);
			}
			flag = stof (infokey (world, "flag_model"));
			if ((flag == SBAR_GRENS))
			{
				toggleflags = (toggleflags | 4096);
			}
			else
			{
				if ((flag == SBAR_PRINT))
				{
					toggleflags = (toggleflags | 8192);
				}
				else
				{
					if ((flag == AS_MELEE))
					{
						toggleflags = (toggleflags | 16384);
					}
				}
			}
			flagem_checked = SBAR_GRENS;
		}
		if ((toggleflags & 4096))
		{
			if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
			{
				precache_model2 ("progs/tf_flag.mdl");
				Goal.mdl = "progs/tf_flag.mdl";
				Goal.skin = SBAR_GRENS;
			}
			else
			{
				if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
				{
					precache_model2 ("progs/tf_flag.mdl");
					Goal.mdl = "progs/tf_flag.mdl";
					Goal.skin = SBAR_PRINT;
				}
				else
				{
					if (((Goal.mdl == "progs/tf_stan.mdl") || (Goal.mdl == "progs/flag.mdl")))
					{
						precache_model2 ("progs/tf_flag.mdl");
						Goal.mdl = "progs/tf_flag.mdl";
					}
				}
			}
		}
		else
		{
			if ((toggleflags & 8192))
			{
				if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
				{
					precache_model2 ("progs/tf_stan.mdl");
					Goal.mdl = "progs/tf_stan.mdl";
					Goal.skin = SBAR_GRENS;
				}
				else
				{
					if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
					{
						precache_model2 ("progs/tf_stan.mdl");
						Goal.mdl = "progs/tf_stan.mdl";
						Goal.skin = SBAR_PRINT;
					}
					else
					{
						if (((Goal.mdl == "progs/tf_flag.mdl") || (Goal.mdl == "progs/flag.mdl")))
						{
							precache_model2 ("progs/tf_stan.mdl");
							Goal.mdl = "progs/tf_stan.mdl";
						}
					}
				}
			}
			else
			{
				if ((toggleflags & 16384))
				{
					if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
					{
						precache_model2 ("progs/flag.mdl");
						Goal.mdl = "progs/flag.mdl";
						Goal.skin = SBAR_GRENS;
					}
					else
					{
						if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
						{
							precache_model2 ("progs/flag.mdl");
							Goal.mdl = "progs/flag.mdl";
							Goal.skin = SBAR_PRINT;
						}
						else
						{
							if (((Goal.mdl == "progs/tf_flag.mdl") || (Goal.mdl == "progs/tf_stan.mdl")))
							{
								precache_model2 ("progs/flag.mdl");
								Goal.mdl = "progs/flag.mdl";
							}
						}
					}
				}
			}
		}
		Goal.has_abbreviated = SBAR_GRENS;
	}
};

void () TF_PlaceItem =
{
	local float oldz;

	self.flags = 256;
	self.velocity = '0 0 0';
	if ((self.goal_activation & 2048))
	{
		self.movetype = 6;
		self.origin_z = (self.origin_z + 6);
		oldz = self.origin_z;
		if (!droptofloor ())
		{
			dprint ("GoalItem fell out of level at ");
			dprint (vtos (self.origin));
			dprint ("\n");
			dremove (self);
			return;
		}
	}
	self.movetype = 0;
	self.oldorigin = self.origin;
	if ((self.goal_activation & 512))
	{
		if ((self.owned_by == SBAR_GRENS))
		{
			self.effects = (self.effects | 64);
		}
		else
		{
			if ((self.owned_by == SBAR_PRINT))
			{
				self.effects = (self.effects | 128);
			}
			else
			{
				self.effects = (self.effects | 8);
			}
		}
	}
	if ((item_list_bit == 0))
	{
		item_list_bit = SBAR_GRENS;
	}
	self.item_list = item_list_bit;
	item_list_bit = (item_list_bit * SBAR_PRINT);
};

void () TF_StartItem =
{
	UpdateAbbreviations (self);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	if ((self.goal_state == AS_MELEE))
	{
		RemoveGoal (self);
	}
};

void () TF_PlaceGoal =
{
	local float oldz;

	if ((self.classname != "info_tfgoal_timer"))
	{
		if ((self.goal_activation & SBAR_GRENS))
		{
			self.touch = tfgoal_touch;
		}
	}
	else
	{
		self.think = tfgoal_timer_tick;
		self.nextthink = (time + self.search_time);
		self.classname = "info_tfgoal";
	}
	if ((self.goal_activation & 2048))
	{
		self.movetype = 6;
		self.origin_z = (self.origin_z + 6);
		oldz = self.origin_z;
		if (!droptofloor ())
		{
			dprint ("Goal fell out of level at ");
			dprint (vtos (self.origin));
			dprint ("\n");
			dremove (self);
			return;
		}
	}
	self.flags = 256;
	self.movetype = 0;
	self.velocity = '0 0 0';
	self.oldorigin = self.origin;
};

void () TF_StartGoal =
{
	UpdateAbbreviations (self);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceGoal;
	self.use = info_tfgoal_use;
	if ((self.goal_state == AS_MELEE))
	{
		RemoveGoal (self);
	}
};

float () CheckExistence =
{
	UpdateAbbreviations (self);
	skill = cvar ("skill");
	if (((self.ex_skill_min == -1) && (skill < 0)))
	{
		return (0);
	}
	else
	{
		if (((self.ex_skill_max == -1) && (skill > 0)))
		{
			return (0);
		}
	}
	if (((self.ex_skill_min && (self.ex_skill_min != -1)) && (skill < self.ex_skill_min)))
	{
		return (0);
	}
	else
	{
		if (((self.ex_skill_max && (self.ex_skill_max != -1)) && (skill > self.ex_skill_max)))
		{
			return (0);
		}
	}
	return (SBAR_GRENS);
};

void () info_tfdetect =
{
	UpdateAbbreviations (self);
};

void () info_player_teamspawn =
{
	local entity te;

	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (((self.team_no <= 0) || (self.team_no > AS_MISSILE)))
	{
		objerror ("error: bad team_no associated with info_player_teamspawn\n");
		dremove (self);
		return;
	}
	if ((number_of_teams < self.team_no))
	{
		number_of_teams = self.team_no;
	}
	if ((self.team_no == SBAR_GRENS))
	{
		self.team_str_home = "ts1";
	}
	else
	{
		if ((self.team_no == SBAR_PRINT))
		{
			self.team_str_home = "ts2";
		}
		else
		{
			if ((self.team_no == AS_MELEE))
			{
				self.team_str_home = "ts3";
			}
			else
			{
				if ((self.team_no == AS_MISSILE))
				{
					self.team_str_home = "ts4";
				}
			}
		}
	}
};

void () i_p_t =
{
	self.classname = "info_player_teamspawn";
	info_player_teamspawn ();
};

void () info_tfgoal =
{
	local float mapversion;

	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	mapversion = stof (infokey (world, "*bspversion"));
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	self.solid = SBAR_GRENS;
	if ((mapversion == 30))
	{
		CheckModel ();
		if (self.mdl)
		{
			precache_model (self.mdl);
			precache_model2 (self.mdl);
			setmodel (self, self.mdl);
			if ((self.goal_min == '0 0 0'))
			{
				self.goal_min = '-16 -16 -24';
			}
			if ((self.goal_max == '0 0 0'))
			{
				self.goal_max = '16 16 32';
			}
			setsize (self, self.goal_min, self.goal_max);
		}
		else
		{
			setmodel (self, self.model);
			self.movetype = 0;
			self.modelindex = 0;
			self.model = "";
		}
		self.touch = tfgoal_touch;
	}
	else
	{
		if (self.mdl)
		{
			precache_model (self.mdl);
			precache_model2 (self.mdl);
			setmodel (self, self.mdl);
		}
		if ((self.goal_min == '0 0 0'))
		{
			self.goal_min = '-16 -16 -24';
		}
		if ((self.goal_max == '0 0 0'))
		{
			self.goal_max = '16 16 32';
		}
		setsize (self, self.goal_min, self.goal_max);
		TF_StartGoal ();
	}
	if ((self.goal_state == 0))
	{
		self.goal_state = SBAR_PRINT;
	}
};

void () i_t_g =
{
	self.classname = "info_tfgoal";
	info_tfgoal ();
};

void () info_tfgoal_timer =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (self.mdl)
	{
		CheckModel ();
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	if ((self.search_time <= 0))
	{
		dprint ("Timer Goal created with no specified time.\n");
		dremove (self);
	}
	self.solid = 0;
	if ((self.goal_state == 0))
	{
		self.goal_state = SBAR_PRINT;
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-16 -16 -24';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '16 16 32';
	}
	setsize (self, self.goal_min, self.goal_max);
	TF_StartGoal ();
};

void () i_t_t =
{
	self.classname = "info_tfgoal_timer";
	info_tfgoal_timer ();
};

void () item_tfgoal =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (self.mdl)
	{
		CheckModel ();
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	else
	{
		self.mdl = "";
		setmodel (self, "");
	}
	precache_sound2 ("items/itembk2.wav");
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	self.touch = item_tfgoal_touch;
	if ((self.goal_state == 0))
	{
		self.goal_state = SBAR_PRINT;
	}
	if (((self.goal_activation & 8192) || (toggleflags & SBAR_240)))
	{
		self.solid = SBAR_PRINT;
	}
	else
	{
		self.solid = SBAR_GRENS;
	}
	setorigin (self, self.origin);
	if (!self.netname)
	{
		self.netname = "goalitem";
	}
	if ((self.pausetime <= 0))
	{
		self.pausetime = _2;
	}
	if (((self.delay != 0) && (self.pausetime == 0)))
	{
		self.pausetime = self.delay;
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-16 -16 -24';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '16 16 32';
	}
	setsize (self, self.goal_min, self.goal_max);
	TF_StartItem ();
};

void (entity AD) ParseTFDetect =
{
	local float fl;

	if ((AD.team_broadcast != string_null))
	{
		team_menu_string = AD.team_broadcast;
	}
	localcmd (AD.message);
	cvar_set ("sv_maxspeed", "600");
	if ((AD.hook_out == SBAR_GRENS))
	{
		allow_hook = SBAR_GRENS;
	}
	fl = stof (infokey (world, "t1maxplayers"));
	if (fl)
	{
		AD.ammo_medikit = fl;
	}
	fl = stof (infokey (world, "t2maxplayers"));
	if (fl)
	{
		AD.ammo_detpack = fl;
	}
	fl = stof (infokey (world, "t3maxplayers"));
	if (fl)
	{
		AD.maxammo_medikit = fl;
	}
	fl = stof (infokey (world, "t4maxplayers"));
	if (fl)
	{
		AD.maxammo_detpack = fl;
	}
	if ((AD.ammo_medikit < SBAR_GRENS))
	{
		AD.ammo_medikit = _d;
	}
	if ((AD.ammo_detpack < SBAR_GRENS))
	{
		AD.ammo_detpack = _d;
	}
	if ((AD.maxammo_medikit < SBAR_GRENS))
	{
		AD.maxammo_medikit = _d;
	}
	if ((AD.maxammo_detpack < SBAR_GRENS))
	{
		AD.maxammo_detpack = _d;
	}
	team1maxplayers = AD.ammo_medikit;
	team2maxplayers = AD.ammo_detpack;
	team3maxplayers = AD.maxammo_medikit;
	team4maxplayers = AD.maxammo_detpack;
	illegalclasses = AD.playerclass;
	fl = stof (infokey (world, "t1illclasses"));
	if (fl)
	{
		AD.maxammo_shells = fl;
	}
	fl = stof (infokey (world, "t2illclasses"));
	if (fl)
	{
		AD.maxammo_nails = fl;
	}
	fl = stof (infokey (world, "t3illclasses"));
	if (fl)
	{
		AD.maxammo_rockets = fl;
	}
	fl = stof (infokey (world, "t4illclasses"));
	if (fl)
	{
		AD.maxammo_cells = fl;
	}
	civilianteams = 0;
	if ((AD.maxammo_shells == -1))
	{
		civilianteams = (civilianteams | SBAR_GRENS);
	}
	if ((AD.maxammo_nails == -1))
	{
		civilianteams = (civilianteams | SBAR_PRINT);
	}
	if ((AD.maxammo_rockets == -1))
	{
		civilianteams = (civilianteams | AS_MISSILE);
	}
	if ((AD.maxammo_cells == -1))
	{
		civilianteams = (civilianteams | 8);
	}
};

entity (float ino) Finditem =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "item_tfgoal");
	while (tg)
	{
		if ((tg.goal_no == ino))
		{
			return (tg);
		}
		tg = find (tg, classname, "item_tfgoal");
	}
	dprint ("Could not find an item with a goal_no of ");
	st = ftos (ino);
	dprint (st);
	dprint (".\n");
};

entity (float gno) Findgoal =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "info_tfgoal");
	while (tg)
	{
		if ((tg.goal_no == gno))
		{
			return (tg);
		}
		tg = find (tg, classname, "info_tfgoal");
	}
	dprint ("Could not find a goal with a goal_no of ");
	st = ftos (gno);
	dprint (st);
	dprint (".\n");
};

entity (float gno) Findteamspawn =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "info_player_teamspawn");
	while (tg)
	{
		if ((tg.goal_no == gno))
		{
			return (tg);
		}
		tg = find (tg, classname, "info_player_teamspawn");
	}
	dprint ("Could not find a Teamspawn with a goal_no of ");
	st = ftos (gno);
	dprint (st);
	dprint (".\n");
};

void (entity Goal) InactivateGoal =
{
	if ((Goal.goal_state == SBAR_GRENS))
	{
		if ((Goal.search_time == 0))
		{
			if ((((Goal.goal_activation & 8192) || (toggleflags & SBAR_240)) && (Goal.classname == "item_tfgoal")))
			{
				Goal.solid = SBAR_PRINT;
			}
			else
			{
				Goal.solid = SBAR_GRENS;
			}
		}
		Goal.goal_state = SBAR_PRINT;
		if ((Goal.mdl != string_null))
		{
			setmodel (Goal, Goal.mdl);
		}
	}
};

void (entity Goal) RestoreGoal =
{
	if ((Goal.goal_state == AS_MELEE))
	{
		if ((Goal.search_time == 0))
		{
			if ((((Goal.goal_activation & 8192) || (toggleflags & SBAR_240)) && (Goal.classname == "item_tfgoal")))
			{
				Goal.solid = SBAR_PRINT;
			}
			else
			{
				Goal.solid = SBAR_GRENS;
			}
		}
		else
		{
			Goal.nextthink = (time + Goal.search_time);
		}
		Goal.goal_state = SBAR_PRINT;
		if ((Goal.mdl != string_null))
		{
			setmodel (Goal, Goal.mdl);
		}
	}
};

void (entity Goal) RemoveGoal =
{
	Goal.solid = 0;
	Goal.goal_state = AS_MELEE;
	if ((Goal.mdl != string_null))
	{
		setmodel (Goal, string_null);
	}
};

float (entity Goal, entity Player, entity AP) IsAffectedBy =
{
	local float genv;

	if (!Player.playerclass)
	{
		return (0);
	}
	if ((Goal.goal_effects & space))
	{
		genv = pointcontents (Goal.origin);
		if ((pointcontents (Player.origin) != genv))
		{
			return (0);
		}
	}
	if ((Goal.t_length != 0))
	{
		if ((vlen ((Goal.origin - Player.origin)) <= Goal.t_length))
		{
			if ((Goal.goal_effects & SBAR_240))
			{
				traceline (Goal.origin, Player.origin, SBAR_GRENS, Goal);
				if ((trace_fraction == SBAR_GRENS))
				{
					return (SBAR_GRENS);
				}
			}
			else
			{
				return (SBAR_GRENS);
			}
		}
	}
	if ((Goal.classname != "info_tfgoal_timer"))
	{
		if (((Goal.goal_effects & SBAR_GRENS) && (Player == AP)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & SBAR_PRINT) && (AP.team_no == Player.team_no)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & AS_MISSILE) && (AP.team_no != Player.team_no)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & 8) && (Player != AP)))
		{
			return (SBAR_GRENS);
		}
	}
	if (((Goal.maxammo_shells != 0) && (Player.team_no == Goal.maxammo_shells)))
	{
		return (SBAR_GRENS);
	}
	if (((Goal.maxammo_nails != 0) && (Player.team_no != Goal.maxammo_shells)))
	{
		return (SBAR_GRENS);
	}
	return (0);
};

void (entity Goal, entity Player, entity AP, float addb) Apply_Results =
{
	local entity oldself;
	local entity te;
	local entity oldte;
	local float captime;
	local string st;

	stuffcmd (Player, "bf\n");
	if ((Goal.classname == "item_tfgoal"))
	{
		Player.item_list = (Player.item_list | Goal.item_list);
	}
	if ((Player == AP))
	{
		if ((Goal.count > 0))
		{
			if ((Player.team_no > 0))
			{
				if (rounds)
				{
					if (speedcap)
					{
						te = find (world, classname, "round");
						captime = (time - te.invisible_time);
						if ((captime != 0))
						{
							st = ftos (captime);
							bprint (SBAR_PRINT, Player.netname);
							bprint (SBAR_PRINT, " Captured the flag in ");
							bprint (SBAR_PRINT, st);
							bprint (SBAR_PRINT, " seconds\n");
						}
					}
					if (round_active)
					{
						tfs_winner = Player.team_no;
					}
				}
				TeamFortress_TeamIncreaseScore (Player.team_no, Goal.count);
				TeamFortress_TeamShowScores (SBAR_PRINT);
			}
		}
	}
	if (addb)
	{
		if ((Player.health > 0))
		{
			if ((Goal.health > 0))
			{
				T_Heal (Player, Goal.health, 0);
			}
			if ((Goal.health < 0))
			{
				if (((0 - Player.health) > Goal.health))
				{
					TF_T_Damage (Player, Goal, Goal, (Player.health - Goal.health), SBAR_GRENS, 0);
				}
				else
				{
					TF_T_Damage (Player, Goal, Goal, (0 - Goal.health), SBAR_GRENS, 0);
				}
			}
		}
		if ((Player.health > 0))
		{
			if ((Goal.armortype > 0))
			{
				Player.armortype = Goal.armortype;
			}
			else
			{
				if ((Goal.armorvalue > 0))
				{
					Player.armortype = Player.armor_allowed;
				}
			}
			Player.armorvalue = (Player.armorvalue + Goal.armorvalue);
			if ((Goal.armorclass > 0))
			{
				Player.armorclass = Goal.armorclass;
			}
			Player.ammo_shells = (Player.ammo_shells + Goal.ammo_shells);
			Player.ammo_nails = (Player.ammo_nails + Goal.ammo_nails);
			Player.ammo_rockets = (Player.ammo_rockets + Goal.ammo_rockets);
			Player.ammo_cells = (Player.ammo_cells + Goal.ammo_cells);
			Player.ammo_medikit = (Player.ammo_medikit + Goal.ammo_medikit);
			Player.ammo_detpack = (Player.ammo_detpack + Goal.ammo_detpack);
			Player.no_grenades_1 = (Player.no_grenades_1 + Goal.no_grenades_1);
			Player.no_grenades_2 = (Player.no_grenades_2 + Goal.no_grenades_2);
			if ((Player.no_grenades_1 > AS_MISSILE))
			{
				Player.no_grenades_1 = AS_MISSILE;
			}
			if ((Player.no_grenades_2 > AS_MISSILE))
			{
				Player.no_grenades_2 = AS_MISSILE;
			}
			if (((Player.tp_grenades_1 == AS_MELEE) && (Player.no_grenades_1 > SBAR_PRINT)))
			{
				Player.no_grenades_1 = SBAR_PRINT;
			}
			if (((Player.tp_grenades_2 == AS_MELEE) && (Player.no_grenades_2 > SBAR_PRINT)))
			{
				Player.no_grenades_2 = SBAR_PRINT;
			}
			if ((Player.ammo_detpack > Player.maxammo_detpack))
			{
				Player.ammo_detpack = Player.maxammo_detpack;
			}
			if ((Player.tfstate & SBAR_GRENS))
			{
				te = find (world, classname, "primer");
				while (te)
				{
					if ((te.owner == Player))
					{
						if (((te.impulse == 151) && (Player.no_grenades_2 <= 0)))
						{
							Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
							Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
							dremove (te);
						}
						else
						{
							if (((te.impulse == 150) && (Player.no_grenades_1 <= 0)))
							{
								Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
								Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
								dremove (te);
							}
						}
						te = world;
					}
					else
					{
						te = find (te, classname, "primer");
					}
				}
			}
			if ((Goal.invincible_finished > 0))
			{
				Player.items = (Player.items | 1048576);
				Player.invincible_time = SBAR_GRENS;
				Player.invincible_finished = (time + Goal.invincible_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | space);
					Player.invincible_finished = (time + 666);
				}
			}
			if ((Goal.invisible_finished > 0))
			{
				Player.items = (Player.items | 524288);
				Player.invisible_time = SBAR_GRENS;
				Player.invisible_finished = (time + Goal.invisible_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 64);
					Player.invisible_finished = (time + 666);
				}
			}
			if ((Goal.super_damage_finished > 0))
			{
				Player.items = (Player.items | 4194304);
				Player.super_time = SBAR_GRENS;
				Player.super_damage_finished = (time + Goal.super_damage_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 128);
					Player.super_damage_finished = (time + 666);
				}
			}
			if ((Goal.radsuit_finished > 0))
			{
				Player.items = (Player.items | 2097152);
				Player.rad_time = SBAR_GRENS;
				Player.radsuit_finished = (time + Goal.radsuit_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 256);
					Player.radsuit_finished = (time + 666);
				}
			}
		}
		if (Goal.frags)
		{
			if (((Goal.goal_effects == SBAR_GRENS) || !(toggleflags & 2048)))
			{
				TF_AddFrags (Player, Goal.frags, 0);
			}
		}
		oldself = self;
		self = Player;
		TeamFortress_CheckClassStats ();
		W_SetCurrentAmmo ();
		self = oldself;
	}
	if (((Player.playerclass == 8) && (Goal.goal_result & SBAR_240)))
	{
		self.immune_to_check = (time + 5);
		Spy_RemoveDisguise (Player);
	}
	if (((Goal.items != 0) && (Goal.classname != "item_tfgoal")))
	{
		te = Finditem (Goal.items);
		if (((te != world) && (te != Goal)))
		{
			tfgoalitem_GiveToPlayer (te, Player, Goal);
		}
	}
	if ((Goal.axhitme != 0))
	{
		te = Finditem (Goal.axhitme);
		if ((te.owner == Player))
		{
			tfgoalitem_RemoveFromPlayer (te, Player, SBAR_GRENS);
		}
	}
	if ((Goal.remove_item_group != 0))
	{
		te = find (world, classname, "item_tfgoal");
		while (te)
		{
			if (((te.group_no == Goal.remove_item_group) && (te.owner == AP)))
			{
				oldte = te;
				te = find (te, classname, "item_tfgoal");
				tfgoalitem_RemoveFromPlayer (oldte, Player, SBAR_GRENS);
			}
			else
			{
				te = find (te, classname, "item_tfgoal");
			}
		}
	}
	if ((Goal.display_item_status1 != 0))
	{
		te = Finditem (Goal.display_item_status1);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status2 != 0))
	{
		te = Finditem (Goal.display_item_status2);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status3 != 0))
	{
		te = Finditem (Goal.display_item_status3);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status4 != 0))
	{
		te = Finditem (Goal.display_item_status4);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.goal_result & space))
	{
		ForceRespawn (Player);
	}
};

void (entity Goal, entity Player) RemoveResults =
{
	local entity oldself;
	local entity te;
	local float puinvin;
	local float puinvis;
	local float puquad;
	local float purad;

	if ((Goal.classname == "item_tfgoal"))
	{
		if (!(Player.item_list & Goal.item_list))
		{
			return;
		}
		if ((Goal.goal_activation & 1024))
		{
			return;
		}
		Player.item_list = (Player.item_list - (Player.item_list & Goal.item_list));
	}
	if ((Goal.health > 0))
	{
		TF_T_Damage (Player, Goal, Goal, Goal.health, SBAR_GRENS, 0);
	}
	if ((Goal.health < 0))
	{
		T_Heal (Player, (0 - Goal.health), 0);
	}
	Player.armortype = (Player.armortype - Goal.armortype);
	Player.armorvalue = (Player.armorvalue - Goal.armorvalue);
	Player.armorclass = (Player.armorclass - (Player.armorclass & Goal.armorclass));
	if (Goal.frags)
	{
		if (((Goal.goal_effects == SBAR_GRENS) || !(toggleflags & 2048)))
		{
			TF_AddFrags (Player, Goal.frags, 0);
		}
	}
	Player.ammo_shells = (Player.ammo_shells - Goal.ammo_shells);
	Player.ammo_nails = (Player.ammo_nails - Goal.ammo_nails);
	Player.ammo_rockets = (Player.ammo_rockets - Goal.ammo_rockets);
	Player.ammo_cells = (Player.ammo_cells - Goal.ammo_cells);
	Player.ammo_medikit = (Player.ammo_medikit - Goal.ammo_medikit);
	Player.ammo_detpack = (Player.ammo_detpack - Goal.ammo_detpack);
	Player.no_grenades_1 = (Player.no_grenades_1 - Goal.no_grenades_1);
	Player.no_grenades_2 = (Player.no_grenades_2 - Goal.no_grenades_2);
	if ((Player.no_grenades_1 > AS_MISSILE))
	{
		Player.no_grenades_1 = AS_MISSILE;
	}
	if ((Player.no_grenades_2 > AS_MISSILE))
	{
		Player.no_grenades_2 = AS_MISSILE;
	}
	if (((Player.tp_grenades_1 == AS_MELEE) && (Player.no_grenades_1 > SBAR_PRINT)))
	{
		Player.no_grenades_1 = SBAR_PRINT;
	}
	if (((Player.tp_grenades_2 == AS_MELEE) && (Player.no_grenades_2 > SBAR_PRINT)))
	{
		Player.no_grenades_2 = SBAR_PRINT;
	}
	if ((Player.ammo_detpack > Player.maxammo_detpack))
	{
		Player.ammo_detpack = Player.maxammo_detpack;
	}
	if ((Player.tfstate & SBAR_GRENS))
	{
		te = find (world, classname, "primer");
		while (te)
		{
			if ((te.owner == Player))
			{
				if (((te.impulse == 151) && (Player.no_grenades_2 <= 0)))
				{
					Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
					Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
					dremove (te);
				}
				else
				{
					if (((te.impulse == 150) && (Player.no_grenades_1 <= 0)))
					{
						Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
						Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
						dremove (te);
					}
				}
				te = world;
			}
			else
			{
				te = find (te, classname, "primer");
			}
		}
	}
	puinvin = 0;
	puinvis = 0;
	puquad = 0;
	purad = 0;
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if (((te.owner == Player) && (te != Goal)))
		{
			if ((te.invincible_finished > 0))
			{
				puinvin = SBAR_GRENS;
			}
			if ((te.invisible_finished > 0))
			{
				puinvis = SBAR_GRENS;
			}
			if ((te.super_damage_finished > 0))
			{
				puquad = SBAR_GRENS;
			}
			if ((te.radsuit_finished > 0))
			{
				purad = SBAR_GRENS;
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (((Goal.invincible_finished > 0) && !puinvin))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & space));
		Player.items = (Player.items | 1048576);
		Player.invincible_time = SBAR_GRENS;
		Player.invincible_finished = (time + Goal.invincible_finished);
	}
	if (((Goal.invisible_finished > 0) && !puinvis))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 64));
		Player.items = (Player.items | 524288);
		Player.invisible_time = SBAR_GRENS;
		Player.invisible_finished = (time + Goal.invisible_finished);
	}
	if (((Goal.super_damage_finished > 0) && !puquad))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 128));
		Player.items = (Player.items | 4194304);
		Player.super_time = SBAR_GRENS;
		Player.super_damage_finished = (time + Goal.super_damage_finished);
	}
	if (((Goal.radsuit_finished > 0) && !purad))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 256));
		Player.items = (Player.items | 2097152);
		Player.rad_time = SBAR_GRENS;
		Player.radsuit_finished = (time + Goal.radsuit_finished);
	}
	oldself = self;
	self = Player;
	TeamFortress_CheckClassStats ();
	W_SetCurrentAmmo ();
	self = oldself;
};

float (entity Goal, entity AP) APMeetsCriteria =
{
	local float gotone;
	local entity te;
	local string db;

	if ((AP != world))
	{
		if (Goal.team_no)
		{
			if ((Goal.team_no != AP.team_no))
			{
				return (0);
			}
		}
		if (Goal.playerclass)
		{
			if ((Goal.playerclass != AP.playerclass))
			{
				return (0);
			}
		}
		if (Goal.items_allowed)
		{
			te = Finditem (Goal.items_allowed);
			if ((te.owner != AP))
			{
				return (0);
			}
		}
	}
	if (Goal.if_goal_is_active)
	{
		te = Findgoal (Goal.if_goal_is_active);
		if ((te.goal_state != SBAR_GRENS))
		{
			return (0);
		}
	}
	if (Goal.if_goal_is_inactive)
	{
		te = Findgoal (Goal.if_goal_is_inactive);
		if ((te.goal_state != SBAR_PRINT))
		{
			return (0);
		}
	}
	if (Goal.if_goal_is_removed)
	{
		te = Findgoal (Goal.if_goal_is_removed);
		if ((te.goal_state != AS_MELEE))
		{
			return (0);
		}
	}
	if (Goal.if_group_is_active)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_active))
			{
				if ((te.goal_state != SBAR_GRENS))
				{
					return (0);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_group_is_inactive)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_inactive))
			{
				if ((te.goal_state != SBAR_PRINT))
				{
					return (0);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_group_is_removed)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_removed))
			{
				if ((te.goal_state != AS_MELEE))
				{
					return (0);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_item_has_moved)
	{
		te = Finditem (Goal.if_item_has_moved);
		if (te)
		{
			if (((te.goal_state != SBAR_GRENS) && (te.origin == te.oldorigin)))
			{
				return (0);
			}
		}
	}
	if (Goal.if_item_hasnt_moved)
	{
		te = Finditem (Goal.if_item_hasnt_moved);
		if (te)
		{
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return (0);
			}
		}
	}
	if ((AP != world))
	{
		gotone = 0;
		if (Goal.has_item_from_group)
		{
			te = find (world, classname, "item_tfgoal");
			while (((te != world) && !gotone))
			{
				if (((te.group_no == Goal.has_item_from_group) && (te.owner == AP)))
				{
					gotone = SBAR_GRENS;
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!gotone)
			{
				return (0);
			}
		}
		if (Goal.hasnt_item_from_group)
		{
			te = find (world, classname, "item_tfgoal");
			while (((te != world) && !gotone))
			{
				if (((te.group_no == Goal.hasnt_item_from_group) && (te.owner == AP)))
				{
					return (0);
				}
				te = find (te, classname, "item_tfgoal");
			}
		}
	}
	return (SBAR_GRENS);
};

void (entity Goal) SetupRespawn =
{
	if ((Goal.search_time != 0))
	{
		InactivateGoal (Goal);
		Goal.think = tfgoal_timer_tick;
		Goal.nextthink = (time + Goal.search_time);
		return;
	}
	if ((Goal.goal_result & SBAR_GRENS))
	{
		RemoveGoal (Goal);
		return;
	}
	if ((Goal.wait > 0))
	{
		Goal.nextthink = (time + Goal.wait);
		Goal.think = DoRespawn;
		return;
	}
	else
	{
		if ((Goal.wait == -1))
		{
			return;
		}
	}
	InactivateGoal (Goal);
};

void () DoRespawn =
{
	RestoreGoal (self);
	InactivateGoal (self);
};

float (entity Goal, entity AP) Activated =
{
	local float APMet;
	local float RevAct;
	local float Act;

	if ((Goal.goal_state == SBAR_GRENS))
	{
		return (0);
	}
	if ((Goal.goal_state == AS_MELEE))
	{
		return (0);
	}
	if ((Goal.goal_state == AS_MISSILE))
	{
		return (0);
	}
	APMet = APMeetsCriteria (Goal, AP);
	if ((Goal.classname == "item_tfgoal"))
	{
		RevAct = (Goal.goal_activation & 64);
	}
	else
	{
		RevAct = (Goal.goal_activation & AS_MISSILE);
	}
	Act = 0;
	if (APMet)
	{
		if (!RevAct)
		{
			Act = SBAR_GRENS;
		}
	}
	else
	{
		if (RevAct)
		{
			Act = SBAR_GRENS;
		}
	}
	return (Act);
};

void (entity Goal, entity AP, entity ActivatingGoal) AttemptToActivate =
{
	local entity te;
	local string st;

	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (Activated (Goal, AP))
	{
		if ((ActivatingGoal == Goal))
		{
			DoResults (Goal, AP, SBAR_GRENS);
		}
		else
		{
			if ((ActivatingGoal != world))
			{
				DoResults (Goal, AP, (ActivatingGoal.goal_result & SBAR_PRINT));
			}
			else
			{
				DoResults (Goal, AP, 0);
			}
		}
	}
	else
	{
		if ((Goal.else_goal != 0))
		{
			te = Findgoal (Goal.else_goal);
			if (te)
			{
				AttemptToActivate (te, AP, Goal);
			}
		}
	}
};

void (entity Goal, entity AP) DoGoalWork =
{
	local entity te;
	local entity RI;

	if ((Goal.activate_goal_no != 0))
	{
		te = Findgoal (Goal.activate_goal_no);
		if (te)
		{
			AttemptToActivate (te, AP, Goal);
		}
	}
	if ((Goal.inactivate_goal_no != 0))
	{
		te = Findgoal (Goal.inactivate_goal_no);
		if (te)
		{
			InactivateGoal (te);
		}
	}
	if ((Goal.restore_goal_no != 0))
	{
		te = Findgoal (Goal.restore_goal_no);
		if (te)
		{
			RestoreGoal (te);
		}
	}
	if ((Goal.remove_goal_no != 0))
	{
		te = Findgoal (Goal.remove_goal_no);
		if (te)
		{
			RemoveGoal (te);
		}
	}
	if ((Goal.return_item_no != 0))
	{
		te = Finditem (Goal.return_item_no);
		if (te)
		{
			if ((te.goal_state == SBAR_GRENS))
			{
				tfgoalitem_RemoveFromPlayer (te, te.owner, SBAR_GRENS);
			}
			RI = spawn ();
			RI.enemy = te;
			RI.weapon = SBAR_PRINT;
			RI.think = ReturnItem;
			RI.nextthink = (time + 0.1);
			te.solid = 0;
		}
	}
	if ((Goal.remove_spawnpoint != 0))
	{
		te = Findteamspawn (Goal.remove_spawnpoint);
		if (te)
		{
			te.goal_state = AS_MELEE;
			te.team_str_home = string_null;
		}
	}
	if ((Goal.restore_spawnpoint != 0))
	{
		te = Findteamspawn (Goal.restore_spawnpoint);
		if (te)
		{
			if ((te.goal_state == AS_MELEE))
			{
				te.goal_state = SBAR_PRINT;
				if ((te.team_no == SBAR_GRENS))
				{
					te.team_str_home = "ts1";
				}
				else
				{
					if ((te.team_no == SBAR_PRINT))
					{
						te.team_str_home = "ts2";
					}
					else
					{
						if ((te.team_no == AS_MELEE))
						{
							te.team_str_home = "ts3";
						}
						else
						{
							if ((te.team_no == AS_MISSILE))
							{
								te.team_str_home = "ts4";
							}
						}
					}
				}
			}
		}
	}
};

void (entity Goal, entity AP) DoGroupWork =
{
	local string st;
	local entity tg;
	local float allset;

	if ((Goal.all_active != 0))
	{
		if ((Goal.last_impulse == 0))
		{
			dprint ("Goal ");
			st = ftos (Goal.goal_no);
			dprint (st);
			dprint (" has a .all_active specified, but no .last_impulse\n");
		}
		else
		{
			allset = SBAR_GRENS;
			tg = find (world, classname, "info_tfgoal");
			while (tg)
			{
				if ((tg.group_no == Goal.all_active))
				{
					if ((tg.goal_state != SBAR_GRENS))
					{
						allset = 0;
					}
				}
				tg = find (tg, classname, "info_tfgoal");
			}
			if (allset)
			{
				tg = Findgoal (Goal.last_impulse);
				if (tg)
				{
					DoResults (tg, AP, (Goal.goal_result & SBAR_PRINT));
				}
			}
		}
	}
	if ((Goal.activate_group_no != 0))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.activate_group_no))
			{
				DoResults (tg, AP, 0);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.inactivate_group_no != 0))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.inactivate_group_no))
			{
				InactivateGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.remove_group_no != 0))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.remove_group_no))
			{
				RemoveGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.restore_group_no != 0))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.restore_group_no))
			{
				RestoreGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.remove_spawngroup != 0))
	{
		tg = find (world, classname, "info_player_teamspawn");
		while (tg)
		{
			if ((tg.group_no == Goal.remove_spawngroup))
			{
				tg.goal_state = AS_MELEE;
				tg.team_str_home = string_null;
			}
			tg = find (tg, classname, "info_player_teamspawn");
		}
	}
	if ((Goal.restore_spawngroup != 0))
	{
		tg = find (world, classname, "info_player_teamspawn");
		while (tg)
		{
			if ((tg.group_no == Goal.restore_spawngroup))
			{
				tg.goal_state = SBAR_PRINT;
				if ((tg.team_no == SBAR_GRENS))
				{
					tg.team_str_home = "ts1";
				}
				else
				{
					if ((tg.team_no == SBAR_PRINT))
					{
						tg.team_str_home = "ts2";
					}
					else
					{
						if ((tg.team_no == AS_MELEE))
						{
							tg.team_str_home = "ts3";
						}
						else
						{
							if ((tg.team_no == AS_MISSILE))
							{
								tg.team_str_home = "ts4";
							}
						}
					}
				}
			}
			tg = find (tg, classname, "info_player_teamspawn");
		}
	}
};

void (entity Item, entity AP) DoItemGroupWork =
{
	local entity tg;
	local entity carrier;
	local float allcarried;
	local string st;

	allcarried = SBAR_GRENS;
	if ((Item.distance != 0))
	{
		if ((Item.pain_finished == 0))
		{
			dprint ("GoalItem ");
			st = ftos (Item.goal_no);
			dprint (st);
			dprint (" has a .distance specified, but no .pain_finished\n");
		}
		tg = find (world, classname, "item_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Item.distance))
			{
				if ((tg.goal_state != SBAR_GRENS))
				{
					allcarried = 0;
				}
			}
			tg = find (tg, classname, "item_tfgoal");
		}
		if ((allcarried == SBAR_GRENS))
		{
			tg = Findgoal (Item.pain_finished);
			if (tg)
			{
				DoResults (tg, AP, (Item.goal_result & SBAR_PRINT));
			}
		}
	}
	allcarried = SBAR_GRENS;
	if ((Item.speed != 0))
	{
		if ((Item.attack_finished == 0))
		{
			dprint ("GoalItem ");
			st = ftos (Item.goal_no);
			dprint (st);
			dprint (" has a .speed specified, but no .attack_finished\n");
		}
		carrier = world;
		tg = find (world, classname, "item_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Item.speed))
			{
				if ((tg.goal_state != SBAR_GRENS))
				{
					allcarried = 0;
				}
				else
				{
					if ((carrier == world))
					{
						carrier = tg.owner;
					}
					else
					{
						if ((carrier != tg.owner))
						{
							allcarried = 0;
						}
					}
				}
			}
			tg = find (tg, classname, "item_tfgoal");
		}
		if ((allcarried == SBAR_GRENS))
		{
			tg = Findgoal (Item.attack_finished);
			if (tg)
			{
				DoResults (tg, AP, (Item.goal_result & SBAR_PRINT));
			}
		}
	}
};

void (entity Goal, entity AP) DoTriggerWork =
{
	local entity t;

	if (Goal.killtarget)
	{
		t = world;
		do
		{
			t = find (t, targetname, Goal.killtarget);
			if ((t != world))
			{
				dremove (t);
			}

		} while ((t != world));
	}
	if (Goal.target)
	{
		t = world;
		activator = AP;
		do
		{
			t = find (t, targetname, Goal.target);
			if ((t == world))
			{
				return;
			}
			stemp = self;
			otemp = other;
			self = t;
			other = stemp;
			if ((self.use != SUB_Null))
			{
				if (self.use)
				{
					self.use ();
				}
			}
			self = stemp;
			other = otemp;
			activator = AP;

		} while ((t != world));
	}
};

void () DelayedResult =
{
	if ((self.enemy.goal_state == AS_MISSILE))
	{
		DoResults (self.enemy, self.owner, self.weapon);
	}
	dremove (self);
};

void (entity Goal, entity AP, float addb) DoResults =
{
	local entity te;
	local entity oldself;
	local string st;
	local float winners;
	local float gotone;

	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((Goal.goal_state == SBAR_GRENS))
	{
		return;
	}
	if (((Goal.delay_time > 0) && (Goal.goal_state != AS_MISSILE)))
	{
		Goal.goal_state = AS_MISSILE;
		te = spawn ();
		te.think = DelayedResult;
		te.nextthink = (time + Goal.delay_time);
		te.owner = AP;
		te.enemy = Goal;
		te.weapon = addb;
		return;
	}
	UpdateAbbreviations (Goal);
	Goal.goal_state = SBAR_PRINT;
	if (((Goal.classname == "info_tfgoal") && (Goal.mdl != string_null)))
	{
		setmodel (Goal, string_null);
	}
	if (Goal.noise)
	{
		sound (other, AS_MELEE, Goal.noise, SBAR_GRENS, SBAR_GRENS);
	}
	winners = 0;
	if ((Goal.increase_team1 != 0))
	{
		TeamFortress_TeamIncreaseScore (SBAR_GRENS, Goal.increase_team1);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team2 != 0))
	{
		TeamFortress_TeamIncreaseScore (SBAR_PRINT, Goal.increase_team2);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team3 != 0))
	{
		TeamFortress_TeamIncreaseScore (AS_MELEE, Goal.increase_team3);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team4 != 0))
	{
		TeamFortress_TeamIncreaseScore (AS_MISSILE, Goal.increase_team4);
		winners = SBAR_GRENS;
	}
	if ((winners == SBAR_GRENS))
	{
		TeamFortress_TeamShowScores (SBAR_PRINT);
		te = find (world, classname, "observer");
		while ((te != world))
		{
			if ((Goal.netname != string_null))
			{
				CenterPrint3 (te, AP.netname, " captured the ", Goal.netname);
			}
			te = find (te, classname, "observer");
		}
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if ((AP != world))
		{
			if ((Goal.goal_no == SBAR_GRENS))
			{
				te = find (world, classname, "player");
				while ((te != world))
				{
					if ((te.team_no == SBAR_PRINT))
					{
						if ((te == AP))
						{
							winners = random ();
							if ((winners < 0.1))
							{
								CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nFlee!");
							}
							else
							{
								if ((winners < 0.2))
								{
									CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nHead for home!");
								}
								else
								{
									if ((winners < 0.6))
									{
										CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nReturn to base!");
									}
									else
									{
										if ((winners < 0.7))
										{
											CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n<Insert witty comment here>");
										}
										else
										{
											if ((winners < 0.8))
											{
												CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
											}
											else
											{
												if ((winners < 0.95))
												{
													CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
												}
												else
												{
													CenterPrint2 (te, "\n\n\n", "Is that a flag in your pocket\nor a you just happy to see me?");
												}
											}
										}
									}
								}
							}
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "Your team гот the енемы flag!!");
						}
					}
					else
					{
						CenterPrint2 (te, "\n\n\n", "Your flag has been такен!!");
					}
					te = find (te, classname, "player");
				}
				bprint (SBAR_PRINT, AP.netname);
				bprint (SBAR_PRINT, " гот the блуе flag!\n");
				AP.items = (AP.items | 131072);
				AP.effects = (AP.effects | _P);
			}
			else
			{
				if ((Goal.goal_no == SBAR_PRINT))
				{
					te = find (world, classname, "player");
					while ((te != world))
					{
						if ((te.team_no == SBAR_GRENS))
						{
							if ((te == AP))
							{
								winners = random ();
								if ((winners < 0.1))
								{
									CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nFlee!");
								}
								else
								{
									if ((winners < 0.2))
									{
										CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nHead for home!");
									}
									else
									{
										if ((winners < 0.6))
										{
											CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nReturn to base!");
										}
										else
										{
											if ((winners < 0.7))
											{
												CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n<Insert witty comment here>");
											}
											else
											{
												if ((winners < 0.8))
												{
													CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nRed's dead baby, Red's dead...");
												}
												else
												{
													if ((winners < 0.95))
													{
														CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
													}
													else
													{
														CenterPrint2 (te, "\n\n\n", "Is that a flag in your pocket\nor a you just happy to see me?");
													}
												}
											}
										}
									}
								}
							}
							else
							{
								CenterPrint2 (te, "\n\n\n", "Your team гот the енемы flag!!");
							}
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "Your flag has been такен!!");
						}
						te = find (te, classname, "player");
					}
					bprint (SBAR_PRINT, AP.netname);
					bprint (SBAR_PRINT, " гот the ред flag!\n");
					AP.items = (AP.items | 262144);
					AP.effects = (AP.effects | 160);
				}
				else
				{
					if ((Goal.goal_no == AS_MELEE))
					{
						te = find (world, classname, "player");
						while ((te != world))
						{
							if ((te.team_no == SBAR_PRINT))
							{
								if ((te == AP))
								{
									CenterPrint2 (te, "\n\n\n", "You цаптуред the flag!!");
								}
								else
								{
									CenterPrint2 (te, "\n\n\n", "Your flag was цаптуред!!");
								}
							}
							else
							{
								CenterPrint2 (te, "\n\n\n", "Your team цаптуред the flag!!");
							}
							te = find (te, classname, "player");
						}
						bprint (SBAR_PRINT, AP.netname);
						bprint (SBAR_PRINT, " цаптуред the ред flag!\n");
						AP.items = (AP.items - (AP.items & 262144));
						AP.effects = (AP.effects - (AP.effects & 160));
					}
					else
					{
						if ((Goal.goal_no == AS_MISSILE))
						{
							te = find (world, classname, "player");
							while ((te != world))
							{
								if ((te.team_no == SBAR_GRENS))
								{
									if ((te == AP))
									{
										CenterPrint2 (te, "\n\n\n", "You цаптуред the flag!!");
									}
									else
									{
										CenterPrint2 (te, "\n\n\n", "Your flag was цаптуред!!");
									}
								}
								else
								{
									CenterPrint2 (te, "\n\n\n", "Your team цаптуред the flag!!");
								}
								te = find (te, classname, "player");
							}
							bprint (SBAR_PRINT, AP.netname);
							bprint (SBAR_PRINT, " цаптуред the блуе flag!\n");
							AP.items = (AP.items - (AP.items & 131072));
							AP.effects = (AP.effects - (AP.effects & _P));
						}
					}
				}
			}
		}
	}
	gotone = 0;
	te = find (world, classname, "player");
	while ((te != world))
	{
		if (((Goal.broadcast != string_null) && (CTF_Map == 0)))
		{
			CenterPrint2 (te, "\n\n\n", Goal.broadcast);
		}
		if (((Goal.netname_broadcast != string_null) && (CTF_Map == 0)))
		{
			sprint (te, SBAR_PRINT, AP.netname);
			sprint (te, SBAR_PRINT, Goal.netname_broadcast);
		}
		if ((AP == te))
		{
			if ((Goal.message != string_null))
			{
				CenterPrint2 (te, "\n\n\n", Goal.message);
			}
		}
		else
		{
			if ((AP.team_no == te.team_no))
			{
				if (((Goal.owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					CenterPrint2 (te, "\n\n\n", Goal.owners_team_broadcast);
				}
				else
				{
					if ((Goal.team_broadcast != string_null))
					{
						CenterPrint2 (te, "\n\n\n", Goal.team_broadcast);
					}
				}
				if (((Goal.netname_owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					sprint (te, SBAR_PRINT, AP.netname);
					sprint (te, SBAR_PRINT, Goal.netname_owners_team_broadcast);
				}
				else
				{
					if ((Goal.netname_team_broadcast != string_null))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Goal.netname_team_broadcast);
					}
				}
			}
			else
			{
				if (((Goal.owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					CenterPrint2 (te, "\n\n\n", Goal.owners_team_broadcast);
				}
				else
				{
					if ((Goal.non_team_broadcast != string_null))
					{
						CenterPrint2 (te, "\n\n\n", Goal.non_team_broadcast);
					}
				}
				if (((Goal.netname_owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					sprint (te, SBAR_PRINT, AP.netname);
					sprint (te, SBAR_PRINT, Goal.netname_owners_team_broadcast);
				}
				else
				{
					if ((Goal.netname_non_team_broadcast != string_null))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Goal.netname_non_team_broadcast);
					}
				}
			}
		}
		if (IsAffectedBy (Goal, te, AP))
		{
			if (((Goal.search_time != 0) && (Goal.goal_effects & 64)))
			{
				if (APMeetsCriteria (Goal, te))
				{
					Apply_Results (Goal, te, AP, addb);
					gotone = SBAR_GRENS;
				}
			}
			else
			{
				Apply_Results (Goal, te, AP, addb);
				gotone = SBAR_GRENS;
			}
		}
		te = find (te, classname, "player");
	}
	te = find (world, classname, "observer");
	while ((te != world))
	{
		if ((Goal.classname == "item_tfgoal"))
		{
			if ((Goal.netname != string_null))
			{
				CenterPrint3 (te, AP.netname, " took the ", Goal.netname);
			}
		}
		te = find (te, classname, "observer");
	}
	if ((Goal.classname != "item_tfgoal"))
	{
		Goal.goal_state = SBAR_GRENS;
	}
	if ((Goal.goal_result & AS_MISSILE))
	{
		TeamFortress_TeamShowScores (SBAR_GRENS);
		winners = TeamFortress_TeamGetWinner ();
		te = find (world, classname, "player");
		while (te)
		{
			te.takedamage = 0;
			te.movetype = 0;
			te.velocity = '0 0 0';
			te.avelocity = '0 0 0';
			te = find (te, classname, "player");
		}
		te = spawn ();
		te.nextthink = (time + 5);
		te.think = execute_changelevel;
		dremove (Goal);
		return;
	}
	DoGroupWork (Goal, AP);
	DoGoalWork (Goal, AP);
	DoTriggerWork (Goal, AP);
	if ((Goal.classname == "info_tfgoal"))
	{
		SetupRespawn (Goal);
	}
};

void () tfgoal_touch =
{
	local entity te;

	if (!(self.goal_activation & SBAR_GRENS))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((self.goal_state == SBAR_GRENS))
	{
		return;
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if (((self.goal_no == AS_MELEE) && (other.team_no == SBAR_GRENS)))
		{
			te = Finditem (SBAR_GRENS);
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return;
			}
		}
		if (((self.goal_no == AS_MISSILE) && (other.team_no == SBAR_PRINT)))
		{
			te = Finditem (SBAR_PRINT);
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return;
			}
		}
	}
	AttemptToActivate (self, other, self);
};

void () info_tfgoal_use =
{
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	AttemptToActivate (self, activator, self);
};

void () tfgoal_timer_tick =
{
	if ((self.goal_state != AS_MELEE))
	{
		if (APMeetsCriteria (self, world))
		{
			DoResults (self, world, SBAR_GRENS);
		}
		else
		{
			InactivateGoal (self);
			self.think = tfgoal_timer_tick;
			self.nextthink = (time + self.search_time);
		}
	}
};

void () item_tfgoal_touch =
{
	local string st;
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= 0))
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if ((other == self.owner))
	{
		return;
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if ((self.goal_no == SBAR_GRENS))
		{
			if ((self.origin != self.oldorigin))
			{
				if ((other.team_no == SBAR_GRENS))
				{
					bprint (SBAR_PRINT, other.netname);
					bprint (SBAR_PRINT, " ретурнед the блуе flag!\n");
					te = find (world, classname, "player");
					while ((te != world))
					{
						if ((te.team_no == SBAR_GRENS))
						{
							CenterPrint2 (te, "\n\n\n", "Your flag was ретурнед!!");
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "The енемы flag was ретурнед!!");
						}
						te = find (te, classname, "player");
					}
					self.goal_state = SBAR_PRINT;
					self.solid = SBAR_GRENS;
					self.touch = item_tfgoal_touch;
					self.origin = self.oldorigin;
					setmodel (self, self.mdl);
					setorigin (self, self.origin);
					sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
					return;
				}
			}
			else
			{
				if ((other.team_no == SBAR_GRENS))
				{
					return;
				}
			}
		}
		else
		{
			if ((self.goal_no == SBAR_PRINT))
			{
				if ((self.origin != self.oldorigin))
				{
					if ((other.team_no == SBAR_PRINT))
					{
						bprint (SBAR_PRINT, other.netname);
						bprint (SBAR_PRINT, " ретурнед the ред flag!\n");
						te = find (world, classname, "player");
						while ((te != world))
						{
							if ((te.team_no == SBAR_PRINT))
							{
								CenterPrint (te, "\n\n\n Your flag was ретурнед!!");
							}
							else
							{
								CenterPrint (te, "\n\n\n The енемы flag was ретурнед!!");
							}
							te = find (te, classname, "player");
						}
						self.goal_state = SBAR_PRINT;
						self.solid = SBAR_GRENS;
						self.touch = item_tfgoal_touch;
						self.origin = self.oldorigin;
						setmodel (self, self.mdl);
						setorigin (self, self.origin);
						sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
						return;
					}
				}
				else
				{
					if ((other.team_no == SBAR_PRINT))
					{
						return;
					}
				}
			}
		}
	}
	if (Activated (self, other))
	{
		tfgoalitem_GiveToPlayer (self, other, self);
		if ((other.health > 0))
		{
			self.goal_state = SBAR_GRENS;
		}
	}
	else
	{
		if ((self.else_goal != 0))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
	}
};

void (entity Item, entity AP, entity Goal) tfgoalitem_GiveToPlayer =
{
	local string sp;

	Item.owner = AP;
	if ((Item.mdl != string_null))
	{
		setmodel (Item, string_null);
	}
	Item.solid = 0;
	if ((Item.goal_activation & SBAR_GRENS))
	{
		if ((Item.mdl == "progs/flag.mdl"))
		{
			if ((Item.owned_by == SBAR_GRENS))
			{
				AP.effects = (AP.effects | space);
			}
			else
			{
				if ((Item.owned_by == SBAR_PRINT))
				{
					AP.effects = (AP.effects | SBAR_240);
				}
			}
		}
		AP.effects = (AP.effects | 8);
	}
	if ((Item.goal_activation & SBAR_PRINT))
	{
		TeamFortress_SetSpeed (AP);
	}
	if ((Item.goal_activation & 512))
	{
		if ((Item.owned_by == SBAR_GRENS))
		{
			Item.effects = (Item.effects | 64);
		}
		else
		{
			if ((Item.owned_by == SBAR_PRINT))
			{
				Item.effects = (Item.effects | 128);
			}
			else
			{
				Item.effects = (Item.effects | 8);
			}
		}
	}
	if ((Item.items & 131072))
	{
		AP.items = (AP.items | 131072);
	}
	if ((Item.items & 262144))
	{
		AP.items = (AP.items | 262144);
	}
	if ((Goal != Item))
	{
		if ((Goal.goal_result & 8))
		{
			Item.goal_state = SBAR_GRENS;
			return;
		}
	}
	if (((AP.playerclass == 8) && (Item.goal_result & SBAR_240)))
	{
		AP.is_unabletospy = SBAR_GRENS;
	}
	DoResults (Item, AP, SBAR_GRENS);
	DoItemGroupWork (Item, AP);
};

void () ReturnItem =
{
	local entity te;

	self.enemy.goal_state = SBAR_PRINT;
	if ((self.enemy.classname == "item_tfgoal"))
	{
		if (((self.enemy.goal_activation & 8192) || (toggleflags & SBAR_240)))
		{
			self.enemy.solid = SBAR_PRINT;
		}
		else
		{
			self.enemy.solid = SBAR_GRENS;
		}
	}
	self.flags = (self.flags - (self.flags & 512));
	self.enemy.movetype = 0;
	self.enemy.touch = item_tfgoal_touch;
	self.enemy.origin = self.enemy.oldorigin;
	if ((self.enemy.mdl != string_null))
	{
		setmodel (self.enemy, self.enemy.mdl);
	}
	setorigin (self.enemy, self.enemy.origin);
	sound (self.enemy, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
	tfgoalitem_checkgoalreturn (self.enemy);
	if ((self.weapon != SBAR_PRINT))
	{
		if (((self.enemy.noise3 != string_null) || (self.enemy.noise4 != string_null)))
		{
			te = find (world, classname, "player");
			while (te)
			{
				if ((te.team_no == self.enemy.owned_by))
				{
					CenterPrint2 (te, "\n\n\n", self.enemy.noise3);
				}
				else
				{
					CenterPrint2 (te, "\n\n\n", self.enemy.noise4);
				}
				te = find (te, classname, "player");
			}
		}
	}
	dremove (self);
};

void (entity Item, entity AP, float method) tfgoalitem_RemoveFromPlayer =
{
	local entity te;
	local float lighton;
	local float slowon;
	local float key1on;
	local float key2on;
	local float spyoff;
	local string db1;
	local entity DelayReturn;

	if ((Item == world))
	{
		objerror ("error: tfgoalitem_RemoveFromPlayer(): Item == world");
		return;
	}
	lighton = 0;
	slowon = 0;
	key1on = 0;
	key2on = 0;
	spyoff = 0;
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if (((te.owner == AP) && (te != Item)))
		{
			if ((te.goal_activation & SBAR_GRENS))
			{
				lighton = SBAR_GRENS;
			}
			if ((te.goal_activation & SBAR_PRINT))
			{
				slowon = SBAR_GRENS;
			}
			if ((te.items & 131072))
			{
				key1on = SBAR_GRENS;
			}
			if ((te.items & 262144))
			{
				key2on = SBAR_GRENS;
			}
			if ((te.goal_result & SBAR_240))
			{
				spyoff = SBAR_GRENS;
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (!lighton)
	{
		if ((AP.invincible_finished > (time + AS_MELEE)))
		{
			lighton = SBAR_GRENS;
		}
		else
		{
			if ((AP.super_damage_finished > (time + AS_MELEE)))
			{
				lighton = SBAR_GRENS;
			}
		}
	}
	if (!lighton)
	{
		AP.effects = (AP.effects - (AP.effects & 8));
		AP.effects = (AP.effects - (AP.effects & _P));
		AP.effects = (AP.effects - (AP.effects & 160));
	}
	if ((Item.goal_activation & 512))
	{
		if ((Item.owned_by == SBAR_GRENS))
		{
			Item.effects = (Item.effects | 64);
		}
		else
		{
			if ((Item.owned_by == SBAR_PRINT))
			{
				Item.effects = (Item.effects | 128);
			}
			else
			{
				Item.effects = (Item.effects | 8);
			}
		}
	}
	if (!spyoff)
	{
		AP.is_unabletospy = 0;
	}
	if (!key1on)
	{
		AP.items = (AP.items - (AP.items & 131072));
	}
	if (!key2on)
	{
		AP.items = (AP.items - (AP.items & 262144));
	}
	te = find (world, classname, "player");
	while ((te != world))
	{
		if (IsAffectedBy (Item, te, AP))
		{
			RemoveResults (Item, te);
		}
		te = find (te, classname, "player");
	}
	if (((method == 0) || (method == SBAR_PRINT)))
	{
		te = find (world, classname, "player");
		while ((te != world))
		{
			if ((te.team_no == Item.owned_by))
			{
				if ((Item.team_drop != string_null))
				{
					CenterPrint2 (te, "\n\n\n", Item.team_drop);
				}
				if ((Item.netname_team_drop != string_null))
				{
					if ((stof (infokey (world, "*bspversion")) == 30))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, " ");
						sprint (te, SBAR_PRINT, Item.netname_team_drop);
						sprint (te, SBAR_PRINT, "\n");
					}
					else
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Item.netname_team_drop);
					}
				}
			}
			else
			{
				if ((Item.non_team_drop != string_null))
				{
					CenterPrint2 (te, "\n\n\n", Item.non_team_drop);
				}
				if ((Item.netname_non_team_drop != string_null))
				{
					if ((stof (infokey (world, "*bspversion")) == 30))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, " ");
						sprint (te, SBAR_PRINT, Item.netname_non_team_drop);
						sprint (te, SBAR_PRINT, "\n");
					}
					else
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Item.netname_non_team_drop);
					}
				}
			}
			te = find (te, classname, "player");
		}
		if ((Item.goal_activation & 8))
		{
			DelayReturn = spawn ();
			DelayReturn.enemy = Item;
			if ((method == 0))
			{
				DelayReturn.weapon = 0;
			}
			else
			{
				DelayReturn.weapon = SBAR_GRENS;
			}
			DelayReturn.think = ReturnItem;
			DelayReturn.nextthink = (time + 0.5);
		}
		else
		{
			if ((Item.goal_activation & AS_MISSILE))
			{
				if (((method == SBAR_PRINT) && ((Item.goal_activation & 4096) || (toggleflags & 8))))
				{
					tfgoalitem_drop (Item, SBAR_GRENS, AP);
				}
				else
				{
					tfgoalitem_drop (Item, 0, AP);
				}
			}
			else
			{
				Item.owner = world;
				dremove (Item);
				TeamFortress_SetSpeed (AP);
				return;
			}
		}
		Item.owner = world;
		Item.flags = (Item.flags - (Item.flags & 512));
		setsize (Item, Item.goal_min, Item.goal_max);
		TeamFortress_SetSpeed (AP);
		return;
	}
	else
	{
		if ((method == SBAR_GRENS))
		{
			if ((Item.goal_activation & SBAR_240))
			{
				DelayReturn = spawn ();
				DelayReturn.enemy = Item;
				DelayReturn.weapon = SBAR_PRINT;
				DelayReturn.think = ReturnItem;
				DelayReturn.nextthink = (time + 0.5);
				Item.owner = world;
				TeamFortress_SetSpeed (AP);
				return;
			}
			Item.solid = 0;
			Item.owner = world;
			TeamFortress_SetSpeed (AP);
			return;
		}
	}
	objerror ("Invalid method passed into tfgoalitem_RemoveFromPlayer\n");
};

void () tfgoalitem_dropthink =
{
	local float pos;
	local string st;

	self.movetype = 6;
	if ((self.pausetime != 0))
	{
		pos = pointcontents (self.origin);
		if ((pos == -4))
		{
			self.nextthink = (time + (self.pausetime / AS_MISSILE));
		}
		else
		{
			if ((pos == -5))
			{
				self.nextthink = (time + 5);
			}
			else
			{
				if (((pos == -2) || (pos == -6)))
				{
					if ((self.camdist < AS_MELEE))
					{
						self.origin = self.camangle;
						setorigin (self, self.origin);
						self.velocity_z = 400;
						self.velocity_x = (-50 + (random () * _d));
						self.velocity_y = (-50 + (random () * _d));
						self.goal_state = SBAR_PRINT;
						self.movetype = 6;
						if (((self.goal_activation & 8192) || (toggleflags & SBAR_240)))
						{
							self.solid = SBAR_PRINT;
						}
						else
						{
							self.solid = SBAR_GRENS;
						}
						if ((self.mdl != string_null))
						{
							setmodel (self, self.mdl);
						}
						setsize (self, self.goal_min, self.goal_max);
						self.camdist = (self.camdist + SBAR_GRENS);
						self.nextthink = (time + 5);
						self.think = tfgoalitem_dropthink;
						return;
					}
					else
					{
						self.nextthink = (time + SBAR_PRINT);
					}
				}
				else
				{
					self.nextthink = (time + self.pausetime);
				}
			}
		}
		st = infokey (world, "noreturn");
		if ((st != "on"))
		{
			self.think = tfgoalitem_remove;
		}
	}
};

void () tfgoalitem_droptouch =
{
	self.touch = item_tfgoal_touch;
	self.nextthink = (time + 4.25);
	self.think = tfgoalitem_dropthink;
};

void (entity Item, float PAlive, entity P) tfgoalitem_drop =
{
	Item.origin = Item.owner.origin;
	setorigin (Item, Item.origin);
	Item.camangle = (Item.owner.origin - '0 0 8');
	Item.camdist = 0;
	Item.velocity_z = 400;
	Item.velocity_x = (-50 + (random () * _d));
	Item.velocity_y = (-50 + (random () * _d));
	Item.goal_state = SBAR_PRINT;
	Item.movetype = 6;
	if (((Item.goal_activation & 8192) || (toggleflags & SBAR_240)))
	{
		Item.solid = SBAR_PRINT;
	}
	else
	{
		Item.solid = SBAR_GRENS;
	}
	if ((Item.mdl != string_null))
	{
		setmodel (Item, Item.mdl);
	}
	setsize (Item, Item.goal_min, Item.goal_max);
	Item.owner = P;
	if ((PAlive == SBAR_GRENS))
	{
		makevectors (P.v_angle);
		if (P.v_angle_x)
		{
			Item.velocity = ((v_forward * 400) + (v_up * 200));
		}
		else
		{
			Item.velocity = aim (P, 10000);
			Item.velocity = (Item.velocity * 400);
			Item.velocity_z = 200;
		}
		Item.touch = SUB_Null;
		Item.nextthink = (time + 0.75);
		Item.think = tfgoalitem_droptouch;
	}
	else
	{
		Item.touch = item_tfgoal_touch;
		Item.nextthink = (time + 5);
		Item.think = tfgoalitem_dropthink;
	}
};

void () tfgoalitem_remove =
{
	local entity te;

	if ((self.goal_state == SBAR_GRENS))
	{
		return;
	}
	if ((self.goal_activation & space))
	{
		te = spawn ();
		te.enemy = self;
		te.weapon = AS_MELEE;
		te.nextthink = (time + 0.1);
		te.think = ReturnItem;
		return;
	}
	dremove (self);
};

void (entity Item) tfgoalitem_checkgoalreturn =
{
	local string st;
	local entity te;

	if ((Item.impulse != 0))
	{
		te = Findgoal (Item.impulse);
		if (te)
		{
			te = Findgoal (Item.impulse);
			if (te)
			{
				AttemptToActivate (te, world, Item);
			}
		}
	}
};

void (entity Goal, entity Player, entity Item) DisplayItemStatus =
{
	if ((Item.goal_state == SBAR_GRENS))
	{
		if (((Goal.team_str_carried != string_null) || (Goal.non_team_str_carried != string_null)))
		{
			if ((Player.team_no == Item.owned_by))
			{
				sprint (Player, SBAR_PRINT, Goal.team_str_carried);
			}
			else
			{
				sprint (Player, SBAR_PRINT, Goal.non_team_str_carried);
			}
			sprint (Player, SBAR_PRINT, " ");
			if ((Player == Item.owner))
			{
				sprint (Player, SBAR_PRINT, "You");
			}
			else
			{
				sprint (Player, SBAR_PRINT, Item.owner.netname);
			}
			sprint (Player, SBAR_PRINT, ".\n");
		}
	}
	else
	{
		if ((Item.origin != Item.oldorigin))
		{
			if (((Goal.team_str_moved != string_null) || (Goal.non_team_str_moved != string_null)))
			{
				if ((Player.team_no == Item.owned_by))
				{
					sprint (Player, SBAR_PRINT, Goal.team_str_moved);
				}
				else
				{
					sprint (Player, SBAR_PRINT, Goal.non_team_str_moved);
				}
				sprint (Player, SBAR_PRINT, "\n");
			}
		}
		else
		{
			if (((Goal.team_str_home != string_null) || (Goal.non_team_str_home != string_null)))
			{
				if ((Player.team_no == Item.owned_by))
				{
					sprint (Player, SBAR_PRINT, Goal.team_str_home);
				}
				else
				{
					sprint (Player, SBAR_PRINT, Goal.non_team_str_home);
				}
				sprint (Player, SBAR_PRINT, "\n");
			}
		}
	}
};

void () info_player_team2 =
{
	CTF_Map = SBAR_GRENS;
	self.classname = "info_player_teamspawn";
	self.team_no = SBAR_PRINT;
	self.goal_effects = SBAR_GRENS;
	self.team_str_home = "ts2";
};

void () info_player_team1 =
{
	CTF_Map = SBAR_GRENS;
	self.classname = "info_player_teamspawn";
	self.team_no = SBAR_GRENS;
	self.goal_effects = SBAR_GRENS;
	self.team_str_home = "ts1";
};

void () item_flag_team1 =
{
	local entity dp;

	CTF_Map = SBAR_GRENS;
	UpdateAbbreviations (self);
	precache_model ("progs/flag.mdl");
	precache_sound ("ogre/ogwake.wav");
	precache_sound ("boss2/pop2.wav");
	self.classname = "item_tfgoal";
	self.netname = "Team 1 Flag";
	self.broadcast = " гот the enemy team's flag!\n";
	self.deathtype = "You've got the enemy flag!\n";
	self.noise = "ogre/ogwake.wav";
	self.mdl = "progs/flag.mdl";
	self.skin = SBAR_GRENS;
	setmodel (self, self.mdl);
	self.goal_no = SBAR_GRENS;
	self.goal_activation = (((((SBAR_GRENS | AS_MISSILE) | 128) | space) | SBAR_240) | 512);
	self.goal_effects = SBAR_GRENS;
	self.effects = 128;
	self.pausetime = 128;
	self.goal_min = '-16 -16 -24';
	self.goal_max = '16 16 32';
	setsize (self, self.goal_min, self.goal_max);
	self.touch = item_tfgoal_touch;
	self.goal_state = SBAR_PRINT;
	self.solid = SBAR_GRENS;
	setorigin (self, self.origin);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	dp = spawn ();
	dp.origin = self.origin;
	dp.classname = "info_tfgoal";
	dp.goal_activation = SBAR_GRENS;
	dp.team_no = SBAR_GRENS;
	dp.items_allowed = SBAR_PRINT;
	dp.goal_no = AS_MELEE;
	dp.goal_effects = AS_MELEE;
	dp.broadcast = " цаптуред the enemy flag!\n";
	dp.message = "You цаптуред the enemy flag!\n";
	dp.noise = "boss2/pop2.wav";
	dp.goal_result = SBAR_PRINT;
	dp.activate_goal_no = 5;
	dp.axhitme = SBAR_PRINT;
	dp.count = enter;
	dp.frags = enter;
	dp.solid = SBAR_GRENS;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
	dp = spawn ();
	dp.origin = dp.origin;
	dp.classname = "info_tfgoal";
	dp.goal_effects = SBAR_GRENS;
	dp.frags = 5;
	dp.goal_activation = 0;
	dp.goal_no = 5;
	dp.solid = 0;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
};

void () item_flag_team2 =
{
	local entity dp;

	CTF_Map = SBAR_GRENS;
	UpdateAbbreviations (self);
	precache_model ("progs/flag.mdl");
	precache_sound ("ogre/ogwake.wav");
	precache_sound ("boss2/pop2.wav");
	self.classname = "item_tfgoal";
	self.netname = "Team 2 Flag";
	self.broadcast = " гот the enemy team's flag!\n";
	self.deathtype = "You've got the enemy flag!\n";
	self.noise = "ogre/ogwake.wav";
	self.mdl = "progs/flag.mdl";
	setmodel (self, self.mdl);
	self.skin = SBAR_PRINT;
	self.goal_no = SBAR_PRINT;
	self.goal_activation = (((((SBAR_GRENS | AS_MISSILE) | 128) | space) | SBAR_240) | 512);
	self.goal_effects = SBAR_GRENS;
	self.pausetime = 128;
	self.effects = 64;
	self.goal_min = '-16 -16 -24';
	self.goal_max = '16 16 32';
	setsize (self, self.goal_min, self.goal_max);
	self.touch = item_tfgoal_touch;
	self.goal_state = SBAR_PRINT;
	self.solid = SBAR_GRENS;
	setorigin (self, self.origin);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	dp = spawn ();
	dp.origin = self.origin;
	dp.classname = "info_tfgoal";
	dp.goal_activation = SBAR_GRENS;
	dp.team_no = SBAR_PRINT;
	dp.items_allowed = SBAR_GRENS;
	dp.goal_no = AS_MISSILE;
	dp.goal_effects = AS_MELEE;
	dp.broadcast = " цаптуред the enemy flag!\n";
	dp.message = "You цаптуред the enemy flag!\n";
	dp.noise = "boss2/pop2.wav";
	dp.goal_result = SBAR_PRINT;
	dp.activate_goal_no = 6;
	dp.axhitme = SBAR_GRENS;
	dp.count = enter;
	dp.frags = enter;
	dp.solid = SBAR_GRENS;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
	dp = spawn ();
	dp.origin = dp.origin;
	dp.classname = "info_tfgoal";
	dp.goal_effects = SBAR_GRENS;
	dp.frags = 5;
	dp.goal_activation = 0;
	dp.goal_no = 6;
	dp.solid = 0;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
};

void () CTF_FlagCheck =
{
	local entity te;
	local float flagcount;
	local float pos;
	local string st;

	flagcount = 0;
	te = find (world, classname, "item_tfgoal");
	while ((te != world))
	{
		if ((te.goal_no == SBAR_GRENS))
		{
			pos = pointcontents (te.origin);
			if (((pos == -2) || (pos == -6)))
			{
				dprint ("*****BUG*****\nFlag(s) outside world.\n");
				te.nextthink = (time + 0.2);
				te.think = tfgoalitem_remove;
			}
			flagcount = (flagcount + SBAR_GRENS);
		}
		else
		{
			if ((te.goal_no == SBAR_PRINT))
			{
				pos = pointcontents (te.origin);
				if (((pos == -2) || (pos == -6)))
				{
					dprint ("*****BUG*****\nFlag(s) outside world.\n");
					te.nextthink = (time + 0.2);
					te.think = tfgoalitem_remove;
				}
				flagcount = (flagcount + SBAR_GRENS);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (!rounds)
	{
		if ((flagcount != SBAR_PRINT))
		{
			dprint ("*****BUG*****\nFlag(s) missing.\n");
		}
	}
	self.nextthink = (time + 30);
};

void (entity P) ForceRespawn =
{
	local entity spot;
	local entity te;
	local entity oldself;
	local string st;

	oldself = self;
	self = P;
	spot = SelectSpawnPoint ();
	if (self.playerclass)
	{
		spawn_tdeath (spot.origin, self);
	}
	self.observer_list = spot;
	self.origin = (spot.origin + '0 0 1');
	self.angles = spot.angles;
	self.fixangle = SBAR_GRENS;
	if (((spot.classname == "info_player_teamspawn") && !cb_prematch))
	{
		if ((spot.items != 0))
		{
			te = Finditem (spot.items);
			if (te)
			{
				tfgoalitem_GiveToPlayer (te, self, self);
			}
			if (!(spot.goal_activation & SBAR_GRENS))
			{
				spot.items = 0;
			}
		}
		if (spot.message)
		{
			CenterPrint (self, spot.message);
			if (!(spot.goal_activation & SBAR_PRINT))
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
		if ((spot.goal_effects == SBAR_GRENS))
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + SBAR_GRENS);
			spot.think = SUB_Remove;
		}
	}
	if ((deathmatch || coop))
	{
		makevectors (self.angles);
		if (self.playerclass)
		{
			spawn_tfog ((self.origin + (v_forward * 20)));
		}
	}
	self = oldself;
};

void () DropGoalItems =
{
	local entity te;

	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if ((te.owner == self))
		{
			if (((te.goal_activation & 4096) || (toggleflags & 8)))
			{
				tfgoalitem_RemoveFromPlayer (te, self, SBAR_PRINT);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
};
