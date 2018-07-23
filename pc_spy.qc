//=-=-=-=-=
void () TeamFortress_Spy;
void (entity Item, entity AP, float method) tfgoalitem_RemoveFromPlayer;
void (entity spy) TeamFortress_SpyCalcName;
void () TeamFortress_SpyUndercoverThink;
void () GasGrenadeMakeGas;

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
	self.tp_grenades_1 		= 1;
	self.tp_grenades_2		= 7;
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

void () GasGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () GasGrenadeExplode =
{
	local vector tmpv;
	local entity te;
	local float pos;

	pos = pointcontents (self.origin);
	if ((pos == -1))
	{
		te = spawn ();
		te.think = GasGrenadeMakeGas;
		te.nextthink = (time + 0.1);
		te.classname = "grentimer";
		te.heat = 0;
		te.origin = self.origin;
		te.owner = self.owner;
		te.team_no = self.owner.team_no;
		te.weapon = 0;
		te.enemy = self;
	}
	else
	{
		pos = 0;
		while ((pos < enter))
		{
			newmis = spawn ();
			setmodel (newmis, "progs/s_bubble.spr");
			setorigin (newmis, self.origin);
			newmis.movetype = 8;
			newmis.solid = 0;
			newmis.velocity = '0 0 15';
			newmis.velocity_z = (enter + (random () * 20));
			newmis.nextthink = (time + 0.5);
			newmis.think = bubble_bob;
			newmis.classname = "bubble";
			newmis.frame = 0;
			newmis.cnt = 0;
			setsize (newmis, '-8 -8 -8', '8 8 8');
			pos = (pos + 1);
		}
	}
	dremove (self);
};

void () GasGrenadeMakeGas =
{
	local entity te;
	local entity timer;
	local float max_heat;
	local float dam_mult;

	if (shortergrens) {
		max_heat = 15;
	} 
	else {
		max_heat = 20;
	}

	if ((self.heat == 0))
	{
		self.owner.no_active_gas_grens = (self.owner.no_active_gas_grens + 1);
		if ((self.owner.no_active_gas_grens > 1))
		{
			te = find (world, classname, "grentimer");
			while ((te != world))
			{
				if (((te.owner == self.owner) && (te.no_active_gas_grens == 1)))
				{
					te.weapon = 24;
					te.think = RemoveGrenade;
					te.nextthink = (time + 0.1);
				}
				te = find (te, classname, "grentimer");
			}
		}
		self.no_active_gas_grens = self.owner.no_active_gas_grens;
	}
	self.nextthink = (time + 0.75);
	te = findradius (self.origin, 200);
	while ((te != world))
	{
		if ((((te.classname == "player") && (te.deadflag == 0)) && (te.has_disconnected != 1)))
		{
			deathmsg = 24;
			dam_mult = 1;
			if (shortergrens)
				dam_mult = 1.33;

			TF_T_Damage (te, world, self.owner, enter * dam_mult, (1 | 2), 0);
			if ((te.tfstate & TFSTATE_HALLUCINATING))
			{
				timer = find (world, classname, "timer");
				while ((((timer.owner != te) || (timer.think != HallucinationTimer)) && (timer != world)))
				{
					timer = find (timer, classname, "timer");
				}
				if ((timer != world))
				{
					timer.health = (timer.health + 25);
					if ((timer.health < 150))
					{
						timer.health = 150;
					}
				}
			}
			else
			{
				sprint (te, 2, "Run for cover! They're everywhere!\n");
				te.tfstate = (te.tfstate | TFSTATE_HALLUCINATING);
				timer = spawn ();
				timer.nextthink = (time + 0.3);
				timer.think = HallucinationTimer;
				timer.classname = "timer";
				timer.owner = te;
				timer.health = 150;
				timer.team_no = self.team_no;
			}
		}
		te = te.chain;
	}
	self.heat = (self.heat + 1);
	if ((self.heat == 1))
	{
		WriteByte (4, 23);
		WriteByte (4, 4);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 2);
		return;
	}
	if ((self.heat <= max_heat))
	{
		self.weapon = (self.weapon + 1);
		if ((self.weapon == 1))
		{
			WriteByte (4, 23);
			WriteByte (4, enter);
			WriteCoord (4, self.origin_x);
			WriteCoord (4, self.origin_y);
			WriteCoord (4, (self.origin_z - 24));
			multicast (self.origin, 2);
		}
		else
		{
			if ((self.weapon == 2))
			{
				self.weapon = 0;
			}
		}
		return;
	}
	RemoveGrenade ();
};

void () HallucinationTimer =
{
	local entity te;
	local float tmpx;
	local float tmpy;
	local float halltype;
	local float halltype2;
	local string st;

	self.health = (self.health - 3);
	if ((self.owner.playerclass == PC_MEDIC))
	{
		self.health = (self.health - 2);
	}
	if ((((self.health <= 0) || (self.owner.deadflag != 0)) || (self.owner.has_disconnected == 1)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_HALLUCINATING));
	}
	if (((self.owner.deadflag != 0) || (self.owner.has_disconnected == 1)))
	{
		dremove (self);
		return;
	}
	if (!(self.owner.tfstate & TFSTATE_HALLUCINATING))
	{
		sprint (self.owner, 2, "You feel a little better now.\n");
		dremove (self);
		return;
	}
	self.nextthink = (time + 0.3);
	if ((random () < 0.5))
	{
		KickPlayer (-10, self.owner);
	}
	tmpx = ((random () * 800) - 400);
	tmpy = ((random () * 800) - 400);
	halltype = random ();
	halltype2 = random ();
	msg_entity = self.owner;
	if ((halltype < 0.4))
	{
		WriteByte (1, 23);
		if ((halltype < 0.25))
		{
			WriteByte (1, 3);
		}
		else
		{
			if ((halltype < 0.35))
			{
				WriteByte (1, 4);
			}
			else
			{
				WriteByte (1, enter);
			}
		}
		WriteCoord (1, (msg_entity.origin_x + tmpx));
		WriteCoord (1, (msg_entity.origin_y + tmpy));
		WriteCoord (1, msg_entity.origin_z);
		T_Damage (self.owner, self.owner, self.owner, 0);
	}
	else
	{
		if ((halltype < 0.7))
		{
			WriteByte (1, 23);
			WriteByte (1, 11);
			WriteCoord (1, (msg_entity.origin_x + tmpx));
			WriteCoord (1, (msg_entity.origin_y + tmpy));
			WriteCoord (1, msg_entity.origin_z);
			if ((halltype2 < 0.1))
			{
				stuffcmd (self.owner, "play weapons/r_exp3.wav\n");
			}
			else
			{
				if ((halltype2 < 0.15))
				{
					stuffcmd (self.owner, "play weapons/rocket1i.wav\n");
				}
				else
				{
					if ((halltype2 < 0.2))
					{
						stuffcmd (self.owner, "play weapons/sgun1.wav\n");
					}
					else
					{
						if ((halltype2 < 0.25))
						{
							stuffcmd (self.owner, "play weapons/guncock.wav\n");
						}
						else
						{
							if ((halltype2 < 0.3))
							{
								stuffcmd (self.owner, "play weapons/ric1.wav\n");
							}
							else
							{
								if ((halltype2 < 0.35))
								{
									stuffcmd (self.owner, "play weapons/ric2.wav\n");
								}
								else
								{
									if ((halltype2 < 0.4))
									{
										stuffcmd (self.owner, "play weapons/ric3.wav\n");
									}
									else
									{
										if ((halltype2 < 0.45))
										{
											stuffcmd (self.owner, "play weapons/spike2.wav\n");
										}
										else
										{
											if ((halltype2 < 0.5))
											{
												stuffcmd (self.owner, "play weapons/tink1.wav\n");
											}
											else
											{
												if ((halltype2 < 0.55))
												{
													CenterPrint2 (self.owner, "\n\n\n", "Your team цаптуред the flag!!");
													stuffcmd (self.owner, "play weapons/grenade.wav\n");
												}
												else
												{
													if ((halltype2 < 0.6))
													{
														stuffcmd (self.owner, "play weapons/bounce.wav\n");
													}
													else
													{
														if ((halltype2 < 0.65))
														{
															stuffcmd (self.owner, "play weapons/shotgn2.wav\n");
														}
														else
														{
															if ((halltype2 < 0.7))
															{
																stuffcmd (self.owner, "play wizard/wattack.wav\n");
															}
															else
															{
																if ((halltype2 < 0.75))
																{
																	stuffcmd (self.owner, "play items/r_item1.wav\n");
																}
																else
																{
																	if ((halltype2 < 0.8))
																	{
																		stuffcmd (self.owner, "play items/r_item2.wav\n");
																	}
																	else
																	{
																		if ((halltype2 < 0.85))
																		{
																			CenterPrint (self.owner, "You are on fire!\n");
																			stuffcmd (self.owner, "play weapons/lhit.wav\n");
																		}
																		else
																		{
																			if ((halltype2 < 0.9))
																			{
																				stuffcmd (self.owner, "play misc/r_tele1.wav\n");
																			}
																			else
																			{
																				stuffcmd (self.owner, "play weapons/railgun.wav\n");
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
		else
		{
			te = spawn ();
			te.origin_x = (msg_entity.origin_x + tmpx);
			te.origin_y = (msg_entity.origin_y + tmpy);
			te.origin_z = msg_entity.origin_z;
			WriteByte (1, 23);
			WriteByte (1, 6);
			WriteEntity (1, te);
			WriteCoord (1, te.origin_x);
			WriteCoord (1, te.origin_y);
			WriteCoord (1, te.origin_z);
			tmpx = ((random () * 800) - 400);
			tmpy = ((random () * 800) - 400);
			WriteCoord (1, (msg_entity.origin_x + tmpx));
			WriteCoord (1, (msg_entity.origin_y + tmpy));
			WriteCoord (1, msg_entity.origin_z);
			if ((halltype2 < 0.1))
			{
				stuffcmd (self.owner, "play weapons/detpack.wav\n");
			}
			else
			{
				if ((halltype2 < 0.2))
				{
					stuffcmd (self.owner, "play weapons/turrset.wav\n");
				}
				else
				{
					if ((halltype2 < 0.3))
					{
						stuffcmd (self.owner, "play weapons/turrspot.wav\n");
					}
					else
					{
						if ((halltype2 < 0.4))
						{
							stuffcmd (self.owner, "play weapons/turridle.wav\n");
						}
						else
						{
							if ((halltype2 < 0.5))
							{
								stuffcmd (self.owner, "play weapons/sniper.wav\n");
							}
							else
							{
								if ((halltype2 < 0.6))
								{
									CenterPrint2 (self.owner, "\n\n\n", "Your flag has been такен!!");
									stuffcmd (self.owner, "play weapons/flmfire2.wav\n");
								}
								else
								{
									if ((halltype2 < 0.7))
									{
										stuffcmd (self.owner, "play weapons/flmgrexp.wav\n");
									}
									else
									{
										if ((halltype2 < 0.8))
										{
											stuffcmd (self.owner, "play misc/vapeur2.wav\n");
										}
										else
										{
											if ((halltype2 < 0.9))
											{
												stuffcmd (self.owner, "play weapons/asscan1.wav\n");
											}
											else
											{
												stuffcmd (self.owner, "play weapons/asscan2.wav\n");
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
		if ((te != world))
		{
			dremove (te);
		}
	}
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
