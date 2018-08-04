//=-=-=-=-=
void () TeamFortress_MOTD =
{
	local string ya;

	if ((self.motd <= 20))
	{
		self.motd = (self.motd + 1);
		return;
	}
	if ((self.motd == 21))
	{
		if ((0 == 0))
		{
			self.tfstate = (self.tfstate | 4096);
		}
		if (((teamplay != 0) && (self.team_no == 0)))
		{
			stuffcmd (self, "color ");
			ya = ftos (0);
			stuffcmd (self, ya);
			stuffcmd (self, "\n");
			stuffcmd (self, "team observe\n");
		}
		if (self.get_aliases)
		{
			sprint (self, 2, "\n\n\n");
		}
                sprint (self, 2, "Oz Team Fortress v1.45\nhttp://ap.qgl.org/mercury/\n");
//		sprint (self, 2, "Hue Team Fortress v1.45\nhttp://github.com/gmtandi/huetf\n");
		self.menu_displaytime = 0;
		self.current_menu = 5;
		self.menu_count = 30;
		self.motd = 22;
		if (!self.get_aliases)
		{
			return;
		}
		sprint (self, 2, "binding aliases...\n");
		TeamFortress_Alias ("inv", redlamp, 0);
		TeamFortress_Alias ("showtf", yellowlamp, 0);
		TeamFortress_Alias ("autozoom", 174, 0);
		TeamFortress_Alias ("changeclass", _c, 0);
		TeamFortress_Alias ("changeteam", __, 0);
		TeamFortress_Alias ("scout", (_d + 1), 0);
		TeamFortress_Alias ("sniper", (_d + 2), 0);
		TeamFortress_Alias ("soldier", (_d + 3), 0);
		TeamFortress_Alias ("demoman", (_d + 4), 0);
		TeamFortress_Alias ("medic", (_d + 5), 0);
		TeamFortress_Alias ("hwguy", (_d + 6), 0);
		TeamFortress_Alias ("pyro", (_d + 7), 0);
		TeamFortress_Alias ("spy", (_d + 8), 0);
		TeamFortress_Alias ("engineer", (_d + 9), 0);
		TeamFortress_Alias ("randompc", (_d + enter), 0);
		TeamFortress_Alias ("elect", _R, 0);
		TeamFortress_Alias ("yes", _S, 0);
		TeamFortress_Alias ("no", _T, 0);
		TeamFortress_Alias ("break", _U, 0);
		TeamFortress_Alias ("about", _W, 0);
		TeamFortress_Alias ("modstatus", _Y, 0);
		return;
	}
	if ((self.motd <= _A))
	{
		self.motd = (self.motd + 1);
	}
	if ((self.motd == 30))
	{
		TeamFortress_Alias ("showfrags", _H, 0);
		TeamFortress_Alias ("showstats", _J, 0);
		TeamFortress_Alias ("detpipe", 170, 0);
		TeamFortress_Alias ("reload", 173, 0);
		TeamFortress_Alias ("scansound", 162, 0);
		TeamFortress_Alias ("autoscan", 159, 0);
		TeamFortress_Alias ("scanf", 161, 0);
		TeamFortress_Alias ("scane", 160, 0);
		return;
	}
	if ((self.motd == 35))
	{
		TeamFortress_Alias ("primeone", 150, 0);
		TeamFortress_Alias ("primetwo", 151, 0);
		TeamFortress_Alias ("throwgren", 152, 0);
		TeamFortress_Alias ("+gren1", 150, 0);
		TeamFortress_Alias ("+gren2", 151, 0);
		TeamFortress_Alias ("-gren1", 152, 0);
		TeamFortress_Alias ("-gren2", 152, 0);
		TeamFortress_Alias ("showclasses", 144, 0);
		TeamFortress_Alias ("query", _w, 0);
		TeamFortress_Alias ("flash", _V, 0);
		return;
	}
	if ((self.motd == 40))
	{
		TeamFortress_Alias ("dropammo", 172, 0);
		TeamFortress_Alias ("dropitems", 194, 0);
		TeamFortress_Alias ("showloc", _v, 0);
		TeamFortress_Alias ("special", 171, 0);
		TeamFortress_Alias ("saveme", 181, 0);
		TeamFortress_Alias ("discard", 184, 0);
		TeamFortress_Alias ("id", 185, 0);
		TeamFortress_Alias ("showfps", _I, 0);
		return;
	}
	if ((self.motd == minus))
	{
		TeamFortress_Alias ("flaginfo", 23, 0);
		TeamFortress_Alias ("maphelp", 131, 0);
		TeamFortress_Alias ("commands", _X, 0);
		TeamFortress_Alias ("tracking", 41, 0);
		TeamFortress_Alias ("track_player", 42, 0);
		TeamFortress_Alias ("track_tfgoal", 43, 0);
		TeamFortress_Alias ("track_sentry", 44, 0);
		TeamFortress_Alias ("pan_in", _p, 0);
		TeamFortress_Alias ("pan_out", _q, 0);
		stuffcmd (self, "bind 9 \"impulse 9\"\n");
		stuffcmd (self, "bind 0 \"impulse 10\"\n");
		return;
	}
	if ((self.motd == _4))
	{
		TeamFortress_Alias ("sbar_on", 182, 0);
		TeamFortress_Alias ("sbar_off", 183, 0);
		TeamFortress_Alias ("sbar_200", _G, 1);
		TeamFortress_Alias ("sbar_240", _G, 2);
		TeamFortress_Alias ("sbar_300", _G, 3);
		TeamFortress_Alias ("sbar_350", _G, 4);
		TeamFortress_Alias ("sbar_384", _G, 5);
		TeamFortress_Alias ("sbar_400", _G, 6);
		TeamFortress_Alias ("sbar_480", _G, 7);
		TeamFortress_Alias ("sbar_600", _G, 8);
		TeamFortress_Alias ("sbar_768", _G, 9);

		TeamFortress_Alias ("bot", BOT_IMPULSE, 0);
		return;
	}
	if ((self.motd == 60))
	{
		if (tfstrike)
		{
			TeamFortress_Alias ("+bomb", 166, 0);
			TeamFortress_Alias ("-bomb", 169, 0);
			TeamFortress_Alias ("dropbomb", 180, 0);
			return;
		}
		else
		{
			TeamFortress_Alias ("+det5", 164, 0);
			TeamFortress_Alias ("-det5", 169, 0);
			TeamFortress_Alias ("+det20", 165, 0);
			TeamFortress_Alias ("-det20", 169, 0);
			TeamFortress_Alias ("+det50", 166, 0);
			TeamFortress_Alias ("-det50", 169, 0);
			TeamFortress_Alias ("+det255", 167, 0);
			TeamFortress_Alias ("-det255", 169, 0);
			return;
		}
	}
	if ((self.motd == _A))
	{
		TeamFortress_Alias ("disguise", 177, 0);
		TeamFortress_Alias ("feign", 178, 0);
		TeamFortress_Alias ("sfeign", 199, 0);
		TeamFortress_Alias ("build", 179, 0);
		TeamFortress_Alias ("detsentry", 188, 0);
		TeamFortress_Alias ("detdispenser", 187, 0);
		TeamFortress_Alias ("detdispenser", 187, 0);
		if (self.is_admin)
		{
			if (self.get_admin_aliases)
			{
				Admin_Aliases ();
			}
		}
		self.get_aliases = 0;
	}
};

void () TeamFortress_HelpMap =
{
	local entity te;

	te = find (world, classname, "info_tfdetect");
	if (te)
	{
		if ((te.non_team_broadcast != string_null))
		{
			sprint (self, 2, te.non_team_broadcast);
			return;
		}
	}
	sprint (self, 2, "There is no help for this map.\n");
};
