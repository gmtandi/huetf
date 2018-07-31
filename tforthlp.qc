//=-=-=-=-=
void () TeamFortress_MOTD =
{
	local string ya;

	if (self.motd <= 20)
	{
		self.motd = (self.motd + 1);
		return;
	}
	if (self.motd == 21)
	{
		if (0 == 0)
		{
			self.tfstate = (self.tfstate | TFSTATE_ZOOMOFF);
		}
		if ((teamplay != 0) && (self.team_no == 0))
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
		sprint (self, 2, "Hue Team Fortress v1.45\nhttp://github.com/gmtandi/huetf\n");
		self.menu_displaytime = 0;
		self.current_menu = 5;
		self.menu_count = 30;
		self.motd = 22;
		if (!self.get_aliases)
		{
			return;
		}
		sprint (self, 2, "binding aliases...\n");
		TeamFortress_Alias ("inv", 135, 0);
		TeamFortress_Alias ("showtf", 136, 0);
		TeamFortress_Alias ("autozoom", 174, 0);
		TeamFortress_Alias ("changeclass", 99, 0);
		TeamFortress_Alias ("changeteam", __, 0);
		TeamFortress_Alias ("scout", (100 + 1), 0);
		TeamFortress_Alias ("sniper", (100 + 2), 0);
		TeamFortress_Alias ("soldier", (100 + 3), 0);
		TeamFortress_Alias ("demoman", (100 + 4), 0);
		TeamFortress_Alias ("medic", (100 + 5), 0);
		TeamFortress_Alias ("hwguy", (100 + 6), 0);
		TeamFortress_Alias ("pyro", (100 + 7), 0);
		TeamFortress_Alias ("spy", (100 + 8), 0);
		TeamFortress_Alias ("engineer", (100 + 9), 0);
		TeamFortress_Alias ("randompc", (100 + enter), 0);
		TeamFortress_Alias ("elect", 82, 0);
		TeamFortress_Alias ("yes", 83, 0);
		TeamFortress_Alias ("no", 84, 0);
		TeamFortress_Alias ("break", 85, 0);
		TeamFortress_Alias ("about", 87, 0);
		TeamFortress_Alias ("modstatus", 89, 0);
		return;
	}
	if (self.motd <= 65)
	{
		self.motd = (self.motd + 1);
	}
	if (self.motd == 30)
	{
		TeamFortress_Alias ("showfrags", 72, 0);
		TeamFortress_Alias ("showstats", 74, 0);
		TeamFortress_Alias ("detpipe", 170, 0);
		TeamFortress_Alias ("reload", 173, 0);
		TeamFortress_Alias ("scansound", 162, 0);
		TeamFortress_Alias ("autoscan", 159, 0);
		TeamFortress_Alias ("scanf", 161, 0);
		TeamFortress_Alias ("scane", 160, 0);
		return;
	}
	if (self.motd == 35)
	{
		TeamFortress_Alias ("primeone", 150, 0);
		TeamFortress_Alias ("primetwo", 151, 0);
		TeamFortress_Alias ("throwgren", 152, 0);
		TeamFortress_Alias ("+gren1", 150, 0);
		TeamFortress_Alias ("+gren2", 151, 0);
		TeamFortress_Alias ("-gren1", 152, 0);
		TeamFortress_Alias ("-gren2", 152, 0);
		TeamFortress_Alias ("showclasses", 144, 0);
		TeamFortress_Alias ("query", 119, 0);
		TeamFortress_Alias ("flash", 86, 0);
		return;
	}
	if (self.motd == 40)
	{
		TeamFortress_Alias ("dropammo", 172, 0);
		TeamFortress_Alias ("dropitems", 194, 0);
		TeamFortress_Alias ("showloc", 118, 0);
		TeamFortress_Alias ("special", 171, 0);
		TeamFortress_Alias ("saveme", 181, 0);
		TeamFortress_Alias ("discard", 184, 0);
		TeamFortress_Alias ("id", 185, 0);
		TeamFortress_Alias ("showfps", 73, 0);
		return;
	}
	if (self.motd == 45)
	{
		TeamFortress_Alias ("flaginfo", 23, 0);
		TeamFortress_Alias ("maphelp", 131, 0);
		TeamFortress_Alias ("commands", 88, 0);
		TeamFortress_Alias ("tracking", 41, 0);
		TeamFortress_Alias ("track_player", 42, 0);
		TeamFortress_Alias ("track_tfgoal", 43, 0);
		TeamFortress_Alias ("track_sentry", 44, 0);
		TeamFortress_Alias ("pan_in", 112, 0);
		TeamFortress_Alias ("pan_out", 113, 0);
		stuffcmd (self, "bind 9 \"impulse 9\"\n");
		stuffcmd (self, "bind 0 \"impulse 10\"\n");
		return;
	}
	if (self.motd == 50)
	{
		TeamFortress_Alias ("sbar_on", 182, 0);
		TeamFortress_Alias ("sbar_off", 183, 0);
		TeamFortress_Alias ("sbar_200", 71, 1);
		TeamFortress_Alias ("sbar_240", 71, 2);
		TeamFortress_Alias ("sbar_300", 71, 3);
		TeamFortress_Alias ("sbar_350", 71, 4);
		TeamFortress_Alias ("sbar_384", 71, 5);
		TeamFortress_Alias ("sbar_400", 71, 6);
		TeamFortress_Alias ("sbar_480", 71, 7);
		TeamFortress_Alias ("sbar_600", 71, 8);
		TeamFortress_Alias ("sbar_768", 71, 9);

		TeamFortress_Alias ("bot", BOT_IMPULSE, 0);
		return;
	}
	if ((self.motd == 55))
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
	if ((self.motd == 60))
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
		return;
	}
	if ((self.motd == 65)) {
		TeamFortress_AliasCmd ("+huetf_rjump", "impulse 7;+attack;+jump");
		TeamFortress_AliasCmd ("-huetf_rjump", "-attack;-jump");
		TeamFortress_AliasCmd ("huetf_antiemp", "discard; huetf_drop_toss; huetf_drop_toss; huetf_drop_toss; huetf_drop_ditch; huetf_drop_ditch; huetf_drop_ditch; huetf_drop_ditch");
		TeamFortress_AliasCmd ("huetf_drop_ditch", "wait; dropammo; wait; impulse 1; wait");
		TeamFortress_AliasCmd ("huetf_drop_toss", "wait; dropammo; wait; impulse 3; wait");
		TeamFortress_AliasCmd ("huetf_drop_cell", "wait; dropammo; wait; impulse 4; wait");
		TeamFortress_AliasCmd ("+huetf_g1", "primeone; huetf_play_count; wait; primeone; huetf_play_count; wait; primeone; huetf_play_count; wait; primeone; huetf_play_count;");
		TeamFortress_AliasCmd ("-huetf_g1", "throwgren; wait; throwgren; wait; throwgren");
		TeamFortress_AliasCmd ("+huetf_g2", "primetwo; huetf_play_count;wait; primetwo; huetf_play_count;wait; primetwo; huetf_play_count;wait; primetwo; huetf_play_count;");
		TeamFortress_AliasCmd ("-huetf_g2", "throwgren; wait; throwgren; wait; throwgren");
		TeamFortress_AliasCmd ("huetf_play_count","play gren.wav");
		TeamFortress_AliasCmd ("huetf_g1","huetf_g1c1");
		TeamFortress_AliasCmd ("huetf_g1c1","primeone;huetf_play_count;alias huetf_g1 huetf_g1c2");
		TeamFortress_AliasCmd ("huetf_g1c2","throwgren; alias huetf_g1 huetf_g1c1");
       	TeamFortress_AliasCmd ("huetf_g2","huetf_g2c1");
        TeamFortress_AliasCmd ("huetf_g2c1","primetwo;huetf_play_count;alias huetf_g2 huetf_g2c2");
        TeamFortress_AliasCmd ("huetf_g2c2","throwgren; alias huetf_g2 huetf_g2c1");
		//stuffcmd(self, "msg_trigger huetf_play_count \"renade primed\"\n");
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
