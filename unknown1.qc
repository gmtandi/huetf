float RANGE_MELEE    = 0;
float RANGE_NEAR    = 1;
float RANGE_MID    = 2;
float RANGE_FAR    = 3;
float AS_STRAIGHT    = 1;
float AS_SLIDING    = 2;
float AS_MELEE    = 3;
float AS_MISSILE    = 4;
float (float v) anglemod;
void (vector dest3) ChooseTurn;
void () ai_face;
float enemy_vis;
float enemy_infront;
float enemy_range;
float enemy_yaw;


void (entity eng) Engineer_RemoveBuildings;

void () Admin_CountPlayers;
void () Admin_CycleDeal;
void () Admin_DoKick;
void () Admin_CeaseFire;
void () Admin_ListIPs;
void () AbortElect;
void () VoteAdmin;
void () VoteYes;
void () VoteNo;


float () CheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	targ = self.enemy;
	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	traceline (spot1, spot2, 0, self);
	if ((trace_ent != targ))
	{
		return (0);
	}
	if ((trace_inopen && trace_inwater))
	{
		return (0);
	}
	if ((enemy_range == 0))
	{
		if (self.th_melee)
		{
			self.th_melee ();
			return (AS_STRAIGHT);
		}
	}
	if (!self.th_missile)
	{
		return (0);
	}
	if ((time < self.attack_finished))
	{
		return (0);
	}
	if ((enemy_range == RANGE_FAR))
	{
		return (0);
	}
	if ((enemy_range == 0))
	{
		chance = 0.9;
		self.attack_finished = 0;
	}
	else
	{
		if ((enemy_range == 1))
		{
			if (self.th_melee)
			{
				chance = 0.2;
			}
			else
			{
				chance = 0.4;
			}
		}
		else
		{
			if ((enemy_range == 2))
			{
				if (self.th_melee)
				{
					chance = 0.05;
				}
				else
				{
					chance = 0.1;
				}
			}
			else
			{
				chance = 0;
			}
		}
	}
	if ((random () < chance))
	{
		self.th_missile ();
		SUB_AttackFinished ((AS_SLIDING * random ()));
		return (AS_STRAIGHT);
	}
	return (0);
};
float (entity targ) infront;
float (entity targ) range;

void (float d) ai_charge =
{
	ai_face ();
	movetogoal (d);
};

void () ai_charge_side =
{
	local vector dtemp;
	local float heading;

	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	ChangeYaw ();
	makevectors (self.angles);
	dtemp = (self.enemy.origin - (30 * v_right));
	heading = vectoyaw ((dtemp - self.origin));
	walkmove (heading, 20);
};

void () ai_melee =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	delta = (self.enemy.origin - self.origin);
	if ((vlen (delta) > 60))
	{
		return;
	}
	ldmg = (((random () + random ()) + random ()) * 3);
	T_Damage (self.enemy, self, self, ldmg);
};

void () ai_melee_side =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	ai_charge_side ();
	delta = (self.enemy.origin - self.origin);
	if ((vlen (delta) > 60))
	{
		return;
	}
	if (!CanDamage (self.enemy, self))
	{
		return;
	}
	ldmg = (((random () + random ()) + random ()) * 3);
	T_Damage (self.enemy, self, self, ldmg);
};
void () t_movetarget;
float current_yaw    = 0;
entity sight_entity;
float sight_entity_time;

void () movetarget_f =
{
	if (!self.targetname)
	{
		objerror ("monster_movetarget: no targetname");
	}
	self.solid = AS_STRAIGHT;
	self.touch = t_movetarget;
	setsize (self, '-8 -8 -8', '8 8 8');
};

void () path_corner =
{
	movetarget_f ();
};

void () t_movetarget =
{
	local entity temp;

	if ((other.movetarget != self))
	{
		return;
	}
	if (other.enemy)
	{
		return;
	}
	temp = self;
	self = other;
	other = temp;
	self.movetarget = find (world, targetname, other.target);
	self.goalentity = find (world, targetname, other.target);
	self.ideal_yaw = vectoyaw ((self.goalentity.origin - self.origin));
	if (!self.movetarget)
	{
		self.pausetime = (time + 999999);
		self.th_stand ();
		return;
	}
};

float (float v) anglemod =
{
	while ((v >= 360))
	{
		v = (v - 360);
	}
	while ((v < 0))
	{
		v = (v + 360);
	}
	return (v);
};

float (entity targ) range =
{
	local vector spot1;
	local vector spot2;
	local float r;

	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	r = vlen ((spot1 - spot2));
	if ((r < 120))
	{
		return (0);
	}
	if ((r < 500))
	{
		return (AS_STRAIGHT);
	}
	if ((r < 1000))
	{
		return (AS_SLIDING);
	}
	return (3);
};

float (entity targ) visible =
{
	local vector spot1;
	local vector spot2;

	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	traceline (spot1, spot2, AS_STRAIGHT, self);
	if ((trace_inopen && trace_inwater))
	{
		return (0);
	}
	if ((trace_fraction == AS_STRAIGHT))
	{
		return (AS_STRAIGHT);
	}
	return (0);
};

float (entity targ) infront =
{
	local vector vec;
	local float dot;

	makevectors (self.angles);
	vec = normalize ((targ.origin - self.origin));
	dot = (vec * v_forward);
	if ((dot > 0.3))
	{
		return (AS_STRAIGHT);
	}
	return (0);
};

void () HuntTarget =
{
	self.goalentity = self.enemy;
	self.think = self.th_run;
	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	self.nextthink = (time + 0.1);
	SUB_AttackFinished (AS_STRAIGHT);
};

void () FoundTarget =
{
	if ((self.enemy.classname == "player"))
	{
		sight_entity = self;
		sight_entity_time = time;
	}
	self.show_hostile = (time + AS_STRAIGHT);
	HuntTarget ();
};

float () FindTarget =
{
	local entity client;
	local float r;

	if (((sight_entity_time >= (time - 0.1)) && !(self.spawnflags & 3)))
	{
		client = sight_entity;
		if ((client.enemy == self.enemy))
		{
			return (0);
		}
	}
	else
	{
		client = checkclient ();
		if (!client)
		{
			return (0);
		}
	}
	if (tfstrike)
	{
		if (round_over)
		{
			return (0);
		}
		if ((client.team_no != AS_STRAIGHT))
		{
			return (0);
		}
		if (self.tfstate)
		{
			return (0);
		}
	}
	if ((client == self.enemy))
	{
		return (0);
	}
	if ((client.flags & 128))
	{
		return (0);
	}
	if ((client.items & WEAP_RAILGUN))
	{
		return (0);
	}
	r = range (client);
	if ((r == RANGE_FAR))
	{
		return (0);
	}
	if (!visible (client))
	{
		return (0);
	}
	if ((r == 1))
	{
		if (((client.show_hostile < time) && !infront (client)))
		{
			return (0);
		}
	}
	else
	{
		if ((r == 2))
		{
			if (!infront (client))
			{
				return (0);
			}
		}
	}
	self.enemy = client;
	if ((self.enemy.classname != "player"))
	{
		self.enemy = self.enemy.enemy;
		if ((self.enemy.classname != "player"))
		{
			self.enemy = world;
			return (0);
		}
	}
	FoundTarget ();
	return (AS_STRAIGHT);
};

void (float dist) ai_forward =
{
	walkmove (self.angles_y, dist);
};

void (float dist) ai_back =
{
	walkmove ((self.angles_y + 180), dist);
};

void (float dist) ai_pain =
{
	ai_back (dist);
};

void (float dist) ai_painforward =
{
	walkmove (self.ideal_yaw, dist);
};

void (float dist) ai_walk =
{
	local vector mtemp;

	movedist = dist;
	if ((self.classname == "monster_dragon"))
	{
		movetogoal (dist);
		return;
	}
	if (FindTarget ())
	{
		return;
	}
};

void () ai_stand =
{
	if (FindTarget ())
	{
		return;
	}
	if ((time > self.pausetime))
	{
		self.th_walk ();
		return;
	}
};

void () ai_turn =
{
	if (FindTarget ())
	{
		return;
	}
	ChangeYaw ();
};

void (vector dest3) ChooseTurn =
{
	local vector dir;
	local vector newdir;

	dir = (self.origin - dest3);
	newdir_x = trace_plane_normal_y;
	newdir_y = (0 - trace_plane_normal_x);
	newdir_z = 0;
	if (((dir * newdir) > 0))
	{
		dir_x = (0 - trace_plane_normal_y);
		dir_y = trace_plane_normal_x;
	}
	else
	{
		dir_x = trace_plane_normal_y;
		dir_y = (0 - trace_plane_normal_x);
	}
	dir_z = 0;
	self.ideal_yaw = vectoyaw (dir);
};

float () FacingIdeal =
{
	local float delta;

	delta = anglemod ((self.angles_y - self.ideal_yaw));
	if (((delta > 45) && (delta < 315)))
	{
		return (0);
	}
	return (AS_STRAIGHT);
};

void () ai_run_melee =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (FacingIdeal ())
	{
		self.th_melee ();
		self.attack_state = AS_STRAIGHT;
	}
};

void () ai_run_missile =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (FacingIdeal ())
	{
		self.th_missile ();
		self.attack_state = AS_STRAIGHT;
	}
};

void () ai_run_slide =
{
	local float ofs;

	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (self.lefty)
	{
		ofs = 90;
	}
	else
	{
		ofs = -90;
	}
	if (walkmove ((self.ideal_yaw + ofs), movedist))
	{
		return;
	}
	self.lefty = (AS_STRAIGHT - self.lefty);
	walkmove ((self.ideal_yaw - ofs), movedist);
};

void (float dist) ai_run =
{
	local vector delta;
	local float axis;
	local float direct;
	local float ang_rint;
	local float ang_floor;
	local float ang_ceil;

	movedist = dist;
	if ((self.enemy.health <= 0))
	{
		self.enemy = world;
		if ((self.oldenemy.health > 0))
		{
			self.enemy = self.oldenemy;
			HuntTarget ();
		}
		else
		{
			if (self.movetarget)
			{
				self.th_walk ();
			}
			else
			{
				self.th_stand ();
			}
			return;
		}
	}
	self.show_hostile = (time + AS_STRAIGHT);
	enemy_vis = visible (self.enemy);
	if (enemy_vis)
	{
		self.search_time = (time + 5);
	}
	if ((coop && (self.search_time < time)))
	{
		if (FindTarget ())
		{
			return;
		}
	}
	enemy_infront = infront (self.enemy);
	enemy_range = range (self.enemy);
	enemy_yaw = vectoyaw ((self.enemy.origin - self.origin));
	if ((self.attack_state == 4))
	{
		ai_run_missile ();
		return;
	}
	if ((self.attack_state == 3))
	{
		ai_run_melee ();
		return;
	}
	if ((self.attack_state == AS_SLIDING))
	{
		ai_run_slide ();
		return;
	}
	movetogoal (dist);
};
float SBAR_200    = 11;
float SBAR_240    = 16;
float SBAR_300    = 22;
float SBAR_350    = 27;
float SBAR_384    = 33;
float SBAR_400    = 35;
float SBAR_480    = 45;
float SBAR_600    = 60;
float SBAR_768    = 80;
float SBAR_GRENS    = 1;
float SBAR_PRINT    = 2;


float enter    = 10;
float space    = 32;
float quote    = 34;
float minus    = 45;
float period    = 46;
float slash    = 47;
float _0    = 48;
float _1    = 49;
float _2    = 50;
float _3    = 51;
float _4    = 52;
float _5    = 53;
float _6    = 54;
float _7    = 55;
float _8    = 56;
float _9    = 57;
float dperiod    = 58;
float _A    = 65;
float _B    = 66;
float _C    = 67;
float _D    = 68;
float _E    = 69;
float _F    = 70;
float _G    = 71;
float _H    = 72;
float _I    = 73;
float _J    = 74;
float _K    = 75;
float _L    = 76;
float _M    = 77;
float _N    = 78;
float _O    = 79;
float _P    = 80;
float _Q    = 81;
float _R    = 82;
float _S    = 83;
float _T    = 84;
float _U    = 85;
float _V    = 86;
float _W    = 87;
float _X    = 88;
float _Y    = 89;
float _Z    = 90;
float __    = 95;
float _a    = 97;
float _b    = 98;
float _c    = 99;
float _d    = 100;
float _e    = 101;
float _f    = 102;
float _g    = 103;
float _h    = 104;
float _i    = 105;
float _j    = 106;
float _k    = 107;
float _l    = 108;
float _m    = 109;
float _n    = 110;
float _o    = 111;
float _p    = 112;
float _q    = 113;
float _r    = 114;
float _s    = 115;
float _t    = 116;
float _u    = 117;
float _v    = 118;
float _w    = 119;
float _x    = 120;
float _y    = 121;
float _z    = 122;


float _a0    = 48;
float _a1    = 49;
float _a2    = 50;
float _a3    = 51;
float _a4    = 52;
float _a5    = 53;
float _a6    = 54;
float _a7    = 55;
float _a8    = 56;
float _a9    = 57;
float adperiod    = 58;
float _aA    = 65;
float _aB    = 66;
float _aC    = 67;
float _aD    = 68;
float _aE    = 69;
float _aF    = 70;
float _aG    = 71;
float _aH    = 72;
float _aI    = 73;
float _aJ    = 74;
float _aK    = 75;
float _aL    = 76;
float _aM    = 77;
float _aN    = 78;
float _aO    = 79;
float _aP    = 80;
float _aQ    = 81;
float _aR    = 82;
float _aS    = 83;
float _aT    = 84;
float _aU    = 85;
float _aV    = 86;
float _aW    = 87;
float _aX    = 88;
float _aY    = 89;
float _aZ    = 90;
float _a_    = 95;
float _aa    = 97;
float _ab    = 98;
float _ac    = 99;
float _ad    = 100;
float _ae    = 101;
float _af    = 102;
float _ag    = 103;
float _ah    = 104;
float _ai    = 105;
float _aj    = 106;
float _ak    = 107;
float _al    = 108;
float _am    = 109;
float _an    = 110;
float _ao    = 111;
float _ap    = 112;
float _aq    = 113;
float _ar    = 114;
float _as    = 115;
float _at    = 116;
float _au    = 117;
float _av    = 118;
float _aw    = 119;
float _ax    = 120;
float _ay    = 121;
float _az    = 122;

float greenlamp    = 134;
float redlamp    = 135;
float yellowlamp    = 136;
float bluelamp    = 137;
float COLOR_GREEN    = 18;
float COLOR_WHITE    = 48;
float COLOR_RED    = 176;
float () CheckExistence;
entity (float gno) Findgoal;

void (entity te) dremove =
{
	if ((te == world))
	{
		dprint ("***BUG BUG BUG BUG BUG BUG BUG BUG BUG BUG***\n");
		dprint ("WORLD has nearly been removed. Don't worry\n");
		dprint ("***BUG BUG BUG BUG BUG BUG BUG BUG BUG BUG***\n");
		return;
	}
	if ((te.is_removed == 1))
	{
		return;
	}
	te.is_removed = 1;
	remove (te);
};

void () display_location =
{
	local string st;

	st = vtos (self.origin);
	sprint3 (self, 2, "Location : ", st, "\n");
	st = vtos (self.angles);
	sprint3 (self, 2, "Angles   : ", st, "\n");
};
void () Status_StartWrite;
void () Status_EndWrite;

/*
void (float f1, float f2, float f3) W3C;
void (float f1, float f2, float f3, float f4) W4C;
void (float f1, float f2, float f3, float f4, float f5) W5C;
void (float f1, float f2, float f3, float f4, float f5, float f6) W6C;
void (float f1, float f2, float f3, float f4, float f5, float f6, float f7) W7C;
void (float f1, float f2, float f3, float f4, float f5, float f6, float f7, float f8) W8C;
*/

void (string str) WriteStr;
void (float f1, float len) WriteRep;

void (float f, float c) WriteIntXX;
void (float f, float c) WriteIntXXX;
void (float f, float c) WriteIntXXXX;
void (float f) WriteSIntXXXX;
void (float i) WriteSpace;

void (entity pl) Status_Refresh =
{
    if (pl.StatusRefreshTime == time)
        return;
    pl.StatusRefreshTime = time;
};

void () RefreshStatusBar =
{
	local float x;
	local entity te;
	local float num;

	if (self.current_menu)
	{
		return;
	}
	if (self.deadflag)
	{
		return;
	}
	if ((infokey (world, "status") == "Countdown"))
	{
		return;
	}
//hue
//	self.StatusRefreshTime = (time + 1.5);
	self.StatusRefreshTime = (time + 0.2);
	msg_entity = self;
	Status_StartWrite ();
	if (round_active)
	{
		if (!self.ScannerOn)
		{
			if ((self.is_undercover != 2))
			{
				te = find (te, classname, "round");
				WriteIntXX (te.cnt, COLOR_WHITE);
				WriteByte (1, dperiod);
				WriteIntXX (te.cnt2, COLOR_WHITE);
				WriteSpace (4);
			}
		}
		if (tfstrike)
		{
			if (self.is_detpacking)
			{
                                WriteStr ("setting BOMB");
				WriteSpace (13);
			}
		}
	}
	else
	{
		if (!self.playerclass)
		{
			Status_EndWrite ();
			return;
		}
		else
		{
			if ((self.playerclass == 1))
			{
				te = find (world, netname, "scanner");
				while (((te != world) && (te.owner != self)))
				{
					te = find (te, classname, "scanner");
				}
				if ((self.ScannerOn == 1))
				{
					x = 0;
					if ((te.health > 0))
					{
						if ((te.team_no == 1))
						{
							WriteStr ("Blue ");
							x = 5;
						}
						else
						{
							if ((te.team_no == 2))
							{
								WriteStr ("Red ");
								x = 4;
							}
							else
							{
								if ((te.team_no == 3))
								{

									WriteStr ("Yellow ");
									x = 7;
								}
								else
								{
									if ((te.team_no == 4))
									{
										WriteStr ("Green ");
										x = 6;
									}
								}
							}
						}
						if ((te.playerclass == 1))
						{
							WriteStr ("Scout");
							x = (x + 5);
						}
						else
						{
							if ((te.playerclass == 2))
							{
								WriteStr ("Sniper");
								x = (x + 6);
							}
							else
							{
								if ((te.playerclass == 3))
								{
									WriteStr ("Soldier");
									x = (x + 7);
								}
								else
								{
									if ((te.playerclass == 4))
									{
										WriteStr ("Demoman");
										x = (x + 7);
									}
									else
									{
										if ((te.playerclass == 5))
										{
											WriteStr ("Medic");
											x = (x + 5);
										}
										else
										{
											if ((te.playerclass == 6))
											{
												WriteStr ("HWGuy");
												x = (x + 5);
											}
											else
											{
												if ((te.playerclass == 7))
												{
													WriteStr ("Pyro");
													x = (x + 4);
												}
												else
												{
													if ((te.playerclass == 8))
													{
														WriteStr ("Spy");
														x = (x + 3);
													}
													else
													{
														if ((te.playerclass == 9))
														{
															WriteStr ("Engineer");
															x = (x + 8);
														}
														else
														{
															if ((te.playerclass == 11))
															{
																WriteStr ("Civilian");
																x = (x + 8);
															}
															else
															{
																if ((te.playerclass == 13))
																{
																	WriteStr ("Sentry Gun");
																	x = (x + enter);
																}
																else
																{
																	if ((te.playerclass == 14))
																	{
																		WriteStr ("Goal Item");
																		x = (x + 8);
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
							}
						}
					}
					else
					{
						WriteStr ("No Blips");
						x = (x + 8);
					}
					if (x)
					{
						WriteSpace ((COLOR_GREEN - x));
					}
					WriteStr ("Range: ");
					WriteIntXXX (te.health, COLOR_WHITE);
				}
			}
			else if ((sniperpower) && (self.playerclass == 2)) {
				local string st = "";				
			    if (self.heat) {
			        st = "–Ô˜ÂÚ: ";
			        st = strcat(st, ftos(self.heat));
			        st = strcat(st, " dmg");
			        if (self.power_full) {
			            st = strcat(st, " (max)");
			        }
			    }
			    WriteStr(st);
			    WriteSpace (18);
			}
			else
			{
				if ((self.playerclass == 4))
				{
					if (self.is_detpacking)
					{
						WriteStr ("setting detpack");
						WriteSpace (15);
					}
				}
				else
				{
					if ((self.playerclass == 8))
					{
						if (self.is_undercover)
						{
							if ((self.is_undercover == 2))
							{
								WriteStr ("going undercover");
								WriteSpace (14);
							}
							else
							{
								x = 0;
								if ((self.undercover_team == 1))
								{
									WriteStr ("Blue ");
									x = 5;
								}
								else
								{
									if ((self.undercover_team == 2))
									{
										WriteStr ("Red ");
										x = 4;
									}
									else
									{
										if ((self.undercover_team == 3))
										{
											WriteStr ("Yellow ");
											x = 7;
										}
										else
										{
											if ((self.undercover_team == 4))
											{
												WriteStr ("Green ");
												x = 6;
											}
										}
									}
								}
								if ((self.undercover_skin == 1))
								{
									WriteStr ("Scout");
									x = (x + 5);
								}
								else
								{
									if ((self.undercover_skin == 2))
									{
										WriteStr ("Sniper");
										x = (x + 6);
									}
									else
									{
										if ((self.undercover_skin == 3))
										{
											WriteStr ("Soldier");
											x = (x + 7);
										}
										else
										{
											if ((self.undercover_skin == 4))
											{
												WriteStr ("Demoman");
												x = (x + 7);
											}
											else
											{
												if ((self.undercover_skin == 5))
												{
													WriteStr ("Medic");
													x = (x + 5);
												}
												else
												{
													if ((self.undercover_skin == 6))
													{
														WriteStr ("HWGuy");
														x = (x + 5);
													}
													else
													{
														if ((self.undercover_skin == 7))
														{
															WriteStr ("Pyro");
															x = (x + 4);
														}
														else
														{
															if ((self.undercover_skin == 9))
															{
																WriteStr ("Engineer");
																x = (x + 8);
															}
														}
													}
												}
											}
										}
									}
								}
								if (x)
								{
									WriteSpace ((30 - x));
								}
							}
						}
					}
					else
					{
						if ((self.playerclass == 9))
						{
							x = 0;
							if (self.has_sentry)
							{
								te = find (world, classname, "building_sentrygun");
								while (((te != world) && (te.real_owner != self)))
								{
									te = find (te, classname, "building_sentrygun");
								}
								WriteStr ("Sentry: ");
								WriteIntXXX (te.health, COLOR_WHITE);
								x = (x + 11);
								if (!(self.sbar_type & 1))
								{
									if (((te.ammo_rockets == 0) && (te.ammo_shells == 0)))
									{
										WriteStr (" no ammo");
										x = (x + 8);
									}
									else
									{
										if (!te.ammo_shells)
										{
											WriteStr (" no shells");
											x = (x + enter);
										}
										else
										{
											if ((!te.ammo_rockets && (te.weapon == 3)))
											{
												WriteStr (" no rockets");
												x = (x + 11);
											}
											else
											{
												if ((te.health != te.max_health))
												{
													WriteStr (" damaged");
													x = (x + 8);
												}
											}
										}
									}
								}
								else
								{
									WriteByte (1, slash);
									WriteIntXXX (te.ammo_shells, COLOR_WHITE);
									x = (x + 4);
									if ((te.weapon == 3))
									{
										WriteByte (1, slash);
										WriteIntXX (te.ammo_rockets, COLOR_WHITE);
										x = (x + 3);
									}
								}
							}
							if ((self.has_dispenser && (self.sbar_type && 1)))
							{
								newmis = find (world, classname, "building_dispenser");
								while (((newmis != world) && (newmis.real_owner != self)))
								{
									newmis = find (newmis, classname, "building_dispenser");
								}
								WriteStr (" Disp:");
								WriteIntXXX (newmis.health, COLOR_WHITE);
								x = (x + 9);
							}
							if (((x >= 0) && (x < 35)))
							{
								WriteSpace ((35 - x));
							}
						}
						else
						{
							if ((self.playerclass == 5))
							{
								WriteStr("Medikit:");
								WriteIntXXX (self.ammo_medikit, COLOR_WHITE);
								WriteSpace (19);
							}
						}
					}
				}
			}
		}
	}
	WriteByte (1, enter);
	if ((number_of_teams == 2))
	{
		WriteStr("Blue:");
		WriteIntXXXX (team1score, COLOR_WHITE);
		WriteStr(" Red:");
		WriteIntXXXX (team2score, COLOR_WHITE);
		WriteStr(" ");
	}
	else
	{
		WriteSIntXXXX (team1frags);
		WriteByte (1, slash);
		WriteSIntXXXX (team2frags);
		WriteByte (1, slash);
		WriteSIntXXXX (team3frags);
		WriteByte (1, slash);
		WriteSIntXXXX (team4frags);
	}
	if ((self.playerclass == 11))
	{
		Status_EndWrite ();
		return;
	}
	if (!(self.sbar_type & 1))
	{
		if ((self.current_weapon == 128))
		{
			if (((8 - self.reload_shotgun) > self.ammo_shells))
			{
				self.reload_shotgun = (8 - self.ammo_shells);
			}
			num = (8 - self.reload_shotgun);
		}
		else
		{
			if ((self.current_weapon == 256))
			{
				if (((16 - self.reload_super_shotgun) > self.ammo_shells))
				{
					self.reload_super_shotgun = (16 - self.ammo_shells);
				}
				num = (16 - self.reload_super_shotgun);
			}
			else
			{
				if ((self.current_weapon == 2048))
				{
					if (((6 - self.reload_grenade_launcher) > self.ammo_rockets))
					{
						self.reload_grenade_launcher = (6 - self.ammo_rockets);
					}
					num = (6 - self.reload_grenade_launcher);
				}
				else if ((self.current_weapon == 1048576))
				{
					if (((12 - self.reload_tribolt) > self.ammo_rockets))
					{
						self.reload_tribolt = (12 - self.ammo_rockets);
					}
					num = (12 - self.reload_tribolt);
				}
				else if ((self.current_weapon == 8192))
				{	
					if (((4 - self.reload_rocket_launcher) > self.ammo_rockets))
					{
						self.reload_rocket_launcher = (4 - self.ammo_rockets);
					}
					num = (4 - self.reload_rocket_launcher);					
				}
				else if ((sniperpower) && (self.current_weapon == WEAP_SNIPER_RIFLE)) {
					if (((1 - self.reload_sniper_rifle) > self.ammo_shells))
					{
						self.reload_sniper_rifle = (1 - self.ammo_shells);
					}
					num = (1 - self.reload_sniper_rifle);
				}
				else
				{
					num = -1;
				}
			
			}
		}
		if ((num >= 0))
		{
			WriteStr("\sCLIP\s:"); //W7C (space, space, (_C | 128), (_L | 128), (_I | 128), (_P | 128), (dperiod | 128));
			WriteIntXX (num, COLOR_WHITE);
		}
		else
		{
			WriteSpace (9);
		}
	}
        WriteStr(" \sG\s1:");//W4C (space, (_G | 128), (_1 | 128), dperiod);
	WriteIntXX (self.no_grenades_1, COLOR_WHITE);
	WriteStr(" \sG\s2:");//W4C (space, (_G | 128), (_2 | 128), dperiod);
	WriteIntXX (self.no_grenades_2, COLOR_WHITE);

    if (self.StatusGrenTime > 0) {
        WriteStr( strcat("\n\sGrenade\s: ", ftos(self.StatusGrenTime)) );
    }


	Status_EndWrite ();
};

void () Status_StartWrite =
{
	local float i;

	if ((self.sbar_type & 2))
	{
		WriteByte (1, 8);
		WriteByte (1, 2);
	}
	else
	{
		WriteByte (1, 26);
		i = (self.StatusBarRes + self.StatusBarSize);
		while ((i > 0))
		{
			WriteByte (1, enter);
			i = (i - 1);
		}
	}
};

/* removed by Andi */
/*
void (float f1, float f2, float f3) W3C =
{
	WriteByte (1, f1);
	WriteByte (1, f2);
	WriteByte (1, f3);
};

void (float f1, float f2, float f3, float f4) W4C =
{
	WriteShort (1, ((f2 * 256) + f1));
	WriteShort (1, ((f4 * 256) + f3));
};

void (float f1, float f2, float f3, float f4, float f5) W5C =
{
	WriteShort (1, ((f2 * 256) + f1));
	WriteShort (1, ((f4 * 256) + f3));
	WriteByte (1, f5);
};

void (float f1, float f2, float f3, float f4, float f5, float f6) W6C =
{
	WriteShort (1, ((f2 * 256) + f1));
	WriteShort (1, ((f4 * 256) + f3));
	WriteShort (1, ((f6 * 256) + f5));
};

void (float f1, float f2, float f3, float f4, float f5, float f6, float f7) W7C =
{
	WriteShort (1, ((f2 * 256) + f1));
	WriteShort (1, ((f4 * 256) + f3));
	WriteShort (1, ((f6 * 256) + f5));
	WriteByte (1, f7);
};

void (float f1, float f2, float f3, float f4, float f5, float f6, float f7, float f8) W8C =
{
	WriteShort (1, ((f2 * 256) + f1));
	WriteShort (1, ((f4 * 256) + f3));
	WriteShort (1, ((f6 * 256) + f5));
	WriteShort (1, ((f8 * 256) + f7));
};
*/

void (string str) WriteStr = {

   local float len;
   local float i;
   local string nwstr;

   len = strlen (str);
   for (i = 0; i < len - 1; i = i + 2)
   {
      nwstr = substr(str , i , 2);
      WriteShort(1,str2short(nwstr));
   }

   if (i == len - 1)
   {
      nwstr = substr(str , i , 1);
      WriteByte(1,str2byte(nwstr));
   }
};

void (float f1, float len) WriteRep =
{
   local float i;

   for (i = 0; i < len - 1; i = i + 2)
   {
      WriteShort(1, f1 * 256 + f1);
   }

   if (i == len - 1)
   {
      WriteByte(1,f1);
   }

};


void (float f, float c) WriteIntXX =
{
	local float y;

	if ((f >= enter))
	{
		y = floor ((f / enter));
		WriteByte (1, (y + c));
		f = (f - (y * enter));
		WriteByte (1, (f + c));
	}
	else
	{
		WriteByte (1, space);
		WriteByte (1, (f + c));
	}
};

void (float f, float c) WriteIntXXX =
{
	local float y;

	if ((f >= _d))
	{
		y = floor ((f / _d));
		WriteByte (1, (y + c));
		f = (f - (y * _d));
		y = floor ((f / enter));
		WriteByte (1, (y + c));
		f = (f - (y * enter));
		WriteByte (1, (f + c));
	}
	else
	{
		WriteByte (1, space);
		WriteIntXX (f, c);
	}
};

void (float f, float c) WriteIntXXXX =
{
	local float y;

	if ((f >= 1000))
	{
		y = floor ((f / 1000));
		WriteByte (1, (y + c));
		f = (f - (y * 1000));
		y = floor ((f / _d));
		WriteByte (1, (y + c));
		f = (f - (y * _d));
		y = floor ((f / enter));
		WriteByte (1, (y + c));
		f = (f - (y * enter));
		WriteByte (1, (f + c));
	}
	else
	{
		WriteByte (1, space);
		WriteIntXXX (f, c);
	}
};

void (float f) WriteSIntXXXX =
{
	local float i;
	local float y;
	local float b1;
	local float b2;
	local float b3;
	local float b4;

	if ((f >= 0))
	{
		WriteIntXXXX (f, COLOR_WHITE);
		return;
	}
	f = (0 - f);
	if ((f > _c))
	{
		WriteByte (1, (minus + 128));
		WriteIntXXX (i, COLOR_WHITE);
		return;
	}
	if ((f > 9))
	{
		WriteByte (1, space);
		WriteByte (1, (minus + 128));
		WriteIntXX (i, COLOR_WHITE);
		return;
	}
	WriteByte (1, space);
	WriteByte (1, minus);
	WriteByte (1, (i + COLOR_WHITE));
	WriteByte (1, space);
};

void (float i) WriteSpace =
{
	while (i)
	{
		WriteByte (1, space);
		i = (i - 1);
	}
};

void () Status_EndWrite =
{
	WriteByte (1, 0);
};

void () StatusBar_On =
{
	if (!self.StatusBarSize)
	{
		self.StatusRefreshTime = (time + 60);
	}
	else
	{
		if (self.StatusBarSize)
		{
			self.StatusRefreshTime = (time + 0.2);
		}
	}
};

float (float f) Impulse2Res =
{
	if ((f == 1))
	{
		return (SBAR_200);
	}
	if ((f == 2))
	{
		return (SBAR_240);
	}
	if ((f == 3))
	{
		return (SBAR_300);
	}
	if ((f == 4))
	{
		return (SBAR_350);
	}
	if ((f == 5))
	{
		return (33);
	}
	if ((f == 6))
	{
		return (SBAR_400);
	}
	if ((f == 7))
	{
		return (SBAR_480);
	}
	if ((f == 8))
	{
		return (SBAR_600);
	}
	if ((f == 9))
	{
		return (SBAR_768);
	}
	return (f);
};

void (float res) StatusRes =
{
	self.last_impulse = 0;
	if (!res)
	{
		return;
	}
	self.StatusBarRes = Impulse2Res (res);
	if ((res == 9))
	{
		sprint (self, 2, "Status Bar Res set to 1024x768.\n");
	}
	else
	{
		if ((res == 8))
		{
			sprint (self, 2, "Status Bar Res set to 800x600.\n");
		}
		else
		{
			if ((res == 7))
			{
				sprint (self, 2, "Status Bar Res set to 640x480.\n");
			}
			else
			{
				if ((res == 6))
				{
					sprint (self, 2, "Status Bar Res set to 640x400.\n");
				}
				else
				{
					if ((res == 5))
					{
						sprint (self, 2, "Status Bar Res set to 512x384.\n");
					}
					else
					{
						if ((res == 4))
						{
							sprint (self, 2, "Status Bar Res set to 320x350.\n");
						}
						else
						{
							if ((res == 3))
							{
								sprint (self, 2, "Status Bar Res set to 400x300.\n");
							}
							else
							{
								if ((res == 2))
								{
									sprint (self, 2, "Status Bar Res set to 320x240.\n");
								}
								else
								{
									if ((res == 1))
									{
										sprint (self, 2, "Status Bar Res set to 320x200.\n");
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

string (float type) Status_GrenTypeToString =
{
	if ((type == 2))
	{
		return ("Concussion grenade");
	}
	if ((type == 3))
	{
		return ("Nail grenade");
	}
	if ((type == 4))
	{
		return ("Mirv grenade");
	}
	if ((type == 5))
	{
		return ("Napalm grenade");
	}
	if ((type == 6))
	{
		return ("Flare");
	}
	if ((type == 7))
	{
		return ("Gas grenade");
	}
	if ((type == 8))
	{
		return ("EMP grenade");
	}
	if ((type == 9))
	{
		return ("Flash grenade");
	}
	if ((type == enter))
	{
		return ("Caltrop canister");
	}
	return ("Grenade");
};

string (float tm) Status_TeamNumToTeamString =
{
	if ((tm == 1))
	{
		return ("blue");
	}
	if ((tm == 2))
	{
		return ("red");
	}
	if ((tm == 3))
	{
		return ("yellow");
	}
	if ((tm == 4))
	{
		return ("green");
	}

	return ("unknown");
};
void (float class) TeamFortress_SpyChangeSkin;
void (float teamno) TeamFortress_SpyChangeColor;
void (float issilent) TeamFortress_SpyFeignDeath;
void (entity spy) Spy_RemoveDisguise;
void (entity eng, string bld) DestroyBuilding;
void (float objtobuild) TeamFortress_Build;
void () lvl2_sentry_stand;
void () lvl3_sentry_stand;
void () lvl2_oldsentry_stand;
void () lvl3_oldsentry_stand;
float (float tno) TeamFortress_TeamSet;
float (float tno) TeamFortress_TeamGetColor;
float () TeamFortress_TeamPutPlayerInTeam;
float (float tno) TeamFortress_TeamIsCivilian;
float (float tno) TeamFortress_TeamGetNoPlayers;
float () TeamFortress_GetNoPlayers;
void (float inp) TeamFortress_ChangeClass;
void (entity p) TeamFortress_SetSkin;
void (float type) TeamFortress_DropAmmo;
void (entity targ, entity inflictor, entity attacker, float damage, float T_flags, float T_AttackType) TF_T_Damage;
void () W_SetCurrentAmmo;
void (entity p) bound_other_ammo;
void (float tno, entity ignore, string st) teamsprint;
void (float menu_no) DisplayMenu;
void () Menu_Team;
void () Menu_Class;
void () Menu_Drop;
void () Menu_Intro;
void () Menu_ClassHelp;
void () Menu_ClassHelp2;
void () Menu_StuffClassHelp;
void (float inp) Menu_ClassHelp_Input;
void () Menu_RepeatHelp;
void () Menu_Spy;
void () Menu_Spy_Skin;
void () Menu_Spy_Color;
void (float inp) Menu_Spy_Input;
void (float inp) Menu_Spy_Skin_Input;
void (float inp) Menu_Spy_Color_Input;
void () Menu_Engineer;
void () Menu_EngineerFix_Dispenser;
void () Menu_EngineerFix_SentryGun;
void (string status) Menu_EngineerFix_SentryGun_Rotate;
void (float inp) Menu_Engineer_Input;
void (float inp) Menu_EngineerFix_Dispenser_Input;
void (float inp) Menu_EngineerFix_SentryGun_Input;
void (float inp) Menu_EngineerFix_SentryGun_Rotate_Input;
void () Menu_Dispenser;
void (float inp) Menu_Dispenser_Input;
void () Menu_Admin;
void (float inp) Menu_Admin_Input;

void () ResetMenu =
{
	if ((self.StatusBarSize == 0))
	{
		CenterPrint (self, "\n");
	}
	else
	{
		self.StatusRefreshTime = (time + 0.1);
	}
	self.menu_count = 30;
	self.current_menu = 1;
	self.current_menu_type = 0;
	self.current_menu_page = 0;
};

void () Player_Menu =
{
	if ((self.menu_count > 30))
	{
		self.menu_count = 0;
	}
	else
	{
		self.menu_count = (self.menu_count + 1);
		return;
	}

	if ((self.current_menu == 5))
	{
		Menu_Intro ();
		if ((self.menu_displaytime > 6))
		{
			self.current_menu = 1;
		}
		else
		{
			self.menu_displaytime = (self.menu_displaytime + 1);
		}
	}
	else
	{
		if ((self.current_menu == 6))
		{
			Menu_ClassHelp ();
			if ((self.menu_displaytime > 8))
			{
				Menu_StuffClassHelp ();
				self.current_menu = 1;
			}
			else
			{
				self.menu_displaytime = (self.menu_displaytime + 1);
			}
		}
		else
		{
			if ((self.current_menu == 7))
			{
				Menu_ClassHelp2 ();
				if ((self.menu_displaytime > 5))
				{
					Menu_StuffClassHelp ();
					self.current_menu = 1;
				}
				else
				{
					self.menu_displaytime = (self.menu_displaytime + 1);
				}
			}
			else
			{
				if ((self.current_menu == 4))
				{
					Menu_Drop ();
				}
				else
				{
					if ((self.current_menu == 12))
					{
						Menu_Spy ();
					}
					else
					{
						if ((self.current_menu == 13))
						{
							Menu_Spy_Skin ();
						}
						else
						{
							if ((self.current_menu == 14))
							{
								Menu_Spy_Color ();
							}
							else
							{
								if ((self.current_menu == 15))
								{
									Menu_Engineer ();
								}
	else if (self.current_menu == 24) {
		Menu_Admin ();
	}
	else if (self.current_menu == 25) {
		self.current_menu = 25;
	} else if (self.current_menu == 26) {
		self.current_menu = 26;
	} else if (self.current_menu == 27) {
		self.current_menu = 27;
	}


								else
								{
									if ((self.current_menu == 16))
									{
										Menu_EngineerFix_Dispenser ();
									}
									else
									{
										if ((self.current_menu == 17))
										{
											Menu_EngineerFix_SentryGun ();
										}
										else
										{
											if ((self.current_menu == 19))
											{
												Menu_Dispenser ();
											}
											else
											{
												if ((self.current_menu == 8))
												{
													Menu_RepeatHelp ();
													self.current_menu = 1;
												}
												else
												{
													if ((self.current_menu == 20) && !captainmode)
													{
														Menu_Class ();
													}
													else
													{
														if ((self.current_menu == 2 && !captainmode))
														{
															Menu_Team ();
														}
														else
														{
															if (((self.team_no == 0) && teamplay && !captainmode))
															{
																if ((round_over >= 2))
																{
																	return;
																}
																self.current_menu = 2;
																Menu_Team ();
															}
															else
															{
																if ((self.playerclass == 0))
																{
																	if (round_active && !captainmode)
																	{
																		return;
																	}
																	if (TeamFortress_TeamIsCivilian (self.team_no))
																	{
																		PutClientInServer ();
																		return;
																	}
																	self.current_menu = 3;
																	Menu_Class ();
																}
																else
																{
																	self.current_menu = 0;
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
						}
					}
				}
			}
		}
	}
};

void (float menu_no) DisplayMenu =
{

	if (captainmode)
		return;

	self.current_menu = menu_no;
	if ((menu_no == 2))
	{
		Menu_Team ();
	}
	else
	{
		if ((menu_no == 3))
		{
			Menu_Class ();
		}
	}
};

void () Menu_Team =
{
	if (((toggleflags & 64) && teamplay && !captainmode))
	{
		if (TeamFortress_TeamPutPlayerInTeam ())
		{
			ResetMenu ();
			return;
		}
	}
	if ((team_menu_string != string_null))
	{
		CenterPrint (self, team_menu_string);
		return;
	}
	if ((CTF_Map == 1))
	{
		CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Blue Team  \nêîë Red Team   \n\n\n");
	}
	else
	{
		if ((number_of_teams == 2))
		{
			if (tfstrike)
			{
				CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Counter Terrorists \nêîë Terrorists         \n\n\nêóë Auto Team          \nêòë Observe            ");
			}
			else
			{
				CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Team One  \nêîë Team Two  \n\n\nêóë Auto Team \nêòë Observe   ");
			}
		}
		else
		{
			CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Team One  \nêîë Team Two  \nêïë Team Three\nêñë Team Four \nêóë Auto Team \nêòë Observe   \n");
		}
	}
};

void (float inp) Menu_Team_Input =
{

	if (captainmode)
		return;

	if ((inp == 6))
	{
		TeamFortress_TeamSet (-1);
		self.current_menu = 0;
		Menu_StuffClassHelp ();
		Menu_ClassHelp ();
		self.impulse = 0;
		return;
	}
	else
	{
		if ((inp == 5))
		{
			TeamFortress_TeamPutPlayerInTeam ();
		}
		else
		{
			if (((inp <= number_of_teams) && (inp > 0)))
			{
				TeamFortress_TeamSet (inp);
			}
			else
			{
				if (((number_of_teams == 0) && (inp <= 4)))
				{
					TeamFortress_TeamSet (inp);
				}
			}
		}
	}
	ResetMenu ();
	self.impulse = 0;
};

void () Menu_Class =
{

	if (captainmode)
		return;

	local entity AD;

	AD = find (world, classname, "info_tfdetect");
	if (AD)
	{
		if ((self.team_no == 1))
		{
			if ((AD.noise1 != string_null))
			{
				CenterPrint (self, AD.noise1);
				return;
			}
		}
		else
		{
			if ((self.team_no == 2))
			{
				if ((AD.noise2 != string_null))
				{
					CenterPrint (self, AD.noise2);
					return;
				}
			}
			else
			{
				if ((self.team_no == 3))
				{
					if ((AD.noise3 != string_null))
					{
						CenterPrint (self, AD.noise3);
						return;
					}
				}
				else
				{
					if ((self.team_no == 4))
					{
						if ((AD.noise4 != string_null))
						{
							CenterPrint (self, AD.noise4);
							return;
						}
					}
				}
			}
		}
	}
	if (TeamFortress_TeamIsCivilian (self.team_no))
	{
		if ((tfvsdm == 1))
		{
			CenterPrint (self, "Your team can only be Quake Soldiers.\n");
		}
		else
		{
			CenterPrint (self, "Your team can only be Civilians.\n");
		}
	}
	else
	{
		CenterPrint (self, "ûûû Choose Your Class ûûû\n\nêìë Scout   \nêîë Sniper  \nêïë Soldier \nêñë Demoman \nêóë Medic   \nêòë HWGuy   \nêôë Pyro    \nêöë Spy     \nêõë Engineer\nêíë RandomPC\n");
	}
};

void (float inp) Menu_Class_Input =
{
	local float new_class;
	local string st;

	if (((inp > 11) || (inp < 1)))
	{
		return;
	}
	if (self.playerclass)
	{
		new_class = 1;
	}
	TeamFortress_ChangeClass (inp);
	ResetMenu ();
	if (((self.playerclass && (new_class != 1)) && (self.playerclass != 11)))
	{
		if (1)
		{
			st = infokey (self, "ch");
			if ((st == string_null))
			{
				st = infokey (self, "classhelp");
			}
			if (((st != "off") && !(self.tfkey & 1)))
			{
				self.current_menu = 6;
			}
		}
		else
		{
			self.current_menu = 1;
		}
	}
	self.menu_displaytime = 0;
};

void () Menu_Drop =
{
	if ((self.playerclass == 9))
	{
		CenterPrint (self, "Drop || Make:                   \nêìë Shells                      \nêîë Nails                       \nêïë Rockets                     \nêñë Cells                       \nêóë Nothing                     \n\n");
	}
	else
	{
		CenterPrint (self, "Drop:                           \nêìë Shells                      \nêîë Nails                       \nêïë Rockets                     \nêñë Cells                       \nêóë Nothing                     \n\n");
	}
};

void () Menu_RepeatHelp =
{
	CenterPrint (self, "Press ö to see this help again\n");
};

void (float inp) Menu_Drop_Input =
{
	if (((inp > 0) && (inp < 5)))
	{
		TeamFortress_DropAmmo (inp);
	}
	if (((inp > 0) && (inp < 6)))
	{
		ResetMenu ();
	}
	self.impulse = 0;
};

void (float inp) Menu_Input =
{
	if ((self.current_menu == 24)) {
		Menu_Admin_Input (inp);
	} else if ((self.current_menu == 25)) {
		BotMenu_Input (inp);
	} else if ((self.current_menu == 26)) {
		BotClassMenu_Input (inp);
	} else if ((self.current_menu == 27)) {
		BotTeamMenu_Input (inp);
	}

	else if ((self.current_menu == 2) && !captainmode)
	{
		Menu_Team_Input (inp);
	}
	else
	{
		if (((self.current_menu == 3) || (self.current_menu == 20)) && !captainmode)
		{
			Menu_Class_Input (inp);
		}
		else
		{
			if ((self.current_menu == 4))
			{
				Menu_Drop_Input (inp);
			}
			else
			{
				if ((self.current_menu == 12))
				{
					Menu_Spy_Input (inp);
				}
				else
				{
					if ((self.current_menu == 13))
					{
						Menu_Spy_Skin_Input (inp);
					}
					else
					{
						if ((self.current_menu == 14))
						{
							Menu_Spy_Color_Input (inp);
						}
						else
						{
							if ((self.current_menu == 15))
							{
								Menu_Engineer_Input (inp);
							}
							else
							{
								if ((self.current_menu == 16))
								{
									Menu_EngineerFix_Dispenser_Input (inp);
								}
								else
								{
									if ((self.current_menu == 17))
									{
										Menu_EngineerFix_SentryGun_Input (inp);
									}
									else
									{
										if ((self.current_menu == 19))
										{
											Menu_Dispenser_Input (inp);
										}
										else
										{
											if ((self.current_menu == 6))
											{
												Menu_ClassHelp_Input (inp);
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
	}
};

void () Menu_Intro =
{
	local string st1;
	local string st2;

	st1 = infokey (world, "motd1");
	if ((st1 != string_null))
	{
		st2 = infokey (world, "motd2");
		CenterPrint3 (self, st1, "\n", st2);
	}
	else
	{
		CenterPrint (self, "Welcome to Hue Team Fortress 1.45\nùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\nhttp://github.com/gmtandi/huetf\n\nBased on OzTF 1.45\nDecompiled by Andi\nThe Brazilian QWTF Community 2017\n");
	}
};

void () Menu_ClassHelp =
{
	if ((self.menu_displaytime < 5))
	{
		if ((self.playerclass == 1))
		{
			CenterPrint (self, "”√œ’‘ Details:               \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêñë Nailgun                  \n\nPress ö for alias help\n");
		}
		else
		{
			if ((self.playerclass == 2))
			{
				CenterPrint (self, "”Œ…–≈“ Details:              \n\n◊≈¡–œŒ”:                     \nêîë Sniper Rifle/Auto Rifle  \nêñë Nailgun                  \n\nPress ö for alias help\n");
			}
			else
			{
				if ((self.playerclass == 3))
				{
					CenterPrint (self, "”œÃƒ…≈“ Details:             \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Rocket Launcher          \n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == 4))
					{
						CenterPrint (self, "ƒ≈ÕœÃ…‘…œŒ” Õ¡Œ Details:     \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêòë Grenade Launcher         \nêôë Pipebomb Launcher        \n\nPress ö for alias help\n");
					}
					else
					{
						if ((self.playerclass == 5))
						{
							CenterPrint (self, "Õ≈ƒ…√ Details:               \n\n◊≈¡–œŒ”:                     \nêìë Medikit/BioWeapon        \nêîë Shotgun                  \nêïë Super Shotgun            \nêóë Super Nailgun            \n\nPress ö for alias help\n");
						}
						else
						{
							if ((self.playerclass == 6))
							{
								if (!classrework)
									CenterPrint (self, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:   \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Assault Cannon           \n\nPress ö for alias help\n");
								else
									CenterPrint (self, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:   \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Tribolt           \n\nPress ö for alias help\n");
							}
							else
							{
								if ((self.playerclass == 7))
								{
									CenterPrint (self, "–Ÿ“œ Details:                \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Flamethrower             \nêòë Light Incendiary Cannon  \nêôë Heavy Incendiary Cannon  \n\nPress ö for alias help\n");
								}
								else
								{
									if ((self.playerclass == 8))
									{
										CenterPrint (self, "”–Ÿ Details:                 \n\n◊≈¡–œŒ”:                     \nêîë Tranquiliser Gun         \nêïë Super Shotgun            \nêñë Nailgun                  \n\nPress ö for alias help\n");
									}
									else
									{
										if ((self.playerclass == 9))
										{
											CenterPrint (self, "≈Œ«…Œ≈≈“ Details:            \n\n◊≈¡–œŒ”:                     \nêìë Spanner                  \nêîë RailGun                  \nêïë Super Shotgun            \n\nPress ö for alias help\n");
										}
										else
										{
											if (!self.playerclass)
											{
												CenterPrint (self, "\n\n\nObserver Details:             \n\n√œÕÕ¡Œƒ”:                     \ntracking: toggle tracking mode\ntrack_player: player camera   \ntrack_sentry: sentrygun camera\ntrack_tfgoal: flag camera     \nspecial: camera lock-on       \n");
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
	}
	else
	{
		if ((self.playerclass == 1))
		{
			CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nFlash Grenade       \nConcussion Grenade  \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nScanner: autoscan,scansound,scane,scanf\n\n\nPress ö for alias help\n");
		}
		else
		{
			if ((self.playerclass == 2))
			{
				CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nFlare               \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nautozoom : Toggle Rifle Autozooming\n\n\nPress ö for alias help\n");
			}
			else
			{
				if ((self.playerclass == 3))
				{
					CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nNail Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == 4))
					{
						CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nMirv Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nThe Detpack : +det5,+det20,+det50,+det255\nDetonate Pipebombs : detpipe  \n\n\nPress ö for alias help\n");
					}
					else
					{
						if ((self.playerclass == 5))
						{
							CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nConcussion Grenade  \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
						}
						else
						{
							if ((self.playerclass == 6))
							{
								CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nMirv Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
							}
							else
							{
								if ((self.playerclass == 7))
								{
									CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nNapalm Grenade      \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
								}
								else
								{
									if ((self.playerclass == 8))
									{
										CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nHallucinogen Grenade\n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nGo Undercover : disguise\nFeign Death : feign, sfeign\n\n\nPress ö for alias help\n");
									}
									else
									{
										if ((self.playerclass == 9))
										{
											CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nEMP Grenade         \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nStart Building : build  \n\n\nPress ö for alias help\n");
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
};

void () Menu_StuffClassHelp =
{
	if ((self.playerclass == 1))
	{
		sprint (self, 2, "”√œ’‘ Details:\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êñë Nailgun\n");
		sprint (self, 2, "«“≈Œ¡ƒ≈”:\n   Concussion Grenade\n   Flare\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n");
		sprint (self, 2, "Scanner: autoscan,scansound,scane,scanf\n\n\n");
	}
	else
	{
		if ((self.playerclass == 2))
		{
			sprint (self, 2, "”Œ…–≈“ Details:\n\n◊≈¡–œŒ”:\n   êîë Sniper Rifle/Auto Rifle\n");
			sprint (self, 2, "êñë Nailgun\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n\n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n");
			sprint (self, 2, "  autozoom : Toggle Rifle Autozooming\n\n\n");
		}
		else
		{
			if ((self.playerclass == 3))
			{
				sprint (self, 2, "”œÃƒ…≈“ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êïë Super Shotgun\n");
				sprint (self, 2, "   êôë Rocket Launcher\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Nail Grenade\n");
				sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
			}
			else
			{
				if ((self.playerclass == 4))
				{
					sprint (self, 2, "ƒ≈ÕœÃ…‘…œŒ” Õ¡Œ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êòë Grenade/Pipebomb Launcher\n");
					sprint (self, 2, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Mirv Grenade\n");
					sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   The Detpack : +det5,+det20,+det50,+det255\n   Detonate Pipebombs : detpipe\n\n\n");
				}
				else
				{
					if ((self.playerclass == 5))
					{
						sprint (self, 2, "Õ≈ƒ…√ Details:\n\n◊≈¡–œŒ”:\n   êìë Medikit/BioWeapon\n   êîë Shotgun\n   êïë Super Shotgun\n");
						sprint (self, 2, "   êóë Super Nailgun\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Concussion Grenade\n");
						sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
					}
					else
					{
						if ((self.playerclass == 6))
						{
							sprint (self, 2, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êïë Super Shotgun\n");
							if (!classrework)
								sprint (self, 2, "   êôë Assault Cannon\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n");
							else
								sprint (self, 2, "   êôë Tribolt\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n");
							sprint (self, 2, "   Mirv Grenade\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
						}
						else
						{
							if ((self.playerclass == 7))
							{
								sprint (self, 2, "–Ÿ“œ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êòë Flamethrower\n   êôë Incendiary Cannon\n");
								sprint (self, 2, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Napalm Grenade\n");
								sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
							}
							else
							{
								if ((self.playerclass == 8))
								{
									sprint (self, 2, "”–Ÿ Details:\n\n◊≈¡–œŒ”:\n   êîë Tranquiliser Gun\n   êïë Super Shotgun\n   êñë Nailgun\n");
									sprint (self, 2, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Hallucinogenic Grenade\n");
									sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   Go Undercover : disguise\n   Feign Death : feign, sfeign\n\n\n");
								}
								else
								{
									if ((self.playerclass == 9))
									{
										sprint (self, 2, "≈Œ«…Œ≈≈“ Details:\n\n◊≈¡–œŒ”:\n   êìë Spanner\n   êîë RailGun\n   êïë Super Shotgun\n");
										sprint (self, 2, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   EMP Grenade\n");
										sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   Start Building : build\n\n\n");
									}
									else
									{
										if (!self.playerclass)
										{
											sprint (self, 2, "\n\nObserver Details:\n\n\n√œÕÕ¡Œƒ”: \n   tracking:     toggle tracking mode\n   track_player: observe a player\n   track_sentry: observe a sentrygun\n   track_tfgoal: observe a team's flag\n   special:      lock onto && observe an object\n");
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
};

void () Menu_ClassHelp2 =
{
	CenterPrint (self, "Commands:\ninv       : Show inventory \n+gren1    : Throw grenade 1\n+gren2    : Throw Grenade 2\nreload    : Force a reload \ndropammo  : drop some ammo \n\n");
};

void (float inp) Menu_ClassHelp_Input =
{
	if (((self.team_no == 2) || (self.team_no == 4)))
	{
		if ((tfvsdm == 1))
		{
			return;
		}
	}
	if ((inp == 8))
	{
		Menu_ClassHelp2 ();
		self.menu_count = 30;
		self.current_menu = 7;
		self.menu_displaytime = 0;
		self.impulse = 0;
	}
};

void () Menu_Spy =
{
	if (((self.effects & (8 | 4)) || (self.is_unabletospy == 1)))
	{
		ResetMenu ();
		return;
	}
	if (self.is_feigning)
	{
		if (((self.undercover_team != 0) && (self.undercover_skin != 0)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != 0))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != 0))
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Skin                  \nêóë Nothing                     \n\n");
				}
				else
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Nothing                     \n\n");
				}
			}
		}
	}
	else
	{
		if (((self.undercover_team != 0) && (self.undercover_skin != 0)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != 0))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != 0))
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Skin                  \nêóë Nothing                     \n\n");
				}
				else
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Nothing                     \n\n");
				}
			}
		}
	}
};

void (float inp) Menu_Spy_Input =
{
	local float tc;
	local string st;

	if (((inp == 1) || (inp == 2)))
	{
		if ((self.effects & (8 | 4)))
		{
			sprint (self, 2, "You can't go undercover while glowing.\n");
			ResetMenu ();
			self.impulse = 0;
			return;
		}
		if ((self.is_unabletospy == 1))
		{
			sprint (self, 2, "You can't go undercover right now.\n");
			ResetMenu ();
			self.impulse = 0;
			return;
		}
	}
	if ((inp == 1))
	{
		Menu_Spy_Skin ();
		self.menu_count = 30;
		self.current_menu = 13;
		self.menu_displaytime = 0;
		self.impulse = 0;
	}
	else
	{
		if ((inp == 2))
		{
			Menu_Spy_Color ();
			self.menu_count = 30;
			self.current_menu = 14;
			self.menu_displaytime = 0;
			self.impulse = 0;
		}
		else
		{
			if ((inp == 3))
			{
				TeamFortress_SpyFeignDeath (0);
				ResetMenu ();
				self.impulse = 0;
			}
			else
			{
				if ((inp == 4))
				{
					Spy_RemoveDisguise (self);
					ResetMenu ();
					self.impulse = 0;
				}
				else
				{
					if (((inp == 5) && ((self.undercover_team != 0) || (self.undercover_skin != 0))))
					{
						ResetMenu ();
						self.impulse = 0;
					}
				}
			}
		}
	}
};

void () Menu_Spy_Skin =
{
	if (((self.undercover_team == 2) || (self.undercover_team == 4)))
	{
		if ((tfvsdm == 1))
		{
			CenterPrint (self, "ûûû Change Skin to: ûûû\nêìë Base");
			return;
		}
	}
	CenterPrint (self, "ûûû Change Skin to: ûûû\nêìë Scout   \nêîë Sniper  \nêïë Soldier \nêñë Demoman \nêóë Medic   \nêòë Hvwep   \nêôë Pyro    \nêöë Spy     \nêõë Engineer\n\n");
};

void (float inp) Menu_Spy_Skin_Input =
{
	if (((self.undercover_team == 2) || (self.undercover_team == 4)))
	{
		if ((tfvsdm == 1))
		{
			if ((inp == 1))
			{
				TeamFortress_SpyChangeSkin (inp);
				ResetMenu ();
				self.impulse = 0;
			}
			return;
		}
	}
	if (((inp < enter) && (inp > 0)))
	{
		TeamFortress_SpyChangeSkin (inp);
		ResetMenu ();
		self.impulse = 0;
	}
};

void () Menu_Spy_Color =
{
	if ((number_of_teams == 0))
	{
		sprint (self, 2, "No Color changing allowed in deathmatch.\n");
		ResetMenu ();
		self.impulse = 0;
		return;
	}
	if ((number_of_teams == 2))
	{
		CenterPrint (self, "ûûû Change Color to the Same Color as: ûûû\n\nêìë Team One  \nêîë Team Two  \n\n");
	}
	else
	{
		CenterPrint (self, "ûûû Change Color to the Same Color as: ûûû\n\nêìë Team One  \nêîë Team Two  \nêïë Team Three\nêñë Team Four \n\n");
	}
};

void (float inp) Menu_Spy_Color_Input =
{
	if (((inp >= 1) && (inp <= number_of_teams)))
	{
		if ((tfvsdm == 1))
		{
			if ((self.undercover_skin != 0))
			{
				if (((inp == 2) || (inp == 4)))
				{
					CenterPrint (self, "ûûû Cannot change Color, You must Reset your Skin. ûûû\n");
					return;
				}
			}
		}
		TeamFortress_SpyChangeColor (inp);
		ResetMenu ();
		self.impulse = 0;
	}
};

void () Menu_Engineer =
{
	local string s_action;
	local string s_disp;
	local string s_sentry;
	local string s_tpent;
	local string s_tpexit;
	local string s_nothing;

	s_action = "Action:                           \n";
	s_nothing = "êóë Nothing                      \n\n";
	if (self.has_dispenser)
	{
		s_disp = "êôë Remotely Detonate Dispenser  \n";
	}
	else
	{
		if ((self.ammo_cells >= _d))
		{
			s_disp = "êìë Build Ammo&Armor Dispenser   \n";
		}
		else
		{
			s_disp = "\n";
		}
	}
	if (self.has_sentry)
	{
		s_sentry = "êöë Remotely Detonate Sentry Gun \n";
	}
	else
	{
		if ((self.ammo_cells >= 130))
		{
			s_sentry = "êîë Build Sentry Gun             \n";
		}
		else
		{
			s_sentry = "\n";
		}
	}
	s_action = strcat(s_action, s_disp);
	s_action = strcat(s_action, s_sentry);
	s_action = strcat(s_action, s_nothing);
	centerprint (self, s_action);
};

void (float inp) Menu_Engineer_Input =
{
	local entity te;

	if ((((inp == 1) && (self.ammo_cells >= _d)) && (self.has_dispenser != 1)))
	{
		TeamFortress_Build (1);
		ResetMenu ();
		self.impulse = 0;
	}
	else
	{
		if ((((inp == 2) && (self.ammo_cells >= 130)) && (self.has_sentry != 1)))
		{
			TeamFortress_Build (2);
			ResetMenu ();
			self.impulse = 0;
		}
		else
		{
			if (((inp == 7) && (self.has_dispenser == 1)))
			{
				DestroyBuilding (self, "building_dispenser");
				ResetMenu ();
				self.impulse = 0;
			}
			else
			{
				if (((inp == 8) && (self.has_sentry == 1)))
				{
					DestroyBuilding (self, "building_sentrygun");
					ResetMenu ();
					self.impulse = 0;
				}
				else
				{
					if ((inp == 5))
					{
						ResetMenu ();
						self.impulse = 0;
					}
				}
			}
		}
	}
};

string (string text, float maxlength) Menu_Indent_line = 
{
	local float spaces;	
	local float i;
	
	spaces = maxlength - (strlen(text) % (maxlength+1));
	for (i = 0; i < spaces; i = i + 1)
    {
      text = strcat(text," ");
    }
    text = strcat(text,"\n");
    return text;
}

void () Menu_EngineerFix_Dispenser =
{
	local entity disp = self.building;
	local string status;
	local float spaces;
	local float i;

	status = strcat(status,"Dispenser has ");
	status = strcat(status,ftos (disp.health));
	status = strcat(status," health");
	status = Menu_Indent_line(status,35);
	
	status = strcat(status,ftos (disp.ammo_shells));
	status = strcat(status," shells, ");
	status = strcat(status,ftos (disp.ammo_nails));
	status = strcat(status," nails,");
	status = strcat(status,ftos (disp.ammo_rockets));
	status = strcat(status," rockets");
	status = Menu_Indent_line(status,35);
	status = strcat(status,ftos (disp.ammo_cells));
	status = strcat(status," cells, and ");
	status = strcat(status,ftos (disp.armorvalue));
	status = strcat(status," armor");
	status = Menu_Indent_line(status,35);
	status = strcat(status,"\n");
	CenterPrint2(self,status,"Action:                            \nêìë Put Ammo into Dispenser     \nêîë Put Armor into Dispenser    \nêïë Repair Dispenser            \nêñë Dismantle Dispenser         \nêóë Nothing                     \n\n");	
};

void (float inp) Menu_EngineerFix_Dispenser_Input =
{
	local float metalcost;
	local float am;

	if (((self.classname != "player") || (self.building == world)))
	{
		return;
	}
	if ((inp == 1))
	{
		am = (20 * 2);
		if ((am > self.ammo_shells))
		{
			am = self.ammo_shells;
		}
		if ((am > (400 - self.building.ammo_shells)))
		{
			am = (400 - self.building.ammo_shells);
		}
		if (!practice)
		{
			self.ammo_shells = (self.ammo_shells - am);
		}
		self.building.ammo_shells = (self.building.ammo_shells + am);
		am = (20 * 2);
		if ((am > self.ammo_nails))
		{
			am = self.ammo_nails;
		}
		if ((am > (600 - self.building.ammo_nails)))
		{
			am = (600 - self.building.ammo_nails);
		}
		if (!practice)
		{
			self.ammo_nails = (self.ammo_nails - am);
		}
		self.building.ammo_nails = (self.building.ammo_nails + am);
		am = (enter * 2);
		if ((am > self.ammo_rockets))
		{
			am = self.ammo_rockets;
		}
		if ((am > (300 - self.building.ammo_rockets)))
		{
			am = (300 - self.building.ammo_rockets);
		}
		if (!practice)
		{
			self.ammo_rockets = (self.ammo_rockets - am);
		}
		self.building.ammo_rockets = (self.building.ammo_rockets + am);
		am = (enter * 2);
		if ((am > self.ammo_cells))
		{
			am = self.ammo_cells;
		}
		if ((am > (400 - self.building.ammo_cells)))
		{
			am = (400 - self.building.ammo_cells);
		}
		if (!practice)
		{
			self.ammo_cells = (self.ammo_cells - am);
		}
		self.building.ammo_cells = (self.building.ammo_cells + am);
	}
	else
	{
		if ((inp == 2))
		{
			am = (40 * 2);
			if ((am > self.armorvalue))
			{
				am = self.armorvalue;
			}
			if ((am > (500 - self.building.armorvalue)))
			{
				am = (500 - self.building.armorvalue);
			}
			if (!practice)
			{
				self.armorvalue = (self.armorvalue - am);
			}
			self.building.armorvalue = (self.building.armorvalue + am);
		}
		else
		{
			if ((inp == 3))
			{
				metalcost = ((self.building.max_health - self.building.health) / 5);
				if ((metalcost > self.ammo_cells))
				{
					metalcost = self.ammo_cells;
				}
				if (!practice)
				{
					self.ammo_cells = (self.ammo_cells - metalcost);
				}
				self.building.health = (self.building.health + (metalcost * 5));
			}
			else
			{
				if ((inp == 4))
				{
					sprint (self, 2, "You dismantle the Dispenser.\n");
					if (!practice)
					{
						self.ammo_cells = (self.ammo_cells + (_d / 2));
					}
					if ((self.building.real_owner != self))
					{
						sprint2 (self.building.real_owner, 2, self.netname, " dismantled your Dispenser.\n");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, " dismantled ");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.building.real_owner.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, "'s Dispenser.\n");
					}
					dremove (self.building);
					self.building.real_owner.has_dispenser = 0;
				}
			}
		}
	}
	if (((inp >= 1) && (inp <= 5)))
	{
		ResetMenu ();
		self.impulse = 0;
		self.building = world;
		bound_other_ammo (self);
		if ((self.armorvalue == 0))
		{
			self.armortype = 0;
			self.armorclass = 0;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void () Menu_EngineerFix_SentryGun =
{
	local entity gun = self.building;
	local string status;
	local float spaces;
	local float i;

	status = strcat(status,"Level ");
    status = strcat(status,ftos (gun.weapon));
	status = strcat(status," Sentry Gun has ");
	status = strcat(status,ftos (gun.health));
	status = strcat(status," health");
	status = Menu_Indent_line(status,35);
	status = strcat(status,ftos (gun.ammo_shells));
	status = strcat(status," shells");
	if ((gun.weapon == 3))
	{
		status = strcat(status,", ");
		status = strcat(status,ftos (gun.ammo_rockets));
		status = strcat(status," rockets");
	}

	status = Menu_Indent_line(status,35);
	status = strcat(status,"\n");



	// only show this menu if autospanner is enabled, else show the original menu
    if (autospanner) {    	
        Menu_EngineerFix_SentryGun_Rotate(status);
        return;
    }
//	if (  ( (self.building.weapon < 3) && (self.ammo_cells >= 130) && !sglvl2to3 )  || ( (self.building.weapon < 2) && (self.ammo_cells >= 130) && sglvl2to3 ) )
	if ( (self.building.weapon < 3) && (self.ammo_cells >= 130) )
	{
		CenterPrint2 (self, status, "Action:                            \nêìë Put Ammo into Sentry Gun    \nêîë Upgrade Sentry Gun          \nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
	else
	{
		CenterPrint2 (self, status, "Action:                            \nêìë Put Ammo into Sentry Gun    \n\nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
};

void (string status) Menu_EngineerFix_SentryGun_Rotate = {
	CenterPrint2 (self, status, "Rotate sentry gun:\n\nêìë 45 degrees left     \nêîë 180 degrees         \nêïë 45 degrees right    \n\nêñë Dismantle Sentry Gun\nêóë Nothing             \n");
    if (!self.building.real_owner.has_sentry || self.building.real_owner != self
                || self.classname != "player" || self.building == world)
        return;
};



void (float inp) Menu_EngineerFix_SentryGun_Input =
{
	if (autospanner) {
		Menu_EngineerFix_SentryGun_Rotate_Input (inp);
		return;
	}
		 
	local float am;
	local float metalcost;
	local string st;

	if ((self.building.real_owner.has_sentry == 0))
	{
		return;
	}
	if (((self.classname != "player") || (self.building == world)))
	{
		return;
	}
	if ((inp == 1))
	{
		am = (20 * 2);
		if ((am > self.ammo_shells))
		{
			am = self.ammo_shells;
		}
		if ((am > (self.building.maxammo_shells - self.building.ammo_shells)))
		{
			am = (self.building.maxammo_shells - self.building.ammo_shells);
		}
		if (!practice)
		{
			self.ammo_shells = (self.ammo_shells - am);
		}
		self.building.ammo_shells = (self.building.ammo_shells + am);
		if ((self.building.weapon == 3))
		{
			am = (enter * 2);
			if ((am > self.ammo_rockets))
			{
				am = self.ammo_rockets;
			}
			if ((am > (self.building.maxammo_rockets - self.building.ammo_rockets)))
			{
				am = (self.building.maxammo_rockets - self.building.ammo_rockets);
			}
			if (!practice)
			{
				self.ammo_rockets = (self.ammo_rockets - am);
			}
			self.building.ammo_rockets = (self.building.ammo_rockets + am);
		}
	}
	else
	{
		if ((((self.building.weapon < 3) && (inp == 2)) && (self.ammo_cells >= 130)))
		{
			if (!practice)
			{
				self.ammo_cells = (self.ammo_cells - 130);
			}
//			self.building.weapon = (self.building.weapon + 1);
			if (!sglvl2to3){
				self.building.weapon = (self.building.weapon + 1);
			} else {
				self.building.weapon = (self.building.weapon + 2);
			}
if (!sglvl2to3) {
			if (sgtype) {
				self.building.max_health = floor ((self.building.max_health * 1.25));
			} else {
				self.building.max_health = floor ((self.building.max_health * 1.2));
			}


			self.building.maxammo_shells = (self.building.maxammo_shells * 1.2);
} else {
			if (sgtype) {
				self.building.max_health = floor ((self.building.max_health * 1.25));
				self.building.max_health = floor ((self.building.max_health * 1.25));
			} else {
				self.building.max_health = floor ((self.building.max_health * 1.2));
				self.building.max_health = floor ((self.building.max_health * 1.2));
			}

			self.building.maxammo_shells = (self.building.maxammo_shells * 1.2);
			self.building.maxammo_shells = (self.building.maxammo_shells * 1.2);
}

			self.building.health = self.building.max_health;

			if ((self.building.weapon == 2) && !sglvl2to3)
			{
				sound (self.building, 3, "weapons/turrset.wav", 1, 1);
				if (sgtype)
				{
					self.building.think = lvl2_sentry_stand;
				}
				else
				{
					self.building.think = lvl2_oldsentry_stand;
				}
				self.building.skin = 1;
			}
			else
			{
				sound (self.building, 3, "weapons/turrset.wav", 1, 1);
				if (sgtype)
				{
					self.building.think = lvl3_sentry_stand;
				}
				else
				{
					self.building.think = lvl3_oldsentry_stand;
				}
				self.building.skin = 2;
			}
			sprint (self, 2, "You upgrade the Sentry Gun to level ");
			st = ftos (self.building.weapon);
			sprint (self, 2, st);
			sprint (self, 2, "\n");
		}
		else
		{
			if ((inp == 3))
			{
				metalcost = ((self.building.max_health - self.building.health) / 5);
				if ((metalcost > self.ammo_cells))
				{
					metalcost = self.ammo_cells;
				}
				if (!practice)
				{
					self.ammo_cells = (self.ammo_cells - metalcost);
				}
				self.building.health = (self.building.health + (metalcost * 5));
			}
			else
			{
				if ((inp == 4))
				{
					sprint (self, 2, "You dismantle the Sentry Gun.\n");
					if (!practice)
					{
						self.ammo_cells = (self.ammo_cells + (130 / 2));
					}
					if ((self.building.real_owner != self))
					{
						sprint2 (self.building.real_owner, 2, self.netname, " dismantled your Sentry Gun.\n");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, " dismantled ");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.building.real_owner.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, "'s Sentry Gun.\n");
					}
					dremove (self.building.trigger_field);
					dremove (self.building);
					self.building.real_owner.has_sentry = 0;
				}
				else
				{
					if ((inp == 6))
					{
						sprint (self, 2, "Rotating 45 degrees to the left...\n");
						self.building.waitmin = anglemod ((self.building.waitmin + minus));
						self.building.waitmax = anglemod ((self.building.waitmax + minus));
					}
				}
			}
		}
	}
	if (((inp >= 1) && (inp <= 6)))
	{
		ResetMenu ();
		self.impulse = 0;
		bound_other_ammo (self);
		if ((self.armorvalue == 0))
		{
			self.armortype = 0;
			self.armorclass = 0;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void (float inp) Menu_EngineerFix_SentryGun_Rotate_Input = {
    if (inp == 1) {
        sprint(self, 2, "Rotating 45 degrees to the left...\n");
        self.building.waitmin = anglemod(self.building.waitmin + 45);
        self.building.waitmax = anglemod(self.building.waitmax + 45);
    } else if (inp == 2) {
        sprint(self, 2, "Rotating 180 degrees...\n");
        self.building.waitmin = anglemod(self.building.waitmin + 180);
        self.building.waitmax = anglemod(self.building.waitmax + 180);
    } else if (inp == 3) {
        sprint(self, 2, "Rotating 45 degrees to the right...\n");
        self.building.waitmin = anglemod(self.building.waitmin - 45);
        self.building.waitmax = anglemod(self.building.waitmax - 45);
    } else if (inp == 4) {
        sprint (self, 2, "You dismantle the Sentry Gun.\n");
		if (!practice)
		{
			self.ammo_cells = (self.ammo_cells + (130 / 2));
		}
		if ((self.building.real_owner != self))
		{
			sprint2 (self.building.real_owner, 2, self.netname, " dismantled your Sentry Gun.\n");
			teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.netname);
			teamsprint (self.building.real_owner.team_no, self.building.real_owner, " dismantled ");
			teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.building.real_owner.netname);
			teamsprint (self.building.real_owner.team_no, self.building.real_owner, "'s Sentry Gun.\n");
		}
		dremove (self.building.trigger_field);
		dremove (self.building);
		self.building.real_owner.has_sentry = 0;
    }
    if (((inp >= 1) && (inp <= 3)) || (inp == 5))
	{
		ResetMenu ();
		self.impulse = 0;
		bound_other_ammo (self);
		if ((self.armorvalue == 0))
		{
			self.armortype = 0;
			self.armorclass = 0;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void () Menu_Dispenser =
{
	CenterPrint (self, "Use Dispenser:                     \nêìë Withdraw some ammo          \nêîë Withdraw some Armor         \nêïë Nothing                     \n\n");
};

void (float inp) Menu_Dispenser_Input =
{
	local float am;
	local float empty;

	empty = 0;
	if ((inp == 1))
	{
		if (((((self.building.ammo_shells == 0) && (self.building.ammo_nails == 0)) && (self.building.ammo_rockets == 0)) && (self.building.ammo_cells == 0)))
		{
			empty = 1;
		}
		else
		{
			am = (self.maxammo_shells - self.ammo_shells);
			if ((am > self.building.ammo_shells))
			{
				am = self.building.ammo_shells;
			}
			self.building.ammo_shells = (self.building.ammo_shells - am);
			self.ammo_shells = (self.ammo_shells + am);
			am = (self.maxammo_nails - self.ammo_nails);
			if ((am > self.building.ammo_nails))
			{
				am = self.building.ammo_nails;
			}
			self.building.ammo_nails = (self.building.ammo_nails - am);
			self.ammo_nails = (self.ammo_nails + am);
			am = (self.maxammo_rockets - self.ammo_rockets);
			if ((am > self.building.ammo_rockets))
			{
				am = self.building.ammo_rockets;
			}
			self.building.ammo_rockets = (self.building.ammo_rockets - am);
			self.ammo_rockets = (self.ammo_rockets + am);
			am = (self.maxammo_cells - self.ammo_cells);
			if ((am > self.building.ammo_cells))
			{
				am = self.building.ammo_cells;
			}
			self.building.ammo_cells = (self.building.ammo_cells - am);
			self.ammo_cells = (self.ammo_cells + am);
		}
	}
	else
	{
		if ((inp == 2))
		{
			if ((self.building.armorvalue == 0))
			{
				empty = 1;
			}
			else
			{
				am = (self.maxarmor - self.armorvalue);
				if ((am > self.building.armorvalue))
				{
					am = self.building.armorvalue;
				}
				if ((self.armortype == 0))
				{
					self.armortype = 0.3;
					self.items = (self.items | 8192);
				}
				self.building.armorvalue = (self.building.armorvalue - am);
				self.armorvalue = (self.armorvalue + am);
			}
		}
	}
	if (((inp >= 1) && (inp <= 3)))
	{
		if (empty)
		{
			sprint (self, 2, "The dispenser is empty.\n");
		}
		ResetMenu ();
		self.impulse = 0;
		self.building = world;
		self.building_wait = (time + 0.5);
		bound_other_ammo (self);
		if ((self.armorvalue == 0))
		{
			self.armortype = 0;
			self.armorclass = 0;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};




// Menu_Admin

void () Menu_Admin =
{
	local string s_menu1;
	local string s_menu2;
	local string s_menu3;
	local string s_menu4;
	local string s_menu5;
	local string s_menu6;
	local string s_menu7;
	local string s_menu8;
	local string s_menu9;

	local entity te;
	local entity temp;

	local float f_tmp;
	local float f_tmp2;

	self.impulse = 0;


	if (self.current_menu_type == 0) {
		s_menu1 =		  "HueTF Admin Menu:                \n\n";
		if (self.current_menu_page == 1) {
			s_menu1 = strcat(s_menu1, "ê1ë Clan Mode                    \n");
			s_menu1 = strcat(s_menu1, "ê2ë Timelimit                    \n");
			s_menu1 = strcat(s_menu1, "ê3ë Kick                         \n");
			s_menu1 = strcat(s_menu1, "ê4ë Ban                          \n");
			s_menu1 = strcat(s_menu1, "ê5ë Captain                      \n");
			s_menu1 = strcat(s_menu1, "ê6ë Randomize Teams              \n");
			s_menu1 = strcat(s_menu1, "ê7ë Restart current map          \n");
		} else if (self.current_menu_page == 2) {
			s_menu1 = strcat(s_menu1, "ê1ë                              \n");
			s_menu1 = strcat(s_menu1, "ê2ë                              \n");
			s_menu1 = strcat(s_menu1, "ê3ë                              \n");
			s_menu1 = strcat(s_menu1, "ê4ë                              \n");
			s_menu1 = strcat(s_menu1, "ê5ë                              \n");
			s_menu1 = strcat(s_menu1, "ê6ë                              \n");
			s_menu1 = strcat(s_menu1, "ê7ë                              \n");
		}
		s_menu1 = strcat(s_menu1, "\n\n");
		s_menu1 = strcat(s_menu1, "ê8ë Previous Page                \n");
		s_menu1 = strcat(s_menu1, "ê9ë Next Page                    \n");
		s_menu1 = strcat(s_menu1, "ê0ë Exit Menu                    \n");

		centerprint (self, s_menu1);
	}

// 1 = kick selection menu
// 2 = ban selection menu
// 3 = team 1's captain select menu
// 4 = team 2's captain select menu
// 5 = captain player selection menu

	if (self.current_menu_type == 1 || self.current_menu_type == 2 || self.current_menu_type == 3 || self.current_menu_type == 4 || self.current_menu_type == 5) {
		if (self.current_menu_type == 1) {
			s_menu1 = "HueTf Admin Kick Menu:              \n\n";
		} else if (self.current_menu_type == 2) {
			s_menu1 = "HueTf Admin Ban Menu:              \n\n";
		} else if (self.current_menu_type == 3) {
			s_menu1 = "HueTf Captain Team 1 Select Menu:              \n\n";
		} else if (self.current_menu_type == 4) {
			s_menu1 = "HueTf Captain Team 2 Select Menu:              \n\n";
		} else if (self.current_menu_type == 5) {
			s_menu1 = strcat("HueTf \[\sCaptain\s\] Team ", ftos(self.team_no));
			s_menu1 = strcat(s_menu1, " :              \n\n");
		}

		f_tmp = 0;
		f_tmp2 = 0;
		s_menu2 = "\sPage\s ";
		s_menu2 = strcat (s_menu2, ftos(self.current_menu_page));
		s_menu2 = strcat (s_menu2, " \bPlayers:\b                      \n");
		s_menu2 = Menu_Indent_line(s_menu2, 30);

		te = find (world, classname, "player");
		while (te != world) {
			if ( (f_tmp < (self.current_menu_page * 7) ) && ( f_tmp >= ((self.current_menu_page - 1) * 7) ) && ( ( ( self.current_menu_type == 5 || self.current_menu_type == 4 )  && !te.captain) || (self.current_menu_type != 5 && self.current_menu_type != 4) ) )  {
				f_tmp2 = f_tmp2 + 1;
				f_tmp = f_tmp + 1;
				s_menu2 = strcat( s_menu2, "\s[\s" );
				s_menu2 = strcat( s_menu2, ftos(f_tmp2));
				s_menu2 = strcat( s_menu2, "\s]\s " );				
				if (strlen(te.netname) <= 26) {
					s_menu2 = strcat( s_menu2, te.netname );					
				} 
				else {
					s_menu2 = strcat( s_menu2, substr(te.netname,0,25));
				}
				s_menu2 = Menu_Indent_line(s_menu2, 30);
			}

			if (( f_tmp < (self.current_menu_page - 1) * 7) &&  ( ( ( self.current_menu_type == 5 || self.current_menu_type == 4 )  && !te.captain) || ( self.current_menu_type != 5 && self.current_menu_type != 4 ) ) ) {
				f_tmp = f_tmp + 1;
			}

			te = find (te, classname, "player");
		}

if (self.current_menu_type != 3 && self.current_menu_type != 4 && self.current_menu_type != 5 ) {
		te = find (world, classname, "observer");
		while (te != world) {
			if ( (f_tmp <= (self.current_menu_page * 7) ) && (f_tmp > (self.current_menu_page - 1) * 7) && te.netname != "")  {
				f_tmp2 = f_tmp2 + 1;
				s_menu2 = strcat( s_menu2, "\s[\s" );
				s_menu2 = strcat( s_menu2, ftos(f_tmp2));
				s_menu2 = strcat( s_menu2, "\s]\s " );
				s_menu2 = strcat( s_menu2, te.netname );
				if (strlen(te.netname) <= 26) {
					s_menu2 = strcat( s_menu2, te.netname );					
				} 
				else {
					s_menu2 = strcat( s_menu2, substr(te.netname,0,25));
				}
				s_menu2 = Menu_Indent_line(s_menu2, 30);
			}
			f_tmp = f_tmp + 1;
			te = find (te, classname, "observer");
		}
}

if (f_tmp == 0 &&  ( self.current_menu_type == 5 || self.current_menu_type == 4 ) ) {
        bprint(2, "\[\sCaptain Mode\s\]\s:\s \sDone! No player remaining. Let's start the game!\s.\n");
		temp = self;
		te = find (world, classname, "player");
		while (te != world) {
				te.captain = 0;
				self = te;
				ResetMenu();
			te = find (te, classname, "player");
		}
		self = temp;
		captainmode = 0;
		return;
}
		s_menu2 = strcat( s_menu2, "\n");
		s_menu7 = "\b[\b8\b]\b \bPrevious Page\b         ";
		s_menu7 = Menu_Indent_line(s_menu7, 30);
		s_menu8 = "\b[\b9\b]\b \bNext Page\b             ";
		s_menu8 = Menu_Indent_line(s_menu8, 30);
if (self.is_admin || self.captain == 1) {
		s_menu9 = "\b[\b0\b]\b \bBack to Main Menu\b     ";
		s_menu9 = Menu_Indent_line(s_menu9, 30);
} else {
		s_menu9 = "\n";
}
if ((self.is_admin || self.captain == 1) && captainmode) {
		s_menu9 = strcat(s_menu9, "Option 0 results in canceling captain mode.\n");
}

		s_menu1 = strcat(s_menu1, s_menu2);
		s_menu1 = strcat(s_menu1, s_menu7);
		s_menu1 = strcat(s_menu1, s_menu8);
		s_menu1 = strcat(s_menu1, s_menu9);


		centerprint (self, s_menu1);
	}



};

void (float inp) Menu_Admin_Input =
{
	local entity temp;
	local entity te;
	local string s_temp;
        local float f_tmp;

// Actions for AdminMenu Page 0
if (self.current_menu_type == 0 && self.current_menu_page == 1) {

//
// clanmode
//

	if (inp == 1) {
		localcmd("clan\n");
		ResetMenu ();
	}

//
// timelimit
//
	if (inp == 2) {
		if (stof(infokey (world, "timelimit")) > 35) {
			s_temp = "5";
		} else {
			s_temp = ftos(timelimit/60 + 5);
		}

		localcmd ("timelimit ");
		localcmd(s_temp);
		localcmd("\n");

		bprint ( 2, self.netname);
		bprint ( 2, " sets ");
		bprint ( 2, "\stimelimit\s to: ");
		bprint ( 2, s_temp);
		bprint ( 2, "\n");
	}

//
// kick
//

	if (inp == 3) {
		self.current_menu_type = 1;
		self.current_menu_page = 1;
	}

//
// ban
//

	if (inp == 4) {
		self.current_menu_type = 2;
		self.current_menu_page = 1;
	}

//
// Restart current map
//

	if (inp == 7) {

		bprint(2, self.netname);
		bprint(2, " Has restarted the map.\n");

		localcmd ("map ");
		localcmd (mapname);
		localcmd ("\n");
	}

//
// Randomize Teams
//

	if (inp == 6) {

		randomizeTeams();



	}


//
// Captain
//

	if (inp == 5) {
		if (!captainmode) {
			captainmode = 1;
			self.current_menu_type = 3;
			self.current_menu_page = 1;

			bprint(2, "\[\sCaptain Mode\s\]\s:\s is now \sON\s.\n");
			bprint(2, "\[\sCaptain Mode\s\]\s:\s ONLY CAPTAINS CAN TALK! YOU ARE ALL \sMUTED\s.\n");
			bprint(2, "\[\sCaptain Mode\s\]\s:\s ONLY CAPTAINS CAN TALK! YOU ARE ALL \sMUTED\s.\n");
			bprint(2, "\[\sCaptain Mode\s\]\s:\s ONLY CAPTAINS CAN TALK! YOU ARE ALL \sMUTED\s.\n");

			temp = find (world, classname, "player");
			while (temp != world) {
				temp.captain = 0;
				temp = find (temp, classname, "player");
			}

		} else {  // end captainmode1
			disableCaptain();
		}

	}

// Actions for AdminMenu Page 1
} else if (self.current_menu_type == 0 && self.current_menu_page == 2) {
	if (inp == 1) {
		sprint(self, 2, "AdminMenu Page 2 Action 1\n");
	}
	else if (inp == 2) {
		sprint(self, 2, "AdminMenu Page 2 Action 2\n");
	}
	else if (inp == 3) {
		sprint(self, 2, "AdminMenu Page 2 Action 3\n");
	}
	else if (inp == 4) {
		sprint(self, 2, "AdminMenu Page 2 Action 4\n");
	}
	else if (inp == 5) {
		sprint(self, 2, "AdminMenu Page 2 Action 5\n");
	}
	else if (inp == 6) {
		sprint(self, 2, "AdminMenu Page 2 Action 6\n");
	}
	else if (inp == 7) {
		sprint(self, 2, "AdminMenu Page 2 Action 7\n");
	}


} else if ((self.current_menu_type == 1 || self.current_menu_type == 2 ) && inp >= 1 && inp <= 7) { // Kick / Ban Actions
	f_tmp = 1;
	self.admin_use = find (world, classname, "player");
	while (self.admin_use != world)  {
		if (f_tmp < ((self.current_menu_page - 1) * 7) + inp ) {
			f_tmp = f_tmp + 1;
			self.admin_use = find (self.admin_use, classname, "player");
		} else {
			break;
		}
	}
	if (f_tmp < ((self.current_menu_page - 1) * 7) + inp) {
		self.admin_use = find (world, classname, "observer");
		while (self.admin_use != world)  {
			if (f_tmp < ((self.current_menu_page - 1) * 7) + inp && self.admin_use.netname != "") {
				f_tmp = f_tmp + 1;
			} else {
				break;
			}
			self.admin_use = find (self.admin_use, classname, "observer");
		}
	}

	if (self.admin_use && f_tmp == ((self.current_menu_page - 1) * 7) + inp) {
		self.admin_use.ip = infokey (self.admin_use, "ip");
		if (self.current_menu_type == 2) {
			localcmd("addip ");
			localcmd(self.admin_use.ip);
			localcmd("\n");
		}
		Admin_DoKick ();
	}

} else if ((self.current_menu_type == 3 || self.current_menu_type == 4 || self.current_menu_type == 5) && inp >= 1 && inp <= 7) { // Captain Actions
	f_tmp = 1;
	self.admin_use = find (world, classname, "player");
	while (self.admin_use != world)  {
		if ( (f_tmp < ((self.current_menu_page - 1) * 7) + inp ) && ( ( (self.current_menu_type == 5 || self.current_menu_type == 4) && !self.admin_use.captain) || (self.current_menu_type != 5 && self.current_menu_type != 4) ) ) {
			f_tmp = f_tmp + 1;
		} else if ( (f_tmp == ((self.current_menu_page - 1) * 7) + inp) && ( ( (self.current_menu_type == 5 || self.current_menu_type == 4) && !self.admin_use.captain) || (self.current_menu_type != 5 && self.current_menu_type != 4) ) ) {
			break;
		}
		self.admin_use = find (self.admin_use, classname, "player");

	}


if (self.current_menu_type != 5) {
	if (self.admin_use != world && f_tmp == ((self.current_menu_page - 1) * 7) + inp) {
		temp = self;
		self = self.admin_use;
		self.captain = 9;
		if (temp.current_menu_type == 3) {
// Captain for Team 1
			self.team_no = 1;
			temp.current_menu_type = 4;
		} else if (temp.current_menu_type == 4) {
// Captain for Team 2
			self.team_no = 2;

			randomizeCaptains();

			local entity te;
			te = find (world, classname, "player");
			while (te != world)
			{
				self = te;
				if (!self.captain)
				{
					self.playerclass = 0;
					playerSetTeam (-1);
					self.current_menu = 0;
					self.impulse = 0;
				} else if (self.captain > 0 && self.captain < 5) {
					//TeamFortress_TeamSet(self.team_no);
					self.playerclass = 0;
					playerSetTeam(self.team_no);
					bprint(2, "\[\sCaptain Mode\s\]\s:\s ");
					bprint(2, self.netname);
					bprint(2, " \bIs the captain for team\b ");
					bprint(2, Status_TeamNumToTeamString(self.team_no));
					bprint(2, "\b.\b\n");
				}
				te = find (te, classname, "player");
			}
			self = temp;
			bprint(2, "\[\sCaptain Mode\s\]\s:\s EVERYBODY OBSERVER!!!\n");
			ResetMenu ();
		}
		self = temp;
	}
} else {
	if (self.admin_use && f_tmp == ((self.current_menu_page - 1) * 7) + inp && self.captain == 1) {
			temp = self;
			self = self.admin_use;
			self.captain = 10;

			playerSetTeam (temp.team_no);

			bprint(2, "\[\bCaptain Mode\b\]\b:\b ");
			bprint(2, temp.netname);
			bprint(2, " \bcalled\b ");
			bprint(2, self.netname);
			bprint(2, " \bfor team\b ");
			bprint(2, Status_TeamNumToTeamString(self.team_no));
			bprint(2, "\b.\b\n");
			self = temp;

			nextCaptain();
			ResetMenu();
		}
	}

}



	if ((inp == 8)) {
		if (self.current_menu_page > 1) {
			self.current_menu_page = self.current_menu_page - 1;
		}
	}

	if ((inp == 9)) {
		if (self.current_menu_page < 5) {
			self.current_menu_page = self.current_menu_page + 1;
		}
	}


	if ((inp == 10)) {

		if (self.current_menu_type == 4 || self.current_menu_type == 5 ||  self.current_menu_type == 3) {
			captainmode = 0;
			bprint(2, "\[\sCaptain Mode\s\]\s:\s \scanceled by request of\s ");
			bprint(2, self.netname);
			bprint(2, ".\n");


		te = self;
                temp = find (world, classname, "player");
                while (temp != world) {
			self = temp;
                        temp.captain = 0;
			ResetMenu();
                        temp = find (temp, classname, "player");
                }
		self = te;




		}

		if (self.current_menu_type == 0)
			ResetMenu ();
		else if (self.is_admin) {
			self.current_menu_type = 0;
			self.current_menu_page = 0;
		}
	}

self.impulse = 0;
};


