//@import - gren_normal.qc
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;

//=-=-=-=-= Local Functions
void () TeamFortress_Demoman;
void () TeamFortress_DetpackSet;
void () TeamFortress_DetpackExplode;
void () TeamFortress_DetpackTouch;
void () TeamFortress_DetpackDisarm;
void () TeamFortress_DetpackCountDown;
//=-=-=-=-= 

void () TeamFortress_Demoman = {
	self.weapons_carried 	= (PC_DEMOMAN_WEAPONS | 131072);
	self.ammo_rockets 		= 20;
	self.ammo_nails 		= 0;
	self.ammo_shells		= 30;
	self.ammo_cells 		= 0;
	self.maxammo_rockets 	= 50;
	self.maxammo_nails 		= 50;
	self.maxammo_shells 	= 70;
	self.maxammo_cells 		= 50;
	self.no_grenades_1 		= 4;
	self.no_grenades_2 		= 4;
	self.tp_grenades_1 		= GR_TYPE_NORMAL;
	self.tp_grenades_2 		= GR_TYPE_MIRV;
	self.tf_items 			= 0;
	self.ammo_detpack 		= 1;
	self.maxammo_detpack 	= 1;
	self.armorclass 		= (self.armorclass | 2);
	self.armortype 			= 0.6;
	self.armorvalue 		= 50;
	self.armor_allowed 		= 0.6;
	self.maxarmor 			= 120;
	self.max_health			= 90;
	self.current_weapon 	= WEAP_GRENADE_LAUNCHER;
	self.items_allowed 		= (PC_DEMOMAN_WEAPONS | 131072);
	self.items 				= (self.items | 1 | 16);
};

void () TeamFortress_DetonatePipebombs =
{
	local entity e;

	e = find (world, classname, "pipebomb");
	while ((e != world))
	{
		if ((e.owner == self))
		{
			e.nextthink = time;
		}
		e = find (e, classname, "pipebomb");
	}
};

void (entity bowner) TeamFortress_SetBomb =
{
	local string stimer;
	local float timer;
	local entity at_spot;
	local float found_site;
	local float bombarmtime;

	bowner.is_detpacking = 0;
	if ((bowner.team_no != 2))
	{
		return;
	}
	if (!(bowner.weapons_carried & 131072))
	{
		sprint (bowner, 2, "You do not have the Bomb!\n");
		return;
	}
	at_spot = findradius (bowner.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (bowner != at_spot)))
		{
			sprint (bowner, 2, "You can't set a bomb on someone!\n");
			bowner.is_detpacking = 0;
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (bowner, 2, "You can't set a bomb on a sentry gun!\n");
				bowner.is_detpacking = 0;
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (bowner, 2, "You can't set a bomb on a dispenser!\n");
					bowner.is_detpacking = 0;
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (bowner, 2, "Bombs can't be stacked!\n");
						bowner.is_detpacking = 0;
						return;
					}
				}
			}
		}
		at_spot = at_spot.chain;
	}
	if (!(bowner.flags & 512))
	{
		sprint (bowner, 2, "You can't set the bomb in the air!\n");
		bowner.is_detpacking = 0;
		return;
	}
	if (!practice)
	{
		bowner.ammo_detpack = (bowner.ammo_detpack - 1);
	}
	bowner.immune_to_check = (time + 5);
	bowner.tfstate = (bowner.tfstate | TFSTATE_CANT_MOVE);
	bowner.weapon = bowner.current_weapon;
	bowner.current_weapon = 0;
	bowner.weaponmodel = "";
	bowner.weaponframe = 0;
	TeamFortress_SetSpeed (bowner);
	if (bowner.is_unabletospy)
	{
		bowner.is_unabletospy = 0;
	}
	timer = stof (infokey (world, "bombtime"));
	if (((timer < 5) || (timer > _Z)))
	{
		timer = _2;
	}
	stimer = ftos (timer);
	bombarmtime = stof (infokey (world, "bombarmtime"));
	if (((bombarmtime < 1) || (bombarmtime > enter)))
	{
		bombarmtime = 3;
	}
	bowner.pausetime = (time + bombarmtime);
	sprint (bowner, 2, "Setting Bomb...\n");
	newmis = spawn ();
	newmis.owner = bowner;
	newmis.classname = "timer";
	newmis.netname = "detpack_timer";
	newmis.nextthink = (time + bombarmtime);
	newmis.think = TeamFortress_DetpackSet;
	newmis.health = timer;
};

void (float timer) TeamFortress_SetDetpack =
{
	local string stimer;
	local entity te;
	local entity at_spot;

	if (tfstrike)
	{
		self.is_detpacking = 1;
		return;
	}
	self.impulse = 0;
	self.last_impulse = 0;
	if (!(self.weapons_carried & 131072))
	{
		return;
	}
	if ((self.ammo_detpack <= 0))
	{
		sprint (self, 2, "You have no detpacks left!\n");
		return;
	}
	at_spot = findradius (self.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (self != at_spot)))
		{
			sprint (self, 2, "You can't set a detpack on someone!\n");
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (self, 2, "You can't set a detpack on a sentry gun!\n");
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (self, 2, "You can't set a detpack on a dispenser!\n");
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (self, 2, "Detpacks can't be stacked!\n");
						return;
					}
				}
			}
		}
		at_spot = at_spot.chain;
	}
	if (!(self.flags & 512))
	{
		sprint (self, 2, "You can't set detpacks in the air!\n");
		return;
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if ((te.owner == self))
		{
			sprint (self, 2, "You can only have 1 detpack active at a time.\n");
			return;
		}
		te = find (te, classname, "detpack");
	}
	if ((timer < 5))
	{
		sprint (self, 2, "You can't set detpacks for less than 5 seconds.\n");
		return;
	}
	self.is_detpacking = 1;
	if (!practice)
	{
		self.ammo_detpack = (self.ammo_detpack - 1);
	}
	self.immune_to_check = (time + 5);
	self.tfstate = (self.tfstate | TFSTATE_CANT_MOVE);
	self.weapon = self.current_weapon;
	self.current_weapon = 0;
	self.weaponmodel = "";
	self.weaponframe = 0;
	TeamFortress_SetSpeed (self);
	if (self.is_unabletospy)
	{
		self.is_unabletospy = 0;
	}
	stimer = ftos (timer);
	self.pausetime = (time + 3);
	sprint (self, 2, "Setting detpack for ");
	sprint (self, 2, stimer);
	sprint (self, 2, " seconds...\n");
	newmis = spawn ();
	newmis.owner = self;
	newmis.classname = "timer";
	newmis.netname = "detpack_timer";
	newmis.nextthink = (time + 3);
	newmis.think = TeamFortress_DetpackSet;
	newmis.health = timer;
};

void () TeamFortress_DetpackStop =
{
	local entity detpack_timer;

	self.is_detpacking = 0;
	detpack_timer = find (world, netname, "detpack_timer");
	while (((detpack_timer.owner != self) && (detpack_timer != world)))
	{
		detpack_timer = find (detpack_timer, netname, "detpack_timer");
	}
	if ((detpack_timer == world))
	{
		return;
	}
	sprint (self, 2, "Detpack retrieved.\n");
	self.ammo_detpack = (self.ammo_detpack + 1);
	dremove (detpack_timer);
	self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_CANT_MOVE));
	self.current_weapon = self.weapon;
	W_SetCurrentAmmo ();
	TeamFortress_SetSpeed (self);
	self.pausetime = time;
};

void () TeamFortress_DetpackSet =
{
	local entity countd;
	local entity oldself;
	local float skinno;
	local string st;

	self.is_detpacking = 0;
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_CANT_MOVE));
	TeamFortress_SetSpeed (self.owner);
	oldself = self;
	self = self.owner;
	self.is_detpacking = 0;
	self.current_weapon = self.weapon;
	W_SetCurrentAmmo ();
	self = oldself;
	newmis = spawn ();
	newmis.owner = self.owner;
	newmis.origin = (self.owner.origin - '0 0 23');
	newmis.movetype = enter;
	st = infokey (world, "soliddet");
	if ((st == "off"))
	{
		newmis.solid = 1;
	}
	else
	{
		newmis.solid = 2;
	}
	newmis.classname = "detpack";
	newmis.flags = 256;
	newmis.angles = '90 0 0';
	newmis.angles_y = self.owner.angles_y;
	newmis.velocity = '0 0 0';
	newmis.avelocity = '0 0 0';
	newmis.weaponmode = 0;
	newmis.touch = TeamFortress_DetpackTouch;
	setmodel (newmis, "progs/detpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 8');
	setorigin (newmis, self.owner.origin);
	countd = spawn ();
	newmis.linked_list = countd;
	countd.think = TeamFortress_DetpackCountDown;
	countd.health = (self.health - 1);
	countd.owner = self.owner;
	countd.classname = "countdown_timer";
	countd.enemy = newmis;
	newmis.oldenemy = countd;
	if ((self.health <= 255))
	{
		countd.nextthink = (time + 1);
	}
	else
	{
		countd.nextthink = ((time + self.health) - enter);
		countd.health = 9;
	}
	newmis.nextthink = (time + self.health);
	newmis.think = TeamFortress_DetpackExplode;
	if (tfstrike)
	{
		newmis.targetname = self.owner.target;
		self.owner.target = string_null;
		bprint (2, "The Bomb has been planted!\n");
		sound (self.owner, 2, "speech/bombpl.wav", 1, 0);
	}
	else
	{
		sound (self.owner, 2, "doors/medtry.wav", 1, 1);
		sprint (self.owner, 2, "Detpack set!\n");
	}
	dremove (self);
};

void () TeamFortress_DetpackExplode =
{
	local float pos;
	local float points;
	local entity head;
	local entity te;
	local vector org;

	bprint (1, "FIRE IN THE HOLE!\n");
	sound (self, 1, "weapons/detpack.wav", 1, 0);
	pos = pointcontents (self.origin);
	if ((((pos != -2) && (pos != -6)) && !self.owner.has_disconnected))
	{
		deathmsg = 12;
		head = findradius (self.origin, 1500);
		while (head)
		{
			if ((head.classname == "info_tfgoal"))
			{
				if (((head.goal_activation & 2) && (head.search_time == 0)))
				{
					traceline (self.origin, head.origin, 1, self);
					if ((trace_fraction == 1))
					{
						if (Activated (head, self.owner))
						{
							DoResults (head, self.owner, 1);
						}
						else
						{
							if ((head.else_goal != 0))
							{
								te = Findgoal (head.else_goal);
								if (te)
								{
									AttemptToActivate (te, self.owner, head);
								}
							}
						}
					}
				}
			}
			else
			{
				if ((head.takedamage && (vlen ((head.origin - self.origin)) <= 700)))
				{
					org = (head.origin + ((head.mins + head.maxs) * 0.5));
					points = (0.5 * vlen ((self.origin - org)));
					if ((points < 0))
					{
						points = 0;
					}
					points = (700 - points);
					if (points)
					{
						if (tfstrike)
						{
							TF_T_Damage (head, self, self.owner, (points * 2), 2, 4);
						}
						else
						{
							if (CanDamage (head, self))
							{
								TF_T_Damage (head, self, self.owner, (points * 2), 2, 4);
							}
						}
					}
				}
			}
			head = head.chain;
		}
		if (tfstrike)
		{
			te = find (world, classname, "func_breakable");
			while (te)
			{
				if ((te.targetname == self.targetname))
				{
					te.solid = 0;
					setmodel (te, string_null);
				}
				te = find (te, classname, "func_breakable");
			}
			te = find (world, classname, "env_explosion");
			while (te)
			{
				if ((te.targetname == self.targetname))
				{
					te.nextthink = (time + (random () * 0.2));
				}
				te = find (te, classname, "env_explosion");
			}
			tfs_winner = self.owner.team_no;
		}
		WriteByte (4, 23);
		WriteByte (4, 3);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 1);
	}
	else
	{
		sprint (self.owner, 2, "Your detpack fizzled out.\n");
	}
	if ((self.weaponmode == 1))
	{
		TeamFortress_SetSpeed (self.enemy);
		dremove (self.oldenemy);
		dremove (self.observer_list);
	}
	dremove (self);
};

void () TeamFortress_DetpackTouch =
{
	local entity disarm;
	local vector source;
	local vector org;
	local vector def;
	local float defusetime;

	CheckBelowBuilding (self);
	if ((other.classname != "player"))
	{
		return;
	}
	if (!tfstrike)
	{
		if ((other.playerclass != 1))
		{
			return;
		}
	}
	else
	{
		if ((!other.playerclass || (other.team_no == 2)))
		{
			return;
		}
	}
	if (other.deadflag)
	{
		return;
	}
	if ((self.weaponmode == 1))
	{
		return;
	}
	if (((other.team_no == self.owner.team_no) && (self.owner.team_no != 0)))
	{
		return;
	}
	makevectors (other.v_angle);
	source = (other.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), 0, other);
	if ((self.solid == 2))
	{
		if (((trace_fraction == 1) || (trace_ent != self)))
		{
			return;
		}
	}
	else
	{
		if ((trace_fraction == 1))
		{
			return;
		}
	}
	other.immune_to_check = (time + 5);
	other.tfstate = (other.tfstate | TFSTATE_CANT_MOVE);
	TeamFortress_SetSpeed (other);
	disarm = spawn ();
	disarm.owner = other;
	disarm.enemy = self;
	disarm.classname = "timer";
	if (tfstrike)
	{
		defusetime = stof (infokey (world, "bombdefusetime"));
		if (((defusetime < 3) || (defusetime > 15)))
		{
			defusetime = 8;
		}
		disarm.nextthink = (time + 1);
		disarm.weapon = defusetime;
		sprint (other, 2, "Defusing Bomb...\n");
	}
	else
	{
		disarm.nextthink = (time + 3);
		sprint (other, 2, "Disarming detpack...\n");
	}
	disarm.think = TeamFortress_DetpackDisarm;
	self.weaponmode = 1;
	self.enemy = other;
	self.observer_list = disarm;
};

void () TeamFortress_DetpackDisarm =
{
	if (self.owner.deadflag)
	{
		dremove (self);
		return;
	}
	if (tfstrike)
	{
		if ((self.weapon > 0))
		{
			ftos (self.weapon);
			CenterPrint3 (self.owner, "Defusing Bomb in ", ftos (self.weapon), " second(s)\n");
			self.weapon = (self.weapon - 1);
			self.nextthink = (time + 1);
			return;
		}
		bprint (1, self.enemy.owner.netname);
		bprint (1, "'s bomb was defused by ");
		bprint (1, self.owner.netname);
		bprint (1, "\n");
		tfs_winner = self.owner.team_no;
	}
	else
	{
		bprint (1, self.enemy.owner.netname);
		bprint (1, "'s detpack was defused by ");
		bprint (1, self.owner.netname);
		bprint (1, "\n");
	}
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_CANT_MOVE));
	TF_AddFrags (self.owner, 1, 0);
	TeamFortress_SetSpeed (self.owner);
	dremove (self.enemy.oldenemy);
	dremove (self.enemy);
	dremove (self);
};

void () TeamFortress_DetpackCountDown =
{
	local string cd;

	cd = ftos (self.health);
	CheckBelowBuilding (self.enemy);
	self.nextthink = (time + 1);
	self.health = (self.health - 1);
	if ((self.health < enter))
	{
		sprint (self.owner, 2, cd);
		sprint (self.owner, 2, "...\n");
		if (((self.health < 5) && (self.has_disconnected == 0)))
		{
			sound (self.enemy, 2, "doors/baseuse.wav", 1, 1);
			self.has_disconnected = 1;
		}
		if (((self.health < 5) && (self.enemy.skin == 0)))
		{
			self.enemy.skin = 1;
		}
		else
		{
			self.enemy.skin = 0;
		}
		if ((self.health <= 0))
		{
			dremove (self);
		}
	}
};
