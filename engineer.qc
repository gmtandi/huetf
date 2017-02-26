//=-=-=-=-=
void () Rail_Touch;
void () EMPExplode;
void () EMPGrenadeTouch;
void () EMPGrenadeExplode;
void () TeamFortress_FinishedBuilding;
void (entity Gren) TeamFortress_ExplodePerson;
void () Dispenser_Die;
void () CheckDistance;
float (entity obj, entity builder) CheckArea;

void () Rail_Think =
{
	self.solid = SBAR_GRENS;
	self.movetype = 9;
	self.velocity = self.oldorigin;
	self.touch = Rail_Touch;
	setmodel (self, "progs/e_spike2.mdl");
	self.nextthink = (time + SBAR_GRENS);
	self.think = SUB_Remove;
};

void () Rail_Touch =
{
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if (((other == self.enemy) && (self.enemy != world)))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	org = (self.origin - (8 * normalize (self.velocity)));
	if (other.health)
	{
		SpawnBlood (org, 15);
		deathmsg = 26;
		TF_T_Damage (other, self, self.enemy, 25, SBAR_PRINT, 8);
		self.velocity = self.oldorigin;
		self.owner = other;
		setmodel (self, string_null);
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = Rail_Think;
		return;
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, 0);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	dremove (self);
};

void () W_FireRail =
{
	local vector vec;
	local vector org;

	if (!practice)
	{
		self.ammo_nails = (self.ammo_nails - SBAR_GRENS);
		self.currentammo = self.ammo_nails;
	}
	makevectors (self.v_angle);
	org = (self.origin + (v_forward * 8));
	vec = aim (self, 10000);
	vec = normalize (vec);
	newmis = spawn ();
	newmis.owner = self;
	newmis.enemy = self;
	newmis.movetype = 9;
	newmis.solid = SBAR_GRENS;
	setmodel (newmis, "progs/e_spike1.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, (org + '0 0 16'));
	newmis.velocity = (vec * 1500);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.oldorigin = newmis.velocity;
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = Rail_Touch;
};

void () EMPExplode =
{
	local float expsize;

	expsize = enter;
	if ((self.touch == weapon_touch))
	{
		expsize = SBAR_600;
	}
	else
	{
		if ((self.classname == "item_shells"))
		{
			expsize = (_2 + self.aflag);
		}
		else
		{
			if ((self.classname == "item_spikes"))
			{
				expsize = 40;
			}
			else
			{
				if ((self.classname == "item_rockets"))
				{
					expsize = (_d + (self.aflag * AS_MISSILE));
				}
				else
				{
					if ((self.classname == "item_cells"))
					{
						expsize = (SBAR_600 + (self.aflag * AS_MELEE));
					}
					else
					{
						if ((self.classname == "item_weapon"))
						{
							expsize = SBAR_600;
						}
						else
						{
							dprint ("EMPExplode: Attempting to explode a ");
							dprint (self.classname);
							dprint ("\n");
							return;
						}
					}
				}
			}
		}
	}
	deathmsg = 31;
	T_RadiusDamage (self, self.enemy, expsize, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	Respawn_Item (self, self.enemy);
};

void () EMPGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () EMPGrenadeExplode =
{
	local float expsize;
	local entity te;
	local entity oldself;

	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MISSILE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	te = findradius (self.origin, 240);
	while (te)
	{
		if ((te.classname != "item_spikes"))
		{
			if (((te.touch == ammo_touch) || (te.touch == weapon_touch)))
			{
				te.solid = 0;
				te.enemy = self.owner;
				te.nextthink = (time + (random () * 0.8));
				te.think = EMPExplode;
			}
			else
			{
				if (((te.classname == "player") || (te.touch == BackpackTouch)))
				{
					if (!(((teamplay & SBAR_240) && (te.team_no > 0)) && (te.team_no == self.owner.team_no)))
					{
						expsize = 0;
						expsize = (expsize + (te.ammo_shells * 0.75));
						expsize = (expsize + ((te.ammo_rockets * 0.75) * SBAR_PRINT));
						if ((te.playerclass != 9))
						{
							expsize = (expsize + (te.ammo_cells * 0.75));
						}
						if ((expsize > 0))
						{
							deathmsg = 30;
							T_RadiusDamage (te, self.owner, expsize, te);
							if ((te.touch != BackpackTouch))
							{
								TF_T_Damage (te, self, self.owner, expsize, SBAR_PRINT, AS_MISSILE);
								if (!practice)
								{
									te.ammo_shells = ceil ((te.ammo_shells * 0.25));
									te.ammo_rockets = ceil ((te.ammo_rockets * 0.25));
								}
								if ((te.playerclass != 9))
								{
									if (!practice)
									{
										te.ammo_cells = ceil ((te.ammo_cells * 0.25));
									}
								}
								oldself = self;
								self = te;
								W_SetCurrentAmmo ();
								self = oldself;
							}
							else
							{
								te.think = SUB_Remove;
								te.nextthink = (time + 0.1);
							}
							WriteByte (AS_MISSILE, 23);
							WriteByte (AS_MISSILE, AS_MELEE);
							WriteCoord (AS_MISSILE, te.origin_x);
							WriteCoord (AS_MISSILE, te.origin_y);
							WriteCoord (AS_MISSILE, te.origin_z);
							multicast (te.origin, SBAR_GRENS);
						}
					}
				}
				else
				{
					if ((te.classname == "pipebomb"))
					{
						te.nextthink = (time + (random () * 0.4));
					}
					else
					{
						if (grentype)
						{
							if (((te.classname == "grenade") || (te.classname == "rocket")))
							{
								te.nextthink = time;
							}
						}
						else
						{
							if (((te.classname == "building_dispenser") || (te.classname == "building_sentrygun")))
							{
								if (!(((teamplay & SBAR_240) && (te.team_no > 0)) && (te.team_no == self.owner.team_no)))
								{
									TF_T_Damage (te, self, self.owner, 200, 0, AS_MISSILE);
								}
							}
							else
							{
								if ((te.classname == "ammobox"))
								{
									expsize = 0;
									expsize = (expsize + (te.ammo_shells * 0.75));
									expsize = (expsize + ((te.ammo_rockets * 0.75) * SBAR_PRINT));
									expsize = (expsize + ((te.ammo_cells * 0.75) * SBAR_PRINT));
									if ((expsize > 0))
									{
										te.solid = 0;
										deathmsg = 30;
										T_RadiusDamage (te, self.owner, expsize, te);
										te.think = SUB_Remove;
										te.nextthink = (time + 0.1);
										WriteByte (AS_MISSILE, 23);
										WriteByte (AS_MISSILE, AS_MELEE);
										WriteCoord (AS_MISSILE, te.origin_x);
										WriteCoord (AS_MISSILE, te.origin_y);
										WriteCoord (AS_MISSILE, te.origin_z);
										multicast (te.origin, SBAR_GRENS);
									}
								}
								else
								{
									if (!tfstrike)
									{
										if ((te.think == TeamFortress_DetpackExplode))
										{
											te.solid = 0;
											te.nextthink = (time + (random () * SBAR_PRINT));
											dremove (te.oldenemy);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		te = te.chain;
	}
	dremove (self);
};

void () TeamFortress_EngineerBuild =
{
	local entity te;

	if (!(self.flags & 512))
	{
		CenterPrint (self, "You can't build in the air!\n\n");
		return;
	}
	if ((self.is_building == 0))
	{
		if ((((self.ammo_cells < _d) && !self.has_dispenser) && !self.has_sentry))
		{
			CenterPrint (self, "You don't have enough metal to \nbuild anything.\n\n");
			return;
		}
		self.current_menu = 15;
		self.menu_count = 25;
	}
	else
	{
		if ((self.is_building == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "You stop building.\n");
			self.tfstate = (self.tfstate - (self.tfstate & 65536));
			TeamFortress_SetSpeed (self);
			te = find (world, netname, "build_timer");
			while (te)
			{
				if ((te.owner == self))
				{
					dremove (te);
					te = world;
				}
				else
				{
					te = find (te, netname, "build_timer");
				}
			}
			self.is_building = 0;
			self.current_weapon = self.weapon;
			W_SetCurrentAmmo ();
		}
	}
};

float (entity obj, entity builder) CheckArea =
{
	local vector src;
	local vector end;
	local float pos;
	local entity te;

	pos = pointcontents (obj.origin);
	if (((pos == -2) || (pos == -6)))
	{
		return (0);
	}
	src_x = ((obj.origin_x + obj.maxs_x) + 24);
	src_y = ((obj.origin_y + obj.maxs_y) + 24);
	src_z = ((obj.origin_z + obj.maxs_z) + SBAR_240);
	pos = pointcontents (src);
	if (((pos == -2) || (pos == -6)))
	{
		return (0);
	}
	end_x = ((obj.origin_x + obj.mins_x) - SBAR_240);
	end_y = ((obj.origin_y + obj.mins_y) - SBAR_240);
	end_z = ((obj.origin_z + obj.mins_z) - SBAR_240);
	traceline (src, end, SBAR_GRENS, obj);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (0);
	}
	pos = pointcontents (end);
	if (((pos == -2) || (pos == -6)))
	{
		return (0);
	}
	src_x = ((obj.origin_x + obj.mins_x) - SBAR_240);
	src_y = ((obj.origin_y + obj.maxs_y) + SBAR_240);
	src_z = ((obj.origin_z + obj.maxs_z) + SBAR_240);
	pos = pointcontents (src);
	if (((pos == -2) || (pos == -6)))
	{
		return (0);
	}
	end_x = ((obj.origin_x + obj.maxs_x) + SBAR_240);
	end_y = ((obj.origin_y + obj.mins_y) - SBAR_240);
	end_z = ((obj.origin_z + obj.mins_z) - SBAR_240);
	traceline (src, end, SBAR_GRENS, obj);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (0);
	}
	pos = pointcontents (end);
	if (((pos == -2) || (pos == -6)))
	{
		return (0);
	}
	traceline (builder.origin, obj.origin, SBAR_GRENS, builder);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (0);
	}
	te = findradius (obj.origin, 64);
	if ((te != world))
	{
		return (0);
	}
	return (SBAR_GRENS);
};

void (float objtobuild) TeamFortress_Build =
{
	local float btime;
	local entity te;
	local vector tmp1;
	local vector tmp2;
	local string st;
	local float maxsgs;
	local float nosgs;

	newmis = spawn ();
	makevectors (self.v_angle);
	v_forward_z = 0;
	v_forward = (normalize (v_forward) * 64);
	newmis.origin = (self.origin + v_forward);
	if ((CheckArea (newmis, self) == 0))
	{
		sprint (self, SBAR_PRINT, "Not enough room to build here\n");
		dremove (newmis);
		return;
	}
	if ((objtobuild == SBAR_GRENS))
	{
		if (self.has_dispenser)
		{
			sprint (self, SBAR_PRINT, "You can only have one dispenser.\nTry dismantling your old one.\n");
			return;
		}
		tmp1 = '-16 -16 0';
		tmp2 = '16 16 48';
		newmis.mdl = "progs/disp.mdl";
		newmis.netname = "dispenser";
		btime = (time + SBAR_PRINT);
	}
	else
	{
		if ((objtobuild == SBAR_PRINT))
		{
			if (self.has_sentry)
			{
				sprint (self, SBAR_PRINT, "You can only have one sentry gun.\nTry dismantling your old one.\n");
				return;
			}
			st = infokey (world, "max_teamsgs");
			maxsgs = stof (st);
			if ((maxsgs == -1))
			{
				sprint (self, SBAR_PRINT, "You cannot have sentry guns on your team.\nDisabled by Administrator.\n");
				return;
			}
			if ((maxsgs > 0))
			{
				te = find (world, classname, "building_sentry");
				while ((te != world))
				{
					if ((te.team_no == self.team_no))
					{
						nosgs = (nosgs + SBAR_GRENS);
					}
					te = find (te, classname, "building_sentry");
				}
				if ((nosgs >= maxsgs))
				{
					sprint3 (self, SBAR_PRINT, "You can only have ", st, " sentry guns on your team.\n");
					return;
				}
			}
			tmp1 = '-16 -16 0';
			tmp2 = '16 16 48';
			newmis.mdl = "progs/turrbase.mdl";
			newmis.netname = "sentrygun";
			btime = (time + 5);
		}
	}
	if (!(self.flags & 512))
	{
		CenterPrint (self, "You can't build in the air!\n\n");
		return;
	}
	self.is_building = SBAR_GRENS;
	self.immune_to_check = (time + 5);
	self.tfstate = (self.tfstate | 65536);
	self.weapon = self.current_weapon;
	self.current_weapon = 0;
	self.weaponmodel = "";
	self.weaponframe = 0;
	TeamFortress_SetSpeed (self);
	newmis.owner = self;
	newmis.classname = "timer";
	newmis.netname = "build_timer";
	newmis.nextthink = btime;
	newmis.think = TeamFortress_FinishedBuilding;
	newmis.colormap = self.colormap;
	newmis.weapon = objtobuild;
	newmis.angles_y = anglemod ((self.angles_y + 180));
	newmis.velocity = '0 0 8';
	newmis.movetype = 6;
	newmis.solid = SBAR_PRINT;
	setmodel (newmis, newmis.mdl);
	setsize (newmis, tmp1, tmp2);
	setorigin (newmis, newmis.origin);
	newmis.flags = (newmis.flags - (newmis.flags & 512));
};

void (entity bld) CheckBelowBuilding =
{
	local vector below;

	below = bld.origin;
	if ((bld.classname == "detpack"))
	{
		below_z = (below_z - 8);
	}
	else
	{
		below_z = (below_z - 24);
	}
	traceline (bld.origin, below, SBAR_GRENS, bld);
	if ((trace_fraction == SBAR_GRENS))
	{
		bld.movetype = 6;
		bld.flags = (bld.flags - (bld.flags & 512));
	}
};

void () DispenserThink =
{
	CheckBelowBuilding (self);
	if ((self.hook_out > AS_MELEE))
	{
		self.ammo_shells = (self.ammo_shells + rint ((400 / 20)));
		self.ammo_cells = (self.ammo_cells + rint ((400 / 20)));
		self.ammo_nails = (self.ammo_nails + rint ((600 / 20)));
		self.ammo_rockets = (self.ammo_rockets + rint ((300 / 20)));
		self.armorvalue = (self.armorvalue + rint ((500 / 20)));
		if ((self.ammo_shells > 400))
		{
			self.ammo_shells = 400;
		}
		if ((self.ammo_nails > 600))
		{
			self.ammo_nails = 600;
		}
		if ((self.ammo_rockets > 300))
		{
			self.ammo_rockets = 300;
		}
		if ((self.ammo_cells > 400))
		{
			self.ammo_cells = 400;
		}
		if ((self.armorvalue > 500))
		{
			self.armorvalue = 500;
		}
		self.hook_out = 0;
	}
	self.hook_out = (self.hook_out + SBAR_GRENS);
	self.nextthink = (time + AS_MELEE);
};

void () TeamFortress_FinishedBuilding =
{
	local entity oldself;
	local entity te;
	local vector source;

	if ((self.owner.is_building != SBAR_GRENS))
	{
		return;
	}
	oldself = self;
	self = self.owner;
	oldself.owner = world;
	oldself.real_owner = self;
	self.is_building = 0;
	self.tfstate = (self.tfstate - (self.tfstate & 65536));
	self.current_weapon = self.weapon;
	self.StatusRefreshTime = (time + 0.1);
	TeamFortress_SetSpeed (self);
	if ((oldself.weapon == SBAR_GRENS))
	{
		self.has_dispenser = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "You finish building the dispenser.\n");
		teamsprint (self.team_no, self, self.netname);
		teamsprint (self.team_no, self, " has built a Dispenser.\n");
		if (!practice)
		{
			self.ammo_cells = (self.ammo_cells - _d);
		}
		oldself.classname = "building_dispenser";
		oldself.netname = "dispenser";
		oldself.blocked = T_Dispenser;
		oldself.touch = T_Dispenser;
		oldself.max_health = 150;
		oldself.health = 150;
		oldself.hook_out = SBAR_GRENS;
		oldself.think = DispenserThink;
		oldself.nextthink = (time + AS_MELEE);
		oldself.th_die = Dispenser_Die;
		oldself.mdl = "progs/disp.mdl";
		oldself.team_no = self.team_no;
		oldself.real_owner = self;
		oldself.colormap = self.colormap;
		oldself.takedamage = SBAR_PRINT;
		oldself.owner = world;
		oldself.movetype = 6;
		oldself.velocity = '0 0 8';
		oldself.flags = (oldself.flags - (oldself.flags & 512));
		oldself.ammo_shells = ceil ((self.ammo_shells * 0.25));
		oldself.ammo_nails = ceil ((self.ammo_nails * 0.25));
		oldself.ammo_rockets = ceil ((self.ammo_rockets * 0.25));
		oldself.ammo_cells = ceil ((self.ammo_cells * 0.25));
		oldself.armorvalue = ceil ((self.armorvalue * 0.25));
		self.ammo_shells = ceil ((self.ammo_shells * 0.75));
		self.ammo_nails = ceil ((self.ammo_nails * 0.75));
		self.ammo_rockets = ceil ((self.ammo_rockets * 0.75));
		self.ammo_cells = ceil ((self.ammo_cells * 0.75));
		self.armorvalue = ceil ((self.armorvalue * 0.75));
		oldself.solid = SBAR_PRINT;
		setmodel (oldself, oldself.mdl);
		setsize (oldself, '-8 -8 0', '8 8 24');
		setorigin (oldself, (oldself.origin + '0 0 8'));
	}
	else
	{
		if ((oldself.weapon == SBAR_PRINT))
		{
			self.has_sentry = SBAR_GRENS;
			sprint (self, SBAR_PRINT, "You finish building the sentry gun.\n");
			teamsprint (self.team_no, self, self.netname);
			teamsprint (self.team_no, self, " has built a Sentry Gun.\n");
			oldself.classname = "building_sentrygun_base";
			oldself.netname = "sentry gun";
			oldself.takedamage = 0;
			oldself.th_die = Sentry_Die;
			oldself.team_no = self.team_no;
			if (!practice)
			{
				self.ammo_cells = (self.ammo_cells - 130);
			}
			setsize (oldself, '-16 -16 0', '16 16 4');
			newmis = spawn ();
			newmis.classname = "building_sentrygun";
			newmis.health = 150;
			newmis.max_health = newmis.health;
			newmis.weapon = SBAR_GRENS;
			newmis.th_die = Sentry_Die;
			newmis.th_pain = Sentry_Pain;
			newmis.mdl = "progs/turrgun.mdl";
			sound (oldself, AS_MELEE, "weapons/turrset.wav", SBAR_GRENS, SBAR_GRENS);
			newmis.solid = SBAR_PRINT;
			setmodel (newmis, newmis.mdl);
			setsize (newmis, '-16 -16 0', '16 16 48');
			setorigin (newmis, (oldself.origin + '0 0 8'));
			newmis.view_ofs = '0 0 22';
			newmis.real_owner = oldself.real_owner;
			newmis.trigger_field = oldself;
			oldself.oldenemy = newmis;
			newmis.movetype = AS_MISSILE;
			oldself.colormap = self.colormap;
			newmis.colormap = self.colormap;
			newmis.takedamage = SBAR_PRINT;
			newmis.velocity = '0 0 -8';
			newmis.flags = (newmis.flags - (newmis.flags & 512));
			oldself.flags = (oldself.flags - (oldself.flags & 512));
			newmis.team_no = self.team_no;
			if (sgtype)
			{
				newmis.think = lvl1_sentry_stand;
				newmis.yaw_speed = (15 - (sentry_speed * SBAR_400));
			}
			else
			{
				newmis.think = lvl1_oldsentry_stand;
				newmis.yaw_speed = enter;
			}
			newmis.nextthink = (time + 0.5);
			newmis.heat = 0;
			newmis.angles_x = 0;
			newmis.angles_y = rint (oldself.angles_y);
			newmis.angles_z = 0;
			newmis.waitmin = rint ((newmis.angles_y - _2));
			newmis.waitmin = anglemod (newmis.waitmin);
			newmis.waitmax = rint ((newmis.angles_y + _2));
			newmis.waitmax = anglemod (newmis.waitmax);
			if ((newmis.waitmin > newmis.waitmax))
			{
				newmis.waitmin = newmis.waitmax;
				newmis.waitmax = anglemod ((newmis.angles_y - _2));
			}
			newmis.ammo_shells = 25;
			newmis.maxammo_shells = _d;
			newmis.maxammo_rockets = 20;
		}
	}
	W_SetCurrentAmmo ();
	self = oldself;
};

void () T_Dispenser =
{
	local entity dist_checker;

	if ((other.classname != "player"))
	{
		return;
	}
	if (!other.team_no)
	{
		return;
	}
	if (((other.team_no != 0) && (other.team_no != self.team_no)))
	{
		centerprint (self.real_owner, "Enemies are using your dispenser!\n");
	}
	if (((other.building == world) && (other.building_wait < time)))
	{
		other.current_menu = 19;
		other.menu_count = 25;
		other.building = self;
		dist_checker = spawn ();
		dist_checker.classname = "timer";
		dist_checker.owner = other;
		dist_checker.enemy = self;
		dist_checker.think = CheckDistance;
		dist_checker.nextthink = (time + 0.3);
	}
};

void () Dispenser_Explode =
{
	local float sdmg;

	if ((self.real_owner.has_disconnected != SBAR_GRENS))
	{
		deathmsg = 39;
		sdmg = ((25 + (self.ammo_rockets * 1.5)) + self.ammo_cells);
		if ((sdmg > 250))
		{
			sdmg = 250;
		}
		T_RadiusDamage (self, self.real_owner, sdmg, self);
	}
	ThrowGib ("progs/dgib1.mdl", -30);
	ThrowGib ("progs/dgib2.mdl", -50);
	ThrowGib ("progs/dgib3.mdl", -50);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () Dispenser_Die =
{
	self.real_owner.has_dispenser = 0;
	self.think = Dispenser_Explode;
	self.nextthink = (time + 0.1);
};

void (entity disp) Engineer_UseDispenser =
{
	local entity dist_checker;
	local string st;

	sprint (self, SBAR_PRINT, "Dispenser has ");
	st = ftos (disp.health);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " health\n");
	st = ftos (disp.ammo_shells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " shells, ");
	st = ftos (disp.ammo_nails);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " nails,");
	st = ftos (disp.ammo_rockets);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " rockets\n");
	st = ftos (disp.ammo_cells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " cells, && ");
	st = ftos (disp.armorvalue);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " armor\n");
	self.current_menu = SBAR_240;
	self.menu_count = 25;
	self.building = disp;
	dist_checker = spawn ();
	dist_checker.classname = "timer";
	dist_checker.owner = self;
	dist_checker.enemy = disp;
	dist_checker.think = CheckDistance;
	dist_checker.nextthink = (time + 0.3);
};

void (entity gun) Engineer_UseSentryGun =
{
	local entity dist_checker;
	local string st;

	sprint (self, SBAR_PRINT, "Level ");
	st = ftos (gun.weapon);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " Sentry Gun has ");
	st = ftos (gun.health);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " health, ");
	st = ftos (gun.ammo_shells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " shells");
	if ((gun.weapon == AS_MELEE))
	{
		st = ftos (gun.ammo_rockets);
		sprint (self, SBAR_PRINT, ", ");
		sprint (self, SBAR_PRINT, st);
		sprint (self, SBAR_PRINT, " rockets");
	}
	sprint (self, SBAR_PRINT, "\n");
	self.current_menu = 17;
	self.menu_count = 25;
	self.building = gun;
	dist_checker = spawn ();
	dist_checker.classname = "timer";
	dist_checker.owner = self;
	dist_checker.enemy = gun;
	dist_checker.think = CheckDistance;
	dist_checker.nextthink = (time + 0.3);
};

void (entity gunhead) CheckSentry =
{
	local vector dist;
	local entity gunbase;

	gunbase = gunhead.trigger_field;
	dist = (gunbase.origin - gunhead.origin);
	if ((vlen (dist) > 15))
	{
		bprint (SBAR_GRENS, self.real_owner.netname);
		bprint (SBAR_GRENS, "'s sentry gun malfunctioned\n");
		Sentry_Die ();
	}
};

void () CheckDistance =
{
	local vector dist;

	if ((self.owner.building != self.enemy))
	{
		dremove (self);
		return;
	}
	dist = (self.enemy.origin - self.owner.origin);
	if ((vlen (dist) > 64))
	{
		CenterPrint (self.owner, "\n");
		self.owner.menu_count = 25;
		self.owner.current_menu = SBAR_GRENS;
		self.owner.building = world;
		dremove (self);
		return;
	}
	self.nextthink = (time + 0.3);
};

void (entity eng, string bld) DestroyBuilding =
{
	local entity te;
	local entity oldself;
	local float pos;

	te = find (world, classname, bld);
	while (te)
	{
		if ((te.real_owner == eng))
		{
			pos = pointcontents (te.origin);
			if (((pos == -2) || (pos == -6)))
			{
				oldself = self;
				self = eng;
				self.ammo_cells = (self.ammo_cells + _d);
				bound_other_ammo (self);
				W_SetCurrentAmmo ();
				self = oldself;
			}
			if ((te.real_owner.building == te))
			{
				if ((te.real_owner.StatusBarSize == 0))
				{
					CenterPrint (te.real_owner, "\n");
				}
				else
				{
					te.real_owner.StatusRefreshTime = (time + 0.1);
				}
				te.real_owner.menu_count = 25;
				te.real_owner.current_menu = SBAR_GRENS;
				te.real_owner.building = world;
			}
			TF_T_Damage (te, world, world, 500, 0, 0);
		}
		te = find (te, classname, bld);
	}
};

void (entity eng) Engineer_RemoveBuildings =
{
	DestroyBuilding (eng, "building_dispenser");
	DestroyBuilding (eng, "building_sentrygun");
};
