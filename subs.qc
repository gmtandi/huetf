void (float psize, entity p) KickPlayer =
{
        msg_entity = p;
        if ((psize > -3))
        {
                WriteByte (1, 34);
        }
        else
        {
                WriteByte (1, 35);
        }
};

void () muzzleflash =
{
        WriteByte (4, 39);
        WriteEntity (4, self);
        multicast (self.origin, 2);
};

void (float normal) SUB_AttackFinished;
float (entity targ) visible;

void (void() thinkst) SUB_CheckRefire =
{
	if ((skill != 3))
	{
		return;
	}
	if ((self.cnt == 1))
	{
		return;
	}
	if (!visible (self.enemy))
	{
		return;
	}
	self.cnt = 1;
	self.think = thinkst;
};

