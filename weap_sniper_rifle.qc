//@import - weapons.qc
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void  () TeamFortress_SniperRifle;
void  () W_FireSniperRifle;
float () W_Check_Reload_SniperRifle;
void  () W_Reload_SniperRifle_Start;
void  () W_Reload_SniperRifle_Finish;
void () player_sniperrifle1;
void () player_sniperrifle2;
void () player_sniperrifle3;
void () player_sniperrifle4;
void () player_sniperrifle5;
void () player_sniperrifle6;
void () W_Attack_SniperRifle;
//=-=-=-=-=

void () TeamFortress_SniperRifle = 
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 1;
	self.AttackFunction 		= W_Attack_SniperRifle;
	self.CheckForReloadFunction = W_Check_Reload_SniperRifle;
	self.ReloadStartFunction    = W_Reload_SniperRifle_Start;
	self.ReloadEndFunction 	    = W_Reload_SniperRifle_Finish;
	
	self.currentammo = self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_srifle.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = 1;
};

void () W_Attack_SniperRifle = 
{
	if (sniperpower) 
	{
		if (CheckForReload ())
		{
			return;
		}
		player_sniperrifle1 ();
		W_FireSniperRifle ();
		self.reload_sniper_rifle = (self.reload_sniper_rifle + 1);
		self.StatusRefreshTime = (time + 0.1);
		CheckForReload ();
		Attack_Finished (0.8);
	}
	else
	{
		player_sniperrifle1 ();
		W_FireSniperRifle ();
		Attack_Finished (1.7);
	}
};

void () W_FireSniperRifle = 
{
	local vector dir;
	local vector src;
	local float dam_mult;
	local float zdif;
	local float use_this;
	local float x;
	local vector f;
	local vector g;
	local vector h;

	sound (self, 1, "weapons/sniper.wav", 1, 1);
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	use_this = 0;
	traceline (src, (src + (dir * 8092)), 0, self);
	if ((trace_fraction != 1))
	{
		if ((trace_ent != world))
		{
			if ((trace_ent.classname == "player"))
			{
				use_this = 1;
			}
		}
	}
	KickPlayer (-4, self);
	if (!use_this)
	{
		dir = aim (self, 10000);
		traceline (src, (src + (dir * 3072)), 0, self);
	}
	deathmsg = COLOR_GREEN;
	dam_mult = 1;
	if (trace_ent)
	{
		if ((trace_ent.classname == "player"))
		{
			f = (trace_endpos - src);
			g_x = trace_endpos_x;
			g_y = trace_endpos_y;
			g_z = 0;
			h_x = trace_ent.origin_x;
			h_y = trace_ent.origin_y;
			h_z = 0;
			x = vlen ((g - h));
			f = ((normalize (f) * x) + trace_endpos);
			zdif = (f_z - trace_ent.origin_z);
			deathmsg = COLOR_GREEN;
			trace_ent.head_shot_vector = '0 0 0';
			if ((zdif < 0))
			{
				dam_mult = 0.5;
				trace_ent.leg_damage = (trace_ent.leg_damage + 1);
				TeamFortress_SetSpeed (trace_ent);
				deathmsg = 28;
				TF_T_Damage (trace_ent, self, self, (self.heat * dam_mult), 2, 1);
				if ((trace_ent.health > 0))
				{
					sprint (trace_ent, 0, "Leg injury!\n");
					sprint (self, 1, "Leg shot - that'll slow him down!\n");
				}
				return;
			}
			else
			{
				if ((zdif > 20))
				{
					dam_mult = 2;
					stuffcmd (trace_ent, "bf\n");
					trace_ent.head_shot_vector = (trace_ent.origin - self.origin);
					deathmsg = 29;
					TF_T_Damage (trace_ent, self, self, (self.heat * dam_mult), 2, 1);
					if ((trace_ent.health > 0))
					{
						sprint (trace_ent, 0, "Head injury!\n");
						sprint (self, 1, "Head shot - that's gotta hurt!\n");
					}
					return;
				}
				else
				{
					deathmsg = COLOR_GREEN;
				}
			}
		}
	}
	ClearMultiDamage ();
	if ((trace_fraction != 1))
	{
		TraceAttack ((self.heat * dam_mult), dir);
	}
	ApplyMultiDamage ();
};

float () W_Check_Reload_SniperRifle =
{
	local float rt;
	local entity tWeapon;
	
	if (((self.reload_sniper_rifle >= 1) && (self.ammo_shells > 0)))
	{
		self.reload_sniper_rifle = 0;						
		sprint (self, 2, "reloading... \n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + 5);
		tWeapon.think = W_Reload_SniperRifle_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
};

void () W_Reload_SniperRifle_Start =
{
	local float rt;
	local entity tWeapon;

	if ((self.ammo_shells == 0))
	{
		sprint (self, 2, "out of shells.\n");
		return;
	}
	if ((self.reload_sniper_rifle == 0))
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if (((4 - self.reload_sniper_rifle) == self.ammo_shells))
	{
		sprint (self, 2, "all shells are in the clip.\n");
		return;
	}
	if ((self.reload_sniper_rifle < self.ammo_shells))
	{
		Attack_Finished (0.8);
		rt = ((1 - self.reload_sniper_rifle) / 1);
		rt = (5 - (5 * rt));
		self.reload_sniper_rifle = 0;
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = self.ReloadEndFunction;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
}

void () W_Reload_SniperRifle_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_srifle.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () player_sniperrifle1 = [ 113, player_sniperrifle2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_sniperrifle2 = [ 114, player_sniperrifle3 ]
{
	self.weaponframe = 2;
};

void () player_sniperrifle3 = [ 115, player_sniperrifle4 ]
{
	self.weaponframe = 3;
};

void () player_sniperrifle4 = [ 116, player_sniperrifle5 ]
{
	self.weaponframe = 4;
};

void () player_sniperrifle5 = [ 117, player_sniperrifle6 ]
{
	self.weaponframe = 5;
};

void () player_sniperrifle6 = [ 118, player_run ]
{
	self.weaponframe = 6;
};