//=-=-=-=-=
void () TeamFortress_Medic;
void () TeamFortress_Regenerate;

void () TeamFortress_Medic = 
{
	local entity te;
	self.weapons_carried 	= PC_MEDIC_WEAPONS;
	self.ammo_rockets 		= 0;
	self.ammo_nails 		= 50;
	self.ammo_shells 		= 50;
	self.ammo_cells 		= 0;
	self.maxammo_rockets 	= 25;
	self.maxammo_nails 		= 150;
	self.maxammo_shells 	= 80;
	self.maxammo_cells 		= 50;
	self.no_grenades_1 		= 3;
	self.no_grenades_2 		= 3;
	self.tp_grenades_1 		= GR_TYPE_NORMAL;
	self.tp_grenades_2 		= GR_TYPE_CONCUSSION;
	self.tf_items 			= 0;
	self.armorclass 		= (self.armorclass | 0);
	self.armortype 			= 0.3;
	self.armorvalue 		= 50;
	self.armor_allowed 		= 0.6;
	self.maxarmor 			= 100;
	self.max_health			= 90;
	self.current_weapon 	= WEAP_SUPER_NAILGUN;
	self.ammo_medikit 		= 50;
	self.maxammo_medikit 	= 100;
	te 						= spawn ();
	te.nextthink 			= (time + 3);
	te.think 				= TeamFortress_Regenerate;
	te.owner 				= self;
	te.classname 			= "timer";
	self.items_allowed 		= PC_MEDIC_WEAPONS;
	self.items 				= ( 1 | 2 | 8);
};

void () TeamFortress_Regenerate =
{
	if ((self.owner.playerclass == PC_MEDIC))
	{
		self.nextthink = (time + 3);
		if ((self.owner.has_disconnected == 1))
		{
			dremove (self);
			return;
		}
		if ((self.owner.health >= self.owner.max_health))
		{
			return;
		}
		if ((self.owner.ammo_medikit == 0))
		{
			return;
		}
		if ((self.owner.ammo_medikit < 2))
		{
			self.owner.health = (self.owner.health + self.owner.ammo_medikit);
			self.owner.ammo_medikit = 0;
		}
		else
		{
			self.owner.health = (self.owner.health + 2);
			self.owner.ammo_medikit = (self.owner.ammo_medikit - 2);
		}
		if ((self.owner.health > self.owner.max_health))
		{
			self.owner.health = self.owner.max_health;
		}
	}
};