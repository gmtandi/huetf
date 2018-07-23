//@import - weapons.qc
void (float damage) spawn_touchblood;
float (entity other, entity projectile, float damage) headshot_calc;

//=-=-=-=-= Local Functions
void (vector org, vector dir) launch_spike;
void () spike_touch;
void () superspike_touch;
//=-=-=-=-= 

void (vector org, vector dir) launch_spike =
{
	newmis = spawn ();
	newmis.voided = 0;
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = 2;
	if (headshots)
		newmis.velocity = (dir * 1333);
	else
		newmis.velocity = (dir * 1000);
	
	newmis.angles = vectoangles (dir);
	newmis.touch = spike_touch;
	newmis.weapon = 3;
	newmis.classname = "spike";
	newmis.think = SUB_Remove;
	newmis.nextthink = (time + 3);
	setmodel (newmis, "progs/spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);	
};

void () spike_touch =
{
	if (self.voided)
	{
		return;
	}
	self.voided = 1;
	if ((other.solid == 1))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if (other.takedamage)
	{
		spawn_touchblood (9);
		deathmsg = self.weapon;
		if ((self.owner.classname == "grenade"))
		{
			TF_T_Damage (other, self, self.owner.owner, 9, 2, 2);
		}
		else
		{
			TF_T_Damage (other, self, self.owner, headshot_calc(other, self, COLOR_GREEN), 2, 2);
		}
	}
	else
	{
		WriteByte (4, 23);
		if ((self.classname == "wizspike"))
		{
			WriteByte (4, 7);
		}
		else
		{
			if ((self.classname == "knightspike"))
			{
				WriteByte (4, 8);
			}
			else
			{
				WriteByte (4, 0);
			}
		}
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 1);
	}
	dremove (self);
};

void () superspike_touch =
{
	local float ndmg;
	local vector dist;
	local float mult;

	if (self.voided)
	{
		return;
	}
	self.voided = 1;
	if ((other == self.owner))
	{
		return;
	}
	if ((other.solid == 1))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if (other.takedamage)
	{
		spawn_touchblood (COLOR_GREEN);
		deathmsg = self.weapon;
		if ((deathmsg == 9))
		{
			ndmg = 40;
		}
		else
		{
			ndmg = 26;
		}
		if ((self.owner.classname == "grenade"))
		{
			TF_T_Damage (other, self, self.owner.owner, ndmg, 2, 2);
		}
		else
		{
			TF_T_Damage (other, self, self.owner, headshot_calc(other, self,ndmg), 2, 2);
		}
	}
	else
	{
		WriteByte (4, 23);
		WriteByte (4, 1);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 1);
	}
	dremove (self);
};