//=-=-=-=-=
float (entity Retriever, float AmmoType) TeamFortress_GetMaxAmmo;
float (entity Retriever, float WeaponType) TeamFortress_CanGetWeapon;
void (entity Retriever, entity Items) TeamFortress_AddBackpackItems;
void (entity p) TeamFortress_SetSpeed;
void () tfgoal_touch;

void () SUB_regen =
{
	self.model = self.mdl;
	self.solid = SBAR_GRENS;
	sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
	setorigin (self, self.origin);
};

void () noclass =
{
	dprint ("noclass spawned at");
	dprint (vtos (self.origin));
	dprint ("\n");
	remove (self);
};

void () q_touch =
{
	local entity stemp;
	local float best;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	self.mdl = self.model;
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | 4194304);
	self.model = string_null;
	other.super_time = SBAR_GRENS;
	other.super_damage_finished = self.cnt;
	s = ftos (rint ((other.super_damage_finished - time)));
	bprint (RANGE_MELEE, other.netname);
	bprint (RANGE_MELEE, " recovered a Quad with ");
	bprint (RANGE_MELEE, s);
	bprint (RANGE_MELEE, " seconds remaining!\n");
	activator = other;
	SUB_UseTargets ();
};

void (float timeleft) DropQuad =
{
	local entity item;

	item = spawn ();
	item.origin = (self.origin - '0 0 24');
	item.velocity_z = 300;
	item.velocity_x = (-100 + (random () * 200));
	item.velocity_y = (-100 + (random () * 200));
	item.flags = 256;
	item.solid = SBAR_GRENS;
	item.movetype = 6;
	item.noise = "items/damage.wav";
	setmodel (item, "progs/quaddama.mdl");
	setsize (item, '-16 -16 -24', '16 16 32');
	item.cnt = (time + timeleft);
	item.touch = q_touch;
	item.nextthink = (time + timeleft);
	item.think = SUB_Remove;
};

void () r_touch =
{
	local entity stemp;
	local float best;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	self.mdl = self.model;
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | WEAP_RAILGUN);
	self.model = string_null;
	other.invisible_time = SBAR_GRENS;
	other.invisible_finished = self.cnt;
	s = ftos (rint ((other.invisible_finished - time)));
	bprint (RANGE_MELEE, other.netname);
	bprint (RANGE_MELEE, " recovered a Ring with ");
	bprint (RANGE_MELEE, s);
	bprint (RANGE_MELEE, " seconds remaining!\n");
	activator = other;
	SUB_UseTargets ();
};

void (float timeleft) DropRing =
{
	local entity item;

	item = spawn ();
	item.origin = (self.origin - '0 0 24');
	item.velocity_z = 300;
	item.velocity_x = (-100 + (random () * 200));
	item.velocity_y = (-100 + (random () * 200));
	item.flags = 256;
	item.solid = SBAR_GRENS;
	item.movetype = 6;
	item.noise = "items/inv1.wav";
	setmodel (item, "progs/invisibl.mdl");
	setsize (item, '-16 -16 -24', '16 16 32');
	item.cnt = (time + timeleft);
	item.touch = r_touch;
	item.nextthink = (time + timeleft);
	item.think = SUB_Remove;
};

void () PlaceItem =
{
	local float oldz;

	self.mdl = self.model;
	self.flags = 256;
	self.movetype = 6;
	self.solid = SBAR_GRENS;
	self.velocity = '0 0 0';
	self.origin_z = (self.origin_z + 6);
	oldz = self.origin_z;
	if (!droptofloor ())
	{
		dprint ("Bonus item fell out of level at ");
		dprint (vtos (self.origin));
		dprint (" ");
		dprint (self.classname);
		dprint ("\n");
		dremove (self);
		return;
	}
};

void () StartItem =
{
	self.nextthink = (time + 0.2);
	self.think = PlaceItem;
};

float (entity e, float healamount, float ignore) T_Heal =
{
	if (practice)
	{
		e.health = 1000;
		return (RANGE_MELEE);
	}
	if ((e.health <= RANGE_MELEE))
	{
		return (RANGE_MELEE);
	}
	if ((!ignore && (e.health >= e.max_health)))
	{
		if (e.leg_damage)
		{
			e.leg_damage = (e.leg_damage - ceil ((e.health / 20)));
			if ((e.leg_damage < SBAR_GRENS))
			{
				e.leg_damage = RANGE_MELEE;
			}
			TeamFortress_SetSpeed (e);
			return (SBAR_GRENS);
		}
		else
		{
			return (RANGE_MELEE);
		}
	}
	healamount = ceil (healamount);
	e.health = (e.health + healamount);
	if ((!ignore && (e.health >= e.max_health)))
	{
		e.health = e.max_health;
	}
	if ((e.health > 250))
	{
		e.health = 250;
	}
	if (e.leg_damage)
	{
		if ((e.health > __))
		{
			e.leg_damage = RANGE_MELEE;
		}
		else
		{
			e.leg_damage = (e.leg_damage - ceil ((e.health / 20)));
		}
		if ((e.leg_damage < SBAR_GRENS))
		{
			e.leg_damage = RANGE_MELEE;
		}
		TeamFortress_SetSpeed (e);
	}
	return (SBAR_GRENS);
};
.float healamount;
.float healtype;
void () health_touch;
void () item_megahealth_rot;

void () item_health =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = health_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_bh10.bsp");
		precache_sound ("items/r_item1.wav");
		setmodel (self, "maps/b_bh10.bsp");
		self.noise = "items/r_item1.wav";
		self.healamount = 15;
		self.healtype = RANGE_MELEE;
	}
	else
	{
		if ((self.spawnflags & SBAR_PRINT))
		{
			precache_model ("maps/b_bh100.bsp");
			precache_sound ("items/r_item2.wav");
			setmodel (self, "maps/b_bh100.bsp");
			self.noise = "items/r_item2.wav";
			self.healamount = _d;
			self.healtype = SBAR_PRINT;
		}
		else
		{
			precache_model ("maps/b_bh25.bsp");
			precache_sound ("items/health1.wav");
			setmodel (self, "maps/b_bh25.bsp");
			self.noise = "items/health1.wav";
			self.healamount = 25;
			self.healtype = SBAR_GRENS;
		}
	}
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_healthkit =
{
	item_health ();
};

void () health_touch =
{
	local float amount;
	local float medi;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	medi = RANGE_MELEE;
	if ((self.healtype == SBAR_PRINT))
	{
		if (!(other.tfstate & SBAR_240))
		{
			if ((other.health >= 250))
			{
				return;
			}
			if (!T_Heal (other, self.healamount, SBAR_GRENS))
			{
				return;
			}
		}
	}
	else
	{
		if (!T_Heal (other, self.healamount, RANGE_MELEE))
		{
			if ((other.weapons_carried & AS_MISSILE))
			{
				if ((other.ammo_medikit < other.maxammo_medikit))
				{
					other.ammo_medikit = (other.ammo_medikit + self.healamount);
					if ((other.ammo_medikit > other.maxammo_medikit))
					{
						other.ammo_medikit = other.maxammo_medikit;
					}
					s = ftos (self.healamount);
					sprint (other, RANGE_MELEE, "You gather ");
					sprint (other, RANGE_MELEE, s);
					sprint (other, RANGE_MELEE, " medikit ammo\n");
					sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
					stuffcmd (other, "bf\n");
					self.model = string_null;
					self.solid = RANGE_MELEE;
					if ((deathmatch != SBAR_PRINT))
					{
						if (deathmatch)
						{
							self.nextthink = (time + 20);
						}
						self.think = SUB_regen;
					}
					activator = other;
					W_SetCurrentAmmo ();
					SUB_UseTargets ();
				}
			}
			return;
		}
	}
	if (((other.tfstate & SBAR_240) && (self.healamount > _P)))
	{
		sprint (other, SBAR_GRENS, "You have been healed of your infection!");
		other.tfstate = (other.tfstate - (other.tfstate & SBAR_240));
	}
	else
	{
		s = ftos (self.healamount);
		sprint (other, RANGE_MELEE, "You receive ");
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " health\n");
	}
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.model = string_null;
	self.solid = RANGE_MELEE;
	if ((self.healtype == SBAR_PRINT))
	{
		other.items = (other.items | 65536);
		self.nextthink = (time + 5);
		self.think = item_megahealth_rot;
		self.owner = other;
	}
	else
	{
		if ((deathmatch != SBAR_PRINT))
		{
			if (deathmatch)
			{
				self.nextthink = (time + 20);
			}
			self.think = SUB_regen;
		}
	}
	activator = other;
	SUB_UseTargets ();
};

void () item_megahealth_rot =
{
	other = self.owner;
	if ((other.health > other.max_health))
	{
		other.health = (other.health - SBAR_GRENS);
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	other.items = (other.items - (other.items & 65536));
	if ((self.classname == "medikit_rot"))
	{
		dremove (self);
		return;
	}
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 20);
		self.think = SUB_regen;
	}
};

void () armor_touch =
{
	local float type;
	local float value;
	local float bit;
	local string s;
	local entity oldself;

	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((self.classname == "item_armor1"))
	{
		type = 0.3;
		value = _d;
		bit = 8192;
	}
	else
	{
		if ((self.classname == "item_armor2"))
		{
			type = 0.6;
			value = 150;
			bit = 16384;
		}
		else
		{
			type = 0.8;
			value = 300;
			bit = 32768;
		}
	}
	if (((other.armortype * other.armorvalue) >= (type * value)))
	{
		if ((other.playerclass == 9))
		{
			if ((other.ammo_cells >= other.maxammo_cells))
			{
				return;
			}
		}
		else
		{
			return;
		}
	}
	if (((other.armor_allowed * other.maxarmor) <= (type * value)))
	{
		if ((other.armor_allowed == other.armortype))
		{
			if ((other.maxarmor == other.armorvalue))
			{
				if ((other.playerclass == 9))
				{
					if ((other.ammo_cells >= other.maxammo_cells))
					{
						return;
					}
				}
				else
				{
					return;
				}
			}
		}
	}
	if ((type > other.armor_allowed))
	{
		type = other.armor_allowed;
		if ((type == 0.3))
		{
			bit = 8192;
		}
		else
		{
			if ((type == 0.6))
			{
				bit = 16384;
			}
			else
			{
				if ((type == 0.8))
				{
					bit = 32768;
				}
			}
		}
	}
	sprint (other, RANGE_MELEE, "You got armor\n");
	if ((value > other.maxarmor))
	{
		if (((other.playerclass == 9) && (other.ammo_cells < other.maxammo_cells)))
		{
			s = ftos ((value - other.maxarmor));
			sprint (other, RANGE_MELEE, s);
			sprint (other, RANGE_MELEE, " metal\n");
			other.ammo_cells = (other.ammo_cells + (value - other.maxarmor));
			if ((other.ammo_cells > other.maxammo_cells))
			{
				other.ammo_cells = other.maxammo_cells;
			}
			oldself = self;
			self = other;
			W_SetCurrentAmmo ();
			self = oldself;
		}
		value = other.maxarmor;
	}
	if (((other.armortype * other.armorvalue) < (type * value)))
	{
		other.armortype = type;
		other.armorvalue = value;
		other.items = ((other.items - (other.items & ((8192 | 16384) | 32768))) + bit);
	}
	if ((self.armorclass > RANGE_MELEE))
	{
		other.armorclass = self.armorclass;
	}
	self.solid = RANGE_MELEE;
	self.model = string_null;
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 20);
	}
	if (coop)
	{
		self.nextthink = (time + 40);
	}
	self.think = SUB_regen;
	sound (other, AS_MELEE, "items/armor1.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	activator = other;
	SUB_UseTargets ();
};

void () item_armor1 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = RANGE_MELEE;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armor2 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = SBAR_GRENS;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armorInv =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = SBAR_PRINT;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armor3 =
{
	item_armorInv ();
};

void (entity p) bound_other_ammo =
{
	if ((p.ammo_shells > TeamFortress_GetMaxAmmo (p, 256)))
	{
		p.ammo_shells = TeamFortress_GetMaxAmmo (p, 256);
	}
	if ((p.ammo_nails > TeamFortress_GetMaxAmmo (p, 512)))
	{
		p.ammo_nails = TeamFortress_GetMaxAmmo (p, 512);
	}
	if ((p.ammo_rockets > TeamFortress_GetMaxAmmo (p, 1024)))
	{
		p.ammo_rockets = TeamFortress_GetMaxAmmo (p, 1024);
	}
	if ((p.ammo_cells > TeamFortress_GetMaxAmmo (p, 2048)))
	{
		p.ammo_cells = TeamFortress_GetMaxAmmo (p, 2048);
	}
	if ((p.ammo_medikit > p.maxammo_medikit))
	{
		p.ammo_medikit = p.maxammo_medikit;
	}
	if ((p.armorvalue > p.maxarmor))
	{
		p.armorvalue = p.maxarmor;
	}
	if ((p.no_grenades_1 > AS_MISSILE))
	{
		p.no_grenades_1 = AS_MISSILE;
	}
	if ((p.no_grenades_2 > AS_MISSILE))
	{
		p.no_grenades_2 = AS_MISSILE;
	}
	if (((p.tp_grenades_1 == AS_MELEE) && (p.no_grenades_1 > SBAR_PRINT)))
	{
		p.no_grenades_1 = SBAR_PRINT;
	}
	if (((p.tp_grenades_2 == AS_MELEE) && (p.no_grenades_2 > SBAR_PRINT)))
	{
		p.no_grenades_2 = SBAR_PRINT;
	}
	if (((p.tp_grenades_1 == SBAR_PRINT) && (p.no_grenades_1 > AS_MELEE)))
	{
		p.no_grenades_1 = AS_MELEE;
	}
	if (((p.tp_grenades_2 == SBAR_PRINT) && (p.no_grenades_2 > AS_MELEE)))
	{
		p.no_grenades_2 = AS_MELEE;
	}
	if (((p.tp_grenades_1 == enter) && (p.no_grenades_1 > AS_MELEE)))
	{
		p.no_grenades_1 = AS_MELEE;
	}
	if (((p.tp_grenades_2 == enter) && (p.no_grenades_2 > AS_MELEE)))
	{
		p.no_grenades_2 = AS_MELEE;
	}
};

float (float w) RankForWeapon =
{
	if ((w == 65536))
	{
		return (SBAR_GRENS);
	}
	if ((w == 8192))
	{
		return (SBAR_PRINT);
	}
	if ((w == 1024))
	{
		return (AS_MELEE);
	}
	if ((w == 2048))
	{
		return (AS_MISSILE);
	}
	if ((w == 256))
	{
		return (5);
	}
	if ((w == 512))
	{
		return (6);
	}
	return (7);
};

void (float old, float new) Deathmatch_Weapon =
{
};
void () ammo_touch;

void (entity ritem, entity act) Respawn_Item =
{
	local entity oldself;

	oldself = self;
	self = ritem;
	self.model = string_null;
	self.solid = RANGE_MELEE;
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 30);
	}
	else
	{
		if ((coop && (ritem.touch == ammo_touch)))
		{
			self.nextthink = (time + minus);
		}
	}
	self.think = SUB_regen;
	activator = act;
	SUB_UseTargets ();
	self = oldself;
};
float () W_BestWeapon;

void () weapon_touch =
{
	local float hadammo;
	local float best;
	local float new;
	local float old;
	local entity stemp;
	local float leave;

	if (!(other.flags & 8))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	stemp = self;
	self = other;
	best = W_BestWeapon ();
	self = stemp;
	if (((deathmatch == SBAR_PRINT) || coop))
	{
		leave = SBAR_GRENS;
	}
	else
	{
		leave = RANGE_MELEE;
	}
	if ((self.classname == "weapon_nailgun"))
	{
		if ((leave && (other.weapons_carried & 512)))
		{
			return;
		}
		if (!TeamFortress_CanGetWeapon (other, 512))
		{
			return;
		}
		hadammo = other.ammo_nails;
		new = 512;
		other.ammo_nails = (other.ammo_nails + 30);
	}
	else
	{
		if ((self.classname == "weapon_supernailgun"))
		{
			if ((leave && (other.weapons_carried & 1024)))
			{
				return;
			}
			if (!TeamFortress_CanGetWeapon (other, 1024))
			{
				return;
			}
			hadammo = other.ammo_rockets;
			new = 1024;
			other.ammo_nails = (other.ammo_nails + 30);
		}
		else
		{
			if ((self.classname == "weapon_supershotgun"))
			{
				if ((leave && (other.weapons_carried & 256)))
				{
					return;
				}
				if (!TeamFortress_CanGetWeapon (other, 256))
				{
					return;
				}
				hadammo = other.ammo_rockets;
				new = 256;
				other.ammo_shells = (other.ammo_shells + 5);
			}
			else
			{
				if ((self.classname == "weapon_rocketlauncher"))
				{
					if ((leave && (other.weapons_carried & 8192)))
					{
						return;
					}
					if (!TeamFortress_CanGetWeapon (other, 8192))
					{
						return;
					}
					hadammo = other.ammo_rockets;
					new = 8192;
					other.ammo_rockets = (other.ammo_rockets + 5);
				}
				else
				{
					if ((self.classname == "weapon_grenadelauncher"))
					{
						if ((leave && (other.weapons_carried & 2048)))
						{
							return;
						}
						if (!TeamFortress_CanGetWeapon (other, 2048))
						{
							return;
						}
						hadammo = other.ammo_rockets;
						new = 2048;
						other.ammo_rockets = (other.ammo_rockets + 5);
					}
					else
					{
						if ((self.classname == "weapon_lightning"))
						{
							if ((leave && (other.weapons_carried & 65536)))
							{
								return;
							}
							if (!TeamFortress_CanGetWeapon (other, 65536))
							{
								return;
							}
							hadammo = other.ammo_rockets;
							new = 65536;
							other.ammo_cells = (other.ammo_cells + 15);
						}
						else
						{
							objerror ("weapon_touch: unknown classname");
						}
					}
				}
			}
		}
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, "weapons/pkup.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	bound_other_ammo (other);
	old = other.weapons_carried;
	other.weapons_carried = (other.weapons_carried | new);
	stemp = self;
	self = other;
	Deathmatch_Weapon (old, new);
	W_SetCurrentAmmo ();
	self = stemp;
	if (leave)
	{
		return;
	}
	Respawn_Item (self, other);
};

void () weapon_supershotgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_shot.mdl");
	setmodel (self, "progs/g_shot.mdl");
	self.weapon = 256;
	self.netname = "Double-barrelled Shotgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_nailgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_nail.mdl");
	setmodel (self, "progs/g_nail.mdl");
	self.weapon = 512;
	self.netname = "nailgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_supernailgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_nail2.mdl");
	setmodel (self, "progs/g_nail2.mdl");
	self.weapon = 1024;
	self.netname = "Super Nailgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_grenadelauncher =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_rock.mdl");
	setmodel (self, "progs/g_rock.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Grenade Launcher";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_rocketlauncher =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_rock2.mdl");
	setmodel (self, "progs/g_rock2.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Rocket Launcher";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_lightning =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_light.mdl");
	setmodel (self, "progs/g_light.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Thunderbolt";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void (entity pl, float typ) PrintGrenadeType =
{
	local string st;

	if ((typ == SBAR_GRENS))
	{
		st = "Normal";
	}
	else
	{
		if ((typ == SBAR_PRINT))
		{
			st = "Concussion";
		}
		else
		{
			if ((typ == AS_MELEE))
			{
				st = "Nail";
			}
			else
			{
				if ((typ == AS_MISSILE))
				{
					st = "Mirv";
				}
				else
				{
					if ((typ == 5))
					{
						st = "Napalm";
					}
					else
					{
						if ((typ == 6))
						{
							st = "Flare";
						}
						else
						{
							if ((typ == 7))
							{
								st = "Gas";
							}
							else
							{
								if ((typ == 8))
								{
									st = "EMP";
								}
								else
								{
									if ((typ == enter))
									{
										st = "Caltrop";
									}
								}
							}
						}
					}
				}
			}
		}
	}
	sprint (pl, SBAR_PRINT, st);
};

float () GetGrenadePossibility =
{
	local float maxg;

	if ((random () < 0.5))
	{
		return (RANGE_MELEE);
	}
	maxg = AS_MISSILE;
	if ((random () < 0.5))
	{
		if ((other.tp_grenades_1 == AS_MELEE))
		{
			maxg = SBAR_PRINT;
		}
		if ((other.tp_grenades_1 == enter))
		{
			maxg = AS_MELEE;
		}
		if (((other.tp_grenades_1 != RANGE_MELEE) && (other.no_grenades_1 < maxg)))
		{
			other.no_grenades_1 = (other.no_grenades_1 + SBAR_GRENS);
			sprint (other, SBAR_PRINT, "You found a ");
			PrintGrenadeType (other, other.tp_grenades_1);
			if ((other.tp_grenades_1 == enter))
			{
				sprint (other, SBAR_PRINT, " canister\n");
			}
			else
			{
				sprint (other, SBAR_PRINT, " grenade\n");
			}
			return (SBAR_GRENS);
		}
	}
	else
	{
		if ((other.tp_grenades_2 == AS_MELEE))
		{
			maxg = SBAR_PRINT;
		}
		if ((other.tp_grenades_2 == SBAR_PRINT))
		{
			maxg = AS_MELEE;
		}
		if (((other.tp_grenades_2 != RANGE_MELEE) && (other.no_grenades_2 < maxg)))
		{
			other.no_grenades_2 = (other.no_grenades_2 + SBAR_GRENS);
			sprint (other, SBAR_PRINT, "You found a ");
			PrintGrenadeType (other, other.tp_grenades_2);
			sprint (other, SBAR_PRINT, " grenade\n");
			return (SBAR_GRENS);
		}
	}
	return (RANGE_MELEE);
};

void () ammo_touch =
{
	local entity stemp;
	local float best;
	local float gotgren;
	local float gotbox;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	gotgren = RANGE_MELEE;
	gotbox = RANGE_MELEE;
	stemp = self;
	self = other;
	best = W_BestWeapon ();
	self = stemp;
	if ((self.weapon == SBAR_GRENS))
	{
		if ((other.ammo_shells >= TeamFortress_GetMaxAmmo (other, 256)))
		{
			return;
		}
		other.ammo_shells = (other.ammo_shells + self.aflag);
		gotbox = SBAR_GRENS;
	}
	if ((self.weapon == SBAR_PRINT))
	{
		if ((other.ammo_nails >= TeamFortress_GetMaxAmmo (other, 512)))
		{
			return;
		}
		other.ammo_nails = (other.ammo_nails + self.aflag);
		gotbox = SBAR_GRENS;
	}
	else
	{
		if ((self.weapon == AS_MELEE))
		{
			gotgren = GetGrenadePossibility ();
			if ((other.ammo_rockets >= TeamFortress_GetMaxAmmo (other, 1024)))
			{
				gotbox = RANGE_MELEE;
			}
			else
			{
				gotbox = SBAR_GRENS;
				other.ammo_rockets = (other.ammo_rockets + self.aflag);
			}
		}
		else
		{
			if ((self.weapon == AS_MISSILE))
			{
				if ((other.ammo_cells >= TeamFortress_GetMaxAmmo (other, 2048)))
				{
					return;
				}
				other.ammo_cells = (other.ammo_cells + self.aflag);
				gotbox = SBAR_GRENS;
			}
		}
	}
	if ((!gotbox && !gotgren))
	{
		return;
	}
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	if (gotbox)
	{
		bound_other_ammo (other);
		sprint (other, RANGE_MELEE, "You got the ");
		sprint (other, RANGE_MELEE, self.netname);
		sprint (other, RANGE_MELEE, "\n");
		stemp = self;
		self = other;
		W_SetCurrentAmmo ();
		self = stemp;
	}
	Respawn_Item (self, other);
};

void () item_shells =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_shell1.bsp");
		setmodel (self, "maps/b_shell1.bsp");
		self.aflag = 40;
	}
	else
	{
		precache_model ("maps/b_shell0.bsp");
		setmodel (self, "maps/b_shell0.bsp");
		self.aflag = 20;
	}
	self.weapon = SBAR_GRENS;
	self.netname = "shells";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_spikes =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_nail1.bsp");
		setmodel (self, "maps/b_nail1.bsp");
		self.aflag = _2;
	}
	else
	{
		precache_model ("maps/b_nail0.bsp");
		setmodel (self, "maps/b_nail0.bsp");
		self.aflag = 25;
	}
	self.weapon = SBAR_PRINT;
	self.netname = "nails";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_rockets =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_rock1.bsp");
		setmodel (self, "maps/b_rock1.bsp");
		self.aflag = enter;
	}
	else
	{
		precache_model ("maps/b_rock0.bsp");
		setmodel (self, "maps/b_rock0.bsp");
		self.aflag = 5;
	}
	self.weapon = AS_MELEE;
	self.netname = "rockets";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_cells =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_batt1.bsp");
		setmodel (self, "maps/b_batt1.bsp");
		self.aflag = 12;
	}
	else
	{
		precache_model ("maps/b_batt0.bsp");
		setmodel (self, "maps/b_batt0.bsp");
		self.aflag = 6;
	}
	self.weapon = AS_MISSILE;
	self.netname = "cells";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_weapon =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_shell1.bsp");
			setmodel (self, "maps/b_shell1.bsp");
			self.aflag = 40;
		}
		else
		{
			precache_model ("maps/b_shell0.bsp");
			setmodel (self, "maps/b_shell0.bsp");
			self.aflag = 20;
		}
		self.weapon = SBAR_GRENS;
		self.netname = "shells";
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_nail1.bsp");
			setmodel (self, "maps/b_nail1.bsp");
			self.aflag = 40;
		}
		else
		{
			precache_model ("maps/b_nail0.bsp");
			setmodel (self, "maps/b_nail0.bsp");
			self.aflag = 20;
		}
		self.weapon = SBAR_PRINT;
		self.netname = "spikes";
	}
	if ((self.spawnflags & SBAR_PRINT))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_rock1.bsp");
			setmodel (self, "maps/b_rock1.bsp");
			self.aflag = enter;
		}
		else
		{
			precache_model ("maps/b_rock0.bsp");
			setmodel (self, "maps/b_rock0.bsp");
			self.aflag = 5;
		}
		self.weapon = AS_MELEE;
		self.netname = "rockets";
	}
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () key_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if ((other.items & self.items))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	other.items = (other.items | self.items);
	if (!coop)
	{
		self.solid = RANGE_MELEE;
		self.model = string_null;
	}
	else
	{
		if ((coop && self.deadflag))
		{
			dremove (self);
			return;
		}
	}
	activator = other;
	SUB_UseTargets ();
};

void () key_setsounds =
{
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_sound ("misc/medkey.wav");
		self.noise = "misc/medkey.wav";
	}
	if ((world.worldtype == SBAR_GRENS))
	{
		precache_sound ("misc/runekey.wav");
		self.noise = "misc/runekey.wav";
	}
	if ((world.worldtype == SBAR_PRINT))
	{
		precache_sound2 ("misc/basekey.wav");
		self.noise = "misc/basekey.wav";
	}
};

void () item_key1 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_model ("progs/w_s_key.mdl");
		setmodel (self, "progs/w_s_key.mdl");
		self.netname = "silver key";
	}
	else
	{
		if ((world.worldtype == SBAR_GRENS))
		{
			precache_model ("progs/m_s_key.mdl");
			setmodel (self, "progs/m_s_key.mdl");
			self.netname = "silver runekey";
		}
		else
		{
			if ((world.worldtype == SBAR_PRINT))
			{
				precache_model2 ("progs/b_s_key.mdl");
				setmodel (self, "progs/b_s_key.mdl");
				self.netname = "silver keycard";
			}
		}
	}
	key_setsounds ();
	self.touch = key_touch;
	self.items = 131072;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_key2 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_model ("progs/w_g_key.mdl");
		setmodel (self, "progs/w_g_key.mdl");
		self.netname = "gold key";
	}
	if ((world.worldtype == SBAR_GRENS))
	{
		precache_model ("progs/m_g_key.mdl");
		setmodel (self, "progs/m_g_key.mdl");
		self.netname = "gold runekey";
	}
	if ((world.worldtype == SBAR_PRINT))
	{
		precache_model2 ("progs/b_g_key.mdl");
		setmodel (self, "progs/b_g_key.mdl");
		self.netname = "gold keycard";
	}
	key_setsounds ();
	self.touch = key_touch;
	self.items = 262144;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () sigil_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	self.model = string_null;
	serverflags = (serverflags | (self.spawnflags & 15));
	self.classname = "";
	activator = other;
	SUB_UseTargets ();
};

void () item_sigil =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if (!self.spawnflags)
	{
		objerror ("no spawnflags");
	}
	precache_sound ("misc/runekey.wav");
	self.noise = "misc/runekey.wav";
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("progs/end1.mdl");
		setmodel (self, "progs/end1.mdl");
	}
	if ((self.spawnflags & SBAR_PRINT))
	{
		precache_model2 ("progs/end2.mdl");
		setmodel (self, "progs/end2.mdl");
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		precache_model2 ("progs/end3.mdl");
		setmodel (self, "progs/end3.mdl");
	}
	if ((self.spawnflags & 8))
	{
		precache_model2 ("progs/end4.mdl");
		setmodel (self, "progs/end4.mdl");
	}
	self.touch = sigil_touch;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () powerup_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	if (deathmatch)
	{
		self.mdl = self.model;
		if (((self.classname == "item_artifact_invulnerability") || (self.classname == "item_artifact_invisibility")))
		{
			self.nextthink = (time + (SBAR_600 * 5));
		}
		else
		{
			self.nextthink = (time + SBAR_600);
		}
		self.think = SUB_regen;
	}
	else
	{
		if (coop)
		{
			self.mdl = self.model;
			if (((self.classname == "item_artifact_invulnerability") || (self.classname == "item_artifact_invisibility")))
			{
				self.nextthink = (time + (_x * 5));
			}
			else
			{
				self.nextthink = (time + _x);
			}
			self.think = SUB_regen;
		}
	}
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | self.items);
	self.model = string_null;
	if ((self.classname == "item_artifact_envirosuit"))
	{
		other.rad_time = SBAR_GRENS;
		other.radsuit_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_invulnerability"))
	{
		other.invincible_time = SBAR_GRENS;
		other.invincible_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_invisibility"))
	{
		other.invisible_time = SBAR_GRENS;
		other.invisible_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_super_damage"))
	{
		other.super_time = SBAR_GRENS;
		other.super_damage_finished = (time + 30);
	}
	activator = other;
	SUB_UseTargets ();
};

void () item_artifact_invulnerability =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/invulner.mdl");
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	self.noise = "items/protect.wav";
	setmodel (self, "progs/invulner.mdl");
	self.effects = (self.effects | 128);
	self.netname = "Pentagram of Protection";
	self.items = 1048576;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_envirosuit =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/suit.mdl");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	self.noise = "items/suit.wav";
	setmodel (self, "progs/suit.mdl");
	self.netname = "Biosuit";
	self.items = 2097152;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_invisibility =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/invisibl.mdl");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	self.noise = "items/inv1.wav";
	setmodel (self, "progs/invisibl.mdl");
	self.netname = "Ring of Shadows";
	self.items = WEAP_RAILGUN;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_super_damage =
{
	local string st;

	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	st = infokey (world, "noquad");
	if ((st == "on"))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/quaddama.mdl");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	self.noise = "items/damage.wav";
	setmodel (self, "progs/quaddama.mdl");
	self.effects = (self.effects | 64);
	self.netname = "Quad Damage";
	self.items = 4194304;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () BackpackTouch =
{
	local string s;
	local float best;
	local entity stemp;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.button0)
	{
		return;
	}
	other.ammo_shells = (other.ammo_shells + self.ammo_shells);
	other.ammo_nails = (other.ammo_nails + self.ammo_nails);
	other.ammo_rockets = (other.ammo_rockets + self.ammo_rockets);
	other.ammo_cells = (other.ammo_cells + self.ammo_cells);
	other.ammo_detpack = (other.ammo_detpack + self.ammo_detpack);
	other.no_grenades_1 = (other.no_grenades_1 + self.no_grenades_1);
	other.no_grenades_2 = (other.no_grenades_2 + self.no_grenades_2);
	bound_other_ammo (other);
	sprint (other, RANGE_MELEE, "You get ");
	if (self.ammo_shells)
	{
		s = ftos (self.ammo_shells);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " shells  ");
	}
	if (self.ammo_nails)
	{
		s = ftos (self.ammo_nails);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " nails ");
	}
	if (self.ammo_rockets)
	{
		s = ftos (self.ammo_rockets);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " rockets  ");
	}
	if (self.ammo_cells)
	{
		s = ftos (self.ammo_cells);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " cells  ");
	}
	if (((self.armorvalue && (other.playerclass == 9)) && (other.ammo_cells < other.maxammo_cells)))
	{
		s = ftos (self.armorvalue);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " metal  ");
		other.ammo_cells = (other.ammo_cells + self.armorvalue);
		if ((other.ammo_cells > other.maxammo_cells))
		{
			other.ammo_cells = other.maxammo_cells;
		}
	}
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	dremove (self);
	self = other;
	W_SetCurrentAmmo ();
};

void () DropBackpack =
{
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (!(((self.ammo_shells + self.ammo_nails) + self.ammo_rockets) + self.ammo_cells))
	{
		return;
	}
	newmis = spawn ();
	newmis.origin = (self.origin - '0 0 24');
	newmis.ammo_shells = self.ammo_shells;
	newmis.ammo_nails = self.ammo_nails;
	newmis.ammo_rockets = self.ammo_rockets;
	newmis.ammo_cells = self.ammo_cells;
	if (allow_grenpack)
	{
		newmis.ammo_detpack = self.ammo_detpack;
		newmis.no_grenades_1 = self.no_grenades_1;
		newmis.no_grenades_2 = self.no_grenades_2;
	}
	newmis.armorvalue = self.armorvalue;
	newmis.velocity_z = 300;
	newmis.velocity_x = (-100 + (random () * 200));
	newmis.velocity_y = (-100 + (random () * 200));
	newmis.flags = 256;
	newmis.solid = SBAR_GRENS;
	newmis.movetype = 6;
	setmodel (newmis, "progs/backpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 56');
	newmis.touch = BackpackTouch;
	newmis.nextthink = (time + _Z);
	newmis.think = SUB_Remove;
};
