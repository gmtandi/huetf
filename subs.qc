//=-=-=-=-=

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
