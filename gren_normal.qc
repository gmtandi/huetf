//=-=-=-=-= Local Functions
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;
//=-=-=-=-=

void () NormalGrenadeTouch =
{
	if (other == self.owner)
	{
		return;
	}
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NormalGrenadeExplode =
{
	deathmsg = 8;
	T_RadiusDamage (self, self.owner, 180, world);
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};