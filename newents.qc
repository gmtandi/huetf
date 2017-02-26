//=-=-=-=-=
void () ball_reset =
{
	self.solid = 1;
	self.velocity = '0 0 0';
	self.origin = self.oldorigin;
	setorigin (self, self.origin);
	if (!droptofloor ())
	{
		dprint ("GoalItem fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
		return;
	}
};

void () ball_spin =
{
	local float vel_x;
	local float vel_y;

	if (self.velocity)
	{
		if ((self.velocity_x < 0))
		{
			vel_x = (self.velocity_x * -1);
		}
		else
		{
			vel_x = self.velocity_x;
		}
		if ((self.velocity_y < 0))
		{
			vel_y = (self.velocity_y * -1);
		}
		else
		{
			vel_y = self.velocity_y;
		}
		self.avelocity_x = ((vel_x + vel_y) * 2);
	}
};

void (vector o, float z) ball_kick =
{
	local vector v;

	v_x = ((o_x * 1.65) + (random () * 20));
	v_y = ((o_y * 1.65) + (random () * 20));
	if ((o_x < 0))
	{
		o_x = (o_x * -1);
	}
	if ((o_y < 0))
	{
		o_y = (o_y * -1);
	}
	v_z = (((_d + (random () * 30)) + ((o_y + o_x) * 0.2)) + (z * 2.5));
	self.flags = (self.flags - (self.flags & 512));
	self.velocity = v;
	self.angles = vectoangles (self.velocity);
	ball_spin ();
};

void (vector o) ball_fly =
{
	local vector v;

	v_x = ((o_x * 0.6) + (crandom () * 40));
	v_y = ((o_y * 0.6) + (crandom () * 40));
	if ((o_x < 0))
	{
		o_x = (o_x * -1);
	}
	if ((o_y < 0))
	{
		o_y = (o_y * -1);
	}
	v_z = ((140 + (crandom () * 40)) + ((o_y + o_x) * 0.2));
	self.flags = (self.flags - (self.flags & 512));
	self.velocity = v;
	self.angles = vectoangles (self.velocity);
	ball_spin ();
};

void () ball_touch =
{
	if ((other.classname == "worldspawn"))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((other.classname == "player"))
	{
		self.oldenemy = other;
		ball_kick (other.velocity, (other.v_angle_x * -1));
		return;
	}
	self.oldenemy = other.owner;
	ball_fly (other.velocity);
	return;
};

void () item_ball =
{
	self.solid = 1;
	self.movetype = enter;
	if (self.mdl)
	{
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	else
	{
		precache_model ("progs/ball.mdl");
		self.mdl = "progs/ball.mdl";
		setmodel (self, self.mdl);
	}
	if (!self.netname)
	{
		self.netname = "ball";
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-12 -12 -12';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '12 12 12';
	}
	setsize (self, self.goal_min, self.goal_max);
	setorigin (self, self.origin);
	self.oldorigin = self.origin;
	self.touch = ball_touch;
};

void () soccer_goal_touch =
{
	if (round_over)
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if ((other.classname == "item_ball"))
	{
		if (other.solid)
		{
			TeamFortress_TeamIncreaseScore (self.owned_by, self.count);
			TeamFortress_TeamShowScores (2);
			sound (self, 2, self.noise, 1, 0);
			tfs_winner = self.owned_by;
			other.solid = 0;
		}
		return;
	}
};

void () info_soccer_goal =
{
	if (!self.noise)
	{
		self.noise = "items/tf2kfgc.wav";
	}
	precache_sound (self.noise);
	InitTrigger ();
	self.touch = soccer_goal_touch;
};

void () func_glass =
{
	InitTrigger ();
};
entity lightstyles;

void () lightstyle_use =
{
	if (((self.spawnflags & 1) || (self.spawnflags & 2)))
	{
		lightstyle (self.style, self.message);
		if ((self.spawnflags & 1))
		{
			self.spawnflags = (self.spawnflags - 1);
		}
	}
	else
	{
		lightstyle (self.style, "a");
		self.spawnflags = (self.spawnflags + 1);
	}
};

void () func_lightstyle =
{
	if ((self.style > 63))
	{
		dprint ("Warning: style > 63!  Invalid range?");
	}
	if ((self.style <= 11))
	{
		dprint ("Warning: style <= 11: Old styles overwritten!");
	}
	if (!(self.spawnflags & 1))
	{
		lightstyle (self.style, self.message);
	}
	if ((self.targetname == ""))
	{
		remove (self);
		return;
	}
	self.use = lightstyle_use;
	if ((self.spawnflags & 1))
	{
		lightstyle (self.style, "a");
	}
	self.enemy = lightstyles;
	lightstyles = self;
};
