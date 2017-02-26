//=-=-=-=-=
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;
void () MirvGrenadeTouch;
void () MirvGrenadeExplode;
void (vector org, entity shooter) MirvGrenadeLaunch;
void () TeamFortress_DetpackSet;
void () TeamFortress_DetpackTouch;
void () TeamFortress_DetpackDisarm;
void () TeamFortress_DetpackCountDown;

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

void () MirvGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () MirvGrenadeExplode =
{
	local float i;

	deathmsg = enter;
	T_RadiusDamage (self, self.owner, _d, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	self.solid = 0;
	i = 0;
	while ((i < AS_MISSILE))
	{
		MirvGrenadeLaunch ((self.origin + '0 0 -1'), self.owner);
		i = (i + SBAR_GRENS);
	}
	dremove (self);
};

void (vector org, entity shooter) MirvGrenadeLaunch =
{
	local float xdir;
	local float ydir;
	local float zdir;

	xdir = ((150 * random ()) - _K);
	ydir = ((150 * random ()) - _K);
	zdir = (40 * random ());
	newmis = spawn ();
	newmis.owner = shooter;
	newmis.movetype = enter;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "grenade";
	newmis.weapon = enter;
	newmis.touch = NormalGrenadeTouch;
	newmis.think = NormalGrenadeExplode;
	newmis.nextthink = ((time + SBAR_PRINT) + random ());
	newmis.velocity_x = (xdir * SBAR_PRINT);
	newmis.velocity_y = (ydir * SBAR_PRINT);
	newmis.velocity_z = (zdir * 15);
	newmis.avelocity = '250 300 400';
	setmodel (newmis, "progs/grenade2.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
};

void (entity bowner) TeamFortress_SetBomb =
{
	local string stimer;
	local float timer;
	local entity at_spot;
	local float found_site;
	local float bombarmtime;

	bowner.is_detpacking = 0;
	if ((bowner.team_no != SBAR_PRINT))
	{
		return;
	}
	if (!(bowner.weapons_carried & 131072))
	{
		sprint (bowner, SBAR_PRINT, "You do not have the Bomb!\n");
		return;
	}
	at_spot = findradius (bowner.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (bowner != at_spot)))
		{
			sprint (bowner, SBAR_PRINT, "You can't set a bomb on someone!\n");
			bowner.is_detpacking = 0;
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (bowner, SBAR_PRINT, "You can't set a bomb on a sentry gun!\n");
				bowner.is_detpacking = 0;
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (bowner, SBAR_PRINT, "You can't set a bomb on a dispenser!\n");
					bowner.is_detpacking = 0;
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (bowner, SBAR_PRINT, "Bombs can't be stacked!\n");
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
		sprint (bowner, SBAR_PRINT, "You can't set the bomb in the air!\n");
		bowner.is_detpacking = 0;
		return;
	}
	if (!practice)
	{
		bowner.ammo_detpack = (bowner.ammo_detpack - SBAR_GRENS);
	}
	bowner.immune_to_check = (time + 5);
	bowner.tfstate = (bowner.tfstate | 65536);
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
	if (((bombarmtime < SBAR_GRENS) || (bombarmtime > enter)))
	{
		bombarmtime = AS_MELEE;
	}
	bowner.pausetime = (time + bombarmtime);
	sprint (bowner, SBAR_PRINT, "Setting Bomb...\n");
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
		self.is_detpacking = SBAR_GRENS;
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
		sprint (self, SBAR_PRINT, "You have no detpacks left!\n");
		return;
	}
	at_spot = findradius (self.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (self != at_spot)))
		{
			sprint (self, SBAR_PRINT, "You can't set a detpack on someone!\n");
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (self, SBAR_PRINT, "You can't set a detpack on a sentry gun!\n");
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (self, SBAR_PRINT, "You can't set a detpack on a dispenser!\n");
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (self, SBAR_PRINT, "Detpacks can't be stacked!\n");
						return;
					}
				}
			}
		}
		at_spot = at_spot.chain;
	}
	if (!(self.flags & 512))
	{
		sprint (self, SBAR_PRINT, "You can't set detpacks in the air!\n");
		return;
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if ((te.owner == self))
		{
			sprint (self, SBAR_PRINT, "You can only have 1 detpack active at a time.\n");
			return;
		}
		te = find (te, classname, "detpack");
	}
	if ((timer < 5))
	{
		sprint (self, SBAR_PRINT, "You can't set detpacks for less than 5 seconds.\n");
		return;
	}
	self.is_detpacking = SBAR_GRENS;
	if (!practice)
	{
		self.ammo_detpack = (self.ammo_detpack - SBAR_GRENS);
	}
	self.immune_to_check = (time + 5);
	self.tfstate = (self.tfstate | 65536);
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
	self.pausetime = (time + AS_MELEE);
	sprint (self, SBAR_PRINT, "Setting detpack for ");
	sprint (self, SBAR_PRINT, stimer);
	sprint (self, SBAR_PRINT, " seconds...\n");
	newmis = spawn ();
	newmis.owner = self;
	newmis.classname = "timer";
	newmis.netname = "detpack_timer";
	newmis.nextthink = (time + AS_MELEE);
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
	sprint (self, SBAR_PRINT, "Detpack retrieved.\n");
	self.ammo_detpack = (self.ammo_detpack + SBAR_GRENS);
	dremove (detpack_timer);
	self.tfstate = (self.tfstate - (self.tfstate & 65536));
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
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 65536));
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
		newmis.solid = SBAR_GRENS;
	}
	else
	{
		newmis.solid = SBAR_PRINT;
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
	countd.health = (self.health - SBAR_GRENS);
	countd.owner = self.owner;
	countd.classname = "countdown_timer";
	countd.enemy = newmis;
	newmis.oldenemy = countd;
	if ((self.health <= 255))
	{
		countd.nextthink = (time + SBAR_GRENS);
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
		bprint (SBAR_PRINT, "The Bomb has been planted!\n");
		sound (self.owner, SBAR_PRINT, "speech/bombpl.wav", SBAR_GRENS, 0);
	}
	else
	{
		sound (self.owner, SBAR_PRINT, "doors/medtry.wav", SBAR_GRENS, SBAR_GRENS);
		sprint (self.owner, SBAR_PRINT, "Detpack set!\n");
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

	bprint (SBAR_GRENS, "FIRE IN THE HOLE!\n");
	sound (self, SBAR_GRENS, "weapons/detpack.wav", SBAR_GRENS, 0);
	pos = pointcontents (self.origin);
	if ((((pos != -2) && (pos != -6)) && !self.owner.has_disconnected))
	{
		deathmsg = 12;
		head = findradius (self.origin, 1500);
		while (head)
		{
			if ((head.classname == "info_tfgoal"))
			{
				if (((head.goal_activation & SBAR_PRINT) && (head.search_time == 0)))
				{
					traceline (self.origin, head.origin, SBAR_GRENS, self);
					if ((trace_fraction == SBAR_GRENS))
					{
						if (Activated (head, self.owner))
						{
							DoResults (head, self.owner, SBAR_GRENS);
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
							TF_T_Damage (head, self, self.owner, (points * SBAR_PRINT), SBAR_PRINT, AS_MISSILE);
						}
						else
						{
							if (CanDamage (head, self))
							{
								TF_T_Damage (head, self, self.owner, (points * SBAR_PRINT), SBAR_PRINT, AS_MISSILE);
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
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	else
	{
		sprint (self.owner, SBAR_PRINT, "Your detpack fizzled out.\n");
	}
	if ((self.weaponmode == SBAR_GRENS))
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
		if ((other.playerclass != SBAR_GRENS))
		{
			return;
		}
	}
	else
	{
		if ((!other.playerclass || (other.team_no == SBAR_PRINT)))
		{
			return;
		}
	}
	if (other.deadflag)
	{
		return;
	}
	if ((self.weaponmode == SBAR_GRENS))
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
	if ((self.solid == SBAR_PRINT))
	{
		if (((trace_fraction == SBAR_GRENS) || (trace_ent != self)))
		{
			return;
		}
	}
	else
	{
		if ((trace_fraction == SBAR_GRENS))
		{
			return;
		}
	}
	other.immune_to_check = (time + 5);
	other.tfstate = (other.tfstate | 65536);
	TeamFortress_SetSpeed (other);
	disarm = spawn ();
	disarm.owner = other;
	disarm.enemy = self;
	disarm.classname = "timer";
	if (tfstrike)
	{
		defusetime = stof (infokey (world, "bombdefusetime"));
		if (((defusetime < AS_MELEE) || (defusetime > 15)))
		{
			defusetime = 8;
		}
		disarm.nextthink = (time + SBAR_GRENS);
		disarm.weapon = defusetime;
		sprint (other, SBAR_PRINT, "Defusing Bomb...\n");
	}
	else
	{
		disarm.nextthink = (time + AS_MELEE);
		sprint (other, SBAR_PRINT, "Disarming detpack...\n");
	}
	disarm.think = TeamFortress_DetpackDisarm;
	self.weaponmode = SBAR_GRENS;
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
			self.weapon = (self.weapon - SBAR_GRENS);
			self.nextthink = (time + SBAR_GRENS);
			return;
		}
		bprint (SBAR_GRENS, self.enemy.owner.netname);
		bprint (SBAR_GRENS, "'s bomb was defused by ");
		bprint (SBAR_GRENS, self.owner.netname);
		bprint (SBAR_GRENS, "\n");
		tfs_winner = self.owner.team_no;
	}
	else
	{
		bprint (SBAR_GRENS, self.enemy.owner.netname);
		bprint (SBAR_GRENS, "'s detpack was defused by ");
		bprint (SBAR_GRENS, self.owner.netname);
		bprint (SBAR_GRENS, "\n");
	}
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 65536));
	TF_AddFrags (self.owner, SBAR_GRENS, 0);
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
	self.nextthink = (time + SBAR_GRENS);
	self.health = (self.health - SBAR_GRENS);
	if ((self.health < enter))
	{
		sprint (self.owner, SBAR_PRINT, cd);
		sprint (self.owner, SBAR_PRINT, "...\n");
		if (((self.health < 5) && (self.has_disconnected == 0)))
		{
			sound (self.enemy, SBAR_PRINT, "doors/baseuse.wav", SBAR_GRENS, SBAR_GRENS);
			self.has_disconnected = SBAR_GRENS;
		}
		if (((self.health < 5) && (self.enemy.skin == 0)))
		{
			self.enemy.skin = SBAR_GRENS;
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
