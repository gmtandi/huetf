//=-=-=-=-= Local Functions
void () TeamFortress_RocketLauncher;
void () W_FireRocket;
void () MissileRadius;
void () T_MissileTouch;
//=-=-=-=-=

void () TeamFortress_RocketLauncher = {
	self.currentammo = self.ammo_rockets;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rock2.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 1024);
	self.weapon = space;
};

void () W_FireRocket =
{
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - 1);
		self.currentammo = self.ammo_rockets;
	}
	sound (self, 1, "weapons/sgun1.wav", 1, 1);
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = 2;
	makevectors (self.v_angle);
	newmis.velocity = v_forward;
	if ((self.playerclass == PC_CIVILIAN))
	{
		newmis.velocity = (newmis.velocity * 1000);
	}
	else
	{
		newmis.velocity = (newmis.velocity * 900);
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.classname = "rocket";
	newmis.touch = T_MissileTouch;
	newmis.voided = 0;
	newmis.nextthink = (time + 5);
	newmis.think = MissileRadius;
	newmis.weapon = 6;
	setmodel (newmis, "progs/missile.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void () MissileRadius =
{
	local float damg;

	if ((self.owner.classname == "building_sentrygun"))
	{
		damg = 150;
	}
	else
	{
		if ((self.playerclass == PC_CIVILIAN))
		{
			damg = _x;
		}
		else
		{
			damg = 92;
		}
	}
	deathmsg = self.weapon;
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

void () T_MissileTouch =
{
	local float damg;

	if (self.voided)
	{
		return;
	}
	self.voided = 1;
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if ((self.playerclass == PC_CIVILIAN))
	{
		damg = (_d + (random () * 20));
	}
	else
	{
		damg = (92 + (random () * 20));
	}
	deathmsg = self.weapon;
	if (other.health)
	{
		TF_T_Damage (other, self, self.owner, damg, 2, 0);
	}
	MissileRadius ();
};

