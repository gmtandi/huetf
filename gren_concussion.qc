//@import - misc.qc
void () bubble_bob;
void () bubble_remove;

//=-=-=-=-= Local Functions
void () ConcussionGrenadeTouch;
void () ConcussionGrenadeExplode;
void (entity inflictor, entity attacker, float bounce, entity ignore) T_RadiusBounce;
void () ConcussionGrenadeTimer;
//=-=-=-=-=

void () ConcussionGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () ConcussionGrenadeExplode =
{
	T_RadiusBounce (self, self.owner, 240, world);
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};

void (entity inflictor, entity attacker, float bounce, entity ignore) T_RadiusBounce =
{
	local float points;
	local entity head;
	local entity te;
	local vector org;
	local string st;

	head = findradius (inflictor.origin, (bounce + 40));
	while (head)
	{
		if ((head != ignore))
		{
			if (head.takedamage)
			{
				org = (head.origin + ((head.mins + head.maxs) * 0.5));
				points = (0.5 * vlen ((org - inflictor.origin)));
				if ((points < 0))
				{
					points = 0;
				}
				points = (bounce - points);
				if (((((head.classname != "building_dispenser") && (head.classname != "building_sentrygun")) && (head.classname != "building_sentrygun_base")) && (points > 0)))
				{
					head.velocity = (org - inflictor.origin);
					head.velocity = (head.velocity * (points / 20));
					if ((head.classname == "player"))
					{
						te = find (world, classname, "timer");
						while ((((te.owner != head) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
						{
							te = find (te, classname, "timer");
						}
						if (practice)
						{
							return;
						}
						if ((te != world))
						{
							te.health = 800;
							te.nextthink = (time + 0.25);
						}
						else if ( inflictor.weapon != 11 ) // Makes impact grenade not conc
						{
							te = spawn ();
							te.nextthink = (time + 0.25);
							te.think = ConcussionGrenadeTimer;
							te.team_no = attacker.team_no;
							te.classname = "timer";
							te.owner = head;
							te.health = 800;
						}
					}
				}
			}
		}
		head = head.chain;
	}
};

void () ConcussionGrenadeTimer =
{
	local string st;
	local vector src;
	local float pos;
	local float concadjust;
	local float stumble;

	if ((self.owner.invincible_finished > time))
	{
		sprint (self.owner, 2, "Your head feels better now.\n");
		dremove (self);
		return;
	}
	if ((self.deadflag > 0))
	{
		dremove (self);
		return;
	}
	if (((((self.health == 200) || (self.health == 400)) || (self.health == 600)) || (self.health == 800)) || (self.health == 1000))
	{
		newmis = spawn ();
		setmodel (newmis, "progs/s_bubble.spr");
		setorigin (newmis, self.owner.origin);
		newmis.movetype = 8;
		newmis.solid = 0;
		newmis.velocity = '0 0 15';
		newmis.nextthink = (time + 0.5);
		newmis.think = bubble_bob;
		newmis.touch = bubble_remove;
		newmis.classname = "bubble";
		newmis.frame = 0;
		newmis.cnt = 0;
		setsize (newmis, '-8 -8 -8', '8 8 8');
	}
	self.health = (self.health - enter);
	if ((self.owner.playerclass == PC_MEDIC))
	{
		self.health = (self.health - enter);
	}
	if ((self.health < 0))
	{
		self.health = 0;
	}
	if (grentype)
	{
		self.nextthink = (time + 0.25);
	}
	else
	{
		concadjust = 1;
		self.nextthink = (time + (0.25 * concadjust));
		if ((concadjust > 1))
		{
			self.health = (self.health - concadjust);
		}
	}
	pos = pointcontents (self.owner.origin);
	src_x = ((self.owner.origin_x + self.owner.maxs_x) + 2);
	src_y = ((self.owner.origin_y + self.owner.maxs_y) + 2);
	src_z = self.owner.origin_z;
	pos = pointcontents (src);
	if (((self.owner.flags & 512) || (self.owner.flags & 16)))
	{
		if (!self.owner.is_feigning)
		{
			makevectors (self.owner.v_angle);
			stumble = (crandom () * self.health);
			if ((self.owner.playerclass == PC_HWGUY))
			{
				stumble = (stumble / 3);
			}
			if (!((pos == -2) && (self.owner.velocity == '0 0 0')))
			{
				if ((crandom () < 0))
				{
					self.owner.velocity_x = (self.owner.velocity_y + stumble);
					self.owner.velocity_y = (self.owner.velocity_x + stumble);
				}
				else
				{
					self.owner.velocity_x = ((-1 * self.owner.velocity_y) + stumble);
					self.owner.velocity_y = ((-1 * self.owner.velocity_x) + stumble);
				}
			}
		}
	}
	if ((self.health <= 0))
	{
		sprint (self.owner, 2, "Your head feels better now.\n");
		dremove (self);
	}
};