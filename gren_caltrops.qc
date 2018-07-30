//=-=-=-=-= Local Functions
void () CaltropTouch;
void () CaltropScatterThink;
void () ScatterCaltrops;
//=-=-=-=-=

void () CanisterTouch =
{
	sound (self, 1, "weapons/tink1.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () CaltropTouch =
{
	if ((((other.classname != "player") || !(other.flags & 512)) || other.deadflag))
	{
		return;
	}
	if (((((teamplay & 16) && (other != self.owner)) && (other.team_no == self.owner.team_no)) && (self.owner.team_no != 0)))
	{
		return;
	}
	sprint (other, 2, "Ow, Ow, Ow! Caltrops!\n");
	if (!practice)
	{
		other.leg_damage = (other.leg_damage + 2);
		TeamFortress_SetSpeed (other);
		deathmsg = 41;
		T_Damage (other, self, self.owner, enter);
	}
	dremove (self);
};

void () CaltropScatterThink =
{
	self.nextthink = (time + 0.2);
	if ((self.velocity == '0 0 0'))
	{
		if ((self.flags & 512))
		{
			self.nextthink = ((time + 10) + (random () * 5));
			self.think = SUB_Remove;
			self.solid = 1;
			self.movetype = 6;
			self.touch = CaltropTouch;
			self.angles = '90 90 90';
			sound (self, 0, "weapons/tink1.wav", 1, 1);
			setorigin (self, self.origin);
			return;
		}
		else
		{
			self.nextthink = ((time + 10) + (random () * 5));
			self.think = SUB_Remove;
			self.solid = 1;
			self.movetype = 6;
			self.touch = CanisterTouch;
			setorigin (self, self.origin);
			return;
		}
	}
	traceline (self.movedir, self.origin, 1, self);
	if ((trace_fraction == 1))
	{
		self.movedir = self.origin;
		return;
	}
	self.velocity = (self.velocity * -1);
	self.heat = (self.heat + 1);
	if ((self.heat > 10))
	{
		remove (self);
		return;
	}
};

void () ScatterCaltrops = {
    local float num;
    local entity e;

    num = 6;
    while (num > 0) {
        e = spawn();
        e.classname = "grenade";
        e.weapon = 10;
        e.owner = self.owner;
        e.team_no = self.owner.team_no;
        setmodel(e, "progs/caltrop.mdl");
        e.mins = '-4 -4 -8';
        e.maxs = '4 4 4';
        e.angles = '0 0 0';
        e.angles_x = random() * 360;
        e.velocity_x = crandom() * 100;
        e.velocity_y = crandom() * 100;
        e.velocity_z = 200 + random() * 100;
        e.avelocity_x = crandom() * 400;
        e.avelocity_y = crandom() * 400;
        e.avelocity_z = crandom() * 400;
        setorigin(e, self.owner.origin);
        e.movedir = e.origin;
        e.heat = 0;
        e.movetype = 10;
        e.solid = 0;
        e.nextthink = time + 0.2;
        e.think = CaltropScatterThink;
        num = num - 1;
    }
    dremove(self);
};