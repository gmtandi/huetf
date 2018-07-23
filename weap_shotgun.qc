//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;

//=-=-=-=-=
void () W_FireShotgun;
//=-=-=-=-=

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