//@import - buttons.qc
void () button_fire;

//@import - pc_engineer.qc
void (entity disp) Engineer_UseDispenser;
void (entity gun) Engineer_UseSentryGun;

//=-=-=-=-= Local Functions
void () TeamFortress_Spanner;
void () W_FireSpanner;
//=-=-=-=-= 

void () TeamFortress_Spanner = {
	self.currentammo = self.ammo_cells;
	self.weaponmodel = "progs/v_span.mdl";
	self.weaponframe = 0;
};

void () W_FireSpanner =
{
	local vector source;
	local vector org;
	local vector def;
	local float healam;
	local entity te;

	makevectors (self.v_angle);
	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), 0, self);
	if ((trace_fraction == 1))
	{
		return;
	}
	org = (trace_endpos - (v_forward * 4));
	if ((trace_ent.goal_activation & 8))
	{
		if (Activated (trace_ent, self))
		{
			DoResults (trace_ent, self, 1);
			if ((trace_ent.classname == "func_button"))
			{
				trace_ent.enemy = self;
				other = self;
				self = trace_ent;
				self.dont_do_triggerwork = 1;
				button_fire ();
				self = other;
			}
		}
		else
		{
			if ((trace_ent.else_goal != 0))
			{
				te = Findgoal (trace_ent.else_goal);
				if (te)
				{
					AttemptToActivate (te, self, trace_ent);
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
		}
		return;
	}
	if (trace_ent.takedamage)
	{
		if ((trace_ent.classname == "building_dispenser"))
		{
			Engineer_UseDispenser (trace_ent);
			return;
		}
		else
		{
			if ((trace_ent.classname == "building_sentrygun"))
			{
				Engineer_UseSentryGun (trace_ent);
				return;
			}
			else
			{
				if ((trace_ent.classname == "building_sentrygun_base"))
				{
					if (trace_ent.oldenemy)
					{
						Engineer_UseSentryGun (trace_ent.oldenemy);
					}
					return;
				}
				else
				{
					if ((trace_ent.classname == "player"))
					{
						if (((((trace_ent.team_no == self.team_no) && (self.team_no != 0)) && teamplay) || coop))
						{
							healam = enter;
							if ((self.ammo_cells < healam))
							{
								healam = self.ammo_cells;
							}
							if ((trace_ent.armortype == 0))
							{
								return;
							}
							if (((trace_ent.maxarmor - trace_ent.armorvalue) < (healam * 4)))
							{
								healam = ceil (((trace_ent.maxarmor - trace_ent.armorvalue) / 4));
							}
							if ((healam > 0))
							{
								trace_ent.armorvalue = (trace_ent.armorvalue + (healam * 4));
								if ((trace_ent.armorvalue > trace_ent.maxarmor))
								{
									trace_ent.armorvalue = trace_ent.maxarmor;
								}
								self.ammo_cells = (self.ammo_cells - healam);
								sound (trace_ent, 1, "items/r_item1.wav", 1, 1);
								WriteByte (4, 23);
								WriteByte (4, 2);
								WriteByte (4, 3);
								WriteCoord (4, org_x);
								WriteCoord (4, org_y);
								WriteCoord (4, org_z);
								multicast (org, 2);
								W_SetCurrentAmmo ();
							}
							return;
						}
					}
					trace_ent.axhitme = 1;
					SpawnBlood (org, 20);
					deathmsg = space;
					TF_T_Damage (trace_ent, self, self, 20, 2, 0);
				}
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