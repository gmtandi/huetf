//=-=-=-=-=
void () info_null =
{
	dremove (self);
};

void () info_notnull =
{
};

void () light_use =
{
	if ((self.spawnflags & 1))
	{
		lightstyle (self.style, "m");
		self.spawnflags = (self.spawnflags - 1);
	}
	else
	{
		lightstyle (self.style, "a");
		self.spawnflags = (self.spawnflags + 1);
	}
};

void () light =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & 1))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_spot =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & 1))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_environment =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & 1))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_fluoro =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & 1))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
	precache_sound ("ambience/fl_hum1.wav");
	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, AS_MELEE);
};

void () light_fluorospark =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = enter;
	}
	precache_sound ("ambience/buzz1.wav");
	ambientsound (self.origin, "ambience/buzz1.wav", 0.5, AS_MELEE);
};

void () light_globe =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/s_light.spr");
	setmodel (self, "progs/s_light.spr");
	makestatic (self);
};

void () FireAmbient =
{
	precache_sound ("ambience/fire1.wav");
	ambientsound (self.origin, "ambience/fire1.wav", 0.5, AS_MELEE);
};

void () light_torch_small_walltorch =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = 8;
	}
	precache_model ("progs/flame.mdl");
	setmodel (self, "progs/flame.mdl");
	FireAmbient ();
	makestatic (self);
};

void () light_flame_large_yellow =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = 7;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	self.frame = 1;
	FireAmbient ();
	makestatic (self);
};

void () light_flame_small_yellow =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = AS_MELEE;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	FireAmbient ();
	makestatic (self);
};

void () light_flame_small_white =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = AS_MELEE;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	FireAmbient ();
	makestatic (self);
};
void () fire_fly;
void () fire_touch;

void () misc_fireball =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/lavaball.mdl");
	self.classname = "fireball";
	self.nextthink = (time + (random () * 5));
	self.think = fire_fly;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void () fire_fly =
{
	newmis = spawn ();
	newmis.solid = 1;
	newmis.movetype = 6;
	newmis.velocity = '0 0 1000';
	newmis.velocity_x = ((random () * _d) - _2);
	newmis.velocity_y = ((random () * _d) - _2);
	newmis.velocity_z = (self.speed + (random () * 200));
	newmis.classname = "fireball";
	setmodel (newmis, "progs/lavaball.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = fire_touch;
	self.nextthink = ((time + (random () * 5)) + AS_MELEE);
	self.think = fire_fly;
};

void () fire_touch =
{
	if (other.takedamage)
	{
		TF_T_Damage (other, self, self, 20, 0, 16);
	}
	dremove (self);
};

void () barrel_explode =
{
	self.takedamage = 0;
	self.classname = "explo_box";
	T_RadiusDamage (self, self, 160, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, (self.origin_z + space));
	multicast (self.origin, 1);
	remove (self);
};

void () misc_explobox =
{
	local float oldz;

	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.solid = 2;
	self.movetype = 0;
	precache_model ("maps/b_explob.bsp");
	setmodel (self, "maps/b_explob.bsp");
	setsize (self, '0 0 0', '32 32 64');
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = 2;
	self.origin_z = (self.origin_z + 2);
	oldz = self.origin_z;
	droptofloor ();
	if (((oldz - self.origin_z) > 250))
	{
		dprint ("item fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
	}
};

void () misc_explobox2 =
{
	local float oldz;

	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.solid = 2;
	self.movetype = 0;
	precache_model2 ("maps/b_exbox2.bsp");
	setmodel (self, "maps/b_exbox2.bsp");
	setsize (self, '0 0 0', '32 32 32');
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = 2;
	self.origin_z = (self.origin_z + 2);
	oldz = self.origin_z;
	droptofloor ();
	if (((oldz - self.origin_z) > 250))
	{
		dprint ("item fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
	}
};
void (vector org, vector vec) LaunchLaser;

void () Laser_Touch =
{
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	sound (self, 1, "enforcer/enfstop.wav", 1, AS_MELEE);
	org = (self.origin - (8 * normalize (self.velocity)));
	if (other.health)
	{
		SpawnBlood (org, 15);
		TF_T_Damage (other, self, self.owner, 15, 0, 8);
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, 2);
		WriteByte (AS_MISSILE, 5);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, 2);
	}
	dremove (self);
};

void (vector org, vector vec) LaunchLaser =
{
	sound (self, 1, "enforcer/enfire.wav", 1, 1);
	vec = normalize (vec);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 5;
	newmis.solid = 2;
	newmis.effects = 8;
	setmodel (newmis, "progs/laser.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
	newmis.velocity = (vec * 900);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = Laser_Touch;
};

void () spikeshooter_use =
{
	if ((self.spawnflags & 2))
	{
		sound (self, 2, "enforcer/enfire.wav", 1, 1);
		LaunchLaser (self.origin, self.movedir);
	}
	else
	{
		sound (self, 2, "weapons/spike2.wav", 1, 1);
		launch_spike (self.origin, self.movedir);
		newmis.velocity = (self.movedir * 500);
		if ((self.spawnflags & 1))
		{
			newmis.touch = superspike_touch;
		}
	}
};

void () shooter_think =
{
	spikeshooter_use ();
	self.nextthink = (time + self.wait);
	newmis.velocity = (self.movedir * 500);
};

void () trap_spikeshooter =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	SetMovedir ();
	self.use = spikeshooter_use;
	if ((self.spawnflags & 2))
	{
		precache_model2 ("progs/laser.mdl");
		precache_sound2 ("enforcer/enfire.wav");
		precache_sound2 ("enforcer/enfstop.wav");
	}
	else
	{
		precache_sound ("weapons/spike2.wav");
	}
};

void () trap_shooter =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	trap_spikeshooter ();
	if ((self.wait == 0))
	{
		self.wait = 1;
	}
	self.nextthink = ((self.nextthink + self.wait) + self.ltime);
	self.think = shooter_think;
};
void () make_bubbles;
void () bubble_remove;

void () air_bubbles =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	dremove (self);
};

void () make_bubbles =
{
	newmis = spawn ();
	setmodel (newmis, "progs/s_bubble.spr");
	setorigin (newmis, self.origin);
	newmis.movetype = 8;
	newmis.solid = 0;
	newmis.velocity = '0 0 15';
	newmis.nextthink = (time + 0.5);
	newmis.think = bubble_bob;
	newmis.touch = bubble_remove;
	newmis.classname = "bubble";
	newmis.frame = 0;
	newmis.cnt = 0;
	setsize (newmis, '-8 -8 -8', '8 8 8');
	self.nextthink = ((time + random ()) + 0.5);
	self.think = make_bubbles;
};

void () bubble_split =
{
	newmis = spawn ();
	setmodel (newmis, "progs/s_bubble.spr");
	setorigin (newmis, self.origin);
	newmis.movetype = 8;
	newmis.solid = 0;
	newmis.velocity = self.velocity;
	newmis.nextthink = (time + 0.5);
	newmis.think = bubble_bob;
	newmis.touch = bubble_remove;
	newmis.classname = "bubble";
	newmis.frame = 1;
	newmis.cnt = enter;
	setsize (newmis, '-8 -8 -8', '8 8 8');
	self.frame = 1;
	self.cnt = enter;
	if ((self.waterlevel != AS_MELEE))
	{
		remove (self);
	}
};

void () bubble_remove =
{
	if ((other.classname == self.classname))
	{
		return;
	}
	dremove (self);
};

void () bubble_bob =
{
	local float rnd1;
	local float rnd2;
	local float rnd3;
	local vector vtmp1;
	local vector modi;

	self.cnt = (self.cnt + 1);
	if ((self.cnt == AS_MISSILE))
	{
		bubble_split ();
	}
	if ((self.cnt == 20))
	{
		dremove (self);
	}
	rnd1 = (self.velocity_x + (-10 + (random () * 20)));
	rnd2 = (self.velocity_y + (-10 + (random () * 20)));
	rnd3 = ((self.velocity_z + enter) + (random () * enter));
	if ((rnd1 > enter))
	{
		rnd1 = 5;
	}
	if ((rnd1 < -10))
	{
		rnd1 = -5;
	}
	if ((rnd2 > enter))
	{
		rnd2 = 5;
	}
	if ((rnd2 < -10))
	{
		rnd2 = -5;
	}
	if ((rnd3 < enter))
	{
		rnd3 = 15;
	}
	if ((rnd3 > 30))
	{
		rnd3 = 25;
	}
	self.velocity_x = rnd1;
	self.velocity_y = rnd2;
	self.velocity_z = rnd3;
	self.nextthink = (time + 0.5);
	self.think = bubble_bob;
};

void () viewthing =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.movetype = 0;
	self.solid = 0;
	precache_model ("progs/player.mdl");
	setmodel (self, "progs/player.mdl");
};

void () func_wall_use =
{
	self.frame = (1 - self.frame);
};

void () func_wall =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () func_illusionary =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 0;
	self.solid = 0;
	setmodel (self, self.model);
	makestatic (self);
};

void () func_episodegate =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (!(serverflags & self.spawnflags))
	{
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () func_bossgate =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if (((serverflags & 15) == 15))
	{
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () ambient_suck_wind =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/suck1.wav");
	ambientsound (self.origin, "ambience/suck1.wav", 1, AS_MELEE);
};

void () ambient_drone =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/drone6.wav");
	ambientsound (self.origin, "ambience/drone6.wav", 0.5, AS_MELEE);
};

void () ambient_flouro_buzz =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/buzz1.wav");
	ambientsound (self.origin, "ambience/buzz1.wav", 1, AS_MELEE);
};

void () ambient_drip =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/drip1.wav");
	ambientsound (self.origin, "ambience/drip1.wav", 0.5, AS_MELEE);
};

void () ambient_comp_hum =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/comp1.wav");
	ambientsound (self.origin, "ambience/comp1.wav", 1, AS_MELEE);
};

void () ambient_thunder =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/thunder1.wav");
	ambientsound (self.origin, "ambience/thunder1.wav", 0.5, AS_MELEE);
};

void () ambient_light_buzz =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/fl_hum1.wav");
	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, AS_MELEE);
};

void () ambient_swamp1 =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/swamp1.wav");
	ambientsound (self.origin, "ambience/swamp1.wav", 0.5, AS_MELEE);
};

void () ambient_swamp2 =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/swamp2.wav");
	ambientsound (self.origin, "ambience/swamp2.wav", 0.5, AS_MELEE);
};

void () noise_think =
{
	self.nextthink = (time + 0.5);
	sound (self, 1, "enforcer/enfire.wav", 1, 1);
	sound (self, 2, "enforcer/enfstop.wav", 1, 1);
	sound (self, AS_MELEE, "enforcer/sight1.wav", 1, 1);
	sound (self, AS_MISSILE, "enforcer/sight2.wav", 1, 1);
	sound (self, 5, "enforcer/sight3.wav", 1, 1);
	sound (self, 6, "enforcer/sight4.wav", 1, 1);
	sound (self, 7, "enforcer/pain1.wav", 1, 1);
};

void () misc_noisemaker =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/idle1.wav");
	self.nextthink = ((time + 0.1) + random ());
	self.think = noise_think;
};
