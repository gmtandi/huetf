//@import - weapons.qc
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void () TeamFortress_RailGun;
void () W_Attack_Railgun
void () W_FireRail;
void () Rail_Think;
void () Rail_Touch;
void () player_rail1;
void () player_rail2;
void () player_rail3;
void () player_rail4;
void () player_rail5;
void () player_rail6;
//=-=-=-=-=

void () TeamFortress_RailGun = 
{
	SUB_ResetWeaponFunctions();
	
	self.needsReload 	= 0;
	self.AttackFunction	= W_Attack_Railgun;	
	self.currentammo 	= self.ammo_nails;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rail.mdl";
		self.weaponframe = 0;
	}
	self.items = (self.items | 512);
	self.weapon = 1;
};

void () W_Attack_Railgun =
{
	sound (self, 1, "weapons/railgun.wav", 1, 1);
	player_rail1 ();
	W_FireRail ();
	Attack_Finished (0.4);
};

void () W_FireRail =
{
	local vector vec;
	local vector org;

	if (!practice)
	{
		self.ammo_nails = (self.ammo_nails - 1);
		self.currentammo = self.ammo_nails;
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
	if (headshots) {
		newmis.velocity = (vec * 2000);
	} else {
		newmis.velocity = (vec * 1500);
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.oldorigin = newmis.velocity;
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = Rail_Touch;
};

void () Rail_Think =
{
	self.solid = 1;
	self.movetype = 9;
	self.velocity = self.oldorigin;
	self.touch = Rail_Touch;
	setmodel (self, "progs/e_spike2.mdl");
	self.nextthink = (time + 1);
	self.think = SUB_Remove;
};

void () Rail_Touch =
{
	local vector org;

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
		deathmsg = 26;
		TF_T_Damage (other, self, self.enemy, headshot_calc(other, self,25), 2, 8);
		self.velocity = self.oldorigin;
		self.owner = other;
		setmodel (self, string_null);
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = Rail_Think;
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


void () player_rail1 = [ 113, player_rail2 ]
{
	self.weaponframe = 1;
	muzzleflash ();
};

void () player_rail2 = [ 114, player_rail3 ]
{
	self.weaponframe = 2;
};

void () player_rail3 = [ 115, player_rail4 ]
{
	self.weaponframe = 3;
};

void () player_rail4 = [ 116, player_rail5 ]
{
	self.weaponframe = 4;
};

void () player_rail5 = [ 117, player_rail6 ]
{
	self.weaponframe = 5;
};

void () player_rail6 = [ 118, player_run ]
{
	self.weaponframe = 6;
};