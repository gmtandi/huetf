//=-=-=-=-=
void (entity bld) CheckBelowBuilding;
void (entity gunhead) CheckSentry;
void () Sentry_Target;
float () Sentry_FindTarget;
float () OldSentry_FindTarget;
void () OldSentry_FoundTarget;
void () Sentry_HuntTarget;
void () Sentry_Pain;
void () Sentry_Die;
float () Sentry_Fire;
float () OldSentry_Fire;
void () Sentry_MuzzleFlash;

void () ai_face =
{
	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	self.ideal_yaw = anglemod (self.ideal_yaw);
	ChangeYaw ();
};
void () lvl1_sentry_atk3;

void () lvl1_sentry_stand = [ 0, lvl1_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl1_sentry_target = [ 0, lvl1_sentry_target ]
{
	Sentry_Target ();
};

void () lvl1_sentry_atk1 = [ 1, lvl1_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == 0))
		{
			lvl1_sentry_target ();
		}
	}
	else
	{
		lvl1_sentry_stand ();
		return;
	}
};
void () lvl1_sentry_atk2;

void () lvl1_sentry_atk3 = [ 2, lvl1_sentry_atk2 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl1_sentry_atk2 = [ 0, lvl1_sentry_atk1 ]
{
	ai_face ();
};
void () lvl2_sentry_atk2;
void () lvl2_sentry_atk3;

void () lvl2_sentry_stand = [ 3, lvl2_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl2_sentry_target = [ 3, lvl2_sentry_target ]
{
	Sentry_Target ();
};

void () lvl2_sentry_atk1 = [ 4, lvl2_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == 0))
		{
			lvl2_sentry_target ();
		}
	}
	else
	{
		lvl2_sentry_stand ();
		return;
	}
};

void () lvl2_sentry_atk2 = [ 5, lvl2_sentry_atk3 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl2_sentry_atk3 = [ 3, lvl2_sentry_atk1 ]
{
	ai_face ();
	Sentry_Fire ();
};
void () lvl3_sentry_atk2;

void () lvl3_sentry_stand = [ 6, lvl3_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl3_sentry_target = [ 6, lvl3_sentry_target ]
{
	Sentry_Target ();
};

void () lvl3_sentry_atk1 = [ 7, lvl3_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == 0))
		{
			lvl3_sentry_target ();
		}
	}
	else
	{
		lvl3_sentry_stand ();
		return;
	}
};

void () lvl3_sentry_atk2 = [ 8, lvl3_sentry_atk3 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl3_sentry_atk3 = [ 6, lvl3_sentry_atk1 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () Sentry_Target =
{
	if (Sentry_FindTarget ())
	{
		Sentry_HuntTarget ();
	}
};

void () OldSentry_Rotate =
{
	local float ay;
	local entity gunhead;

	self.effects = (self.effects - (self.effects & 8));
	CheckSentry (self);
	if (OldSentry_FindTarget ())
	{
		return;
	}
	if ((self.heat == 0))
	{
		self.ideal_yaw = self.waitmin;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmin)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = 1;
			if ((random () < 0.1))
			{
				sound (self, 3, "weapons/turridle.wav", 1, 1);
			}
		}
	}
	else
	{
		self.ideal_yaw = self.waitmax;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmax)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = 0;
		}
	}
};

float () Target_IsEnemy =
{
	if ((self.enemy != world))
	{
		if (!self.enemy.is_feigning)
		{
			if ((self.enemy.health > 0))
			{
				if (visible (self.enemy))
				{
					if (!self.enemy.has_disconnected)
					{
						return (1);
					}
				}
			}
		}
	}
	return (0);
};
void () lvl1_oldsentry_atk3;

void () lvl1_oldsentry_stand = [ 0, lvl1_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl1_oldsentry_atk1 = [ 1, lvl1_oldsentry_atk3 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl1_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == 0))
		{
			lvl1_oldsentry_atk3 ();
		}
	}
};

void () lvl1_oldsentry_atk2 = [ 2, lvl1_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl1_oldsentry_atk3 = [ 0, lvl1_oldsentry_atk1 ]
{
	ai_face ();
};
void () lvl2_oldsentry_atk2;
void () lvl2_oldsentry_atk3;

void () lvl2_oldsentry_stand = [ 3, lvl2_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl2_oldsentry_atk1 = [ 4, lvl2_oldsentry_atk2 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl2_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == 0))
		{
			lvl2_oldsentry_atk3 ();
		}
	}
};

void () lvl2_oldsentry_atk2 = [ 5, lvl2_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl2_oldsentry_atk3 = [ 3, lvl2_oldsentry_atk1 ]
{
	ai_face ();
	OldSentry_Fire ();
};
void () lvl3_oldsentry_atk3;

void () lvl3_oldsentry_stand = [ 6, lvl3_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl3_oldsentry_atk1 = [ 7, lvl3_oldsentry_atk2 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl3_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == 0))
		{
			lvl3_oldsentry_atk3 ();
		}
	}
};

void () lvl3_oldsentry_atk2 = [ 8, lvl3_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl3_oldsentry_atk3 = [ 6, lvl3_oldsentry_atk1 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () Sentry_Rotate =
{
	local float ay;
	local entity gunhead;
	local string st;

	self.effects = (self.effects - (self.effects & 8));
	CheckSentry (self);
	if (Sentry_FindTarget ())
	{
		self.think = Sentry_HuntTarget;
		self.nextthink = (time + sentry_delay);
		sound (self, 2, "weapons/turrspot.wav", 1, 1);
		return;
	}
	if ((self.heat == 0))
	{
		self.ideal_yaw = self.waitmin;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmin)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = 1;
			if ((random () < 0.1))
			{
				sound (self, 3, "weapons/turridle.wav", 1, 1);
			}
		}
	}
	else
	{
		self.ideal_yaw = self.waitmax;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmax)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = 0;
		}
	}
};

float (entity targ) Sentry_InRange =
{
	local float r;

	r = vlen ((self.origin - targ.origin));
	if (((r <= 1350) && infront (targ)))
	{
		return (1);
	}
	else
	{
		if ((r < 950))
		{
			return (1);
		}
	}
	return (0);
};

float () Sentry_FindTarget =
{
	local entity e;
	local float found;
	local float r;

	if (((self.ammo_shells <= 0) && (self.ammo_rockets <= 0)))
	{
		return (0);
	}
	found = 0;
	r = 0;
	e = find (world, classname, "player");
	if (!e)
	{
		found = -1;
	}
	while ((found == 0))
	{
		if (!e.has_disconnected)
		{
			if ((e != self.real_owner))
			{
				if (!e.is_feigning)
				{
					if (!e.deadflag)
					{
						if (e.takedamage)
						{
							if (!(e.flags & 128))
							{
								if (!(e.items & 524288))
								{
									if (teamplay)
									{
										if (e.team_no)
										{
											if (e.playerclass)
											{
												if ((e.team_no != self.team_no))
												{
													if ((e.undercover_team != self.team_no))
													{
														if ((e.effects & 8))
														{
															if (visible (e))
															{
																if (Sentry_InRange (e))
																{
																	found = 1;
																}
															}
														}
														else
														{
															if (visible (e))
															{
																if (Sentry_InRange (e))
																{
																	found = 1;
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
										if (visible (e))
										{
											if (e.playerclass)
											{
												if (Sentry_InRange (e))
												{
													found = 1;
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
		if ((found != 1))
		{
			e = find (e, classname, "player");
			if (!e)
			{
				found = -1;
			}
		}
	}
	if ((found == 1))
	{
		self.enemy = e;
		return (1);
	}
	else
	{
		return (0);
	}
};

float () OldSentry_FindTarget =
{
	local entity client;
	local float r;
	local float gotone;
	local float loopc;

	r = 0;
	loopc = 0;
	gotone = 0;
	while (((loopc < 12) && (gotone == 0)))
	{
		client = checkclient ();
		gotone = 1;
		if (!client)
		{
			gotone = 0;
		}
		if (((client == self.real_owner) || !client.takedamage))
		{
			gotone = 0;
		}
		if ((client.has_disconnected == 1))
		{
			gotone = 0;
		}
		if (teamplay)
		{
			if (((client.team_no == self.team_no) && (self.team_no != 0)))
			{
				gotone = 0;
			}
			if (((client.undercover_team == self.team_no) && (self.team_no != 0)))
			{
				gotone = 0;
			}
		}
		if (client.is_feigning)
		{
			gotone = 0;
		}
		if (((client.flags & 128) || (client.items & 524288)))
		{
			gotone = 0;
		}
		if (!visible (client))
		{
			gotone = 0;
		}
		r = range (client);
		if ((r == 3))
		{
			gotone = 0;
		}
		else
		{
			if (((r == 2) && !infront (client)))
			{
				gotone = 0;
			}
		}
		loopc = (loopc + 1);
	}
	if (!gotone)
	{
		return (0);
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
	OldSentry_FoundTarget ();
	return (1);
};

void () OldSentry_FoundTarget =
{
	if (((self.ammo_shells > 0) || ((self.ammo_rockets > 0) && (self.weapon == 3))))
	{
		sound (self, 2, "weapons/turrspot.wav", 1, 1);
	}
	Sentry_HuntTarget ();
};

void () Sentry_HuntTarget =
{
	if (!sgtype)
	{
		if ((self.weapon == 1))
		{
			self.think = lvl1_oldsentry_atk1;
		}
		else
		{
			if ((self.weapon == 2))
			{
				self.think = lvl2_oldsentry_atk1;
			}
			else
			{
				self.think = lvl3_oldsentry_atk1;
			}
		}
		self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
		self.nextthink = (time + 0.1);
	}
	else
	{
		if ((self.weapon == 1))
		{
			self.think = lvl1_sentry_atk1;
		}
		else
		{
			if ((self.weapon == 2))
			{
				self.think = lvl2_sentry_atk1;
			}
			else
			{
				self.think = lvl3_sentry_atk1;
			}
		}
		self.nextthink = (time + sentry_speed);
	}
	if ((self.super_damage_finished < time))
	{
		self.super_damage_finished = (time + 0.5);
	}
};

void () Sentry_Pain =
{
	self.real_owner.StatusRefreshTime = (time + 0.2);
};

void () Sentry_Explode =
{
	ThrowGib ("progs/tgib1.mdl", -70);
	ThrowGib ("progs/tgib2.mdl", -70);
	ThrowGib ("progs/tgib3.mdl", -70);
	if ((self.real_owner.has_disconnected != 1))
	{
		deathmsg = 38;
		T_RadiusDamage (self, self.real_owner, (_K + (self.ammo_rockets * 8)), self);
	}
	if ((self.classname == "building_sentrygun_base"))
	{
		if (self.oldenemy)
		{
			dremove (self.oldenemy);
		}
	}
	else
	{
		dremove (self.trigger_field);
	}
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};

void (float damg, vector dir, vector spread) FireSentry =
{
	local vector direction;
	local vector src;

	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	ClearMultiDamage ();
	traceline (src, (src + (dir * 2048)), 0, self);
	puff_org = (trace_endpos - (dir * 4));
	direction = ((dir + ((crandom () * spread_x) * v_right)) + ((crandom () * spread_y) * v_up));
	traceline (src, (src + (direction * 2048)), 0, self);
	if ((trace_fraction != 1))
	{
		if ((self.weapon == 1))
		{
			TraceAttack (damg, direction);
		}
		else
		{
			TraceAttack ((damg * 0.8), direction);
		}
	}
	ApplyMultiDamage ();
};

void () Sentry_Die =
{
	sprint (self.real_owner, 2, "Your sentry gun was destroyed.\n");
	self.real_owner.has_sentry = 0;
	self.think = Sentry_Explode;
	self.nextthink = (time + 0.1);
};

float () OldSentry_Fire =
{
	local vector dir;

	self.effects = (self.effects - (self.effects & 8));
	dir = (self.enemy.origin - self.origin);
	if ((((self.ideal_yaw - anglemod (self.angles_y)) < -10) || ((self.ideal_yaw - anglemod (self.angles_y)) > enter)))
	{
		return (0);
	}
	if ((((self.weapon == 3) && (self.ammo_rockets > 0)) && (self.super_damage_finished < time)))
	{
		Sentry_MuzzleFlash ();
		sound (self, 1, "weapons/rocket1i.wav", 1, 1);
		newmis = spawn ();
		newmis.owner = self;
		newmis.movetype = 9;
		newmis.solid = 2;
		newmis.velocity = (normalize ((self.enemy.origin - self.origin)) * 800);
		newmis.angles = vectoangles (newmis.velocity);
		newmis.weapon = quote;
		newmis.touch = T_MissileTouch;
		newmis.nextthink = (time + 5);
		newmis.think = SUB_Remove;
		setmodel (newmis, "progs/missile.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
		setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
		self.super_damage_finished = (time + 3);
		self.ammo_rockets = (self.ammo_rockets - 1);
		if ((self.ammo_rockets == enter))
		{
			sprint (self.real_owner, 2, "Sentry Gun is low on rockets.\n");
		}
	}
	self.ammo_shells = (self.ammo_shells - 1);
	if ((self.ammo_shells < 0))
	{
		self.ammo_shells = 0;
		return (0);
	}
	Sentry_MuzzleFlash ();
	sound (self, 1, "weapons/sniper.wav", 1, 1);
	deathmsg = 27;
	self.v_angle = self.angles;
	FireBullets (4, dir, '0.1 0.1 0');
	if (((self.ammo_shells == 0) && (random () < 0.1)))
	{
		sprint (self.real_owner, 2, "Sentry Gun is out of shells.\n");
	}
	else
	{
		if ((self.ammo_shells == 20))
		{
			sprint (self.real_owner, 2, "Sentry Gun is low on shells.\n");
		}
	}
	if ((((self.ammo_rockets == 0) && (self.weapon == 3)) && (random () < 0.1)))
	{
		sprint (self.real_owner, 2, "Sentry Gun is out of rockets.\n");
		if ((self.ammo_shells == 0))
		{
			return (0);
		}
	}
	return (1);
};

float () Sentry_Fire =
{
	local vector dir;
	local float r;
	local vector org;

	if ((self.tfstate > time))
	{
		return (1);
	}
	self.effects = (self.effects - (self.effects & 8));
	dir = (self.enemy.origin - (self.origin + '0 0 16'));
	r = vlen (dir);
	if ((r < 150))
	{
		if ((((self.ideal_yaw - anglemod (self.angles_y)) < -10) || ((self.ideal_yaw - anglemod (self.angles_y)) > enter)))
		{
			return (0);
		}
	}
	else
	{
		if ((r < 250))
		{
			if ((((self.ideal_yaw - anglemod (self.angles_y)) < -6.5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 6.5)))
			{
				return (0);
			}
		}
		else
		{
			if ((r < 400))
			{
				if ((((self.ideal_yaw - anglemod (self.angles_y)) < -5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 5)))
				{
					return (0);
				}
			}
			else
			{
				if ((r < 650))
				{
					if ((((self.ideal_yaw - anglemod (self.angles_y)) < -3.5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 3.5)))
					{
						return (0);
					}
				}
				else
				{
					if ((r < 900))
					{
						if ((((self.ideal_yaw - anglemod (self.angles_y)) < -2.4) || ((self.ideal_yaw - anglemod (self.angles_y)) > 2.4)))
						{
							return (0);
						}
					}
					else
					{
						if ((r < 1200))
						{
							if ((((self.ideal_yaw - anglemod (self.angles_y)) < -1.3) || ((self.ideal_yaw - anglemod (self.angles_y)) > 1.3)))
							{
								return (0);
							}
						}
						else
						{
							if ((((self.ideal_yaw - anglemod (self.angles_y)) < -0.4) || ((self.ideal_yaw - anglemod (self.angles_y)) > 0.4)))
							{
								return (0);
							}
						}
					}
				}
			}
		}
	}
	if ((((self.weapon == 3) && (self.ammo_rockets > 0)) && (self.super_damage_finished < time)))
	{
		Sentry_MuzzleFlash ();
		sound (self, 1, "weapons/rocket1i.wav", 1, 1);
		newmis = spawn ();
		newmis.owner = self;
		newmis.movetype = 9;
		newmis.solid = 2;
		newmis.velocity = (normalize ((self.enemy.origin - self.origin)) * 800);
		newmis.angles = vectoangles (newmis.velocity);
		newmis.weapon = quote;
		newmis.touch = T_MissileTouch;
		newmis.nextthink = (time + 5);
		newmis.think = SUB_Remove;
		setmodel (newmis, "progs/missile.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
		setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
		self.super_damage_finished = (time + 3);
		self.ammo_rockets = (self.ammo_rockets - 1);
		if ((self.ammo_rockets == enter))
		{
			sprint (self.real_owner, 2, "Sentry Gun is low on rockets.\n");
		}
		if ((self.ammo_rockets == 0))
		{
			sprint (self.real_owner, 2, "Sentry Gun is out of rockets.\n");
		}
	}
	org = (self.origin + '0 0 16');
	if ((sentry_fire == 1))
	{
		if ((self.ammo_shells > 0))
		{
			Sentry_MuzzleFlash ();
			sound (self, 1, "weapons/lhit.wav", 1, 1);
			traceline (org, (self.enemy.origin + '0 0 16'), 1, self);
			WriteByte (4, 23);
			WriteByte (4, 6);
			WriteEntity (4, self);
			WriteCoord (4, org_x);
			WriteCoord (4, org_y);
			WriteCoord (4, org_z);
			WriteCoord (4, trace_endpos_x);
			WriteCoord (4, trace_endpos_y);
			WriteCoord (4, trace_endpos_z);
			multicast (org, 1);
			if ((r <= 700))
			{
				LightningDamage (org, (trace_endpos + (v_forward * 4)), self, 23);
			}
			else
			{
				if ((r <= 1100))
				{
					LightningDamage (org, (trace_endpos + (v_forward * 4)), self, 17);
				}
				else
				{
					LightningDamage (org, (trace_endpos + (v_forward * 4)), self, enter);
				}
			}
			self.ammo_shells = (self.ammo_shells - 1);
			if ((self.ammo_shells == 20))
			{
				sprint (self.real_owner, 2, "Sentry Gun is low on shells.\n");
			}
			if ((self.ammo_shells <= 0))
			{
				sprint (self.real_owner, 2, "Sentry Gun is out of shells.\n");
				self.ammo_shells = 0;
			}
		}
	}
	else
	{
		if ((self.ammo_shells > 0))
		{
			Sentry_MuzzleFlash ();
			self.v_angle = self.angles;
			deathmsg = 27;
			if ((sentry_fire == 2))
			{
				LaunchLaser (org, dir);
			}
			else
			{
				sound (self, 1, "weapons/sniper.wav", 1, 1);
				if ((r <= 700))
				{
					FireSentry (14, dir, '0.1 0.1 0');
				}
				else
				{
					if ((r <= 1100))
					{
						FireSentry (enter, dir, '0.3 0.3 0.1');
					}
					else
					{
						FireSentry (6, dir, '0.7 0.5 0.5');
					}
				}
			}
			self.ammo_shells = (self.ammo_shells - 1);
			if ((self.ammo_shells == 20))
			{
				sprint (self.real_owner, 2, "Sentry Gun is low on shells.\n");
			}
			if ((self.ammo_shells <= 0))
			{
				sprint (self.real_owner, 2, "Sentry Gun is out of shells.\n");
				self.ammo_shells = 0;
			}
		}
	}
	return (1);
};

void () Sentry_MuzzleFlash =
{
	self.effects = (self.effects | 8);
};
