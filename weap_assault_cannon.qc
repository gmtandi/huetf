//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;

//=-=-=-=-= Local Functions
void () TeamFortress_AssaultCannon;
void () W_FireAssaultCannon;
//=-=-=-=-=

void () TeamFortress_AssaultCannon = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 0;
	self.currentammo = self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_asscan.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = space;
};

void () W_FireAssaultCannon =
{
	local vector dir;

	KickPlayer (-4, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = 20;
	if ((self.velocity == '0 0 0'))
	{
		FireBullets (4.5, dir, '0.05 0.05 0');
	}
	else
	{
		FireBullets (4, dir, '0.1 0.1 0');
	}
};