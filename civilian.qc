//=-=-=-=-=
void () TeamFortress_Civilian;

void () TeamFortress_Civilian = 
{
	if ((tfvsdm == 1))
	{
		self.weapons_carried 	= PC_CIVILIAN_DM_WEAPONS;
		self.ammo_rockets 		= enter;
		self.ammo_nails 		= 60;
		self.ammo_shells 		= 40;
		self.ammo_cells 		= 8;
		self.maxammo_rockets 	= 25;
		self.maxammo_nails 		= 200;
		self.maxammo_shells 	= 100;
		self.maxammo_cells 		= 20;
		self.armortype 			= 0.6;
		self.armor_allowed 		= 0.6;
		self.maxarmor 			= 140;
		self.current_weapon 	= 8192;
		self.items_allowed 		= PC_CIVILIAN_DM_WEAPONS;
		self.items 				= ( 1 | 2 | 4 | 8 | 16 | 32 | 64);
	}
	else
	{
		self.weapons_carried 	= PC_CIVILIAN_WEAPONS;
		self.ammo_rockets 		= 0;
		self.ammo_nails 		= 0;
		self.ammo_shells 		= 0;
		self.ammo_cells 		= 0;
		self.maxammo_rockets	= 0;
		self.maxammo_nails 		= 0;
		self.maxammo_shells 	= 0;
		self.maxammo_cells 		= 0;
		self.armortype 			= 0;
		self.armor_allowed 		= 0;
		self.maxarmor 			= 0;
		self.current_weapon 	= 16;
		self.items_allowed 		= 16;
		self.items 				= 0;
	}
	self.no_grenades_1 	= 0;
	self.no_grenades_2 	= 0;
	self.tp_grenades_1 	= 0;
	self.tp_grenades_2 	= 0;
	self.tf_items 		= 0;
	self.armorvalue 	= 0;
	self.armorclass 	= (self.armorclass | 0);
}