.float fAverageFrameTime;
.float fFrameCount;
.float fFrameReset;
.float fLowestFrameTime;
.float real_time;

float () crandom =
{
	return ((2 * (random () - 0.5)));
};

void () autoteam_think =
{
	toggleflags = (toggleflags | TFLAG_AUTOTEAM);
	dremove (self);
};

void () CheckFps =
{
	self.fAverageFrameTime = (self.fAverageFrameTime + frametime);
	self.fFrameCount = (self.fFrameCount + 1);
	if ((frametime < self.fLowestFrameTime))
	{
		self.fLowestFrameTime = frametime;
	}
	if ((self.fFrameReset < time))
	{
		self.real_time = time;
		self.fFrameReset = (time + 15);
		self.fAverageFrameTime = 0;
		self.fFrameCount = 0;
		self.fLowestFrameTime = 0.013;
	}
};

void () Calibrate_Level =
{
	local string st;
	local float fl;
	local float autoteam_time;
	local entity ent;

	st = infokey (world, "max_pipebombs");
	num_max_pipebombs = (stof (st) + 1);
	if (((num_max_pipebombs < 11) || (num_max_pipebombs > 25)))
	{
		if ((number_of_teams == 4))
		{
			num_max_pipebombs = 21;
		}
		else
		{
			num_max_pipebombs = 15;
		}
	}
	st = infokey (world, "max_flares");
	num_max_flares = (stof (st) + 1);
	if (((num_max_flares < 5) || (num_max_flares > 17)))
	{
		num_max_flares = 9;
	}
	st = infokey (world, "max_ammoboxes");

	fl = (stof (st)) + 1.000;
	if (fl < 13 || fl > 29) {
		store_obs.max_ammoboxes = 21.000;
	}

	st = infokey (world, "grapple");
	if (((st == "on") || (toggleflags & TFLAG_GRAPPLE)))
	{
		allow_hook = 1;
	}
	else
	{
		allow_hook = 0;
	}
	st = infokey (world, "flashlight");
	if ((st == "on"))
	{
		allow_flash = 1;
	}
	else
	{
		allow_flash = 0;
	}
	st = infokey (world, "grenpacks");
	if ((st == "on"))
	{
		allow_grenpack = 1;
	}
	else
	{
		allow_grenpack = 0;
	}
	st = infokey (world, "autoteam");
	if ((st == "on"))
	{
		autoteam_time = 30;
		toggleflags = (toggleflags | TFLAG_AUTOTEAM);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & TFLAG_AUTOTEAM));
		}
		else
		{
			if ((stof (st) != 0))
			{
				toggleflags = (toggleflags | TFLAG_AUTOTEAM);
				autoteam_time = stof (st);
			}
		}
	}
	st = infokey (world, "autokick_time");
	autokick_time = stof (st);
	if ((autokick_time != 0))
	{
		st = infokey (world, "autokick_kills");
		autokick_kills = stof (st);
	}
	st = infokey (world, "teamfrags");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | TFLAG_TEAMFRAGS);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & TFLAG_TEAMFRAGS));
		}
	}
	st = infokey (world, "fullteamscore");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | TFLAG_FULLTEAMSCORE);
	}
	st = infokey (world, "rd");
	respawn_delay_time = stof (st);
	if (respawn_delay_time)
	{
		toggleflags = (toggleflags | TFLAG_RESPAWNDELAY);
	}
	if (((toggleflags & TFLAG_RESPAWNDELAY) && (respawn_delay_time == 0)))
	{
		respawn_delay_time = 3;
	}
	if ((toggleflags & TFLAG_AUTOTEAM))
	{
		toggleflags = (toggleflags - (toggleflags & TFLAG_AUTOTEAM));
		ent = spawn ();
		ent.nextthink = (time + autoteam_time);
		ent.think = autoteam_think;
	}
	st = infokey (world, "grentype");
	grentype = stof (st);
	if (((grentype > 1) || (grentype < 0)))
	{
		grentype = 0;
	}
	gspeed = stof (infokey (world, "gspeed"));
	if (((gspeed < 0) || (gspeed > 3)))
	{
		gspeed = 0;
	}
	st = infokey (world, "sentrytype");
	sgtype = stof (st);
	if (((sgtype > 3) || (sgtype < 0)))
	{
		sgtype = 0;
	}
	st = infokey (world, "sentryspeed");
	sentry_speed = stof (st);
	if (((sentry_speed > 0.18) || (sentry_speed < 0.06)))
	{
		sentry_speed = 0.1;
	}
	st = infokey (world, "sentrydelay");
	sentry_delay = stof (st);
	if (((sentry_delay > 1) || (sentry_delay < 0.1)))
	{
		sentry_delay = 0.25;
	}
	st = infokey (world, "sentryfire");
	sentry_fire = stof (st);
	if (((sentry_fire > 2) || (sentry_fire < 0)))
	{
		sentry_fire = 0;
	}
	st = infokey (world, "pipedelay");
	if ((st == "off"))
	{
		pipedelay = 0;
	}
	else
	{
		pipedelay = 1;
	}
};

void () flash_update =
{
	if ((self.owner.deadflag != 0))
	{
		self.effects = 0;
	}
	else
	{
		self.effects = 8;
	}
	makevectors (self.owner.v_angle);
	traceline (self.owner.origin, (self.owner.origin + (v_forward * 500)), 0, self);
	setorigin (self, (trace_endpos + (v_forward * -5)));
	self.nextthink = (time + 0.02);
};

void () flash_on =
{
	local entity myflash;

	myflash = spawn ();
	myflash.movetype = 0;
	myflash.solid = 0;
	setmodel (myflash, "progs/s_bubble.spr");
	setsize (myflash, '0 0 0', '0 0 0');
	myflash.owner = self;
	self.flash = myflash;
	myflash.classname = "flash";
	myflash.effects = 8;
	makevectors (self.v_angle);
	traceline (self.origin, (self.origin + (v_forward * 500)), 0, self);
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
	if ((self.flash_flag == 0))
	{
		self.flash_flag = 1;
		flash_on ();
	}
	else
	{
		self.flash_flag = 0;
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
	while ((fade >= 0))
	{
		x = ftos (fade);
		stuffcmd (self, "v_cshift 0 0 0 ");
		stuffcmd (self, x);
		stuffcmd (self, ";wait\n");
		fade = (fade - enter);
	}
	stuffcmd (self, "v_cshift 0 0 0 0\n");
};
