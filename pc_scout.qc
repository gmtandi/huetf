//=-=-=-=-= Local Functions
void () TeamFortress_Scout;
entity (entity scanner, float scanrange, float enemies, float friends) T_RadiusScan;
//=-=-=-=-= 

void () TeamFortress_Scout =
{
	self.weapons_carried 	= PC_SCOUT_WEAPONS;
	self.ammo_rockets    	= 0;
	self.ammo_nails      	= 100;
	self.ammo_shells     	= 25;
	self.ammo_cells      	= 50;
	self.maxammo_rockets 	= 25;
	self.maxammo_nails   	= 200;
	self.maxammo_shells  	= 50;
	self.maxammo_cells 	 	= 100;
	self.no_grenades_1   	= 2;
	self.no_grenades_2		= 3;
	if (!impactgren)
		self.tp_grenades_1 	= GR_TYPE_CALTROP;
	else
		self.tp_grenades_1 	= GR_TYPE_IMPACT;
	self.tp_grenades_2 		= GR_TYPE_CONCUSSION;
	self.tf_items 			= ITEM_SCANNER;
	self.ScannerOn 			= 0;
	if ((self.tf_items_flags <= 0))
	{
		self.tf_items_flags = (self.tf_items_flags | 1);
	}
	self.armorclass 		= (self.armorclass | 0);
	self.armortype 			= 0.3;
	self.armorvalue 		= 25;
	self.armor_allowed 		= 0.3;
	self.maxarmor 			= 50;
	self.max_health			= 75;
	self.current_weapon 	= WEAP_NAILGUN;
	self.items_allowed 		= PC_SCOUT_WEAPONS;
	self.items 				= (self.items | ITEM_SCANNER | 4);	
}

void () ScannerSwitch =
{
	local entity te;

	if ((self.ScannerOn != 1))
	{
		te = spawn ();
		te.nextthink = (time + 2);
		te.think = TeamFortress_Scan;
		te.owner = self;
		te.classname = "timer";
		te.netname = "scanner";
		sprint (self, 2, "Scanner On.\n");
		self.ScannerOn = 1;
	}
	else
	{
		te = find (world, netname, "scanner");
		while (te)
		{
			if ((te.owner == self))
			{
				dremove (te);
			}
			te = find (te, netname, "scanner");
		}
		sprint (self, 2, "Scanner Off.\n");
		self.ScannerOn = 0;
	}
};

void () TeamFortress_Scan =
{
	local string power;
	local entity list;
	local float scancost;
	local float scanrange;
	local float scen;
	local float scfr;
	local float num;
	local vector lightningvec;
	local float enemy_detected;
	local float any_detected;
	local vector vf;
	local vector vr;
	local vector e;
	local float res1;
	local float res2;
	local float res3;
	local float vf_e_angle;
	local float vr_e_angle;

	scanrange = _d;
	self.owner.impulse = 0;
	self.owner.last_impulse = 0;
	if ((self.owner.classname == "player"))
	{
		if (!(self.owner.tf_items & 1))
		{
			return;
		}
		scancost = 2;
		if ((self.owner.ammo_cells <= 0))
		{
			sprint (self.owner, 2, "Not enough cells to run scanner.\n");
			self.owner.ammo_cells = 0;
			W_SetCurrentAmmo ();
			self.owner.ScannerOn = 0;
			dremove (self);
			return;
		}
		if ((scancost > self.owner.ammo_cells))
		{
			scanrange = (self.owner.ammo_cells * 20);
			scancost = self.owner.ammo_cells;
			W_SetCurrentAmmo ();
		}
		scen = 0;
		scfr = 0;
		if ((self.owner.tf_items_flags & 1))
		{
			scen = 1;
		}
		if ((self.owner.tf_items_flags & 2))
		{
			scfr = 1;
		}
		if (((scen == 0) && (scfr == 0)))
		{
			sprint (self.owner, 2, "No target specified.\n");
			self.owner.ScannerOn = 0;
			dremove (self);
			return;
		}
		self.owner.ammo_cells = (self.owner.ammo_cells - 2);
		if ((self.owner.ammo_cells < 0))
		{
			self.owner.ammo_cells = 0;
		}
		W_SetCurrentAmmo ();
		scanrange = (scanrange * 25);
		list = T_RadiusScan (self.owner, scanrange, scen, scfr);
	}
	scen = 0;
	scfr = 0;
	makevectors (self.owner.v_angle);
	if ((list != world))
	{
		any_detected = 1;
		if (((((list.team_no > 0) && (self.owner.team_no > 0)) && (list.team_no == self.owner.team_no)) && ((list.classname == "player") || (list.classname == "building_sentrygun"))))
		{
			scfr = (scfr + 1);
			enemy_detected = 0;
		}
		else
		{
			if (((((list.goal_no > 0) && (self.owner.team_no > 0)) && (list.goal_no == self.owner.team_no)) && (list.classname == "item_tfgoal")))
			{
				scfr = (scfr + 1);
				enemy_detected = 0;
			}
			else
			{
				scen = (scen + 1);
				enemy_detected = 1;
			}
		}
		if (any_detected)
		{
			lightningvec = normalize ((list.origin - self.owner.origin));
			lightningvec = (lightningvec * (vlen ((list.origin - self.owner.origin)) / 5));
			lightningvec = (lightningvec + self.owner.origin);
			msg_entity = self.owner;
			WriteByte (1, 23);
			WriteByte (1, 5);
			WriteEntity (1, self.owner);
			WriteCoord (1, self.owner.origin_x);
			WriteCoord (1, self.owner.origin_y);
			WriteCoord (1, (self.owner.origin_z + 8));
			WriteCoord (1, lightningvec_x);
			WriteCoord (1, lightningvec_y);
			WriteCoord (1, (lightningvec_z + 8));
			if ((self.owner.tf_items_flags & 4))
			{
				stuffcmd (self.owner, "play misc/basekey.wav\n");
			}
			num = vlen ((list.origin - self.owner.origin));
			num = (num / enter);
			num = (num / 3);
			num = rint (num);
			self.health = num;
			if ((list.classname == "player"))
			{
				if (((list.playerclass == PC_SPY) && (list.team_no != self.owner.team_no)))
				{
					if ((list.undercover_skin != 0))
					{
						self.playerclass = list.undercover_skin;
					}
					else
					{
						self.playerclass = list.playerclass;
					}
					if ((list.undercover_team != 0))
					{
						self.team_no = list.undercover_team;
					}
					else
					{
						self.team_no = list.team_no;
					}
				}
				else
				{
					self.playerclass = list.playerclass;
					self.team_no = list.team_no;
				}
			}
			else
			{
				if ((list.classname == "building_sentrygun"))
				{
					self.playerclass = 13;
					self.team_no = list.team_no;
				}
				else
				{
					if ((list.classname == "item_tfgoal"))
					{
						self.playerclass = 14;
						self.team_no = list.goal_no;
					}
				}
			}
			self.owner.StatusRefreshTime = (time + 0.2);
		}
	}
	if (((scen == 0) && (scfr == 0)))
	{
		self.health = 0;
		self.owner.StatusRefreshTime = (time + 0.2);
		self.nextthink = (time + 2);
		return;
	}
	W_SetCurrentAmmo ();
	self.nextthink = (time + 2);
	return;
};

entity (entity scanner, float scanrange, float enemies, float friends) T_RadiusScan =
{
	local entity head;
	local float rangedist;

	rangedist = 0;
	head = world;
	while ((rangedist <= scanrange))
	{
		if ((rangedist <= 0))
		{
			rangedist = 1;
		}
		head = findradius (scanner.origin, rangedist);
		while (head)
		{
			if ((head != scanner))
			{
				if ((((head.takedamage != 0) && (head.health > 0)) || (head.classname == "item_tfgoal")))
				{
					if ((((head.classname == "player") || (head.classname == "building_sentrygun")) && (friends || enemies)))
					{
						if (teamplay)
						{
							if ((((friends != 0) && (head.team_no > 0)) && (scanner.team_no > 0)))
							{
								if (((head.playerclass == PC_SPY) && (head.team_no != scanner.team_no)))
								{
									if ((head.is_feigning != 1))
									{
										if ((head.undercover_team == scanner.team_no))
										{
											return (head);
										}
									}
								}
								else
								{
									if ((head.team_no == scanner.team_no))
									{
										return (head);
									}
								}
							}
							if ((((enemies != 0) && (head.team_no > 0)) && (scanner.team_no > 0)))
							{
								if (((head.playerclass == PC_SPY) && (head.team_no != scanner.team_no)))
								{
									if ((head.is_feigning != 1))
									{
										if ((head.undercover_team != scanner.team_no))
										{
											return (head);
										}
									}
								}
								else
								{
									if ((head.team_no != scanner.team_no))
									{
										return (head);
									}
								}
							}
						}
						else
						{
							return (head);
						}
					}
					else
					{
						if (((head.classname == "item_tfgoal") && (friends || enemies)))
						{
							if (teamplay)
							{
								if (((((friends != 0) && (head.goal_no > 0)) && (scanner.team_no > 0)) && (head.goal_no == scanner.team_no)))
								{
									return (head);
								}
								if (((((enemies != 0) && (head.team_no > 0)) && (scanner.team_no > 0)) && (head.goal_no != scanner.team_no)))
								{
									return (head);
								}
							}
						}
					}
				}
			}
			head = head.chain;
		}
		rangedist = (rangedist + 100);
	}
	return (world);
};
