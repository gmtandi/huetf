//@import - combat.qc
void (entity inflictor, entity attacker, float damage, entity ignore) T_RadiusDamage;

//@import - demoman.qc
void () TeamFortress_DetpackExplode;

//=-=-=-=-= Local Functions
void () EMPExplode;
void () EMPGrenadeTouch;
void () EMPGrenadeExplode;
//=-=-=-=-=

void () EMPExplode =
{
	local float expsize;

	expsize = enter;
	if (self.touch == weapon_touch)
	{
		expsize = 60;
	}
	if (self.classname == "item_shells")
	{
			expsize = (50 + self.aflag);
	}
	else if (self.classname == "item_spikes")
	{
		expsize = 40;
	}
	else if (self.classname == "item_rockets")
	{
		expsize = (100 + (self.aflag * 4));
	}
	else if (self.classname == "item_cells")
	{
		expsize = (60 + (self.aflag * 3));
	}
	else if (self.classname == "item_weapon")
	{
		expsize = 60;
	}
	else
	{
		dprint ("EMPExplode: Attempting to explode a ");
		dprint (self.classname);
		dprint ("\n");
		return;
	}
	deathmsg = 31;
	T_RadiusDamage (self, self.enemy, expsize, world);
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	Respawn_Item (self, self.enemy);
};

void () EMPGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () EMPGrenadeExplode =
{
	local float expsize;
	local entity te;
	local entity oldself;

	WriteByte (4, 23);
	WriteByte (4, 4);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	te = findradius (self.origin, 240);
	while (te)
	{
		if ((te.classname != "item_spikes"))
		{
			if (((te.touch == ammo_touch) || (te.touch == weapon_touch)))
			{
				te.solid = 0;
				te.enemy = self.owner;
				te.nextthink = (time + (random () * 0.8));
				te.think = EMPExplode;
			}
			else
			{
				if (((te.classname == "player") || (te.touch == BackpackTouch)))
				{
					if (!(((teamplay & 16) && (te.team_no > 0)) && (te.team_no == self.owner.team_no)))
					{
						expsize = 0;
						expsize = (expsize + (te.ammo_shells * 0.75));
						expsize = (expsize + ((te.ammo_rockets * 0.75) * 2));
						if ((te.playerclass != 9))
						{
							expsize = (expsize + (te.ammo_cells * 0.75));
						}
						if ((expsize > 0))
						{
							deathmsg = 30;
							T_RadiusDamage (te, self.owner, expsize, te);
							if ((te.touch != BackpackTouch))
							{
								TF_T_Damage (te, self, self.owner, expsize, 2, 4);
								if (!practice)
								{
									te.ammo_shells = ceil ((te.ammo_shells * 0.25));
									te.ammo_rockets = ceil ((te.ammo_rockets * 0.25));
								}
								if ((te.playerclass != 9))
								{
									if (!practice)
									{
										te.ammo_cells = ceil ((te.ammo_cells * 0.25));
									}
								}
								oldself = self;
								self = te;
								W_SetCurrentAmmo ();
								self = oldself;
							}
							else
							{
								te.think = SUB_Remove;
								te.nextthink = (time + 0.1);
							}
							WriteByte (4, 23);
							WriteByte (4, 3);
							WriteCoord (4, te.origin_x);
							WriteCoord (4, te.origin_y);
							WriteCoord (4, te.origin_z);
							multicast (te.origin, 1);
						}
					}
				}
				else
				{
					if ((te.classname == "pipebomb"))
					{
						te.nextthink = (time + (random () * 0.4));
					}
					else
					{
						if (grentype)
						{
							if (((te.classname == "grenade") || (te.classname == "rocket")))
							{
								te.nextthink = time;
							}
						}
						else
						{
							if (((te.classname == "building_dispenser") || (te.classname == "building_sentrygun")))
							{
								if (!(((teamplay & 16) && (te.team_no > 0)) && (te.team_no == self.owner.team_no)))
								{
									TF_T_Damage (te, self, self.owner, 200, 0, 4);
								}
							}
							else
							{
								if ((te.classname == "ammobox"))
								{
									expsize = 0;
									expsize = (expsize + (te.ammo_shells * 0.75));
									expsize = (expsize + ((te.ammo_rockets * 0.75) * 2));
									expsize = (expsize + ((te.ammo_cells * 0.75) * 2));
									if ((expsize > 0))
									{
										te.solid = 0;
										deathmsg = 30;
										T_RadiusDamage (te, self.owner, expsize, te);
										te.think = SUB_Remove;
										te.nextthink = (time + 0.1);
										WriteByte (4, 23);
										WriteByte (4, 3);
										WriteCoord (4, te.origin_x);
										WriteCoord (4, te.origin_y);
										WriteCoord (4, te.origin_z);
										multicast (te.origin, 1);
									}
								}
								else
								{
									if (!tfstrike)
									{
										if ((te.think == TeamFortress_DetpackExplode))
										{
											te.solid = 0;
											te.nextthink = (time + (random () * 2));
											dremove (te.oldenemy);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		te = te.chain;
	}
	dremove (self);
};