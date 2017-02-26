//=-=-=-=-=
float (float tno) num_team_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		return (num_team_ammoboxes_1);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			return (num_team_ammoboxes_2);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				return (num_team_ammoboxes_3);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					return (num_team_ammoboxes_4);
				}
				else
				{
					return (num_world_ammoboxes);
				}
			}
		}
	}
};

void (float tno) increment_num_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 + SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 + SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 + SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 + SBAR_GRENS);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes + SBAR_GRENS);
				}
			}
		}
	}
};

void (float tno) decrement_num_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 - SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 - SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 - SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 - SBAR_GRENS);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes - SBAR_GRENS);
				}
			}
		}
	}
};

void () TeamFortress_AmmoboxThink =
{
	decrement_num_ammoboxes (self.team_no);
	dremove (self);
};

void (float tno) RemoveOldAmmobox =
{
	local entity box;
	local entity eold;
	local float rt;

	rt = (time + 999);
	box = find (world, classname, "ammobox");
	while ((box != world))
	{
		if (((box.nextthink < rt) && ((box.team_no == tno) || (tno == 0))))
		{
			eold = box;
			rt = box.nextthink;
		}
		box = find (box, classname, "ammobox");
	}
	if ((eold == world))
	{
		return;
	}
	decrement_num_ammoboxes (eold.team_no);
	dremove (eold);
};

void () TeamFortress_AmmoboxTouch =
{
	local float took;
	local string quantity;

	took = SBAR_GRENS;
	if (((other == self.enemy) && (time < (self.health + SBAR_PRINT))))
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= 0))
	{
		return;
	}
	if ((self.weapon == 0))
	{
		sprint (other, SBAR_PRINT, "You got ");
		if ((self.ammo_shells > 0))
		{
			other.ammo_shells = (other.ammo_shells + self.ammo_shells);
			quantity = ftos (self.ammo_shells);
			sprint (other, SBAR_PRINT, quantity, " shells  ");
		}
		if ((self.ammo_nails > 0))
		{
			other.ammo_nails = (other.ammo_nails + self.ammo_nails);
			quantity = ftos (self.ammo_nails);
			sprint (other, SBAR_PRINT, quantity, " nails  ");
		}
		if ((self.ammo_rockets > 0))
		{
			other.ammo_rockets = (other.ammo_rockets + self.ammo_rockets);
			quantity = ftos (self.ammo_rockets);
			sprint (other, SBAR_PRINT, quantity, " rockets  ");
		}
		if ((self.ammo_cells > 0))
		{
			other.ammo_cells = (other.ammo_cells + self.ammo_cells);
			quantity = ftos (self.ammo_cells);
			sprint (other, SBAR_PRINT, quantity, " cells  ");
		}
		sprint (other, SBAR_PRINT, " from ", self.enemy.netname, "'s discarded pack.\n");
	}
	else
	{
		if ((self.weapon == SBAR_GRENS))
		{
			if ((other.ammo_shells >= other.maxammo_shells))
			{
				return;
			}
			other.ammo_shells = (other.ammo_shells + self.ammo_shells);
			if ((other.ammo_shells > other.maxammo_shells))
			{
				self.ammo_shells = (other.ammo_shells - other.maxammo_shells);
				took = 0;
			}
			self.netname = "shell";
		}
		else
		{
			if ((self.weapon == SBAR_PRINT))
			{
				if ((other.ammo_nails >= other.maxammo_nails))
				{
					return;
				}
				other.ammo_nails = (other.ammo_nails + self.aflag);
				if ((other.ammo_nails > other.maxammo_nails))
				{
					self.ammo_nails = (other.ammo_nails - other.maxammo_nails);
					took = 0;
				}
				self.netname = "nail";
			}
			else
			{
				if ((self.weapon == AS_MELEE))
				{
					if ((other.ammo_rockets >= other.maxammo_rockets))
					{
						return;
					}
					other.ammo_rockets = (other.ammo_rockets + self.aflag);
					if ((other.ammo_rockets > other.maxammo_rockets))
					{
						self.ammo_rockets = (other.ammo_rockets - other.maxammo_rockets);
						took = 0;
					}
					self.netname = "rocket";
				}
				else
				{
					if ((self.weapon == AS_MISSILE))
					{
						if ((other.ammo_cells >= other.maxammo_cells))
						{
							return;
						}
						other.ammo_cells = (other.ammo_cells + self.ammo_cells);
						if ((other.ammo_cells > other.maxammo_cells))
						{
							self.ammo_cells = (other.ammo_cells - other.maxammo_cells);
							took = 0;
						}
						self.netname = "cell";
					}
					else
					{
						if ((self.weapon == 5))
						{
							if (((other.no_grenades_1 >= AS_MISSILE) || (other.tp_grenades_1 != self.tp_grenades_1)))
							{
								return;
							}
							other.no_grenades_1 = (other.no_grenades_1 + self.no_grenades_1);
							self.netname = Status_GrenTypeToString (self.tp_grenades_1);
						}
						else
						{
							if ((self.weapon == 6))
							{
								if ((((other.no_grenades_2 >= AS_MISSILE) || ((other.no_grenades_2 >= SBAR_PRINT) && (other.tp_grenades_2 == AS_MELEE))) || (other.tp_grenades_2 != self.tp_grenades_2)))
								{
									return;
								}
								other.no_grenades_2 = (other.no_grenades_2 + self.no_grenades_2);
								self.netname = Status_GrenTypeToString (self.tp_grenades_2);
							}
							else
							{
								if ((self.weapon == enter))
								{
									if (!(other.items_allowed & 131072))
									{
										return;
									}
									if ((other.ammo_detpack >= other.maxammo_detpack))
									{
										return;
									}
									other.ammo_detpack = (other.ammo_detpack + self.ammo_detpack);
									if ((other.ammo_detpack > other.maxammo_detpack))
									{
										self.ammo_detpack = (other.ammo_detpack - other.maxammo_detpack);
										took = 0;
									}
									if (tfstrike)
									{
										self.netname = "Bomb";
										bprint2 (SBAR_PRINT, other.netname, " picked up the bomb.\n");
										stuffcmd (other, "topcolor 0\n");
										if ((other.playerclass == 8))
										{
											other.is_unabletospy = SBAR_GRENS;
										}
									}
									else
									{
										self.netname = "detpack";
									}
								}
							}
						}
					}
				}
			}
		}
	}
	bound_other_ammo (other);
	if ((self.weapon > 0))
	{
		quantity = ftos (self.aflag);
		sprint (other, 0, "You picked up ", quantity, " ", self.netname);
		if ((self.aflag != SBAR_GRENS))
		{
			sprint (other, 0, "s");
		}
		sprint (other, 0, "\n");
	}
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	if (took)
	{
		decrement_num_ammoboxes (self.team_no);
		dremove (self);
	}
	self = other;
	W_SetCurrentAmmo ();
};

void (float type) TeamFortress_DropAmmo =
{
	local float ammo;

	self.impulse = 0;
	if ((type == SBAR_GRENS))
	{
		ammo = 20;
		if ((self.ammo_shells < ammo))
		{
			if ((self.playerclass == 9))
			{
				if (((self.ammo_cells / AS_MELEE) > (ammo - self.ammo_shells)))
				{
					sprint (self, SBAR_PRINT, "you make some shells.\n");
					self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_shells) * AS_MELEE));
					self.ammo_shells = ammo;
				}
			}
			if ((self.ammo_shells < ammo))
			{
				return;
			}
		}
		self.ammo_shells = (self.ammo_shells - ammo);
	}
	else
	{
		if ((type == SBAR_PRINT))
		{
			ammo = 20;
			if ((self.ammo_nails < ammo))
			{
				if ((self.playerclass == 9))
				{
					if (((self.ammo_cells / SBAR_PRINT) > (ammo - self.ammo_nails)))
					{
						sprint (self, SBAR_PRINT, "you make some nails.\n");
						self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_nails) * SBAR_PRINT));
						self.ammo_nails = ammo;
					}
				}
				if ((self.ammo_nails < ammo))
				{
					return;
				}
			}
			self.ammo_nails = (self.ammo_nails - ammo);
		}
		else
		{
			if ((type == AS_MELEE))
			{
				ammo = enter;
				if ((self.ammo_rockets < ammo))
				{
					if ((self.playerclass == 9))
					{
						if (((self.ammo_cells / 5) > (ammo - self.ammo_rockets)))
						{
							sprint (self, SBAR_PRINT, "you make some rockets.\n");
							self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_rockets) * 5));
							self.ammo_rockets = ammo;
						}
					}
					if ((self.ammo_rockets < ammo))
					{
						return;
					}
				}
				self.ammo_rockets = (self.ammo_rockets - ammo);
			}
			else
			{
				if ((type == AS_MISSILE))
				{
					ammo = enter;
					if ((self.ammo_cells < ammo))
					{
						return;
					}
					self.ammo_cells = (self.ammo_cells - ammo);
				}
				else
				{
					if ((type == 5))
					{
						ammo = SBAR_GRENS;
						if ((self.no_grenades_1 < SBAR_GRENS))
						{
							return;
						}
						self.no_grenades_1 = (self.no_grenades_1 - SBAR_GRENS);
					}
					else
					{
						if ((type == 6))
						{
							ammo = SBAR_GRENS;
							if ((self.no_grenades_2 < SBAR_GRENS))
							{
								return;
							}
							self.no_grenades_2 = (self.no_grenades_2 - SBAR_GRENS);
						}
					}
				}
			}
		}
	}
	W_SetCurrentAmmo ();
	increment_num_ammoboxes (self.team_no);
	if ((num_team_ammoboxes (self.team_no) > (num_max_ammoboxes / number_of_teams)))
	{
		RemoveOldAmmobox (self.team_no);
	}
	newmis = spawn ();
	newmis.aflag = ammo;
	newmis.weapon = type;
	if ((newmis.weapon == SBAR_GRENS))
	{
		newmis.ammo_shells = ammo;
	}
	else
	{
		if ((newmis.weapon == SBAR_PRINT))
		{
			newmis.ammo_nails = ammo;
		}
		else
		{
			if ((newmis.weapon == AS_MELEE))
			{
				newmis.ammo_rockets = ammo;
			}
			else
			{
				if ((newmis.weapon == AS_MISSILE))
				{
					newmis.ammo_cells = ammo;
				}
				else
				{
					if ((newmis.weapon == 5))
					{
						newmis.no_grenades_1 = ammo;
						newmis.tp_grenades_1 = self.tp_grenades_1;
					}
					else
					{
						if ((newmis.weapon == 6))
						{
							newmis.no_grenades_2 = ammo;
							newmis.tp_grenades_2 = self.tp_grenades_2;
						}
					}
				}
			}
		}
	}
	newmis.enemy = self;
	newmis.health = time;
	newmis.movetype = 6;
	newmis.solid = SBAR_GRENS;
	newmis.classname = "ammobox";
	newmis.team_no = self.team_no;
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '0 300 0';
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 20);
	newmis.think = TeamFortress_AmmoboxThink;
	newmis.touch = TeamFortress_AmmoboxTouch;
	newmis.skin = (type - SBAR_GRENS);
	if ((newmis.skin > AS_MELEE))
	{
		newmis.skin = SBAR_PRINT;
	}
	setmodel (newmis, "progs/ammobox.mdl");
};

void () Drop_detpack =
{
	local entity te;
	local string st;
	local float tc;

	if (!self.ammo_detpack)
	{
		return;
	}
	if (!self.playerclass)
	{
		return;
	}
	self.ammo_detpack = (self.ammo_detpack - SBAR_GRENS);
	if (tfstrike)
	{
		if ((self.team_no == SBAR_PRINT))
		{
			stuffcmd (self, "topcolor ");
			tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
			st = ftos (tc);
			stuffcmd (self, st);
			stuffcmd (self, "\n");
		}
		self.is_unabletospy = 0;
	}
	newmis = spawn ();
	newmis.health = time;
	newmis.ammo_detpack = SBAR_GRENS;
	newmis.weapon = enter;
	newmis.team_no = self.team_no;
	newmis.angles = '90 0 0';
	newmis.solid = SBAR_GRENS;
	newmis.movetype = 6;
	newmis.enemy = self;
	newmis.classname = "ammobox";
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '0 300 0';
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	if (!tfstrike)
	{
		newmis.think = TeamFortress_AmmoboxThink;
		newmis.nextthink = (time + 30);
	}
	else
	{
		if (round_active)
		{
			bprint2 (SBAR_PRINT, self.netname, " dropped the bomb!\n");
		}
	}
	newmis.touch = TeamFortress_AmmoboxTouch;
	setmodel (newmis, "progs/detpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 8');
};

void () TeamFortress_Discard =
{
	local float i;
	local string st;

	newmis = spawn ();
	if ((self.playerclass == SBAR_GRENS))
	{
		newmis.ammo_rockets = self.ammo_rockets;
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			newmis.ammo_rockets = self.ammo_rockets;
			newmis.ammo_cells = self.ammo_cells;
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				newmis.ammo_cells = self.ammo_cells;
				newmis.ammo_nails = self.ammo_nails;
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					newmis.ammo_cells = self.ammo_cells;
					newmis.ammo_nails = self.ammo_nails;
				}
				else
				{
					if ((self.playerclass == 5))
					{
						newmis.ammo_rockets = self.ammo_rockets;
						newmis.ammo_cells = self.ammo_cells;
					}
					else
					{
						if ((self.playerclass == 6))
						{
							newmis.ammo_rockets = self.ammo_rockets;
							newmis.ammo_nails = self.ammo_nails;
						}
						else
						{
							if ((self.playerclass == 7))
							{
								newmis.ammo_nails = self.ammo_nails;
							}
							else
							{
								if ((self.playerclass == 8))
								{
									newmis.ammo_rockets = self.ammo_rockets;
									newmis.ammo_cells = self.ammo_cells;
								}
								else
								{
									if ((self.playerclass == 9))
									{
										newmis.ammo_rockets = self.ammo_rockets;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if (!(((newmis.ammo_shells + newmis.ammo_nails) + (newmis.ammo_rockets * SBAR_PRINT)) + (newmis.ammo_cells * SBAR_PRINT)))
	{
		dremove (newmis);
		return;
	}
	self.ammo_shells = (self.ammo_shells - newmis.ammo_shells);
	self.ammo_nails = (self.ammo_nails - newmis.ammo_nails);
	self.ammo_rockets = (self.ammo_rockets - newmis.ammo_rockets);
	self.ammo_cells = (self.ammo_cells - newmis.ammo_cells);
	W_SetCurrentAmmo ();
	sound (self, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	increment_num_ammoboxes (self.team_no);
	if ((num_team_ammoboxes (self.team_no) > (num_max_ammoboxes / number_of_teams)))
	{
		RemoveOldAmmobox (self.team_no);
	}
	newmis.enemy = self;
	newmis.health = time;
	newmis.weapon = 0;
	newmis.movetype = 6;
	newmis.solid = SBAR_GRENS;
	newmis.classname = "ammobox";
	newmis.team_no = self.team_no;
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 30);
	newmis.think = TeamFortress_AmmoboxThink;
	newmis.touch = TeamFortress_AmmoboxTouch;
	setmodel (newmis, "progs/backpack.mdl");
};

void () Ammobox_Explode =
{
	local float expsize;

	expsize = (((self.ammo_shells * 0.75) + (self.ammo_rockets * 1.5)) + (self.ammo_cells * 1.5));
	if ((expsize > 0))
	{
		self.solid = 0;
		deathmsg = 30;
		T_RadiusDamage (self.enemy, self.enemy.owner, expsize, self);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	TeamFortress_AmmoboxThink ();
};
