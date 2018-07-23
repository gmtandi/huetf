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