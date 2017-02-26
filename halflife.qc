//=-=-=-=-=
.string areaname;
.float material;

void () info_areadef =
{
	dremove (self);
};

void () trigger_camera =
{
	self.classname = "info_player_start";
};

void () Explode =
{
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
};

void () env_explosion =
{
	self.think = Explode;
};

void () Breakaway =
{
	self.solid = 0;
	setmodel (self, string_null);
};

void () bomb_target_touch =
{
	if (!tfstrike)
	{
		return;
	}
	if (other.is_detpacking)
	{
		TeamFortress_SetBomb (other);
		other.target = self.target;
	}
};

void () nogren_touch =
{
	if ((other.classname == "grenade"))
	{
		other.think = SUB_Remove;
		return;
	}
	if ((other.classname == "grentimer"))
	{
		other.think = SUB_Remove;
		return;
	}
};

void () nobuild_touch =
{
	if ((other.classname == "player"))
	{
		return;
	}
};

void () hostage_rescue_touch =
{
	if ((other.classname != "hostage_entity"))
	{
		return;
	}
	num_hostages = (num_hostages - SBAR_GRENS);
	if (!num_hostages)
	{
		tfs_winner = SBAR_GRENS;
	}
	TF_AddFrags (other.enemy, 5, 0);
	other.solid = 0;
	other.tfstate = SBAR_GRENS;
	setmodel (other, string_null);
	sound (self, SBAR_PRINT, "speech/rescued.wav", SBAR_GRENS, 0);
};

void () func_water =
{
	self.solid = SBAR_GRENS;
	self.movetype = 7;
	setorigin (self, self.origin);
	setmodel (self, self.model);
};

void () func_breakable =
{
	self.solid = AS_MISSILE;
	self.movetype = 7;
	setorigin (self, self.origin);
	self.mdl = self.model;
	setmodel (self, self.mdl);
	setsize (self, self.mins, self.maxs);
	if (!self.targetname)
	{
		self.takedamage = SBAR_GRENS;
		self.th_die = Breakaway;
	}
};

void () func_nogrenades =
{
	InitTrigger ();
	self.touch = nogren_touch;
};

void () func_nobuild =
{
	InitTrigger ();
	self.touch = nobuild_touch;
};

void () func_hostage_rescue =
{
	precache_sound ("speech/rescued.wav");
	InitTrigger ();
	self.touch = hostage_rescue_touch;
};

void () func_bomb_target =
{
	precache_sound ("speech/bombpl.wav");
	InitTrigger ();
	self.touch = bomb_target_touch;
};

void () info_bombsite =
{
	self.classname = "func_bomb_target";
	func_bomb_target ();
};

void () func_ladder =
{
	self.movetype = 0;
	self.solid = 5;
	setmodel (self, self.model);
	self.model = "";
};

