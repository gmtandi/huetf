//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;
void (float att_delay) Attack_Finished;
float () CheckForReload;

//=-=-=-=-=
void  () TeamFortress_Shotgun;
void  () W_Attack_Shotgun;
void  () W_FireShotgun;
float () W_Check_Reload_Shotgun;
void  () W_Reload_Shotgun_Start;
void  () W_Reload_Shotgun_Finish;
void  () player_shot1;
void  () player_shot2;
void  () player_shot3;
void  () player_shot4;
void  () player_shot5;
void  () player_shot6;
//=-=-=-=-=

void () TeamFortress_Shotgun = 
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload 			= 1;
	self.AttackFunction 		= W_Attack_Shotgun;
	self.CheckForReloadFunction = W_Check_Reload_Shotgun;
	self.ReloadStartFunction    = W_Reload_Shotgun_Start;
	self.ReloadEndFunction 	   	= W_Reload_Shotgun_Finish;

	self.currentammo = self.ammo_shells;
	self.items = (self.items | 2048);
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_shot.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = 1;
	
};

void () W_Attack_Shotgun =
{
	if (CheckForReload ())
		return;
	player_shot1 ();
	W_FireShotgun();
	self.reload_shotgun = (self.reload_shotgun + 1);
	self.StatusRefreshTime = (time + 0.1);
	CheckForReload ();
	Attack_Finished (0.5);
};

void () W_FireShotgun =
{
	local vector dir;

	
	sound (self, 1, "weapons/guncock.wav", 1, 1);
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = 1;
	FireBullets (6, dir, '0.04 0.04 0');	
};

float () W_Check_Reload_Shotgun = 
{
	local float rt;
	local entity tWeapon;
	
	if ((self.reload_shotgun >= 8) && (self.ammo_shells > 0))
	{
		self.reload_shotgun = 0;
		if ((self.ammo_shells < 8))
		{
			self.reload_shotgun = (8 - self.ammo_shells);
		}
		sprint (self, 2, "reloading... \n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + 2);
		tWeapon.think = W_Reload_Shotgun_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
}

void () W_Reload_Shotgun_Start =
{
	local float rt;
	local entity tWeapon;

	if (self.ammo_shells == 0)
	{
		sprint (self, 2, "out of shells.\n");
		return;
	}
	if (self.reload_shotgun == 0)
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if ((8 - self.reload_shotgun) == self.ammo_shells)
	{
		sprint (self, 2, "all shells are in the clip.\n");
		return;
	}
	if (self.reload_shotgun < self.ammo_shells)
	{
		Attack_Finished (0.4);
		rt = ((8 - self.reload_shotgun) / 8);
		rt = (2 - (2 * rt));
		self.reload_shotgun = 0;
		if ((self.ammo_shells < 8))
		{
			self.reload_shotgun = (8 - self.ammo_shells);
		}
		sprint (self, 2, "reloading... \n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = W_Reload_Shotgun_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
};

void () W_Reload_Shotgun_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_shot.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () player_shot1 = [ 113, player_shot2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_shot2 = [ 114, player_shot3 ]
{
	self.weaponframe = 2;
};

void () player_shot3 = [ 115, player_shot4 ]
{
	self.weaponframe = 3;
};

void () player_shot4 = [ 116, player_shot5 ]
{
	self.weaponframe = 4;
};

void () player_shot5 = [ 117, player_shot6 ]
{
	self.weaponframe = 5;
};

void () player_shot6 = [ 118, player_run ]
{
	self.weaponframe = 6;
};