//=-=-=-=-=

void () TeamFortress_CTF_FlagInfo =
{
	local entity te;

	te = Finditem (SBAR_GRENS);
	if ((te.goal_state == SBAR_GRENS))
	{
		if ((self == te.owner))
		{
			sprint (self, SBAR_PRINT, "You have the enemy flag. ");
		}
		else
		{
			sprint (self, SBAR_PRINT, te.owner.netname);
			sprint (self, SBAR_PRINT, " has");
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, " your flag. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, " the enemy flag. ");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Your flag is lying about. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is lying about. ");
			}
		}
		else
		{
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Your flag is in your base. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is in their base. ");
			}
		}
	}
	te = Finditem (SBAR_PRINT);
	if ((te.goal_state == SBAR_GRENS))
	{
		if ((self == te.owner))
		{
			sprint (self, SBAR_PRINT, "You have the enemy flag.\n");
		}
		else
		{
			sprint (self, SBAR_PRINT, te.owner.netname);
			sprint (self, SBAR_PRINT, " has");
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, " your flag.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, " the enemy flag.\n");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "Your flag is lying about.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is lying about.\n");
			}
		}
		else
		{
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "Your flag is in your base.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is in their base.\n");
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
				if ((world.worldtype == SBAR_GRENS))
				{
					setmodel (newmis, "progs/m_s_key.mdl");
					newmis.netname = "silver runekey";
					newmis.noise = "misc/runekey.wav";
				}
				else
				{
					if ((world.worldtype == SBAR_PRINT))
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
					if ((world.worldtype == SBAR_GRENS))
					{
						setmodel (newmis, "progs/m_g_key.mdl");
						newmis.netname = "gold runekey";
						newmis.noise = "misc/runekey.wav";
					}
					else
					{
						if ((world.worldtype == SBAR_PRINT))
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
		newmis.solid = SBAR_GRENS;
		newmis.deadflag = SBAR_GRENS;
		setsize (newmis, '-16 -16 -24', '16 16 32');
		newmis.think = DroppedKeyThink;
		newmis.nextthink = (time + 1.5);
	}
	else
	{
		sprint (self, SBAR_PRINT, "You don't have a key\n");
	}
};

float () DoorShouldOpen =
{
	local entity ptr;
	local float plyrcount;
	local entity plyr1;
	local entity plyr2;

	if ((coop != SBAR_PRINT))
	{
		return (SBAR_GRENS);
	}
	plyrcount = 0;
	ptr = find (world, classname, "player");
	while ((ptr != world))
	{
		if ((((!(ptr.tf_items & self.items) && ptr.playerclass) && (ptr.solid != 0)) && (ptr.model != string_null)))
		{
			plyrcount = (plyrcount + SBAR_GRENS);
			if ((plyrcount == SBAR_GRENS))
			{
				plyr1 = ptr;
			}
			else
			{
				if ((plyrcount == SBAR_PRINT))
				{
					plyr2 = ptr;
				}
			}
		}
		ptr = find (ptr, classname, "player");
	}
	if ((plyrcount != 0))
	{
		if ((plyrcount == SBAR_GRENS))
		{
			bprint (SBAR_PRINT, plyr1.netname);
			bprint (SBAR_PRINT, " needs");
		}
		else
		{
			if ((plyrcount == SBAR_PRINT))
			{
				bprint (SBAR_PRINT, plyr1.netname);
				bprint (SBAR_PRINT, " && ");
				bprint (SBAR_PRINT, plyr2.netname);
				bprint (SBAR_PRINT, " need");
			}
			else
			{
				bprint (SBAR_PRINT, "More players need");
			}
		}
		bprint (SBAR_PRINT, " to unlock the ");
		if ((self.items & 131072))
		{
			bprint (SBAR_PRINT, "silver");
		}
		else
		{
			bprint (SBAR_PRINT, "gold");
		}
		bprint (SBAR_PRINT, " door\n");
		return (0);
	}
	bprint (SBAR_PRINT, "The ");
	if ((self.items & 131072))
	{
		bprint (SBAR_PRINT, "silver");
	}
	else
	{
		bprint (SBAR_PRINT, "gold");
	}
	bprint (SBAR_PRINT, " door has been unlocked\n");
	return (SBAR_GRENS);
};
