float () GetPlayerCount
{
	local entity te;
	local float tmp;
	te = find (world, classname, "player");
	while (te != world) {
		if (te.playerclass) {
			tmp = tmp + 1;
		}
		te = find (te, classname, "player");
	}
	return tmp;
}

string () GetPlayersName
{
	local entity te;
	local float tmp = 0;
	local float tmp2 = 0;
        local string st = "";

	while (tmp < number_of_teams) {
		tmp = tmp + 1;
		tmp2 = 0;
		te = find (world, classname, "player");
		while (te != world) {
			if (te.team_no == tmp && te.playerclass) {
				tmp2 = 1;
				st = strcat (st, "_");
				if (strlen(te.netname) <= 26) {
					st = strcat( st, te.netname );
				} else {
					st = strcat( st, substr(te.netname,0,25));
				}
			}
			te = find (te, classname, "player");
		}
		if (tmp2 == 1 && tmp != number_of_teams) {
			st = strcat ( st, "_VS");
		}
	}
        return (st);
};

void () AutoRecord =
{
	local float i;
	local string tmp;
	local entity t;

	if ((infokey (world, "serverdemo") != string_null))
	{
		return;
	}
	localcmd ("record ");

	t = find (world, classname, "prematch");
	if ((t != world))
	{
		if ((world.targetname != string_null))
		{
			calltimeofday ();

			localcmd (ftos (t.tf_items)); // year
			localcmd ("-");
			localcmd (ftos (t.armorclass + 1)); // month
			localcmd ("-");
			localcmd (ftos (t.tp_grenades_2)); // day
			localcmd ("_");
			localcmd (ftos (t.tp_grenades_1)); // hour
			localcmd ("-");
			localcmd (ftos (t.no_grenades_2)); // minute
//			localcmd ("-");
//			localcmd (ftos (t.no_grenades_1)); // second
		}
	}

	localcmd ("_[");
	localcmd (mapname);
	localcmd ("]_");


	if (tfvsdm)
	{
		localcmd ("tfvsdm");
	}
	else
	{
		if (tfstrike)
		{
			localcmd ("tfstrike");
		}
		else
		{
			if (duel)
			{
				localcmd ("duel");
			}
			else
			{
				if (speedcap)
				{
					localcmd ("speedcap");
				}
				else
				{
					if (practice)
					{
						localcmd ("practice");
					}
					else
					{
						if (clanbattle)
						{
							if (GetPlayerCount() < 8) {
								localcmd (GetPlayersName());
								localcmd ("\n");
								return;
							}
							localcmd ("clan");
						}
					}
				}
			}
		}
	}
	while ((i < number_of_teams))
	{
		i = (i + 1);
		tmp = GetTeamName (i);
		localcmd ("_");
		localcmd (tmp);
		if ((i < number_of_teams))
		{
			localcmd ("_vs");
		}
	}
	localcmd ("\n");
};

void () MatchOvertime =
{
	local float f2;

	if (cease_fire)
	{
		self.nextthink = (time + 1);
		return;
	}
	if (TeamFortress_CheckDraw ())
	{
		self.cnt2 = (self.cnt2 + 1);
		f2 = stof (infokey (world, "overtime"));
		if ((f2 > 0))
		{
			if ((self.cnt2 <= (f2 * 60)))
			{
				self.think = MatchOvertime;
				self.nextthink = (time + 1);
				return;
			}
		}
	}
	self.think = SUB_Remove;
	self.nextthink = (time + 0.5);
	NextLevel ();
};

void () MatchThink =
{
	local string tmp;

	if ((self.cnt == -1))
	{
		return;
	}
	if (cease_fire)
	{
		self.nextthink = (time + 1);
		return;
	}
	self.cnt2 = (self.cnt2 - 1);
	if (!TeamFortress_GetNoPlayers ())
	{
		NextLevel ();
		return;
	}
	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - 1);
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}
	if (!self.cnt2)
	{
		if (((self.cnt == 1) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (2, "", tmp, "‘ minute");
			if ((self.cnt != 1))
			{
				bprint (2, "s");
			}
			bprint (2, " remaining\n");
		}
		if (!self.cnt)
		{
			tmp = infokey (world, "overtime");
			if (stof (tmp))
			{
				if (TeamFortress_CheckDraw ())
				{
					bprint (2, "Draw, overtime set.\n Golden Cap WINS!!!\n");
					self.cnt2 = 0;
					MatchOvertime ();
					self.cnt = -1;
					return;
				}
			}
			self.think = SUB_Remove;
			self.nextthink = (time + 0.1);
			NextLevel ();
			return;
		}
	}
	if ((!self.cnt && (((self.cnt2 == 30) || (self.cnt2 == 15)) || (self.cnt2 <= enter))))
	{
		tmp = ftos (self.cnt2);
		bprint3 (2, "", tmp, "‘ second");
		if ((self.cnt2 != 1))
		{
			bprint (2, "s");
		}
		bprint (2, " remaining\n");
	}
	self.nextthink = (time + 1);
};

void () StartMatch =
{

	Initialise_Teams();

	local string st;
	local float f1;
	local float f2;
	local entity te;
	local entity oldself;
	local entity gren;

	lightstyle (0, "m");
	bprint (2, "MATCH BEGINS NOW\n");
	team4score = 0;
	team3score = 0;
	team2score = 0;
	team1score = 0;
	team4frags = 0;
	team3frags = 0;
	team2frags = 0;
	team1frags = 0;
	te = find (world, classname, "player");
	while (te)
	{
		oldself = self;
		self = te;
		if (self.hook_out)
		{
			Reset_Grapple (self.hook);
			Attack_Finished (0.75);
			self.hook_out = 1;
		}
		TeamFortress_RemoveTimers ();
		self.frags = 0;
		self.real_frags = 0;
		setspawnparms (self);
		PutClientInServer ();
		self = oldself;
		te = find (te, classname, "player");
	}
	gren = find (world, classname, "grenade");
	while (gren)
	{
		gren.think = GrenadeExplode;
		gren.nextthink = (time + 0.1);
		gren = find (gren, classname, "grenade");
	}
	freeze = 0;
	cb_prematch = 0;
	cease_fire = 0;
	te = find (world, classname, "prematch");
	te.classname = "match";
	te.cnt = (timelimit / 60);
	te.cnt2 = 60;
	if ((te.cnt == 0))
	{
		bprint (2, "Warning no timelimit set!\n");
		localcmd ("\nserverinfo status \"0 min left\"\n");
		te.cnt = -1;
		te.cnt2 = -1;
	}
	else
	{
		te.cnt = (te.cnt - 1);
		localcmd ("\nserverinfo status \"");
		st = ftos (te.cnt);
		localcmd (st);
		localcmd (" min left\"\n");
		te.think = MatchThink;
		te.nextthink = (time + 1);
	}
	st = infokey (world, "spectalk");
	f2 = stof (st);
	if (!f2)
	{
		st = "0";
	}
	localcmd ("sv_spectalk ");
	localcmd (st);
	localcmd ("\n");
	f1 = stof (infokey (world, "fpd"));
	f1 = ((f1 - (f1 & 64)) + (f2 * 64));
	localcmd ("serverinfo fpd ");
	st = ftos (f1);
	localcmd (st);
	localcmd ("\n");
	if (rounds)
	{
		StartRound ();
	}
};

void () PreMatch_Think =
{
	local entity p;
	local string num, tmp;
	local float fl;

	self.cnt2 = (self.cnt2 - 1);
	if ((self.cnt2 == 1))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				p.respawn_time = (time + 2);
				p.takedamage = 0;
				p.solid = 0;
				p.movetype = 0;
				p.modelindex = 0;
				p.model = string_null;
			}
			p = find (p, classname, "player");
		}
	}
	else
	{
		if (!self.cnt2)
		{
			self.nextthink = (time + 0.1);
			self.think = SUB_Remove;
			p = find (world, classname, "player");
			while ((p != world))
			{
				if ((p.netname != ""))
				{
					p.takedamage = 2;
					p.solid = 3;
					p.movetype = 3;
				}
				p = find (p, classname, "player");
			}
			StartMatch ();
			return;
		}
	}
	fl = (self.cnt2 / 60);
	if (((((((((((fl == 1) || (fl == 2)) || (fl == 3)) || (fl == 4)) || (fl == 5)) || (fl == 6)) || (fl == 7)) || (fl == 8)) || (fl == 9)) || (fl == enter)))
	{
		num = ftos (fl);
		bprint3 (2, "Match will begin in ", num, " minute(s).\n");
	}
	if ((self.cnt2 == 30))
	{
		num = ftos ((self.cnt2 / 60));
		bprint (2, "Match will begin in 30 seconds.\n");
	}
	if ((self.cnt2 <= enter))
	{
		if ((self.cnt2 == enter))
		{
			lightstyle (0, "e");
			if ((infokey (world, "status") != "Countdown"))
			{
				localcmd ("serverinfo status Countdown\n");
			}
			if ((stof (infokey (world, "demo_auto_left")) > 0))
			{
				AutoRecord ();
			}
		}
		num = ftos (self.cnt2);
		p = find (world, classname, "player");

		tmp = strcat(num ,"\n\n\b:[\b");
		tmp = strcat(tmp, mapname);
		tmp = strcat(tmp, "\b]:\b");

		tmp = strcat(tmp, "\n\bTeam1 :\b ");
		tmp = strcat(tmp, infokey(world, "team1"));

		tmp = strcat(tmp, " \bTeam2 :\b ");
		tmp = strcat(tmp, infokey(world, "team2"));

		tmp = strcat(tmp, "\n\bTL:\b ");
		tmp = strcat(tmp, infokey (world, "timelimit"));

		tmp = strcat(tmp, " \bFL:\b ");
		tmp = strcat(tmp, infokey (world, "fraglimit"));

		tmp = strcat(tmp, " \bTP:\b ");
		tmp = strcat(tmp, infokey (world, "teamplay"));


		tmp = strcat(tmp, "\n\bRJ:\b ");
		tmp = strcat(tmp, infokey (world, "rj"));

		tmp = strcat(tmp, " \bHook:\b ");
		if (infokey (world, "grapple") == "on")
			tmp = strcat(tmp, "on");
		else
			tmp = strcat(tmp, "off");

		tmp = strcat(tmp, "\n\bcr_sni:\b ");
		tmp = strcat(tmp, infokey(world, "cr_sniper"));

		tmp = strcat(tmp, " \bcr_sol:\b ");
		tmp = strcat(tmp, infokey(world, "cr_soldier"));

		tmp = strcat(tmp, " \bcr_spy:\b ");
		tmp = strcat(tmp, infokey(world, "cr_spy"));

		tmp = strcat(tmp, "\n\bIG:\b ");
		if (infokey (world, "ig") == "on")
			tmp = strcat(tmp, "on");
		else
			tmp = strcat(tmp, "off");

		tmp = strcat(tmp, " \bSGB2:\b ");
		if (infokey (world, "sgbuildlvl2") == "on")
			tmp = strcat(tmp, "on");
		else
			tmp = strcat(tmp, "off");

		tmp = strcat(tmp, " \bSG2T3:\b ");
		if (infokey (world, "sglvl2to3") == "on")
			tmp = strcat(tmp, "on");
		else
			tmp = strcat(tmp, "off");

		tmp = strcat(tmp, " \bautospanner:\b ");
		if (infokey (world, "autospanner") == "on")
			tmp = strcat(tmp, "on");
		else
			tmp = strcat(tmp, "off");

		strcat(tmp, "\n");


		while ((p != world))
		{
			if ((p.netname != ""))
			{
				CenterPrint3 (p, "Countdown ", tmp, "\n");
				if ((self.cnt2 < 6))
				{
					cease_fire = 0;
					stuffcmd (p, "play buttons/switch04.wav\n");
				}
			}
			p = find (p, classname, "player");
		}
		if ((self.cnt2 > 1))
		{
			bprint2 (2, num, " seconds.\n");
		}
		else
		{
			bprint (2, "1 second.\n");
		}
	}
	self.nextthink = (time + 1);
};

void () StartTimer =
{
	local entity timer;
	local entity p;
	local float f1;
	local string tmp;

	if ((clanbattle == 0))
	{
		if ((self != world))
		{
			sprint (self, 2, "Clan mode off....\n");
			sprint (self, 2, "Match cannot be started.\n");
		}
		else
		{
			dprint ("Clan mode off....\n");
			dprint ("Match cannot be started.\n");
		}
		return;
	}
	if (((clanbattle == 1) && (cb_prematch == 0)))
	{
		if ((self != world))
		{
			sprint (self, 2, "Clan Battle in progress....\n");
			sprint (self, 2, "Type break to stop the current battle.\n");
		}
		else
		{
			dprint ("Clan Battle in progress....\n");
			dprint ("Type break to stop the current battle.\n");
		}
		return;
	}
	if ((infokey (world, "status") == "Countdown"))
	{
		if ((self != world))
		{
			sprint (self, 2, "Countdown in progress....\n");
		}
		else
		{
			dprint ("Countdown in progress....\n");
		}
		return;
	}
	timer = find (world, classname, "prematch");
	while ((timer != world))
	{
		dremove (timer);
		timer = find (timer, classname, "prematch");
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 170))
	{
		bprint (2, "QiZmo:");
		if ((f1 & 2))
		{
			bprint (2, " פיםוע");
		}
		if ((f1 & 8))
		{
			bprint (2, " לבח");
		}
		if ((f1 & space))
		{
			bprint (2, " ומוםש");
		}
		if ((f1 & 128))
		{
			bprint (2, " נןימפ");
		}
		bprint (2, " disabled\n");
	}
	f1 = stof (infokey (world, "prematch"));
	timer = spawn ();
	timer.owner = world;
	timer.classname = "prematch";
	timer.cnt = 0;
	if (pmtime)
	{
		timer.cnt2 = rint ((pmtime * 60));
		if ((timer.cnt2 < 1))
		{
			timer.cnt2 = 1;
		}
	}
	else
	{
		lightstyle (0, "e");
		if ((stof (infokey (world, "demo_auto_left")) > 0))
		{
			AutoRecord ();
		}
		localcmd ("serverinfo status Countdown\n");
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				stuffcmd (p, "play items/protect2.wav\n");
			}
			p = find (timer, classname, "player");
		}
		timer.cnt2 = rint (stof (infokey (world, "count")));
		if ((timer.cnt2 < 1))
		{
			timer.cnt2 = 0;
		}
	}
	timer.cnt2 = (timer.cnt2 + 1);
	timer.nextthink = (time + 0.1);
	tmp = ftos (timer.cnt2);
	timer.think = PreMatch_Think;
};

void () StopTimer =
{
	local entity t;

	if ((infokey (world, "serverdemo") != string_null))
	{
		localcmd ("cancel\n");
	}
	if (cb_prematch)
	{
		t = find (world, classname, "prematch");
		while ((t != world))
		{
			t.nextthink = (time + 0.1);
			t.think = SUB_Remove;
			t = find (t, classname, "prematch");
		}
		localcmd ("serverinfo status Standby\n");
		lightstyle (0, "m");
		return;
	}
	t = find (world, classname, "match");
	if ((t != world))
	{
		remove (t);
	}
	localcmd ("serverinfo status Normal\n");
};

void () PlayerBreak =
{
	local float f1;
	local float f2;
	local string tmp;

	if (intermission_running)
	{
		return;
	}
	if ((self.classname != "player"))
	{
		return;
	}
	if (cb_prematch)
	{
		if (!pmtime)
		{
			bprint2 (2, self.netname, " stops the countdown\n");
			StopTimer ();
		}
		return;
	}
	tmp = infokey (world, "votetime");
	f1 = (stof (tmp) * 60);
	if ((f1 > time))
	{
		sprint (self, 2, "You cannot break at this time.\n");
		return;
	}
	if ((self.allowvote > time))
	{
		return;
	}
	self.allowvote = (time + 3);
	if (self.bvote)
	{
		bprint2 (2, self.netname, " קיפטהעבקף ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (2, "טוע ");
		}
		else
		{
			bprint (2, "טיף ");
		}
		bprint (3, "vote\n");
		self.bvote = 0;
		v_break = (v_break - 1);
		return;
	}
	if (clanbattle)
	{
		bprint2 (3, self.netname, " votes for stopping the match\n");
	}
	else
	{
		bprint2 (3, self.netname, " votes to end the current map\n");
	}
	self.bvote = 1;
	v_break = (v_break + 1);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / 2)) + 1);
	if ((v_break >= f2))
	{
		if (clanbattle)
		{
			bprint (2, "Match stopped by majority vote\n");
		}
		else
		{
			bprint (2, "Map ended by majority vote\n");
		}
		StopTimer ();
		NextLevel ();
		return;
	}
	if ((v_break != 0))
	{
		f1 = (f2 - v_break);
		tmp = ftos (f1);
		bprint3 (2, "", tmp, "‘ more vote");
		if ((f1 > 1))
		{
			bprint (2, "s");
		}
		bprint (2, " needed\n");
	}
};

void () RemoveVotes =
{
	if (self.bvote)
	{
		bprint2 (2, self.netname, " קיפטהעבקף ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (2, "טוע ");
		}
		else
		{
			bprint (2, "טיף ");
		}
		bprint (3, "vote\n");
		self.bvote = 0;
		v_break = (v_break - 1);
	}
	if (elect)
	{
		if ((self.is_admin == 2))
		{
			bprint2 (2, self.netname, " aborts election!");
			bprint (3, "\n");
			AbortElect ();
		}
	}
};

void () ReturnItem;
void () ball_reset;
void () TeamFortress_AmmoboxThink;
