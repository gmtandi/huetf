
void (vector vTarget) HitWithSpanner =
{
	local vector lookhere;

	if ((vlen ((vTarget - self.origin)) < 45))
	{
		self.keys = 0;
		lookhere = vectoangles ((vTarget - self.origin));
		lookhere_x = 0;
		self.v_angle = lookhere;
		self.current_weapon = BOT_DEFEND;
		self.button0 = 1;
	}
	else
	{
		MoveToLocation (vTarget);
	}
};
