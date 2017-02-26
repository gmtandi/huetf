//=-=-=-=-=

void () TeamFortress_ReloadCurrentWeapon =
{
	local float rt;
	local entity tWeapon;

	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	if ((self.playerclass == SBAR_200))
	{
		return;
	}
	if (practice)
	{
		return;
	}
	if ((self.current_weapon == 128))
	{
		if ((self.ammo_shells == 0))
		{
			sprint (self, SBAR_PRINT, "out of shells.\n");
			return;
		}
		if ((self.reload_shotgun == 0))
		{
			sprint (self, SBAR_PRINT, "clip full.\n");
			return;
		}
		if (((8 - self.reload_shotgun) == self.ammo_shells))
		{
			sprint (self, SBAR_PRINT, "all shells are in the clip.\n");
			return;
		}
		if ((self.reload_shotgun < self.ammo_shells))
		{
			Attack_Finished (0.4);
			rt = ((8 - self.reload_shotgun) / 8);
			rt = (SBAR_PRINT - (SBAR_PRINT * rt));
			self.reload_shotgun = 0;
			if ((self.ammo_shells < 8))
			{
				self.reload_shotgun = (8 - self.ammo_shells);
			}
			sprint (self, SBAR_PRINT, "reloading... \n");
			self.tfstate = (self.tfstate | SBAR_PRINT);
			tWeapon = spawn ();
			tWeapon.owner = self;
			tWeapon.classname = "timer";
			tWeapon.nextthink = (time + rt);
			tWeapon.think = W_Reload_shotgun;
			self.weaponmodel = "";
			self.weaponframe = 0;
		}
		else
		{
			sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
		}
	}
	else
	{
		if ((self.current_weapon == 256))
		{
			if ((self.ammo_shells == 0))
			{
				sprint (self, SBAR_PRINT, "out of shells.\n");
				return;
			}
			if ((self.reload_super_shotgun == 0))
			{
				sprint (self, SBAR_PRINT, "clip full.\n");
				return;
			}
			if (((SBAR_240 - self.reload_super_shotgun) == self.ammo_shells))
			{
				sprint (self, SBAR_PRINT, "all shells are in the clip.\n");
				return;
			}
			if ((self.reload_super_shotgun < self.ammo_shells))
			{
				Attack_Finished (0.7);
				rt = ((SBAR_240 - self.reload_super_shotgun) / SBAR_240);
				rt = (AS_MELEE - (AS_MELEE * rt));
				self.reload_super_shotgun = 0;
				if ((self.ammo_shells < SBAR_240))
				{
					self.reload_super_shotgun = (SBAR_240 - self.ammo_shells);
				}
				sprint (self, SBAR_PRINT, "reloading...\n");
				self.tfstate = (self.tfstate | SBAR_PRINT);
				tWeapon = spawn ();
				tWeapon.owner = self;
				tWeapon.classname = "timer";
				tWeapon.nextthink = (time + rt);
				tWeapon.think = W_Reload_super_shotgun;
				self.weaponmodel = "";
				self.weaponframe = 0;
			}
			else
			{
				sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
			}
		}
		else
		{
			if ((self.current_weapon == 2048))
			{
				if ((self.ammo_rockets == 0))
				{
					sprint (self, SBAR_PRINT, "out of grenades.\n");
					return;
				}
				if ((self.reload_grenade_launcher == 0))
				{
					sprint (self, SBAR_PRINT, "clip full.\n");
					return;
				}
				if (((6 - self.reload_grenade_launcher) == self.ammo_rockets))
				{
					sprint (self, SBAR_PRINT, "all grenades are in the clip.\n");
					return;
				}
				if ((self.reload_grenade_launcher < self.ammo_rockets))
				{
					Attack_Finished (0.6);
					rt = ((6 - self.reload_grenade_launcher) / 6);
					rt = (AS_MISSILE - (AS_MISSILE * rt));
					self.reload_grenade_launcher = 0;
					if ((self.ammo_rockets < 6))
					{
						self.reload_grenade_launcher = (6 - self.ammo_rockets);
					}
					sprint (self, SBAR_PRINT, "reloading...\n");
					self.tfstate = (self.tfstate | SBAR_PRINT);
					tWeapon = spawn ();
					tWeapon.owner = self;
					tWeapon.classname = "timer";
					tWeapon.nextthink = (time + rt);
					tWeapon.think = W_Reload_grenade_launcher;
					self.weaponmodel = "";
					self.weaponframe = 0;
				}
				else
				{
					sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
				}
			}
			else
			{
				if ((self.current_weapon == 8192))
				{
					if ((self.ammo_rockets == 0))
					{
						sprint (self, SBAR_PRINT, "out of rockets.\n");
						return;
					}
					if ((self.reload_rocket_launcher == 0))
					{
						sprint (self, SBAR_PRINT, "clip full.\n");
						return;
					}
					if (((AS_MISSILE - self.reload_rocket_launcher) == self.ammo_rockets))
					{
						sprint (self, SBAR_PRINT, "all rockets are in the clip.\n");
						return;
					}
					if ((self.reload_rocket_launcher < self.ammo_rockets))
					{
						Attack_Finished (0.8);
						rt = ((AS_MISSILE - self.reload_rocket_launcher) / AS_MISSILE);
						rt = (5 - (5 * rt));
						self.reload_rocket_launcher = 0;
						if ((self.ammo_rockets < AS_MISSILE))
						{
							self.reload_rocket_launcher = (AS_MISSILE - self.ammo_rockets);
						}
						sprint (self, SBAR_PRINT, "reloading...\n");
						self.tfstate = (self.tfstate | SBAR_PRINT);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + rt);
						tWeapon.think = W_Reload_rocket_launcher;
						self.weaponmodel = "";
						self.weaponframe = 0;
					}
					else
					{
						sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
					}
				}
			}
		}
	}
};
