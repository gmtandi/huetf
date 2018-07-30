//=-=-=-=-= Local Functions
void () FlareGrenadeTouch;
void () FlareGrenadeThink;
void () FlareGrenadeExplode;
void () RemoveFlare;
float (float tno) num_team_flares;
void (float tno) RemoveOldFlare;
void (float tno) increment_team_flares;
void (float tno) decrement_team_flares;
//=-=-=-=-=

void () FlareGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if ((other == world))
	{
		self.movetype = 0;
		self.velocity = '0 0 0';
	}
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
		self.touch = SUB_Null;
	}
};

void () FlareGrenadeThink =
{
	local float rnum;
	local float time_left;

	time_left = (self.health - time);
	if ((time_left > 33))
	{
		rnum = random ();
		if ((rnum < 0.5))
		{
			self.effects = 8;
		}
		else
		{
			self.effects = 0;
		}
		self.nextthink = ((time + 0.05) + (random () * 0.1));
	}
	else
	{
		if ((time_left > 31))
		{
			rnum = random ();
			if ((rnum < 0.5))
			{
				self.effects = 4;
			}
			else
			{
				self.effects = 8;
			}
			self.nextthink = ((time + 0.05) + (random () * 0.1));
		}
		else
		{
			if ((time_left > 15))
			{
				self.effects = 4;
				self.nextthink = (time + enter);
			}
			else
			{
				if ((time_left < 1))
				{
					RemoveFlare ();
				}
				else
				{
					self.effects = 8;
					self.nextthink = (time + time_left);
				}
			}
		}
	}
};

void () FlareGrenadeExplode =
{
	if ((self.weapon != 0))
	{
		increment_team_flares (self.weapon);
		if ((num_team_flares (self.weapon) > (num_max_flares / number_of_teams)))
		{
			RemoveOldFlare (self.weapon);
		}
	}
	else
	{
		num_world_flares = (num_world_flares + 1);
		if ((num_world_flares > num_max_flares))
		{
			RemoveOldFlare (0);
		}
	}
	self.skin = 1;
	self.health = (time + 40);
	self.nextthink = ((time + 0.05) + (random () * 0.1));
	self.think = FlareGrenadeThink;
};

void () RemoveFlare =
{
	self.effects = (self.effects - (self.effects & 4));
	dremove (self);
	num_world_flares = (num_world_flares - 1);
	decrement_team_flares (self.weapon);
};

float (float tno) num_team_flares =
{
	if ((tno == 1))
	{
		return (num_team_flares_1);
	}
	else
	{
		if ((tno == 2))
		{
			return (num_team_flares_2);
		}
		else
		{
			if ((tno == 3))
			{
				return (num_team_flares_3);
			}
			else
			{
				if ((tno == 4))
				{
					return (num_team_flares_4);
				}
			}
		}
	}
	return (0);
};

void (float tno) RemoveOldFlare =
{
	local entity old;
	local float index;

	if ((tno != 0))
	{
		index = num_team_flares (tno);
		index = (index - (num_max_flares / number_of_teams));
	}
	else
	{
		index = (num_world_flares - num_max_flares);
	}
	old = find (world, mdl, "flare");
	while ((index > 0))
	{
		if ((old == world))
		{
			num_world_flares = 0;
			num_team_flares_1 = 0;
			num_team_flares_2 = 0;
			num_team_flares_3 = 0;
			num_team_flares_4 = 0;
			return;
		}
		if (((old.weapon == tno) || (tno == 0)))
		{
			old.think = RemoveFlare;
			old.nextthink = (time + 0.1);
			index = (index - 1);
		}
		old = find (old, mdl, "flare");
	}
};

void (float tno) increment_team_flares =
{
	if ((tno == 1))
	{
		num_team_flares_1 = (num_team_flares_1 + 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_flares_2 = (num_team_flares_2 + 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_flares_3 = (num_team_flares_3 + 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_flares_4 = (num_team_flares_4 + 1);
				}
			}
		}
	}
};

void (float tno) decrement_team_flares =
{
	if ((tno == 1))
	{
		num_team_flares_1 = (num_team_flares_1 - 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_flares_2 = (num_team_flares_2 - 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_flares_3 = (num_team_flares_3 - 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_flares_4 = (num_team_flares_4 - 1);
				}
			}
		}
	}
};
