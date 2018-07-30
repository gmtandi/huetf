//@import - gren_normal.qc
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;

//=-=-=-=-= Local Functions
void () MirvGrenadeTouch;
void () MirvGrenadeExplode;
void (vector org, entity shooter) MirvGrenadeLaunch;
//=-=-=-=-=

void () MirvGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () MirvGrenadeExplode =
{
	local float i;

	deathmsg = enter;
	T_RadiusDamage (self, self.owner, _d, world);
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	self.solid = 0;
	i = 0;
	while ((i < 4))
	{
		MirvGrenadeLaunch ((self.origin + '0 0 -1'), self.owner);
		i = (i + 1);
	}
	dremove (self);
};

void (vector org, entity shooter) MirvGrenadeLaunch =
{
	local float xdir;
	local float ydir;
	local float zdir;

	xdir = ((150 * random ()) - _K);
	ydir = ((150 * random ()) - _K);
	zdir = (40 * random ());
	newmis = spawn ();
	newmis.owner = shooter;
	newmis.movetype = enter;
	newmis.solid = 2;
	newmis.classname = "grenade";
	newmis.weapon = enter;
	newmis.touch = NormalGrenadeTouch;
	newmis.think = NormalGrenadeExplode;
	newmis.nextthink = ((time + 2) + random ());
	newmis.velocity_x = (xdir * 2);
	newmis.velocity_y = (ydir * 2);
	newmis.velocity_z = (zdir * 15);
	newmis.avelocity = '250 300 400';
	setmodel (newmis, "progs/grenade2.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
};
