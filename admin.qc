void () StopTimer;

void () Admin_CountPlayers =
{
	local string st;
	local float nump;

	nump = TeamFortress_GetNoPlayers ();
	st = ftos (nump);
	sprint3 (self, 2, "Players In Game : ", st, "\n");
	if ((number_of_teams > 0))
	{
		nump = TeamFortress_TeamGetNoPlayers (1);
		st = ftos (nump);
		sprint3 (self, 2, "Players In Team1: ", st, "\n");
	}
	if ((number_of_teams > 1))
	{
		nump = TeamFortress_TeamGetNoPlayers (2);
		st = ftos (nump);
		sprint3 (self, 2, "Players In Team2: ", st, "\n");
	}
	if ((number_of_teams > 2))
	{
		nump = TeamFortress_TeamGetNoPlayers (3);
		st = ftos (nump);
		sprint3 (self, 2, "Players In Team3: ", st, "\n");
	}
	if ((number_of_teams > 3))
	{
		nump = TeamFortress_TeamGetNoPlayers (4);
		st = ftos (nump);
		sprint3 (self, 2, "Players In Team4: ", st, "\n");
	}
};

void () Admin_ListIPs =
{
	if ((TeamFortress_GetNoPlayers () <= 1))
	{
		sprint (self, 2, "No other players in the game.\n");
		self.admin_use = world;
		return;
	}
	self.admin_use = find (self.admin_use, classname, "player");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, 2, self.admin_use.netname);
			sprint (self, 2, " (");
			sprint (self, 2, self.admin_use.ip);
			sprint (self, 2, ")");
			sprint (self, 2, "\n");
		}
		self.admin_use = find (self.admin_use, classname, "player");
	}
	self.admin_use = find (self.admin_use, classname, "observer");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, 2, self.admin_use.netname);
			sprint (self, 2, " (");
			sprint (self, 2, self.admin_use.ip);
			sprint (self, 2, ")");
			sprint (self, 2, " (SPECTATOR)\n");
		}
		self.admin_use = find (self.admin_use, classname, "observer");
	}
	sprint (self, 2, "End of player list\n");
	self.admin_use = world;
};

void () Admin_CycleDeal =
{
	if ((TeamFortress_GetNoPlayers () <= 1))
	{
		sprint (self, 2, "No other players in the game.\n");
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
		self.admin_mode = 1;
		sprint (self, 2, self.admin_use.netname);
		sprint3 (self, 2, " (", self.admin_use.ip, ")");
		if ((self.admin_use.classname == "observer"))
		{
			sprint (self, 2, " (SPECTATOR)");
		}
		sprint (self, 2, "\n");
		sprint (self, 2, "   KICK/NEXT?\n");
	}
	else
	{
		self.admin_mode = 0;
		sprint (self, 2, "End of player list\n");
	}
};

void () Admin_DoKick =
{
	bprint4 (2, self.admin_use.netname, " was kicked by ", self.netname, "\n");
	stuffcmd (self.admin_use, "disconnect\n");
	self.admin_mode = 0;
	self.admin_use = world;
};

void () CeaseFire_think =
{
	local entity te;
	local float temp;

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
		cease_fire = 1;
		bprint (2, "CEASE FIRE\n");
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
		bprint (2, "RESUME FIRE\n");
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
		bprint2 (2, p.netname, " was kicked for killing teammates.\n");
		sprint (p, 2, "You were kicked for killing teammates.\n");
		stuffcmd (p, "disconnect\n");
	}
	else
	{
		if ((autokick_kills != 0))
		{
			if ((p.teamkills == (autokick_kills - 1)))
			{
				sprint (p, 2, "Kill one more teammate, and you're outta here.\n");
			}
			rnum = 0;
			te = find (world, classname, "ak_timer");
			while (te)
			{
				if ((te.owner == p))
				{
					rnum = 1;
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
			if ((p.is_admin == 2))
			{
				p.is_admin = 0;
			}
		}
		p = find (p, classname, "player");
	}
	p = find (world, classname, "spectator");
	while ((p != world))
	{
		if (((p.netname != "") && (p.is_admin == 2)))
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
	bprint (2, "The voting has timed out.\nElection aborted\n");
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
		sprint (self, 2, "You cannot elect at this time.\n");
		return;
	}
	self.electtime = (time + 3);
	if (((self.is_admin == 1) || (self.is_admin == 3)))
	{
		sprint (self, 2, "You are already an admin\n");
		return;
	}
	if ((self.is_admin == 2))
	{
		bprint2 (2, self.netname, " aborts election!");
		bprint (3, "\n");
		AbortElect ();
		return;
	}
	if ((elect != 0))
	{
		sprint (self, 2, "An election is already in progress\n");
		return;
	}
	if ((self.classname == "spectator"))
	{
		return;
	}
	bprint2 (2, self.netname, " has requested admin rights!\n");
	self.is_admin = 2;
	elect = 1;
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
		if ((self.is_admin == 2))
		{
			bprint2 (2, self.netname, " ηαιξσ αδνιξ στατυσ!");
			bprint (3, "\n");
			sprint (self, 2, "Type γονναξδσ for admin commands.\n");
			self.is_admin = 1;
			self.get_admin_aliases = 1;
			elect = 0;
		}
	}
	else
	{
		bprint (2, "Type");
		bprint (3, " yes");
		bprint (2, " in console to approve\n");
		sprint (self, 2, "Type εμεγτ to abort election\n");
		electguard = spawn ();
		electguard.owner = world;
		electguard.classname = "electguard";
		electguard.think = ElectThink;
		electguard.nextthink = (time + 60);
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
	if ((self.is_admin == 2))
	{
		sprint (self, 2, "You cannot vote for yourself\n");
		return;
	}
	if (self.vote)
	{
		sprint (self, 2, "--- your vote is still good ---\n");
		return;
	}
	elect = (elect + 1);
	bprint2 (2, self.netname, " gives ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (2, "her");
	}
	else
	{
		bprint (2, "his");
	}
	bprint (2, " vote\n");
	self.vote = 1;
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
		while ((p.is_admin != 2))
		{
			p = find (p, classname, "player");
		}
		if ((p.is_admin == 2))
		{
			bprint2 (2, p.netname, " ηαιξσ αδνιξ στατυσ!");
			bprint (3, "\n");
			sprint (p, 2, "Type γονναξδσ for admin commands.\n");
			p.is_admin = 1;
			p.get_admin_aliases = 1;
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
		bprint3 (2, "", tmp, "‘ more vote");
		if ((f1 > 1))
		{
			bprint (2, "s");
		}
		bprint (2, " needed\n");
	}
};

void () VoteNo =
{
	local float f1;
	local float f2;
	local string tmp;

	if ((self.is_admin == 1))
	{
		return;
	}
	if ((((elect == 0) || (self.is_admin == 2)) || (self.vote == 0)))
	{
		return;
	}
	bprint2 (2, self.netname, " withdraws ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (2, "her");
	}
	else
	{
		bprint (2, "his");
	}
	bprint (2, " vote\n");
	self.vote = 0;
	elect = (elect - 1);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / 2)) + 1);
	f1 = (f2 - elect);
	tmp = ftos (f1);
	bprint3 (2, "", tmp, "‘ more vote");
	if ((f1 > 1))
	{
		bprint (2, "s");
	}
	bprint (2, " needed\n");
};
