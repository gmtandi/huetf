//=-=-=-=-=

void () TeamFortress_ReloadCurrentWeapon =
{
	local float rt;
	local entity tWeapon;

	if ((self.tfstate & 2))
	{
		return;
	}
	if ((self.playerclass == 11))
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
			sprint (self, 2, "out of shells.\n");
			return;
		}
		if ((self.reload_shotgun == 0))
		{
			sprint (self, 2, "clip full.\n");
			return;
		}
		if (((8 - self.reload_shotgun) == self.ammo_shells))
		{
			sprint (self, 2, "all shells are in the clip.\n");
			return;
		}
		if ((self.reload_shotgun < self.ammo_shells))
		{
			Attack_Finished (0.4);
			rt = ((8 - self.reload_shotgun) / 8);
			rt = (2 - (2 * rt));
			self.reload_shotgun = 0;
			if ((self.ammo_shells < 8))
			{
				self.reload_shotgun = (8 - self.ammo_shells);
			}
			sprint (self, 2, "reloading... \n");
			self.tfstate = (self.tfstate | 2);
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
			sprint (self, 2, "not enough ammo to reload\n");
		}
	}
	else
	{
		if ((self.current_weapon == 256))
		{
			if ((self.ammo_shells == 0))
			{
				sprint (self, 2, "out of shells.\n");
				return;
			}
			if ((self.reload_super_shotgun == 0))
			{
				sprint (self, 2, "clip full.\n");
				return;
			}
			if (((16 - self.reload_super_shotgun) == self.ammo_shells))
			{
				sprint (self, 2, "all shells are in the clip.\n");
				return;
			}
			if ((self.reload_super_shotgun < self.ammo_shells))
			{
				Attack_Finished (0.7);
				rt = ((16 - self.reload_super_shotgun) / 16);
				rt = (3 - (3 * rt));
				self.reload_super_shotgun = 0;
				if ((self.ammo_shells < 16))
				{
					self.reload_super_shotgun = (16 - self.ammo_shells);
				}
				sprint (self, 2, "reloading...\n");
				self.tfstate = (self.tfstate | 2);
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
				sprint (self, 2, "not enough ammo to reload\n");
			}
		}
		else
		{
			if ((self.current_weapon == 2048))
			{
				if ((self.ammo_rockets == 0))
				{
					sprint (self, 2, "out of grenades.\n");
					return;
				}
				if ((self.reload_grenade_launcher == 0))
				{
					sprint (self, 2, "clip full.\n");
					return;
				}
				if (((6 - self.reload_grenade_launcher) == self.ammo_rockets))
				{
					sprint (self, 2, "all grenades are in the clip.\n");
					return;
				}
				if ((self.reload_grenade_launcher < self.ammo_rockets))
				{
					Attack_Finished (0.6);
					rt = ((6 - self.reload_grenade_launcher) / 6);
					rt = (4 - (4 * rt));
					self.reload_grenade_launcher = 0;
					if ((self.ammo_rockets < 6))
					{
						self.reload_grenade_launcher = (6 - self.ammo_rockets);
					}
					sprint (self, 2, "reloading...\n");
					self.tfstate = (self.tfstate | 2);
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
					sprint (self, 2, "not enough ammo to reload\n");
				}
			}
			else
			{
				if ((self.current_weapon == 8192))
				{
					if ((self.ammo_rockets == 0))
					{
						sprint (self, 2, "out of rockets.\n");
						return;
					}
					if ((self.reload_rocket_launcher == 0))
					{
						sprint (self, 2, "clip full.\n");
						return;
					}
					if (((4 - self.reload_rocket_launcher) == self.ammo_rockets))
					{
						sprint (self, 2, "all rockets are in the clip.\n");
						return;
					}
					if ((self.reload_rocket_launcher < self.ammo_rockets))
					{
						Attack_Finished (0.8);
						rt = ((4 - self.reload_rocket_launcher) / 4);
						rt = (5 - (5 * rt));
						self.reload_rocket_launcher = 0;
						if ((self.ammo_rockets < 4))
						{
							self.reload_rocket_launcher = (4 - self.ammo_rockets);
						}
						sprint (self, 2, "reloading...\n");
						self.tfstate = (self.tfstate | 2);
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
						sprint (self, 2, "not enough ammo to reload\n");
					}
				}
			}
		}
	}
};
