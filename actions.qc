void () TeamFortress_SaveMe =
{
	local entity te;
	local entity tl;
	local float dist;
	local string savememsg,locname,needvalue;	

	savememsg = string_null;
	if ((self.last_sound < time))
	{
		if ((random () < 0.8))
		{
			sound (self, 1, "speech/saveme1.wav", 1, 1);
		}
		else
		{
			sound (self, 1, "speech/saveme2.wav", 1, 1);
		}
		self.last_sound = (time + 4);
	}
	te = find (world, classname, "player");
	while (te)
	{
		if (((((self == te) || (te.playerclass == 5)) || (te.playerclass == 9)) || (te.playerclass == 8)))
		{
			if ((((te.team_no == self.team_no) && (self.team_no != 0)) || (te.playerclass == 8)))
			{
				if (visible (te))
				{
					msg_entity = te;
					tl = spawn ();
					tl.origin = self.origin;
					tl.origin_z = (tl.origin_z + space);
					WriteByte (1, 23);
					WriteByte (1, 9);
					WriteEntity (1, tl);
					WriteCoord (1, tl.origin_x);
					WriteCoord (1, tl.origin_y);
					WriteCoord (1, (tl.origin_z + 24));
					WriteCoord (1, self.origin_x);
					WriteCoord (1, self.origin_y);
					WriteCoord (1, self.origin_z);
					dremove (tl);
				}
				if ((te.playerclass == 5) || (te.playerclass == 9)) {
					local float send = 0;
					if ((self.health < (self.max_health/1.25)) || (self.armorvalue < (self.maxarmor/1.25))) {
						dist = vlen(self.origin - te.origin);
						if (dist < 2500) {
							locname = getLocationName(self.origin);
							if ((te.playerclass == 5) && (self.health < (self.max_health/1.25))) {
								send = 1;
								savememsg = strcat(self.netname," needs health");
								if (locname != "someplace") {
									savememsg = strcat(savememsg, "\n");
								} else {
									savememsg = strcat(savememsg, " ");
								}	
								needvalue = strcat("h:", ftos(self.health));
								savememsg = strcat(savememsg, needvalue);				
							}
							if ((te.playerclass == 9) && (self.armorvalue < (self.maxarmor/1.25))) {
								send = 1;
								savememsg = strcat(self.netname," needs armor");
								if (locname != "someplace") {
									savememsg = strcat(savememsg, "\n");
								} else {
									savememsg = strcat(savememsg, " ");
								}	
								needvalue = strcat("a:", ftos(self.armorvalue));
								savememsg = strcat(savememsg, needvalue);					
							}

							if (locname != "someplace") {
								savememsg = strcat(strcat(savememsg, " @"),locname);
							}
							if (send) {
								savememsg = strcat(savememsg,"\n");
								CenterPrint2 (te,"\n",savememsg);
							}
						}
					}
				}
				
				//if (d) {
					//CenterPrint2 (te,"\n\n\n", ftos(vlen(dist)));
				//}

			}
		}
		te = find (te, classname, "player");
	}
};

void () TeamFortress_ID =
{
	local vector src;
	local string st;
	local string cls;

	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	traceline (src, (src + (v_forward * 2048)), 0, self);
	if (((trace_ent != world) && (trace_ent.origin != world.origin)))
	{
		if (((trace_ent.classname == "player") && (trace_ent.health > 0)))
		{
			if (((trace_ent.is_feigning && (self.team_no != 0)) && (self.team_no != trace_ent.team_no)))
			{
				return;
			}
			self.StatusRefreshTime = (time + 1.5);
			if ((((self.team_no != 0) && (self.team_no == trace_ent.team_no)) || (self.classname == "observer")))
			{
				cls = TeamFortress_GetClassName (trace_ent.playerclass);
				if ((self.playerclass == 5))
				{
					st = ftos (rint (trace_ent.health));
					centerprint7 (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls, "\n", st, " health\n");
					return;
				}
				else
				{
					if ((self.playerclass == 9))
					{
						st = ftos (rint (trace_ent.armorvalue));
						centerprint7 (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls, "\n", st, " armor\n");
						return;
					}
				}
				centerprint4 (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls);
				return;
			}
			if ((trace_ent.playerclass == 8))
			{
				cls = TeamFortress_GetClassName (trace_ent.undercover_skin);
				if (((self.team_no != 0) && (self.team_no == trace_ent.undercover_team)))
				{
					if ((self.playerclass == 5))
					{
						st = ftos (rint (trace_ent.health));
						if ((trace_ent.undercover_skin != 0))
						{
							centerprint7 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls, "\n", st, " health\n");
						}
						else
						{
							centerprint5 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n", st, " health\n");
						}
						return;
					}
					else
					{
						if ((self.playerclass == 9))
						{
							st = ftos (rint (trace_ent.armorvalue));
							if ((trace_ent.undercover_skin != 0))
							{
								centerprint7 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls, "\n", st, " armor\n");
							}
							else
							{
								centerprint5 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n", st, " armor\n");
							}
							return;
						}
						else
						{
							st = ftos (rint (trace_ent.armorvalue));
							if ((trace_ent.undercover_skin != 0))
							{
								centerprint4 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls);
							}
							else
							{
								centerprint3 (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n");
							}
							return;
						}
					}
				}
				if ((trace_ent.undercover_name != string_null))
				{
					if ((trace_ent.undercover_skin != 0))
					{
						centerprint4 (self, "\n\n\n\n", trace_ent.undercover_name, "\nEnemy ", cls);
					}
					else
					{
						centerprint3 (self, "\n\n\n\n", trace_ent.undercover_name, "\nEnemy Spy");
					}
				}
				else
				{
					if ((trace_ent.undercover_skin != 0))
					{
						centerprint4 (self, "\n\n\n\n", trace_ent.netname, "\nEnemy ", cls);
					}
					else
					{
						centerprint3 (self, "\n\n\n\n", trace_ent.netname, "\nEnemy Spy");
					}
				}
			}
			else
			{
				cls = TeamFortress_GetClassName (trace_ent.playerclass);
				centerprint4 (self, "\n\n\n\n", trace_ent.netname, "\nEnemy ", cls);
			}
		}
		else
		{
			if ((trace_ent.classname == "building_dispenser"))
			{
				self.StatusRefreshTime = (time + 1.5);
				if ((self == trace_ent.real_owner))
				{
					centerprint (self, "\n\n\n\nYour Dispenser");
				}
				else
				{
					centerprint2 (self, "\n\n\n\nDispenser made by ", trace_ent.real_owner.netname);
				}
			}
			else
			{
				if (((trace_ent.classname == "building_sentrygun") || (trace_ent.classname == "building_sentrygun_base")))
				{
					self.StatusRefreshTime = (time + 1.5);
					if ((self == trace_ent.real_owner))
					{
						centerprint (self, "\n\n\n\nYour SentryGun");
					}
					else
					{
						if (!teamplay)
						{
							centerprint2 (self, "\n\n\n\nSentrygun made by\n", trace_ent.real_owner.netname);
						}
						else
						{
							if ((((self.team_no != 0) && (self.team_no == trace_ent.team_no)) || !self.playerclass))
							{
								centerprint2 (self, "\n\n\n\nFriendly Sentrygun made by\n", trace_ent.real_owner.netname);
							}
							else
							{
								centerprint2 (self, "\n\n\n\nEnemy Sentrygun made by\n", trace_ent.real_owner.netname);
							}
						}
					}
				}
			}
		}
	}
};
