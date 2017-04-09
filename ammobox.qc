float (float tno) num_team_ammoboxes =
{
	if ((tno == 1))
	{
		return (num_team_ammoboxes_1);
	}
	else
	{
		if ((tno == 2))
		{
			return (num_team_ammoboxes_2);
		}
		else
		{
			if ((tno == 3))
			{
				return (num_team_ammoboxes_3);
			}
			else
			{
				if ((tno == 4))
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
	if ((tno == 1))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 + 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 + 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 + 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 + 1);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes + 1);
				}
			}
		}
	}
};

void (float tno) decrement_num_ammoboxes =
{
	if ((tno == 1))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 - 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 - 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 - 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 - 1);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes - 1);
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

	took = 1;
	if (((other == self.enemy) && (time < (self.health + 2))))
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
		sprint (other, 2, "You got ");
		if ((self.ammo_shells > 0))
		{
			other.ammo_shells = (other.ammo_shells + self.ammo_shells);
			quantity = ftos (self.ammo_shells);
			sprint (other, 2, quantity, " shells  ");
		}
		if ((self.ammo_nails > 0))
		{
			other.ammo_nails = (other.ammo_nails + self.ammo_nails);
			quantity = ftos (self.ammo_nails);
			sprint (other, 2, quantity, " nails  ");
		}
		if ((self.ammo_rockets > 0))
		{
			other.ammo_rockets = (other.ammo_rockets + self.ammo_rockets);
			quantity = ftos (self.ammo_rockets);
			sprint (other, 2, quantity, " rockets  ");
		}
		if ((self.ammo_cells > 0))
		{
			other.ammo_cells = (other.ammo_cells + self.ammo_cells);
			quantity = ftos (self.ammo_cells);
			sprint (other, 2, quantity, " cells  ");
		}
		sprint (other, 2, " from ", self.enemy.netname, "'s discarded pack.\n");
	}
	else
	{
		if ((self.weapon == 1))
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
			if ((self.weapon == 2))
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
				if ((self.weapon == 3))
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
					if ((self.weapon == 4))
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
							if (((other.no_grenades_1 >= 4) || (other.tp_grenades_1 != self.tp_grenades_1)))
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
								if ((((other.no_grenades_2 >= 4) || ((other.no_grenades_2 >= 2) && (other.tp_grenades_2 == 3))) || (other.tp_grenades_2 != self.tp_grenades_2)))
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
										bprint2 (2, other.netname, " picked up the bomb.\n");
										stuffcmd (other, "topcolor 0\n");
										if ((other.playerclass == 8))
										{
											other.is_unabletospy = 1;
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
		if ((self.aflag != 1))
		{
			sprint (other, 0, "s");
		}
		sprint (other, 0, "\n");
	}
	sound (other, 3, "weapons/lock4.wav", 1, 1);
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
	if ((type == 1))
	{
		ammo = 20;
		if ((self.ammo_shells < ammo))
		{
			if ((self.playerclass == 9))
			{
				if (((self.ammo_cells / 3) > (ammo - self.ammo_shells)))
				{
					sprint (self, 2, "you make some shells.\n");
					self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_shells) * 3));
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
		if ((type == 2))
		{
			ammo = 20;
			if ((self.ammo_nails < ammo))
			{
				if ((self.playerclass == 9))
				{
					if (((self.ammo_cells / 2) > (ammo - self.ammo_nails)))
					{
						sprint (self, 2, "you make some nails.\n");
						self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_nails) * 2));
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
			if ((type == 3))
			{
				ammo = enter;
				if ((self.ammo_rockets < ammo))
				{
					if ((self.playerclass == 9))
					{
						if (((self.ammo_cells / 5) > (ammo - self.ammo_rockets)))
						{
							sprint (self, 2, "you make some rockets.\n");
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
				if ((type == 4))
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
						ammo = 1;
						if ((self.no_grenades_1 < 1))
						{
							return;
						}
						self.no_grenades_1 = (self.no_grenades_1 - 1);
					}
					else
					{
						if ((type == 6))
						{
							ammo = 1;
							if ((self.no_grenades_2 < 1))
							{
								return;
							}
							self.no_grenades_2 = (self.no_grenades_2 - 1);
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
	if ((newmis.weapon == 1))
	{
		newmis.ammo_shells = ammo;
	}
	else
	{
		if ((newmis.weapon == 2))
		{
			newmis.ammo_nails = ammo;
		}
		else
		{
			if ((newmis.weapon == 3))
			{
				newmis.ammo_rockets = ammo;
			}
			else
			{
				if ((newmis.weapon == 4))
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
	newmis.solid = 1;
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
	newmis.skin = (type - 1);
	if ((newmis.skin > 3))
	{
		newmis.skin = 2;
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
	self.ammo_detpack = (self.ammo_detpack - 1);
	if (tfstrike)
	{
		if ((self.team_no == 2))
		{
			stuffcmd (self, "topcolor ");
			tc = (TeamFortress_TeamGetColor (self.team_no) - 1);
			st = ftos (tc);
			stuffcmd (self, st);
			stuffcmd (self, "\n");
		}
		self.is_unabletospy = 0;
	}
	newmis = spawn ();
	newmis.health = time;
	newmis.ammo_detpack = 1;
	newmis.weapon = enter;
	newmis.team_no = self.team_no;
	newmis.angles = '90 0 0';
	newmis.solid = 1;
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
			bprint2 (2, self.netname, " dropped the bomb!\n");
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
	newmis.classname = "item_backpack";
	if ((self.playerclass == 1))
	{
		newmis.ammo_rockets = self.ammo_rockets;
	}
	else
	{
		if ((self.playerclass == 2))
		{
			newmis.ammo_rockets = self.ammo_rockets;
			newmis.ammo_cells = self.ammo_cells;
		}
		else
		{
			if ((self.playerclass == 3))
			{
				newmis.ammo_cells = self.ammo_cells;
				newmis.ammo_nails = self.ammo_nails;
			}
			else
			{
				if ((self.playerclass == 4))
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
	if (!(((newmis.ammo_shells + newmis.ammo_nails) + (newmis.ammo_rockets * 2)) + (newmis.ammo_cells * 2)))
	{
		dremove (newmis);
		return;
	}
	self.ammo_shells = (self.ammo_shells - newmis.ammo_shells);
	self.ammo_nails = (self.ammo_nails - newmis.ammo_nails);
	self.ammo_rockets = (self.ammo_rockets - newmis.ammo_rockets);
	self.ammo_cells = (self.ammo_cells - newmis.ammo_cells);
	W_SetCurrentAmmo ();
	sound (self, 3, "weapons/lock4.wav", 1, 1);
	increment_num_ammoboxes (self.team_no);
	if ((num_team_ammoboxes (self.team_no) > (num_max_ammoboxes / number_of_teams)))
	{
		RemoveOldAmmobox (self.team_no);
	}
	newmis.enemy = self;
	newmis.health = time;
	newmis.weapon = 0;
	newmis.movetype = 6;
	newmis.solid = 1;
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
		WriteByte (4, 23);
		WriteByte (4, 3);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 1);
	}
	TeamFortress_AmmoboxThink ();
};
