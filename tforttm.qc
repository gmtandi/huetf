float () TeamFortress_TeamGetWinner;
float () TeamFortress_TeamGetSecond;
float (float tno) TeamFortress_TeamGetScore;
void (float tno) TeamFortress_TeamSetColor;
void (float tno, float scoretoadd) TeamFortress_TeamIncreaseScore;
float (float tno) TeamFortress_TeamGetMaxPlayers;
string (float tno) TeamFortress_TeamGetColorString;
float (float tno) TeamFortress_TeamGetIllegalClasses;
string (entity p) TeamFortress_GetSkin;

float () TeamFortress_TeamPutPlayerInTeam =
{
	local float i;
	local float j;
	local float k;
	local float lowscore;
	local float lowest;
	local float likely_team;

	i = 1;
	lowscore = 0;
	likely_team = (random () * number_of_teams);
	likely_team = ceil (likely_team);
	if ((likely_team == 0))
	{
		likely_team = number_of_teams;
	}
	lowest = 33;
	while ((i < (number_of_teams + 1)))
	{
		j = TeamFortress_TeamGetNoPlayers (i);
		if ((j < lowest))
		{
			if ((TeamFortress_TeamGetMaxPlayers (i) > j))
			{
				lowest = j;
				lowscore = TeamFortress_TeamGetScore (i);
				likely_team = i;
			}
		}
		if ((j == lowest))
		{
			k = TeamFortress_TeamGetScore (i);
			if ((k < lowscore))
			{
				lowscore = k;
				likely_team = i;
			}
		}
		i = (i + 1);
	}
	return (TeamFortress_TeamSet (likely_team));
};

float (float tno) TeamFortress_TeamGetColor =
{
	if (!self.playerclass && !captainmode || captainmode && !self.captain)
	{
		return (1);
	}
	if ((tno == 1))
	{
		return (14);
	}
	if ((tno == 2))
	{
		return (5);
	}
	if ((tno == 3))
	{
		return (13);
	}
	if ((tno == 4))
	{
		return (12);
	}
	return (0);
};

float (float tno) TeamFortress_GetColor =
{
	if ((tno == 1))
	{
		return (14);
	}
	if ((tno == 2))
	{
		return (5);
	}
	if ((tno == 3))
	{
		return (13);
	}
	if ((tno == 4))
	{
		return (12);
	}
	return (0);
};

void (float tno) TeamFortress_TeamSetColor =
{
	if ((tno == 1))
	{
		team1col = 14;
		return;
	}
	if ((tno == 2))
	{
		team2col = 5;
		return;
	}
	if ((tno == 3))
	{
		team3col = 13;
		return;
	}
	if ((tno == 4))
	{
		team4col = 12;
		return;
	}
};

string (float tno) GetTeamName =
{
	local string st;

	if ((self.classname == "player"))
	{
		if (!self.playerclass && !captainmode)
		{
			return ("observe");
		}
	}
	if ((tno == 1))
	{
		st = infokey (world, "team1");
		if ((st == string_null))
		{
			return ("blue");
		}
	}
	else
	{
		if ((tno == 2))
		{
			st = infokey (world, "team2");
			if ((st == string_null))
			{
				return ("red");
			}
		}
		else
		{
			if ((tno == 3))
			{
				st = infokey (world, "team3");
				if ((st == string_null))
				{
					return ("yell");
				}
			}
			else
			{
				if ((tno == 4))
				{
					st = infokey (world, "team4");
					if ((st == string_null))
					{
						return ("gren");
					}
				}
				else
				{
					st = "\"\"";
				}
			}
		}
	}
	return (st);
};

void (entity p) SetTeamName =
{
	local string st;

	stuffcmd (p, "team ");
	st = GetTeamName (p.team_no);
	stuffcmd (p, st);
	stuffcmd (p, "\n");
};

float (float tno) TeamFortress_TeamSet =
{
	local string st;
	local float tc;
	local entity te;

	if ((teamplay < 1))
	{
		sprint (self, 2, "Teamplay is not On, so FortressTeams are inactive.\n");
		return (0);
	}
	if ((tno == -1))
	{
		if (self.team_no)
		{
			Engineer_RemoveBuildings (self);
			te = find (world, classname, "detpack");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.weaponmode == 1))
					{
						TeamFortress_SetSpeed (te.enemy);
						dremove (te.oldenemy);
						dremove (te.observer_list);
					}
					dremove (te);
					te = world;
				}
				te = find (te, classname, "detpack");
			}
			ClientKill ();
		}

		if (!captainmode) {
			bprint (2, self.netname);
			bprint (2, " has joined as an Observer.\n");
			self.team_no = 0;
			self.playerclass = 0;
		}

		return (1);
	}
	if (((tno > number_of_teams) && (number_of_teams != 0)))
	{
		sprint (self, 2, "There can be only ");
		st = ftos (number_of_teams);
		sprint (self, 2, st);
		sprint (self, 2, " teams on this map.\nTry again\n");
		return (0);
	}
	if ((self.team_no == tno))
	{
		if (!captainmode)
			sprint (self, 2, "You are already in that team. Pick another.\n");
		return (0);
	}
	if (self.team_no)
	{
		if ((self.respawn_time > time))
		{
			return (0);
		}
		Engineer_RemoveBuildings (self);
		te = find (world, classname, "detpack");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((te.weaponmode == 1))
				{
					TeamFortress_SetSpeed (te.enemy);
					dremove (te.oldenemy);
					dremove (te.observer_list);
				}
				dremove (te);
				te = world;
			}
			te = find (te, classname, "detpack");
		}
		self.playerclass = 0;

		if (!captainmode)
			ClientKill ();

		if (TeamFortress_TeamIsCivilian (tno))
		{
			self.nextpc = 11;
		}
		else
		{
			self.nextpc = 0;
		}
	}
	tc = TeamFortress_TeamGetNoPlayers (tno);
	if ((tc >= TeamFortress_TeamGetMaxPlayers (tno)))
	{
		sprint (self, 2, "That team is full. Pick another.\n");
		return (0);
	}
	if ((TeamFortress_TeamGetColor (tno) == 0))
	{
		TeamFortress_TeamSetColor (tno);
		if ((TeamFortress_TeamGetColor (tno) == 0))
		{
			sprint (self, 2, "You can't start a new team with your color, since another ");
			sprint (self, 2, "already using that color. Change your pants color, then try again.\n");
			return (0);
		}
		bprint (2, self.netname);
		bprint (2, " has started Team No ");
		st = ftos (tno);
		bprint (2, st);
		bprint (2, ".\n");
		self.immune_to_check = (time + 5);
		if (((toggleflags & 128) || (toggleflags & 2048)))
		{
			self.frags = TeamFortress_TeamGetScore (tno);
		}
		stuffcmd (self, "color ");
		tc = (TeamFortress_TeamGetColor (tno) - 1);
		st = ftos (tc);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		self.team_no = tno;
		SetTeamName (self);
		return (1);
	}
if (!captainmode) {
	bprint (2, self.netname);
	bprint (2, " has joined Team No ");
	st = ftos (tno);
	bprint (2, st);
	bprint (2, ".\n");
}
	self.playerclass = 0;
	self.team_no = tno;
	
	self.immune_to_check = (time + 5);
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		self.frags = TeamFortress_TeamGetScore (tno);
	}
	TeamFortress_TeamShowMemberClasses (self);
	return (1);
};

void () TeamFortress_CheckTeamCheats =
{
	local string st;
	local string sk;
	local float tc;

	if ((self.immune_to_check > time))
	{
		return;
	}
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}
	else
	{
		CheckAllRates ();
		if (((self.playerclass && (self.team_no == 0)) && teamplay))
		{
			stuffcmd (self, "disconnect\n");
		}
	}
	if ((teamplay && (self.team_no == 0)))
	{
		if ((self.motd > _A))
		{
			st = GetTeamName (self.team_no);
			if ((st != infokey (self, "team")))
			{
				SetTeamName (self);
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + 2);
				}
				else
				{
					bprint2 (1, self.netname, " has been kicked for changing team.\n");
					sprint (self, 2, "You have been kicked for changing your team. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
			st = infokey (self, "bottomcolor");
			tc = stof (st);
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - 1)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - 1);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + 2);
				}
			}
		}
	}
	if (tfstrike)
	{
		if ((((self.team_no > 0) && teamplay) && self.playerclass))
		{
			st = infokey (self, "topcolor");
			tc = stof (st);
			if (self.ammo_detpack)
			{
				if (tc)
				{
					stuffcmd (self, "topcolor 0\n");
					if ((self.immune_to_check != floor (time)))
					{
						self.immune_to_check = (floor (time) + 2);
					}
					else
					{
						bprint2 (1, self.netname, " has been kicked for changing top color.\n");
						sprint (self, 2, "You have been kicked for changing your top color. Don't do it.\n");
						stuffcmd (self, "disconnect\n");
						return;
					}
				}
			}
			else
			{
				if ((self.team_no == 2))
				{
					if (((self.playerclass == 8) && (self.undercover_team != 0)))
					{
						return;
					}
					if ((tc != (TeamFortress_GetColor (self.team_no) - 1)))
					{
						stuffcmd (self, "topcolor ");
						tc = (TeamFortress_GetColor (self.team_no) - 1);
						st = ftos (tc);
						stuffcmd (self, st);
						stuffcmd (self, "\n");
						if ((self.immune_to_check != floor (time)))
						{
							self.immune_to_check = (floor (time) + 2);
						}
						else
						{
							bprint2 (1, self.netname, " has been kicked for changing top color.\n");
							sprint (self, 2, "You have been kicked for changing your top color. Don't do it.\n");
							stuffcmd (self, "disconnect\n");
							return;
						}
					}
				}
			}
		}
	}
	if (((self.team_no > 0) && teamplay))
	{
		st = infokey (self, "bottomcolor");
		tc = stof (st);
		if (((self.playerclass == 8) && (self.undercover_team != 0)))
		{
			if (((TeamFortress_GetColor (self.undercover_team) - 1) != tc))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_GetColor (self.undercover_team) - 1);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + 2);
				}
				else
				{
					bprint2 (1, self.netname, " has been kicked for changing color.\n");
					sprint (self, 2, "You have been kicked for changing your pants color. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
		}
		else
		{
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - 1)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - 1);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + 2);
				}
				else
				{
					bprint2 (1, self.netname, " has been kicked for changing color.\n");
					sprint (self, 2, "You have been kicked for changing your pants color. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
		}
		if (self.playerclass)
		{
			st = infokey (self, "skin");
			tc = 0;
			sk = TeamFortress_GetSkin (self);
			if ((st != sk))
			{
				TeamFortress_SetSkin (self);
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + 2);
				}
				else
				{
					bprint2 (1, self.netname, " has been kicked for changing skin.\n");
					sprint (self, 2, "You have been kicked for changing your skin. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
			if ((tc == 8))
			{
				self.playerclass = 8;
			}
		}
		st = GetTeamName (self.team_no);
		if ((st != infokey (self, "team")))
		{
			SetTeamName (self);
			if ((self.immune_to_check != floor (time)))
			{
				self.immune_to_check = (floor (time) + 2);
			}
			else
			{
				bprint2 (1, self.netname, " has been kicked for changing team.\n");
				sprint (self, 2, "You have been kicked for changing your team. Don't do it.\n");
				stuffcmd (self, "disconnect\n");
				return;
			}
		}
	}
};

void (float tno, float scoretoadd) TeamFortress_TeamIncreaseScore =
{
	local entity e;

	if (((tno == 0) || (scoretoadd == 0)))
	{
		return;
	}
	if ((tno == 1))
	{
		team1score = (team1score + scoretoadd);
	}
	if ((tno == 2))
	{
		team2score = (team2score + scoretoadd);
	}
	if ((tno == 3))
	{
		team3score = (team3score + scoretoadd);
	}
	if ((tno == 4))
	{
		team4score = (team4score + scoretoadd);
	}
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		e = find (world, classname, "player");
		while (e)
		{
			if ((e.team_no == tno))
			{
				e.frags = TeamFortress_TeamGetScore (tno);
			}
			e = find (e, classname, "player");
		}
	}
};

float (float tno) TeamFortress_TeamGetScore =
{
	if ((tno == 1))
	{
		return (team1score);
	}
	if ((tno == 2))
	{
		return (team2score);
	}
	if ((tno == 3))
	{
		return (team3score);
	}
	if ((tno == 4))
	{
		return (team4score);
	}
	return (0);
};

float (float tno) TeamFortress_TeamGetScoreFrags =
{
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		TeamFortress_TeamGetScore (tno);
	}
	else
	{
		if ((tno == 1))
		{
			return (team1frags);
		}
		if ((tno == 2))
		{
			return (team2frags);
		}
		if ((tno == 3))
		{
			return (team3frags);
		}
		if ((tno == 4))
		{
			return (team4frags);
		}
	}
	return (0);
};

float (float tno) TeamFortress_TeamGetNoPlayers =
{
	local float size_team;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.team_no == tno))
		{
			size_team = (size_team + 1);
		}
		search = find (search, classname, "player");
	}
	if ((tno == 0))
	{
		search = find (world, classname, "observer");
		while ((search != world))
		{
			if ((search.team_no == tno))
			{
				size_team = (size_team + 1);
			}
			search = find (search, classname, "observer");
		}
	}
	return (size_team);
};

float (float tno) TeamFortress_GetNoPlayersClass =
{
	local float size_team;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.team_no == tno))
		{
			if (search.playerclass)
			{
				size_team = (size_team + 1);
			}
		}
		search = find (search, classname, "player");
	}
	return (size_team);
};

float () TeamFortress_NoTeams =
{
	local float no_teams;
	local float i;
	local float p;

	i = 1;
	no_teams = 0;
	p = TeamFortress_GetNoPlayersClass (i);
	while ((i <= number_of_teams))
	{
		p = TeamFortress_GetNoPlayersClass (i);
		if ((p > 0))
		{
			no_teams = (no_teams + 1);
		}
		i = (i + 1);
	}
	return (no_teams);
};

float () TeamFortress_GetNoPlayers =
{
	local float nump;
	local entity search;

	nump = 0;
	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.netname != string_null))
		{
			nump = (nump + 1);
		}
		search = find (search, classname, "player");
	}
	return (nump);
};

float (float tno) TeamFortress_TeamGetMaxPlayers =
{
	if ((tno == 1))
	{
		return (team1maxplayers);
	}
	if ((tno == 2))
	{
		return (team2maxplayers);
	}
	if ((tno == 3))
	{
		return (team3maxplayers);
	}
	if ((tno == 4))
	{
		return (team4maxplayers);
	}
	return (0);
};

float () TeamFortress_TeamGetWinner =
{
	local float i;
	local float j;
	local float highest;
	local float highestteam;

	i = 1;
	highest = 0;
	highestteam = 0;
	while ((i <= number_of_teams))
	{
		j = TeamFortress_TeamGetScoreFrags (i);
		if ((j > highest))
		{
			highest = j;
			highestteam = i;
		}
		i = (i + 1);
	}
	return (highestteam);
};

float () TeamFortress_TeamGetSecond =
{
	local float i;
	local float j;
	local float highest;
	local float highestteam;
	local float secondteam;
	local float second;

	i = 1;
	highestteam = TeamFortress_TeamGetWinner ();
	highest = TeamFortress_TeamGetScoreFrags (highestteam);
	secondteam = 0;
	second = 0;
	while ((i <= number_of_teams))
	{
		j = TeamFortress_TeamGetScoreFrags (i);
		if (((j < highest) && (j > second)))
		{
			second = j;
			secondteam = i;
		}
		i = (i + 1);
	}
	return (secondteam);
};

float () TeamFortress_CheckDraw =
{
	local float i;
	local float j;
	local float score;
	local float score2;
	local float result;
	local float no_teams;

	i = 1;
	score = 0;
	score2 = 0;
	result = 0;
	no_teams = TeamFortress_NoTeams ();
	while ((i <= no_teams))
	{
		j = TeamFortress_TeamGetScore (i);
		if ((i > 1))
		{
			score2 = j;
			if ((score != score2))
			{
				result = 0;
			}
			else
			{
				result = 1;
			}
		}
		else
		{
			score = j;
		}
		i = (i + 1);
	}
	return (result);
};

void (float all) TeamFortress_TeamShowScores =
{
	local string st;
	local float i;
	local float j;

	i = 1;
	if ((all == 2))
	{
		while ((i <= number_of_teams))
		{
			if ((TeamFortress_GetColor (i) > 0))
			{
				j = TeamFortress_TeamGetScore (i);
				st = TeamFortress_TeamGetColorString (i);
				bprint (2, st);
				bprint (2, ": ");
				st = ftos (j);
				bprint (2, st);
				bprint (2, " ");
			}
			i = (i + 1);
		}
		bprint (2, "\n");
		return;
	}
	while ((i <= number_of_teams))
	{
		if ((TeamFortress_GetColor (i) > 0))
		{
			if (all)
			{
				bprint (2, "Team ");
			}
			else
			{
				sprint (self, 2, "Team ");
			}
			st = ftos (i);
			if (all)
			{
				bprint (2, st);
			}
			else
			{
				sprint (self, 2, st);
			}
			if (all)
			{
				bprint (2, " (");
			}
			else
			{
				sprint (self, 2, " (");
			}
			st = TeamFortress_TeamGetColorString (i);
			if (all)
			{
				bprint (2, st);
			}
			else
			{
				sprint (self, 2, st);
			}
			if (all)
			{
				bprint (2, ") : ");
			}
			else
			{
				sprint (self, 2, ") : ");
			}
			j = TeamFortress_TeamGetScore (i);
			st = ftos (j);
			if (all)
			{
				bprint (2, st);
			}
			else
			{
				sprint (self, 2, st);
			}
			if (all)
			{
				bprint (2, "\n");
			}
			else
			{
				sprint (self, 2, "\n");
			}
		}
		i = (i + 1);
	}
};

string (float tno) TeamFortress_TeamGetColorString =
{
	local float col;

	col = TeamFortress_GetColor (tno);
	if ((col == 1))
	{
		return ("White");
	}
	if ((col == 2))
	{
		return ("Brown");
	}
	if ((col == 3))
	{
		return ("Blue");
	}
	if ((col == 4))
	{
		return ("Green");
	}
	if ((col == 5))
	{
		return ("Red");
	}
	if ((col == 6))
	{
		return ("Tan");
	}
	if ((col == 7))
	{
		return ("Pink");
	}
	if ((col == 8))
	{
		return ("Orange");
	}
	if ((col == 9))
	{
		return ("Purple");
	}
	if ((col == enter))
	{
		return ("DarkPurple");
	}
	if ((col == 11))
	{
		return ("Grey");
	}
	if ((col == 12))
	{
		return ("DarkGreen");
	}
	if ((col == 13))
	{
		return ("Yellow");
	}
	return ("DarkBlue");
};

void (entity Player) TeamFortress_TeamShowMemberClasses =
{
	local entity e;
	local float found;

	found = 0;
	e = find (world, classname, "player");
	while (e)
	{
		if ((((e.team_no == Player.team_no) || (e.team_no == 0)) && (e != Player)))
		{
			if ((e.model != string_null))
			{
				if (!found)
				{
					found = 1;
					sprint (self, 2, "The other members of your team are:\n");
				}
				sprint (Player, 2, e.netname);
				sprint (Player, 2, " : ");
				TeamFortress_PrintClassName (Player, e.playerclass, (e.tfstate & 8));
			}
		}
		e = find (e, classname, "player");
	}
	if (!found)
	{
		sprint (Player, 2, "There are no other players on your team.\n");
	}
};

void () TeamFortress_StatusQuery =
{
	local float ft;
	local string st;

	sprint (self, 2, "players per team: ");
	ft = TeamFortress_TeamGetNoPlayers (1);
	st = ftos (ft);
	sprint (self, 2, st);
	sprint (self, 2, "  ");
	ft = TeamFortress_TeamGetNoPlayers (2);
	st = ftos (ft);
	sprint (self, 2, st);
	sprint (self, 2, "  ");
	ft = TeamFortress_TeamGetNoPlayers (3);
	st = ftos (ft);
	sprint (self, 2, st);
	sprint (self, 2, "  ");
	ft = TeamFortress_TeamGetNoPlayers (4);
	st = ftos (ft);
	sprint (self, 2, st);
	sprint (self, 2, "\n");
	st = ftos (teamplay);
	sprint (self, 2, "Teamplay is ");
	sprint (self, 2, st);
	sprint (self, 2, "\n");
};

float (float tno) TeamFortress_TeamGetIllegalClasses =
{
	local entity te;

	te = find (world, classname, "info_tfdetect");
	if ((te != world))
	{
		if ((tno == 1))
		{
			return (te.maxammo_shells);
		}
		if ((tno == 2))
		{
			return (te.maxammo_nails);
		}
		if ((tno == 3))
		{
			return (te.maxammo_rockets);
		}
		if ((tno == 4))
		{
			return (te.maxammo_cells);
		}
	}
	return (0);
};

float (float tno) TeamFortress_TeamIsCivilian =
{
	if ((tno == 1))
	{
		if ((civilianteams & 1))
		{
			return (1);
		}
	}
	else
	{
		if ((tno == 2))
		{
			if ((civilianteams & 2))
			{
				return (1);
			}
		}
		else
		{
			if ((tno == 3))
			{
				if ((civilianteams & 4))
				{
					return (1);
				}
			}
			else
			{
				if ((civilianteams & 8))
				{
					return (1);
				}
			}
		}
	}
	return (0);
};

float (float tno) CheckClassAvailable =
{
	local float pc;

	pc = 1;
	while ((pc < enter))
	{
		if (!ClassIsRestricted (tno, pc))
		{
			return (1);
		}
		pc = (pc + 1);
	}
	return (0);
};

float (float tno, float pc) ClassIsRestricted =
{
	local float num;
	local float max;
	local entity te;
	local string st;

	if ((tno == 0))
	{
		return (0);
	}
	if ((pc == 1))
	{
		st = infokey (world, "cr_scout");
		max = stof (st);
	}
	else
	{
		if ((pc == 2))
		{
			st = infokey (world, "cr_sniper");
			max = stof (st);
		}
		else
		{
			if ((pc == 3))
			{
				st = infokey (world, "cr_soldier");
				max = stof (st);
			}
			else
			{
				if ((pc == 4))
				{
					st = infokey (world, "cr_demoman");
					max = stof (st);
				}
				else
				{
					if ((pc == 5))
					{
						st = infokey (world, "cr_medic");
						max = stof (st);
					}
					else
					{
						if ((pc == 6))
						{
							st = infokey (world, "cr_hwguy");
							max = stof (st);
						}
						else
						{
							if ((pc == 7))
							{
								st = infokey (world, "cr_pyro");
								max = stof (st);
							}
							else
							{
								if ((pc == 8))
								{
									st = infokey (world, "cr_spy");
									max = stof (st);
								}
								else
								{
									if ((pc == 9))
									{
										st = infokey (world, "cr_engineer");
										max = stof (st);
									}
									else
									{
										if ((pc == enter))
										{
											st = infokey (world, "cr_random");
											max = stof (st);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((max == -1))
	{
		return (1);
	}
	if ((max > 0))
	{
		num = 0;
		te = find (world, classname, "player");
		while (te)
		{
			if ((te.team_no == tno))
			{
				if ((pc == enter))
				{
					if ((te.tfstate & 8))
					{
						num = (num + 1);
					}
				}
				else
				{
					if (((te.playerclass == pc) || (te.nextpc == pc)))
					{
						if (!(te.tfstate & 8))
						{
							num = (num + 1);
						}
					}
				}
			}
			te = find (te, classname, "player");
		}
		if ((num >= max))
		{
			return (1);
		}
	}
	return (0);
};

void (float tno, entity ignore, string st) teamsprint =
{
	local entity te;

	if ((tno == 0))
	{
		return;
	}
	te = find (world, classname, "player");
	while (te)
	{
		if (((te.team_no == tno) && (te != ignore)))
		{
			sprint (te, 2, st);
		}
		te = find (te, classname, "player");
	}
};
