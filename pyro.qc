//=-=-=-=-=
void () NapalmGrenadeTouch;
void (vector org, entity shooter) NapalmGrenadeLaunch;
float (string id_flame) RemoveFlameFromQueue;

entity (string type, entity p_owner) FlameSpawn =
{
	if ((cb_prematch == SBAR_GRENS))
	{
		return (world);
	}
	if ((type != "1"))
	{
		return (world);
	}
	num_world_flames = (num_world_flames + SBAR_GRENS);
	while ((num_world_flames > SBAR_240))
	{
		if (!RemoveFlameFromQueue (type))
		{
			return (world);
		}
	}
	newmis = spawn ();
	if ((type == "1"))
	{
		newmis.movetype = 9;
		newmis.solid = SBAR_PRINT;
		newmis.effects = 8;
		newmis.flame_id = "1";
		setmodel (newmis, "progs/flame2.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
	}
	else
	{
		if ((type == "2"))
		{
			newmis.movetype = enter;
			newmis.solid = SBAR_PRINT;
			newmis.flame_id = "2";
			setmodel (newmis, "progs/flame2.mdl");
			newmis.frame = SBAR_GRENS;
			setsize (newmis, '0 0 0', '0 0 0');
		}
		else
		{
			if ((type == "3"))
			{
				newmis.movetype = 9;
				newmis.solid = SBAR_PRINT;
				newmis.flame_id = "3";
				setmodel (newmis, "progs/flame2.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
			}
			else
			{
				if ((type == "4"))
				{
					newmis.movetype = 9;
					newmis.flame_id = "4";
					newmis.frame = SBAR_GRENS;
					newmis.solid = SBAR_PRINT;
					setmodel (newmis, "progs/flame2.mdl");
					setsize (newmis, '0 0 0', '0 0 0');
				}
			}
		}
	}
	newmis.owner = p_owner;
	return (newmis);
};

void (entity this) FlameDestroy =
{
	num_world_flames = (num_world_flames - SBAR_GRENS);
	dremove (this);
};

float (string id_flame) RemoveFlameFromQueue =
{
	local entity tmp;

	if ((num_world_flames < 20))
	{
		dprint ("ERROR in RemoveFlameFromQueue\n");
		return (0);
	}
	num_world_flames = (num_world_flames - SBAR_GRENS);
	tmp = find (world, flame_id, "4");
	if (!tmp)
	{
		if ((id_flame == "4"))
		{
			return (0);
		}
		tmp = find (world, flame_id, "3");
		if (!tmp)
		{
			if ((id_flame == "3"))
			{
				return (0);
			}
			tmp = find (world, flame_id, "2");
			if (!tmp)
			{
				if ((id_flame == "2"))
				{
					return (0);
				}
				tmp = find (world, flame_id, "1");
				if (!tmp)
				{
					dprint ("\n\nRemoveFlameFromQueue():BOOM!\n");
					return (0);
				}
			}
		}
	}
	remove (tmp);
	return (SBAR_GRENS);
};

void () Remove =
{
	FlameDestroy (self);
};

void () NapalmGrenadeFollow =
{
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		FlameDestroy (self);
	}
	if ((self.velocity == '0 0 0'))
	{
		FlameDestroy (self);
	}
	self.nextthink = (time + 0.1);
};

void () NapalmGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NapalmGrenadeNetThink =
{
	local entity head;
	local entity te;

	if ((self.heat == 0))
	{
		self.owner.no_active_napalm_grens = (self.owner.no_active_napalm_grens + SBAR_GRENS);
		if ((self.owner.no_active_napalm_grens > SBAR_PRINT))
		{
			te = find (world, classname, "grentimer");
			while (te)
			{
				if (((te.owner == self.owner) && (te.no_active_napalm_grens == SBAR_GRENS)))
				{
					te.weapon = 15;
					te.think = RemoveGrenade;
					te.nextthink = (time + 0.1);
				}
				te = find (te, classname, "grentimer");
			}
		}
		self.no_active_napalm_grens = self.owner.no_active_napalm_grens;
	}
	self.nextthink = (time + SBAR_GRENS);
	self.origin = self.enemy.origin;
	makevectors (self.v_angle);
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		RemoveGrenade ();
		return;
	}
	head = findradius (self.origin, 180);
	while (head)
	{
		if (head.takedamage)
		{
			deathmsg = 15;
			TF_T_Damage (head, self, self.owner, 20, SBAR_PRINT, SBAR_240);
			other = head;
			Napalm_touch ();
			if ((other.classname == "player"))
			{
				stuffcmd (other, "bf\nbf\n");
			}
		}
		head = head.chain;
	}
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat > 7))
	{
		RemoveGrenade ();
	}
};

void () NapalmGrenadeExplode =
{
	local float i;
	local entity te;
	local entity head;

	sound (self, 0, "weapons/flmgrexp.wav", SBAR_GRENS, SBAR_GRENS);
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		dremove (self);
		return;
	}
	self.effects = (self.effects | 8);
	head = spawn ();
	head.think = NapalmGrenadeNetThink;
	head.classname = "grentimer";
	head.nextthink = (time + 0.1);
	head.heat = 0;
	head.origin = self.origin;
	head.owner = self.owner;
	head.team_no = self.owner.team_no;
	head.enemy = self;
};

void (vector org, entity shooter) NapalmGrenadeLaunch =
{
	local float xdir;
	local float ydir;
	local float zdir;
	local float spin;

	xdir = ((150 * random ()) - _K);
	ydir = ((150 * random ()) - _K);
	zdir = (40 * random ());
	newmis = FlameSpawn ("2", shooter);
	if ((newmis == world))
	{
		return;
	}
	self.touch = SUB_Null;
	newmis.classname = "fire";
	newmis.touch = Napalm_touch;
	newmis.think = NapalmGrenadeFollow;
	newmis.nextthink = (time + 0.1);
	newmis.enemy = shooter.owner;
	newmis.velocity_x = (xdir * SBAR_PRINT);
	newmis.velocity_y = (ydir * SBAR_PRINT);
	newmis.velocity_z = (zdir * 15);
	spin = ((random () * enter) / SBAR_PRINT);
	if ((spin <= 0))
	{
		newmis.avelocity = '250 300 400';
	}
	if ((spin == SBAR_GRENS))
	{
		newmis.avelocity = '400 250 300';
	}
	if ((spin == SBAR_PRINT))
	{
		newmis.avelocity = '300 400 250';
	}
	if ((spin == AS_MELEE))
	{
		newmis.avelocity = '300 300 300';
	}
	if ((spin >= AS_MISSILE))
	{
		newmis.avelocity = '400 250 400';
	}
	setorigin (newmis, org);
	setsize (newmis, '0 0 0', '0 0 0');
};
void () OnPlayerFlame_touch;

void () FlameFollow =
{
	local vector dir;
	local vector vtemp;
	local vector boundsize;
	local float damage;

	vtemp = self.enemy.absmin;
	boundsize = self.enemy.size;
	self.solid = 0;
	self.movetype = 0;
	if ((self.enemy.numflames == 0))
	{
		FlameDestroy (self);
		return;
	}
	if ((self.enemy.health < SBAR_GRENS))
	{
		deathmsg = 15;
		T_RadiusDamage (self, self, enter, self);
		self.enemy.numflames = 0;
		FlameDestroy (self);
		return;
	}
	if (((self.enemy.armorclass & SBAR_240) && (self.enemy.armorvalue > 0)))
	{
		self.health = 0;
	}
	if ((self.enemy.tfstate & 131072))
	{
		self.health = minus;
		self.enemy.tfstate = (self.enemy.tfstate - (self.enemy.tfstate & 131072));
	}
	if ((self.health < SBAR_GRENS))
	{
		if (((self.effects != 8) || (self.enemy.numflames <= SBAR_GRENS)))
		{
			self.enemy.numflames = (self.enemy.numflames - SBAR_GRENS);
			self.enemy.numflames = 0;
			FlameDestroy (self);
			return;
		}
	}
	self.health = (self.health - SBAR_GRENS);
	if ((vlen (self.enemy.velocity) < _2))
	{
		dir_x = (((random () * boundsize_x) / SBAR_PRINT) + (boundsize_x / AS_MISSILE));
		dir_y = (((random () * boundsize_y) / SBAR_PRINT) + (boundsize_y / AS_MISSILE));
		dir_z = (((random () * boundsize_z) / AS_MELEE) + (boundsize_z / SBAR_PRINT));
		vtemp = (vtemp + dir);
		setorigin (self, vtemp);
		if ((self.model != "progs/flame2.mdl"))
		{
			self.model = "progs/flame2.mdl";
			setmodel (self, self.model);
		}
	}
	else
	{
		if ((self.model == "progs/flame2.mdl"))
		{
			self.model = string_null;
			setmodel (self, self.model);
		}
	}
	if ((self.enemy.waterlevel > SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		self.enemy.numflames = (self.enemy.numflames - SBAR_GRENS);
		FlameDestroy (self);
		return;
	}
	self.nextthink = (time + 0.1);
	if (((self.effects == 8) && (self.heat >= AS_MELEE)))
	{
		damage = ((self.enemy.numflames * 0.3) * AS_MELEE);
		if ((damage < SBAR_GRENS))
		{
			damage = SBAR_GRENS;
		}
		self.heat = SBAR_GRENS;
		deathmsg = 15;
		TF_T_Damage (self.enemy, self, self.owner, damage, SBAR_PRINT, SBAR_240);
	}
	else
	{
		if ((self.effects == 8))
		{
			self.heat = (self.heat + SBAR_GRENS);
		}
	}
};

void () OnPlayerFlame_touch =
{
	local entity flame;
	local vector vtemp;

	if ((((other != world) && (other.health > 0)) && (other != self.enemy)))
	{
		if ((cb_prematch == SBAR_GRENS))
		{
			return;
		}
		if ((other.numflames >= AS_MISSILE))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & SBAR_240) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < SBAR_GRENS))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			flame = FlameSpawn ("3", other);
			if ((flame == world))
			{
				return;
			}
		}
		flame.classname = "fire";
		flame.health = minus;
		other.numflames = (other.numflames + SBAR_GRENS);
		flame.velocity = other.velocity;
		flame.enemy = other;
		flame.touch = OnPlayerFlame_touch;
		flame.owner = self.owner;
		vtemp = self.origin;
		setorigin (flame, vtemp);
		flame.nextthink = (time + 0.1);
		flame.think = FlameFollow;
	}
};
void () QW_Flame_ResetTouch;

void () WorldFlame_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	deathmsg = 15;
	TF_T_Damage (other, self, self.enemy, enter, SBAR_PRINT, SBAR_240);
	self.touch = SUB_Null;
	if ((self.heat > (time + SBAR_GRENS)))
	{
		self.think = QW_Flame_ResetTouch;
		self.nextthink = (time + SBAR_GRENS);
	}
	if ((((other != world) && (other.solid != SBAR_GRENS)) && (other.health > 0)))
	{
		if ((cb_prematch == SBAR_GRENS))
		{
			return;
		}
		if ((other.numflames >= AS_MISSILE))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & SBAR_240) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < SBAR_GRENS))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			flame = FlameSpawn ("3", other);
			if ((flame == world))
			{
				return;
			}
		}
		flame.classname = "fire";
		flame.health = 0;
		other.numflames = (other.numflames + SBAR_GRENS);
		flame.velocity = other.velocity;
		flame.enemy = other;
		flame.touch = OnPlayerFlame_touch;
		flame.owner = self.owner;
		vtemp = (self.origin + '0 0 10');
		setorigin (flame, vtemp);
		flame.nextthink = (time + 0.15);
		flame.think = FlameFollow;
	}
};

void () QW_Flame_ResetTouch =
{
	self.touch = WorldFlame_touch;
	self.think = Remove;
	self.nextthink = self.heat;
};

void () Flamer_stream_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == SBAR_PRINT) && (other.health > 0)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, enter, SBAR_PRINT, SBAR_240);
			if (cb_prematch)
			{
				return;
			}
			if ((other.numflames >= AS_MISSILE))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & SBAR_240) && (other.armorvalue > 0)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & SBAR_240) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < SBAR_GRENS))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				flame = FlameSpawn ("3", other);
				if ((flame == world))
				{
					return;
				}
			}
			flame.classname = "fire";
			flame.health = minus;
			other.numflames = (other.numflames + SBAR_GRENS);
			flame.velocity = other.velocity;
			flame.enemy = other;
			flame.touch = OnPlayerFlame_touch;
			flame.owner = self.owner;
			vtemp = self.origin;
			setorigin (flame, vtemp);
			flame.nextthink = (time + 0.1);
			flame.think = FlameFollow;
		}
	}
	else
	{
		if (((random () < 0.3) || (pointcontents ((self.origin + '0 0 1')) != -1)))
		{
			remove (self);
			return;
		}
		flame = FlameSpawn ("4", other);
		if ((flame != world))
		{
			flame.touch = WorldFlame_touch;
			flame.classname = "fire";
			vtemp = (self.origin + '0 0 10');
			setorigin (flame, vtemp);
			flame.nextthink = (time + 8);
			flame.heat = flame.nextthink;
			flame.think = Remove;
			flame.enemy = self.owner;
		}
		remove (self);
	}
};

void () Napalm_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == SBAR_PRINT) && (other.health > 0)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, 6, SBAR_PRINT, SBAR_240);
			if ((cb_prematch == SBAR_GRENS))
			{
				return;
			}
			if ((other.numflames >= AS_MISSILE))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & SBAR_240) && (other.armorvalue > 0)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & SBAR_240) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < SBAR_GRENS))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				flame = FlameSpawn ("3", other);
				if ((flame == world))
				{
					return;
				}
			}
			flame.classname = "fire";
			flame.health = minus;
			other.numflames = (other.numflames + SBAR_GRENS);
			flame.velocity = other.velocity;
			flame.enemy = other;
			flame.touch = OnPlayerFlame_touch;
			flame.owner = self.owner;
			vtemp = self.origin;
			setorigin (flame, vtemp);
			flame.nextthink = (time + 0.1);
			flame.think = FlameFollow;
		}
	}
	else
	{
		if ((pointcontents ((self.origin + '0 0 1')) != -1))
		{
			FlameDestroy (self);
			return;
		}
		flame = FlameSpawn ("4", other);
		if ((flame != world))
		{
			flame.touch = WorldFlame_touch;
			flame.classname = "fire";
			vtemp = (self.origin + '0 0 10');
			setorigin (flame, vtemp);
			flame.nextthink = (time + 20);
			flame.heat = flame.nextthink;
			flame.think = Remove;
			flame.enemy = self.owner;
		}
		FlameDestroy (self);
	}
};

void (float num_bubbles, vector bub_origin) NewBubbles =
{
	local entity bubble_spawner;

	bubble_spawner = spawn ();
	setorigin (bubble_spawner, bub_origin);
	bubble_spawner.movetype = 0;
	bubble_spawner.solid = 0;
	bubble_spawner.nextthink = (time + 0.1);
	if ((self.classname == "player"))
	{
		bubble_spawner.owner = self;
	}
	else
	{
		bubble_spawner.owner = self.enemy;
	}
	bubble_spawner.think = DeathBubblesSpawn;
	bubble_spawner.bubble_count = num_bubbles;
	return;
};

void () W_FireFlame =
{
	local entity flame;
	local float rn;

	if ((self.waterlevel > SBAR_PRINT))
	{
		makevectors (self.v_angle);
		NewBubbles (SBAR_PRINT, (self.origin + (v_forward * 64)));
		rn = random ();
		if ((rn < 0.5))
		{
			sound (self, SBAR_GRENS, "misc/water1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_GRENS, "misc/water2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		return;
	}
	if (!practice)
	{
		self.ammo_cells = (self.ammo_cells - SBAR_GRENS);
		self.currentammo = self.ammo_cells;
	}
	sound (self, 0, "weapons/flmfire2.wav", SBAR_GRENS, SBAR_GRENS);
	flame = spawn ();
	flame.owner = self;
	flame.movetype = 9;
	flame.solid = SBAR_PRINT;
	flame.classname = "flamerflame";
	makevectors (self.v_angle);
	flame.velocity = aim (self, 10000);
	flame.velocity = (flame.velocity * 700);
	flame.touch = Flamer_stream_touch;
	flame.think = s_explode1;
	flame.nextthink = (time + 0.15);
	setmodel (flame, "progs/s_explod.spr");
	setsize (flame, '0 0 0', '0 0 0');
	setorigin (flame, ((self.origin + (v_forward * SBAR_240)) + '0 0 16'));
};

void () IncendiaryRadius =
{
	local float damg;

	if ((self.weaponmode == SBAR_GRENS))
	{
		damg = _4;
	}
	else
	{
		damg = 64;
	}
	deathmsg = 15;
	T_RadiusDamage (self, self.owner, damg, other);
	self.origin = (self.origin - (8 * normalize (self.velocity)));
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () T_IncendiaryTouch =
{
	local float damg;
	local entity head;
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		remove (self);
		return;
	}
	self.effects = (self.effects | AS_MISSILE);
	if ((self.weaponmode == SBAR_GRENS))
	{
		damg = (space + (random () * enter));
	}
	else
	{
		damg = (_2 + (random () * 20));
	}
	deathmsg = 15;
	if (other.health)
	{
		TF_T_Damage (other, self, self.owner, damg, SBAR_PRINT, 0);
	}
	IncendiaryRadius ();
};

void () W_FireIncendiaryCannon =
{
	if (!practice)
	{
		if ((self.weaponmode == SBAR_GRENS))
		{
			if ((self.ammo_rockets < SBAR_PRINT))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - SBAR_PRINT);
			self.currentammo = self.ammo_rockets;
		}
		else
		{
			if ((self.ammo_rockets < AS_MELEE))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - AS_MELEE);
			self.currentammo = self.ammo_rockets;
		}
	}
	newmis = spawn ();
	newmis.owner = self;
	sound (self, SBAR_GRENS, "weapons/sgun1.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-3, self);
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "rocket";
	makevectors (self.v_angle);
	newmis.velocity = aim (self, 1000);
	if ((self.weaponmode == SBAR_GRENS))
	{
		newmis.velocity = (newmis.velocity * 800);
	}
	else
	{
		newmis.velocity = (newmis.velocity * 600);
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.weaponmode = self.weaponmode;
	newmis.touch = T_IncendiaryTouch;
	newmis.nextthink = (time + 5);
	newmis.think = IncendiaryRadius;
	newmis.weapon = SBAR_384;
	setmodel (newmis, "progs/missile.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void () TeamFortress_IncendiaryCannon =
{
	if (!(self.weapons_carried & 16384))
	{
		return;
	}
	if ((self.weaponmode == SBAR_GRENS))
	{
		if ((self.ammo_rockets < SBAR_PRINT))
		{
			sprint (self, SBAR_PRINT, "not enough ammo.\n");
			return;
		}
	}
	else
	{
		if ((self.ammo_rockets < AS_MELEE))
		{
			sprint (self, SBAR_PRINT, "not enough ammo.\n");
			return;
		}
	}
	self.current_weapon = 16384;
	W_SetCurrentAmmo ();
};

void () TeamFortress_FlameThrower =
{
	if (!(self.weapons_carried & 4096))
	{
		return;
	}
	if ((self.ammo_cells < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "not enough ammo.\n");
		return;
	}
	self.current_weapon = 4096;
	W_SetCurrentAmmo ();
};
