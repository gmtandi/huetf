//=-=-=-=-= Local Functions
void () TeamFortress_Soldier;
//=-=-=-=-= 

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
	self.tp_grenades_1 		= GR_TYPE_NORMAL;
	self.tp_grenades_2 		= GR_TYPE_NAIL;
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
