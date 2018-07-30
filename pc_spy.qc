//=-=-=-=-= Local Functions
void () TeamFortress_Spy;
void (entity Item, entity AP, float method) tfgoalitem_RemoveFromPlayer;
void (entity spy) TeamFortress_SpyCalcName;
void () TeamFortress_SpyUndercoverThink;
//=-=-=-=-=

void () TeamFortress_Spy = 
{
	self.weapons_carried 	= PC_SPY_WEAPONS;
	self.ammo_rockets 		= 0;
	self.ammo_nails 		= 50;
	self.ammo_shells 		= 40;
	self.ammo_cells 		= 10;
	self.maxammo_rockets 	= 15;
	self.maxammo_nails 		= 100;
	self.maxammo_shells 	= 40;
	self.maxammo_cells 		= 30;
	self.no_grenades_1 		= 3;
	self.no_grenades_2 		= 3;
	self.tp_grenades_1 		= GR_TYPE_NORMAL;
	self.tp_grenades_2		= GR_TYPE_GAS;
	self.tf_items 			= 0;
	self.armorclass 		= (self.armorclass | 0);
	self.armortype 			= 0.6;
	self.armorvalue 		= 25;
	self.armor_allowed 		= 0.6;
	self.maxarmor 			= 100;
	self.max_health			= 90;
	self.current_weapon 	= WEAP_TRANQ;
	self.items_allowed 		= PC_SPY_WEAPONS;
	self.items 				= (self.items | 1 | 2 | 4);
};

void () spy_diea1 = [ 50, spy_diea2 ]
{
};

void () spy_diea2 = [ 51, spy_diea3 ]
{
};

void () spy_diea3 = [ 52, spy_diea4 ]
{
};

void () spy_diea4 = [ 53, spy_diea5 ]
{
};

void () spy_diea5 = [ 54, spy_diea6 ]
{
};

void () spy_diea6 = [ 55, spy_diea7 ]
{
};

void () spy_diea7 = [ 56, spy_diea8 ]
{
};

void () spy_diea8 = [ 57, spy_diea9 ]
{
};

void () spy_diea9 = [ 58, spy_diea10 ]
{
};

void () spy_diea10 = [ 59, spy_diea11 ]
{
};

void () spy_diea11 = [ 60, spy_diea11 ]
{
};

void () spy_dieb1 = [ 61, spy_dieb2 ]
{
};

void () spy_dieb2 = [ 62, spy_dieb3 ]
{
};

void () spy_dieb3 = [ 63, spy_dieb4 ]
{
};

void () spy_dieb4 = [ 64, spy_dieb5 ]
{
};

void () spy_dieb5 = [ 65, spy_dieb6 ]
{
};

void () spy_dieb6 = [ 66, spy_dieb7 ]
{
};

void () spy_dieb7 = [ 67, spy_dieb8 ]
{
};

void () spy_dieb8 = [ 68, spy_dieb9 ]
{
};

void () spy_dieb9 = [ 69, spy_dieb9 ]
{
};

void () spy_diec1 = [ 70, spy_diec2 ]
{
};

void () spy_diec2 = [ 71, spy_diec3 ]
{
};

void () spy_diec3 = [ 72, spy_diec4 ]
{
};

void () spy_diec4 = [ 73, spy_diec5 ]
{
};

void () spy_diec5 = [ 74, spy_diec6 ]
{
};

void () spy_diec6 = [ 75, spy_diec7 ]
{
};

void () spy_diec7 = [ 76, spy_diec8 ]
{
};

void () spy_diec8 = [ 77, spy_diec9 ]
{
};

void () spy_diec9 = [ 78, spy_diec10 ]
{
};

void () spy_diec10 = [ 79, spy_diec11 ]
{
};

void () spy_diec11 = [ 80, spy_diec12 ]
{
};

void () spy_diec12 = [ 81, spy_diec13 ]
{
};

void () spy_diec13 = [ 82, spy_diec14 ]
{
};

void () spy_diec14 = [ 83, spy_diec15 ]
{
};

void () spy_diec15 = [ 84, spy_diec15 ]
{
};

void () spy_died1 = [ 85, spy_died2 ]
{
};

void () spy_died2 = [ 86, spy_died3 ]
{
};

void () spy_died3 = [ 87, spy_died4 ]
{
};

void () spy_died4 = [ 88, spy_died5 ]
{
};

void () spy_died5 = [ 89, spy_died6 ]
{
};

void () spy_died6 = [ 90, spy_died7 ]
{
};

void () spy_died7 = [ 91, spy_died8 ]
{
};

void () spy_died8 = [ 92, spy_died9 ]
{
};

void () spy_died9 = [ 93, spy_died9 ]
{
};

void () spy_diee1 = [ 94, spy_diee2 ]
{
};

void () spy_diee2 = [ 95, spy_diee3 ]
{
};

void () spy_diee3 = [ 96, spy_diee4 ]
{
};

void () spy_diee4 = [ 97, spy_diee5 ]
{
};

void () spy_diee5 = [ 98, spy_diee6 ]
{
};

void () spy_diee6 = [ 99, spy_diee7 ]
{
};

void () spy_diee7 = [ 100, spy_diee8 ]
{
};

void () spy_diee8 = [ 101, spy_diee9 ]
{
};

void () spy_diee9 = [ 102, spy_diee9 ]
{
};

void () spy_die_ax1 = [ 41, spy_die_ax2 ]
{
};

void () spy_die_ax2 = [ 42, spy_die_ax3 ]
{
};

void () spy_die_ax3 = [ 43, spy_die_ax4 ]
{
};

void () spy_die_ax4 = [ 44, spy_die_ax5 ]
{
};

void () spy_die_ax5 = [ 45, spy_die_ax6 ]
{
};

void () spy_die_ax6 = [ 46, spy_die_ax7 ]
{
};

void () spy_die_ax7 = [ 47, spy_die_ax8 ]
{
};

void () spy_die_ax8 = [ 48, spy_die_ax9 ]
{
};

void () spy_die_ax9 = [ 49, spy_die_ax9 ]
{
};

void () spy_upb1 = [ 69, spy_upb2 ]
{
};

void () spy_upb2 = [ 68, spy_upb3 ]
{
};

void () spy_upb3 = [ 67, spy_upb4 ]
{
};

void () spy_upb4 = [ 66, spy_upb5 ]
{
};

void () spy_upb5 = [ 65, spy_upb6 ]
{
};

void () spy_upb6 = [ 64, spy_upb7 ]
{
};

void () spy_upb7 = [ 63, spy_upb8 ]
{
};

void () spy_upb8 = [ 62, spy_upb9 ]
{
};

void () spy_upb9 = [ 61, spy_upb9 ]
{
	player_stand1 ();
};

void () spy_upc1 = [ 84, spy_upc2 ]
{
};

void () spy_upc2 = [ 83, spy_upc3 ]
{
};

void () spy_upc3 = [ 82, spy_upc4 ]
{
};

void () spy_upc4 = [ 81, spy_upc5 ]
{
};

void () spy_upc5 = [ 80, spy_upc6 ]
{
};

void () spy_upc6 = [ 79, spy_upc7 ]
{
};

void () spy_upc7 = [ 78, spy_upc8 ]
{
};

void () spy_upc8 = [ 77, spy_upc9 ]
{
};

void () spy_upc9 = [ 76, spy_upc10 ]
{
};

void () spy_upc10 = [ 75, spy_upc11 ]
{
};

void () spy_upc11 = [ 74, spy_upc12 ]
{
};

void () spy_upc12 = [ 73, spy_upc13 ]
{
};

void () spy_upc13 = [ 72, spy_upc14 ]
{
};

void () spy_upc14 = [ 71, spy_upc15 ]
{
};

void () spy_upc15 = [ 70, spy_upc15 ]
{
	player_stand1 ();
};

void () spy_upd1 = [ 93, spy_upd2 ]
{
};

void () spy_upd2 = [ 92, spy_upd3 ]
{
};

void () spy_upd3 = [ 91, spy_upd4 ]
{
};

void () spy_upd4 = [ 90, spy_upd5 ]
{
};

void () spy_upd5 = [ 89, spy_upd6 ]
{
};

void () spy_upd6 = [ 88, spy_upd7 ]
{
};

void () spy_upd7 = [ 87, spy_upd8 ]
{
};

void () spy_upd8 = [ 86, spy_upd9 ]
{
};

void () spy_upd9 = [ 85, spy_upd9 ]
{
	player_stand1 ();
};

void () spy_upe1 = [ 94, spy_upe9 ]
{
};
void () spy_upe9;

void () spy_upe2 = [ 95, spy_upe8 ]
{
};
void () spy_upe8;

void () spy_upe3 = [ 96, spy_upe7 ]
{
};
void () spy_upe7;

void () spy_upe4 = [ 97, spy_upe6 ]
{
};
void () spy_upe6;

void () spy_upe5 = [ 98, spy_upe5 ]
{
};

void () spy_upe6 = [ 99, spy_upe4 ]
{
};

void () spy_upe7 = [ 100, spy_upe3 ]
{
};

void () spy_upe8 = [ 101, spy_upe2 ]
{
};

void () spy_upe9 = [ 102, spy_upe1 ]
{
	player_stand1 ();
};

void () spy_upaxe1 = [ 49, spy_upaxe2 ]
{
};

void () spy_upaxe2 = [ 48, spy_upaxe3 ]
{
};

void () spy_upaxe3 = [ 47, spy_upaxe4 ]
{
};

void () spy_upaxe4 = [ 46, spy_upaxe5 ]
{
};

void () spy_upaxe5 = [ 45, spy_upaxe6 ]
{
};

void () spy_upaxe6 = [ 44, spy_upaxe7 ]
{
};

void () spy_upaxe7 = [ 43, spy_upaxe8 ]
{
};

void () spy_upaxe8 = [ 42, spy_upaxe9 ]
{
};

void () spy_upaxe9 = [ 41, spy_upaxe9 ]
{
	player_stand1 ();
};

void (float issilent) TeamFortress_SpyFeignDeath =
{
	local float i;
	local float j;
	local entity at_spot;
	local entity te;

	if (self.is_feigning)
	{
		at_spot = findradius (self.origin, 40);
		i = 1;
		j = 0;
		while ((at_spot != world))
		{
			if ((at_spot.mdl == "progs/detpack.mdl"))
			{
				j = 1;
			}
			else
			{
				if ((at_spot.mdl == "progs/turrbase.mdl"))
				{
					j = 1;
				}
				else
				{
					if ((at_spot.mdl == "progs/turrgun.mdl"))
					{
						j = 1;
					}
					else
					{
						if ((at_spot.mdl == "progs/disp.mdl"))
						{
							j = 1;
						}
						else
						{
							if ((((at_spot.classname == "player") && (at_spot.deadflag == 0)) && (self != at_spot)))
							{
								j = 2;
							}
						}
					}
				}
			}
			if ((j > 0))
			{
				i = 0;
			}
			at_spot = at_spot.chain;
		}
		if ((i == 1))
		{
			i = (1 + floor ((random () * 5)));
			self.velocity = '0 0 0';
			setsize (self, '-16 -16 -24', '16 16 32');
			self.view_ofs = '0 0 22';
			self.movetype = 3;
			self.is_feigning = 0;
			self.current_weapon = self.weapon;
			W_SetCurrentAmmo ();
			self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_CANT_MOVE));
			TeamFortress_SetSpeed (self);
			if ((self.weapon <= 16))
			{
				spy_upaxe1 ();
				return;
			}
			if ((i == 1))
			{
				spy_upb1 ();
			}
			else
			{
				if ((i == 2))
				{
					spy_upc1 ();
				}
				else
				{
					if ((i == 3))
					{
						spy_upd1 ();
					}
					else
					{
						spy_upe1 ();
					}
				}
			}
		}
		else
		{
			if ((j == 1))
			{
				sprint (self, 2, "You can't get up with something\non top of you.\n");
			}
			else
			{
				sprint (self, 2, "You can't get up while someone\nis standing on you.\n");
			}
		}
	}
	else
	{
		if ((self.is_unabletospy == 1))
		{
			sprint (self, 2, "You can't feign right now.\n");
			return;
		}
		if (self.hook_out)
		{
			sprint (self, 2, "You can't feign with the hook out.\n");
			return;
		}
		if ((!(self.flags & 512) && (self.waterlevel == 0)))
		{
			sprint (self, 2, "You can't feign in the air.\n");
			return;
		}
		at_spot = findradius (self.origin, 64);
		while ((at_spot != world))
		{
			if ((((at_spot.classname == "player") && (self != at_spot)) && (at_spot.is_feigning == 1)))
			{
				sprint (self, 2, "You can't feign on top of another spy!\n");
				return;
			}
			at_spot = at_spot.chain;
		}
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | TFSTATE_CANT_MOVE);
		TeamFortress_SetSpeed (self);
		self.is_feigning = 1;
		Attack_Finished (0.8);
		self.invisible_finished = 0;
		self.modelindex = modelindex_player;
		self.weapon = self.current_weapon;
		self.current_weapon = 0;
		self.weaponmodel = "";
		self.weaponframe = 0;
		setsize (self, '-16 -16 -24', '16 16 -16');
		self.view_ofs = '0 0 4';
		self.movetype = 6;
		if ((issilent == 0))
		{
			DeathSound ();
		}
		if ((self.weapon <= 16))
		{
			spy_die_ax1 ();
			return;
		}
		te = find (world, classname, "item_tfgoal");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((!(te.goal_activation & 256) || (self.has_disconnected == 1)))
				{
					tfgoalitem_RemoveFromPlayer (te, self, 0);
				}
				if (((CTF_Map == 1) && (te.goal_no == 1)))
				{
					bprint (2, self.netname);
					bprint (2, " лост the блуе flag!\n");
				}
				else
				{
					if (((CTF_Map == 1) && (te.goal_no == 2)))
					{
						bprint (2, self.netname);
						bprint (2, " лост the ред flag!\n");
					}
				}
			}
			te = find (te, classname, "item_tfgoal");
		}
		if ((te != world))
		{
			dremove (te);
		}
		i = (1 + floor ((random () * 6)));
		if ((i == 1))
		{
			spy_diea1 ();
		}
		else
		{
			if ((i == 2))
			{
				spy_dieb1 ();
			}
			else
			{
				if ((i == 3))
				{
					spy_diec1 ();
				}
				else
				{
					if ((i == 4))
					{
						spy_died1 ();
					}
					else
					{
						spy_diee1 ();
					}
				}
			}
		}
	}
};

void () TeamFortress_SpyGoUndercover =
{
	local entity te;

	if ((self.effects & (8 | 4)))
	{
		sprint (self, 1, "You cannot disguise while glowing.\n");
		return;
	}
	if ((self.is_unabletospy == 1))
	{
		sprint (self, 2, "You can't go undercover right now.\n");
		return;
	}
	if ((self.is_undercover != 2))
	{
		self.current_menu = 12;
		self.menu_count = 30;
	}
	else
	{
		sprint (self, 2, "You stop going undercover.\n");
		self.is_undercover = 0;
	}
};

void (entity spy) TeamFortress_SpyCalcName =
{
	local entity te;

	spy.undercover_name = string_null;
	if ((spy.undercover_team != 0))
	{
		te = find (world, classname, "player");
		while (te)
		{
			if (((te.team_no == spy.undercover_team) && (te.skin == spy.undercover_skin)))
			{
				spy.undercover_name = te.netname;
				te = world;
			}
			else
			{
				te = find (te, classname, "player");
			}
		}
		if ((spy.undercover_name == string_null))
		{
			te = find (world, classname, "player");
			while (te)
			{
				if ((te.team_no == spy.undercover_team))
				{
					spy.undercover_name = te.netname;
					te = world;
				}
				else
				{
					te = find (te, classname, "player");
				}
			}
		}
	}
};

void () TeamFortress_SpyUndercoverThink =
{
	local float tc;
	local string st;

	if ((self.owner.playerclass != 8))
	{
		return;
	}
	if ((self.owner.is_undercover == 2))
	{
		self.owner.immune_to_check = (time + 5);
		if ((self.skin != 0))
		{
			sprint (self.owner, 2, "Skin set to ");
			TeamFortress_PrintClassName (self.owner, self.skin, 0);
			self.owner.undercover_skin = self.skin;
			TeamFortress_SetSkin (self.owner);
		}
		if ((self.team != 0))
		{
			sprint (self.owner, 2, "Colors set to Team ");
			st = ftos (self.team);
			sprint (self.owner, 2, st);
			sprint (self.owner, 2, "\n");
			self.owner.undercover_team = self.team;
			stuffcmd (self.owner, "color ");
			tc = (TeamFortress_GetColor (self.team) - 1);
			st = ftos (tc);
			stuffcmd (self.owner, st);
			stuffcmd (self.owner, "\n");
			TeamFortress_SetSkin (self.owner);
		}
		TeamFortress_SpyCalcName (self.owner);
		if ((self.owner.StatusBarSize == 0))
		{
			CenterPrint (self.owner, "You are now disguised.\n");
		}
		self.owner.is_undercover = 1;
	}
	self.owner.StatusRefreshTime = (time + 0.1);
	dremove (self);
};

void (float class) TeamFortress_SpyChangeSkin =
{
	local entity te;

	if (class == 8)
	{
		sprint (self, 2, "Skin reset.\n");
		self.undercover_skin = 0;
		TeamFortress_SetSkin (self);
		if ((self.undercover_team == 0))
		{
			self.is_undercover = 0;
		}
		return;
	}
	sprint (self, 2, "Going undercover...\n");
	self.is_undercover = 2;
	te = spawn ();
	te.classname = "timer";
	te.owner = self;
	te.think = TeamFortress_SpyUndercoverThink;
	te.nextthink = (time + 4);
	te.skin = class;
	TeamFortress_SetSkin (self);
};

void (float teamno) TeamFortress_SpyChangeColor =
{
	local entity te;
	local string st;
	local float tc;

	if ((teamno == self.team_no))
	{
		sprint (self, 2, "Colors reset.\n");
		self.immune_to_check = (time + 5);
		self.undercover_team = 0;
		stuffcmd (self, "color ");
		tc = (TeamFortress_GetColor (self.team_no) - 1);
		st = ftos (tc);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		if ((self.undercover_skin == 0))
		{
			self.is_undercover = 0;
		}
		TeamFortress_SetSkin (self);
		return;
	}
	sprint (self, 2, "Going undercover...\n");
	self.is_undercover = 2;
	te = spawn ();
	te.classname = "timer";
	te.owner = self;
	te.think = TeamFortress_SpyUndercoverThink;
	te.nextthink = (time + 4);
	te.team = teamno;
};

void (entity spy) Spy_RemoveDisguise =
{
	local string st;
	local float tc;
	local float reset;

	if ((spy.playerclass == PC_SPY))
	{
		if ((spy.undercover_team != 0))
		{
			spy.immune_to_check = (time + 5);
			spy.undercover_team = 0;
			stuffcmd (spy, "color ");
			tc = (TeamFortress_GetColor (spy.team_no) - 1);
			st = ftos (tc);
			stuffcmd (spy, st);
			stuffcmd (spy, "\n");
		}
		if ((spy.undercover_skin != 0))
		{
			spy.immune_to_check = (time + 5);
			spy.undercover_skin = 0;
			spy.skin = 0;
		}
		spy.is_undercover = 0;
		self.StatusRefreshTime = (time + 0.1);
		TeamFortress_SetSkin (spy);
		TeamFortress_SpyCalcName (spy);
	}
};
