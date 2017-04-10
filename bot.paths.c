
void (float CurrentArea) GotoBlueMainResupply =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_RESPAWN_FRONT))
	{
		self.waypoint1 = '-1325 -1450 24';
	}
	else
	{
		if ((CurrentArea == BLUE_MAIN_RESPAWN))
		{
			self.waypoint1 = '-1600 -1450 24';
			self.waypoint2 = '-1300 -1450 24';
		}
		else
		{
			if ((CurrentArea == BLUE_MAIN_RESUPPLY_IN))
			{
				self.waypoint1 = '-1600 -1160 24';
			}
			else
			{
				self.action = BOT_IDLE;
				return;
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueMainResupplyIn =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_ROOM))
	{
		self.waypoint1 = '-844 -1625 24';
		self.waypoint2 = '-910 -1625 24';
	}
	else
	{
		self.action = BOT_IDLE;
		return;
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueMainRoom =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_RESUPPLY))
	{
		self.waypoint1 = '-1135 -1480 24';
		self.waypoint2 = '-790 -1480 24';
	}
	else
	{
		if ((CurrentArea == BLUE_TOP_GRATE))
		{
			self.waypoint1 = '-135 -1630 8';
			self.waypoint2 = '-350 -1630 24';
		}
		else
		{
			if ((CurrentArea == BLUE_TOP_SPIRAL))
			{
				self.waypoint1 = '-290 -1764 24';
				self.waypoint2 = '-290 -1700 24';
			}
			else
			{
				if ((CurrentArea == BLUE_TOP_RAMP))
				{
					self.waypoint1 = '-740 -1670 24';
				}
				else
				{
					if ((CurrentArea == BLUE_MAIN_RESUPPLY_IN))
					{
						self.waypoint1 = '-800 -1640 24';
					}
					else
					{
						if ((CurrentArea == BLUE_MAIN_RESUPPLY_OUT))
						{
							self.waypoint1 = '-790 -1480 24';
						}
						else
						{
							self.action = BOT_IDLE;
							return;
						}
					}
				}
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTopGrate =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_ROOM))
	{
		self.waypoint1 = '-230 -1650 24';
		self.waypoint2 = '-75 -1650 8';
	}
	else
	{
		self.action = BOT_IDLE;
		return;
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTopSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_ROOM))
	{
		self.waypoint1 = '-318 -1700 24';
		self.waypoint2 = '-318 -1900 24';
	}
	else
	{
		if ((CurrentArea == BLUE_1ST_SPIRAL))
		{
			self.waypoint1 = '-385 -1940 24';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTopRamp =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_MAIN_ROOM))
	{
		self.waypoint1 = '-775 -1660 24';
		self.waypoint2 = '-825 -1810 24';
	}
	else
	{
		if ((CurrentArea == BLUE_SHORT_RAMP))
		{
			self.waypoint1 = '-825 -1795 24';
		}
		else
		{
			if ((CurrentArea == BLUE_UPPER_LONG_RAMP))
			{
				self.waypoint1 = '-800 -2350 24';
			}
			else
			{
				if ((CurrentArea == BLUE_1ST_CATWALK))
				{
					self.waypoint1 = '-775 -2100 24';
				}
				else
				{
					self.action = BOT_IDLE;
					return;
				}
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueSniperResupply =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_SNIPER_RESPAWN_FRONT))
	{
		self.waypoint1 = '1092 -2025 -4';
	}
	else
	{
		if ((CurrentArea == BLUE_SNIPER_RESPAWN))
		{
			self.waypoint1 = '1413 -2025 -4';
			self.waypoint2 = '1092 -2025 -4';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTunnelToWaterLobby =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_SNIPER_RESUPPLY))
	{
		self.waypoint1 = '1000 -2100 -4';
		self.waypoint2 = '280 -2080 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_SNIPER_RESUPPLY_TO_RR))
		{
			self.waypoint1 = '280 -2080 -152';
		}
		else
		{
			if ((CurrentArea == BLUE_TOP_WATER_LOBBY))
			{
				self.waypoint1 = '235 -1630 -152';
				self.waypoint2 = '235 -1730 -152';
			}
			else
			{
				self.action = BOT_IDLE;
				return;
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueFirstCatwalk =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TOP_RAMP))
	{
		self.waypoint1 = '-840 -2060 24';
		self.waypoint2 = '-1200 -2060 24';
	}
	else
	{
		if ((CurrentArea == BLUE_2ND_CATWALK))
		{
			self.waypoint1 = '-1245 -2085 24';
			self.waypoint2 = '-1175 -2085 24';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueSecondCatwalk =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_1ST_CATWALK))
	{
		self.waypoint1 = '-1280 -2060 24';
	}
	else
	{
		if ((CurrentArea == BLUE_TOP_ELEV))
		{
			self.waypoint1 = '-1255 -2425 28';
			self.waypoint2 = '-1255 -2330 24';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTopElev =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_2ND_CATWALK))
	{
		self.waypoint1 = '-1275 -2452 28';
	}
	else
	{
		if ((CurrentArea == BLUE_BOTTOM_ELEV))
		{
			self.waypoint1 = '-1210 -2750 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueRRFloor =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TUNNEL_TO_RR))
	{
		self.waypoint1 = '-765 -2075 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_RR_LOBBY))
		{
			self.waypoint1 = '-790 -1700 -152';
			self.waypoint2 = '-790 -1950 -152';
		}
		else
		{
			if ((CurrentArea == BLUE_BOTTOM_RAMPS))
			{
				self.waypoint1 = '-1145 0 -152';
				self.waypoint1_y = self.origin_y;
			}
			else
			{
				if ((CurrentArea == BLUE_UNDER_SHORT_RAMP))
				{
					self.waypoint1 = '-1000 -1765 -152';
					self.waypoint2 = '-1000 -1850 -152';
				}
				else
				{
					if ((CurrentArea == BLUE_UNDER_LONG_RAMP))
					{
						self.waypoint1 = '-1275 -2350 -152';
						self.waypoint2 = '-1200 -2350 -152';
					}
					else
					{
						self.action = BOT_IDLE;
						return;
					}
				}
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBottomRamps =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_RAMP_ROOM_FLOOR))
	{
		self.waypoint1 = '-1255 -1950 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_BOTTOM_SHORT_RAMP))
		{
			self.waypoint1 = '-1280 -1835 -152';
		}
		else
		{
			if ((CurrentArea == BLUE_LOWER_LONG_RAMP))
			{
				self.waypoint1 = '-1280 -2070 -152';
			}
			else
			{
				self.action = BOT_IDLE;
				return;
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBottomShortRamp =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BOTTOM_RAMPS))
	{
		self.waypoint1 = '-1240 -1790 -152';
		self.waypoint2 = '-1250 -1790 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_SHORT_RAMP))
		{
			self.waypoint1 = '-1280 -1780 -152';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueShortRamp =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BOTTOM_SHORT_RAMP))
	{
		self.waypoint1 = '-1150 -1790 -114.6';
	}
	else
	{
		if ((CurrentArea == BLUE_TOP_RAMP))
		{
			self.waypoint1 = '-770 -1765 24';
			self.waypoint2 = '-915 -1764 4.3';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueLowerLongRamp =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BOTTOM_RAMPS))
	{
		self.waypoint1 = '-1275 -2227.9 -108.7';
	}
	else
	{
		if ((CurrentArea == BLUE_UPPER_LONG_RAMP))
		{
			self.waypoint1 = '-1234 -2339.3 -72';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueUpperLongRamp =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_LOWER_LONG_RAMP))
	{
		self.waypoint1 = '-1275 -2350 -72';
		self.waypoint2 = '-1140 -2350 -72';
	}
	else
	{
		if ((CurrentArea == BLUE_TOP_RAMP))
		{
			self.waypoint1 = '-805 -2355 24';
			self.waypoint2 = '-924.6 -2340 -5.2';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueRRLobby =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_RAMP_ROOM_FLOOR))
	{
		self.waypoint1 = '-755 -1765 -152';
		self.waypoint2 = '-720 -1670 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_BOTTOM_GRATE))
		{
			self.waypoint1 = '-90 -1575 -152';
			self.waypoint2 = '-260 -1575 -152';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTopWaterLobby =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TUNNEL_TO_WATER_LOBBY))
	{
		self.waypoint1 = '285 -1615 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_BOTTOM_GRATE))
		{
			self.waypoint1 = '70 -1575 -152';
			self.waypoint2 = '150 -1575 -152';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTunnelToRR =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_RAMP_ROOM_FLOOR))
	{
		self.waypoint1 = '-728 -2135 -152';
		self.waypoint2 = '-650 -2135 -152';
	}
	else
	{
		if ((CurrentArea == BLUE_TUNNEL_TO_WATER_LOBBY))
		{
			self.waypoint1 = '-235 -2100 -152';
			self.waypoint2 = '-150 -2100 -152';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBottomGrate =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TOP_GRATE))
	{
		self.waypoint1 = '-15 -1300 -152';
	}
	else
	{
		self.action = BOT_IDLE;
		return;
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlue1stSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TOP_SPIRAL))
	{
		self.waypoint1 = '-435 -1965 24';
		self.waypoint2 = '-435 -2051.1 16.7';
	}
	else
	{
		if ((CurrentArea == BLUE_2ND_SPIRAL))
		{
			self.waypoint1 = '-410 -2440 -72';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlue2ndSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_1ST_SPIRAL))
	{
		self.waypoint1 = '-415 -2480 -72';
		self.waypoint2 = '-219.3 -2480 -120.1';
	}
	else
	{
		if ((CurrentArea == BLUE_3RD_SPIRAL))
		{
			self.waypoint1 = '95 -2460 -228';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlue3rdSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_2ND_SPIRAL))
	{
		self.waypoint1 = '95 -2500 -228';
		self.waypoint2 = '95 -2320.2 -262.3';
	}
	else
	{
		if ((CurrentArea == BLUE_4TH_SPIRAL))
		{
			self.waypoint1 = '90 -2180 -324';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlue4thSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_3RD_SPIRAL))
	{
		self.waypoint1 = '100 -2135 -324';
		self.waypoint2 = '-41.8 -2125 -359.5';
	}
	else
	{
		if ((CurrentArea == BLUE_BOTTOM_SPIRAL))
		{
			self.waypoint1 = '350 -2165 -428';
			self.waypoint2 = '235 -2170 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBottomSpiral =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_4TH_SPIRAL))
	{
		self.waypoint1 = '-385 -2120 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_BASEMENT))
		{
			self.waypoint1 = '-450 -2455 -428';
			self.waypoint2 = '-440 -2300 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBasement =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BOTTOM_SPIRAL))
	{
		self.waypoint1 = '-500 -2360 -428';
		self.waypoint2 = '-535 -2500 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_ZIGZAG))
		{
			self.waypoint1 = '-600 -3010 -428';
			self.waypoint2 = '-585 -2890 -428';
		}
		else
		{
			if ((CurrentArea == BLUE_OUTER_ELEV_TUNNEL_TO_FR))
			{
				self.waypoint1 = '-445 -2890 -428';
			}
			else
			{
				if ((CurrentArea == BLUE_OUTER_SPIR_TUNNEL_TO_FR))
				{
					self.waypoint1 = '-445 -2575 -428';
				}
				else
				{
					self.action = BOT_IDLE;
					return;
				}
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueZigZag =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BASEMENT))
	{
		self.waypoint1 = '-615 -2930 -428';
		self.waypoint2 = '-630 -3040 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_BASEMENT_ELEV_SIDE))
		{
			self.waypoint1 = '-775 -3295 -428';
			self.waypoint2 = '-744 -3190 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueOuterSpirTunnelToFR =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BASEMENT))
	{
		self.waypoint1 = '-445 -2610 -428';
		self.waypoint2 = '-345 -2600 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_INNER_SPIR_TUNNEL_TO_FR))
		{
			self.waypoint1 = '310 -2565 -428';
			self.waypoint2 = '100 -2565 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueOuterElevTunnelToFR =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BASEMENT))
	{
		self.waypoint1 = '-475 -2900 -428';
		self.waypoint2 = '-470 -3020 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_INNER_ELEV_TUNNEL_TO_FR))
		{
			self.waypoint1 = '-425 -3210 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueInnerElevTunnelToFR =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_OUTER_ELEV_TUNNEL_TO_FR))
	{
		self.waypoint1 = '-470 -3265 -428';
		self.waypoint2 = '-270 -3270 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_FLAGROOM))
		{
			self.waypoint1 = '-10 -3225 -428';
			self.waypoint2 = '-110 -3215 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueInnerSpirTunnelToFR =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_OUTER_SPIR_TUNNEL_TO_FR))
	{
		self.waypoint1 = '250 -2610 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_FLAGROOM))
		{
			self.waypoint1 = '300 -3040 -428';
			self.waypoint2 = '300 -2910 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueFlagRoom =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_INNER_SPIR_TUNNEL_TO_FR))
	{
		self.waypoint1 = '225 -3070 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_INNER_ELEV_TUNNEL_TO_FR))
		{
			self.waypoint1 = '25 -3270 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBasementElevSide =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_ZIGZAG))
	{
		self.waypoint1 = '-770 -3195 -428';
		self.waypoint2 = '-770 -3320 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_BASEMENT_RESUPPLY_FRONT))
		{
			self.waypoint1 = '-975 -3460 -428';
		}
		else
		{
			if ((CurrentArea == BLUE_TUNNEL_TO_BOT_ELEV))
			{
				self.waypoint1 = '-1205 -3350 -428';
			}
			else
			{
				self.action = BOT_IDLE;
				return;
			}
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueTunnelToBotElev =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BOTTOM_ELEV))
	{
		self.waypoint1 = '-1260 -2930 -428';
		self.waypoint2 = '-1260 -3100 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_BASEMENT_ELEV_SIDE))
		{
			self.waypoint1 = '-1220 -3280 -428';
			self.waypoint2 = '-1220 -3180 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBottomElev =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_TOP_ELEV))
	{
		self.waypoint1 = '-1260 -2930 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_TUNNEL_TO_BOT_ELEV))
		{
			self.waypoint1 = '-1210 -2900 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBasementResupplyFront =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BASEMENT_ELEV_SIDE))
	{
		self.waypoint1 = '-1050 -3465 -428';
		self.waypoint2 = '-1060 -3585 -428';
	}
	else
	{
		if ((CurrentArea == BLUE_BASEMENT_RESUPPLY))
		{
			self.waypoint1 = '-975 -3835 -428';
			self.waypoint2 = '-975 -3725 -428';
		}
		else
		{
			self.action = BOT_IDLE;
			return;
		}
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};

void (float CurrentArea) GotoBlueBasementResupply =
{
	ClearAllWaypoints ();
	if ((CurrentArea == BLUE_BASEMENT_RESUPPLY_FRONT))
	{
		self.waypoint1 = '-1060 -3845 -428';
	}
	else
	{
		self.action = BOT_IDLE;
		return;
	}
	self.oldAction = self.action;
	self.action = BOT_MOVING;
	return;
};
