//@import - aux_spikes.qc
void (vector org, vector dir) launch_spike;
void () superspike_touch;

//@import - player.qc
void () player_run;

//@import - weapons.qc
void () SuperDamageSound;
void (float att_delay) Attack_Finished;

//@import - weap_nailgun.qc
void () player_nail1;

//=-=-=-=-= Local Functions
void () TeamFortress_SuperNailGun;
void () W_FireSuperSpikes;
//=-=-=-=-=

void () TeamFortress_SuperNailGun = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload 				= 0;
	self.AttackFunction 			= player_nail1;
	self.currentammo = self.ammo_nails;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_nail2.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 512);
	self.weapon = 8;
};

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
	Attack_Finished (0.2);
};