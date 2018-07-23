//@import - aux_flame.qc
void (entity this) FlameDestroy;
entity (string type, entity p_owner) FlameSpawn;
void () OnPlayerFlame_touch;
void () FlameFollow;
void () WorldFlame_touch;
void () Remove;

//=-=-=-=-= Local Functions
void () TeamFortress_Pyro;
void () NapalmGrenadeTouch;
void (vector org, entity shooter) NapalmGrenadeLaunch;
//=-=-=-=-=

void () TeamFortress_Pyro = 
{
	self.weapons_carried	= PC_PYRO_WEAPONS;
	self.ammo_rockets 	 	= 20;
	self.ammo_nails 	 	= 0;
	self.ammo_shells 	 	= 20;
	self.ammo_cells 		= 120;
	self.maxammo_rockets 	= 60;
	self.maxammo_nails 	 	= 50;
	self.maxammo_shells  	= 40;
	self.maxammo_cells   	= 200;
	self.no_grenades_1   	= 2;
	self.no_grenades_2   	= 3;
	self.tp_grenades_1   	= 1;
	self.tp_grenades_2   	= 5;
	self.tf_items 		 	= 0;
	self.armorclass 	 	= (self.armorclass | 16);
	self.armortype 			= 0.6;
	self.armorvalue 		= 50;
	self.armor_allowed 		= 0.6;
	self.maxarmor 			= 150;
	self.max_health			= 100;
	self.current_weapon 	= WEAP_FLAMETHROWER;
	self.items_allowed 		= PC_PYRO_WEAPONS;
	self.items 				= ( 1 | 8 | 16);
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
	local float i;
	local entity te;
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


