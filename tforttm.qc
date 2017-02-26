//=-=-=-=-=
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
	local string st;

	i = SBAR_GRENS;
	likely_team = (random () * number_of_teams);
	likely_team = ceil (likely_team);
	if ((likely_team == 0))
	{
		likely_team = number_of_teams;
	}
	lowest = SBAR_384;
	while ((i < (number_of_teams + SBAR_GRENS)))
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
		i = (i + SBAR_GRENS);
	}
	return (TeamFortress_TeamSet (likely_team));
};

float (float tno) TeamFortress_TeamGetColor =
{
	if (!self.playerclass)
	{
		return (SBAR_GRENS);
	}
	if ((tno == SBAR_GRENS))
	{
		return (14);
	}
	if ((tno == SBAR_PRINT))
	{
		return (5);
	}
	if ((tno == AS_MELEE))
	{
		return (13);
	}
	if ((tno == AS_MISSILE))
	{
		return (12);
	}
	return (0);
};

float (float tno) TeamFortress_GetColor =
{
	if ((tno == SBAR_GRENS))
	{
		return (14);
	}
	if ((tno == SBAR_PRINT))
	{
		return (5);
	}
	if ((tno == AS_MELEE))
	{
		return (13);
	}
	if ((tno == AS_MISSILE))
	{
		return (12);
	}
	return (0);
};

void (float tno) TeamFortress_TeamSetColor =
{
	if ((tno == SBAR_GRENS))
	{
		team1col = 14;
		return;
	}
	if ((tno == SBAR_PRINT))
	{
		team2col = 5;
		return;
	}
	if ((tno == AS_MELEE))
	{
		team3col = 13;
		return;
	}
	if ((tno == AS_MISSILE))
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
		if (!self.playerclass)
		{
			return ("observe");
		}
	}
	if ((tno == SBAR_GRENS))
	{
		st = infokey (world, "team1");
		if ((st == string_null))
		{
			return ("blue");
		}
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			st = infokey (world, "team2");
			if ((st == string_null))
			{
				return ("red");
			}
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				st = infokey (world, "team3");
				if ((st == string_null))
				{
					return ("yell");
				}
			}
			else
			{
				if ((tno == AS_MISSILE))
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

	if ((teamplay < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "Teamplay is not On, so FortressTeams are inactive.\n");
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
					if ((te.weaponmode == SBAR_GRENS))
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
		bprint (SBAR_PRINT, self.netname);
		bprint (SBAR_PRINT, " has joined as an Observer.\n");
		self.team_no = 0;
		self.playerclass = 0;
		return (SBAR_GRENS);
	}
	if (((tno > number_of_teams) && (number_of_teams != 0)))
	{
		sprint (self, SBAR_PRINT, "There can be only ");
		st = ftos (number_of_teams);
		sprint (self, SBAR_PRINT, st);
		sprint (self, SBAR_PRINT, " teams on this map.\nTry again\n");
		return (0);
	}
	if ((self.team_no == tno))
	{
		sprint (self, SBAR_PRINT, "You are already in that team. Pick another.\n");
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
				if ((te.weaponmode == SBAR_GRENS))
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
		ClientKill ();
		if (TeamFortress_TeamIsCivilian (tno))
		{
			self.nextpc = SBAR_200;
		}
		else
		{
			self.nextpc = 0;
		}
	}
	tc = TeamFortress_TeamGetNoPlayers (tno);
	if ((tc >= TeamFortress_TeamGetMaxPlayers (tno)))
	{
		sprint (self, SBAR_PRINT, "That team is full. Pick another.\n");
		return (0);
	}
	if ((TeamFortress_TeamGetColor (tno) == 0))
	{
		TeamFortress_TeamSetColor (tno);
		if ((TeamFortress_TeamGetColor (tno) == 0))
		{
			sprint (self, SBAR_PRINT, "You can't start a new team with your color, since another ");
			sprint (self, SBAR_PRINT, "already using that color. Change your pants color, then try again.\n");
			return (0);
		}
		bprint (SBAR_PRINT, self.netname);
		bprint (SBAR_PRINT, " has started Team No ");
		st = ftos (tno);
		bprint (SBAR_PRINT, st);
		bprint (SBAR_PRINT, ".\n");
		self.immune_to_check = (time + 5);
		if (((toggleflags & 128) || (toggleflags & 2048)))
		{
			self.frags = TeamFortress_TeamGetScore (tno);
		}
		stuffcmd (self, "color ");
		tc = (TeamFortress_TeamGetColor (tno) - SBAR_GRENS);
		st = ftos (tc);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		self.team_no = tno;
		SetTeamName (self);
		return (SBAR_GRENS);
	}
	bprint (SBAR_PRINT, self.netname);
	bprint (SBAR_PRINT, " has joined Team No ");
	st = ftos (tno);
	bprint (SBAR_PRINT, st);
	bprint (SBAR_PRINT, ".\n");
	self.playerclass = 0;
	self.team_no = tno;
	self.immune_to_check = (time + 5);
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		self.frags = TeamFortress_TeamGetScore (tno);
	}
	TeamFortress_TeamShowMemberClasses (self);
	return (SBAR_GRENS);
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
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing team.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your team. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
			st = infokey (self, "bottomcolor");
			tc = stof (st);
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
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
						self.immune_to_check = (floor (time) + SBAR_PRINT);
					}
					else
					{
						bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing top color.\n");
						sprint (self, SBAR_PRINT, "You have been kicked for changing your top color. Don't do it.\n");
						stuffcmd (self, "disconnect\n");
						return;
					}
				}
			}
			else
			{
				if ((self.team_no == SBAR_PRINT))
				{
					if (((self.playerclass == 8) && (self.undercover_team != 0)))
					{
						return;
					}
					if ((tc != (TeamFortress_GetColor (self.team_no) - SBAR_GRENS)))
					{
						stuffcmd (self, "topcolor ");
						tc = (TeamFortress_GetColor (self.team_no) - SBAR_GRENS);
						st = ftos (tc);
						stuffcmd (self, st);
						stuffcmd (self, "\n");
						if ((self.immune_to_check != floor (time)))
						{
							self.immune_to_check = (floor (time) + SBAR_PRINT);
						}
						else
						{
							bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing top color.\n");
							sprint (self, SBAR_PRINT, "You have been kicked for changing your top color. Don't do it.\n");
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
			if (((TeamFortress_GetColor (self.undercover_team) - SBAR_GRENS) != tc))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_GetColor (self.undercover_team) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing color.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your pants color. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
		}
		else
		{
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing color.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your pants color. Don't do it.\n");
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
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing skin.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your skin. Don't do it.\n");
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
				self.immune_to_check = (floor (time) + SBAR_PRINT);
			}
			else
			{
				bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing team.\n");
				sprint (self, SBAR_PRINT, "You have been kicked for changing your team. Don't do it.\n");
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
	if ((tno == SBAR_GRENS))
	{
		team1score = (team1score + scoretoadd);
	}
	if ((tno == SBAR_PRINT))
	{
		team2score = (team2score + scoretoadd);
	}
	if ((tno == AS_MELEE))
	{
		team3score = (team3score + scoretoadd);
	}
	if ((tno == AS_MISSILE))
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
	if ((tno == SBAR_GRENS))
	{
		return (team1score);
	}
	if ((tno == SBAR_PRINT))
	{
		return (team2score);
	}
	if ((tno == AS_MELEE))
	{
		return (team3score);
	}
	if ((tno == AS_MISSILE))
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
		if ((tno == SBAR_GRENS))
		{
			return (team1frags);
		}
		if ((tno == SBAR_PRINT))
		{
			return (team2frags);
		}
		if ((tno == AS_MELEE))
		{
			return (team3frags);
		}
		if ((tno == AS_MISSILE))
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
			size_team = (size_team + SBAR_GRENS);
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
				size_team = (size_team + SBAR_GRENS);
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
				size_team = (size_team + SBAR_GRENS);
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

	i = SBAR_GRENS;
	p = TeamFortress_GetNoPlayersClass (i);
	while ((i <= number_of_teams))
	{
		p = TeamFortress_GetNoPlayersClass (i);
		if ((p > 0))
		{
			no_teams = (no_teams + SBAR_GRENS);
		}
		i = (i + SBAR_GRENS);
	}
	return (no_teams);
};

float () TeamFortress_GetNoPlayers =
{
	local float nump;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.netname != string_null))
		{
			nump = (nump + SBAR_GRENS);
		}
		search = find (search, classname, "player");
	}
	return (nump);
};

float (float tno) TeamFortress_TeamGetMaxPlayers =
{
	if ((tno == SBAR_GRENS))
	{
		return (team1maxplayers);
	}
	if ((tno == SBAR_PRINT))
	{
		return (team2maxplayers);
	}
	if ((tno == AS_MELEE))
	{
		return (team3maxplayers);
	}
	if ((tno == AS_MISSILE))
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

	i = SBAR_GRENS;
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
		i = (i + SBAR_GRENS);
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

	i = SBAR_GRENS;
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
		i = (i + SBAR_GRENS);
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

	i = SBAR_GRENS;
	score2 = 0;
	result = 0;
	no_teams = TeamFortress_NoTeams ();
	while ((i <= no_teams))
	{
		j = TeamFortress_TeamGetScore (i);
		if ((i > SBAR_GRENS))
		{
			score2 = j;
			if ((score != score2))
			{
				result = 0;
			}
			else
			{
				result = SBAR_GRENS;
			}
		}
		else
		{
			score = j;
		}
		i = (i + SBAR_GRENS);
	}
	return (result);
};

void (float all) TeamFortress_TeamShowScores =
{
	local string st;
	local float i;
	local float j;

	i = SBAR_GRENS;
	if ((all == SBAR_PRINT))
	{
		while ((i <= number_of_teams))
		{
			if ((TeamFortress_GetColor (i) > 0))
			{
				j = TeamFortress_TeamGetScore (i);
				st = TeamFortress_TeamGetColorString (i);
				bprint (SBAR_PRINT, st);
				bprint (SBAR_PRINT, ": ");
				st = ftos (j);
				bprint (SBAR_PRINT, st);
				bprint (SBAR_PRINT, " ");
			}
			i = (i + SBAR_GRENS);
		}
		bprint (SBAR_PRINT, "\n");
		return;
	}
	while ((i <= number_of_teams))
	{
		if ((TeamFortress_GetColor (i) > 0))
		{
			if (all)
			{
				bprint (SBAR_PRINT, "Team ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "Team ");
			}
			st = ftos (i);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, " (");
			}
			else
			{
				sprint (self, SBAR_PRINT, " (");
			}
			st = TeamFortress_TeamGetColorString (i);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, ") : ");
			}
			else
			{
				sprint (self, SBAR_PRINT, ") : ");
			}
			j = TeamFortress_TeamGetScore (i);
			st = ftos (j);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, "\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "\n");
			}
		}
		i = (i + SBAR_GRENS);
	}
};

string (float tno) TeamFortress_TeamGetColorString =
{
	local float col;

	col = TeamFortress_GetColor (tno);
	if ((col == SBAR_GRENS))
	{
		return ("White");
	}
	if ((col == SBAR_PRINT))
	{
		return ("Brown");
	}
	if ((col == AS_MELEE))
	{
		return ("Blue");
	}
	if ((col == AS_MISSILE))
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
	if ((col == SBAR_200))
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
					found = SBAR_GRENS;
					sprint (self, SBAR_PRINT, "The other members of your team are:\n");
				}
				sprint (Player, SBAR_PRINT, e.netname);
				sprint (Player, SBAR_PRINT, " : ");
				TeamFortress_PrintClassName (Player, e.playerclass, (e.tfstate & 8));
			}
		}
		e = find (e, classname, "player");
	}
	if (!found)
	{
		sprint (Player, SBAR_PRINT, "There are no other players on your team.\n");
	}
};

void () TeamFortress_StatusQuery =
{
	local float ft;
	local string st;

	sprint (self, SBAR_PRINT, "players per team: ");
	ft = TeamFortress_TeamGetNoPlayers (SBAR_GRENS);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (SBAR_PRINT);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (AS_MELEE);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (AS_MISSILE);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "\n");
	st = ftos (teamplay);
	sprint (self, SBAR_PRINT, "Teamplay is ");
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "\n");
};

float (float tno) TeamFortress_TeamGetIllegalClasses =
{
	local entity te;

	te = find (world, classname, "info_tfdetect");
	if ((te != world))
	{
		if ((tno == SBAR_GRENS))
		{
			return (te.maxammo_shells);
		}
		if ((tno == SBAR_PRINT))
		{
			return (te.maxammo_nails);
		}
		if ((tno == AS_MELEE))
		{
			return (te.maxammo_rockets);
		}
		if ((tno == AS_MISSILE))
		{
			return (te.maxammo_cells);
		}
	}
	return (0);
};

float (float tno) TeamFortress_TeamIsCivilian =
{
	local entity te;

	if ((tno == SBAR_GRENS))
	{
		if ((civilianteams & SBAR_GRENS))
		{
			return (SBAR_GRENS);
		}
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			if ((civilianteams & SBAR_PRINT))
			{
				return (SBAR_GRENS);
			}
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				if ((civilianteams & AS_MISSILE))
				{
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((civilianteams & 8))
				{
					return (SBAR_GRENS);
				}
			}
		}
	}
	return (0);
};

float (float tno) CheckClassAvailable =
{
	local float pc;

	pc = SBAR_GRENS;
	while ((pc < enter))
	{
		if (!ClassIsRestricted (tno, pc))
		{
			return (SBAR_GRENS);
		}
		pc = (pc + SBAR_GRENS);
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
	if ((pc == SBAR_GRENS))
	{
		st = infokey (world, "cr_scout");
		max = stof (st);
	}
	else
	{
		if ((pc == SBAR_PRINT))
		{
			st = infokey (world, "cr_sniper");
			max = stof (st);
		}
		else
		{
			if ((pc == AS_MELEE))
			{
				st = infokey (world, "cr_soldier");
				max = stof (st);
			}
			else
			{
				if ((pc == AS_MISSILE))
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
		return (SBAR_GRENS);
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
						num = (num + SBAR_GRENS);
					}
				}
				else
				{
					if (((te.playerclass == pc) || (te.nextpc == pc)))
					{
						if (!(te.tfstate & 8))
						{
							num = (num + SBAR_GRENS);
						}
					}
				}
			}
			te = find (te, classname, "player");
		}
		if ((num >= max))
		{
			return (SBAR_GRENS);
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
			sprint (te, SBAR_PRINT, st);
		}
		te = find (te, classname, "player");
	}
};
