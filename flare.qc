//=-=-=-=-=
void () FlareGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
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
	if ((time_left > SBAR_384))
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
				self.effects = AS_MISSILE;
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
				self.effects = AS_MISSILE;
				self.nextthink = (time + enter);
			}
			else
			{
				if ((time_left < SBAR_GRENS))
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
		num_world_flares = (num_world_flares + SBAR_GRENS);
		if ((num_world_flares > num_max_flares))
		{
			RemoveOldFlare (0);
		}
	}
	self.skin = SBAR_GRENS;
	self.health = (time + 40);
	self.nextthink = ((time + 0.05) + (random () * 0.1));
	self.think = FlareGrenadeThink;
};

void () RemoveFlare =
{
	self.effects = (self.effects - (self.effects & AS_MISSILE));
	dremove (self);
	num_world_flares = (num_world_flares - SBAR_GRENS);
	decrement_team_flares (self.weapon);
};
