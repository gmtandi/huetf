//@import - aux_lightning.qc
void (vector p1, vector p2, entity from, float damage) LightningDamage;

//@import - player.qc
float intermission_running;

//@import - weapons.qc
void () SuperDamageSound;
void (float att_delay) Attack_Finished;
void () W_PrintWeaponMessage;

//=-=-=-=-= Local Functions
void () TeamFortress_Lightning;
void () W_FireLightning;
void () W_Attack_Lightning;
void () player_light1;
void () player_light2;
//=-=-=-=-=

void () TeamFortress_Lightning = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 0;
	self.AttackFunction = W_Attack_Lightning;
	self.currentammo = self.ammo_cells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_light.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 2048);
	self.weapon = 64;	
};

void () W_FireLightning =
{
	local vector org;
	local float cells;
	if ((self.ammo_cells < 1))
	{
		self.last_weapon = self.current_weapon;
		self.last_weaponmode = self.weaponmode;
		self.current_weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
		W_PrintWeaponMessage ();
		return;
	}
	if ((self.waterlevel > 1))
	{
		cells = self.ammo_cells;
		self.ammo_cells = 0;
		W_SetCurrentAmmo ();
		deathmsg = 7;
		T_RadiusDamage (self, self, (35 * cells), world);
		return;
	}
	if ((self.t_width < time))
	{
		sound (self, 1, "weapons/lhit.wav", 1, 1);
		self.t_width = (time + 0.6);
	}
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_cells = (self.ammo_cells - 1);
		self.currentammo = self.ammo_cells;
	}
	org = (self.origin + '0 0 16');
	traceline (org, (org + (v_forward * 600)), 1, self);
	WriteByte (4, 23);
	WriteByte (4, 6);
	WriteEntity (4, self);
	WriteCoord (4, org_x);
	WriteCoord (4, org_y);
	WriteCoord (4, org_z);
	WriteCoord (4, trace_endpos_x);
	WriteCoord (4, trace_endpos_y);
	WriteCoord (4, trace_endpos_z);
	multicast (org, 1);
	LightningDamage (self.origin, (trace_endpos + (v_forward * 4)), self, 30);
};


void () W_Attack_Lightning = 
{
	player_light1 ();
	Attack_Finished (0.1);
	sound (self, 0, "weapons/lstart.wav", 1, 1);
};

void () player_light1 = [ 105, player_light2 ]
{
	muzzleflash ();
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + 1);
	if ((self.weaponframe == 5))
	{
		self.weaponframe = 1;
	}
	SuperDamageSound ();
	W_FireLightning ();
	Attack_Finished (0.2);
};

void () player_light2 = [ 106, player_light1 ]
{
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + 1);
	if ((self.weaponframe == 5))
	{
		self.weaponframe = 1;
	}
	SuperDamageSound ();
	W_FireLightning ();
	Attack_Finished (0.2);
};
