float MSG_UPDATENAME    = 13;
float MSG_UPDATEFRAGS    = 14;
float MSG_UPDATECOLORS    = 17;
float SCOUT    = 1;
float SNIPER    = 2;
float SOLDIER    = 3;
float DEMOMAN    = 4;
float MEDIC    = 5;
float HWGUY    = 6;
float PYRO    = 7;
float SPY    = 8;
float ENGINEER    = 9;
void (float whichteam, float whichClass) botConnect;
void (entity bot) botDisconnect;
void (float clientno) botInvalidClientNo;
void (float clientno, float clientfrags) svcUpdateFrags;
void (float clientno, float clientping) svcUpdatePing;
void (float clientno, float cliententertime) svcUpdateEnterTime;
void (float clientno, float clientid, float clientshirt, float clientpants, string clientname, float botteam, float botskin) svcUpdateUserInfo;

void () ClientFixRankings =
{
	local float cno;
	local entity bott;

	self.ishuman = TRUE;
	if ((self.switch_wallhug > time))
	{
		return;
	}
	self.switch_wallhug = 0;
	bott = nextent (world);
	cno = 0;
	while ((cno < fMaxClients))
	{
		if ((!bott.ishuman && clientIsActive (cno)))
		{
			svcUpdatePing (bott.fClientNo, bott.botskill);
			svcUpdateEnterTime (bott.fClientNo, (time - bott.fEnterTime));
			svcUpdateUserInfo (bott.fClientNo, bott.fUserID, bott.fShirt, bott.fPants, bott.netname, bott.team_no, bott.skin);
			svcUpdateFrags (bott.fClientNo, bott.frags);
		}
		cno = (cno + 1);
		bott = nextent (bott);
	}
};

void () ClientInRankings =
{
	local float cno;

	if ((self.ishuman == BOT_FIGHTING))
	{
		self.ishuman = FALSE;
		return;
	}
	cno = (self.colormap - 1);
	botInvalidClientNo (cno);
	clientSetUsed (cno);
	self.fClientNo = cno;
	self.ishuman = TRUE;
	self.switch_wallhug = (time + 1);
};

void (float clientno, float clientfrags) svcUpdateFrags =
{
	WriteByte (BOT_FIGHTING, 14);
	WriteByte (BOT_FIGHTING, clientno);
	WriteShort (BOT_FIGHTING, clientfrags);
};

void (float clientno, float clientping) svcUpdatePing =
{
	WriteByte (BOT_FIGHTING, 36);
	WriteByte (BOT_FIGHTING, clientno);
	WriteShort (BOT_FIGHTING, clientping);
};

void (float clientno, float cliententertime) svcUpdateEnterTime =
{
	WriteByte (BOT_FIGHTING, 37);
	WriteByte (BOT_FIGHTING, clientno);
	WriteLong (BOT_FIGHTING, cliententertime);
};

void (float clientno, float clientid, float clientshirt, float clientpants, string clientname, float botteam, float botskin) svcUpdateUserInfo =
{
	WriteByte (BOT_FIGHTING, 40);
	WriteByte (BOT_FIGHTING, clientno);
	WriteLong (BOT_FIGHTING, clientid);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 115);
	WriteByte (BOT_FIGHTING, 103);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 49);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 114);
	WriteByte (BOT_FIGHTING, 97);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 53);
	WriteByte (BOT_FIGHTING, 48);
	WriteByte (BOT_FIGHTING, 48);
	WriteByte (BOT_FIGHTING, 48);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 119);
	WriteByte (BOT_FIGHTING, 95);
	WriteByte (BOT_FIGHTING, 115);
	WriteByte (BOT_FIGHTING, 119);
	WriteByte (BOT_FIGHTING, 105);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 99);
	WriteByte (BOT_FIGHTING, 104);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 50);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 98);
	WriteByte (BOT_FIGHTING, 95);
	WriteByte (BOT_FIGHTING, 115);
	WriteByte (BOT_FIGHTING, 119);
	WriteByte (BOT_FIGHTING, 105);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 99);
	WriteByte (BOT_FIGHTING, 104);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 50);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 110);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 97);
	WriteByte (BOT_FIGHTING, 105);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 48);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 115);
	WriteByte (BOT_FIGHTING, 112);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 99);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 97);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 114);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 48);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 112);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 100);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 108);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 49);
	WriteByte (BOT_FIGHTING, 51);
	WriteByte (BOT_FIGHTING, 56);
	WriteByte (BOT_FIGHTING, 52);
	WriteByte (BOT_FIGHTING, 53);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 100);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 108);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 54);
	WriteByte (BOT_FIGHTING, 57);
	WriteByte (BOT_FIGHTING, 54);
	WriteByte (BOT_FIGHTING, 55);
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 98);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 99);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 108);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 114);
	WriteByte (BOT_FIGHTING, 92);
	if ((clientpants > BOT_AI_FLAGRUN))
	{
		WriteByte (BOT_FIGHTING, 49);
		WriteByte (BOT_FIGHTING, (38 + clientpants));
	}
	else
	{
		WriteByte (BOT_FIGHTING, (48 + clientpants));
	}
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 112);
	WriteByte (BOT_FIGHTING, 99);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 108);
	WriteByte (BOT_FIGHTING, 111);
	WriteByte (BOT_FIGHTING, 114);
	WriteByte (BOT_FIGHTING, 92);
	if ((clientshirt > BOT_AI_FLAGRUN))
	{
		WriteByte (BOT_FIGHTING, 49);
		WriteByte (BOT_FIGHTING, (38 + clientshirt));
	}
	else
	{
		WriteByte (BOT_FIGHTING, (48 + clientshirt));
	}
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 116);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 97);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 92);
	if ((botteam == 1))
	{
		WriteByte (BOT_FIGHTING, 98);
		WriteByte (BOT_FIGHTING, 108);
		WriteByte (BOT_FIGHTING, 117);
		WriteByte (BOT_FIGHTING, 101);
	}
	else
	{
		if ((botteam == BOT_FIGHTING))
		{
			WriteByte (BOT_FIGHTING, 114);
			WriteByte (BOT_FIGHTING, 101);
			WriteByte (BOT_FIGHTING, 100);
		}
	}
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 115);
	WriteByte (BOT_FIGHTING, 107);
	WriteByte (BOT_FIGHTING, 105);
	WriteByte (BOT_FIGHTING, 110);
	WriteByte (BOT_FIGHTING, 92);
	if ((botskin == 1))
	{
		WriteByte (BOT_FIGHTING, 116);
		WriteByte (BOT_FIGHTING, 102);
		WriteByte (BOT_FIGHTING, 95);
		WriteByte (BOT_FIGHTING, 115);
		WriteByte (BOT_FIGHTING, 99);
		WriteByte (BOT_FIGHTING, 111);
		WriteByte (BOT_FIGHTING, 117);
		WriteByte (BOT_FIGHTING, 116);
	}
	else
	{
		if ((botskin == BOT_FIGHTING))
		{
			WriteByte (BOT_FIGHTING, 116);
			WriteByte (BOT_FIGHTING, 102);
			WriteByte (BOT_FIGHTING, 95);
			WriteByte (BOT_FIGHTING, 115);
			WriteByte (BOT_FIGHTING, 110);
			WriteByte (BOT_FIGHTING, 105);
			WriteByte (BOT_FIGHTING, 112);
			WriteByte (BOT_FIGHTING, 101);
		}
		else
		{
			if ((botskin == BOT_AI_FOLLOW))
			{
				WriteByte (BOT_FIGHTING, 116);
				WriteByte (BOT_FIGHTING, 102);
				WriteByte (BOT_FIGHTING, 95);
				WriteByte (BOT_FIGHTING, 115);
				WriteByte (BOT_FIGHTING, 111);
				WriteByte (BOT_FIGHTING, 108);
				WriteByte (BOT_FIGHTING, 100);
			}
			else
			{
				if ((botskin == BOT_MOVING))
				{
					WriteByte (BOT_FIGHTING, 116);
					WriteByte (BOT_FIGHTING, 102);
					WriteByte (BOT_FIGHTING, 95);
					WriteByte (BOT_FIGHTING, 100);
					WriteByte (BOT_FIGHTING, 101);
					WriteByte (BOT_FIGHTING, 109);
					WriteByte (BOT_FIGHTING, 111);
				}
				else
				{
					if ((botskin == BOT_AI_GRAPPLE))
					{
						WriteByte (BOT_FIGHTING, 116);
						WriteByte (BOT_FIGHTING, 102);
						WriteByte (BOT_FIGHTING, 95);
						WriteByte (BOT_FIGHTING, 109);
						WriteByte (BOT_FIGHTING, 101);
						WriteByte (BOT_FIGHTING, 100);
						WriteByte (BOT_FIGHTING, 105);
						WriteByte (BOT_FIGHTING, 99);
					}
					else
					{
						if ((botskin == BOT_AI_FLEE))
						{
							WriteByte (BOT_FIGHTING, 116);
							WriteByte (BOT_FIGHTING, 102);
							WriteByte (BOT_FIGHTING, 95);
							WriteByte (BOT_FIGHTING, 104);
							WriteByte (BOT_FIGHTING, 119);
							WriteByte (BOT_FIGHTING, 103);
							WriteByte (BOT_FIGHTING, 117);
							WriteByte (BOT_FIGHTING, 121);
						}
						else
						{
							if ((botskin == BOT_AI_BLAST))
							{
								WriteByte (BOT_FIGHTING, 116);
								WriteByte (BOT_FIGHTING, 102);
								WriteByte (BOT_FIGHTING, 95);
								WriteByte (BOT_FIGHTING, 112);
								WriteByte (BOT_FIGHTING, 121);
								WriteByte (BOT_FIGHTING, 114);
								WriteByte (BOT_FIGHTING, 111);
							}
							else
							{
								if ((botskin == BOT_DEFEND))
								{
									WriteByte (BOT_FIGHTING, 116);
									WriteByte (BOT_FIGHTING, 102);
									WriteByte (BOT_FIGHTING, 95);
									WriteByte (BOT_FIGHTING, 115);
									WriteByte (BOT_FIGHTING, 112);
									WriteByte (BOT_FIGHTING, 121);
								}
								else
								{
									if ((botskin == BOT_AI_FLAGRUN))
									{
										WriteByte (BOT_FIGHTING, 116);
										WriteByte (BOT_FIGHTING, 102);
										WriteByte (BOT_FIGHTING, 95);
										WriteByte (BOT_FIGHTING, 101);
										WriteByte (BOT_FIGHTING, 110);
										WriteByte (BOT_FIGHTING, 103);
									}
									else
									{
										WriteByte (BOT_FIGHTING, 98);
										WriteByte (BOT_FIGHTING, 97);
										WriteByte (BOT_FIGHTING, 115);
										WriteByte (BOT_FIGHTING, 101);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	WriteByte (BOT_FIGHTING, 92);
	WriteByte (BOT_FIGHTING, 110);
	WriteByte (BOT_FIGHTING, 97);
	WriteByte (BOT_FIGHTING, 109);
	WriteByte (BOT_FIGHTING, 101);
	WriteByte (BOT_FIGHTING, 92);
	WriteString (BOT_FIGHTING, clientname);
};

float (float clientno) clientBitFlag =
{
	local float bitflag;

	bitflag = 1;
	while ((clientno > 0))
	{
		bitflag = (bitflag * BOT_FIGHTING);
		clientno = (clientno - 1);
	}
	return (bitflag);
};

float (float clientno) clientIsActive =
{
	if ((clientno > BOT_RESUPPLYING))
	{
		if ((fActiveClients2 & clientBitFlag ((clientno - BOT_RESUPPLYING))))
		{
			return (1);
		}
	}
	else
	{
		if ((fActiveClients1 & clientBitFlag (clientno)))
		{
			return (1);
		}
	}
	return (0);
};

void (float clientno) clientSetUsed =
{
	if ((clientno > BOT_RESUPPLYING))
	{
		fActiveClients2 = (fActiveClients2 | clientBitFlag ((clientno - BOT_RESUPPLYING)));
	}
	else
	{
		fActiveClients1 = (fActiveClients1 | clientBitFlag (clientno));
	}
};

void (float clientno) clientSetFree =
{
	if ((clientno > BOT_RESUPPLYING))
	{
		fActiveClients2 = (fActiveClients2 - (fActiveClients2 & clientBitFlag ((clientno - BOT_RESUPPLYING))));
	}
	else
	{
		fActiveClients1 = (fActiveClients1 - (fActiveClients1 & clientBitFlag (clientno)));
	}
};

float () clientNextAvailable =
{
	local float clientno;

	clientno = (fMaxClients - BOT_FIGHTING);
	while ((clientno >= 0))
	{
		if (!clientIsActive (clientno))
		{
			return (clientno);
		}
		clientno = (clientno - 1);
	}
	return (CONTENT_EMPTY);
};

float () BotPreFrame =
{
	if ((self.ishuman == TRUE))
	{
		if (self.switch_wallhug)
		{
			ClientFixRankings ();
		}
	}
	return (FALSE);
};

float () BotPostFrame =
{
	UserInterface ();
	return (FALSE);
};

void (string h) BotSay =
{
	WriteByte (MSG_ALL, BOT_DEFEND);
	WriteByte (MSG_ALL, BOT_AI_FOLLOW);
	WriteByte (MSG_ALL, 1);
	WriteString (MSG_ALL, self.netname);
	WriteByte (MSG_ALL, BOT_DEFEND);
	WriteByte (MSG_ALL, BOT_AI_FOLLOW);
	WriteByte (MSG_ALL, BOT_FIGHTING);
	WriteString (MSG_ALL, h);
};

void () BotSayInit =
{
	WriteByte (MSG_ALL, BOT_DEFEND);
	WriteByte (MSG_ALL, BOT_AI_FOLLOW);
	WriteByte (MSG_ALL, 1);
	WriteString (MSG_ALL, self.netname);
};

void (string h) BotSay2 =
{
	WriteByte (MSG_ALL, BOT_DEFEND);
	WriteByte (MSG_ALL, BOT_AI_FOLLOW);
	WriteByte (MSG_ALL, BOT_FIGHTING);
	WriteString (MSG_ALL, h);
};

void () BotInit =
{
	local entity ent;
	local entity fisent;
	local float numents;

	numents = 0;
	ent = nextent (world);
	while ((ent.classname != "worldspawn"))
	{
		fMaxClients = (fMaxClients + 1);
		ent = nextent (ent);
	}
	ent = nextent (world);
	while ((numents < fMaxClients))
	{
		fisent = spawn ();
		ent.phys_obj = fisent;
		fisent.owner = ent;
		numents = (numents + 1);
		ent = nextent (ent);
	}
	fResupplyBetweenKills = 1;
};

entity (float num) GetClientEntity =
{
	local entity upsy;

	upsy = world;
	num = (num + 1);
	while ((num > 0))
	{
		num = (num - 1);
		upsy = nextent (upsy);
	}
	return (upsy);
};

void (float whichteam, float whichClass) botConnect =
{
	local float clientno;
	local entity bot;
	local entity uself;

	clientno = clientNextAvailable ();
	uself = self;
	if ((clientno == CONTENT_EMPTY))
	{
		bprint (BOT_FIGHTING, "Unable to connect a bot, server is full.\n");
		return;
	}
	clientSetUsed (clientno);
	BOT_COUNT = (BOT_COUNT + 1);
	bot = GetClientEntity (clientno);
	userid = (userid + 1);
	bot.fUserID = userid;
	bot.fClientNo = clientno;
	bot.colormap = (clientno + 1);
	self = bot;
	bot.netname = PickAName ();
	bot.botskill = 1;
	bot.team = (bot.fPants + 1);
	bot.fEnterTime = time;
	svcUpdateFrags (bot.fClientNo, bot.frags);
	svcUpdatePing (bot.fClientNo, bot.botskill);
	svcUpdateEnterTime (bot.fClientNo, (time - bot.fEnterTime));
	svcUpdateUserInfo (bot.fClientNo, bot.fUserID, bot.fShirt, bot.fPants, bot.netname, whichteam, whichClass);
	SetNewParms ();
	self.ishuman = BOT_FIGHTING;
	ClientConnect ();
	PutClientInServer ();
	if (whichteam)
	{
		self.team_no = whichteam;
	}
	else
	{
		self.team_no = BOT_AI_GRAPPLE;
	}
	self.skin = whichClass;
	ClearAllWaypoints ();
	ClearAllTargets ();
	self.action = BOT_RESUPPLYING;
	self.obs_time = 0;
	self.oldAction = BOT_IDLE;
	self.pipeLocation = '0 0 0';
	self = uself;
};

void (entity bot) botDisconnect =
{
	local entity whoself;

	whoself = self;
	self = bot;
	BOT_COUNT = (BOT_COUNT - 1);
	ClientDisconnect ();
	if ((bot.fClientNo != CONTENT_EMPTY))
	{
		self.tfrags = 0;
		self.frags = 0;
		self.skin = 0;
		self.real_frags = 0;
		self.origin = '0 0 0';
		self.netname = "";
		self.classname = "";
		self.health = 0;
		self.items = 0;
		self.armorvalue = 0;
		self.weapons_carried = 0;
		self.current_weapon = 0;
		self.playerclass = 0;
		self.weaponmodel = "";
		self.phys_obj.modelindex = 0;
		self.ammo_shells = 0;
		self.ammo_nails = 0;
		self.ammo_rockets = 0;
		self.ammo_cells = 0;
		svcUpdateFrags (bot.fClientNo, 0);
		svcUpdatePing (bot.fClientNo, 0);
		svcUpdateEnterTime (bot.fClientNo, 0);
		svcUpdateUserInfo (bot.fClientNo, 0, 0, 0, string_null, 0, 0);
		clientSetFree (bot.fClientNo);
		bot.fClientNo = CONTENT_EMPTY;
	}
	self = whoself;
};

void (float clientno) botInvalidClientNo =
{
	local entity bot;

	bot = find (world, classname, "player");
	while (bot)
	{
		if (((bot.fClientNo == clientno) && !bot.ishuman))
		{
			bot.fClientNo = CONTENT_EMPTY;
			botDisconnect (bot);
			return;
		}
		bot = find (bot, classname, "player");
	}
};

void () BotFrame =
{
	local float num;
	local float num2;

	num = stof (infokey (world, "skill"));
	auto_bot_done = 1;
	sv_maxspeed = cvar ("sv_maxspeed");
	sv_gravity = cvar ("sv_gravity");
	sv_friction = cvar ("sv_friction");
	sv_accelerate = cvar ("sv_accelerate");
	sv_stopspeed = cvar ("sv_stopspeed");
	self = nextent (world);
	num = 0;
	while ((num < fMaxClients))
	{
		if ((self.ishuman == FALSE))
		{
			if (clientIsActive (num))
			{
				sv_maxspeed = self.maxspeed;
				if ((self.tfrags != self.frags))
				{
					svcUpdateFrags (self.fClientNo, self.frags);
				}
				CL_KeyMove ();
				SV_ClientThink ();
				SV_Physics_Client ();
				if (self.phys_obj)
				{
					setmodel (self.phys_obj, "progs/player.mdl");
					self.phys_obj.modelindex = self.modelindex;
					self.phys_obj.frame = self.frame;
					self.phys_obj.angles = self.angles;
					self.phys_obj.avelocity = self.velocity;
					self.phys_obj.colormap = self.colormap;
				}
				if ((((self.playerclass == BOT_DEFEND) && (self.undercover_team != 0)) && teamplay))
				{
					if ((TeamFortress_TeamGetColor (self.undercover_team) != self.team))
					{
						num2 = (TeamFortress_TeamGetColor (self.undercover_team) - 1);
						self.fPants = num2;
						self.fShirt = num2;
						self.team = (self.fPants + 1);
						svcUpdateFrags (self.fClientNo, self.frags);
						svcUpdatePing (self.fClientNo, self.botskill);
						svcUpdateEnterTime (self.fClientNo, (time - self.fEnterTime));
						svcUpdateUserInfo (self.fClientNo, self.fUserID, self.fShirt, self.fPants, self.netname, self.team_no, self.skin);
					}
					self.team = TeamFortress_TeamGetColor (self.undercover_team);
				}
				else
				{
					if (((TeamFortress_TeamGetColor (self.team_no) != self.team) && teamplay))
					{
						num2 = (TeamFortress_TeamGetColor (self.team_no) - 1);
						self.fPants = num2;
						self.fShirt = num2;
						self.team = (self.fPants + 1);
						svcUpdateFrags (self.fClientNo, self.frags);
						svcUpdatePing (self.fClientNo, self.botskill);
						svcUpdateEnterTime (self.fClientNo, (time - self.fEnterTime));
						svcUpdateUserInfo (self.fClientNo, self.fUserID, self.fShirt, self.fPants, self.netname, self.team_no, self.skin);
					}
				}
			}
		}
		self = nextent (self);
		num = (num + 1);
	}
};
