//=-=-=-=-=
void () TeamFortress_Hwguy;

void () TeamFortress_Hwguy = 
{
	if (!classrework) {
		self.weapons_carried 	= PC_HWGUY_WEAPONS;
		self.ammo_rockets 		= 0;
		self.armorvalue 		= 150;
		self.maxarmor 			= 300;
		self.current_weapon 	= WEAP_ASSAULT_CANNON;
		self.items_allowed 		= PC_HWGUY_WEAPONS;							
	}
	else {
		self.weapons_carried 	= PC_HWGUY_REWORK_WEAPONS;
		self.ammo_rockets 		= 20;
		self.armorvalue 		= 100;
		self.maxarmor 			= 200;
		self.current_weapon 	= WEAP_TRIBOLT;
		self.items_allowed 		= PC_HWGUY_REWORK_WEAPONS;
	}
	self.ammo_nails 		= 0;
	self.ammo_shells 		= 200;
	self.ammo_cells 		= 30;
	self.maxammo_rockets 	= 50;
	self.maxammo_nails 		= 200;
	self.maxammo_shells 	= 200;
	self.maxammo_cells 		= 56;
	self.no_grenades_1 		= 4;
	self.no_grenades_2 		= 1;
	self.tp_grenades_1 		= 1;
	self.tp_grenades_2 		= 4;
	self.tf_items 			= 0;
	self.armorclass 		= (self.armorclass | 0);
	self.armortype 			= 0.8;
	self.armor_allowed 		= 0.8;
	self.items 				= ( 1 | 2 | 32);
}