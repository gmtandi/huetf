//@import - weapons.qc
void (float att_delay) Attack_Finished;
float () CheckForReload;

//=-=-=-=-= Local Functions
void () TeamFortress_RocketLauncher;
void () W_FireRocket;
void () MissileRadius;
void () T_MissileTouch;
float () W_Check_Reload_Rocket_Launcher;
void () W_Reload_Rocket_Launcher_Start;
void () W_Reload_Rocket_Launcher_Finish;
void () player_rocket1;
void () player_rocket2;
void () player_rocket3;
void () player_rocket4;
void () player_rocket5;
void () player_rocket6;
//=-=-=-=-=

void () TeamFortress_RocketLauncher = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 1;
	self.AttackFunction			= W_FireRocket;
	self.CheckForReloadFunction = W_Check_Reload_Rocket_Launcher;
	self.ReloadStartFunction    = W_Reload_Rocket_Launcher_Start;
	self.ReloadEndFunction 	    = W_Reload_Rocket_Launcher_Finish;	

	self.currentammo = self.ammo_rockets;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rock2.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 1024);
	self.weapon = 32;
};

void () W_FireRocket =
{
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - 1);
		self.currentammo = self.ammo_rockets;
	}
	if (CheckForReload ())
		return;
	player_rocket1 ();
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
	self.reload_rocket_launcher = (self.reload_rocket_launcher + 1);
	self.StatusRefreshTime = (time + 0.1);
	CheckForReload ();
	Attack_Finished (0.8);
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

float () W_Check_Reload_Rocket_Launcher =
{
	local float rt;
	local entity tWeapon;
	
	if (((self.reload_rocket_launcher >= 4) && (self.ammo_rockets > 0)))
	{
		self.reload_rocket_launcher = 0;
		if ((self.ammo_rockets < 4))
		{
			self.reload_rocket_launcher = (4 - self.ammo_rockets);
		}
		sprint (self, 2, "reloading... \n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + 5);
		tWeapon.think = W_Reload_Rocket_Launcher_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
};

void () W_Reload_Rocket_Launcher_Start =
{
	local float rt;
	local entity tWeapon;

	if ((self.ammo_rockets == 0))
	{
		sprint (self, 2, "out of rockets.\n");
		return;
	}
	if ((self.reload_rocket_launcher == 0))
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if (((4 - self.reload_rocket_launcher) == self.ammo_rockets))
	{
		sprint (self, 2, "all rockets are in the clip.\n");
		return;
	}
	if ((self.reload_rocket_launcher < self.ammo_rockets))
	{
		Attack_Finished (0.8);
		rt = ((4 - self.reload_rocket_launcher) / 4);
		rt = (5 - (5 * rt));
		self.reload_rocket_launcher = 0;
		if ((self.ammo_rockets < 4))
		{
			self.reload_rocket_launcher = (4 - self.ammo_rockets);
		}
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = W_Reload_Rocket_Launcher_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
};

void () W_Reload_Rocket_Launcher_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock2.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () player_rocket1 = [ 107, player_rocket2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_rocket2 = [ 108, player_rocket3 ]
{
	self.weaponframe = 2;
};

void () player_rocket3 = [ 109, player_rocket4 ]
{
	self.weaponframe = 3;
};

void () player_rocket4 = [ 110, player_rocket5 ]
{
	self.weaponframe = 4;
};

void () player_rocket5 = [ 111, player_rocket6 ]
{
	self.weaponframe = 5;
};

void () player_rocket6 = [ 112, player_run ]
{
	self.weaponframe = 6;
};