
float () CheckForResupply =
{
	if ((self.action & (BOT_FIGHTING + BOT_AVOIDING_HAZARD)))
	{
		return (FALSE);
	}
	if (((self.health < self.max_health) || (self.armorvalue < self.maxarmor)))
	{
		return (TRUE);
	}
	return (FALSE);
};

void () GoForResupply =
{
	if ((self.action == BOT_FIGHTING))
	{
		return;
	}
	self.action = BOT_RESUPPLYING;
	ClearAllTargets ();
	ClearAllWaypoints ();
	self.button1 = 0;
	self.button2 = 0;
};

string () PickAName =
{
	return ("PáâìOŽTèEŽBïT");
};

void (vector itemLocation) GetItem =
{
	MoveToLocation (itemLocation);
};

float () PickUpItems =
{
	local entity item;

	item = findradius (self.origin, 500);
	while (item)
	{
		traceline (self.origin, item.origin, FALSE, world);
		if (((trace_fraction == 1) && (item.model != "")))
		{
			if ((((item.classname == "info_tfgoal") && (item.model == "progs/backpack.mdl")) && (item.goal_state == BOT_FIGHTING)))
			{
				if ((self.armorvalue < self.maxarmor))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_shells < self.maxammo_shells) && item.ammo_shells))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_nails < self.maxammo_nails) && item.ammo_nails))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_rockets < self.maxammo_rockets) && item.ammo_rockets))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_cells < self.maxammo_cells) && item.ammo_cells))
				{
					GetItem (item.origin);
					return (TRUE);
				}
			}
			if (((item.classname == "item_backpack") || (item.classname == "ammobox")))
			{
				if (((self.ammo_shells < self.maxammo_shells) && item.ammo_shells))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_nails < self.maxammo_nails) && item.ammo_nails))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_rockets < self.maxammo_rockets) && item.ammo_rockets))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				if (((self.ammo_cells < self.maxammo_cells) && item.ammo_cells))
				{
					GetItem (item.origin);
					return (TRUE);
				}
			}
			if (((item.classname == "ammo_shells") && (self.ammo_shells < self.maxammo_shells)))
			{
				GetItem (item.origin);
				return (TRUE);
			}
			else
			{
				if (((item.classname == "ammo_spikes") && (self.ammo_nails < self.maxammo_nails)))
				{
					GetItem (item.origin);
					return (TRUE);
				}
				else
				{
					if (((item.classname == "ammo_rockets") && (self.ammo_rockets < self.maxammo_rockets)))
					{
						GetItem (item.origin);
						return (TRUE);
					}
					else
					{
						if (((item.classname == "ammo_cells") && (self.ammo_cells < self.maxammo_cells)))
						{
							GetItem (item.origin);
							return (TRUE);
						}
						else
						{
							if (((item.classname == "item_health") && (self.health < self.max_health)))
							{
								GetItem (item.origin);
								return (TRUE);
							}
							else
							{
								if (((item.classname == "item_armorInv") && (self.armorvalue < self.maxarmor)))
								{
									GetItem (item.origin);
									return (TRUE);
								}
							}
						}
					}
				}
			}
		}
		item = item.chain;
	}
	if ((self.action == BOT_RESUPPLYING))
	{
		self.action = BOT_IDLE;
	}
	if ((self.oldAction == BOT_RESUPPLYING))
	{
		self.oldAction = BOT_IDLE;
	}
	return (FALSE);
};

float () BotImpulseMenu =
{
	local float subItem;

	subItem = self.nextimpulse;
	self.nextimpulse = 0;
	if ((self.current_menu == BOT_FIGHTING))
	{
		return (self.team_no);
	}
	if ((self.current_menu == BOT_AI_FOLLOW))
	{
		return (self.skin);
	}
	if ((self.current_menu == 12))
	{
		return (BOT_MOVING);
	}
	if ((self.current_menu == 13))
	{
		return (BOT_DEFEND);
	}
	if ((self.current_menu == 14))
	{
		return (self.team);
	}
	if ((self.current_menu == 15))
	{
		if (subItem)
		{
			return (subItem);
		}
		return (BOT_MOVING);
	}
	if ((self.current_menu == 17))
	{
		if (subItem)
		{
			self.button0 = 0;
			return (subItem);
		}
		return (BOT_AI_GRAPPLE);
	}
	if ((self.current_menu == 19))
	{
		return (BOT_AI_FOLLOW);
	}
};

float () BotImpulse =
{
	local float fTemp;

	if ((self.nextimpulse != 0))
	{
		fTemp = self.nextimpulse;
		self.nextimpulse = 0;
		return (fTemp);
	}
	return (self.impulse);
};
