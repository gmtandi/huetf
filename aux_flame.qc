//=-=-=-=-= Local Functions
void (entity this) FlameDestroy;
entity (string type, entity p_owner) FlameSpawn;
float (string id_flame) RemoveFlameFromQueue;
void () OnPlayerFlame_touch;
void () FlameFollow;
void () WorldFlame_touch;
void () Remove;
void () QW_Flame_ResetTouch;
//=-=-=-=-= 

void (entity this) FlameDestroy =
{
	num_world_flames = (num_world_flames - 1);
	dremove (this);
};

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
		self.health = 45;
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

void () WorldFlame_touch =
{
	local entity flame;
	local vector dir;
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

void () Remove =
{
	FlameDestroy (self);
};

void () QW_Flame_ResetTouch =
{
	self.touch = WorldFlame_touch;
	self.think = Remove;
	self.nextthink = self.heat;
};