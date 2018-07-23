//@import - weapons.qc
void () W_PrintWeaponMessage;

//@import - aux_lightning.qc
void (vector p1, vector p2, entity from, float damage) LightningDamage;

//=-=-=-=-= Local Functions
void () TeamFortress_Lightning;
void () W_FireLightning;
//=-=-=-=-=

void () TeamFortress_Lightning = {
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