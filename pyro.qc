//=-=-=-=-=
void () NapalmGrenadeTouch;
void (vector org, entity shooter) NapalmGrenadeLaunch;
float (string id_flame) RemoveFlameFromQueue;

entity (string type, entity p_owner) FlameSpawn =
{
	if ((cb_prematch == 1))
	{
		return (world);
	}
	if ((type != "1"))
	{
		return (world);
	}
	num_world_flames = (num_world_flames + 1);
	while ((num_world_flames > 16))
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
		newmis.solid = 2;
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
			newmis.solid = 2;
			newmis.flame_id = "2";
			setmodel (newmis, "progs/flame2.mdl");
			newmis.frame = 1;
			setsize (newmis, '0 0 0', '0 0 0');
		}
		else
		{
			if ((type == "3"))
			{
				newmis.movetype = 9;
				newmis.solid = 2;
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
					newmis.frame = 1;
					newmis.solid = 2;
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
	num_world_flames = (num_world_flames - 1);
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
	num_world_flames = (num_world_flames - 1);
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
	return (1);
};

void () Remove =
{
	FlameDestroy (self);
};

void () NapalmGrenadeFollow =
{
	traceline (self.origin, self.origin, 1, self);
	if ((trace_inwater == 1))
	{
		sound (self, 2, "misc/vapeur2.wav", 1, 1);
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
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NapalmGrenadeNetThink =
{
	local entity head;
	local entity te;
	local float dam_mult;
	local float explosion_interval;

	if (shortergrens) {		
		dam_mult = 1.1;
		explosion_interval = 0.5;
	} 
	else {
		dam_mult = 1;
		explosion_interval = 1;
	}

	if ((self.heat == 0))
	{
		self.owner.no_active_napalm_grens = (self.owner.no_active_napalm_grens + 1);
		if ((self.owner.no_active_napalm_grens > 2))
		{
			te = find (world, classname, "grentimer");
			while (te)
			{
				if (((te.owner == self.owner) && (te.no_active_napalm_grens == 1)))
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
	self.nextthink = (time + explosion_interval);
	self.origin = self.enemy.origin;
	makevectors (self.v_angle);
	traceline (self.origin, self.origin, 1, self);
	if ((trace_inwater == 1))
	{
		sound (self, 2, "misc/vapeur2.wav", 1, 1);
		RemoveGrenade ();
		return;
	}
	head = findradius (self.origin, 180);
	while (head)
	{
		if (head.takedamage)
		{
			deathmsg = 15;

			TF_T_Damage (head, self, self.owner, 20 * dam_mult, 2, 16);
			other = head;
			Napalm_touch ();
			if ((other.classname == "player"))
			{
				stuffcmd (other, "bf\nbf\n");
			}
		}
		head = head.chain;
	}
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	self.heat = (self.heat + 1);
	if ((self.heat > 7))
	{
		RemoveGrenade ();
	}
};

void () NapalmGrenadeExplode =
{
	local entity head;

	sound (self, 0, "weapons/flmgrexp.wav", 1, 1);
	traceline (self.origin, self.origin, 1, self);
	if ((trace_inwater == 1))
	{
		dremove (self);
		return;
	}
	self.effects = (self.effects | 8);
	head = spawn ();
	head.think = NapalmGrenadeNetThink;
	head.classname = "grentimer";
	head.grenadename = "napalmfire";
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
	newmis.velocity_x = (xdir * 2);
	newmis.velocity_y = (ydir * 2);
	newmis.velocity_z = (zdir * 15);
	spin = ((random () * enter) / 2);
	if ((spin <= 0))
	{
		newmis.avelocity = '250 300 400';
	}
	if ((spin == 1))
	{
		newmis.avelocity = '400 250 300';
	}
	if ((spin == 2))
	{
		newmis.avelocity = '300 400 250';
	}
	if ((spin == 3))
	{
		newmis.avelocity = '300 300 300';
	}
	if ((spin >= 4))
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
	if ((self.enemy.health < 1))
	{
		deathmsg = 15;
		T_RadiusDamage (self, self, enter, self);
		self.enemy.numflames = 0;
		FlameDestroy (self);
		return;
	}
	if (((self.enemy.armorclass & 16) && (self.enemy.armorvalue > 0)))
	{
		self.health = 0;
	}
	if ((self.enemy.tfstate & 131072))
	{
		self.health = minus;
		self.enemy.tfstate = (self.enemy.tfstate - (self.enemy.tfstate & 131072));
	}
	if ((self.health < 1))
	{
		if (((self.effects != 8) || (self.enemy.numflames <= 1)))
		{
			self.enemy.numflames = (self.enemy.numflames - 1);
			self.enemy.numflames = 0;
			FlameDestroy (self);
			return;
		}
	}
	self.health = (self.health - 1);
	if ((vlen (self.enemy.velocity) < _2))
	{
		dir_x = (((random () * boundsize_x) / 2) + (boundsize_x / 4));
		dir_y = (((random () * boundsize_y) / 2) + (boundsize_y / 4));
		dir_z = (((random () * boundsize_z) / 3) + (boundsize_z / 2));
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
	if ((self.enemy.waterlevel > 1))
	{
		sound (self, 2, "misc/vapeur2.wav", 1, 1);
		self.enemy.numflames = (self.enemy.numflames - 1);
		FlameDestroy (self);
		return;
	}
	self.nextthink = (time + 0.1);
	if (((self.effects == 8) && (self.heat >= 3)))
	{
		damage = ((self.enemy.numflames * 0.3) * 3);
		if ((damage < 1))
		{
			damage = 1;
		}
		self.heat = 1;
		deathmsg = 15;
		TF_T_Damage (self.enemy, self, self.owner, damage, 2, 16);
	}
	else
	{
		if ((self.effects == 8))
		{
			self.heat = (self.heat + 1);
		}
	}
};

void () OnPlayerFlame_touch =
{
	local entity flame;
	local vector vtemp;

	if ((((other != world) && (other.health > 0)) && (other != self.enemy)))
	{
		if ((cb_prematch == 1))
		{
			return;
		}
		if ((other.numflames >= 4))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & 16) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < 1))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, 2, "ambience/fire1.wav", 1, 1);
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
		other.numflames = (other.numflames + 1);
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
	local vector vtemp;

	deathmsg = 15;
	TF_T_Damage (other, self, self.enemy, enter, 2, 16);
	self.touch = SUB_Null;
	if ((self.heat > (time + 1)))
	{
		self.think = QW_Flame_ResetTouch;
		self.nextthink = (time + 1);
	}
	if ((((other != world) && (other.solid != 1)) && (other.health > 0)))
	{
		if ((cb_prematch == 1))
		{
			return;
		}
		if ((other.numflames >= 4))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & 16) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < 1))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, 2, "ambience/fire1.wav", 1, 1);
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
		other.numflames = (other.numflames + 1);
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
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == 2) && (other.health > 0)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, enter, 2, 16);
			if (cb_prematch)
			{
				return;
			}
			if ((other.numflames >= 4))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & 16) && (other.armorvalue > 0)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & 16) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < 1))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, 2, "ambience/fire1.wav", 1, 1);
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
			other.numflames = (other.numflames + 1);
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
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == 2) && (other.health > 0)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, 6, 2, 16);
			if ((cb_prematch == 1))
			{
				return;
			}
			if ((other.numflames >= 4))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & 16) && (other.armorvalue > 0)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & 16) && (other.team_no > 0)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < 1))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, 2, "ambience/fire1.wav", 1, 1);
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
			other.numflames = (other.numflames + 1);
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

	if ((self.waterlevel > 2))
	{
		makevectors (self.v_angle);
		NewBubbles (2, (self.origin + (v_forward * 64)));
		rn = random ();
		if ((rn < 0.5))
		{
			sound (self, 1, "misc/water1.wav", 1, 1);
		}
		else
		{
			sound (self, 1, "misc/water2.wav", 1, 1);
		}
		return;
	}
	if (!practice)
	{
		self.ammo_cells = (self.ammo_cells - 1);
		self.currentammo = self.ammo_cells;
	}
	sound (self, 0, "weapons/flmfire2.wav", 1, 1);
	flame = spawn ();
	flame.owner = self;
	flame.movetype = 9;
	flame.solid = 2;
	flame.classname = "flamerflame";
	makevectors (self.v_angle);
	flame.velocity = aim (self, 10000);
	flame.velocity = (flame.velocity * 700);
	flame.touch = Flamer_stream_touch;
	flame.think = s_explode1;
	flame.nextthink = (time + 0.15);
	setmodel (flame, "progs/s_explod.spr");
	setsize (flame, '0 0 0', '0 0 0');
	setorigin (flame, ((self.origin + (v_forward * 16)) + '0 0 16'));
};

void () IncendiaryRadius =
{
	local float damg;

	if ((self.weaponmode == 1))
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
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};

void () T_IncendiaryTouch =
{
	local float damg;

	if ((other == self.owner))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		remove (self);
		return;
	}
	self.effects = (self.effects | 4);
	if ((self.weaponmode == 1))
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
		TF_T_Damage (other, self, self.owner, damg, 2, 0);
	}
	IncendiaryRadius ();
};

void () W_FireIncendiaryCannon =
{
	if (!practice)
	{
		if ((self.weaponmode == 1))
		{
			if ((self.ammo_rockets < 2))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - 2);
			self.currentammo = self.ammo_rockets;
		}
		else
		{
			if ((self.ammo_rockets < 3))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - 3);
			self.currentammo = self.ammo_rockets;
		}
	}
	newmis = spawn ();
	newmis.owner = self;
	sound (self, 1, "weapons/sgun1.wav", 1, 1);
	KickPlayer (-3, self);
	newmis.movetype = 9;
	newmis.solid = 2;
	newmis.classname = "rocket";
	makevectors (self.v_angle);
	newmis.velocity = aim (self, 1000);
	if ((self.weaponmode == 1))
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
	newmis.weapon = 33;
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
	if ((self.weaponmode == 1))
	{
		if ((self.ammo_rockets < 2))
		{
			sprint (self, 2, "not enough ammo.\n");
			return;
		}
	}
	else
	{
		if ((self.ammo_rockets < 3))
		{
			sprint (self, 2, "not enough ammo.\n");
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
	if ((self.ammo_cells < 1))
	{
		sprint (self, 2, "not enough ammo.\n");
		return;
	}
	self.current_weapon = 4096;
	W_SetCurrentAmmo ();
};
