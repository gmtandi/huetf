//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;
void (float att_delay) Attack_Finished;

//=-=-=-=-=
void  () TeamFortress_SuperShotgun;
void  () W_FireSuperShotgun;
float () W_Check_Reload_Super_Shotgun;
void  () W_Reload_Super_Shotgun_Start;
void  () W_Reload_Super_Shotgun_Finish;
//=-=-=-=-=

void () TeamFortress_SuperShotgun = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 1;
	self.CheckForReloadFunction = W_Check_Reload_Super_Shotgun;
	self.ReloadStartFunction    = W_Reload_Super_Shotgun_Start;
	self.ReloadEndFunction 	    = W_Reload_Super_Shotgun_Finish;

	self.currentammo = self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_shot2.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = 2;
};

void () W_FireSuperShotgun =
{
	local vector dir;

	if ((self.currentammo == 1))
	{
		W_FireShotgun ();
		return;
	}
	sound (self, 1, "weapons/shotgn2.wav", 1, 1);
	KickPlayer (-4, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 2);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = 2;
	FireBullets (14, dir, '0.14 0.08 0');
};

float () W_Check_Reload_Super_Shotgun =
{
	local float rt;
	local entity tWeapon;
	
	if ((self.reload_super_shotgun > 16))
	{
		self.reload_super_shotgun = 16;
	}
	if (((self.reload_super_shotgun >= 16) && (self.ammo_shells > 0)))
	{
		self.reload_super_shotgun = 0;
		if ((self.ammo_shells < 16))
		{
			self.reload_super_shotgun = (16 - self.ammo_shells);
		}
		sprint (self, 2, "reloading... \n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + 3);
		tWeapon.think = W_Reload_Super_Shotgun_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
};

void () W_Reload_Super_Shotgun_Start =
{
	local float rt;
	local entity tWeapon;

	if (self.ammo_shells == 0)
	{
		sprint (self, 2, "out of shells.\n");
		return;
	}
	if (self.reload_super_shotgun == 0)
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if ((16 - self.reload_super_shotgun) == self.ammo_shells)
	{
		sprint (self, 2, "all shells are in the clip.\n");
		return;
	}
	if (self.reload_super_shotgun < self.ammo_shells)
	{
		Attack_Finished (0.7);
		rt = ((16 - self.reload_super_shotgun) / 16);
		rt = (3 - (3 * rt));
		self.reload_super_shotgun = 0;
		if ((self.ammo_shells < 16))
		{
			self.reload_super_shotgun = (16 - self.ammo_shells);
		}
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = W_Reload_Super_Shotgun_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
}

void () W_Reload_Super_Shotgun_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_shot2.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};