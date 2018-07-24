//@import - aux_flame.qc

//=-=-=-=-= Local Functions
void () TeamFortress_IncendiaryCannon;
void () W_FireIncendiaryCannon;
void () IncendiaryRadius;
void () T_IncendiaryTouch;
//=-=-=-=-= 
void () TeamFortress_IncendiaryCannon =
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 0;	
	self.currentammo = self.ammo_rockets;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rock2.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 1024);
	self.weapon = 16;
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