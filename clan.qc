//=-=-=-=-=

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
	if (tfvsdm)
	{
		localcmd ("tfvsdm_");
	}
	else
	{
		if (tfstrike)
		{
			localcmd ("tfstrike_");
		}
		else
		{
			if (duel)
			{
				localcmd ("duel_");
			}
			else
			{
				if (speedcap)
				{
					localcmd ("speedcap_");
				}
				else
				{
					if (practice)
					{
						localcmd ("practice_");
					}
					else
					{
						if (clanbattle)
						{
							localcmd ("clan_");
						}
					}
				}
			}
		}
	}
	while ((i < number_of_teams))
	{
		i = (i + SBAR_GRENS);
		tmp = GetTeamName (i);
		localcmd (tmp);
		localcmd ("_");
		if ((i < number_of_teams))
		{
			localcmd ("vs_");
		}
	}
	localcmd ("[");
	localcmd (mapname);
	localcmd ("]");
	t = find (world, classname, "prematch");
	if ((t != world))
	{
		if ((world.targetname != string_null))
		{
			calltimeofday ();
			localcmd ("_");
			localcmd (ftos (t.tp_grenades_2));
			localcmd ("-");
			localcmd (ftos (t.armorclass));
			localcmd ("-");
			localcmd (ftos (t.tf_items));
			localcmd ("_");
			localcmd (ftos (t.tp_grenades_1));
			localcmd ("-");
			localcmd (ftos (t.no_grenades_2));
		}
	}
	localcmd ("\n");
};

void () MatchOvertime =
{
	local float f2;

	if (cease_fire)
	{
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	if (TeamFortress_CheckDraw ())
	{
		self.cnt2 = (self.cnt2 + SBAR_GRENS);
		f2 = stof (infokey (world, "overtime"));
		if ((f2 > 0))
		{
			if ((self.cnt2 <= (f2 * SBAR_600)))
			{
				self.think = MatchOvertime;
				self.nextthink = (time + SBAR_GRENS);
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
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	self.cnt2 = (self.cnt2 - SBAR_GRENS);
	if (!TeamFortress_GetNoPlayers ())
	{
		NextLevel ();
		return;
	}
	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - SBAR_GRENS);
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}
	if (!self.cnt2)
	{
		if (((self.cnt == SBAR_GRENS) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (SBAR_PRINT, "", tmp, "‘ minute");
			if ((self.cnt != SBAR_GRENS))
			{
				bprint (SBAR_PRINT, "s");
			}
			bprint (SBAR_PRINT, " remaining\n");
		}
		if (!self.cnt)
		{
			tmp = infokey (world, "overtime");
			if (stof (tmp))
			{
				if (TeamFortress_CheckDraw ())
				{
					bprint (SBAR_PRINT, "Draw, overtime set.\n Golden Cap WINS!!!\n");
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
		bprint3 (SBAR_PRINT, "", tmp, "‘ second");
		if ((self.cnt2 != SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " remaining\n");
	}
	self.nextthink = (time + SBAR_GRENS);
};

void () StartMatch =
{
	local string st;
	local float f1;
	local float f2;
	local entity te;
	local entity oldself;
	local entity gren;

	lightstyle (0, "m");
	bprint (SBAR_PRINT, "MATCH BEGINS NOW\n");
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
			self.hook_out = SBAR_GRENS;
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
	te.cnt = (timelimit / SBAR_600);
	te.cnt2 = SBAR_600;
	if ((te.cnt == 0))
	{
		bprint (SBAR_PRINT, "Warning no timelimit set!\n");
		localcmd ("\nserverinfo status \"0 min left\"\n");
		te.cnt = -1;
		te.cnt2 = -1;
	}
	else
	{
		te.cnt = (te.cnt - SBAR_GRENS);
		localcmd ("\nserverinfo status \"");
		st = ftos (te.cnt);
		localcmd (st);
		localcmd (" min left\"\n");
		te.think = MatchThink;
		te.nextthink = (time + SBAR_GRENS);
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
	local string num;
	local float fl;

	self.cnt2 = (self.cnt2 - SBAR_GRENS);
	if ((self.cnt2 == SBAR_GRENS))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				p.respawn_time = (time + SBAR_PRINT);
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
					p.takedamage = SBAR_PRINT;
					p.solid = AS_MELEE;
					p.movetype = AS_MELEE;
				}
				p = find (p, classname, "player");
			}
			StartMatch ();
			return;
		}
	}
	fl = (self.cnt2 / SBAR_600);
	if (((((((((((fl == SBAR_GRENS) || (fl == SBAR_PRINT)) || (fl == AS_MELEE)) || (fl == AS_MISSILE)) || (fl == 5)) || (fl == 6)) || (fl == 7)) || (fl == 8)) || (fl == 9)) || (fl == enter)))
	{
		num = ftos (fl);
		bprint3 (SBAR_PRINT, "Match will begin in ", num, " minute(s).\n");
	}
	if ((self.cnt2 == 30))
	{
		num = ftos ((self.cnt2 / SBAR_600));
		bprint (SBAR_PRINT, "Match will begin in 30 seconds.\n");
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
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				CenterPrint3 (p, "Countdown ", num, "\n");
				if ((self.cnt2 < 6))
				{
					cease_fire = 0;
					stuffcmd (p, "play buttons/switch04.wav\n");
				}
			}
			p = find (p, classname, "player");
		}
		if ((self.cnt2 > SBAR_GRENS))
		{
			bprint2 (SBAR_PRINT, num, " seconds.\n");
		}
		else
		{
			bprint (SBAR_PRINT, "1 second.\n");
		}
	}
	self.nextthink = (time + SBAR_GRENS);
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
			sprint (self, SBAR_PRINT, "Clan mode off....\n");
			sprint (self, SBAR_PRINT, "Match cannot be started.\n");
		}
		else
		{
			dprint ("Clan mode off....\n");
			dprint ("Match cannot be started.\n");
		}
		return;
	}
	if (((clanbattle == SBAR_GRENS) && (cb_prematch == 0)))
	{
		if ((self != world))
		{
			sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
			sprint (self, SBAR_PRINT, "Type break to stop the current battle.\n");
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
			sprint (self, SBAR_PRINT, "Countdown in progress....\n");
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
		bprint (SBAR_PRINT, "QiZmo:");
		if ((f1 & SBAR_PRINT))
		{
			bprint (SBAR_PRINT, " פיםוע");
		}
		if ((f1 & 8))
		{
			bprint (SBAR_PRINT, " לבח");
		}
		if ((f1 & space))
		{
			bprint (SBAR_PRINT, " ומוםש");
		}
		if ((f1 & 128))
		{
			bprint (SBAR_PRINT, " נןימפ");
		}
		bprint (SBAR_PRINT, " disabled\n");
	}
	f1 = stof (infokey (world, "prematch"));
	timer = spawn ();
	timer.owner = world;
	timer.classname = "prematch";
	timer.cnt = 0;
	if (pmtime)
	{
		timer.cnt2 = rint ((pmtime * SBAR_600));
		if ((timer.cnt2 < SBAR_GRENS))
		{
			timer.cnt2 = SBAR_GRENS;
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
		if ((timer.cnt2 < SBAR_GRENS))
		{
			timer.cnt2 = 0;
		}
	}
	timer.cnt2 = (timer.cnt2 + SBAR_GRENS);
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
			bprint2 (SBAR_PRINT, self.netname, " stops the countdown\n");
			StopTimer ();
		}
		return;
	}
	tmp = infokey (world, "votetime");
	f1 = (stof (tmp) * SBAR_600);
	if ((f1 > time))
	{
		sprint (self, SBAR_PRINT, "You cannot break at this time.\n");
		return;
	}
	if ((self.allowvote > time))
	{
		return;
	}
	self.allowvote = (time + AS_MELEE);
	if (self.bvote)
	{
		bprint2 (SBAR_PRINT, self.netname, " קיפטהעבקף ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (SBAR_PRINT, "טוע ");
		}
		else
		{
			bprint (SBAR_PRINT, "טיף ");
		}
		bprint (AS_MELEE, "vote\n");
		self.bvote = 0;
		v_break = (v_break - SBAR_GRENS);
		return;
	}
	if (clanbattle)
	{
		bprint2 (AS_MELEE, self.netname, " votes for stopping the match\n");
	}
	else
	{
		bprint2 (AS_MELEE, self.netname, " votes to end the current map\n");
	}
	self.bvote = SBAR_GRENS;
	v_break = (v_break + SBAR_GRENS);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / SBAR_PRINT)) + SBAR_GRENS);
	if ((v_break >= f2))
	{
		if (clanbattle)
		{
			bprint (SBAR_PRINT, "Match stopped by majority vote\n");
		}
		else
		{
			bprint (SBAR_PRINT, "Map ended by majority vote\n");
		}
		StopTimer ();
		NextLevel ();
		return;
	}
	if ((v_break != 0))
	{
		f1 = (f2 - v_break);
		tmp = ftos (f1);
		bprint3 (SBAR_PRINT, "", tmp, "‘ more vote");
		if ((f1 > SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " needed\n");
	}
};

void () RemoveVotes =
{
	if (self.bvote)
	{
		bprint2 (SBAR_PRINT, self.netname, " קיפטהעבקף ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (SBAR_PRINT, "טוע ");
		}
		else
		{
			bprint (SBAR_PRINT, "טיף ");
		}
		bprint (AS_MELEE, "vote\n");
		self.bvote = 0;
		v_break = (v_break - SBAR_GRENS);
	}
	if (elect)
	{
		if ((self.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, self.netname, " aborts election!");
			bprint (AS_MELEE, "\n");
			AbortElect ();
		}
	}
};

void () ReturnItem;
void () ball_reset;
void () TeamFortress_AmmoboxThink;
