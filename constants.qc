//
// constants
//

#define FALSE           0
#define TRUE            1

// Weapons

#define WEAP_HOOK                       1
// unused                               2
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
#define WEAP_LAST                       1048576



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
#define HUETF_HEADSHOT_MULTIPLIER 1.75

