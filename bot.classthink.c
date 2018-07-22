
void () ScoutThink =
{
};

void () SniperThink =
{
};

void () SoldierThink =
{
};

void () DemoThink =
{
	local entity eTemp;

	if ((self.pipeLocation == '0 0 0'))
	{
		return;
	}
	eTemp = findradius (self.pipeLocation, 110);
	while (eTemp)
	{
		if (((eTemp.classname == "player") && (eTemp.team_no != self.team_no)))
		{
			TeamFortress_DetonatePipebombs ();
			self.pipeLocation = '0 0 0';
			self.has_sentry = 0;
			return;
		}
		eTemp = eTemp.chain;
	}
};

void () MedicThink =
{
};

void () HwguyThink =
{
};

void () PyroThink =
{
};

void () SpyThink =
{
};

void () EngyThink =
{
};

void () ClassThink =
{
	if ((self.playerclass > BOT_AI_GRAPPLE))
	{
		if ((self.playerclass > BOT_AI_BLAST))
		{
			if ((self.playerclass == BOT_DEFEND))
			{
				SpyThink ();
			}
			else
			{
				EngyThink ();
			}
		}
		else
		{
			if ((self.playerclass == BOT_AI_FLEE))
			{
				HwguyThink ();
			}
			else
			{
				PyroThink ();
			}
		}
	}
	else
	{
		if ((self.playerclass > BOT_AI_FOLLOW))
		{
			if ((self.playerclass == BOT_MOVING))
			{
				DemoThink ();
			}
			else
			{
				MedicThink ();
			}
		}
		else
		{
			if ((self.playerclass == PC_SCOUT))
			{
				ScoutThink ();
			}
			else
			{
				if ((self.playerclass == BOT_FIGHTING))
				{
					SniperThink ();
				}
				else
				{
					SoldierThink ();
				}
			}
		}
	}
};
