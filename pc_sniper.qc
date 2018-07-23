//=-=-=-=-=
void () TeamFortress_Sniper;
void () SniperSight_Update;

void () TeamFortress_Sniper = {
	if (!classrework) {
		self.weapons_carried 	= PC_SNIPER_WEAPONS;
		self.current_weapon 	= WEAP_SNIPER_RIFLE;
		self.items_allowed 		= PC_SNIPER_WEAPONS;
	}
	else {
		self.current_weapon 	= WEAP_SNIPERRAIL;
		self.items_allowed 		= PC_SNIPER_REWORK_WEAPONS;
		self.weapons_carried 	= PC_SNIPER_REWORK_WEAPONS;
	}
	self.ammo_rockets 			= 0;
	self.ammo_nails 			= 50;
	self.ammo_shells 			= 60;
	self.ammo_cells 			= 0;
	self.maxammo_rockets 		= 25;
	self.maxammo_nails 			= 100;
	self.maxammo_shells 		= 75;
	self.maxammo_cells 			= 50;
	self.no_grenades_1 			= 2;
	self.no_grenades_2 			= 2;
	self.tp_grenades_1 			= GR_TYPE_NORMAL;
	self.tp_grenades_2 			= GR_TYPE_FLARE;
	self.tf_items 				= 0;
	self.armorclass 			= (self.armorclass | 0);
	self.armortype 				= 0.3;
	self.armorvalue 			= 0;
	self.armor_allowed 			= 0.3;
	self.maxarmor 				= 50;
	self.max_health				= 75;
	self.items 					= ( 1 | 2 | 4);
}

void () TeamFortress_SniperWeapon =
{
	local float it;

	self.impulse = 0;
	if ((self.tfstate & TFSTATE_RELOADING))
	{
		return;
	}
	if (!((self.weapons_carried & space) && (self.weapons_carried & 64)))
	{
		return;
	}
	if ((self.ammo_shells < 1))
	{
		sprint (self, 2, "not enough ammo.\n");
		return;
	}
	if ((self.current_weapon == space))
	{
		self.current_weapon = 64;
	}
	else
	{
		self.current_weapon = space;
	}
	W_SetCurrentAmmo ();
};

void (float zoom_level) TF_zoom =
{
	local string zl;

	if ((self.tfstate & TFSTATE_ZOOMOFF))
	{
		return;
	}
	zl = ftos (zoom_level);
	stuffcmd (self, "fov ");
	stuffcmd (self, zl);
	stuffcmd (self, "\n");
};

void () SniperSight_Update =
{
	local vector org;

	if ((!(self.owner.tfstate & TFSTATE_AIMING) || (self.owner.current_weapon != space)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_AIMING));
		TeamFortress_SetSpeed (self.owner);
		self.owner.heat = 0;
		dremove (self);
		return;
	}
	makevectors (self.owner.v_angle);
	org = (self.owner.origin + (v_forward * enter));
	org_z = (self.owner.absmin_z + (self.owner.size_z * 0.7));
	traceline (org, (org + (v_forward * 9192)), 0, self);
	if ((trace_fraction == 1))
	{
		setorigin (self, self.owner.origin);
		return;
	}
	self.angles = vectoangles (v_forward);
	setorigin (self, trace_endpos);
	self.nextthink = (time + 0.1);
};

void () SniperSight_Create =
{
	local entity sight;

	if ((self.has_disconnected == 1))
	{
		return;
	}
	self.tfstate = (self.tfstate | TFSTATE_AIMING);
	sight = spawn ();
	sight.owner = self;
	sight.movetype = 8;
	sight.solid = 0;
	sight.classname = "timer";
	setorigin (sight, self.origin);
	sight.think = SniperSight_Update;
	sight.nextthink = (time + 0.05);
	if ((self.team_no == 1))
	{
		setmodel (sight, "progs/dot1.spr");
	}
	else
	{
		if ((self.team_no == 2))
		{
			setmodel (sight, "progs/dot2.spr");
		}
		else
		{
			if ((self.team_no == 3))
			{
				setmodel (sight, "progs/dot3.spr");
			}
			else
			{
				if ((self.team_no == 4))
				{
					setmodel (sight, "progs/dot4.spr");
				}
				else
				{
					setmodel (sight, "progs/sight.spr");
				}
			}
		}
	}
};

void () TeamFortress_AutoZoomToggle =
{
	if ((self.tfstate & TFSTATE_ZOOMOFF))
	{
		self.tfstate = (self.tfstate - TFSTATE_ZOOMOFF);
		sprint (self, 2, "autozoom ON\n");
	}
	else
	{
		self.tfstate = (self.tfstate | TFSTATE_ZOOMOFF);
		sprint (self, 2, "autozoom OFF\n");
	}
};
