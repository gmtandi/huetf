//@import - weapons.qc
float (entity other, entity projectile, float damage) headshot_calc;
void () ClearMultiDamage;
void (float damage, vector dir) TraceAttack;
void () ApplyMultiDamage;
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void () TeamFortress_AutoRifle;
void () W_FireAutoRifle;
void (vector direction, float damage) FireSniperBullet;
void () W_Attack_Auto_Rifle;
void () player_autorifle1;
void () player_autorifle2;
void () player_autorifle3;
//=-=-=-=-=

void () TeamFortress_AutoRifle = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload 				= 0;
	self.AttackFunction 			= W_Attack_Auto_Rifle;
	self.currentammo 				= self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_srifle.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = 2;
};

void () W_FireAutoRifle =
{
	local vector dir;

	sound (self, 1, "weapons/sniper.wav", 1, 1);
	KickPlayer (-1, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	makevectors (self.v_angle);
	dir = v_forward;
	deathmsg = 19;
	FireSniperBullet (dir, headshot_calc(other, self,8));
};

void (vector direction, float damage) FireSniperBullet =
{
	local vector src;

	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	ClearMultiDamage ();
	traceline (src, (src + (direction * 4096)), 0, self);
	if ((trace_fraction != 1))
	{
		TraceAttack (damage, direction);
	}
	ApplyMultiDamage ();
};

void () W_Attack_Auto_Rifle =
{
	player_autorifle1 ();
	W_FireAutoRifle ();
	Attack_Finished (0.1);
}

void () player_autorifle1 = [ 113, player_autorifle2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_autorifle2 = [ 114, player_autorifle3 ]
{
	self.weaponframe = 2;
};

void () player_autorifle3 = [ 118, player_run ]
{
	self.weaponframe = 6;
};