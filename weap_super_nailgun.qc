//@import - aux_spikes.qc
void (vector org, vector dir) launch_spike;
void () superspike_touch;

//=-=-=-=-= Local Functions
void () W_FireSuperSpikes;
//=-=-=-=-=

void () W_FireSuperSpikes =
{
	local vector dir;
	local entity old;

	sound (self, 1, "weapons/spike2.wav", 1, 1);
	if (!practice)
	{
		self.ammo_nails = (self.ammo_nails - 4);
		self.currentammo = self.ammo_nails;
	}
	dir = aim (self, 1000);
	launch_spike ((self.origin + '0 0 16'), dir);
	newmis.touch = superspike_touch;
	newmis.weapon = 4;
	setmodel (newmis, "progs/s_spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	KickPlayer (-2, self);
};