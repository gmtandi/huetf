//@import - player.qc
void () DeathBubblesSpawn;

//@import - aux_flame.qc
void (entity this) FlameDestroy;
entity (string type, entity p_owner) FlameSpawn;
float (string id_flame) RemoveFlameFromQueue;
void () OnPlayerFlame_touch;
void () FlameFollow;
void () WorldFlame_touch;
void () Remove;

//=-=-=-=-= Local Functions
void () TeamFortress_FlameThrower;
void () W_FireFlame;
void (float num_bubbles, vector bub_origin) NewBubbles;
void () Flamer_stream_touch;
void () Remove;
void () s_explode1;
void () s_explode2;
void () s_explode3;
void () s_explode4;
void () s_explode5;
void () s_explode6;
//=-=-=-=-= 

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

void () s_explode1 = [ 0, s_explode2 ]
{
};

void () s_explode2 = [ 1, s_explode3 ]
{
};

void () s_explode3 = [ 2, s_explode4 ]
{
};

void () s_explode4 = [ 3, s_explode5 ]
{
};

void () s_explode5 = [ 4, s_explode6 ]
{
};

void () s_explode6 = [ 5, SUB_Remove ]
{
};