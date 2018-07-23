//=-=-=-=-=
void () TeamFortress_Soldier;
void () NailGrenadeExplode;
void () NailGrenadeNailEm;
void () NailGrenadeLaunchNail;

void () TeamFortress_Soldier =
{
	self.weapons_carried 	= PC_SOLDIER_WEAPONS;
	self.ammo_rockets 		= 10;
	self.ammo_nails 		= 0;
	self.ammo_shells 		= 50;
	self.ammo_cells 		= 0;
	self.maxammo_rockets 	= 50;
	self.maxammo_nails 		= 50;
	self.maxammo_shells 	= 100;
	self.maxammo_cells 		= 50;
	self.no_grenades_1 		= 4;
	self.no_grenades_2 		= 1;
	self.tp_grenades_1 		= 1;
	self.tp_grenades_2 		= 3;
	self.tf_items 			= 0;
	self.armorclass 		= 0;
	self.armortype 			= 0.8;
	self.armorvalue 		= 100;
	self.armor_allowed 		= 0.8;
	self.maxarmor 			= 200;
	self.max_health			= 100;
	self.current_weapon 	= WEAP_ROCKET_LAUNCHER;
	self.items_allowed 		= PC_SOLDIER_WEAPONS;
	self.items 				= ( 1 | 2 | 32);
};

void () NailGrenadeTouch =
{
	if ((other == self.owner))
	{
		return;
	}
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NailGrenadeExplode =
{
	local entity te;

	self.owner.no_active_nail_grens = (self.owner.no_active_nail_grens + 1);
	if ((self.owner.no_active_nail_grens > 0))
	{
		te = find (world, classname, "grenade");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_nail_grens == 1)))
			{
				te.weapon = 9;
				te.think = GrenadeExplode;
				te.nextthink = (time + 0.1);
			}
			te = find (te, classname, "grenade");
		}
	}
	self.no_active_nail_grens = self.owner.no_active_nail_grens;
	self.movetype = 5;
	setorigin (self, (self.origin + '0 0 32'));
	self.avelocity = '0 500 0';
	self.nextthink = (time + 0.7);
	self.think = NailGrenadeNailEm;
};

void () NailGrenadeNailEm =
{
	self.velocity = '0 0 0';
	if (shortergrens)
		self.nextthink = (time + 0.07);
	else
		self.nextthink = (time + 0.1);
	self.think = NailGrenadeLaunchNail;
	self.playerclass = 0;
};

void () NailGrenadeLaunchNail =
{
	local float i;
	local float j;
	local float cur_yaw;

	i = 0;
	while ((i < 3))
	{
		j = ((random () + 2) * 5);
		cur_yaw = anglemod ((self.angles_y + j));
		self.angles_y = cur_yaw;
		self.angles_x = 0;
		self.angles_z = 0;
		makevectors (self.angles);
		deathmsg = 9;
		launch_spike (self.origin, v_forward);
		newmis.touch = superspike_touch;
		newmis.weapon = 9;
		i = (i + 1);
	}
	self.playerclass = (self.playerclass + 1);
	if (shortergrens)
		self.nextthink = (time + 0.07);
	else
		self.nextthink = (time + 0.1);

	if ((self.playerclass > _2))
	{
		self.weapon = 9;
		self.think = GrenadeExplode;
	}
};
