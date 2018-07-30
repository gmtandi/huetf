//@import - player.qc
float intermission_running;
void () player_run;

//@import - weapons.qc
void (float shotcount, vector dir, vector spread) FireBullets;
void (float att_delay) Attack_Finished;
void () SuperDamageSound;
void () W_PrintWeaponMessage;

//=-=-=-=-= Local Functions
void () TeamFortress_AssaultCannon;
void () W_Attack_AssaultCannon;
void () W_FireAssaultCannon;
void () player_assaultcannonup1;
void () player_assaultcannonup2;
void () player_assaultcannon1;
void () player_assaultcannon2;
void () player_assaultcannondown1;
//=-=-=-=-=

void () TeamFortress_AssaultCannon = 
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload 	= 0;
	self.AttackFunction = W_Attack_AssaultCannon;
	self.currentammo 	= self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_asscan.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = space;
};

void () W_Attack_AssaultCannon =
{
	if (self.ammo_cells < 7)
	{
		sprint (self, 1, "Insufficient cells to power up the Assault Cannon.\n");
	}
	else
	{
		self.ammo_cells = (self.ammo_cells - 7);
		self.heat = 1;
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | TFSTATE_AIMING);
		TeamFortress_SetSpeed (self);
		player_assaultcannonup1 ();
	}
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

void () player_assaultcannonup1 = [ 103, player_assaultcannonup2 ]
{
	if ((!self.button0 || self.ammo_shells < 1) || intermission_running)
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self);
		self.count = 1;
		self.heat = 0;
		player_assaultcannondown1 ();
		return;
	}
	self.fire_held_down = 1;
	if ((self.heat == 1))
	{
		sound (self, 1, "weapons/asscan1.wav", 1, 1);
	}
	SuperDamageSound ();
	Attack_Finished (0.1);
	if (((self.heat != 2) && (self.heat != 4)))
	{
		if ((self.weaponframe >= 3))
		{
			self.weaponframe = 0;
		}
		else
		{
			self.weaponframe = (self.weaponframe + 1);
		}
	}
	self.heat = (self.heat + 1);
	if ((self.heat >= 7))
	{
		self.heat = 0;
		player_assaultcannon1 ();
	}
};

void () player_assaultcannonup2 = [ 103, player_assaultcannonup1 ]
{
	if ((!self.button0 || (self.ammo_shells < 1)) || intermission_running || !(self.flags & 512))
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self);
		self.count = 1;
		self.heat = 0;
		player_assaultcannondown1 ();
		return;
	}
	SuperDamageSound ();
	Attack_Finished (0.1);
	if (((self.heat != 2) && (self.heat != 4)) && (self.heat != 7))
	{
		if ((self.weaponframe == 2) && (self.heat >= 9))
		{
			self.weaponframe = 0;
		}
		else
		{
			if ((self.weaponframe >= 3))
			{
				self.weaponframe = 0;
			}
			else
			{
				self.weaponframe = (self.weaponframe + 1);
			}
		}
	}
	self.heat = (self.heat + 1);
	if ((self.heat >= 13))
	{
		self.heat = 0;
		player_assaultcannon1 ();
	}
};

void () player_assaultcannon1 = [ 103, player_assaultcannon2 ]
{
	if (vlen (self.velocity) < 150)
	{
		muzzleflash ();
		sound (self, 1, "weapons/asscan2.wav", 1, 1);
		if (self.weaponframe == 2)
		{
			self.weaponframe = 4;
		}
		else
		{
			self.weaponframe = 2;
		}
		SuperDamageSound ();
		W_FireAssaultCannon ();
	}
	else
	{
		sound (self, 1, "weapons/asscan4.wav", 1, 1);
		if (self.weaponframe == 2)
		{
			self.weaponframe = 0;
		}
		else
		{
			self.weaponframe = 2;
		}
	}
	if (!self.button0 || self.ammo_shells < 1 || intermission_running)
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self);
		self.weaponframe = 0;
		self.count = 1;
		player_assaultcannondown1 ();
		return;
	}
	Attack_Finished (0.1);
};

void () player_assaultcannon2 = [ 104, player_assaultcannon1 ]
{
	if (vlen (self.velocity) < redlamp)
	{
		if ((self.weaponframe == 2))
		{
			self.weaponframe = 4;
		}
		else
		{
			self.weaponframe = 2;
		}
		SuperDamageSound ();
		W_FireAssaultCannon ();
		self.heat = (self.heat + 0.1);
		stuffcmd (self, "bf\n");
	}
	else
	{
		if (self.weaponframe == 2)
		{
			self.weaponframe = 0;
		}
		else
		{
			self.weaponframe = 2;
		}
	}
	if (!self.button0 || self.ammo_shells < 1 || intermission_running)
	{
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self);
		self.weaponframe = 0;
		self.count = 1;
		player_assaultcannondown1 ();
		return;
	}
	Attack_Finished (0.1);
};

void () player_assaultcannondown1 = [ 103, player_assaultcannondown1 ]
{
	local entity tcool;

	if (self.flags & 512)
	{
		if (self.count == 1)
		{
			sound (self, 1, "weapons/asscan3.wav", 1, 1);
		}
		if (self.count >= 15)
		{
			self.heat = 0;
			self.fire_held_down = 0;
			self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
			TeamFortress_SetSpeed (self);
			if (((self.ammo_shells < 1) || (self.ammo_cells < 7)))
			{
				self.last_weapon = self.current_weapon;
				self.last_weaponmode = self.weaponmode;
				self.current_weapon = W_BestWeapon ();
				W_SetCurrentAmmo ();
				W_PrintWeaponMessage ();
				return;
			}
			player_run ();
			return;
		}
		if ((((self.count != 8) && (self.count != enter)) && (self.count != 12)) && (self.count != 14))
		{
			if ((self.weaponframe == 3))
			{
				self.weaponframe = 0;
			}
			else
			{
				self.weaponframe = (self.weaponframe + 1);
			}
		}
		self.count = (self.count + 1);
		Attack_Finished (0.1);
	}
	else
	{
		self.heat = 0;
		self.fire_held_down = 0;
		self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self);
		if (self.ammo_shells < 1 || self.ammo_cells < 7)
		{
			self.last_weapon = self.current_weapon;
			self.last_weaponmode = self.weaponmode;
			self.current_weapon = W_BestWeapon ();
			W_SetCurrentAmmo ();
			W_PrintWeaponMessage ();
			return;
		}
		player_run ();
		return;
	}
};