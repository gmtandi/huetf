//=-=-=-=-=
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

float () CheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	targ = self.enemy;
	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	traceline (spot1, spot2, RANGE_MELEE, self);
	if ((trace_ent != targ))
	{
		return (RANGE_MELEE);
	}
	if ((trace_inopen && trace_inwater))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_MELEE))
	{
		if (self.th_melee)
		{
			self.th_melee ();
			return (AS_STRAIGHT);
		}
	}
	if (!self.th_missile)
	{
		return (RANGE_MELEE);
	}
	if ((time < self.attack_finished))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_FAR))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_MELEE))
	{
		chance = 0.9;
		self.attack_finished = RANGE_MELEE;
	}
	else
	{
		if ((enemy_range == RANGE_NEAR))
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
			if ((enemy_range == RANGE_MID))
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
				chance = RANGE_MELEE;
			}
		}
	}
	if ((random () < chance))
	{
		self.th_missile ();
		SUB_AttackFinished ((AS_SLIDING * random ()));
		return (AS_STRAIGHT);
	}
	return (RANGE_MELEE);
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
	ldmg = (((random () + random ()) + random ()) * AS_MELEE);
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
	ldmg = (((random () + random ()) + random ()) * AS_MELEE);
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
	while ((v < RANGE_MELEE))
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
		return (RANGE_MELEE);
	}
	if ((r < 500))
	{
		return (AS_STRAIGHT);
	}
	if ((r < 1000))
	{
		return (AS_SLIDING);
	}
	return (AS_MELEE);
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
		return (RANGE_MELEE);
	}
	if ((trace_fraction == AS_STRAIGHT))
	{
		return (AS_STRAIGHT);
	}
	return (RANGE_MELEE);
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
	return (RANGE_MELEE);
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

	if (((sight_entity_time >= (time - 0.1)) && !(self.spawnflags & AS_MELEE)))
	{
		client = sight_entity;
		if ((client.enemy == self.enemy))
		{
			return (RANGE_MELEE);
		}
	}
	else
	{
		client = checkclient ();
		if (!client)
		{
			return (RANGE_MELEE);
		}
	}
	if (tfstrike)
	{
		if (round_over)
		{
			return (RANGE_MELEE);
		}
		if ((client.team_no != AS_STRAIGHT))
		{
			return (RANGE_MELEE);
		}
		if (self.tfstate)
		{
			return (RANGE_MELEE);
		}
	}
	if ((client == self.enemy))
	{
		return (RANGE_MELEE);
	}
	if ((client.flags & 128))
	{
		return (RANGE_MELEE);
	}
	if ((client.items & WEAP_RAILGUN))
	{
		return (RANGE_MELEE);
	}
	r = range (client);
	if ((r == RANGE_FAR))
	{
		return (RANGE_MELEE);
	}
	if (!visible (client))
	{
		return (RANGE_MELEE);
	}
	if ((r == RANGE_NEAR))
	{
		if (((client.show_hostile < time) && !infront (client)))
		{
			return (RANGE_MELEE);
		}
	}
	else
	{
		if ((r == RANGE_MID))
		{
			if (!infront (client))
			{
				return (RANGE_MELEE);
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
			return (RANGE_MELEE);
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
	newdir_y = (RANGE_MELEE - trace_plane_normal_x);
	newdir_z = RANGE_MELEE;
	if (((dir * newdir) > RANGE_MELEE))
	{
		dir_x = (RANGE_MELEE - trace_plane_normal_y);
		dir_y = trace_plane_normal_x;
	}
	else
	{
		dir_x = trace_plane_normal_y;
		dir_y = (RANGE_MELEE - trace_plane_normal_x);
	}
	dir_z = RANGE_MELEE;
	self.ideal_yaw = vectoyaw (dir);
};

float () FacingIdeal =
{
	local float delta;

	delta = anglemod ((self.angles_y - self.ideal_yaw));
	if (((delta > 45) && (delta < 315)))
	{
		return (RANGE_MELEE);
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
	if ((self.enemy.health <= RANGE_MELEE))
	{
		self.enemy = world;
		if ((self.oldenemy.health > RANGE_MELEE))
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
	if ((self.attack_state == AS_MISSILE))
	{
		ai_run_missile ();
		return;
	}
	if ((self.attack_state == AS_MELEE))
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
	self.StatusRefreshTime = (time + 1.5);
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
				WriteSpace (AS_MISSILE);
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
					x = RANGE_MELEE;
					if ((te.health > RANGE_MELEE))
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
								x = AS_MISSILE;
							}
							else
							{
								if ((te.team_no == AS_MELEE))
								{

									WriteStr ("Yellow ");
									x = 7;
								}
								else
								{
									if ((te.team_no == AS_MISSILE))
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
								if ((te.playerclass == AS_MELEE))
								{
									WriteStr ("Soldier");
									x = (x + 7);
								}
								else
								{
									if ((te.playerclass == AS_MISSILE))
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
													x = (x + AS_MISSILE);
												}
												else
												{
													if ((te.playerclass == 8))
													{
														WriteStr ("Spy");
														x = (x + AS_MELEE);
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
			else
			{
				if ((self.playerclass == AS_MISSILE))
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
								x = RANGE_MELEE;
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
										x = AS_MISSILE;
									}
									else
									{
										if ((self.undercover_team == AS_MELEE))
										{
											WriteStr ("Yellow ");
											x = 7;
										}
										else
										{
											if ((self.undercover_team == AS_MISSILE))
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
										if ((self.undercover_skin == AS_MELEE))
										{
											WriteStr ("Soldier");
											x = (x + 7);
										}
										else
										{
											if ((self.undercover_skin == AS_MISSILE))
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
															x = (x + AS_MISSILE);
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
							x = RANGE_MELEE;
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
									if (((te.ammo_rockets == RANGE_MELEE) && (te.ammo_shells == RANGE_MELEE)))
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
											if ((!te.ammo_rockets && (te.weapon == AS_MELEE)))
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
									x = (x + AS_MISSILE);
									if ((te.weapon == AS_MELEE))
									{
										WriteByte (1, slash);
										WriteIntXX (te.ammo_rockets, COLOR_WHITE);
										x = (x + AS_MELEE);
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
							if (((x >= RANGE_MELEE) && (x < 35)))
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
		WriteStr(" \r\n Testando :)");
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
				else
				{
					if ((self.current_weapon == 8192))
					{
						if (((AS_MISSILE - self.reload_rocket_launcher) > self.ammo_rockets))
						{
							self.reload_rocket_launcher = (AS_MISSILE - self.ammo_rockets);
						}
						num = (AS_MISSILE - self.reload_rocket_launcher);
					}
					else
					{
						num = -1;
					}
				}
			}
		}
		if ((num >= RANGE_MELEE))
		{
			WriteStr("CLIP:"); //W7C (space, space, (_C | 128), (_L | 128), (_I | 128), (_P | 128), (dperiod | 128));
			WriteIntXX (num, COLOR_WHITE);
		}
		else
		{
			WriteSpace (9);
		}
	}
        WriteStr(" G1:");//W4C (space, (_G | 128), (_1 | 128), dperiod);
	WriteIntXX (self.no_grenades_1, COLOR_WHITE);
	WriteStr(" G2:");//W4C (space, (_G | 128), (_2 | 128), dperiod);
	WriteIntXX (self.no_grenades_2, COLOR_WHITE);
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
		while ((i > RANGE_MELEE))
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

	if ((f >= RANGE_MELEE))
	{
		WriteIntXXXX (f, COLOR_WHITE);
		return;
	}
	f = (RANGE_MELEE - f);
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
	WriteByte (1, RANGE_MELEE);
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
	if ((f == AS_MELEE))
	{
		return (SBAR_300);
	}
	if ((f == AS_MISSILE))
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
	self.last_impulse = RANGE_MELEE;
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
						if ((res == AS_MISSILE))
						{
							sprint (self, 2, "Status Bar Res set to 320x350.\n");
						}
						else
						{
							if ((res == AS_MELEE))
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

void (entity pl, string s1) CenterPrint =
{
	centerprint (pl, s1);
	pl.StatusRefreshTime = (time + 1.5);
};

void (entity pl, string s1, string s2) CenterPrint2 =
{
	centerprint (pl, s1, s2);
	pl.StatusRefreshTime = (time + 1.5);
};

void (entity pl, string s1, string s2, string s3) CenterPrint3 =
{
	centerprint (pl, s1, s2, s3);
	pl.StatusRefreshTime = (time + 1.5);
};

string (float type) Status_GrenTypeToString =
{
	if ((type == 2))
	{
		return ("Concussion grenade");
	}
	if ((type == AS_MELEE))
	{
		return ("Nail grenade");
	}
	if ((type == AS_MISSILE))
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
	if ((tm == AS_MELEE))
	{
		return ("yellow");
	}
	if ((tm == AS_MISSILE))
	{
		return ("green");
	}
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
void (float inp) Menu_Engineer_Input;
void (float inp) Menu_EngineerFix_Dispenser_Input;
void (float inp) Menu_EngineerFix_SentryGun_Input;
void () Menu_Dispenser;
void (float inp) Menu_Dispenser_Input;

void () ResetMenu =
{
	if ((self.StatusBarSize == RANGE_MELEE))
	{
		CenterPrint (self, "\n");
	}
	else
	{
		self.StatusRefreshTime = (time + 0.1);
	}
	self.menu_count = 25;
	self.current_menu = 1;
};

void () Player_Menu =
{
	if ((self.menu_count > 25))
	{
		self.menu_count = RANGE_MELEE;
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
				if ((self.current_menu == AS_MISSILE))
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
													if ((self.current_menu == 20))
													{
														Menu_Class ();
													}
													else
													{
														if ((self.current_menu == 2))
														{
															Menu_Team ();
														}
														else
														{
															if (((self.team_no == RANGE_MELEE) && teamplay))
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
																if ((self.playerclass == RANGE_MELEE))
																{
																	if (round_active)
																	{
																		return;
																	}
																	if (TeamFortress_TeamIsCivilian (self.team_no))
																	{
																		PutClientInServer ();
																		return;
																	}
																	self.current_menu = AS_MELEE;
																	Menu_Class ();
																}
																else
																{
																	self.current_menu = RANGE_MELEE;
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
	self.current_menu = menu_no;
	if ((menu_no == 2))
	{
		Menu_Team ();
	}
	else
	{
		if ((menu_no == AS_MELEE))
		{
			Menu_Class ();
		}
	}
};

void () Menu_Team =
{
	if (((toggleflags & 64) && teamplay))
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
	if ((inp == 6))
	{
		TeamFortress_TeamSet (-1);
		self.current_menu = RANGE_MELEE;
		Menu_StuffClassHelp ();
		Menu_ClassHelp ();
		self.impulse = RANGE_MELEE;
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
			if (((inp <= number_of_teams) && (inp > RANGE_MELEE)))
			{
				TeamFortress_TeamSet (inp);
			}
			else
			{
				if (((number_of_teams == RANGE_MELEE) && (inp <= AS_MISSILE)))
				{
					TeamFortress_TeamSet (inp);
				}
			}
		}
	}
	ResetMenu ();
	self.impulse = RANGE_MELEE;
};

void () Menu_Class =
{
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
				if ((self.team_no == AS_MELEE))
				{
					if ((AD.noise3 != string_null))
					{
						CenterPrint (self, AD.noise3);
						return;
					}
				}
				else
				{
					if ((self.team_no == AS_MISSILE))
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
	self.menu_displaytime = RANGE_MELEE;
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
	if (((inp > RANGE_MELEE) && (inp < 5)))
	{
		TeamFortress_DropAmmo (inp);
	}
	if (((inp > RANGE_MELEE) && (inp < 6)))
	{
		ResetMenu ();
	}
	self.impulse = RANGE_MELEE;
};

void (float inp) Menu_Input =
{
	if ((self.current_menu == 2))
	{
		Menu_Team_Input (inp);
	}
	else
	{
		if (((self.current_menu == AS_MELEE) || (self.current_menu == 20)))
		{
			Menu_Class_Input (inp);
		}
		else
		{
			if ((self.current_menu == AS_MISSILE))
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
		centerprint (self, st1, "\n", st2);
	}
	else
	{
		CenterPrint (self, "Welcome to Hue Team Fortress 1.45\nùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\nhttp://andi.com.br/\n\nBased on OzTF 1.45\nDecompiled by Andi\nThe Brazilian QWTF Community 2017\n");
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
				if ((self.playerclass == AS_MELEE))
				{
					CenterPrint (self, "”œÃƒ…≈“ Details:             \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Rocket Launcher          \n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == AS_MISSILE))
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
								CenterPrint (self, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:   \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Assault Cannon           \n\nPress ö for alias help\n");
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
				if ((self.playerclass == AS_MELEE))
				{
					CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nNail Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == AS_MISSILE))
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
			if ((self.playerclass == AS_MELEE))
			{
				sprint (self, 2, "”œÃƒ…≈“ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êïë Super Shotgun\n");
				sprint (self, 2, "   êôë Rocket Launcher\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Nail Grenade\n");
				sprint (self, 2, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
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
							sprint (self, 2, "   êôë Assault Cannon\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n");
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
	if (((self.team_no == 2) || (self.team_no == AS_MISSILE)))
	{
		if ((tfvsdm == 1))
		{
			return;
		}
	}
	if ((inp == 8))
	{
		Menu_ClassHelp2 ();
		self.menu_count = 25;
		self.current_menu = 7;
		self.menu_displaytime = RANGE_MELEE;
		self.impulse = RANGE_MELEE;
	}
};

void () Menu_Spy =
{
	if (((self.effects & (8 | AS_MISSILE)) || (self.is_unabletospy == 1)))
	{
		ResetMenu ();
		return;
	}
	if (self.is_feigning)
	{
		if (((self.undercover_team != RANGE_MELEE) && (self.undercover_skin != RANGE_MELEE)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != RANGE_MELEE))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != RANGE_MELEE))
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
		if (((self.undercover_team != RANGE_MELEE) && (self.undercover_skin != RANGE_MELEE)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != RANGE_MELEE))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != RANGE_MELEE))
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
		if ((self.effects & (8 | AS_MISSILE)))
		{
			sprint (self, 2, "You can't go undercover while glowing.\n");
			ResetMenu ();
			self.impulse = RANGE_MELEE;
			return;
		}
		if ((self.is_unabletospy == 1))
		{
			sprint (self, 2, "You can't go undercover right now.\n");
			ResetMenu ();
			self.impulse = RANGE_MELEE;
			return;
		}
	}
	if ((inp == 1))
	{
		Menu_Spy_Skin ();
		self.menu_count = 25;
		self.current_menu = 13;
		self.menu_displaytime = RANGE_MELEE;
		self.impulse = RANGE_MELEE;
	}
	else
	{
		if ((inp == 2))
		{
			Menu_Spy_Color ();
			self.menu_count = 25;
			self.current_menu = 14;
			self.menu_displaytime = RANGE_MELEE;
			self.impulse = RANGE_MELEE;
		}
		else
		{
			if ((inp == AS_MELEE))
			{
				TeamFortress_SpyFeignDeath (RANGE_MELEE);
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			else
			{
				if ((inp == AS_MISSILE))
				{
					Spy_RemoveDisguise (self);
					ResetMenu ();
					self.impulse = RANGE_MELEE;
				}
				else
				{
					if (((inp == 5) && ((self.undercover_team != RANGE_MELEE) || (self.undercover_skin != RANGE_MELEE))))
					{
						ResetMenu ();
						self.impulse = RANGE_MELEE;
					}
				}
			}
		}
	}
};

void () Menu_Spy_Skin =
{
	if (((self.undercover_team == 2) || (self.undercover_team == AS_MISSILE)))
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
	if (((self.undercover_team == 2) || (self.undercover_team == AS_MISSILE)))
	{
		if ((tfvsdm == 1))
		{
			if ((inp == 1))
			{
				TeamFortress_SpyChangeSkin (inp);
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			return;
		}
	}
	if (((inp < enter) && (inp > RANGE_MELEE)))
	{
		TeamFortress_SpyChangeSkin (inp);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
	}
};

void () Menu_Spy_Color =
{
	if ((number_of_teams == RANGE_MELEE))
	{
		sprint (self, 2, "No Color changing allowed in deathmatch.\n");
		ResetMenu ();
		self.impulse = RANGE_MELEE;
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
			if ((self.undercover_skin != RANGE_MELEE))
			{
				if (((inp == 2) || (inp == AS_MISSILE)))
				{
					CenterPrint (self, "ûûû Cannot change Color, You must Reset your Skin. ûûû\n");
					return;
				}
			}
		}
		TeamFortress_SpyChangeColor (inp);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
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
	centerprint (self, s_action, s_disp, s_sentry, s_nothing);
};

void (float inp) Menu_Engineer_Input =
{
	local entity te;

	if ((((inp == 1) && (self.ammo_cells >= _d)) && (self.has_dispenser != 1)))
	{
		TeamFortress_Build (1);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
	}
	else
	{
		if ((((inp == 2) && (self.ammo_cells >= 130)) && (self.has_sentry != 1)))
		{
			TeamFortress_Build (2);
			ResetMenu ();
			self.impulse = RANGE_MELEE;
		}
		else
		{
			if (((inp == 7) && (self.has_dispenser == 1)))
			{
				DestroyBuilding (self, "building_dispenser");
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			else
			{
				if (((inp == 8) && (self.has_sentry == 1)))
				{
					DestroyBuilding (self, "building_sentrygun");
					ResetMenu ();
					self.impulse = RANGE_MELEE;
				}
				else
				{
					if ((inp == 5))
					{
						ResetMenu ();
						self.impulse = RANGE_MELEE;
					}
				}
			}
		}
	}
};

void () Menu_EngineerFix_Dispenser =
{
	CenterPrint (self, "Action:                            \nêìë Put Ammo into Dispenser     \nêîë Put Armor into Dispenser    \nêïë Repair Dispenser            \nêñë Dismantle Dispenser         \nêóë Nothing                     \n\n");
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
			if ((inp == AS_MELEE))
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
				if ((inp == AS_MISSILE))
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
					self.building.real_owner.has_dispenser = RANGE_MELEE;
				}
			}
		}
	}
	if (((inp >= 1) && (inp <= 5)))
	{
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		self.building = world;
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void () Menu_EngineerFix_SentryGun =
{
	if (((self.building.weapon < AS_MELEE) && (self.ammo_cells >= 130)))
	{
		CenterPrint (self, "Action:                            \nêìë Put Ammo into Sentry Gun    \nêîë Upgrade Sentry Gun          \nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
	else
	{
		CenterPrint (self, "Action:                            \nêìë Put Ammo into Sentry Gun    \n\nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
};

void (float inp) Menu_EngineerFix_SentryGun_Input =
{
	local float am;
	local float metalcost;
	local string st;

	if ((self.building.real_owner.has_sentry == RANGE_MELEE))
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
		if ((self.building.weapon == AS_MELEE))
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
		if ((((self.building.weapon < AS_MELEE) && (inp == 2)) && (self.ammo_cells >= 130)))
		{
			if (!practice)
			{
				self.ammo_cells = (self.ammo_cells - 130);
			}
			self.building.weapon = (self.building.weapon + 1);
			if (sgtype)
			{
				self.building.max_health = floor ((self.building.max_health * 1.25));
			}
			else
			{
				self.building.max_health = floor ((self.building.max_health * 1.2));
			}
			self.building.health = self.building.max_health;
			self.building.maxammo_shells = (self.building.maxammo_shells * 1.2);
			if ((self.building.weapon == 2))
			{
				sound (self.building, AS_MELEE, "weapons/turrset.wav", 1, 1);
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
				sound (self.building, AS_MELEE, "weapons/turrset.wav", 1, 1);
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
			if ((inp == AS_MELEE))
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
				if ((inp == AS_MISSILE))
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
					self.building.real_owner.has_sentry = RANGE_MELEE;
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
		self.impulse = RANGE_MELEE;
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
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

	empty = RANGE_MELEE;
	if ((inp == 1))
	{
		if (((((self.building.ammo_shells == RANGE_MELEE) && (self.building.ammo_nails == RANGE_MELEE)) && (self.building.ammo_rockets == RANGE_MELEE)) && (self.building.ammo_cells == RANGE_MELEE)))
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
			if ((self.building.armorvalue == RANGE_MELEE))
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
				if ((self.armortype == RANGE_MELEE))
				{
					self.armortype = 0.3;
					self.items = (self.items | 8192);
				}
				self.building.armorvalue = (self.building.armorvalue - am);
				self.armorvalue = (self.armorvalue + am);
			}
		}
	}
	if (((inp >= 1) && (inp <= AS_MELEE)))
	{
		if (empty)
		{
			sprint (self, 2, "The dispenser is empty.\n");
		}
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		self.building = world;
		self.building_wait = (time + 0.5);
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

