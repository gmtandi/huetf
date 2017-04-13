//=-=-=-=-=

void () TeamFortress_CTF_FlagInfo =
{
	local entity te;

	te = Finditem (1);
	if ((te.goal_state == 1))
	{
		if ((self == te.owner))
		{
			sprint (self, 2, "You have the enemy flag. ");
		}
		else
		{
			sprint (self, 2, te.owner.netname);
			sprint (self, 2, " has");
			if ((self.team_no == 1))
			{
				sprint (self, 2, " your flag. ");
			}
			else
			{
				sprint (self, 2, " the enemy flag. ");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == 1))
			{
				sprint (self, 2, "Your flag is lying about. ");
			}
			else
			{
				sprint (self, 2, "The enemy flag is lying about. ");
			}
		}
		else
		{
			if ((self.team_no == 1))
			{
				sprint (self, 2, "Your flag is in your base. ");
			}
			else
			{
				sprint (self, 2, "The enemy flag is in their base. ");
			}
		}
	}
	te = Finditem (2);
	if ((te.goal_state == 1))
	{
		if ((self == te.owner))
		{
			sprint (self, 2, "You have the enemy flag.\n");
		}
		else
		{
			sprint (self, 2, te.owner.netname);
			sprint (self, 2, " has");
			if ((self.team_no == 2))
			{
				sprint (self, 2, " your flag.\n");
			}
			else
			{
				sprint (self, 2, " the enemy flag.\n");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == 2))
			{
				sprint (self, 2, "Your flag is lying about.\n");
			}
			else
			{
				sprint (self, 2, "The enemy flag is lying about.\n");
			}
		}
		else
		{
			if ((self.team_no == 2))
			{
				sprint (self, 2, "Your flag is in your base.\n");
			}
			else
			{
				sprint (self, 2, "The enemy flag is in their base.\n");
			}
		}
	}
};

void () DroppedKeyThink =
{
	self.think = SUB_Null;
	self.touch = key_touch;
	self.owner = world;
};

void () DropKey =
{
	if (((self.items & 131072) || (self.items & 262144)))
	{
		newmis = spawn ();
		if ((self.items & 131072))
		{
			self.items = (self.items - (self.items & 131072));
			newmis.items = 131072;
			if ((world.worldtype == 0))
			{
				setmodel (newmis, "progs/w_s_key.mdl");
				newmis.netname = "silver key";
				newmis.noise = "misc/medkey.wav";
			}
			else
			{
				if ((world.worldtype == 1))
				{
					setmodel (newmis, "progs/m_s_key.mdl");
					newmis.netname = "silver runekey";
					newmis.noise = "misc/runekey.wav";
				}
				else
				{
					if ((world.worldtype == 2))
					{
						setmodel (newmis, "progs/b_s_key.mdl");
						newmis.netname = "silver keycard";
						newmis.noise = "misc/basekey.wav";
					}
				}
			}
		}
		else
		{
			if ((self.items & 262144))
			{
				self.items = (self.items - (self.items & 262144));
				newmis.items = 262144;
				if ((world.worldtype == 0))
				{
					setmodel (newmis, "progs/w_g_key.mdl");
					newmis.netname = "gold key";
					newmis.noise = "misc/medkey.wav";
				}
				else
				{
					if ((world.worldtype == 1))
					{
						setmodel (newmis, "progs/m_g_key.mdl");
						newmis.netname = "gold runekey";
						newmis.noise = "misc/runekey.wav";
					}
					else
					{
						if ((world.worldtype == 2))
						{
							setmodel (newmis, "progs/b_g_key.mdl");
							newmis.netname = "gold keycard";
							newmis.noise = "misc/basekey.wav";
						}
					}
				}
			}
		}
		newmis.owner = self;
		newmis.touch = SUB_Null;
		setorigin (newmis, (self.origin + '0 0 16'));
		makevectors (self.v_angle);
		newmis.velocity = ((normalize (v_forward) * 300) + '0 0 200');
		newmis.movetype = 6;
		newmis.solid = 1;
		newmis.deadflag = 1;
		setsize (newmis, '-16 -16 -24', '16 16 32');
		newmis.think = DroppedKeyThink;
		newmis.nextthink = (time + 1.5);
	}
	else
	{
		sprint (self, 2, "You don't have a key\n");
	}
};

float () DoorShouldOpen =
{
	local entity ptr;
	local float plyrcount;
	local entity plyr1;
	local entity plyr2;

	if ((coop != 2))
	{
		return (1);
	}
	plyrcount = 0;
	ptr = find (world, classname, "player");
	while ((ptr != world))
	{
		if ((((!(ptr.tf_items & self.items) && ptr.playerclass) && (ptr.solid != 0)) && (ptr.model != string_null)))
		{
			plyrcount = (plyrcount + 1);
			if ((plyrcount == 1))
			{
				plyr1 = ptr;
			}
			else
			{
				if ((plyrcount == 2))
				{
					plyr2 = ptr;
				}
			}
		}
		ptr = find (ptr, classname, "player");
	}
	if ((plyrcount != 0))
	{
		if ((plyrcount == 1))
		{
			bprint (2, plyr1.netname);
			bprint (2, " needs");
		}
		else
		{
			if ((plyrcount == 2))
			{
				bprint (2, plyr1.netname);
				bprint (2, " and ");
				bprint (2, plyr2.netname);
				bprint (2, " need");
			}
			else
			{
				bprint (2, "More players need");
			}
		}
		bprint (2, " to unlock the ");
		if ((self.items & 131072))
		{
			bprint (2, "silver");
		}
		else
		{
			bprint (2, "gold");
		}
		bprint (2, " door\n");
		return (0);
	}
	bprint (2, "The ");
	if ((self.items & 131072))
	{
		bprint (2, "silver");
	}
	else
	{
		bprint (2, "gold");
	}
	bprint (2, " door has been unlocked\n");
	return (1);
};
