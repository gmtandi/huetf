float BOT_IDLE    = 1;
float BOT_FIGHTING    = 2;
float BOT_MOVING    = 4;
float BOT_DEFEND    = 8;
float BOT_RESUPPLYING    = 16;
float BOT_AVOIDING_HAZARD    = 32;
float BOT_AI_LEAD    = 2;
float BOT_AI_FOLLOW    = 3;
float BOT_AI_REFUEL    = 4;
float BOT_AI_GRAPPLE    = 5;
float BOT_AI_FLEE    = 6;
float BOT_AI_BLAST    = 7;
float BOT_AI_STEALTH    = 8;
float BOT_AI_FLAGRUN    = 9;
float BOT_AI_SCOUT    = 10;
float BOT_IMPULSE    = 200;
float DAMAGE_NO    = 0;
float MOVETYPE_NONE    = 0;
float MOVETYPE_WALK    = 3;
float MOVETYPE_STEP    = 4;
float MOVETYPE_FLY    = 5;
float MOVETYPE_TOSS    = 6;
float MOVETYPE_NOCLIP    = 8;
float MOVETYPE_BOUNCE    = 10;
float SOLID_NOT    = 0;
float SOLID_TRIGGER    = 1;
float SOLID_BSP    = 4;
float MSG_BROADCAST    = 0;
float MSG_ONE    = 1;
float MSG_ALL    = 2;
float FL_MONSTER    = 32;
float FL_ITEM    = 256;
float FL_ONGROUND    = 512;
float FL_PARTIALGROUND    = 1024;
float FL_WATERJUMP    = 2048;
float IT_INVISIBILITY    = 524288;
float CONTENT_EMPTY    = -1;
float CONTENT_WATER    = -3;
float CONTENT_LAVA    = -5;
vector VEC_HULL_MIN    = '-16 -16 -24';
vector VEC_HULL_MAX    = '16 16 32';
float MSG_MULTICAST    = 4;
.float ishuman;
.float tfrags;
.float fClientNo;
.float fShirt;
.float fPants;
.float fEnterTime;
.float fUserID;
.float keys;
.float action;
.float position;
.float obs_time;
.float avoidKeys;
.float checkMovementTime;
.float distanceToWaypoint;
.vector botDirection;
.vector pipeLocation;
.float f_sound;
.float missile_speed;
.float botskill;
.float switch_wallhug;
.entity phys_obj;
.vector b_angle;
.vector mouse_emu;
.vector movevect;
.vector punchangle;
.float nextimpulse;
.float should_stand;
.float oldAction;
.vector waypoint1;
.vector waypoint2;
.vector waypoint3;
.vector waypoint4;
.vector waypoint5;
.vector lastSighted;
.entity target1;
.entity target2;
.entity target3;
float fActiveClients1;
float fActiveClients2;
float fMaxClients;
float BOT_COUNT;
float sv_friction;
float sv_gravity;
float sv_accelerate;
float sv_maxspeed;
float sv_stopspeed;
entity fixer;
float userid;
float auto_bot_done;
float (float tno) TeamFortress_TeamGetColor;
float (float v) anglemod;
void () BotInit;
void () BotFrame;
float () BotPreFrame;
float () BotPostFrame;
void () ClientInRankings;
float (entity targ) visible;
void () BotAI;
void () BotTouch;
void () UserInterface;
void (float inp) BotMenu_Input;
void (float inp) BotClassMenu_Input;
void (float inp) BotTeamMenu_Input;
float fResupplyBetweenKills;
float (float clientno) clientBitFlag;
float (float clientno) clientIsActive;
void (float clientno) clientSetUsed;
void (float clientno) clientSetFree;
float () clientNextAvailable;
void (vector whichway) frik_obstructed;
void () CL_KeyMove;
void () SV_Physics_Client;
void () SV_ClientThink;
string () PickAName;
float (float y1, float y2) angcomp;

void (entity client, ...) hue_sprint = #24;
void (...) bprint = #23;
void (...) bprint2 = #23;
void (...) bprint3 = #23;
void (...) bprint4 = #23;
void (...) bprint5 = #23;
void (...) bprint6 = #23;
void (...) bprint7 = #23;
void (...) bprint8 = #23;

void (...) dprint = #25;

void (entity client, string s, ...) hue_centerprint = #73;

void (entity e) hue_setspawnparms = #78;
void (entity client, string s) hue_stuffcmd = #21;
void (entity e, float chan, string samp, float vol, float atten) hue_sound = #8;
vector (entity e, float speed) hue_aim = #44; 
void (float to, float f) hue_WriteByte = #52; 
void (float to, float f) hue_WriteChar = #53; 
void (float to, float f) hue_WriteShort = #54; 
void (float to, float f) hue_WriteLong = #55; 
void (float to, float f) hue_WriteCoord = #56; 
void (float to, float f) hue_WriteAngle = #57; 
void (float to, string s) hue_WriteString = #58; 
void (float to, entity s) hue_WriteEntity = #59; 
string(entity e, string key) hue_infokey = #80; 

string (entity e, string s) infokey =
{
	if (((e == world) || (e.ishuman == TRUE)))
	{
		return (hue_infokey (e, s));
	}
	if ((e.classname == "player"))
	{
		if ((s == "bottomcolor"))
		{
			return (ftos (e.fPants));
		}
		if ((s == "skin"))
		{
			if ((self.playerclass == 1))
			{
				return ("tf_scout");
			}
			else
			{
				if ((self.playerclass == BOT_FIGHTING))
				{
					return ("tf_snipe");
				}
				else
				{
					if ((self.playerclass == BOT_AI_FOLLOW))
					{
						return ("tf_sold");
					}
					else
					{
						if ((self.playerclass == BOT_MOVING))
						{
							return ("tf_demo");
						}
						else
						{
							if ((self.playerclass == BOT_AI_GRAPPLE))
							{
								return ("tf_medic");
							}
							else
							{
								if ((self.playerclass == BOT_AI_FLEE))
								{
									return ("tf_hwguy");
								}
								else
								{
									if ((self.playerclass == BOT_AI_BLAST))
									{
										return ("tf_pyro");
									}
									else
									{
										if ((self.playerclass == BOT_DEFEND))
										{
											return ("tf_spy");
										}
										else
										{
											return ("tf_eng");
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if ((s == "team"))
		{
			return (GetTeamName (e.team_no));
		}
	}

	return "";
};


void (entity client, float level, string s1) sprint =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1);
	}
};

void (entity client, float level, string s1, string s2) sprint2 =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1, s2);
	}
};

void (entity client, float level, string s1, string s2, string s3) sprint3 =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1, s2, s3);
	}
};

void (entity client, float level, string s1, string s2, string s3, string s4) sprint4 =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1, s2, s3, s4);
	}
};

void (entity client, float level, string s1, string s2, string s3, string s4, string s5) sprint5 =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1, s2, s3, s4, s5);
	}
};

void (entity client, float level, string s1, string s2, string s3, string s4, string s5, string s6) sprint6 =
{
	if (client.ishuman)
	{
		hue_sprint (client, level, s1, s2, s3, s4, s5, s6);
	}
};

void (entity client, string s1) CenterPrint =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1);
	}
};

void (entity client, string s1, string s2) CenterPrint2 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2);
	}
};

void (entity client, string s1, string s2, string s3) CenterPrint3 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3);
	}
};

void (entity client, string s1) centerprint =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1);
	}
};

void (entity client, string s1, string s2) centerprint2 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2);
	}
};

void (entity client, string s1, string s2, string s3) centerprint3 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3);
	}
};

void (entity client, string s1, string s2, string s3, string s4) centerprint4 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3, s4);
	}
};

void (entity client, string s1, string s2, string s3, string s4, string s5) centerprint5 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3, s4, s5);
	}
};

void (entity client, string s1, string s2, string s3, string s4, string s5, string s6) centerprint6 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3, s4, s5, s6);
	}
};

void (entity client, string s1, string s2, string s3, string s4, string s5, string s6, string s7) centerprint7 =
{
	if (client.ishuman)
	{
		hue_centerprint (client, s1, s2, s3, s4, s5, s6, s7);
	}
};


void (entity client, string s) stuffcmd =
{
	if (client.ishuman)
	{
		hue_stuffcmd (client, s);
	}
};

void (entity e) setspawnparms =
{
	if (e.ishuman)
	{
		hue_setspawnparms (e);
	}
	else
	{
		SetNewParms ();
	}
};

vector (entity e, float sped) aim =
{
	e.missile_speed = sped;
	return (hue_aim (e, sped));
};

void (entity e, float chan, string samp, float vol, float atten) sound =
{
	if ((e.classname == "player"))
	{
		e.f_sound = (time + 0.5);
	}
	hue_sound (e, chan, samp, vol, atten);
};

void (float to, float f) WriteByte =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteByte (to, f);
};

void (float to, float f) WriteChar =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteChar (to, f);
};

void (float to, float f) WriteShort =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteShort (to, f);
};

void (float to, float f) WriteLong =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteLong (to, f);
};

void (float to, float f) WriteCoord =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteCoord (to, f);
};

void (float to, float f) WriteAngle =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteAngle (to, f);
};

void (float to, string s) WriteString =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteString (to, s);
};

void (float to, entity s) WriteEntity =
{
	if (((to == MSG_ONE) && (msg_entity.ishuman != TRUE)))
	{
		return;
	}
	hue_WriteEntity (to, s);
};
