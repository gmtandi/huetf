//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;

//=-=-=-=-=
void () W_FireSuperShotgun;
//=-=-=-=-=

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