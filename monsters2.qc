//=-=-=-=-=

void () monster_boss =
{
	dremove (self);
};

void () event_lightning =
{
	self.use = event_lightning;
};
