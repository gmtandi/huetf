//=-=-=-=-=
void () StopTimer;

void () Admin_CountPlayers =
{
	local string st;
	local float nump;

	nump = TeamFortress_GetNoPlayers ();
	st = ftos (nump);
	sprint3 (self, SBAR_PRINT, "Players In Game : ", st, "\n");
	if ((number_of_teams > 0))
	{
		nump = TeamFortress_TeamGetNoPlayers (SBAR_GRENS);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team1: ", st, "\n");
	}
	if ((number_of_teams > SBAR_GRENS))
	{
		nump = TeamFortress_TeamGetNoPlayers (SBAR_PRINT);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team2: ", st, "\n");
	}
	if ((number_of_teams > SBAR_PRINT))
	{
		nump = TeamFortress_TeamGetNoPlayers (AS_MELEE);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team3: ", st, "\n");
	}
	if ((number_of_teams > AS_MELEE))
	{
		nump = TeamFortress_TeamGetNoPlayers (AS_MISSILE);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team4: ", st, "\n");
	}
};

void () Admin_ListIPs =
{
	if ((TeamFortress_GetNoPlayers () <= SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "No other players in the game.\n");
		self.admin_use = world;
		return;
	}
	self.admin_use = find (self.admin_use, classname, "player");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, SBAR_PRINT, self.admin_use.netname);
			sprint (self, SBAR_PRINT, " (");
			sprint (self, SBAR_PRINT, self.admin_use.ip);
			sprint (self, SBAR_PRINT, ")");
			sprint (self, SBAR_PRINT, "\n");
		}
		self.admin_use = find (self.admin_use, classname, "player");
	}
	self.admin_use = find (self.admin_use, classname, "observer");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, SBAR_PRINT, self.admin_use.netname);
			sprint (self, SBAR_PRINT, " (");
			sprint (self, SBAR_PRINT, self.admin_use.ip);
			sprint (self, SBAR_PRINT, ")");
			sprint (self, SBAR_PRINT, " (SPECTATOR)\n");
		}
		self.admin_use = find (self.admin_use, classname, "observer");
	}
	sprint (self, SBAR_PRINT, "End of player list\n");
	self.admin_use = world;
};

void () Admin_CycleDeal =
{
	if ((TeamFortress_GetNoPlayers () <= SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "No other players in the game.\n");
		self.admin_use = world;
		self.admin_mode = 0;
		return;
	}
	if ((self.admin_use.classname != "observer"))
	{
		self.admin_use = find (self.admin_use, classname, "player");
		while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
		{
			self.admin_use = find (self.admin_use, classname, "player");
		}
		if ((self.admin_use == world))
		{
			self.admin_use = find (self.admin_use, classname, "observer");
			while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
			{
				self.admin_use = find (self.admin_use, classname, "observer");
			}
		}
	}
	else
	{
		self.admin_use = find (self.admin_use, classname, "observer");
		while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
		{
			self.admin_use = find (self.admin_use, classname, "observer");
		}
	}
	if (self.admin_use)
	{
		self.admin_use.ip = infokey (self.admin_use, "ip");
		self.admin_mode = SBAR_GRENS;
		sprint (self, SBAR_PRINT, self.admin_use.netname);
		sprint3 (self, SBAR_PRINT, " (", self.admin_use.ip, ")");
		if ((self.admin_use.classname == "observer"))
		{
			sprint (self, SBAR_PRINT, " (SPECTATOR)");
		}
		sprint (self, SBAR_PRINT, "\n");
		sprint (self, SBAR_PRINT, "   KICK/NEXT?\n");
	}
	else
	{
		self.admin_mode = 0;
		sprint (self, SBAR_PRINT, "End of player list\n");
	}
};

void () Admin_DoKick =
{
	bprint4 (SBAR_PRINT, self.admin_use.netname, " was kicked by ", self.netname, "\n");
	stuffcmd (self.admin_use, "disconnect\n");
	self.admin_mode = 0;
	self.admin_use = world;
};

void () CeaseFire_think =
{
	local entity te;

	if (!cease_fire)
	{
		dremove (self);
		return;
	}
	te = find (world, classname, "player");
	while (te)
	{
		CenterPrint3 (te, "CEASE FIRE\nCalled by: ", self.owner.netname, "\n");
		te = find (te, classname, "player");
	}
	self.nextthink = (time + 5);
};

void () Admin_CeaseFire =
{
	local entity te;

	if (!cease_fire)
	{
		if (cb_prematch)
		{
			StopTimer ();
		}
		cease_fire = SBAR_GRENS;
		bprint (SBAR_PRINT, "CEASE FIRE\n");
		te = find (world, classname, "player");
		while (te)
		{
			CenterPrint3 (te, "CEASE FIRE\nCalled by: ", self.netname, "\n");
			te.immune_to_check = (time + 5);
			te.tfstate = (te.tfstate | 65536);
			TeamFortress_SetSpeed (te);
			te = find (te, classname, "player");
		}
		te = spawn ();
		te.owner = self;
		te.classname = "ceasefire";
		te.think = CeaseFire_think;
		te.nextthink = (time + 5);
	}
	else
	{
		te = find (world, classname, "ceasefire");
		if (te)
		{
			dremove (te);
		}
		cease_fire = 0;
		if (cb_prematch)
		{
			pmtime = 0;
			StartTimer ();
		}
		bprint (SBAR_PRINT, "RESUME FIRE\n");
		te = find (world, classname, "player");
		while (te)
		{
			CenterPrint3 (te, "RESUME FIRE\nCalled by: ", self.netname, "\n");
			te.immune_to_check = (time + 5);
			te.tfstate = (te.tfstate - (te.tfstate & 65536));
			TeamFortress_SetSpeed (te);
			te = find (te, classname, "player");
		}
	}
};

void (entity p) CheckAutoKick =
{
	local float rnum;
	local entity te;

	if (((p.teamkills >= autokick_kills) && (autokick_kills != 0)))
	{
		bprint2 (SBAR_PRINT, p.netname, " was kicked for killing teammates.\n");
		sprint (p, SBAR_PRINT, "You were kicked for killing teammates.\n");
		stuffcmd (p, "disconnect\n");
	}
	else
	{
		if ((autokick_kills != 0))
		{
			if ((p.teamkills == (autokick_kills - SBAR_GRENS)))
			{
				sprint (p, SBAR_PRINT, "Kill one more teammate, && you're outta here.\n");
			}
			rnum = 0;
			te = find (world, classname, "ak_timer");
			while (te)
			{
				if ((te.owner == p))
				{
					rnum = SBAR_GRENS;
					te = world;
				}
				else
				{
					te = find (te, classname, "ak_timer");
				}
			}
			if ((rnum == 0))
			{
				te = spawn ();
				te.classname = "ak_timer";
				te.owner = p;
				te.think = autokick_think;
				te.nextthink = (time + autokick_time);
			}
		}
	}
};

void () AbortElect =
{
	local entity p;

	elect = 0;
	p = find (world, classname, "player");
	while ((p != world))
	{
		if ((p.netname != ""))
		{
			p.vote = 0;
			if ((p.is_admin == SBAR_PRINT))
			{
				p.is_admin = 0;
			}
		}
		p = find (p, classname, "player");
	}
	p = find (world, classname, "spectator");
	while ((p != world))
	{
		if (((p.netname != "") && (p.is_admin == SBAR_PRINT)))
		{
			p.is_admin = 0;
		}
		p = find (p, classname, "spectator");
	}
	p = find (world, classname, "electguard");
	if ((p.classname == "electguard"))
	{
		dremove (p);
	}
};

void () ElectThink =
{
	bprint (SBAR_PRINT, "The voting has timed out.\nElection aborted\n");
	self.nextthink = -1;
	AbortElect ();
};

void () VoteAdmin =
{
	local float f1;
	local float f2;
	local float f3;
	local string tmp;
	local entity electguard;

	if ((self.electtime > time))
	{
		sprint (self, SBAR_PRINT, "You cannot elect at this time.\n");
		return;
	}
	self.electtime = (time + AS_MELEE);
	if (((self.is_admin == SBAR_GRENS) || (self.is_admin == AS_MELEE)))
	{
		sprint (self, SBAR_PRINT, "You are already an admin\n");
		return;
	}
	if ((self.is_admin == SBAR_PRINT))
	{
		bprint2 (SBAR_PRINT, self.netname, " aborts election!");
		bprint (AS_MELEE, "\n");
		AbortElect ();
		return;
	}
	if ((elect != 0))
	{
		sprint (self, SBAR_PRINT, "An election is already in progress\n");
		return;
	}
	if ((self.classname == "spectator"))
	{
		return;
	}
	bprint2 (SBAR_PRINT, self.netname, " has requested admin rights!\n");
	self.is_admin = SBAR_PRINT;
	elect = SBAR_GRENS;
	tmp = infokey (world, "votespercentage");
	f3 = stof (tmp);
	if (((f3 < 5) || (f3 > __)))
	{
		f3 = _2;
	}
	f3 = (f3 / _d);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (elect / f1);
	if ((f2 > f3))
	{
		if ((self.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, self.netname, " ηαιξσ αδνιξ στατυσ!");
			bprint (AS_MELEE, "\n");
			sprint (self, SBAR_PRINT, "Type γονναξδσ for admin commands.\n");
			self.is_admin = SBAR_GRENS;
			self.get_admin_aliases = SBAR_GRENS;
			elect = 0;
		}
	}
	else
	{
		bprint (SBAR_PRINT, "Type");
		bprint (AS_MELEE, " yes");
		bprint (SBAR_PRINT, " in console to approve\n");
		sprint (self, SBAR_PRINT, "Type εμεγτ to abort election\n");
		electguard = spawn ();
		electguard.owner = world;
		electguard.classname = "electguard";
		electguard.think = ElectThink;
		electguard.nextthink = (time + SBAR_600);
	}
};

void () VoteYes =
{
	local float f1;
	local float f2;
	local float f3;
	local string tmp;
	local entity p;

	if (!elect)
	{
		return;
	}
	if ((self.is_admin == SBAR_PRINT))
	{
		sprint (self, SBAR_PRINT, "You cannot vote for yourself\n");
		return;
	}
	if (self.vote)
	{
		sprint (self, SBAR_PRINT, "--- your vote is still good ---\n");
		return;
	}
	elect = (elect + SBAR_GRENS);
	bprint2 (SBAR_PRINT, self.netname, " gives ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (SBAR_PRINT, "her");
	}
	else
	{
		bprint (SBAR_PRINT, "his");
	}
	bprint (SBAR_PRINT, " vote\n");
	self.vote = SBAR_GRENS;
	tmp = infokey (world, "votespercentage");
	f3 = stof (tmp);
	if (((f3 < 5) || (f3 > __)))
	{
		f3 = _2;
	}
	f3 = (f3 / _d);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (elect / f1);
	if ((f2 >= f3))
	{
		p = find (world, classname, "player");
		while ((p.is_admin != SBAR_PRINT))
		{
			p = find (p, classname, "player");
		}
		if ((p.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, p.netname, " ηαιξσ αδνιξ στατυσ!");
			bprint (AS_MELEE, "\n");
			sprint (p, SBAR_PRINT, "Type γονναξδσ for admin commands.\n");
			p.is_admin = SBAR_GRENS;
			p.get_admin_aliases = SBAR_GRENS;
			elect = 0;
			p.vote = 0;
			p = find (world, classname, "electguard");
			if ((p.classname == "electguard"))
			{
				remove (p);
			}
			p = find (world, classname, "player");
		}
		self.vote = 0;
	}
	if ((elect != 0))
	{
		f1 = (f2 - elect);
		tmp = ftos (rint (f1));
		bprint3 (SBAR_PRINT, "", tmp, "‘ more vote");
		if ((f1 > SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " needed\n");
	}
};

void () VoteNo =
{
	local float f1;
	local float f2;
	local string tmp;

	if ((self.is_admin == SBAR_GRENS))
	{
		return;
	}
	if ((((elect == 0) || (self.is_admin == SBAR_PRINT)) || (self.vote == 0)))
	{
		return;
	}
	bprint2 (SBAR_PRINT, self.netname, " withdraws ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (SBAR_PRINT, "her");
	}
	else
	{
		bprint (SBAR_PRINT, "his");
	}
	bprint (SBAR_PRINT, " vote\n");
	self.vote = 0;
	elect = (elect - SBAR_GRENS);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / SBAR_PRINT)) + SBAR_GRENS);
	f1 = (f2 - elect);
	tmp = ftos (f1);
	bprint3 (SBAR_PRINT, "", tmp, "‘ more vote");
	if ((f1 > SBAR_GRENS))
	{
		bprint (SBAR_PRINT, "s");
	}
	bprint (SBAR_PRINT, " needed\n");
};
