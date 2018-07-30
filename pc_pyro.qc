//=-=-=-=-= Local Functions
void () TeamFortress_Pyro;
//=-=-=-=-=

void () TeamFortress_Pyro = 
{
	self.weapons_carried	= PC_PYRO_WEAPONS;
	self.ammo_rockets 	 	= 20;
	self.ammo_nails 	 	= 0;
	self.ammo_shells 	 	= 20;
	self.ammo_cells 		= 120;
	self.maxammo_rockets 	= 60;
	self.maxammo_nails 	 	= 50;
	self.maxammo_shells  	= 40;
	self.maxammo_cells   	= 200;
	self.no_grenades_1   	= 2;
	self.no_grenades_2   	= 3;
	self.tp_grenades_1   	= GR_TYPE_NORMAL;
	self.tp_grenades_2   	= GR_TYPE_NAPALM;
	self.tf_items 		 	= 0;
	self.armorclass 	 	= (self.armorclass | 16);
	self.armortype 			= 0.6;
	self.armorvalue 		= 50;
	self.armor_allowed 		= 0.6;
	self.maxarmor 			= 150;
	self.max_health			= 100;
	self.current_weapon 	= WEAP_FLAMETHROWER;
	self.items_allowed 		= PC_PYRO_WEAPONS;
	self.items 				= ( 1 | 8 | 16);
};