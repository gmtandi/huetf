//
// constants
//

#define FALSE           0
#define TRUE            1

// Weapons

#define WEAP_HOOK                       1
#define WEAP_BIOWEAPON                  2
#define WEAP_MEDIKIT                    4
#define WEAP_SPANNER                    8
#define WEAP_AXE                        16
#define WEAP_SNIPER_RIFLE               32
#define WEAP_AUTO_RIFLE                 64
#define WEAP_SHOTGUN                    128
#define WEAP_SUPER_SHOTGUN              256
#define WEAP_NAILGUN                    512
#define WEAP_SUPER_NAILGUN              1024
#define WEAP_GRENADE_LAUNCHER           2048
#define WEAP_FLAMETHROWER               4096
#define WEAP_ROCKET_LAUNCHER            8192
#define WEAP_INCENDIARY                 16384
#define WEAP_ASSAULT_CANNON             32768
#define WEAP_LIGHTNING                  65536
#define WEAP_PLASMAGUN                  131072
#define WEAP_TRANQ                      262144
#define WEAP_RAILGUN                    524288
#define WEAP_TRIBOLT                    1048576
#define WEAP_SNIPERRAIL                 2097152
#define WEAP_LAST                       4194304

// Grenades
#define GR_PRIMETIME            3
#define GR_TYPE_NONE            0
#define GR_TYPE_NORMAL          1
#define GR_TYPE_CONCUSSION      2
#define GR_TYPE_NAIL            3
#define GR_TYPE_MIRV            4
#define GR_TYPE_NAPALM          5
#define GR_TYPE_FLARE           6
#define GR_TYPE_GAS             7
#define GR_TYPE_EMP             8
#define GR_TYPE_FLASH           9
#define GR_TYPE_CALTROP         10

// TeamFortress State Flags
#define TFSTATE_GRENPRIMED		1   // Whether the player has a primed grenade
#define TFSTATE_RELOADING		2   // Whether the player is reloading
#define TFSTATE_ALTKILL			4   // TRUE if killed with a weapon not in self.weapon: NOT USED ANYMORE
#define TFSTATE_RANDOMPC		8   // Whether Playerclass is random, new one each respawn
#define TFSTATE_INFECTED		16  // set when player is infected by the bioweapon
#define TFSTATE_INVINCIBLE		32  // Player has permanent Invincibility (Usually by GoalItem)
#define TFSTATE_INVISIBLE		64  // Player has permanent Invisibility (Usually by GoalItem)
#define TFSTATE_QUAD			128 // Player has permanent Quad Damage (Usually by GoalItem)
#define TFSTATE_RADSUIT			256 // Player has permanent Radsuit (Usually by GoalItem)
#define TFSTATE_BURNING			512 // Is on fire
#define TFSTATE_GRENTHROWING		1024  // is throwing a grenade
#define TFSTATE_AIMING			2048  // is using the laser sight
#define TFSTATE_LOCK            4096 // this state will stop hwguy from shooting assault cannon
#define TFSTATE_RESPAWN_READY		8192  // is waiting for respawn, and has pressed fire
#define TFSTATE_HALLUCINATING		16384  // set when player is hallucinating
#define TFSTATE_TRANQUILISED 		32768  // set when player is tranquilised
#define TFSTATE_CANT_MOVE		65536  // set when player is setting a detpack


#define HUETF_HEADSHOT_DISTANCE   25
#define HUETF_HEADSHOT_MULTIPLIER 1.5


#define PC_SCOUT		1
#define PC_SNIPER		2
#define PC_SOLDIER		3
#define PC_DEMOMAN		4
#define PC_MEDIC		5
#define PC_HWGUY		6
#define PC_PYRO			7
#define PC_SPY			8
#define PC_ENGINEER		9
#define PC_RANDOM		10
#define PC_CIVILIAN		11
#define PC_LASTCLASS    12

// Grenades
#define GR_PRIMETIME		3
#define GR_TYPE_NONE		0
#define GR_TYPE_NORMAL		1
#define GR_TYPE_CONCUSSION	2
#define GR_TYPE_NAIL		3
#define GR_TYPE_MIRV		4
#define GR_TYPE_NAPALM		5
#define GR_TYPE_FLARE		6
#define GR_TYPE_GAS			7
#define GR_TYPE_EMP			8
#define GR_TYPE_FLASH		9
#define GR_TYPE_CALTROP		10
#define GR_TYPE_IMPACT		11

#define ITEM_SCANNER		1

/*======================================================================*/
/* TEAMFORTRESS CLASS DETAILS						*/
/*======================================================================*/
// Class Details for SCOUT


#define PC_SCOUT_MAXSPEED			450	// Maximum movement speed
#define PC_SCOUT_MAXSTRAFESPEED		450	// Maximum strafing movement speed
#define PC_SCOUT_ARMORCLASSES		3 	// #AT_SAVESHOT | #AT_SAVENAIL	<-Armor Classes allowed for this class
#define PC_SCOUT_INITARMORCLASS		0 	// Armorclass worn when respawned
#define PC_SCOUT_WEAPONS			WEAP_AXE | WEAP_SHOTGUN | WEAP_NAILGUN
#define PC_SCOUT_GRENADE_TYPE_1		GR_TYPE_FLASH		//    <- 1st Type of Grenade this class has
#define PC_SCOUT_GRENADE_TYPE_2		GR_TYPE_CONCUSSION	//    <- 2nd Type of Grenade this class has
#define PC_SCOUT_TF_ITEMS			NIT_SCANNER  // <- TeamFortress Items this class has

// Class Details for SNIPER
#define PC_SNIPER_SKIN				5
#define PC_SNIPER_MAXSPEED			300
#define PC_SNIPER_MAXSTRAFESPEED	300
#define PC_SNIPER_ARMORCLASSES		3	// #AT_SAVESHOT | #AT_SAVENAIL
#define PC_SNIPER_WEAPONS			WEAP_SNIPER_RIFLE | WEAP_AUTO_RIFLE | WEAP_AXE | WEAP_NAILGUN
#define PC_SNIPER_REWORK_WEAPONS	WEAP_SNIPERRAIL | WEAP_AUTO_RIFLE | WEAP_AXE | WEAP_NAILGUN
#define PC_SNIPER_GRENADE_TYPE_1	GR_TYPE_NORMAL
#define PC_SNIPER_GRENADE_TYPE_2	GR_TYPE_FLARE

// Class Details for SOLDIER
#define PC_SOLDIER_SKIN				6
#define PC_SOLDIER_MAXSPEED			240
#define PC_SOLDIER_MAXSTRAFESPEED	240
#define PC_SOLDIER_ARMORCLASSES		31	// ALL
#define PC_SOLDIER_WEAPONS			WEAP_AXE | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN | WEAP_ROCKET_LAUNCHER
#define PC_SOLDIER_GRENADE_TYPE_1	GR_TYPE_NORMAL
#define PC_SOLDIER_GRENADE_TYPE_2	GR_TYPE_NAIL

// Class Details for DEMOLITION MAN
#define PC_DEMOMAN_SKIN				1
#define PC_DEMOMAN_MAXSPEED			280
#define PC_DEMOMAN_MAXSTRAFESPEED	280
#define PC_DEMOMAN_ARMORCLASSES		31	// ALL
#define PC_DEMOMAN_WEAPONS			WEAP_AXE | WEAP_SHOTGUN | WEAP_GRENADE_LAUNCHER
#define PC_DEMOMAN_GRENADE_TYPE_1	GR_TYPE_NORMAL
#define PC_DEMOMAN_GRENADE_TYPE_2	GR_TYPE_MIRV


// Class Details for COMBAT MEDIC
#define PC_MEDIC_SKIN				3
#define PC_MEDIC_MAXSPEED			320
#define PC_MEDIC_MAXSTRAFESPEED		320
#define PC_MEDIC_ARMORCLASSES		11	// ALL except EXPLOSION
#define PC_MEDIC_WEAPONS			WEAP_BIOWEAPON | WEAP_MEDIKIT | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN | WEAP_SUPER_NAILGUN
#define PC_MEDIC_GRENADE_TYPE_1		GR_TYPE_NORMAL
#define PC_MEDIC_GRENADE_TYPE_2		GR_TYPE_CONCUSSION

// Class Details for HWGUY
#define PC_HWGUY_SKIN				2
#define PC_HWGUY_MAXSPEED			230
#define PC_HWGUY_MAXSTRAFESPEED		230
#define PC_HWGUY_ARMORCLASSES		31	// ALL
#define PC_HWGUY_WEAPONS			WEAP_ASSAULT_CANNON | WEAP_AXE | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN
#define PC_HWGUY_REWORK_WEAPONS		WEAP_TRIBOLT | WEAP_AXE | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN
#define PC_HWGUY_GRENADE_TYPE_1		GR_TYPE_NORMAL
#define PC_HWGUY_GRENADE_TYPE_2		GR_TYPE_MIRV


// Class Details for PYRO
#define PC_PYRO_SKIN				21
#define PC_PYRO_MAXSPEED			300
#define PC_PYRO_MAXSTRAFESPEED		300
#define PC_PYRO_ARMORCLASSES		27	// ALL except EXPLOSION
#define PC_PYRO_INITARMORCLASS		16	// AT_SAVEFIRE
#define PC_PYRO_WEAPONS				WEAP_INCENDIARY | WEAP_FLAMETHROWER | WEAP_AXE | WEAP_SHOTGUN
#define PC_PYRO_GRENADE_TYPE_1		GR_TYPE_NORMAL
#define PC_PYRO_GRENADE_TYPE_2		GR_TYPE_NAPALM

// Class Details for SPY
#define PC_SPY_SKIN					22
#define PC_SPY_MAXSPEED				300
#define PC_SPY_MAXSTRAFESPEED		300
#define PC_SPY_ARMORCLASSES			27	// ALL except EXPLOSION
#define PC_SPY_WEAPONS				WEAP_AXE | WEAP_TRANQ | WEAP_SUPER_SHOTGUN | WEAP_NAILGUN
#define PC_SPY_GRENADE_TYPE_1		GR_TYPE_NORMAL
#define PC_SPY_GRENADE_TYPE_2		GR_TYPE_GAS
#define PC_SPY_CELL_REGEN_TIME		5
#define PC_SPY_CELL_REGEN_AMOUNT	1
#define PC_SPY_CELL_USAGE			3	// Amount of cells spent while invisible
#define PC_SPY_GO_UNDERCOVER_TIME	4	// Time it takes to go undercover

// Class Details for ENGINEER
#define PC_ENGINEER_SKIN			22	// Not used anymore
#define PC_ENGINEER_MAXSPEED		300
#define PC_ENGINEER_MAXSTRAFESPEED	300
#define PC_ENGINEER_ARMORCLASSES	31	// ALL
#define PC_ENGINEER_WEAPONS			WEAP_SPANNER | WEAP_RAILGUN | WEAP_SUPER_SHOTGUN
#define PC_ENGINEER_GRENADE_TYPE_1	GR_TYPE_NORMAL
#define PC_ENGINEER_GRENADE_TYPE_2	GR_TYPE_EMP

// Class Details for CIVILIAN
#define PC_CIVILIAN_SKIN			22
#define PC_CIVILIAN_MAXSPEED		240
#define PC_CIVILIAN_MAXSTRAFESPEED	240
#define PC_CIVILIAN_WEAPONS			WEAP_AXE
#define PC_CIVILIAN_DM_WEAPONS		WEAP_AXE | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN | WEAP_NAILGUN | WEAP_SUPER_NAILGUN | WEAP_GRENADE_LAUNCHER | WEAP_LIGHTNING | WEAP_ROCKET_LAUNCHER