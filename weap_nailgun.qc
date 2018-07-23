//@import - weap_super_nailgun.qc
void () W_FireSuperSpikes;

//@import - aux_spikes.qc
void (vector org, vector dir) launch_spike;

//=-=-=-=-= Local Functions
void (float ox) W_FireSpikes;
//=-=-=-=-=

void (float ox) W_FireSpikes =
{
	local vector dir;
	local entity old;

	makevectors (self.v_angle);
	if (((self.ammo_nails >= 4) && (self.current_weapon == WEAP_SUPER_NAILGUN)))
	{
		W_FireSuperSpikes ();
		return;
	}
	if (self.ammo_nails < 1)
	{
		self.last_weapon = self.current_weapon;
		self.last_weaponmode = self.weaponmode;
		self.current_weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
		W_PrintWeaponMessage ();
		return;
	}
	sound (self, 1, "weapons/rocket1i.wav", 1, 1);
	if (!practice)
	{
		if (self.ammo_nails == 1)
		{
			self.ammo_nails = (self.ammo_nails - 1);
			self.currentammo = self.ammo_nails;
		}
		else
		{
			self.ammo_nails = (self.ammo_nails - 2);
			self.currentammo = self.ammo_nails;
		}
	}
	dir = aim (self, 1000);
	launch_spike (((self.origin + '0 0 16') + (v_right * ox)), dir);
	KickPlayer (-2, self);
};