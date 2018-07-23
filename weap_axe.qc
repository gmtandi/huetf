//@import - weapons.qc
void (vector org, float damage) SpawnBlood;

//@import - tfort.qc
float (vector veca, vector vecb) crossproduct;

//=-=-=-=-=
void () TeamFortress_Axe;
void () W_FireAxe;
//=-=-=-=-=

void () TeamFortress_Axe = {
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