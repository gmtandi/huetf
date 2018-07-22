float BOT_TOP_ELEV    = 1;
float BOT_TOP_SPIRAL    = 2;
float BOT_FLAGROOM    = 4;
float BOT_BOTTOM_ELEV    = 8;
float BOT_BOTTOM_SPIRAL    = 16;
float BOT_BASEMENT    = 32;
float BOT_RAMPROOM    = 64;
vector GUN_FLAGROOM    = '325 -3280 -428';

void () SetDPosition =
{
	local entity botSentry;
	local entity eTemp;

	if ((self.playerclass == PC_SCOUT))
	{
		self.position = 0;
	}
	if ((self.playerclass == BOT_FIGHTING))
	{
		self.position = 0;
	}
	if ((self.playerclass == BOT_AI_FOLLOW))
	{
		if ((self.action != BOT_DEFEND))
		{
			if ((self.position == 0))
			{
				self.position = BOT_BOTTOM_ELEV;
			}
			return;
		}
		eTemp = findradius ('-520 -2700 -428', 400);
		while (eTemp)
		{
			if (((eTemp.classname == "player") && (eTemp.team_no != self.team_no)))
			{
				self.position = BOT_BASEMENT;
				if ((self.action == BOT_DEFEND))
				{
					self.action = BOT_IDLE;
				}
				return;
			}
			eTemp = eTemp.chain;
		}
		if ((self.position != BOT_BOTTOM_ELEV))
		{
			self.action = BOT_IDLE;
		}
		self.position = BOT_BOTTOM_ELEV;
	}
	if ((self.playerclass == BOT_MOVING))
	{
		self.position = BOT_BOTTOM_SPIRAL;
	}
	if ((self.playerclass == BOT_AI_GRAPPLE))
	{
		self.position = 0;
	}
	if ((self.playerclass == BOT_AI_FLEE))
	{
		if ((self.action != BOT_DEFEND))
		{
			if ((self.position == 0))
			{
				self.position = BOT_RAMPROOM;
			}
			return;
		}
		eTemp = findradius ('-1245 -2685 28', 250);
		while (eTemp)
		{
			if (((eTemp.classname == "player") && (eTemp.team_no != self.team_no)))
			{
				self.position = BOT_TOP_ELEV;
				if ((self.action == BOT_DEFEND))
				{
					self.action = BOT_IDLE;
				}
				return;
			}
			eTemp = eTemp.chain;
		}
		if ((self.position != BOT_RAMPROOM))
		{
			self.action = BOT_IDLE;
		}
		self.position = BOT_RAMPROOM;
	}
	if ((self.playerclass == BOT_AI_BLAST))
	{
		if ((self.action != BOT_DEFEND))
		{
			if ((self.position == 0))
			{
				self.position = BOT_TOP_SPIRAL;
			}
			return;
		}
		eTemp = findradius ('60 -2430 -228', 250);
		while (eTemp)
		{
			if (((eTemp.classname == "player") && (eTemp.team_no != self.team_no)))
			{
				self.position = BOT_BOTTOM_SPIRAL;
				if ((self.action == BOT_DEFEND))
				{
					self.action = BOT_IDLE;
				}
				return;
			}
			eTemp = eTemp.chain;
		}
		if ((self.position != BOT_TOP_SPIRAL))
		{
			self.action = BOT_IDLE;
		}
		self.position = BOT_TOP_SPIRAL;
	}
	if ((self.playerclass == BOT_DEFEND))
	{
		self.position = 0;
	}
	if ((self.playerclass == BOT_AI_FLAGRUN))
	{
		if (self.has_sentry)
		{
			botSentry = find (world, classname, "building_sentrygun");
			while (botSentry)
			{
				if ((botSentry.real_owner == self))
				{
					if ((botSentry.health < botSentry.max_health))
					{
						if ((self.action == BOT_DEFEND))
						{
							self.action = BOT_IDLE;
						}
						self.position = BOT_FLAGROOM;
						return;
					}
					if ((botSentry.weapon < BOT_AI_FOLLOW))
					{
						if ((self.ammo_cells < 130))
						{
							GoForResupply ();
							return;
						}
						else
						{
							if ((self.action == BOT_DEFEND))
							{
								self.action = BOT_IDLE;
							}
							self.position = BOT_FLAGROOM;
							return;
						}
					}
					if ((botSentry.ammo_shells < (botSentry.maxammo_shells * 0.5)))
					{
						if ((self.ammo_shells > BOT_AI_SCOUT))
						{
							if ((self.action == BOT_DEFEND))
							{
								self.action = BOT_IDLE;
							}
							self.position = BOT_FLAGROOM;
							return;
						}
					}
					if ((botSentry.weapon == BOT_AI_FOLLOW))
					{
						if ((botSentry.ammo_rockets < (botSentry.maxammo_rockets * 0.5)))
						{
							if ((self.ammo_rockets > BOT_AI_SCOUT))
							{
								if ((self.action == BOT_DEFEND))
								{
									self.action = BOT_IDLE;
								}
								self.position = BOT_FLAGROOM;
								return;
							}
							else
							{
								GoForResupply ();
								return;
							}
						}
					}
				}
				botSentry = find (botSentry, classname, "building_sentrygun");
			}
			if (((self.action == BOT_DEFEND) && (self.position != BOT_BASEMENT)))
			{
				self.action = BOT_IDLE;
			}
			self.position = BOT_BASEMENT;
		}
		else
		{
			if ((self.ammo_cells < 130))
			{
				GoForResupply ();
				return;
			}
			else
			{
				if ((self.action == BOT_DEFEND))
				{
					self.action = BOT_IDLE;
				}
				self.position = BOT_FLAGROOM;
				return;
			}
		}
	}
};

void () ScoutDefend =
{
	ReloadWeapons ();
};

void () SniperDefend =
{
	ReloadWeapons ();
};

void () SoldierDefend =
{
	ReloadWeapons ();
};

void () DemoDefend =
{
	local entity eTemp;
	local float pipeCount;

	pipeCount = 0;
	self.current_weapon = FL_WATERJUMP;
	self.weaponmode = 1;
	eTemp = findradius (self.origin, 750);
	while (eTemp)
	{
		if (((eTemp.classname == "pipebomb") && (eTemp.owner == self)))
		{
			pipeCount = (pipeCount + 1);
			self.pipeLocation = eTemp.origin;
			if ((pipeCount > BOT_AI_GRAPPLE))
			{
				self.has_sentry = 1;
				self.button0 = 0;
				return;
			}
			else
			{
				self.has_sentry = 0;
			}
		}
		eTemp = eTemp.chain;
	}
	if ((self.has_sentry == 1))
	{
		ReloadWeapons ();
		return;
	}
	if (!AtLocation ('-430 -2150 -428'))
	{
		self.botDirection = '0 -180 0';
		MoveToLocation ('-430 -2150 -428');
		return;
	}
	self.button0 = 1;
};

void () MedicDefend =
{
	ReloadWeapons ();
};

void () HwguyDefend =
{
	ReloadWeapons ();
};

void () PyroDefend =
{
	ReloadWeapons ();
};

void () SpyDefend =
{
	ReloadWeapons ();
};

void () EngyDefend =
{
	local entity botSentry;

	ReloadWeapons ();
	if (self.is_building)
	{
		return;
	}
	if (!InBlueFlagRoom)
	{
		return;
	}
	if ((self.has_sentry == 1))
	{
		botSentry = find (world, classname, "building_sentrygun");
		while (botSentry)
		{
			if ((botSentry.real_owner == self))
			{
				if ((botSentry.health < botSentry.max_health))
				{
					if ((self.ammo_cells < BOT_AI_GRAPPLE))
					{
						GoForResupply ();
						return;
					}
					HitWithSpanner (botSentry.origin);
					self.nextimpulse = BOT_AI_FOLLOW;
					return;
				}
				if ((botSentry.ammo_shells < (botSentry.maxammo_shells * 0.5)))
				{
					if ((self.ammo_shells > BOT_AI_SCOUT))
					{
						HitWithSpanner (botSentry.origin);
						self.nextimpulse = 1;
						return;
					}
					else
					{
						GoForResupply ();
						return;
					}
				}
				if ((botSentry.weapon < BOT_AI_FOLLOW))
				{
					if ((self.ammo_cells < 130))
					{
						GoForResupply ();
						return;
					}
					else
					{
						HitWithSpanner (botSentry.origin);
						self.nextimpulse = BOT_FIGHTING;
						return;
					}
				}
				if ((botSentry.weapon == BOT_AI_FOLLOW))
				{
					if ((botSentry.ammo_rockets < (botSentry.maxammo_rockets * 0.5)))
					{
						if ((self.ammo_rockets > BOT_AI_SCOUT))
						{
							HitWithSpanner (botSentry.origin);
							self.nextimpulse = 1;
							return;
						}
						else
						{
							GoForResupply ();
							return;
						}
					}
				}
			}
			botSentry = find (botSentry, classname, "building_sentrygun");
		}
	}
	else
	{
		if ((self.ammo_cells < 130))
		{
			GoForResupply ();
			return;
		}
		if ((vlen ((self.origin - GUN_FLAGROOM)) > 25))
		{
			MoveToLocation (GUN_FLAGROOM);
			return;
		}
		self.v_angle = '0 -45 0';
		self.keys = 0;
		self.impulse = 179;
		self.nextimpulse = BOT_FIGHTING;
	}
};

void () DefendAction =
{
	if ((self.playerclass > BOT_AI_GRAPPLE))
	{
		if ((self.playerclass > BOT_AI_BLAST))
		{
			if ((self.playerclass == BOT_DEFEND))
			{
				SpyDefend ();
			}
			else
			{
				EngyDefend ();
			}
		}
		else
		{
			if ((self.playerclass == BOT_AI_FLEE))
			{
				HwguyDefend ();
			}
			else
			{
				PyroDefend ();
			}
		}
	}
	else
	{
		if ((self.playerclass > BOT_AI_FOLLOW))
		{
			if ((self.playerclass == BOT_MOVING))
			{
				DemoDefend ();
			}
			else
			{
				MedicDefend ();
			}
		}
		else
		{
			if ((self.playerclass == PC_SCOUT))
			{
				ScoutDefend ();
			}
			else
			{
				if ((self.playerclass == BOT_FIGHTING))
				{
					SniperDefend ();
				}
				else
				{
					SoldierDefend ();
				}
			}
		}
	}
};

void () DefendRampRoom =
{
	local float fTemp;

	ClearAllWaypoints ();
	fTemp = random ();
	if ((fTemp < 0.25))
	{
		self.oldAction = BOT_DEFEND;
		self.action = BOT_MOVING;
		self.botDirection = '30.3 142 0';
		self.waypoint1 = '-835 -2310 24';
	}
	else
	{
		if ((fTemp < 0.5))
		{
			self.oldAction = BOT_DEFEND;
			self.action = BOT_MOVING;
			self.botDirection = '13.1 61.4 0';
			self.waypoint1 = '-805 -2355 24';
			self.waypoint2 = '-924.6 -2340 -5.2';
			self.waypoint3 = '-1003 -2320.8 -25.1';
		}
		else
		{
			if ((fTemp < 0.75))
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '27.2 -28 0';
				self.waypoint1 = '-770 -1765 24';
				self.waypoint2 = '-915 -1764 4.3';
				self.waypoint3 = '-1104 -1773.6 -91.3';
				self.waypoint4 = '-1030.1 -1812.8 -53.9';
			}
			else
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '16.2 48.4 0';
				self.waypoint1 = '-840 -2060 24';
				self.waypoint2 = '-1200 -2060 24';
				self.waypoint3 = '-1280 -2060 24';
				self.waypoint4 = '-1240 -2340 24';
			}
		}
	}
};

void () DefendTopSpiral =
{
	local float fTemp;

	ClearAllWaypoints ();
	fTemp = random ();
	if ((fTemp < 0.25))
	{
		self.oldAction = BOT_DEFEND;
		self.action = BOT_MOVING;
		self.botDirection = '0 0 0';
		self.waypoint1 = '-425 -1785 24';
	}
	else
	{
		if ((fTemp < 0.5))
		{
			self.oldAction = BOT_DEFEND;
			self.action = BOT_MOVING;
			self.botDirection = '0 180 0';
			self.waypoint1 = '-435 -1965 24';
			self.waypoint2 = '-435 -2051.1 16.7';
			self.waypoint3 = '-440 -2480 -72';
			self.waypoint4 = '-219.3 -2480 -120.1';
			self.waypoint5 = '-289.3 -2460.3 -93.1';
		}
		else
		{
			if ((fTemp < 0.75))
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '0 -90 0';
				self.waypoint1 = '-290 -1764 24';
				self.waypoint2 = '-290 -1700 24';
				self.waypoint3 = '-190 -1550 24';
			}
			else
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '0 90 0';
				self.waypoint1 = '-310 -1925 24';
			}
		}
	}
};

void () DefendBottomElev =
{
	local float fTemp;

	ClearAllWaypoints ();
	fTemp = random ();
	if ((fTemp < 0.25))
	{
		self.oldAction = BOT_DEFEND;
		self.action = BOT_MOVING;
		self.botDirection = '0 125 0';
		self.waypoint1 = '-1050 -3465 -428';
		self.waypoint2 = '-1010 -3545 -428';
	}
	else
	{
		if ((fTemp < 0.5))
		{
			self.oldAction = BOT_DEFEND;
			self.action = BOT_MOVING;
			self.botDirection = '0 160 0';
			self.waypoint1 = '-830 -3410 -428';
		}
		else
		{
			if ((fTemp < 0.75))
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '0 90 0';
				self.waypoint1 = '-1220 -3280 -428';
				self.waypoint2 = '-1220 -3200 -428';
				self.waypoint3 = '-1265 -3150 -428';
			}
			else
			{
				self.oldAction = BOT_DEFEND;
				self.action = BOT_MOVING;
				self.botDirection = '0 90 0';
				self.waypoint1 = '-1210 -3460 -428';
			}
		}
	}
};

void () DefendBasement =
{
	local float fTemp;

	ClearAllWaypoints ();
	fTemp = random ();
	if ((fTemp < 0.3))
	{
		self.oldAction = BOT_DEFEND;
		self.action = BOT_MOVING;
		self.botDirection = '0 90 0';
		self.waypoint1 = '-475 -2900 -428';
		self.waypoint2 = '-470 -3020 -428';
		self.waypoint3 = '-470 -2990 -428';
	}
	else
	{
		if ((fTemp < 0.6))
		{
			self.oldAction = BOT_DEFEND;
			self.action = BOT_MOVING;
			self.botDirection = '0 -45 0';
			self.waypoint1 = '-620 -2450 -428';
		}
		else
		{
			self.oldAction = BOT_DEFEND;
			self.action = BOT_MOVING;
			self.botDirection = '0 -113 0';
			self.waypoint1 = '-520 -2725 -428';
		}
	}
};
