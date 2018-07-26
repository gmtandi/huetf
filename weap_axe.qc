//@import - player.qc
void () player_run;

//@import - tfort.qc
float (vector veca, vector vecb) crossproduct;

//@import - weapons.qc
void (vector org, float damage) SpawnBlood;
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void () TeamFortress_Axe;
void () W_FireAxe;
void () W_Axe_Attack;
void () player_axe1;
void () player_axe2;
void () player_axe3;
void () player_axe4;
void () player_axeb1;
void () player_axeb2;
void () player_axeb3;
void () player_axeb4;
void () player_axec1;
void () player_axec2;
void () player_axec3;
void () player_axec4;
void () player_axed1;
void () player_axed2;
void () player_axed3;
void () player_axed4;
//=-=-=-=-=

void () TeamFortress_Axe = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 0;	
	self.AttackFunction = W_Axe_Attack;
	self.currentammo = 0;
	if ((self.playerclass == PC_SPY))
	{
		if ((self.weaponmode == 0))
		{
			self.weaponmodel = "progs/v_knife.mdl";
		}
		else
		{
			self.weaponmodel = "progs/v_knife2.mdl";
		}
	}
	else
	{
		if (tfstrike)
		{
			self.weaponmodel = "progs/v_knife.mdl";
		}
		else
		{
			self.weaponmodel = "progs/v_axe.mdl";
		}
	}
	self.weaponframe = 0;
};

void () W_FireAxe =
{
	local vector source;
	local vector org;
	local vector def;

	makevectors (self.v_angle);
	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), 0, self);
	if ((trace_fraction == 1))
	{
		return;
	}
	org = (trace_endpos - (v_forward * 4));
	if (trace_ent.takedamage)
	{
		trace_ent.axhitme = 1;
		SpawnBlood (org, 20);
		if (((self.playerclass != 8) || (trace_ent.classname != "player")))
		{
			deathmsg = 17;
			TF_T_Damage (trace_ent, self, self, 20, 2, 0);
		}
		else
		{
			self.weaponmode = 1;
			self.weaponmodel = "progs/v_knife2.mdl";
			makevectors (trace_ent.v_angle);
			def = v_right;
			makevectors (self.v_angle);
			if ((crossproduct (def, v_forward) > 0))
			{
				deathmsg = 22;
				TF_T_Damage (trace_ent, self, self, _x, (2 | 1), 0);
			}
			else
			{
				deathmsg = 17;
				TF_T_Damage (trace_ent, self, self, 40, 2, 0);
			}
		}
	}
	else
	{
		sound (self, 1, "player/axhit2.wav", 1, 1);
		WriteByte (4, 23);
		WriteByte (4, 2);
		WriteByte (4, 3);
		WriteCoord (4, org_x);
		WriteCoord (4, org_y);
		WriteCoord (4, org_z);
		multicast (org, 2);
	}
};

void () W_Axe_Attack = {
	Attack_Finished (0.5);
	sound (self, 1, "weapons/ax1.wav", 1, 1);
	local float r = random ();
	if (r < 0.25)
		player_axe1 ();		
	else if (r < 0.5)
		player_axeb1 ();
	else if (r < 0.75)
		player_axec1 ();
	else
		player_axed1 ();
}

void () player_axe1 = [ 119, player_axe2 ]
{
	self.weaponframe = 1;
};

void () player_axe2 = [ 120, player_axe3 ]
{
	self.weaponframe = 2;
};

void () player_axe3 = [ 121, player_axe4 ]
{
	self.weaponframe = 3;
	W_FireAxe ();
};

void () player_axe4 = [ 122, player_run ]
{
	self.weaponframe = 4;
};

void () player_axeb1 = [ 125, player_axeb2 ]
{
	self.weaponframe = 5;
};

void () player_axeb2 = [ 126, player_axeb3 ]
{
	self.weaponframe = 6;
};

void () player_axeb3 = [ 127, player_axeb4 ]
{
	self.weaponframe = 7;
	W_FireAxe ();
};

void () player_axeb4 = [ 128, player_run ]
{
	self.weaponframe = 8;
};

void () player_axec1 = [ 131, player_axec2 ]
{
	self.weaponframe = 1;
};

void () player_axec2 = [ 132, player_axec3 ]
{
	self.weaponframe = 2;
};

void () player_axec3 = [ 133, player_axec4 ]
{
	self.weaponframe = 3;
	W_FireAxe ();
};

void () player_axec4 = [ 134, player_run ]
{
	self.weaponframe = 4;
};

void () player_axed1 = [ 137, player_axed2 ]
{
	self.weaponframe = 5;
};

void () player_axed2 = [ 138, player_axed3 ]
{
	self.weaponframe = 6;
};

void () player_axed3 = [ 139, player_axed4 ]
{
	self.weaponframe = 7;
	W_FireAxe ();
};

void () player_axed4 = [ 140, player_run ]
{
	self.weaponframe = 8;
};