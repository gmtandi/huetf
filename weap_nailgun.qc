//@import - player.qc
void () player_run;
float intermission_running;

//@import - player.qc
void () player_run;

//@import - weapons.qc
void () SuperDamageSound;
void (float att_delay) Attack_Finished;

//@import - weap_super_nailgun.qc
void () W_FireSuperSpikes;

//@import - aux_spikes.qc
void (vector org, vector dir) launch_spike;

//=-=-=-=-= Local Functions
void () TeamFortress_NailGun;
void () W_Attack_Nailgun;
void () W_FireSpikes;
void () player_nail1;
void () player_nail2;
//=-=-=-=-=

void () TeamFortress_NailGun = 
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload 	= 0;	
	self.AttackFunction = W_Attack_Nailgun;
	self.currentammo 	= self.ammo_nails;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_nail.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 512);
	self.weapon = 4;
};

void () W_Attack_Nailgun =
{
	player_nail1();
};

void () W_FireSpikes =
{
	local vector dir;
	local entity old;
	local float ox;
	
	if ((self.nailpos == 0))
	{
		ox = 4;
		self.nailpos = 1;
	}
	else
	{
		ox = -4;
		self.nailpos = 0;
	}
	
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


void () player_nail1 = [ 103, player_nail2 ]
{
	muzzleflash ();
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + 1);
	if ((self.weaponframe == 9))
	{
		self.weaponframe = 1;
	}
	SuperDamageSound ();
	W_FireSpikes();
	Attack_Finished (0.2);
	
};

void () player_nail2 = [ 104, player_nail1 ]
{
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + 1);
	if ((self.weaponframe == 9))
	{
		self.weaponframe = 1;
	}
};