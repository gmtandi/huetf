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



// Defines for the playerclass
#define PC_UNDEFINED		0

#define PC_SCOUT		1
#define PC_SNIPER		2
#define PC_SOLDIER		3
#define PC_DEMOMAN		4
#define PC_MEDIC		5
#define PC_HVYWEAP		6
#define PC_PYRO			7
#define PC_SPY			8
#define PC_ENGINEER		9

#define HUETF_HEADSHOT_DISTANCE   25
#define HUETF_HEADSHOT_MULTIPLIER 1.5

/*======================================================*/
/* Death Message defines				*/
/*======================================================*/

#define DMSG_SHOTGUN			1
#define DMSG_SSHOTGUN			2
#define DMSG_NAILGUN			3
#define DMSG_SNAILGUN			4
#define DMSG_GRENADEL			5
#define DMSG_ROCKETL			6
#define DMSG_LIGHTNING			7
#define DMSG_GREN_HAND			8
#define DMSG_GREN_NAIL			9
#define DMSG_GREN_MIRV			10
#define DMSG_GREN_PIPE			11
#define DMSG_DETPACK			12
#define DMSG_BIOWEAPON          13
#define DMSG_BIOWEAPON_ATT      14
#define DMSG_FLAME			15
#define DMSG_DETPACK_DIS		16
#define DMSG_AXE			17
#define DMSG_SNIPERRIFLE		18
#define DMSG_AUTORIFLE			19
#define DMSG_ASSAULTCANNON		20
#define DMSG_HOOK			21
#define DMSG_BACKSTAB			22
#define DMSG_MEDIKIT			23
#define DMSG_GREN_GAS			24
#define DMSG_TRANQ			25
#define DMSG_LASERBOLT			26
#define DMSG_SENTRYGUN_BULLET		27
#define DMSG_SNIPERLEGSHOT		28
#define DMSG_SNIPERHEADSHOT		29
#define DMSG_GREN_EMP			30
#define DMSG_GREN_EMP_AMMO		31
#define DMSG_SPANNER			32
#define DMSG_INCENDIARY			33
#define DMSG_SENTRYGUN_ROCKET		34
#define DMSG_GREN_FLASH			35
#define DMSG_TRIGGER			36

// message levels
#define	PRINT_LOW	0		// pickup messages
#define	PRINT_MEDIUM	1		// death messages
#define	PRINT_HIGH	2		// critical messages
#define PRINT_CHAT	3		// also goes to chat console

// edict.movetype values
#define MOVETYPE_NONE			0 	// never moves
//#define MOVETYPE_ANGLENOCLIP	1
//#define MOVETYPE_ANGLECLIP	2
#define MOVETYPE_WALK			3 	// players only
#define MOVETYPE_STEP			4 	// discrete, not real time unless fall
#define MOVETYPE_FLY			5
#define MOVETYPE_TOSS			6 	// gravity
#define MOVETYPE_PUSH			7 	// no clip to world, push and crush
#define MOVETYPE_NOCLIP			8
#define MOVETYPE_FLYMISSILE		9 	// fly with extra size against monsters
#define MOVETYPE_BOUNCE			10
#define MOVETYPE_BOUNCEMISSILE		11 	// bounce with extra size

// edict.solid values
#define SOLID_NOT	0 	// no interaction with other objects
#define SOLID_TRIGGER	1 	// touch on edge, but not blocking
#define SOLID_BBOX	2 	// touch on edge, block
#define SOLID_SLIDEBOX	3 	// touch on edge, but not an onground
#define SOLID_BSP	4 	// bsp clip, touch on edge, block

// edict.flags
#define FL_FLY		1
#define FL_SWIM		2
#define FL_CLIENT	8 	// set for all client edicts
#define FL_INWATER	16 	// for enter / leave water splash
#define FL_MONSTER	32
#define FL_GODMODE	64 	// player cheat
#define FL_NOTARGET	128 	// player cheat
#define FL_ITEM		256 	// extra wide size for bonus items
#define FL_ONGROUND	512 	// standing on something
#define FL_PARTIALGROUND	1024 	// not all corners are valid
#define FL_WATERJUMP	2048 	// player jumping out of water
#define FL_JUMPRELEASED	4096 	// for jump debouncing