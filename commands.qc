//=-=-=-=-=

void () ShowVersion =
{
	sprint (self, 2, "\n\nΤθισ ισ Hue Team Fortress φεςσιοξ 1.45         βω Andi\n\nΣπεγιαμ τθαξψ το The Brazilian QWTF Community 2017 γςεατοςσ οζ Thanks to Mercury and all \nΑξδ ξοξε οτθες τθεξ τθε γςεατοςσ οζ \n\n Also thank you to ALL of the test dummies :).\n\n\nPlease visit θττπΊ――απ®ρημ®οςη―νεςγυςω― for more info. \n\n\n");
};

void () Commands =
{
	sprint (self, 2, "αβουτ...... about the Oztf Mod\nνοδστατυσ.. current settings\nβςεαλ...... vote matchend/stop countdown\nεμεγτ...... toggle admin election\nωεσ........ vote yes for current elective\nξο......... change vote\nζμασθ...... toggle flashlight\n");
	if ((self.is_admin == 1))
	{
		if ((stof (infokey (world, "adminlevel")) > 0))
		{
			sprint (self, 2, "\nAdmin Commands:\n\n");
			sprint (self, 2, "τινεδοχξ... decrease timelimit\nτινευπ..... increase timelimit\nπνδοχξ..... decrease prematch time\nπνυπ....... increase prematch time\nγζδοχξ..... decrease ceasefire time\nγζυπ....... increase ceasefire time\nοτδοχξ..... decrease overtime\nοτυπ....... increase overtime\nζςαησδοχξ.. reduce fraglimit\nζςαησυπ.... increase fraglimit\nσιμεξγε.... toggle spectator talk\nςεσταςτναπ. restart the current map\nσταςτνατγθ. starts clan match (requires clan mode on)\n");
			if ((stof (infokey (world, "adminlevel")) > 1))
			{
				sprint (self, 2, "ςεσετ...... reset all settings to standard\nγμαξσετυπ.. set clan settings && restart\nζμασθμιηθτ. (dis)allow flashlight\nγεασεζιςε.. freeze the gameplay\nζςεεϊε..... (un)freeze the map\nζβσλιξσ.... toggle full bright skins\nζςκυνπ..... toggle forward rocketjump\nποιξτιξη... toggle pointing\nεξενω...... toggle enemy printing\nηςεξπαγλ... toggle backpacks\nησπεεδ..... modify maximum ground speed\nτπ......... modify teamplay\nηιβσ....... toggle gibs\nσητωπε..... toggle sentry type\nσηζιςε..... toggle sentry fire\nπιπεδεμαω.. (dis)allow pipebomb delay\nσομιδδετ... toggle solid detpacks\n");
			}
			if ((stof (infokey (world, "adminlevel")) > 2))
			{
				sprint (self, 2, "δεαμ....... kick a player\nμιστιπσ.... list players ip addresses\n");
			}
			sprint (self, 2, "\n*** The following commands require a map restart ***\n\n");
			sprint (self, 2, "τεανζςαησ.. toggle teamfrags\nζυμμτσ..... toggle full team score\nηςαππμε.... toggle grapple\n");
			if ((stof (infokey (world, "adminlevel")) > 1))
			{
				sprint (self, 2, "γμαξ....... toggle clan mode\nτζφσδν..... toggle tfvsdm mode\nτζστςιλε... toggle tfstrike mode\nςουξδσ..... toggle rounds\nδυεμ....... toggle duel mode\nσπεεδγαπ... toggle speed capture mode\nθιηθμαξδες. toggle highlander mode\nπςαγτιγε... toggle practice mode\n");
			}
		}
	}
	if ((self.is_admin == 3))
	{
		sprint (self, 2, "\nAdmin Commands:\n\n");
		sprint (self, 2, "τινεδοχξ... decrease timelimit\nτινευπ..... increase timelimit\nπνδοχξ..... decrease prematch time\nπνυπ....... increase prematch time\nγζδοχξ..... decrease ceasefire time\nγζυπ....... increase ceasefire time\nοτδοχξ..... decrease overtime\nοτυπ....... increase overtime\nζςαησδοχξ.. reduce fraglimit\nζςαησυπ.... increase fraglimit\nσιμεξγε.... toggle spectator talk\nςεσταςτναπ. restart the current map\nσταςτνατγθ. starts clan match (requires clan mode on)\nςεσετ...... reset all settings to standard\nγμαξσετυπ.. set clan settings && restart\n");
		sprint (self, 2, "ζμασθμιηθτ. (dis)allow flashlight\nγεασεζιςε.. freeze the gameplay\nζςεεϊε..... (un)freeze the map\nζβσλιξσ.... toggle full bright skins\nζςκυνπ..... toggle forward rocketjump\nποιξτιξη... toggle pointing\nεξενω...... toggle enemy printing\nηςεξπαγλ... toggle backpacks\nησπεεδ..... modify maximum ground speed\nτπ......... modify teamplay\nηιβσ....... toggle gibs\nσητωπε..... toggle sentry type\nσηζιςε..... toggle sentry fire\nπιπεδεμαω.. (dis)allow pipebomb delay\nσομιδδετ... toggle solid detpacks\n");
		sprint (self, 2, "δεαμ....... kick a player\nμιστιπσ.... list players ip addresses\n");
		sprint (self, 2, "\n*** The following commands require a map restart ***\n\n");
		sprint (self, 2, "γμαξ....... toggle clan mode\nτζφσδν..... toggle tfvsdm mode\nτζστςιλε... toggle tfstrike mode\nτεανζςαησ.. toggle teamfrags\nζυμμτσ..... toggle full team score\nηςαππμε.... toggle grapple\n");
		sprint (self, 2, "θιηθμαξδες. toggle highlander mode\nςουξδσ..... toggle rounds\nδυεμ....... toggle duel mode\nσπεεδγαπ... toggle speed capture mode\nπςαγτιγε... toggle practice mode\n");
	}
};

void (entity print) ShowFrags =
{
	local entity te;
	local float eff;
	local float ifrags;
	local string st;

	sprint (print, 2, "\n");
	sprint (print, 2, " Frags  TK's  Deaths  Eff  Name\n");
	sprint (print, 2, "\n");
	te = find (world, classname, "player");
	while (te)
	{
		if ((te.real_frags <= 0))
		{
			eff = 0;
		}
		else
		{
			eff = ((te.real_frags / (te.real_frags + te.deaths)) * 100);
			eff = rint (eff);
		}
		st = ftos (te.real_frags);
		if ((te.real_frags < enter))
		{
			sprint3 (print, 2, "  ", st, "     ");
		}
		else
		{
			if ((te.real_frags < 100))
			{
				sprint3 (print, 2, "  ", st, "    ");
			}
			else
			{
				sprint3 (print, 2, "  ", st, "   ");
			}
		}
		st = ftos (te.teamkills);
		if ((te.teamkills < enter))
		{
			sprint2 (print, 2, st, "      ");
		}
		else
		{
			if ((te.teamkills < 100))
			{
				sprint2 (print, 2, st, "     ");
			}
			else
			{
				sprint2 (print, 2, st, "     ");
			}
		}
		st = ftos (te.deaths);
		if ((te.deaths < enter))
		{
			sprint2 (print, 2, st, "      ");
		}
		else
		{
			if ((te.deaths < 100))
			{
				sprint2 (print, 2, st, "     ");
			}
			else
			{
				sprint2 (print, 2, st, "     ");
			}
		}
		st = ftos (eff);
		if ((eff < enter))
		{
			sprint2 (print, 2, st, "     ");
		}
		else
		{
			if ((eff < 100))
			{
				sprint2 (print, 2, st, "    ");
			}
			else
			{
				sprint2 (print, 2, st, "   ");
			}
		}
		sprint2 (print, 2, te.netname, "\n");
		te = find (te, classname, "player");
	}
	if ((number_of_teams == 2))
	{
		sprint (print, 2, "\n\n");
		sprint (print, 2, " Team Scores:\n Team1:   ");
		st = ftos (team1score);
		sprint2 (print, 2, st, "     Team2:   ");
		st = ftos (team2score);
		sprint2 (print, 2, st, "\n");
	}
	else
	{
		sprint (print, 2, "\n\n");
		sprint (print, 2, " Team Scores:\n Team1:   ");
		st = ftos (team1score);
		sprint2 (print, 2, st, "     Team2:   ");
		st = ftos (team2score);
		sprint2 (print, 2, st, "\n Team3:   ");
		st = ftos (team3score);
		sprint2 (print, 2, st, "     Team4:   ");
		st = ftos (team4score);
		sprint2 (print, 2, st, "\n");
	}
	sprint (print, 2, "\n");
};

void () ShowFps =
{
	local entity te;
	local float r;
	local float fps;
	local string st;

	sprint (self, 2, "\n");
	sprint (self, 2, " Fps    Speed       Name\n");
	sprint (self, 2, "\n");
	te = find (world, classname, "player");
	while (te)
	{
		fps = floor ((1000 / ((te.fAverageFrameTime / te.fFrameCount) * 1000)));
		st = ftos (fps);
		sprint3 (self, 2, " ", st, "     ");
		r = fabs (((te.fAverageFrameTime * 100) / (time - te.real_time)));
		st = ftos (r);
		sprint2 (self, 2, st, "%       ");
		sprint2 (self, 2, te.netname, "\n");
		te = find (te, classname, "player");
	}
	sprint (self, 2, "\n");
};

void () ShowStats =
{
	local string st;
	local float eff;

	sprint (self, 2, "\n");
	sprint3 (self, 2, " ", self.netname, "'s Statistics\n");
	sprint (self, 2, "\n");
	if (self.enemy)
	{
		sprint3 (self, 2, " Last enemy: ", self.enemy.netname, "\n");
	}
	st = ftos (self.real_frags);
	sprint3 (self, 2, " Frags:      ", st, "\n");
	st = ftos (self.deaths);
	sprint3 (self, 2, " Deaths:     ", st, "\n");
	st = ftos (self.deaths);
	sprint3 (self, 2, " Teamkills:  ", st, "\n");
	if ((self.real_frags <= 0))
	{
		eff = 0;
	}
	else
	{
		eff = ((self.real_frags / (self.real_frags + self.deaths)) * 100);
		eff = rint (eff);
	}
	st = ftos (eff);
	sprint3 (self, 2, " Efficiency: ", st, "\n\n");
	st = ftos (rint (self.dmg_inflicted));
	sprint3 (self, 2, " Damage given:  ", st, "\n");
	st = ftos (rint (self.dmg_recieved));
	sprint3 (self, 2, " Damage taken:  ", st, "\n");
	st = ftos (rint (self.dmg_self));
	sprint3 (self, 2, " Damage self:   ", st, "\n");
	st = ftos (rint (self.dmg_team));
	sprint3 (self, 2, " Damage team:   ", st, "\n");
	sprint (self, 2, "\n");
};

void () ModStatus =
{
	local string tmp;
	local float f1;

	tmp = ftos (teamplay);
	sprint3 (self, 2, "Τεανπμαω        ", tmp, "\n");
	tmp = ftos ((timelimit / 60));
	sprint3 (self, 2, "Τινεμινιτ       ", tmp, "  ");
	if ((timelimit < enter))
	{
		sprint (self, 2, " ");
	}
	tmp = ftos (fraglimit);
	sprint3 (self, 2, "\nΖςαημινιτ       ", tmp, "\n");
	if (clanbattle)
	{
		sprint3 (self, 2, "Clan Mode       ", tmp, "\n");
	}
	else
	{
		sprint (self, 2, "Clan Mode       off\n");
	}
	tmp = infokey (world, "overtime");
	if (stof (tmp))
	{
		sprint3 (self, 2, "Overtime        ", tmp, "\n");
	}
	else
	{
		sprint (self, 2, "Overtime        off\n");
	}
	tmp = infokey (world, "teamfrags");
	if ((tmp == "on"))
	{
		sprint3 (self, 2, "Teamfrags       ", tmp, "\n");
	}
	else
	{
		sprint (self, 2, "Teamfrags       off\n");
	}
	tmp = infokey (world, "fullteamscore");
	if ((tmp == "on"))
	{
		sprint3 (self, 2, "Full Team Score ", tmp, "\n");
	}
	else
	{
		sprint (self, 2, "Full Team Score off\n");
	}
	tmp = ftos (gspeed);
	sprint3 (self, 2, "Ground speed    ", tmp, "\n");
	if (tfvsdm)
	{
		sprint (self, 2, "ΤΖφσΔΝ:         on\n");
	}
	else
	{
		sprint (self, 2, "ΤΖφσΔΝ:         off\n");
	}
	if (tfstrike)
	{
		sprint (self, 2, "TFStrike:       on\n");
	}
	else
	{
		sprint (self, 2, "TFStrike:       off\n");
	}
	if (allow_grenpack)
	{
		sprint (self, 2, "Gren Backpacks: on\n");
	}
	if (pipedelay)
	{
		sprint (self, 2, "Pipebomb Delay: on\n");
	}
	else
	{
		sprint (self, 2, "Pipebomb Delay: off\n");
	}
	tmp = infokey (world, "gibs");
	if ((tmp == "off"))
	{
		sprint3 (self, 2, "Player Gibs     ", tmp, " \n");
	}
	if (allow_hook)
	{
		sprint (self, 2, "Grapple:        on\n");
	}
	else
	{
		sprint (self, 2, "Grapple:        off\n");
	}
	if (allow_flash)
	{
		sprint (self, 2, "Flash light:    on\n");
	}
	else
	{
		sprint (self, 2, "Flash light:    off\n");
	}
	if (!sentry_fire)
	{
		sprint (self, 2, "Sentry Fire: Normal\n");
	}
	else
	{
		if ((sentry_fire == 1))
		{
			sprint (self, 2, "Sentry Fire: Lightning\n");
		}
		else
		{
			if ((sentry_fire == 2))
			{
				sprint (self, 2, "Sentry Fire: Laser\n");
			}
		}
	}
	tmp = infokey (world, "highlander");
	if ((tmp == "on"))
	{
		sprint (self, 2, "Highlander mode on\n");
	}
	if (duel)
	{
		sprint (self, 2, "Duel mode:      on\n");
	}
	if (speedcap)
	{
		sprint (self, 2, "Speed capture:  on\n");
	}
	if (practice)
	{
		sprint (self, 2, "Practice:       on\n");
	}
	if ((rounds < 0))
	{
		sprint (self, 2, "Rounds:         on\n");
	}
	else
	{
		if ((rounds > 1))
		{
			tmp = ftos (rounds);
			sprint3 (self, 2, "Rounds:        ", tmp, "\n");
		}
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 256))
	{
		sprint (self, 2, "ζυμμβςιηθτ σλιξσ disabled\n");
	}
	else
	{
		sprint (self, 2, "ζυμμβςιηθτ σλιξσ enabled\n");
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 128))
	{
		sprint (self, 2, "ποιξτιξη disabled\n");
	}
	else
	{
		sprint (self, 2, "ποιξτιξη enabled\n");
	}
	if (elect)
	{
		tmp = ftos (elect);
		sprint3 (self, 2, "\nElection in progress\n", tmp, "‘ votes received\n");
	}
};

void (float t) TimeDown =
{
	local string tmp;
	local float lowest;
	local float tl;

	lowest = 0;
	tl = ((timelimit / 60) - t);
	if ((tl < 1))
	{
		tl = lowest;
	}
	tmp = ftos (tl);
	bprint3 (2, "Νατγθ μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	timelimit = (tl * 60);
	cvar_set ("timelimit", tmp);
};

void (float t) TimeUp =
{
	local string tmp;
	local float highest;
	local float tl;

	highest = _F;
	tl = ((timelimit / 60) + t);
	if ((tl > highest))
	{
		tl = highest;
	}
	tmp = ftos (tl);
	bprint3 (2, "Νατγθ μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	timelimit = (tl * 60);
	cvar_set ("timelimit", tmp);
};

void (float t) PmTimeDown =
{
	local string tmp;
	local float lowest;
	local float pm;

	lowest = 0;
	tmp = infokey (world, "prematch");
	pm = (stof (tmp) - t);
	if ((pm < lowest))
	{
		pm = lowest;
	}
	tmp = ftos (pm);
	bprint3 (2, "Prematch μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo prematch ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) PmTimeUp =
{
	local string tmp;
	local float highest;
	local float pm;

	highest = 15;
	tmp = infokey (world, "prematch");
	pm = stof (tmp);
	pm = (pm + t);
	if ((pm > highest))
	{
		pm = highest;
	}
	tmp = ftos (pm);
	bprint3 (2, "Prematch μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo prematch ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) CFTimeDown =
{
	local string tmp;
	local float lowest;
	local float cft;

	lowest = 0;
	tmp = infokey (world, "cft");
	cft = (stof (tmp) - t);
	if ((cft < lowest))
	{
		cft = lowest;
	}
	tmp = ftos (cft);
	bprint3 (2, "Ceasefire time σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo cft ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) CFTimeUp =
{
	local string tmp;
	local float highest;
	local float cft;

	highest = 15;
	tmp = infokey (world, "cft");
	cft = stof (tmp);
	cft = (cft + t);
	if ((cft > highest))
	{
		cft = highest;
	}
	tmp = ftos (cft);
	bprint3 (2, "Ceasefire time σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo cft ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) OverTimeDown =
{
	local string tmp;
	local float lowest;
	local float ot;

	lowest = 0;
	tmp = infokey (world, "overtime");
	ot = (stof (tmp) - t);
	if ((ot < lowest))
	{
		ot = lowest;
	}
	tmp = ftos (ot);
	bprint3 (2, "Overtime μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo overtime ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) OverTimeUp =
{
	local string tmp;
	local float highest;
	local float ot;

	highest = enter;
	tmp = infokey (world, "overtime");
	ot = stof (tmp);
	ot = (ot + t);
	if ((ot > highest))
	{
		ot = highest;
	}
	tmp = ftos (ot);
	bprint3 (2, "Overtime μεξητθ σετ το ", tmp, " νιξυτεσ\n");
	localcmd ("localinfo overtime ");
	localcmd (tmp);
	localcmd ("\n");
};

void () FragsDown =
{
	local string tmp;

	fraglimit = (fraglimit - enter);
	if ((fraglimit < 0))
	{
		fraglimit = 0;
	}
	tmp = ftos (fraglimit);
	bprint3 (2, "Ζςαημινιτ σετ το ", tmp, "\n");
	cvar_set ("fraglimit", tmp);
};

void () FragsUp =
{
	local string tmp;

	fraglimit = (fraglimit + enter);
	tmp = ftos (fraglimit);
	bprint3 (2, "Ζςαημινιτ σετ το ", tmp, "\n");
	cvar_set ("fraglimit", tmp);
};

void () ChangeTP =
{
	local string tmp;
	local string desc;

	if ((teamplay == 1))
	{
		teamplay = 11;
		tmp = "11?TeamFortress";
		desc = "Team-members inflict half damamge.\n";
	}
	else
	{
		if ((teamplay == 11))
		{
			teamplay = 13;
			tmp = "13?TeamFortress";
			desc = "Team-members take half damage from area effects, No damage from direct fire.\n";
		}
		else
		{
			if ((teamplay == 13))
			{
				teamplay = 19;
				tmp = "19?TeamFortress";
				desc = "Team-members take half damage from direct fire.\n";
			}
			else
			{
				if ((teamplay == 19))
				{
					teamplay = 21;
					tmp = "21?TeamFortress";
					desc = "Team-members inflicts armor damage only.\n";
				}
				else
				{
					if ((teamplay == 21))
					{
						teamplay = 641;
						tmp = "641?TeamFortress";
						desc = "Team-members inflict half damage to armor.\n";
					}
					else
					{
						if ((teamplay == 641))
						{
							teamplay = 1301;
							tmp = "1301?TeamFortress";
							desc = "Team-members inflict no damage.\n";
						}
						else
						{
							if ((teamplay == 1301))
							{
								teamplay = 10241;
								tmp = "10241?TeamFortress";
								desc = "Team-members take half mirror damage.\n";
							}
							else
							{
								if ((teamplay == 10241))
								{
									teamplay = 20481;
									tmp = "20481?TeamFortress";
									desc = "Team-members take full mirror damage.\n";
								}
								else
								{
									teamplay = 1;
									tmp = "1?TeamFortress";
									desc = "Teamplay On\n";
								}
							}
						}
					}
				}
			}
		}
	}
	cvar_set ("teamplay", tmp);
	ftos (teamplay);
	bprint3 (2, "Teamplay set to: ", ftos (teamplay), " - ");
	bprint (2, desc);
};

void () ClanMode =
{
	local string st;

	st = infokey (world, "clan");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo clan off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo clan on\n");
		bprint (2, "Map Restart needed to take affect!\n");
	}
	bprint3 (2, "Clan Mode set to ", st, "\n");
};

void () RestartMap =
{
	localcmd ("map ");
	localcmd (mapname);
	localcmd ("\n");
};

void () ToggleSpecTalk =
{
	local float tmp;
	local float tmp2;
	local string s1;

	tmp2 = stof (infokey (world, "fpd"));
	tmp2 = (tmp2 - (tmp2 & 64));
	tmp = stof (infokey (world, "spectalk"));
	bprint (2, "Spectalk ");
	if ((tmp != 0))
	{
		localcmd ("sv_spectalk 0\nserverinfo fpd ");
		tmp2 = (tmp2 + 64);
		s1 = ftos (tmp2);
		localcmd (s1);
		localcmd ("\nlocalinfo spectalk 0\n");
		bprint (2, "off: πμαωεςσ γαξ ξο μοξηες θεας σπεγτατοςσ\n");
		return;
	}
	localcmd ("sv_spectalk 1\nserverinfo fpd ");
	s1 = ftos (tmp2);
	localcmd (s1);
	localcmd ("\nlocalinfo spectalk 1\n");
	bprint (2, "on: πμαωεςσ γαξ ξοχ θεας σπεγτατοςσ\n");
	return;
};

void () GroundSpeed =
{
	local string tmp;
	local string desc;

	if ((gspeed == 0))
	{
		gspeed = 1;
		desc = "Maximum Ground Speed set to maximum Class Speed.";
	}
	else
	{
		if ((gspeed == 1))
		{
			gspeed = 1.25;
			desc = "Maximum Ground Speed set to 1.25 times the maximum Class Speed.";
		}
		else
		{
			if ((gspeed == 1.25))
			{
				gspeed = 1.5;
				desc = "Maximum Ground Speed set to 1.5 times the maximum Class Speed.";
			}
			else
			{
				if ((gspeed == 1.5))
				{
					gspeed = 1.75;
					desc = "Maximum Ground Speed set to 1.75 times the maximum Class Speed.";
				}
				else
				{
					if ((gspeed == 1.75))
					{
						gspeed = 2;
						desc = "Maximum Ground Speed set to 2 times the maximum Class Speed.";
					}
					else
					{
						gspeed = 0;
						desc = "Ground Speed Normal.";
					}
				}
			}
		}
	}
	bprint3 (2, desc, "\n");
	localcmd ("localinfo gspeed ");
	localcmd (ftos (gspeed));
	localcmd ("\n");
};

void () ToggleFreeze =
{
	if ((freeze == 0))
	{
		freeze = 1;
		localcmd ("localinfo freeze on\n");
		bprint2 (2, self.netname, " freezes map\n");
	}
	else
	{
		freeze = 0;
		localcmd ("localinfo freeze off\n");
		bprint2 (2, self.netname, " unfreezes map\n");
	}
};

void () Toggle_TFvsDM =
{
	local string st;

	st = infokey (world, "tfvsdm");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo tfvsdm off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo tfvsdm on\n");
	}
	bprint3 (2, "TFvsDM Mode set to ", st, "\n");
};

void () Toggle_SpeedCap =
{
	local string st;

	st = infokey (world, "speedcap");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo speedcap off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo speedcap on\n");
	}
	bprint3 (2, "Speed Capture Mode set to ", st, "\n");
};

void () Toggle_Practice =
{
	local string st;

	st = infokey (world, "practice");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo practice off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo practice on\n");
	}
	bprint3 (2, "Practice Mode set to ", st, "\n");
};

void () Toggle_TFStrike =
{
	local string st;

	st = infokey (world, "tfstrike");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo tfstrike off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo tfstrike on\n");
	}
	bprint3 (2, "TFStrike Mode set to ", st, "\n");
};

void () Toggle_Duel =
{
	local string st;

	st = infokey (world, "duel");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo duel off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo duel on\n");
	}
	bprint3 (2, "Duel Mode set to ", st, "\n");
};

void () Toggle_Rounds =
{
	local string st;

	st = infokey (world, "rounds");
	if ((st == "off"))
	{
		st = "on";
		localcmd ("localinfo rounds on\n");
	}
	else
	{
		st = "off";
		localcmd ("localinfo rounds off\n");
	}
	bprint3 (2, "Rounds set to ", st, "\n");
};

void () ToggleFlash =
{
	local string st;

	st = infokey (world, "flashlight");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo flashlight ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Flash light set to ", st, " \n");
};

void () Check_illclasses =
{
	local string st;

	st = infokey (world, "cr_scout");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_scout 0\n");
	}
	st = infokey (world, "cr_sniper ");
	st = infokey (world, "cr_soldier");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_soldier 0\n");
	}
	st = infokey (world, "cr_demoman");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_demoman 0\n");
	}
	st = infokey (world, "cr_medic");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_medic 0\n");
	}
	st = infokey (world, "cr_hwguy");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_hwguy 0\n");
	}
	st = infokey (world, "cr_pyro");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_pyro 0\n");
	}
	st = infokey (world, "cr_spy");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_spy 0\n");
	}
	st = infokey (world, "cr_engineer");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_engineer 0\n");
	}
	st = infokey (world, "cr_random");
	if ((stof (st) == 1))
	{
		localcmd ("localinfo cr_random 0\n");
	}
};

void () ResetSetup =
{
	cvar_set ("teamplay", "21?TeamFortress");
	cvar_set ("timelimit", "40");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo tfvsdm off\n");
	localcmd ("localinfo clan off\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	Check_illclasses ();
	RestartMap ();
};

void () ClanSetup =
{
	local float f1;

	cvar_set ("teamplay", "1?TeamFortress");
	cvar_set ("timelimit", "35");
	localcmd ("localinfo prematch 3\n");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo clan on\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	Check_illclasses ();
	f1 = stof (infokey (world, "fpd"));
	if (!(f1 & 256))
	{
		localcmd ("serverinfo fpd ");
		f1 = (f1 | 256);
		localcmd (ftos (f1));
		localcmd ("\n");
	}
	localcmd ("serverinfo fbskins 0\n");
	RestartMap ();
};

void () Toggle_Quad =
{
	cvar_set ("teamplay", "1?TeamFortress");
	cvar_set ("timelimit", "10");
	localcmd ("localinfo prematch 2\n");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo clan on\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	localcmd ("localinfo cr_soldier 1\n");
	RestartMap ();
};

void () Toggle_Teamfrags =
{
	local string st;

	st = infokey (world, "teamfrags");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo teamfrags ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Teamfrags set to ", st, " \n");
};

void () Toggle_Fullts =
{
	local string st;

	st = infokey (world, "fullteamscore");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo fullteamscore ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Full Team Score set to ", st, " \n");
};

void () Toggle_Grapple =
{
	local string st;

	st = infokey (world, "grapple");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo grapple ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Grapple set to ", st, " \n");
};

void () TogglePointing =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 128));
	if ((f1 & 128))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "ποιξτιξη enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 128);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "ποιξτιξη disabled\n");
	}
};

void () ToggleEnemy =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & space));
	if ((f1 & space))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "enemy reporting allowed\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + space);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "enemy reporting disallowed\n");
	}
};

void () ToggleFbskins =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 256));
	if ((f1 & 256))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		localcmd ("serverinfo fbskins 1\n");
		bprint (2, "Fullbright skins enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 256);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		localcmd ("serverinfo fbskins 0\n");
		bprint (2, "Fullbright skins disabled\n");
	}
};

void () Toggle_Frj =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 32768));
	if ((f1 & 32768))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "Forward Rocketjump enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 32768);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (2, "Forward Rocketjump disabled\n");
	}
};

void () Toggle_flag_emu =
{
	local string st;
	local float fl;

	fl = stof (infokey (world, "flag_model"));
	if ((fl == 0))
	{
		fl = 1;
		st = "TF Flag.";
	}
	else
	{
		if ((fl == 1))
		{
			fl = 2;
			st = "TF Standard.";
		}
		else
		{
			if ((fl == 2))
			{
				fl = 3;
				st = "CTF Flag.";
			}
			else
			{
				fl = 0;
				st = "Map default.";
			}
		}
	}
	localcmd ("localinfo flag_model ");
	localcmd (ftos (fl));
	localcmd ("\n");
	bprint3 (2, "Goal Item model set to ", st, " \n");
};

void () Toggle_Grenpacks =
{
	local string st;

	st = infokey (world, "grenpacks");
	if ((st == "on"))
	{
		st = "off";
		allow_grenpack = 0;
		bprint (2, "Backpacks Normal.\n");
	}
	else
	{
		st = "on";
		allow_grenpack = 1;
		bprint (2, "Backpacks now Include Grenades / Detpack.\n");
	}
	localcmd ("localinfo grenpacks ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_Gibs =
{
	local string st;

	st = infokey (world, "gibs");
	if ((st == "off"))
	{
		st = "on";
	}
	else
	{
		st = "off";
	}
	localcmd ("localinfo gibs ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Gibs set to ", st, " \n");
};

void () Toggle_Highlander =
{
	local string st;

	st = infokey (world, "highlander");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo highlander ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Highlander mode set to ", st, " \n");
};

void () Toggle_SentryType =
{
	local string st;
	local float fl;

	if ((sgtype == 0))
	{
		sgtype = 1;
		bprint (2, "Sentries Special (Oztf).\n");
	}
	else
	{
		sgtype = 0;
		bprint (2, "Sentries Normal (TF 2.9).\n");
	}
	st = ftos (sgtype);
	localcmd ("localinfo sentrytype ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_GrenType =
{
	local string st;
	local float fl;

	if ((grentype == 0))
	{
		grentype = 1;
		bprint (2, "Grenades Special (Oztf).\n");
	}
	else
	{
		grentype = 0;
		bprint (2, "Grenades Normal (TF 2.9).\n");
	}
	st = ftos (grentype);
	localcmd ("localinfo grentype ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_SentryFire =
{
	local string st;
	local float fl;

	if (!sgtype)
	{
		if ((self == world))
		{
			dprint ("Sentry type is currently Normal. Change sentry type to enable firing mode.\n");
		}
		else
		{
			sprint (self, 2, "Sentry type is currently Normal. Change sentry type to enable firing mode.\n");
		}
		return;
	}
	st = infokey (world, "sentryfire");
	fl = stof (st);
	if (((fl < 1) || (fl > 2)))
	{
		st = "Lightning";
		sentry_fire = 1;
	}
	else
	{
		if ((fl == 1))
		{
			st = "Laser";
			sentry_fire = 2;
		}
		else
		{
			st = "Normal";
			sentry_fire = 0;
		}
	}
	localcmd ("localinfo sentryfire ");
	localcmd (ftos (sentry_fire));
	localcmd ("\n");
	bprint3 (2, "Sentry Fire set to ", st, " \n");
};

void () Toggle_PipeDelay =
{
	local string st;

	st = infokey (world, "pipedelay");
	if ((st == "off"))
	{
		st = "on";
		pipedelay = 1;
	}
	else
	{
		st = "off";
		pipedelay = 0;
	}
	localcmd ("localinfo pipedelay ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Demoman Pipebomb Delay set to ", st, " \n");
};

void () Toggle_Detpack =
{
	local string st;

	st = infokey (world, "soliddet");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo soliddet ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (2, "Solid Detpacks σετ το ", st, " \n");
};

void () Toggle_Lighting =
{
	if (lights)
	{
		Deluminate ();
	}
	else
	{
		Eluminate ();
	}
};

