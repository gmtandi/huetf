void () SpectatorDisconnect;
void () SpectatorImpulseCommand;
void () SpectatorThink;

void () SpectatorConnect =
{
	local string st;
	local float res;

	self.playerclass = 0;
	self.classname = "observer";
	self.flags = 8;
	self.ishuman = 1;
	st = infokey (self, "adminpwd");
	Admin_Check (st);
	st = infokey (self, "em");
	if ((st == string_null))
	{
		st = infokey (self, "exec_map");
	}
	if ((st == "on"))
	{
		stuffcmd (self, "exec spectator.cfg\n");
		stuffcmd (self, "exec ");
		stuffcmd (self, mapname);
		stuffcmd (self, ".cfg\n");
	}
	self.motd = 0;
	if (self.is_admin)
	{
		Admin_Aliases ();
	}
	CheckConnectRate ();
};

void () SpectatorDisconnect =
{
	updateMaxClients();
};

void () SpectatorImpulseCommand =
{
	local vector cam;

	if ((self.impulse == 239))
        {
                self.current_menu = 24;
                self.menu_count = 30;
                self.menu_displaytime = 0;
                self.impulse = 0;
                return;
        }


	if ((self.impulse == 1))
	{
		self.goalentity = find (self.goalentity, classname, "info_player_deathmatch");
		if ((self.goalentity == world))
		{
			self.goalentity = find (self.goalentity, classname, "info_player_deathmatch");
		}
		if ((self.goalentity != world))
		{
			setorigin (self, self.goalentity.origin);
			self.angles = self.goalentity.angles;
			self.fixangle = 1;
			self.last_impulse = self.impulse;
		}
		self.impulse = 0;
		return;
	}
	else
	{
		if ((self.impulse == 9))
		{
			fadetoblack ();
			self.impulse = 0;
			return;
		}
		else
		{
			if ((self.impulse == enter))
			{
				fadefromblack ();
				self.impulse = 0;
				return;
			}
			else
			{
				if ((self.impulse == 185))
				{
					TeamFortress_ID ();
					self.impulse = 0;
					return;
				}
				else
				{
					if ((self.impulse == 131))
					{
						TeamFortress_HelpMap ();
						self.impulse = 0;
						return;
					}
					else
					{
						if ((self.impulse == _w))
						{
							TeamFortress_StatusQuery ();
							self.impulse = 0;
							return;
						}
						else
						{
							if ((self.impulse == 145))
							{
								TeamFortress_TeamShowScores (0);
								self.impulse = 0;
								return;
							}
						}
					}
				}
			}
		}
	}
	CommandImpulses ();
	self.impulse = 0;
};

void () SpectatorThink =
{
	local vector cam;


	if (self.current_menu == 24) {
		Menu_Admin ();
		if (self.impulse > 0 && self.impulse < 11) {
			Menu_Admin_Input (self.impulse);
		}
	}

	Check_Track ();

	if (self.impulse)
	{
		SpectatorImpulseCommand ();
	}
	if ((self.motd <= _A))
	{
		TeamFortress_MOTD ();
	}
	if (((time > self.StatusRefreshTime) && (self.StatusBarSize != 0)))
	{
		RefreshStatusBar ();
	}
};
