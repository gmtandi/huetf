float KEY_MOVEUP    = 1;
float KEY_MOVEDOWN    = 2;
float KEY_MOVELEFT    = 4;
float KEY_MOVERIGHT    = 8;
float KEY_MOVEFORWARD    = 16;
float KEY_MOVEBACK    = 32;
float KEY_LOOKUP    = 64;
float KEY_LOOKDOWN    = 128;
float KEY_LOOKLEFT    = 256;
float KEY_LOOKRIGHT    = 512;
float KEY_STOP_LOOKLEFT    = 65279;
float KEY_STOP_LOOKRIGHT    = 65023;

float (vector vDestination) AtLocation =
{
	return ((vlen ((vDestination - self.origin)) < 45));
};

void () StrafeLeft =
{
	if ((self.obs_time < time))
	{
		self.keys = (self.keys + KEY_MOVELEFT);
	}
};

void () StrafeRight =
{
	if ((self.obs_time < time))
	{
		self.keys = (self.keys + KEY_MOVERIGHT);
	}
};

void () BotTouch =
{
	return;
};

void () ClearAllWaypoints =
{
	self.waypoint1 = '0 0 0';
	self.waypoint2 = '0 0 0';
	self.waypoint3 = '0 0 0';
	self.waypoint4 = '0 0 0';
	self.waypoint5 = '0 0 0';
	self.distanceToWaypoint = 5000;
	self.checkMovementTime = (time + 0.7);
};
.float AvoidObstacle;

void (vector whichway) frik_obstructed =
{
	local vector vTemp;
	local vector vTrueRight;
	local vector vTrueLeft;
	local vector disway;
	local vector org;
	local float dist;
	local entity possibleTarget;

	possibleTarget = findradius (self.origin, 64);
	while (possibleTarget)
	{
		if ((possibleTarget.classname == "player"))
		{
			if ((possibleTarget.team_no != self.team_no))
			{
				self.obs_time = 0;
				return;
			}
		}
		possibleTarget = possibleTarget.chain;
	}
	if ((self.obs_time < time))
	{
		self.obs_time = (time + 0.5);
	}
	makevectors (self.v_angle);
	self.botDirection = v_forward;
	makevectors (self.v_angle);
	traceline (self.origin, (self.origin + (v_forward * 40)), FALSE, world);
	if ((trace_fraction == 1))
	{
		self.avoidKeys = KEY_MOVEFORWARD;
	}
	else
	{
		self.avoidKeys = 0;
	}
	vTrueRight = (v_right * 40);
	vTemp = self.v_angle;
	vTemp_y = anglemod ((self.v_angle_y + 180));
	makevectors (vTemp);
	vTrueLeft = (v_right * 40);
	if ((self.AvoidObstacle == KEY_MOVELEFT))
	{
		traceline (self.origin, (self.origin + vTrueLeft), FALSE, world);
		if ((trace_fraction == 1))
		{
			if ((self.avoidKeys & KEY_MOVERIGHT))
			{
				self.avoidKeys = (self.avoidKeys - KEY_MOVERIGHT);
			}
			if (!(self.avoidKeys & KEY_MOVELEFT))
			{
				self.avoidKeys = (self.avoidKeys + KEY_MOVELEFT);
			}
			self.AvoidObstacle = KEY_MOVELEFT;
			return;
		}
	}
	traceline (self.origin, (self.origin + vTrueRight), FALSE, world);
	if ((trace_fraction == 1))
	{
		if ((self.avoidKeys & KEY_MOVELEFT))
		{
			self.avoidKeys = (self.avoidKeys - KEY_MOVELEFT);
		}
		if (!(self.avoidKeys & KEY_MOVERIGHT))
		{
			self.avoidKeys = (self.avoidKeys + KEY_MOVERIGHT);
		}
		self.AvoidObstacle = KEY_MOVERIGHT;
		return;
	}
	traceline (self.origin, (self.origin + vTrueLeft), FALSE, world);
	if ((trace_fraction == 1))
	{
		if ((self.avoidKeys & KEY_MOVERIGHT))
		{
			self.avoidKeys = (self.avoidKeys - KEY_MOVERIGHT);
		}
		if (!(self.avoidKeys & KEY_MOVELEFT))
		{
			self.avoidKeys = (self.avoidKeys + KEY_MOVELEFT);
		}
		self.AvoidObstacle = KEY_MOVELEFT;
		return;
	}
	self.avoidKeys = KEY_MOVEFORWARD;
	return;
};

float (float y1, float y2) angcomp =
{
	local float answer;

	while ((y1 > 180))
	{
		y1 = (y1 - 360);
	}
	while ((y1 < -180))
	{
		y1 = (y1 + 360);
	}
	while ((y2 > 180))
	{
		y2 = (y2 - 360);
	}
	while ((y2 < -180))
	{
		y2 = (y2 + 360);
	}
	answer = (y1 - y2);
	if ((fabs (answer) >= 180))
	{
		answer = (360 - fabs (answer));
	}
	return (answer);
};

float (vector sdir) GetKeysByDir =
{
	local vector keydir;
	local vector lookhere;
	local float outkeys;
	local float tang;

	outkeys = 0;
	keydir = vectoangles (sdir);
	if (!(self.action & (BOT_FIGHTING + BOT_AVOIDING_HAZARD)))
	{
		lookhere = keydir;
		lookhere_x = 0;
		self.v_angle = lookhere;
	}
	if ((sdir_x || sdir_y))
	{
		tang = angcomp (keydir_y, self.v_angle_y);
		if ((fabs (tang) <= 80))
		{
			outkeys = (outkeys + KEY_MOVEFORWARD);
		}
		tang = angcomp (keydir_y, (self.v_angle_y - 90));
		if ((fabs (tang) <= 80))
		{
			outkeys = (outkeys + KEY_MOVERIGHT);
		}
		tang = angcomp (keydir_y, (self.v_angle_y + 90));
		if ((fabs (tang) <= 80))
		{
			outkeys = (outkeys + KEY_MOVELEFT);
		}
		tang = angcomp (keydir_y, (self.v_angle_y - 180));
		if ((fabs (tang) <= 80))
		{
			outkeys = (outkeys + KEY_MOVEBACK);
		}
	}
	if ((sdir_z > 0.7))
	{
		outkeys = (outkeys + KEY_MOVEUP);
	}
	else
	{
		if ((sdir_z < 0.7))
		{
			outkeys = (outkeys + KEY_MOVEDOWN);
		}
	}
	return (outkeys);
};

float (vector vLocation) GetKeysByLoc =
{
	local vector vDirection;

	vDirection = (vLocation - self.origin);
	return (GetKeysByDir (vDirection));
};

void (vector vDestination) GotoLocation =
{
	self.keys = GetKeysByLoc (vDestination);
};

void (vector vDestination) MoveToLocation =
{
	ClearAllWaypoints ();
	if ((self.action != BOT_MOVING))
	{
		self.oldAction = self.action;
		self.action = BOT_MOVING;
	}
	self.waypoint1 = vDestination;
};

void () DoMovement =
{
	local float botDistanceToWaypoint;

	if ((self.waypoint1 == '0 0 0'))
	{
		if ((self.oldAction != BOT_MOVING))
		{
			self.action = self.oldAction;
		}
		else
		{
			self.action = BOT_IDLE;
		}
		self.oldAction = BOT_IDLE;
		if ((self.action == BOT_DEFEND))
		{
			self.v_angle = self.botDirection;
		}
		self.obs_time = 0;
		self.keys = 0;
		return;
	}
	if ((vlen ((self.waypoint1 - self.origin)) < 50))
	{
		if ((self.waypoint2 == '0 0 0'))
		{
			self.waypoint1 = '0 0 0';
		}
		else
		{
			self.waypoint1 = self.waypoint2;
			self.waypoint2 = self.waypoint3;
			self.waypoint3 = self.waypoint4;
			self.waypoint4 = self.waypoint5;
			self.waypoint5 = '0 0 0';
		}
		self.distanceToWaypoint = 5000;
		self.checkMovementTime = (time + 0.7);
	}
	if ((self.checkMovementTime < time))
	{
		botDistanceToWaypoint = vlen ((self.waypoint1 - self.origin));
		if ((self.distanceToWaypoint < botDistanceToWaypoint))
		{
			ClearAllWaypoints ();
			self.keys = 0;
			self.action = BOT_IDLE;
			return;
		}
		else
		{
			self.checkMovementTime = (time + 0.7);
			self.distanceToWaypoint = botDistanceToWaypoint;
		}
	}
	if ((self.waypoint1 != '0 0 0'))
	{
		self.keys = GetKeysByLoc (self.waypoint1);
	}
};
