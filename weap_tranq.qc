//@import - weapons.qc
void (float damage) spawn_touchblood;

//=-=-=-=-= Local Functions
void () TeamFortress_Tranquilizer;
void () W_FireTranq;
void () T_TranqDartTouch;
void () TranquiliserTimer;
//=-=-=-=-=

void () TeamFortress_Tranquilizer = {
	self.currentammo = self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_shot.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 256);
	self.weapon = 1;	
};

void () W_FireTranq =
{
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = 2;
	makevectors (self.v_angle);
	newmis.velocity = v_forward;
	newmis.velocity = (newmis.velocity * 1500);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.touch = T_TranqDartTouch;
	newmis.think = SUB_Remove;
	newmis.nextthink = (time + 6);
	setmodel (newmis, "progs/spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void () T_TranqDartTouch =
{
	local entity timer;

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
		if (((other.classname == "player") && !((other.team_no == self.owner.team_no) && (teamplay & (2 | 4)))))
		{
			if ((other.tfstate & TFSTATE_TRANQUILISED))
			{
				timer = find (world, classname, "timer");
				while ((((timer.owner != other) || (timer.think != TranquiliserTimer)) && (timer != world)))
				{
					timer = find (timer, classname, "timer");
				}
				if ((timer != world))
				{
					timer.nextthink = (time + 15);
				}
			}
			else
			{
				sprint (other, 2, "You feel tired...\n");
				other.tfstate = (other.tfstate | TFSTATE_TRANQUILISED);
				timer = spawn ();
				timer.nextthink = (time + 15);
				timer.think = TranquiliserTimer;
				timer.classname = "timer";
				timer.owner = other;
				timer.team_no = self.owner.team_no;
				TeamFortress_SetSpeed (other);
			}
		}
		spawn_touchblood (9);
		deathmsg = 25;
		TF_T_Damage (other, self, self.owner, headshot_calc(other, self, 20), 2, 2);
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
		multicast (self.origin, 2);
	}
	dremove (self);
};

void () TranquiliserTimer =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_TRANQUILISED));
	TeamFortress_SetSpeed (self.owner);
	sprint (self.owner, 2, "You feel more alert now\n");
	dremove (self);
};