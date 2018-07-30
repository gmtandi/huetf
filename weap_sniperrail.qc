//@import - weapons.qc
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void () TeamFortress_SniperRail;
void () W_Attack_SniperRail;
void () W_FireSniperRail;
void () SniperRail_Touch;
void () SniperRail_Think;
void () player_srail1;
void () player_srail2;
void () player_srail3;
void () player_srail4;
void () player_srail5;
void () player_srail6;
//=-=-=-=-=

void () TeamFortress_SniperRail = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload 				= 0;
	self.AttackFunction 			= W_Attack_SniperRail;	
	self.currentammo = self.ammo_shells;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_srifle.mdl";
		self.weaponframe = 0;
	}
	self.weapon = 16;
	self.items = (self.items | 512);
};

void () W_Attack_SniperRail =
{
	sound (self, 1, "weapons/sniper.wav", 1, 1);
	player_srail1 ();
	W_FireSniperRail ();
	Attack_Finished (2);
};

void () W_FireSniperRail =
{
	if (cvar("sv_maxvelocity") < 15000)
		cvar_set("sv_maxvelocity", "15000");
	local vector vec;
	local vector org;
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - 1);
		self.currentammo = self.ammo_shells;
	}
	makevectors (self.v_angle);
	org = (self.origin + (v_forward * 8));
	vec = aim (self, 10000);
	vec = normalize (vec);
	newmis = spawn ();
	newmis.owner = self;
	newmis.enemy = self;
	newmis.movetype = 9;
	newmis.solid = 1;
	setmodel (newmis, "progs/e_spike1.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, (org + '0 0 16'));
	newmis.velocity = (vec * 10000);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.oldorigin = newmis.velocity;
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = SniperRail_Touch;
};

void () SniperRail_Touch =
{
	local vector org;
	local float damage = 90

	if ((other == self.owner))
	{
		return;
	}
	if (((other == self.enemy) && (self.enemy != world)))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	org = (self.origin - (8 * normalize (self.velocity)));
	if (other.health)
	{
		SpawnBlood (org, 15);
		deathmsg = 18;

		local vector dist;
		dist = self.origin - other.origin;
		if (vlen(dist) >=  20) {
			sprint (self.owner, 1, "Head shot - that's gotta hurt!\n");
			deathmsg = 29;
			damage = 2 * damage;
		}

		TF_T_Damage (other, self, self.enemy, damage, 2, 8);
		self.velocity = self.oldorigin;
		self.owner = other;
		setmodel (self, string_null);
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = SniperRail_Think;
		return;
	}
	else
	{
		WriteByte (4, 23);
		WriteByte (4, 0);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 1);
	}
	dremove (self);
};

void () SniperRail_Think =
{
	self.solid = 1;
	self.movetype = 9;
	//self.velocity = self.oldorigin;
	self.touch = SniperRail_Touch;
	setmodel (self, "progs/e_spike2.mdl");
	self.nextthink = (time + 1);
	self.think = SUB_Remove;
};

void () player_srail1 = [ 113, player_srail2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_srail2 = [ 114, player_srail3 ]
{
	self.weaponframe = 2;
};

void () player_srail3 = [ 115, player_srail4 ]
{
	self.weaponframe = 3;
};

void () player_srail4 = [ 116, player_srail5 ]
{
	self.weaponframe = 4;
};

void () player_srail5 = [ 117, player_srail6 ]
{
	self.weaponframe = 5;
};

void () player_srail6 = [ 118, player_run ]
{
	self.weaponframe = 6;
};