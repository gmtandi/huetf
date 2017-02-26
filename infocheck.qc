//=-=-=-=-=
.float fAverageFrameTime;
.float fFrameCount;
.float fFrameReset;
.float fLowestFrameTime;
.float real_time;

float () crandom =
{
	return ((SBAR_PRINT * (random () - 0.5)));
};

void () autoteam_think =
{
	toggleflags = (toggleflags | 64);
	dremove (self);
};

void () CheckFps =
{
	self.fAverageFrameTime = (self.fAverageFrameTime + frametime);
	self.fFrameCount = (self.fFrameCount + SBAR_GRENS);
	if ((frametime < self.fLowestFrameTime))
	{
		self.fLowestFrameTime = frametime;
	}
	if ((self.fFrameReset < time))
	{
		self.real_time = time;
		self.fFrameReset = (time + 15);
		self.fAverageFrameTime = RANGE_MELEE;
		self.fFrameCount = RANGE_MELEE;
		self.fLowestFrameTime = 0.013;
	}
};

void () Calibrate_Level =
{
	local string st;
	local float autoteam_time;
	local entity ent;

	st = infokey (world, "max_pipebombs");
	num_max_pipebombs = (stof (st) + SBAR_GRENS);
	if (((num_max_pipebombs < SBAR_200) || (num_max_pipebombs > 25)))
	{
		if ((number_of_teams == AS_MISSILE))
		{
			num_max_pipebombs = 21;
		}
		else
		{
			num_max_pipebombs = 15;
		}
	}
	st = infokey (world, "max_flares");
	num_max_flares = (stof (st) + SBAR_GRENS);
	if (((num_max_flares < 5) || (num_max_flares > 17)))
	{
		num_max_flares = 9;
	}
	st = infokey (world, "max_ammoboxes");
	num_max_ammoboxes = (stof (st) + SBAR_GRENS);
	if (((num_max_ammoboxes < 13) || (num_max_ammoboxes > 29)))
	{
		num_max_ammoboxes = 21;
	}
	st = infokey (world, "grapple");
	if (((st == "on") || (toggleflags & 1024)))
	{
		allow_hook = SBAR_GRENS;
	}
	else
	{
		allow_hook = RANGE_MELEE;
	}
	st = infokey (world, "flashlight");
	if ((st == "on"))
	{
		allow_flash = SBAR_GRENS;
	}
	else
	{
		allow_flash = RANGE_MELEE;
	}
	st = infokey (world, "grenpacks");
	if ((st == "on"))
	{
		allow_grenpack = SBAR_GRENS;
	}
	else
	{
		allow_grenpack = RANGE_MELEE;
	}
	st = infokey (world, "autoteam");
	if ((st == "on"))
	{
		autoteam_time = 30;
		toggleflags = (toggleflags | 64);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & 64));
		}
		else
		{
			if ((stof (st) != RANGE_MELEE))
			{
				toggleflags = (toggleflags | 64);
				autoteam_time = stof (st);
			}
		}
	}
	st = infokey (world, "autokick_time");
	autokick_time = stof (st);
	if ((autokick_time != RANGE_MELEE))
	{
		st = infokey (world, "autokick_kills");
		autokick_kills = stof (st);
	}
	st = infokey (world, "teamfrags");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | 128);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & 128));
		}
	}
	st = infokey (world, "fullteamscore");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | 2048);
	}
	st = infokey (world, "rd");
	respawn_delay_time = stof (st);
	if (respawn_delay_time)
	{
		toggleflags = (toggleflags | AS_MISSILE);
	}
	if (((toggleflags & AS_MISSILE) && (respawn_delay_time == RANGE_MELEE)))
	{
		respawn_delay_time = AS_MELEE;
	}
	if ((toggleflags & 64))
	{
		toggleflags = (toggleflags - (toggleflags & 64));
		ent = spawn ();
		ent.nextthink = (time + autoteam_time);
		ent.think = autoteam_think;
	}
	st = infokey (world, "grentype");
	grentype = stof (st);
	if (((grentype > SBAR_GRENS) || (grentype < RANGE_MELEE)))
	{
		grentype = RANGE_MELEE;
	}
	gspeed = stof (infokey (world, "gspeed"));
	if (((gspeed < RANGE_MELEE) || (gspeed > AS_MELEE)))
	{
		gspeed = RANGE_MELEE;
	}
	st = infokey (world, "sentrytype");
	sgtype = stof (st);
	if (((sgtype > AS_MELEE) || (sgtype < RANGE_MELEE)))
	{
		sgtype = RANGE_MELEE;
	}
	st = infokey (world, "sentryspeed");
	sentry_speed = stof (st);
	if (((sentry_speed > 0.18) || (sentry_speed < 0.06)))
	{
		sentry_speed = 0.1;
	}
	st = infokey (world, "sentrydelay");
	sentry_delay = stof (st);
	if (((sentry_delay > SBAR_GRENS) || (sentry_delay < 0.1)))
	{
		sentry_delay = 0.25;
	}
	st = infokey (world, "sentryfire");
	sentry_fire = stof (st);
	if (((sentry_fire > SBAR_PRINT) || (sentry_fire < RANGE_MELEE)))
	{
		sentry_fire = RANGE_MELEE;
	}
	st = infokey (world, "pipedelay");
	if ((st == "off"))
	{
		pipedelay = RANGE_MELEE;
	}
	else
	{
		pipedelay = SBAR_GRENS;
	}
};

void () flash_update =
{
	if ((self.owner.deadflag != RANGE_MELEE))
	{
		self.effects = RANGE_MELEE;
	}
	else
	{
		self.effects = 8;
	}
	makevectors (self.owner.v_angle);
	traceline (self.owner.origin, (self.owner.origin + (v_forward * 500)), RANGE_MELEE, self);
	setorigin (self, (trace_endpos + (v_forward * -5)));
	self.nextthink = (time + 0.02);
};

void () flash_on =
{
	local entity myflash;

	myflash = spawn ();
	myflash.movetype = RANGE_MELEE;
	myflash.solid = RANGE_MELEE;
	setmodel (myflash, "progs/s_bubble.spr");
	setsize (myflash, '0 0 0', '0 0 0');
	myflash.owner = self;
	self.flash = myflash;
	myflash.classname = "flash";
	myflash.effects = 8;
	makevectors (self.v_angle);
	traceline (self.origin, (self.origin + (v_forward * 500)), RANGE_MELEE, self);
	setorigin (myflash, trace_endpos);
	myflash.think = flash_update;
	myflash.nextthink = (time + 0.02);
};

void () flash_toggle =
{
	if (!self.playerclass)
	{
		return;
	}
	if ((self.flash_flag == RANGE_MELEE))
	{
		self.flash_flag = SBAR_GRENS;
		flash_on ();
	}
	else
	{
		self.flash_flag = RANGE_MELEE;
		W_SetCurrentAmmo ();
		self.flash.think = SUB_Remove;
		self.flash.nextthink = (time + 0.1);
	}
};

void () fadetoblack =
{
	local float fade;
	local string x;

	fade = enter;
	while ((fade <= 250))
	{
		x = ftos (fade);
		stuffcmd (self, "v_cshift 0 0 0 ");
		stuffcmd (self, x);
		stuffcmd (self, ";wait\n");
		fade = (fade + enter);
	}
	stuffcmd (self, "v_cshift 0 0 0 255\n");
};

void () fadefromblack =
{
	local float fade;
	local string x;

	fade = 250;
	while ((fade >= RANGE_MELEE))
	{
		x = ftos (fade);
		stuffcmd (self, "v_cshift 0 0 0 ");
		stuffcmd (self, x);
		stuffcmd (self, ";wait\n");
		fade = (fade - enter);
	}
	stuffcmd (self, "v_cshift 0 0 0 0\n");
};
