//=-=-=-=-=
void () Flymode =
{
	local entity spot;

	self.tracking = RANGE_MELEE;
	self.gravity = 1;
	spot = find (world, classname, "info_player_start");
	self.origin = spot.origin;
};

void () Toggle_Tracking =
{
	if (self.playerclass)
	{
		return;
	}
	if ((self.goalentity == world))
	{
		return;
	}
	if (!self.tracking)
	{
		self.tracking = 1;
		self.gravity = RANGE_MELEE;
		sprint (self, 2, "Tracking mode: 3rd Person.\n");
	}
	else
	{
		if ((((self.goalentity.classname == "player") || (self.goalentity.classname == "building_sentrygun")) && (self.tracking == 1)))
		{
			self.tracking = 2;
			sprint (self, 2, "Tracking mode: 1st Person.\n");
		}
		else
		{
			Flymode ();
			sprint (self, 2, "Tracking mode: Flymode.\n");
		}
	}
};

void (float amount) Pan_Out =
{
	self.camdist = (self.camdist + amount);
	if ((self.camdist > 500))
	{
		self.camdist = 500;
	}
};

void (float amount) Pan_In =
{
	self.camdist = (self.camdist - amount);
	if ((self.camdist < _2))
	{
		self.camdist = _2;
	}
};

void () Track_Object =
{
	local vector v1;
	local vector v2;
	local vector v3;
	local entity goal;

	if ((self.goalentity != world))
	{
		if ((self.goalentity.solid == RANGE_MELEE))
		{
			goal = self.goalentity.owner;
		}
		else
		{
			if (((self.goalentity.classname == "player") && (self.goalentity.health <= RANGE_MELEE)))
			{
				goal = self.goalentity.enemy;
			}
			else
			{
				goal = self.goalentity;
			}
		}
		if ((((goal.classname == "player") || (goal.classname == "building_sentrygun")) && (self.tracking == 2)))
		{
			self.origin = (self.goalentity.origin + self.goalentity.view_ofs);
			if ((self.goalentity.classname == "player"))
			{
				self.angles_x = (self.goalentity.angles_x * -1);
				self.angles_y = self.goalentity.angles_y;
			}
			else
			{
				if ((self.goalentity.classname == "building_sentrygun"))
				{
					self.angles = self.goalentity.angles;
				}
			}
			self.fixangle = 1;
			return;
		}
		else
		{
			if (self.tracking)
			{
				v1 = goal.origin;
				v2 = self.v_angle;
				makevectors (v2);
				v2 = (v_forward * self.camdist);
				traceline (v1, (v1 - v2), 1, goal);
				v2 = (v2 * trace_fraction);
				v3 = (v1 - (v2 * 0.6));
				v2 = (v1 - v2);
				traceline (self.origin, v2, 1, goal);
				if ((trace_fraction == 1))
				{
					v1 = (v3 - self.origin);
					v1 = (v1 * enter);
					self.velocity = v1;
				}
				self.origin = v3;
			}
		}
		if ((goal.classname == "player"))
		{
			self.items = goal.items;
			self.armorvalue = goal.armorvalue;
			if ((goal.health <= RANGE_MELEE))
			{
				self.health = 1;
			}
			else
			{
				self.health = goal.health;
			}
			self.weapon = goal.weapon;
			self.currentammo = goal.currentammo;
		}
		else
		{
			if ((goal.classname == "building_sentrygun"))
			{
				if ((goal.health <= RANGE_MELEE))
				{
					self.health = 1;
				}
				else
				{
					self.health = goal.health;
				}
				self.weapon = goal.weapon;
				self.currentammo = goal.ammo_shells;
			}
			else
			{
				if ((goal.classname == "item_tfgoal"))
				{
					self.armorvalue = (goal.nextthink - time);
					self.health = 1;
					self.currentammo = RANGE_MELEE;
				}
			}
		}
	}
};

void () Track_Tfgoal =
{
	self.goalentity = find (self.goalentity, classname, "item_tfgoal");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "item_tfgoal");
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.netname, ".\n");
	}
	else
	{
		CenterPrint (self, "No Flags in game to track.\n");
		Flymode ();
	}
};

void () Track_Player =
{
	local float endloop;

	self.goalentity = find (self.goalentity, classname, "player");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "player");
	}
	while (((self.goalentity != world) && !endloop))
	{
		if ((!self.goalentity.playerclass || self.goalentity.deadflag))
		{
			self.goalentity = find (self.goalentity, classname, "player");
		}
		else
		{
			endloop = 1;
		}
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.netname, ".\n");
	}
	else
	{
		CenterPrint (self, "No Players in game to track.\n");
		Flymode ();
	}
};

void () Track_Sentry =
{
	self.goalentity = find (self.goalentity, classname, "building_sentrygun");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "building_sentrygun");
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.owner.netname, "'s Sentry Gun.\n");
	}
	else
	{
		CenterPrint (self, "No Sentry Gun's in game to track.\n");
		Flymode ();
	}
};

void () Check_Track =
{
	if (self.tracking)
	{
		if ((self.goalentity != world))
		{
			Track_Object ();
		}
	}
};
