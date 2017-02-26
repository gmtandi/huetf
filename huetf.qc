entity self;
entity other;
entity world;
float time;
float frametime;
entity newmis;
float force_retouch;
string mapname;
float serverflags;
float total_secrets;
float total_monsters;
float found_secrets;
float killed_monsters;
float parm1;
float parm2;
float parm3;
float parm4;
float parm5;
float parm6;
float parm7;
float parm8;
float parm9;
float parm10;
float parm11;
float parm12;
float parm13;
float parm14;
float parm15;
float parm16;
vector v_forward;
vector v_up;
vector v_right;
float trace_allsolid;
float trace_startsolid;
float trace_fraction;
vector trace_endpos;
vector trace_plane_normal;
float trace_plane_dist;
entity trace_ent;
float trace_inopen;
float trace_inwater;
entity msg_entity;
void () main;
void () StartFrame;
void () PlayerPreThink;
void () PlayerPostThink;
void () ClientKill;
void () ClientConnect;
void () PutClientInServer;
void () ClientDisconnect;
void () SetNewParms;
void () SetChangeParms;
void end_sys_globals;
.float modelindex;
.vector absmin;
.vector absmax;
.float ltime;
.float lastruntime;
.float movetype;
.float solid;
.vector origin;
.vector oldorigin;
.vector velocity;
.vector angles;
.vector avelocity;
.string classname;
.string model;
.float frame;
.float skin;
.float effects;
.vector mins;
.vector maxs;
.vector size;
.void() touch;
.void() use;
.void() think;
.void() blocked;
.float nextthink;
.entity groundentity;
.float health;
.float frags;
.float weapon;
.string weaponmodel;
.float weaponframe;
.float currentammo;
.float ammo_shells;
.float ammo_nails;
.float ammo_rockets;
.float ammo_cells;
.float items;
.float takedamage;
.entity chain;
.float deadflag;
.vector view_ofs;
.float button0;
.float button1;
.float button2;
.float impulse;
.float fixangle;
.vector v_angle;
.string netname;
.entity enemy;
.float flags;
.float colormap;
.float team;
.float max_health;
.float teleport_time;
.float armortype;
.float armorvalue;
.float waterlevel;
.float watertype;
.float ideal_yaw;
.float yaw_speed;
.entity aiment;
.entity goalentity;
.float spawnflags;
.string target;
.string targetname;
.float dmg_take;
.float dmg_save;
.entity dmg_inflictor;
.entity owner;
.vector movedir;
.string message;
.float sounds;
.string noise;
.string noise1;
.string noise2;
.string noise3;
void end_sys_fields;
float movedist;
string string_null    = "";
float empty_float    = 0;
entity activator;
entity damage_attacker;
float framecount    = 0;
float skill;
float teamplay;
float timelimit;
float fraglimit;
float deathmatch;
.string wad;
.string map;
.float worldtype;
.string killtarget;
.float light_lev;
.float style;
.void() th_stand;
.void() th_walk;
.void() th_run;
.void() th_missile;
.void() th_melee;
.void(entity attacker, float damage) th_pain;
.void() th_die;
.entity oldenemy;
.float speed;
.float lefty;
.float search_time;
.float attack_state;
.float walkframe;
.float voided;
.float maxspeed;
.float gravity;
.float attack_finished;
.float pain_finished;
.float invincible_finished;
.float invisible_finished;
.float super_damage_finished;
.float radsuit_finished;
.float invincible_time;
.float invincible_sound;
.float invisible_time;
.float invisible_sound;
.float super_time;
.float super_sound;
.float rad_time;
.float fly_sound;
.float axhitme;
.float show_hostile;
.float jump_flag;
.float swim_flag;
.float air_finished;
.float bubble_count;
.string deathtype;
.string mdl;
.vector mangle;
.float t_length;
.float t_width;
.vector dest;
.vector dest1;
.vector dest2;
.float wait;
.float delay;
.entity trigger_field;
.string noise4;
.float pausetime;
.entity movetarget;
.float aflag;
.float dmg;
.float cnt;
.float cnt2;
.void() think1;
.vector finaldest;
.vector finalangle;
.float count;
.float lip;
.float state;
.vector pos1;
.vector pos2;
.float height;
.float oldheight;
.float waitmin;
.float waitmax;
.float distance;
.float volume;
.float flash_flag;
.entity flash;
void (vector ang) makevectors = #1;
void (entity e, vector o) setorigin = #2;
void (entity e, string m) setmodel = #3;
void (entity e, vector min, vector max) setsize = #4;
void () break = #6;
float () random = #7;
void (entity e, float chan, string samp, float vol, float atten) sound = #8;
vector (vector v) normalize = #9;
void (string e) error = #10;
void (string e) objerror = #11;
float (vector v) vlen = #12;
float (vector v) vectoyaw = #13;
entity () spawn = #14;
void (entity e) remove = #15;
void (vector v1, vector v2, float nomonsters, entity forent) traceline = #16;
entity () checkclient = #17;
entity (entity start, .string fld, string match) find = #18;
string (string s) precache_sound = #19;
string (string s) precache_model = #20;
void (entity client, string s) stuffcmd = #21;
entity (vector org, float rad) findradius = #22;
void (...) bprint = #23;
void (...) bprint2 = #23;
void (...) bprint3 = #23;
void (...) bprint4 = #23;
void (...) bprint5 = #23;
void (...) bprint6 = #23;
void (...) bprint7 = #23;
void (...) bprint8 = #23;
void (...) sprint = #24;
void (...) sprint2 = #24;
void (...) sprint3 = #24;
void (...) sprint4 = #24;
void (...) sprint5 = #24;
void (...) sprint6 = #24;
void (...) sprint7 = #24;
void (...) sprint8 = #24;
void (...) dprint = #25;

string (float f) ftos = #26;
string (vector v) vtos = #27;
void () coredump = #28;
void () traceon = #29;
void () traceoff = #30;
void (entity e) eprint = #31;
float (float yaw, float dist) walkmove = #32;
float() droptofloor= #34;
void (float style, string value) lightstyle = #35;
float (float v) rint = #36;
float (float v) floor = #37;
float (float v) ceil = #38;
float (entity e) checkbottom = #40;
float (vector v) pointcontents = #41;
float (float f) fabs = #43;
vector (entity e, float speed) aim = #44;
float (string s) cvar = #45;
void (string s) localcmd = #46;
entity (entity e) nextent = #47;
void (vector o, vector d, float color, float count) particle = #48;
void () ChangeYaw = #49;
vector (vector v) vectoangles = #51;
void (float to, float f) WriteByte = #52;
void (float to, float f) WriteChar = #53;
void (float to, float f) WriteShort = #54;
void (float to, float f) WriteLong = #55;
void (float to, float f) WriteCoord = #56;
void (float to, float f) WriteAngle = #57;
void (float to, string s) WriteString = #58;
void (float to, entity s) WriteEntity = #59;

//merc added functions
float(float f) sin = #60;
float(float f) cos = #61;
float(float f) sqrt = #62;
float(float val1, float val2) min = #63;
float(float val1, float val2) max = #64;
//end

void (float step) movetogoal = #67;
string (string s) precache_file = #68;
void (entity e) makestatic = #69;
void (string s) changelevel = #70;
void (string var, string val) cvar_set = #72;
void (entity client, string s, ...) centerprint = #73;








void (vector pos, string samp, float vol, float atten) ambientsound = #74;
string (string s) precache_model2 = #75;
string (string s) precache_sound2 = #76;
string (string s) precache_file2 = #77;
void (entity e) setspawnparms = #78;
void(entity killer, entity killee) logfrag = #79;
string(entity e, string key) infokey = #80;
float(string s) stof = #81;
void (vector where, float set) multicast = #82;
//void () executecmd = #83;



void(string str) tokanize = #84; // tokanize text
float() argc = #85; // returns number of tokens
string(float num) argv = #86; // returns token for the given number

//string (.string field) teamfield = #87;
string (string str, float start, float len) substr = #88;
string (string str1, string str2) strcat = #89;
float (string str) strlen = #90;
float (string str) str2byte = #91;
float (string str) str2short = #92;
string (string str , float size) newstr = #93;
void (string str) freestr = #94;

//void(string str) conprint = #95;   // prints to server console only (no redirects)
string (string str) readcmd = #96; // executes command on server, but result is returned by this function instead of writing to the console
//void(string dst, string src) strcpy = #97;   // copies src to dst
string(string str, string substr) strstr = #98; // searches for substring in str, returns pointer to it or "" if not found
//void(string dst, string src, float n) strncpy = #99;  // copies max n chars to dst
void(string logname, float console, string text) logname = #100; // prints text to file 'logname', if console is non-zero, prints to the server console as well
void(entity cl, string text) redirectcmd = #101;        // executes string on the console and redirects output to client (eg redirect(self, "status"))
void() calltimeofday = #102;            // force server to call mod function timeofday
float (string s) findmap = #104;
float(entity client, float level, float range, float start, float style, float footer) listmaps = #105;
string(float id) findmapname = #106;

//void () calltimeofday;

float minrate = 0;

void () SUB_CalcMoveDone;
void () SUB_CalcAngleMoveDone;
void () SUB_Null;
void () SUB_UseTargets;
void () SUB_Remove;
void (entity targ, entity inflictor, entity attacker, float damage) T_Damage;
float (entity e, float healamount, float ignore) T_Heal;
float (entity targ, entity inflictor) CanDamage;
void (entity Goal, entity AP, entity ActivatingGoal) AttemptToActivate;
.float forward;
.float right;
.float up;
.float sbar_type;
.float playerclass;
.float cheat_check;
.float nextpc;
.float last_impulse;
.float armorclass;
.float tf_items;
.float tf_items_flags;
.float no_grenades_1;
.float no_grenades_2;
.float tp_grenades_1;
.float tp_grenades_2;
.float get_aliases;
.float get_admin_aliases;
.float is_removed;
.float is_undercover;
.float is_building;
.float is_detpacking;
.float is_feigning;
.float is_unabletospy;
.float has_disconnected;
.float tfstate;
.entity linked_list;
.entity observer_list;
.float maxammo_shells;
.float maxammo_nails;
.float maxammo_cells;
.float maxammo_rockets;
.float items_allowed;
.float armor_allowed;
.float maxarmor;
.float weaponmode;
.float motd;
.float current_menu;
.float menu_count;
.float menu_displaytime;
.float tfkey;
float lights;
float practice;
float sgtype;
float grentype;
float tfstrike;
float duel;
float rounds;
float round_active;
float round_over;
float tfs_winner;
float num_hostages;
float toggleflags;
float respawn_delay_time;
float number_of_teams;
float num_teams    = 0;
float illegalclasses;
float civilianteams;
float team1col;
float team2col;
float team3col;
float team4col;
float team1score;
float team2score;
float team3score;
float team4score;
float team1maxplayers;
float team2maxplayers;
float team3maxplayers;
float team4maxplayers;
.float team_no;
.float infection_team_no;
float CTF_Map;
float coop    = 0;
float rj;
.float tracking;
.entity building;
.float building_wait;
.entity real_owner;
.float has_dispenser;
.float has_sentry;
.float real_frags;
.float deaths;
.float respawn_time;
.float weapons_carried;
.float current_weapon;
.float last_weapon;
.float last_weaponmode;
.float ammo_medikit;
.float maxammo_medikit;
.float ammo_detpack;
.float maxammo_detpack;
.float reload_shotgun;
.float reload_super_shotgun;
.float reload_grenade_launcher;
.float reload_rocket_launcher;
.float heat;
.float immune_to_check;
.float last_sound;
.float no_active_nail_grens;
.float no_active_napalm_grens;
.float no_active_gas_grens;
.float goal_no;
.float group_no;
.float goal_state;
.float owned_by;
.float goal_activation;
.float goal_effects;
.float goal_result;
.float goal_group;
.float else_goal;
.float if_goal_is_active;
.float if_goal_is_inactive;
.float if_goal_is_removed;
.float if_group_is_active;
.float if_group_is_inactive;
.float if_group_is_removed;
.float activate_goal_no;
.float inactivate_goal_no;
.float remove_goal_no;
.float restore_goal_no;
.float activate_group_no;
.float inactivate_group_no;
.float remove_group_no;
.float restore_group_no;
.vector goal_min;
.vector goal_max;
.float has_item_from_group;
.float hasnt_item_from_group;
.float remove_item_group;
.float return_item_no;
.float if_item_has_moved;
.float if_item_hasnt_moved;
.float remove_spawnpoint;
.float restore_spawnpoint;
.float remove_spawngroup;
.float restore_spawngroup;
.float display_item_status1;
.float display_item_status2;
.float display_item_status3;
.float display_item_status4;
.string team_str_home;
.string team_str_moved;
.string team_str_carried;
.string non_team_str_home;
.string non_team_str_moved;
.string non_team_str_carried;
.float ex_skill_min;
.float ex_skill_max;
.float increase_team1;
.float increase_team2;
.float increase_team3;
.float increase_team4;
.string broadcast;
.string team_broadcast;
.string non_team_broadcast;
.string owners_team_broadcast;
.string netname_broadcast;
.string netname_team_broadcast;
.string netname_non_team_broadcast;
.string netname_owners_team_broadcast;
.string team_drop;
.string non_team_drop;
.string netname_team_drop;
.string netname_non_team_drop;
string team_menu_string;
.float all_active;
.float item_list;
float item_list_bit;
.float delay_time;
.float dont_do_triggerwork;
.float g_a;
.float g_e;
.string t_s_h;
.string t_s_m;
.string t_s_c;
.string n_s_h;
.string n_s_m;
.string n_s_c;
.string b_b;
.string b_t;
.string b_n;
.string b_o;
.string n_b;
.string n_t;
.string n_n;
.string n_o;
.string d_t;
.string d_n;
.string d_n_t;
.string d_n_n;
.float h_i_g;
.float hn_i_g;
.float r_i_g;
.float a_s;
.float a_n;
.float a_r;
.float a_c;
.float rv_s_h;
.float rs_s_h;
.float rv_gr;
.float rs_gr;
.float rv_g;
.float rs_g;
.float has_abbreviated;
float num_world_flames;
.float numflames;
.string flame_id;
float num_world_pipebombs;
float num_team_pipebombs_1;
float num_team_pipebombs_2;
float num_team_pipebombs_3;
float num_team_pipebombs_4;
float num_max_pipebombs;
float num_world_flares;
float num_team_flares_1;
float num_team_flares_2;
float num_team_flares_3;
float num_team_flares_4;
float num_max_flares;
float num_world_ammoboxes;
float num_team_ammoboxes_1;
float num_team_ammoboxes_2;
float num_team_ammoboxes_3;
float num_team_ammoboxes_4;
float num_max_ammoboxes;
.float undercover_team;
.float undercover_skin;
.string undercover_name;
.float hook_out;
float live_camera    = 0;
.float camdist;
.vector camangle;
.entity camera_list;
float already_chosen_map;
.entity hook;
.float on_hook;
.float fire_held_down;
.vector head_shot_vector;
.float leg_damage;
.float nailpos;
.float StatusRefreshTime;
.float StatusBarSize;
.float StatusBarRes;
.float mapcount;
float gspeed;
float tfvsdm;
float freeze;
float allow_flash;
float allow_grenpack;
float sentry_speed;
float sentry_delay;
float sentry_fire;
float pipedelay;
float pmtime;
.float dmg_inflicted;
.float dmg_recieved;
.float dmg_self;
.float dmg_team;
.float ScannerOn;
float clanbattle;
float cb_prematch;
float elect;
float v_break;
.float allowvote;
.float electtime;
float team1frags;
float team2frags;
float team3frags;
float team4frags;
float allow_hook;
float flagem_checked;
float cease_fire;
.float teamkills;
float autokick_time;
float autokick_kills;
.float vote;
.float bvote;
.float is_admin;
.float admin_mode;
.entity admin_use;
.string ip;
float deathmsg;
float speedcap;

void (float psize, entity p) KickPlayer =
{
	msg_entity = p;
	if ((psize > -3))
	{
		WriteByte (1, 34);
	}
	else
	{
		WriteByte (1, 35);
	}
};

void () muzzleflash =
{
	WriteByte (4, 39);
	WriteEntity (4, self);
	multicast (self.origin, 2);
};
void (float normal) SUB_AttackFinished;
float (entity targ) visible;

void (void() thinkst) SUB_CheckRefire =
{
	if ((skill != 3))
	{
		return;
	}
	if ((self.cnt == 1))
	{
		return;
	}
	if (!visible (self.enemy))
	{
		return;
	}
	self.cnt = 1;
	self.think = thinkst;
};
float RANGE_MELEE    = 0;
float RANGE_NEAR    = 1;
float RANGE_MID    = 2;
float RANGE_FAR    = 3;
float AS_STRAIGHT    = 1;
float AS_SLIDING    = 2;
float AS_MELEE    = 3;
float AS_MISSILE    = 4;
float (float v) anglemod;
void (vector dest3) ChooseTurn;
void () ai_face;
float enemy_vis;
float enemy_infront;
float enemy_range;
float enemy_yaw;

float () CheckAttack =
{
	local vector spot1;
	local vector spot2;
	local entity targ;
	local float chance;

	targ = self.enemy;
	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	traceline (spot1, spot2, RANGE_MELEE, self);
	if ((trace_ent != targ))
	{
		return (RANGE_MELEE);
	}
	if ((trace_inopen && trace_inwater))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_MELEE))
	{
		if (self.th_melee)
		{
			self.th_melee ();
			return (AS_STRAIGHT);
		}
	}
	if (!self.th_missile)
	{
		return (RANGE_MELEE);
	}
	if ((time < self.attack_finished))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_FAR))
	{
		return (RANGE_MELEE);
	}
	if ((enemy_range == RANGE_MELEE))
	{
		chance = 0.9;
		self.attack_finished = RANGE_MELEE;
	}
	else
	{
		if ((enemy_range == RANGE_NEAR))
		{
			if (self.th_melee)
			{
				chance = 0.2;
			}
			else
			{
				chance = 0.4;
			}
		}
		else
		{
			if ((enemy_range == RANGE_MID))
			{
				if (self.th_melee)
				{
					chance = 0.05;
				}
				else
				{
					chance = 0.1;
				}
			}
			else
			{
				chance = RANGE_MELEE;
			}
		}
	}
	if ((random () < chance))
	{
		self.th_missile ();
		SUB_AttackFinished ((AS_SLIDING * random ()));
		return (AS_STRAIGHT);
	}
	return (RANGE_MELEE);
};
float (entity targ) infront;
float (entity targ) range;

void (float d) ai_charge =
{
	ai_face ();
	movetogoal (d);
};

void () ai_charge_side =
{
	local vector dtemp;
	local float heading;

	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	ChangeYaw ();
	makevectors (self.angles);
	dtemp = (self.enemy.origin - (30 * v_right));
	heading = vectoyaw ((dtemp - self.origin));
	walkmove (heading, 20);
};

void () ai_melee =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	delta = (self.enemy.origin - self.origin);
	if ((vlen (delta) > 60))
	{
		return;
	}
	ldmg = (((random () + random ()) + random ()) * AS_MELEE);
	T_Damage (self.enemy, self, self, ldmg);
};

void () ai_melee_side =
{
	local vector delta;
	local float ldmg;

	if (!self.enemy)
	{
		return;
	}
	ai_charge_side ();
	delta = (self.enemy.origin - self.origin);
	if ((vlen (delta) > 60))
	{
		return;
	}
	if (!CanDamage (self.enemy, self))
	{
		return;
	}
	ldmg = (((random () + random ()) + random ()) * AS_MELEE);
	T_Damage (self.enemy, self, self, ldmg);
};
void () t_movetarget;
float current_yaw    = 0;
entity sight_entity;
float sight_entity_time;

void () movetarget_f =
{
	if (!self.targetname)
	{
		objerror ("monster_movetarget: no targetname");
	}
	self.solid = AS_STRAIGHT;
	self.touch = t_movetarget;
	setsize (self, '-8 -8 -8', '8 8 8');
};

void () path_corner =
{
	movetarget_f ();
};

void () t_movetarget =
{
	local entity temp;

	if ((other.movetarget != self))
	{
		return;
	}
	if (other.enemy)
	{
		return;
	}
	temp = self;
	self = other;
	other = temp;
	self.movetarget = find (world, targetname, other.target);
	self.goalentity = find (world, targetname, other.target);
	self.ideal_yaw = vectoyaw ((self.goalentity.origin - self.origin));
	if (!self.movetarget)
	{
		self.pausetime = (time + 999999);
		self.th_stand ();
		return;
	}
};

float (float v) anglemod =
{
	while ((v >= 360))
	{
		v = (v - 360);
	}
	while ((v < RANGE_MELEE))
	{
		v = (v + 360);
	}
	return (v);
};

float (entity targ) range =
{
	local vector spot1;
	local vector spot2;
	local float r;

	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	r = vlen ((spot1 - spot2));
	if ((r < 120))
	{
		return (RANGE_MELEE);
	}
	if ((r < 500))
	{
		return (AS_STRAIGHT);
	}
	if ((r < 1000))
	{
		return (AS_SLIDING);
	}
	return (AS_MELEE);
};

float (entity targ) visible =
{
	local vector spot1;
	local vector spot2;

	spot1 = (self.origin + self.view_ofs);
	spot2 = (targ.origin + targ.view_ofs);
	traceline (spot1, spot2, AS_STRAIGHT, self);
	if ((trace_inopen && trace_inwater))
	{
		return (RANGE_MELEE);
	}
	if ((trace_fraction == AS_STRAIGHT))
	{
		return (AS_STRAIGHT);
	}
	return (RANGE_MELEE);
};

float (entity targ) infront =
{
	local vector vec;
	local float dot;

	makevectors (self.angles);
	vec = normalize ((targ.origin - self.origin));
	dot = (vec * v_forward);
	if ((dot > 0.3))
	{
		return (AS_STRAIGHT);
	}
	return (RANGE_MELEE);
};

void () HuntTarget =
{
	self.goalentity = self.enemy;
	self.think = self.th_run;
	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	self.nextthink = (time + 0.1);
	SUB_AttackFinished (AS_STRAIGHT);
};

void () FoundTarget =
{
	if ((self.enemy.classname == "player"))
	{
		sight_entity = self;
		sight_entity_time = time;
	}
	self.show_hostile = (time + AS_STRAIGHT);
	HuntTarget ();
};

float () FindTarget =
{
	local entity client;
	local float r;

	if (((sight_entity_time >= (time - 0.1)) && !(self.spawnflags & AS_MELEE)))
	{
		client = sight_entity;
		if ((client.enemy == self.enemy))
		{
			return (RANGE_MELEE);
		}
	}
	else
	{
		client = checkclient ();
		if (!client)
		{
			return (RANGE_MELEE);
		}
	}
	if (tfstrike)
	{
		if (round_over)
		{
			return (RANGE_MELEE);
		}
		if ((client.team_no != AS_STRAIGHT))
		{
			return (RANGE_MELEE);
		}
		if (self.tfstate)
		{
			return (RANGE_MELEE);
		}
	}
	if ((client == self.enemy))
	{
		return (RANGE_MELEE);
	}
	if ((client.flags & 128))
	{
		return (RANGE_MELEE);
	}
	if ((client.items & 524288))
	{
		return (RANGE_MELEE);
	}
	r = range (client);
	if ((r == RANGE_FAR))
	{
		return (RANGE_MELEE);
	}
	if (!visible (client))
	{
		return (RANGE_MELEE);
	}
	if ((r == RANGE_NEAR))
	{
		if (((client.show_hostile < time) && !infront (client)))
		{
			return (RANGE_MELEE);
		}
	}
	else
	{
		if ((r == RANGE_MID))
		{
			if (!infront (client))
			{
				return (RANGE_MELEE);
			}
		}
	}
	self.enemy = client;
	if ((self.enemy.classname != "player"))
	{
		self.enemy = self.enemy.enemy;
		if ((self.enemy.classname != "player"))
		{
			self.enemy = world;
			return (RANGE_MELEE);
		}
	}
	FoundTarget ();
	return (AS_STRAIGHT);
};

void (float dist) ai_forward =
{
	walkmove (self.angles_y, dist);
};

void (float dist) ai_back =
{
	walkmove ((self.angles_y + 180), dist);
};

void (float dist) ai_pain =
{
	ai_back (dist);
};

void (float dist) ai_painforward =
{
	walkmove (self.ideal_yaw, dist);
};

void (float dist) ai_walk =
{
	local vector mtemp;

	movedist = dist;
	if ((self.classname == "monster_dragon"))
	{
		movetogoal (dist);
		return;
	}
	if (FindTarget ())
	{
		return;
	}
};

void () ai_stand =
{
	if (FindTarget ())
	{
		return;
	}
	if ((time > self.pausetime))
	{
		self.th_walk ();
		return;
	}
};

void () ai_turn =
{
	if (FindTarget ())
	{
		return;
	}
	ChangeYaw ();
};

void (vector dest3) ChooseTurn =
{
	local vector dir;
	local vector newdir;

	dir = (self.origin - dest3);
	newdir_x = trace_plane_normal_y;
	newdir_y = (RANGE_MELEE - trace_plane_normal_x);
	newdir_z = RANGE_MELEE;
	if (((dir * newdir) > RANGE_MELEE))
	{
		dir_x = (RANGE_MELEE - trace_plane_normal_y);
		dir_y = trace_plane_normal_x;
	}
	else
	{
		dir_x = trace_plane_normal_y;
		dir_y = (RANGE_MELEE - trace_plane_normal_x);
	}
	dir_z = RANGE_MELEE;
	self.ideal_yaw = vectoyaw (dir);
};

float () FacingIdeal =
{
	local float delta;

	delta = anglemod ((self.angles_y - self.ideal_yaw));
	if (((delta > 45) && (delta < 315)))
	{
		return (RANGE_MELEE);
	}
	return (AS_STRAIGHT);
};

void () ai_run_melee =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (FacingIdeal ())
	{
		self.th_melee ();
		self.attack_state = AS_STRAIGHT;
	}
};

void () ai_run_missile =
{
	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (FacingIdeal ())
	{
		self.th_missile ();
		self.attack_state = AS_STRAIGHT;
	}
};

void () ai_run_slide =
{
	local float ofs;

	self.ideal_yaw = enemy_yaw;
	ChangeYaw ();
	if (self.lefty)
	{
		ofs = 90;
	}
	else
	{
		ofs = -90;
	}
	if (walkmove ((self.ideal_yaw + ofs), movedist))
	{
		return;
	}
	self.lefty = (AS_STRAIGHT - self.lefty);
	walkmove ((self.ideal_yaw - ofs), movedist);
};

void (float dist) ai_run =
{
	local vector delta;
	local float axis;
	local float direct;
	local float ang_rint;
	local float ang_floor;
	local float ang_ceil;

	movedist = dist;
	if ((self.enemy.health <= RANGE_MELEE))
	{
		self.enemy = world;
		if ((self.oldenemy.health > RANGE_MELEE))
		{
			self.enemy = self.oldenemy;
			HuntTarget ();
		}
		else
		{
			if (self.movetarget)
			{
				self.th_walk ();
			}
			else
			{
				self.th_stand ();
			}
			return;
		}
	}
	self.show_hostile = (time + AS_STRAIGHT);
	enemy_vis = visible (self.enemy);
	if (enemy_vis)
	{
		self.search_time = (time + 5);
	}
	if ((coop && (self.search_time < time)))
	{
		if (FindTarget ())
		{
			return;
		}
	}
	enemy_infront = infront (self.enemy);
	enemy_range = range (self.enemy);
	enemy_yaw = vectoyaw ((self.enemy.origin - self.origin));
	if ((self.attack_state == AS_MISSILE))
	{
		ai_run_missile ();
		return;
	}
	if ((self.attack_state == AS_MELEE))
	{
		ai_run_melee ();
		return;
	}
	if ((self.attack_state == AS_SLIDING))
	{
		ai_run_slide ();
		return;
	}
	movetogoal (dist);
};
float SBAR_200    = 11;
float SBAR_240    = 16;
float SBAR_300    = 22;
float SBAR_350    = 27;
float SBAR_384    = 33;
float SBAR_400    = 35;
float SBAR_480    = 45;
float SBAR_600    = 60;
float SBAR_768    = 80;
float SBAR_GRENS    = 1;
float SBAR_PRINT    = 2;
float enter    = 10;
float space    = 32;
float quote    = 34;
float minus    = 45;
float period    = 46;
float slash    = 47;
float _0    = 48;
float _1    = 49;
float _2    = 50;
float _3    = 51;
float _4    = 52;
float _5    = 53;
float _6    = 54;
float _7    = 55;
float _8    = 56;
float _9    = 57;
float dperiod    = 58;
float _A    = 65;
float _B    = 66;
float _C    = 67;
float _D    = 68;
float _E    = 69;
float _F    = 70;
float _G    = 71;
float _H    = 72;
float _I    = 73;
float _J    = 74;
float _K    = 75;
float _L    = 76;
float _M    = 77;
float _N    = 78;
float _O    = 79;
float _P    = 80;
float _Q    = 81;
float _R    = 82;
float _S    = 83;
float _T    = 84;
float _U    = 85;
float _V    = 86;
float _W    = 87;
float _X    = 88;
float _Y    = 89;
float _Z    = 90;
float __    = 95;
float _a    = 97;
float _b    = 98;
float _c    = 99;
float _d    = 100;
float _e    = 101;
float _f    = 102;
float _g    = 103;
float _h    = 104;
float _i    = 105;
float _j    = 106;
float _k    = 107;
float _l    = 108;
float _m    = 109;
float _n    = 110;
float _o    = 111;
float _p    = 112;
float _q    = 113;
float _r    = 114;
float _s    = 115;
float _t    = 116;
float _u    = 117;
float _v    = 118;
float _w    = 119;
float _x    = 120;
float _y    = 121;
float _z    = 122;
float greenlamp    = 134;
float redlamp    = 135;
float yellowlamp    = 136;
float bluelamp    = 137;
float COLOR_GREEN    = 18;
float COLOR_WHITE    = 48;
float COLOR_RED    = 176;
float () CheckExistence;
entity (float gno) Findgoal;

void (entity te) dremove =
{
	if ((te == world))
	{
		dprint ("***BUG BUG BUG BUG BUG BUG BUG BUG BUG BUG***\n");
		dprint ("WORLD has nearly been removed. Don't worry\n");
		dprint ("***BUG BUG BUG BUG BUG BUG BUG BUG BUG BUG***\n");
		return;
	}
	if ((te.is_removed == SBAR_GRENS))
	{
		return;
	}
	te.is_removed = SBAR_GRENS;
	remove (te);
};

void () display_location =
{
	local string st;

	st = vtos (self.origin);
	sprint3 (self, SBAR_PRINT, "Location : ", st, "\n");
	st = vtos (self.angles);
	sprint3 (self, SBAR_PRINT, "Angles   : ", st, "\n");
};
void () Status_StartWrite;
void () Status_EndWrite;
void (float f1, float f2, float f3) W3C;
void (float f1, float f2, float f3, float f4) W4C;
void (float f1, float f2, float f3, float f4, float f5) W5C;
void (float f1, float f2, float f3, float f4, float f5, float f6) W6C;
void (float f1, float f2, float f3, float f4, float f5, float f6, float f7) W7C;
void (float f1, float f2, float f3, float f4, float f5, float f6, float f7, float f8) W8C;
void (float f, float c) WriteIntXX;
void (float f, float c) WriteIntXXX;
void (float f, float c) WriteIntXXXX;
void (float f) WriteSIntXXXX;
void (float i) WriteSpace;

void () RefreshStatusBar =
{
	local float x;
	local entity te;
	local float num;

	if (self.current_menu)
	{
		return;
	}
	if (self.deadflag)
	{
		return;
	}
	if ((infokey (world, "status") == "Countdown"))
	{
		return;
	}
	self.StatusRefreshTime = (time + 1.5);
	msg_entity = self;
	Status_StartWrite ();
	if (round_active)
	{
		if (!self.ScannerOn)
		{
			if ((self.is_undercover != SBAR_PRINT))
			{
				te = find (te, classname, "round");
				WriteIntXX (te.cnt, COLOR_WHITE);
				WriteByte (SBAR_GRENS, dperiod);
				WriteIntXX (te.cnt2, COLOR_WHITE);
				WriteSpace (AS_MISSILE);
			}
		}
		if (tfstrike)
		{
			if (self.is_detpacking)
			{
				W7C (_s, _e, _t, _t, _i, _n, _g);
				W5C (space, _B, _O, _M, _B);
				WriteSpace (13);
			}
		}
	}
	else
	{
		if (!self.playerclass)
		{
			Status_EndWrite ();
			return;
		}
		else
		{
			if ((self.playerclass == SBAR_GRENS))
			{
				te = find (world, netname, "scanner");
				while (((te != world) && (te.owner != self)))
				{
					te = find (te, classname, "scanner");
				}
				if ((self.ScannerOn == SBAR_GRENS))
				{
					x = RANGE_MELEE;
					if ((te.health > RANGE_MELEE))
					{
						if ((te.team_no == SBAR_GRENS))
						{
							W5C (_B, _l, _u, _e, space);
							x = 5;
						}
						else
						{
							if ((te.team_no == SBAR_PRINT))
							{
								W4C (_R, _e, _d, space);
								x = AS_MISSILE;
							}
							else
							{
								if ((te.team_no == AS_MELEE))
								{
									W7C (_Y, _e, _l, _l, _o, _w, space);
									x = 7;
								}
								else
								{
									if ((te.team_no == AS_MISSILE))
									{
										W6C (_G, _r, _e, _e, _n, space);
										x = 6;
									}
								}
							}
						}
						if ((te.playerclass == SBAR_GRENS))
						{
							W5C (_S, _c, _o, _u, _t);
							x = (x + 5);
						}
						else
						{
							if ((te.playerclass == SBAR_PRINT))
							{
								W6C (_S, _n, _i, _p, _e, _r);
								x = (x + 6);
							}
							else
							{
								if ((te.playerclass == AS_MELEE))
								{
									W7C (_S, _o, _l, _d, _i, _e, _r);
									x = (x + 7);
								}
								else
								{
									if ((te.playerclass == AS_MISSILE))
									{
										W7C (_D, _e, _m, _o, _m, _a, _n);
										x = (x + 7);
									}
									else
									{
										if ((te.playerclass == 5))
										{
											W5C (_M, _e, _d, _i, _c);
											x = (x + 5);
										}
										else
										{
											if ((te.playerclass == 6))
											{
												W5C (_H, _W, _G, _u, _y);
												x = (x + 5);
											}
											else
											{
												if ((te.playerclass == 7))
												{
													W4C (_P, _y, _r, _o);
													x = (x + AS_MISSILE);
												}
												else
												{
													if ((te.playerclass == 8))
													{
														W3C (_S, _p, _y);
														x = (x + AS_MELEE);
													}
													else
													{
														if ((te.playerclass == 9))
														{
															W8C (_E, _n, _g, _i, _n, _e, _e, _r);
															x = (x + 8);
														}
														else
														{
															if ((te.playerclass == SBAR_200))
															{
																W8C (_C, _i, _v, _i, _l, _i, _a, _n);
																x = (x + 8);
															}
															else
															{
																if ((te.playerclass == 13))
																{
																	W7C (_S, _e, _n, _t, _r, _y, space);
																	W3C (_G, _u, _n);
																	x = (x + enter);
																}
																else
																{
																	if ((te.playerclass == 14))
																	{
																		W8C (_G, _o, _a, _l, _i, _t, _e, _m);
																		x = (x + 8);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					else
					{
						W8C (_N, _o, space, _B, _l, _i, _p, _s);
						x = (x + 8);
					}
					if (x)
					{
						WriteSpace ((COLOR_GREEN - x));
					}
					W7C (_R, _a, _n, _g, _e, dperiod, space);
					WriteIntXXX (te.health, COLOR_WHITE);
				}
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					if (self.is_detpacking)
					{
						W8C (_s, _e, _t, _t, _i, _n, _g, space);
						W7C (_d, _e, _t, _p, _a, _c, _k);
						WriteSpace (15);
					}
				}
				else
				{
					if ((self.playerclass == 8))
					{
						if (self.is_undercover)
						{
							if ((self.is_undercover == SBAR_PRINT))
							{
								W8C (_g, _o, _i, _n, _g, space, _u, _n);
								W8C (_d, _e, _r, _c, _o, _v, _e, _r);
								WriteSpace (14);
							}
							else
							{
								x = RANGE_MELEE;
								if ((self.undercover_team == SBAR_GRENS))
								{
									W5C (_B, _l, _u, _e, space);
									x = 5;
								}
								else
								{
									if ((self.undercover_team == SBAR_PRINT))
									{
										W4C (_R, _e, _d, space);
										x = AS_MISSILE;
									}
									else
									{
										if ((self.undercover_team == AS_MELEE))
										{
											W7C (_Y, _e, _l, _l, _o, _w, space);
											x = 7;
										}
										else
										{
											if ((self.undercover_team == AS_MISSILE))
											{
												W6C (_G, _r, _e, _e, _n, space);
												x = 6;
											}
										}
									}
								}
								if ((self.undercover_skin == SBAR_GRENS))
								{
									W5C (_S, _c, _o, _u, _t);
									x = (x + 5);
								}
								else
								{
									if ((self.undercover_skin == SBAR_PRINT))
									{
										W6C (_S, _n, _i, _p, _e, _r);
										x = (x + 6);
									}
									else
									{
										if ((self.undercover_skin == AS_MELEE))
										{
											W7C (_S, _o, _l, _d, _i, _e, _r);
											x = (x + 7);
										}
										else
										{
											if ((self.undercover_skin == AS_MISSILE))
											{
												W7C (_D, _e, _m, _o, _m, _a, _n);
												x = (x + 7);
											}
											else
											{
												if ((self.undercover_skin == 5))
												{
													W5C (_M, _e, _d, _i, _c);
													x = (x + 5);
												}
												else
												{
													if ((self.undercover_skin == 6))
													{
														W5C (_H, _W, _G, _u, _y);
														x = (x + 5);
													}
													else
													{
														if ((self.undercover_skin == 7))
														{
															W4C (_P, _y, _r, _o);
															x = (x + AS_MISSILE);
														}
														else
														{
															if ((self.undercover_skin == 9))
															{
																W8C (_E, _n, _g, _i, _n, _e, _e, _r);
																x = (x + 8);
															}
														}
													}
												}
											}
										}
									}
								}
								if (x)
								{
									WriteSpace ((30 - x));
								}
							}
						}
					}
					else
					{
						if ((self.playerclass == 9))
						{
							x = RANGE_MELEE;
							if (self.has_sentry)
							{
								te = find (world, classname, "building_sentrygun");
								while (((te != world) && (te.real_owner != self)))
								{
									te = find (te, classname, "building_sentrygun");
								}
								W8C (_S, _e, _n, _t, _r, _y, dperiod, space);
								WriteIntXXX (te.health, COLOR_WHITE);
								x = (x + SBAR_200);
								if (!(self.sbar_type & SBAR_GRENS))
								{
									if (((te.ammo_rockets == RANGE_MELEE) && (te.ammo_shells == RANGE_MELEE)))
									{
										W8C (space, _n, _o, space, _a, _m, _m, _o);
										x = (x + 8);
									}
									else
									{
										if (!te.ammo_shells)
										{
											W8C (space, _n, _o, space, _s, _h, _e, _l);
											WriteShort (SBAR_GRENS, (_l + (_s * 256)));
											x = (x + enter);
										}
										else
										{
											if ((!te.ammo_rockets && (te.weapon == AS_MELEE)))
											{
												W8C (space, _n, _o, space, _r, _o, _c, _k);
												W3C (_e, _t, _s);
												x = (x + SBAR_200);
											}
											else
											{
												if ((te.health != te.max_health))
												{
													W8C (space, _d, _a, _m, _a, _g, _e, _d);
													x = (x + 8);
												}
											}
										}
									}
								}
								else
								{
									WriteByte (SBAR_GRENS, slash);
									WriteIntXXX (te.ammo_shells, COLOR_WHITE);
									x = (x + AS_MISSILE);
									if ((te.weapon == AS_MELEE))
									{
										WriteByte (SBAR_GRENS, slash);
										WriteIntXX (te.ammo_rockets, COLOR_WHITE);
										x = (x + AS_MELEE);
									}
								}
							}
							if ((self.has_dispenser && (self.sbar_type && SBAR_GRENS)))
							{
								newmis = find (world, classname, "building_dispenser");
								while (((newmis != world) && (newmis.real_owner != self)))
								{
									newmis = find (newmis, classname, "building_dispenser");
								}
								W6C (space, _D, _i, _s, _p, dperiod);
								WriteIntXXX (newmis.health, COLOR_WHITE);
								x = (x + 9);
							}
							if (((x >= RANGE_MELEE) && (x < SBAR_400)))
							{
								WriteSpace ((SBAR_400 - x));
							}
						}
						else
						{
							if ((self.playerclass == 5))
							{
								W8C (_M, _e, _d, _i, _k, _i, _t, dperiod);
								WriteIntXXX (self.ammo_medikit, COLOR_WHITE);
								WriteSpace (19);
							}
						}
					}
				}
			}
		}
	}
	WriteByte (SBAR_GRENS, enter);
	if ((number_of_teams == SBAR_PRINT))
	{
		W5C (_B, _l, _u, _e, dperiod);
		WriteIntXXXX (team1score, COLOR_WHITE);
		W6C (space, _R, _e, _d, space, dperiod);
		WriteIntXXXX (team2score, COLOR_WHITE);
	}
	else
	{
		WriteSIntXXXX (team1frags);
		WriteByte (SBAR_GRENS, slash);
		WriteSIntXXXX (team2frags);
		WriteByte (SBAR_GRENS, slash);
		WriteSIntXXXX (team3frags);
		WriteByte (SBAR_GRENS, slash);
		WriteSIntXXXX (team4frags);
	}
	if ((self.playerclass == SBAR_200))
	{
		Status_EndWrite ();
		return;
	}
	if (!(self.sbar_type & SBAR_GRENS))
	{
		if ((self.current_weapon == 128))
		{
			if (((8 - self.reload_shotgun) > self.ammo_shells))
			{
				self.reload_shotgun = (8 - self.ammo_shells);
			}
			num = (8 - self.reload_shotgun);
		}
		else
		{
			if ((self.current_weapon == 256))
			{
				if (((SBAR_240 - self.reload_super_shotgun) > self.ammo_shells))
				{
					self.reload_super_shotgun = (SBAR_240 - self.ammo_shells);
				}
				num = (SBAR_240 - self.reload_super_shotgun);
			}
			else
			{
				if ((self.current_weapon == 2048))
				{
					if (((6 - self.reload_grenade_launcher) > self.ammo_rockets))
					{
						self.reload_grenade_launcher = (6 - self.ammo_rockets);
					}
					num = (6 - self.reload_grenade_launcher);
				}
				else
				{
					if ((self.current_weapon == 8192))
					{
						if (((AS_MISSILE - self.reload_rocket_launcher) > self.ammo_rockets))
						{
							self.reload_rocket_launcher = (AS_MISSILE - self.ammo_rockets);
						}
						num = (AS_MISSILE - self.reload_rocket_launcher);
					}
					else
					{
						num = -1;
					}
				}
			}
		}
		if ((num >= RANGE_MELEE))
		{
			W7C (space, space, (_C | 128), (_L | 128), (_I | 128), (_P | 128), (dperiod | 128));
			WriteIntXX (num, COLOR_WHITE);
		}
		else
		{
			WriteSpace (9);
		}
	}
	W4C (space, (_G | 128), (_1 | 128), dperiod);
	WriteIntXX (self.no_grenades_1, COLOR_WHITE);
	W4C (space, (_G | 128), (_2 | 128), dperiod);
	WriteIntXX (self.no_grenades_2, COLOR_WHITE);
	Status_EndWrite ();
};

void () Status_StartWrite =
{
	local float i;

	if ((self.sbar_type & SBAR_PRINT))
	{
		WriteByte (SBAR_GRENS, 8);
		WriteByte (SBAR_GRENS, SBAR_PRINT);
	}
	else
	{
		WriteByte (SBAR_GRENS, 26);
		i = (self.StatusBarRes + self.StatusBarSize);
		while ((i > RANGE_MELEE))
		{
			WriteByte (SBAR_GRENS, enter);
			i = (i - SBAR_GRENS);
		}
	}
};

void (float f1, float f2, float f3) W3C =
{
	WriteByte (SBAR_GRENS, f1);
	WriteByte (SBAR_GRENS, f2);
	WriteByte (SBAR_GRENS, f3);
};

void (float f1, float f2, float f3, float f4) W4C =
{
	WriteShort (SBAR_GRENS, ((f2 * 256) + f1));
	WriteShort (SBAR_GRENS, ((f4 * 256) + f3));
};

void (float f1, float f2, float f3, float f4, float f5) W5C =
{
	WriteShort (SBAR_GRENS, ((f2 * 256) + f1));
	WriteShort (SBAR_GRENS, ((f4 * 256) + f3));
	WriteByte (SBAR_GRENS, f5);
};

void (float f1, float f2, float f3, float f4, float f5, float f6) W6C =
{
	WriteShort (SBAR_GRENS, ((f2 * 256) + f1));
	WriteShort (SBAR_GRENS, ((f4 * 256) + f3));
	WriteShort (SBAR_GRENS, ((f6 * 256) + f5));
};

void (float f1, float f2, float f3, float f4, float f5, float f6, float f7) W7C =
{
	WriteShort (SBAR_GRENS, ((f2 * 256) + f1));
	WriteShort (SBAR_GRENS, ((f4 * 256) + f3));
	WriteShort (SBAR_GRENS, ((f6 * 256) + f5));
	WriteByte (SBAR_GRENS, f7);
};

void (float f1, float f2, float f3, float f4, float f5, float f6, float f7, float f8) W8C =
{
	WriteShort (SBAR_GRENS, ((f2 * 256) + f1));
	WriteShort (SBAR_GRENS, ((f4 * 256) + f3));
	WriteShort (SBAR_GRENS, ((f6 * 256) + f5));
	WriteShort (SBAR_GRENS, ((f8 * 256) + f7));
};

void (float f, float c) WriteIntXX =
{
	local float y;

	if ((f >= enter))
	{
		y = floor ((f / enter));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * enter));
		WriteByte (SBAR_GRENS, (f + c));
	}
	else
	{
		WriteByte (SBAR_GRENS, space);
		WriteByte (SBAR_GRENS, (f + c));
	}
};

void (float f, float c) WriteIntXXX =
{
	local float y;

	if ((f >= _d))
	{
		y = floor ((f / _d));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * _d));
		y = floor ((f / enter));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * enter));
		WriteByte (SBAR_GRENS, (f + c));
	}
	else
	{
		WriteByte (SBAR_GRENS, space);
		WriteIntXX (f, c);
	}
};

void (float f, float c) WriteIntXXXX =
{
	local float y;

	if ((f >= 1000))
	{
		y = floor ((f / 1000));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * 1000));
		y = floor ((f / _d));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * _d));
		y = floor ((f / enter));
		WriteByte (SBAR_GRENS, (y + c));
		f = (f - (y * enter));
		WriteByte (SBAR_GRENS, (f + c));
	}
	else
	{
		WriteByte (SBAR_GRENS, space);
		WriteIntXXX (f, c);
	}
};

void (float f) WriteSIntXXXX =
{
	local float i;
	local float y;
	local float b1;
	local float b2;
	local float b3;
	local float b4;

	if ((f >= RANGE_MELEE))
	{
		WriteIntXXXX (f, COLOR_WHITE);
		return;
	}
	f = (RANGE_MELEE - f);
	if ((f > _c))
	{
		WriteByte (SBAR_GRENS, (minus + 128));
		WriteIntXXX (i, COLOR_WHITE);
		return;
	}
	if ((f > 9))
	{
		WriteByte (SBAR_GRENS, space);
		WriteByte (SBAR_GRENS, (minus + 128));
		WriteIntXX (i, COLOR_WHITE);
		return;
	}
	WriteByte (SBAR_GRENS, space);
	WriteByte (SBAR_GRENS, minus);
	WriteByte (SBAR_GRENS, (i + COLOR_WHITE));
	WriteByte (SBAR_GRENS, space);
};

void (float i) WriteSpace =
{
	while (i)
	{
		WriteByte (SBAR_GRENS, space);
		i = (i - SBAR_GRENS);
	}
};

void () Status_EndWrite =
{
	WriteByte (SBAR_GRENS, RANGE_MELEE);
};

void () StatusBar_On =
{
	if (!self.StatusBarSize)
	{
		self.StatusRefreshTime = (time + SBAR_600);
	}
	else
	{
		if (self.StatusBarSize)
		{
			self.StatusRefreshTime = (time + 0.2);
		}
	}
};

float (float f) Impulse2Res =
{
	if ((f == SBAR_GRENS))
	{
		return (SBAR_200);
	}
	if ((f == SBAR_PRINT))
	{
		return (SBAR_240);
	}
	if ((f == AS_MELEE))
	{
		return (SBAR_300);
	}
	if ((f == AS_MISSILE))
	{
		return (SBAR_350);
	}
	if ((f == 5))
	{
		return (SBAR_384);
	}
	if ((f == 6))
	{
		return (SBAR_400);
	}
	if ((f == 7))
	{
		return (SBAR_480);
	}
	if ((f == 8))
	{
		return (SBAR_600);
	}
	if ((f == 9))
	{
		return (SBAR_768);
	}
	return (f);
};

void (float res) StatusRes =
{
	self.last_impulse = RANGE_MELEE;
	if (!res)
	{
		return;
	}
	self.StatusBarRes = Impulse2Res (res);
	if ((res == 9))
	{
		sprint (self, SBAR_PRINT, "Status Bar Res set to 1024x768.\n");
	}
	else
	{
		if ((res == 8))
		{
			sprint (self, SBAR_PRINT, "Status Bar Res set to 800x600.\n");
		}
		else
		{
			if ((res == 7))
			{
				sprint (self, SBAR_PRINT, "Status Bar Res set to 640x480.\n");
			}
			else
			{
				if ((res == 6))
				{
					sprint (self, SBAR_PRINT, "Status Bar Res set to 640x400.\n");
				}
				else
				{
					if ((res == 5))
					{
						sprint (self, SBAR_PRINT, "Status Bar Res set to 512x384.\n");
					}
					else
					{
						if ((res == AS_MISSILE))
						{
							sprint (self, SBAR_PRINT, "Status Bar Res set to 320x350.\n");
						}
						else
						{
							if ((res == AS_MELEE))
							{
								sprint (self, SBAR_PRINT, "Status Bar Res set to 400x300.\n");
							}
							else
							{
								if ((res == SBAR_PRINT))
								{
									sprint (self, SBAR_PRINT, "Status Bar Res set to 320x240.\n");
								}
								else
								{
									if ((res == SBAR_GRENS))
									{
										sprint (self, SBAR_PRINT, "Status Bar Res set to 320x200.\n");
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (entity pl, string s1) CenterPrint =
{
	centerprint (pl, s1);
	pl.StatusRefreshTime = (time + 1.5);
};

void (entity pl, string s1, string s2) CenterPrint2 =
{
	centerprint (pl, s1, s2);
	pl.StatusRefreshTime = (time + 1.5);
};

void (entity pl, string s1, string s2, string s3) CenterPrint3 =
{
	centerprint (pl, s1, s2, s3);
	pl.StatusRefreshTime = (time + 1.5);
};

string (float type) Status_GrenTypeToString =
{
	if ((type == SBAR_PRINT))
	{
		return ("Concussion grenade");
	}
	if ((type == AS_MELEE))
	{
		return ("Nail grenade");
	}
	if ((type == AS_MISSILE))
	{
		return ("Mirv grenade");
	}
	if ((type == 5))
	{
		return ("Napalm grenade");
	}
	if ((type == 6))
	{
		return ("Flare");
	}
	if ((type == 7))
	{
		return ("Gas grenade");
	}
	if ((type == 8))
	{
		return ("EMP grenade");
	}
	if ((type == 9))
	{
		return ("Flash grenade");
	}
	if ((type == enter))
	{
		return ("Caltrop canister");
	}
	return ("Grenade");
};

string (float tm) Status_TeamNumToTeamString =
{
	if ((tm == SBAR_GRENS))
	{
		return ("blue");
	}
	if ((tm == SBAR_PRINT))
	{
		return ("red");
	}
	if ((tm == AS_MELEE))
	{
		return ("yellow");
	}
	if ((tm == AS_MISSILE))
	{
		return ("green");
	}
};
void (float class) TeamFortress_SpyChangeSkin;
void (float teamno) TeamFortress_SpyChangeColor;
void (float issilent) TeamFortress_SpyFeignDeath;
void (entity spy) Spy_RemoveDisguise;
void (entity eng, string bld) DestroyBuilding;
void (float objtobuild) TeamFortress_Build;
void () lvl2_sentry_stand;
void () lvl3_sentry_stand;
void () lvl2_oldsentry_stand;
void () lvl3_oldsentry_stand;
float (float tno) TeamFortress_TeamSet;
float (float tno) TeamFortress_TeamGetColor;
float () TeamFortress_TeamPutPlayerInTeam;
float (float tno) TeamFortress_TeamIsCivilian;
float (float tno) TeamFortress_TeamGetNoPlayers;
float () TeamFortress_GetNoPlayers;
void (float inp) TeamFortress_ChangeClass;
void (entity p) TeamFortress_SetSkin;
void (float type) TeamFortress_DropAmmo;
void (entity targ, entity inflictor, entity attacker, float damage, float T_flags, float T_AttackType) TF_T_Damage;
void () W_SetCurrentAmmo;
void (entity p) bound_other_ammo;
void (float tno, entity ignore, string st) teamsprint;
void (float menu_no) DisplayMenu;
void () Menu_Team;
void () Menu_Class;
void () Menu_Drop;
void () Menu_Intro;
void () Menu_ClassHelp;
void () Menu_ClassHelp2;
void () Menu_StuffClassHelp;
void (float inp) Menu_ClassHelp_Input;
void () Menu_RepeatHelp;
void () Menu_Spy;
void () Menu_Spy_Skin;
void () Menu_Spy_Color;
void (float inp) Menu_Spy_Input;
void (float inp) Menu_Spy_Skin_Input;
void (float inp) Menu_Spy_Color_Input;
void () Menu_Engineer;
void () Menu_EngineerFix_Dispenser;
void () Menu_EngineerFix_SentryGun;
void (float inp) Menu_Engineer_Input;
void (float inp) Menu_EngineerFix_Dispenser_Input;
void (float inp) Menu_EngineerFix_SentryGun_Input;
void () Menu_Dispenser;
void (float inp) Menu_Dispenser_Input;

void () ResetMenu =
{
	if ((self.StatusBarSize == RANGE_MELEE))
	{
		CenterPrint (self, "\n");
	}
	else
	{
		self.StatusRefreshTime = (time + 0.1);
	}
	self.menu_count = 25;
	self.current_menu = SBAR_GRENS;
};

void () Player_Menu =
{
	if ((self.menu_count > 25))
	{
		self.menu_count = RANGE_MELEE;
	}
	else
	{
		self.menu_count = (self.menu_count + SBAR_GRENS);
		return;
	}
	if ((self.current_menu == 5))
	{
		Menu_Intro ();
		if ((self.menu_displaytime > 6))
		{
			self.current_menu = SBAR_GRENS;
		}
		else
		{
			self.menu_displaytime = (self.menu_displaytime + SBAR_GRENS);
		}
	}
	else
	{
		if ((self.current_menu == 6))
		{
			Menu_ClassHelp ();
			if ((self.menu_displaytime > 8))
			{
				Menu_StuffClassHelp ();
				self.current_menu = SBAR_GRENS;
			}
			else
			{
				self.menu_displaytime = (self.menu_displaytime + SBAR_GRENS);
			}
		}
		else
		{
			if ((self.current_menu == 7))
			{
				Menu_ClassHelp2 ();
				if ((self.menu_displaytime > 5))
				{
					Menu_StuffClassHelp ();
					self.current_menu = SBAR_GRENS;
				}
				else
				{
					self.menu_displaytime = (self.menu_displaytime + SBAR_GRENS);
				}
			}
			else
			{
				if ((self.current_menu == AS_MISSILE))
				{
					Menu_Drop ();
				}
				else
				{
					if ((self.current_menu == 12))
					{
						Menu_Spy ();
					}
					else
					{
						if ((self.current_menu == 13))
						{
							Menu_Spy_Skin ();
						}
						else
						{
							if ((self.current_menu == 14))
							{
								Menu_Spy_Color ();
							}
							else
							{
								if ((self.current_menu == 15))
								{
									Menu_Engineer ();
								}
								else
								{
									if ((self.current_menu == SBAR_240))
									{
										Menu_EngineerFix_Dispenser ();
									}
									else
									{
										if ((self.current_menu == 17))
										{
											Menu_EngineerFix_SentryGun ();
										}
										else
										{
											if ((self.current_menu == 19))
											{
												Menu_Dispenser ();
											}
											else
											{
												if ((self.current_menu == 8))
												{
													Menu_RepeatHelp ();
													self.current_menu = SBAR_GRENS;
												}
												else
												{
													if ((self.current_menu == 20))
													{
														Menu_Class ();
													}
													else
													{
														if ((self.current_menu == SBAR_PRINT))
														{
															Menu_Team ();
														}
														else
														{
															if (((self.team_no == RANGE_MELEE) && teamplay))
															{
																if ((round_over >= SBAR_PRINT))
																{
																	return;
																}
																self.current_menu = SBAR_PRINT;
																Menu_Team ();
															}
															else
															{
																if ((self.playerclass == RANGE_MELEE))
																{
																	if (round_active)
																	{
																		return;
																	}
																	if (TeamFortress_TeamIsCivilian (self.team_no))
																	{
																		PutClientInServer ();
																		return;
																	}
																	self.current_menu = AS_MELEE;
																	Menu_Class ();
																}
																else
																{
																	self.current_menu = RANGE_MELEE;
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (float menu_no) DisplayMenu =
{
	self.current_menu = menu_no;
	if ((menu_no == SBAR_PRINT))
	{
		Menu_Team ();
	}
	else
	{
		if ((menu_no == AS_MELEE))
		{
			Menu_Class ();
		}
	}
};

void () Menu_Team =
{
	if (((toggleflags & 64) && teamplay))
	{
		if (TeamFortress_TeamPutPlayerInTeam ())
		{
			ResetMenu ();
			return;
		}
	}
	if ((team_menu_string != string_null))
	{
		CenterPrint (self, team_menu_string);
		return;
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Blue Team  \nêîë Red Team   \n\n\n");
	}
	else
	{
		if ((number_of_teams == SBAR_PRINT))
		{
			if (tfstrike)
			{
				CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Counter Terrorists \nêîë Terrorists         \n\n\nêóë Auto Team          \nêòë Observe            ");
			}
			else
			{
				CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Team One  \nêîë Team Two  \n\n\nêóë Auto Team \nêòë Observe   ");
			}
		}
		else
		{
			CenterPrint (self, "ûûû Choose Your Team ûûû\n\nêìë Team One  \nêîë Team Two  \nêïë Team Three\nêñë Team Four \nêóë Auto Team \nêòë Observe   \n");
		}
	}
};

void (float inp) Menu_Team_Input =
{
	if ((inp == 6))
	{
		TeamFortress_TeamSet (-1);
		self.current_menu = RANGE_MELEE;
		Menu_StuffClassHelp ();
		Menu_ClassHelp ();
		self.impulse = RANGE_MELEE;
		return;
	}
	else
	{
		if ((inp == 5))
		{
			TeamFortress_TeamPutPlayerInTeam ();
		}
		else
		{
			if (((inp <= number_of_teams) && (inp > RANGE_MELEE)))
			{
				TeamFortress_TeamSet (inp);
			}
			else
			{
				if (((number_of_teams == RANGE_MELEE) && (inp <= AS_MISSILE)))
				{
					TeamFortress_TeamSet (inp);
				}
			}
		}
	}
	ResetMenu ();
	self.impulse = RANGE_MELEE;
};

void () Menu_Class =
{
	local entity AD;

	AD = find (world, classname, "info_tfdetect");
	if (AD)
	{
		if ((self.team_no == SBAR_GRENS))
		{
			if ((AD.noise1 != string_null))
			{
				CenterPrint (self, AD.noise1);
				return;
			}
		}
		else
		{
			if ((self.team_no == SBAR_PRINT))
			{
				if ((AD.noise2 != string_null))
				{
					CenterPrint (self, AD.noise2);
					return;
				}
			}
			else
			{
				if ((self.team_no == AS_MELEE))
				{
					if ((AD.noise3 != string_null))
					{
						CenterPrint (self, AD.noise3);
						return;
					}
				}
				else
				{
					if ((self.team_no == AS_MISSILE))
					{
						if ((AD.noise4 != string_null))
						{
							CenterPrint (self, AD.noise4);
							return;
						}
					}
				}
			}
		}
	}
	if (TeamFortress_TeamIsCivilian (self.team_no))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			CenterPrint (self, "Your team can only be Quake Soldiers.\n");
		}
		else
		{
			CenterPrint (self, "Your team can only be Civilians.\n");
		}
	}
	else
	{
		CenterPrint (self, "ûûû Choose Your Class ûûû\n\nêìë Scout   \nêîë Sniper  \nêïë Soldier \nêñë Demoman \nêóë Medic   \nêòë HWGuy   \nêôë Pyro    \nêöë Spy     \nêõë Engineer\nêíë RandomPC\n");
	}
};

void (float inp) Menu_Class_Input =
{
	local float new_class;
	local string st;

	if (((inp > SBAR_200) || (inp < SBAR_GRENS)))
	{
		return;
	}
	if (self.playerclass)
	{
		new_class = SBAR_GRENS;
	}
	TeamFortress_ChangeClass (inp);
	ResetMenu ();
	if (((self.playerclass && (new_class != SBAR_GRENS)) && (self.playerclass != SBAR_200)))
	{
		if (SBAR_GRENS)
		{
			st = infokey (self, "ch");
			if ((st == string_null))
			{
				st = infokey (self, "classhelp");
			}
			if (((st != "off") && !(self.tfkey & SBAR_GRENS)))
			{
				self.current_menu = 6;
			}
		}
		else
		{
			self.current_menu = SBAR_GRENS;
		}
	}
	self.menu_displaytime = RANGE_MELEE;
};

void () Menu_Drop =
{
	if ((self.playerclass == 9))
	{
		CenterPrint (self, "Drop || Make:                   \nêìë Shells                      \nêîë Nails                       \nêïë Rockets                     \nêñë Cells                       \nêóë Nothing                     \n\n");
	}
	else
	{
		CenterPrint (self, "Drop:                           \nêìë Shells                      \nêîë Nails                       \nêïë Rockets                     \nêñë Cells                       \nêóë Nothing                     \n\n");
	}
};

void () Menu_RepeatHelp =
{
	CenterPrint (self, "Press ö to see this help again\n");
};

void (float inp) Menu_Drop_Input =
{
	if (((inp > RANGE_MELEE) && (inp < 5)))
	{
		TeamFortress_DropAmmo (inp);
	}
	if (((inp > RANGE_MELEE) && (inp < 6)))
	{
		ResetMenu ();
	}
	self.impulse = RANGE_MELEE;
};

void (float inp) Menu_Input =
{
	if ((self.current_menu == SBAR_PRINT))
	{
		Menu_Team_Input (inp);
	}
	else
	{
		if (((self.current_menu == AS_MELEE) || (self.current_menu == 20)))
		{
			Menu_Class_Input (inp);
		}
		else
		{
			if ((self.current_menu == AS_MISSILE))
			{
				Menu_Drop_Input (inp);
			}
			else
			{
				if ((self.current_menu == 12))
				{
					Menu_Spy_Input (inp);
				}
				else
				{
					if ((self.current_menu == 13))
					{
						Menu_Spy_Skin_Input (inp);
					}
					else
					{
						if ((self.current_menu == 14))
						{
							Menu_Spy_Color_Input (inp);
						}
						else
						{
							if ((self.current_menu == 15))
							{
								Menu_Engineer_Input (inp);
							}
							else
							{
								if ((self.current_menu == SBAR_240))
								{
									Menu_EngineerFix_Dispenser_Input (inp);
								}
								else
								{
									if ((self.current_menu == 17))
									{
										Menu_EngineerFix_SentryGun_Input (inp);
									}
									else
									{
										if ((self.current_menu == 19))
										{
											Menu_Dispenser_Input (inp);
										}
										else
										{
											if ((self.current_menu == 6))
											{
												Menu_ClassHelp_Input (inp);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () Menu_Intro =
{
	local string st1;
	local string st2;

	st1 = infokey (world, "motd1");
	if ((st1 != string_null))
	{
		st2 = infokey (world, "motd2");
		centerprint (self, st1, "\n", st2);
	}
	else
	{
		CenterPrint (self, "Welcome to Hue Team Fortress 1.45\nùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\nhttp://andi.com.br/\n\nBased on OzTF 1.45\nDecompiled by Andi\nThe Brazilian QWTF Community 2017\n");
	}
};

void () Menu_ClassHelp =
{
	if ((self.menu_displaytime < 5))
	{
		if ((self.playerclass == SBAR_GRENS))
		{
			CenterPrint (self, "”√œ’‘ Details:               \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêñë Nailgun                  \n\nPress ö for alias help\n");
		}
		else
		{
			if ((self.playerclass == SBAR_PRINT))
			{
				CenterPrint (self, "”Œ…–≈“ Details:              \n\n◊≈¡–œŒ”:                     \nêîë Sniper Rifle/Auto Rifle  \nêñë Nailgun                  \n\nPress ö for alias help\n");
			}
			else
			{
				if ((self.playerclass == AS_MELEE))
				{
					CenterPrint (self, "”œÃƒ…≈“ Details:             \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Rocket Launcher          \n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == AS_MISSILE))
					{
						CenterPrint (self, "ƒ≈ÕœÃ…‘…œŒ” Õ¡Œ Details:     \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêòë Grenade Launcher         \nêôë Pipebomb Launcher        \n\nPress ö for alias help\n");
					}
					else
					{
						if ((self.playerclass == 5))
						{
							CenterPrint (self, "Õ≈ƒ…√ Details:               \n\n◊≈¡–œŒ”:                     \nêìë Medikit/BioWeapon        \nêîë Shotgun                  \nêïë Super Shotgun            \nêóë Super Nailgun            \n\nPress ö for alias help\n");
						}
						else
						{
							if ((self.playerclass == 6))
							{
								CenterPrint (self, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:   \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Super Shotgun            \nêôë Assault Cannon           \n\nPress ö for alias help\n");
							}
							else
							{
								if ((self.playerclass == 7))
								{
									CenterPrint (self, "–Ÿ“œ Details:                \n\n◊≈¡–œŒ”:                     \nêîë Shotgun                  \nêïë Flamethrower             \nêòë Light Incendiary Cannon  \nêôë Heavy Incendiary Cannon  \n\nPress ö for alias help\n");
								}
								else
								{
									if ((self.playerclass == 8))
									{
										CenterPrint (self, "”–Ÿ Details:                 \n\n◊≈¡–œŒ”:                     \nêîë Tranquiliser Gun         \nêïë Super Shotgun            \nêñë Nailgun                  \n\nPress ö for alias help\n");
									}
									else
									{
										if ((self.playerclass == 9))
										{
											CenterPrint (self, "≈Œ«…Œ≈≈“ Details:            \n\n◊≈¡–œŒ”:                     \nêìë Spanner                  \nêîë RailGun                  \nêïë Super Shotgun            \n\nPress ö for alias help\n");
										}
										else
										{
											if (!self.playerclass)
											{
												CenterPrint (self, "\n\n\nObserver Details:             \n\n√œÕÕ¡Œƒ”:                     \ntracking: toggle tracking mode\ntrack_player: player camera   \ntrack_sentry: sentrygun camera\ntrack_tfgoal: flag camera     \nspecial: camera lock-on       \n");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	else
	{
		if ((self.playerclass == SBAR_GRENS))
		{
			CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nFlash Grenade       \nConcussion Grenade  \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nScanner: autoscan,scansound,scane,scanf\n\n\nPress ö for alias help\n");
		}
		else
		{
			if ((self.playerclass == SBAR_PRINT))
			{
				CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nFlare               \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nautozoom : Toggle Rifle Autozooming\n\n\nPress ö for alias help\n");
			}
			else
			{
				if ((self.playerclass == AS_MELEE))
				{
					CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nNail Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
				}
				else
				{
					if ((self.playerclass == AS_MISSILE))
					{
						CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nMirv Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nThe Detpack : +det5,+det20,+det50,+det255\nDetonate Pipebombs : detpipe  \n\n\nPress ö for alias help\n");
					}
					else
					{
						if ((self.playerclass == 5))
						{
							CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nConcussion Grenade  \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
						}
						else
						{
							if ((self.playerclass == 6))
							{
								CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nMirv Grenade        \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
							}
							else
							{
								if ((self.playerclass == 7))
								{
									CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nNapalm Grenade      \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nNone\n\n\nPress ö for alias help\n");
								}
								else
								{
									if ((self.playerclass == 8))
									{
										CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nHallucinogen Grenade\n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nGo Undercover : disguise\nFeign Death : feign, sfeign\n\n\nPress ö for alias help\n");
									}
									else
									{
										if ((self.playerclass == 9))
										{
											CenterPrint (self, "«“≈Œ¡ƒ≈”:            \nHand Grenade        \nEMP Grenade         \n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:   \nStart Building : build  \n\n\nPress ö for alias help\n");
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () Menu_StuffClassHelp =
{
	if ((self.playerclass == SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "”√œ’‘ Details:\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êñë Nailgun\n");
		sprint (self, SBAR_PRINT, "«“≈Œ¡ƒ≈”:\n   Concussion Grenade\n   Flare\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n");
		sprint (self, SBAR_PRINT, "Scanner: autoscan,scansound,scane,scanf\n\n\n");
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			sprint (self, SBAR_PRINT, "”Œ…–≈“ Details:\n\n◊≈¡–œŒ”:\n   êîë Sniper Rifle/Auto Rifle\n");
			sprint (self, SBAR_PRINT, "êñë Nailgun\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n\n\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n");
			sprint (self, SBAR_PRINT, "  autozoom : Toggle Rifle Autozooming\n\n\n");
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				sprint (self, SBAR_PRINT, "”œÃƒ…≈“ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êïë Super Shotgun\n");
				sprint (self, SBAR_PRINT, "   êôë Rocket Launcher\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Nail Grenade\n");
				sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					sprint (self, SBAR_PRINT, "ƒ≈ÕœÃ…‘…œŒ” Õ¡Œ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êòë Grenade/Pipebomb Launcher\n");
					sprint (self, SBAR_PRINT, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Mirv Grenade\n");
					sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   The Detpack : +det5,+det20,+det50,+det255\n   Detonate Pipebombs : detpipe\n\n\n");
				}
				else
				{
					if ((self.playerclass == 5))
					{
						sprint (self, SBAR_PRINT, "Õ≈ƒ…√ Details:\n\n◊≈¡–œŒ”:\n   êìë Medikit/BioWeapon\n   êîë Shotgun\n   êïë Super Shotgun\n");
						sprint (self, SBAR_PRINT, "   êóë Super Nailgun\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Concussion Grenade\n");
						sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
					}
					else
					{
						if ((self.playerclass == 6))
						{
							sprint (self, SBAR_PRINT, "»≈¡÷Ÿ ◊≈¡–œŒ” «’Ÿ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êïë Super Shotgun\n");
							sprint (self, SBAR_PRINT, "   êôë Assault Cannon\n«“≈Œ¡ƒ≈”:\n   Hand Grenade\n");
							sprint (self, SBAR_PRINT, "   Mirv Grenade\n”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
						}
						else
						{
							if ((self.playerclass == 7))
							{
								sprint (self, SBAR_PRINT, "–Ÿ“œ Details:\n\n◊≈¡–œŒ”:\n   êîë Shotgun\n   êòë Flamethrower\n   êôë Incendiary Cannon\n");
								sprint (self, SBAR_PRINT, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Napalm Grenade\n");
								sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   None\n\n\n");
							}
							else
							{
								if ((self.playerclass == 8))
								{
									sprint (self, SBAR_PRINT, "”–Ÿ Details:\n\n◊≈¡–œŒ”:\n   êîë Tranquiliser Gun\n   êïë Super Shotgun\n   êñë Nailgun\n");
									sprint (self, SBAR_PRINT, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   Hallucinogenic Grenade\n");
									sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   Go Undercover : disguise\n   Feign Death : feign, sfeign\n\n\n");
								}
								else
								{
									if ((self.playerclass == 9))
									{
										sprint (self, SBAR_PRINT, "≈Œ«…Œ≈≈“ Details:\n\n◊≈¡–œŒ”:\n   êìë Spanner\n   êîë RailGun\n   êïë Super Shotgun\n");
										sprint (self, SBAR_PRINT, "«“≈Œ¡ƒ≈”:\n   Hand Grenade\n   EMP Grenade\n");
										sprint (self, SBAR_PRINT, "”–≈√…¡Ã √œÕÕ¡Œƒ”:\n   Start Building : build\n\n\n");
									}
									else
									{
										if (!self.playerclass)
										{
											sprint (self, SBAR_PRINT, "\n\nObserver Details:\n\n\n√œÕÕ¡Œƒ”: \n   tracking:     toggle tracking mode\n   track_player: observe a player\n   track_sentry: observe a sentrygun\n   track_tfgoal: observe a team's flag\n   special:      lock onto && observe an object\n");
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () Menu_ClassHelp2 =
{
	CenterPrint (self, "Commands:\ninv       : Show inventory \n+gren1    : Throw grenade 1\n+gren2    : Throw Grenade 2\nreload    : Force a reload \ndropammo  : drop some ammo \n\n");
};

void (float inp) Menu_ClassHelp_Input =
{
	if (((self.team_no == SBAR_PRINT) || (self.team_no == AS_MISSILE)))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			return;
		}
	}
	if ((inp == 8))
	{
		Menu_ClassHelp2 ();
		self.menu_count = 25;
		self.current_menu = 7;
		self.menu_displaytime = RANGE_MELEE;
		self.impulse = RANGE_MELEE;
	}
};

void () Menu_Spy =
{
	if (((self.effects & (8 | AS_MISSILE)) || (self.is_unabletospy == SBAR_GRENS)))
	{
		ResetMenu ();
		return;
	}
	if (self.is_feigning)
	{
		if (((self.undercover_team != RANGE_MELEE) && (self.undercover_skin != RANGE_MELEE)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != RANGE_MELEE))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != RANGE_MELEE))
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Reset Skin                  \nêóë Nothing                     \n\n");
				}
				else
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Stop Feigning               \nêñë Nothing                     \n\n");
				}
			}
		}
	}
	else
	{
		if (((self.undercover_team != RANGE_MELEE) && (self.undercover_skin != RANGE_MELEE)))
		{
			CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Skin && Color        \nêóë Nothing                     \n\n");
		}
		else
		{
			if ((self.undercover_team != RANGE_MELEE))
			{
				CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Color                 \nêóë Nothing                     \n\n");
			}
			else
			{
				if ((self.undercover_skin != RANGE_MELEE))
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Reset Skin                  \nêóë Nothing                     \n\n");
				}
				else
				{
					CenterPrint (self, "Action:                           \nêìë Change Skin                 \nêîë Change Color                \nêïë Start Feigning              \nêñë Nothing                     \n\n");
				}
			}
		}
	}
};

void (float inp) Menu_Spy_Input =
{
	local float tc;
	local string st;

	if (((inp == SBAR_GRENS) || (inp == SBAR_PRINT)))
	{
		if ((self.effects & (8 | AS_MISSILE)))
		{
			sprint (self, SBAR_PRINT, "You can't go undercover while glowing.\n");
			ResetMenu ();
			self.impulse = RANGE_MELEE;
			return;
		}
		if ((self.is_unabletospy == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "You can't go undercover right now.\n");
			ResetMenu ();
			self.impulse = RANGE_MELEE;
			return;
		}
	}
	if ((inp == SBAR_GRENS))
	{
		Menu_Spy_Skin ();
		self.menu_count = 25;
		self.current_menu = 13;
		self.menu_displaytime = RANGE_MELEE;
		self.impulse = RANGE_MELEE;
	}
	else
	{
		if ((inp == SBAR_PRINT))
		{
			Menu_Spy_Color ();
			self.menu_count = 25;
			self.current_menu = 14;
			self.menu_displaytime = RANGE_MELEE;
			self.impulse = RANGE_MELEE;
		}
		else
		{
			if ((inp == AS_MELEE))
			{
				TeamFortress_SpyFeignDeath (RANGE_MELEE);
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			else
			{
				if ((inp == AS_MISSILE))
				{
					Spy_RemoveDisguise (self);
					ResetMenu ();
					self.impulse = RANGE_MELEE;
				}
				else
				{
					if (((inp == 5) && ((self.undercover_team != RANGE_MELEE) || (self.undercover_skin != RANGE_MELEE))))
					{
						ResetMenu ();
						self.impulse = RANGE_MELEE;
					}
				}
			}
		}
	}
};

void () Menu_Spy_Skin =
{
	if (((self.undercover_team == SBAR_PRINT) || (self.undercover_team == AS_MISSILE)))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			CenterPrint (self, "ûûû Change Skin to: ûûû\nêìë Base");
			return;
		}
	}
	CenterPrint (self, "ûûû Change Skin to: ûûû\nêìë Scout   \nêîë Sniper  \nêïë Soldier \nêñë Demoman \nêóë Medic   \nêòë Hvwep   \nêôë Pyro    \nêöë Spy     \nêõë Engineer\n\n");
};

void (float inp) Menu_Spy_Skin_Input =
{
	if (((self.undercover_team == SBAR_PRINT) || (self.undercover_team == AS_MISSILE)))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			if ((inp == SBAR_GRENS))
			{
				TeamFortress_SpyChangeSkin (inp);
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			return;
		}
	}
	if (((inp < enter) && (inp > RANGE_MELEE)))
	{
		TeamFortress_SpyChangeSkin (inp);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
	}
};

void () Menu_Spy_Color =
{
	if ((number_of_teams == RANGE_MELEE))
	{
		sprint (self, SBAR_PRINT, "No Color changing allowed in deathmatch.\n");
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		return;
	}
	if ((number_of_teams == SBAR_PRINT))
	{
		CenterPrint (self, "ûûû Change Color to the Same Color as: ûûû\n\nêìë Team One  \nêîë Team Two  \n\n");
	}
	else
	{
		CenterPrint (self, "ûûû Change Color to the Same Color as: ûûû\n\nêìë Team One  \nêîë Team Two  \nêïë Team Three\nêñë Team Four \n\n");
	}
};

void (float inp) Menu_Spy_Color_Input =
{
	if (((inp >= SBAR_GRENS) && (inp <= number_of_teams)))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			if ((self.undercover_skin != RANGE_MELEE))
			{
				if (((inp == SBAR_PRINT) || (inp == AS_MISSILE)))
				{
					CenterPrint (self, "ûûû Cannot change Color, You must Reset your Skin. ûûû\n");
					return;
				}
			}
		}
		TeamFortress_SpyChangeColor (inp);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
	}
};

void () Menu_Engineer =
{
	local string s_action;
	local string s_disp;
	local string s_sentry;
	local string s_tpent;
	local string s_tpexit;
	local string s_nothing;

	s_action = "Action:                           \n";
	s_nothing = "êóë Nothing                      \n\n";
	if (self.has_dispenser)
	{
		s_disp = "êôë Remotely Detonate Dispenser  \n";
	}
	else
	{
		if ((self.ammo_cells >= _d))
		{
			s_disp = "êìë Build Ammo&Armor Dispenser   \n";
		}
		else
		{
			s_disp = "\n";
		}
	}
	if (self.has_sentry)
	{
		s_sentry = "êöë Remotely Detonate Sentry Gun \n";
	}
	else
	{
		if ((self.ammo_cells >= 130))
		{
			s_sentry = "êîë Build Sentry Gun             \n";
		}
		else
		{
			s_sentry = "\n";
		}
	}
	centerprint (self, s_action, s_disp, s_sentry, s_nothing);
};

void (float inp) Menu_Engineer_Input =
{
	local entity te;

	if ((((inp == SBAR_GRENS) && (self.ammo_cells >= _d)) && (self.has_dispenser != SBAR_GRENS)))
	{
		TeamFortress_Build (SBAR_GRENS);
		ResetMenu ();
		self.impulse = RANGE_MELEE;
	}
	else
	{
		if ((((inp == SBAR_PRINT) && (self.ammo_cells >= 130)) && (self.has_sentry != SBAR_GRENS)))
		{
			TeamFortress_Build (SBAR_PRINT);
			ResetMenu ();
			self.impulse = RANGE_MELEE;
		}
		else
		{
			if (((inp == 7) && (self.has_dispenser == SBAR_GRENS)))
			{
				DestroyBuilding (self, "building_dispenser");
				ResetMenu ();
				self.impulse = RANGE_MELEE;
			}
			else
			{
				if (((inp == 8) && (self.has_sentry == SBAR_GRENS)))
				{
					DestroyBuilding (self, "building_sentrygun");
					ResetMenu ();
					self.impulse = RANGE_MELEE;
				}
				else
				{
					if ((inp == 5))
					{
						ResetMenu ();
						self.impulse = RANGE_MELEE;
					}
				}
			}
		}
	}
};

void () Menu_EngineerFix_Dispenser =
{
	CenterPrint (self, "Action:                            \nêìë Put Ammo into Dispenser     \nêîë Put Armor into Dispenser    \nêïë Repair Dispenser            \nêñë Dismantle Dispenser         \nêóë Nothing                     \n\n");
};

void (float inp) Menu_EngineerFix_Dispenser_Input =
{
	local float metalcost;
	local float am;

	if (((self.classname != "player") || (self.building == world)))
	{
		return;
	}
	if ((inp == SBAR_GRENS))
	{
		am = (20 * SBAR_PRINT);
		if ((am > self.ammo_shells))
		{
			am = self.ammo_shells;
		}
		if ((am > (400 - self.building.ammo_shells)))
		{
			am = (400 - self.building.ammo_shells);
		}
		if (!practice)
		{
			self.ammo_shells = (self.ammo_shells - am);
		}
		self.building.ammo_shells = (self.building.ammo_shells + am);
		am = (20 * SBAR_PRINT);
		if ((am > self.ammo_nails))
		{
			am = self.ammo_nails;
		}
		if ((am > (600 - self.building.ammo_nails)))
		{
			am = (600 - self.building.ammo_nails);
		}
		if (!practice)
		{
			self.ammo_nails = (self.ammo_nails - am);
		}
		self.building.ammo_nails = (self.building.ammo_nails + am);
		am = (enter * SBAR_PRINT);
		if ((am > self.ammo_rockets))
		{
			am = self.ammo_rockets;
		}
		if ((am > (300 - self.building.ammo_rockets)))
		{
			am = (300 - self.building.ammo_rockets);
		}
		if (!practice)
		{
			self.ammo_rockets = (self.ammo_rockets - am);
		}
		self.building.ammo_rockets = (self.building.ammo_rockets + am);
		am = (enter * SBAR_PRINT);
		if ((am > self.ammo_cells))
		{
			am = self.ammo_cells;
		}
		if ((am > (400 - self.building.ammo_cells)))
		{
			am = (400 - self.building.ammo_cells);
		}
		if (!practice)
		{
			self.ammo_cells = (self.ammo_cells - am);
		}
		self.building.ammo_cells = (self.building.ammo_cells + am);
	}
	else
	{
		if ((inp == SBAR_PRINT))
		{
			am = (40 * SBAR_PRINT);
			if ((am > self.armorvalue))
			{
				am = self.armorvalue;
			}
			if ((am > (500 - self.building.armorvalue)))
			{
				am = (500 - self.building.armorvalue);
			}
			if (!practice)
			{
				self.armorvalue = (self.armorvalue - am);
			}
			self.building.armorvalue = (self.building.armorvalue + am);
		}
		else
		{
			if ((inp == AS_MELEE))
			{
				metalcost = ((self.building.max_health - self.building.health) / 5);
				if ((metalcost > self.ammo_cells))
				{
					metalcost = self.ammo_cells;
				}
				if (!practice)
				{
					self.ammo_cells = (self.ammo_cells - metalcost);
				}
				self.building.health = (self.building.health + (metalcost * 5));
			}
			else
			{
				if ((inp == AS_MISSILE))
				{
					sprint (self, SBAR_PRINT, "You dismantle the Dispenser.\n");
					if (!practice)
					{
						self.ammo_cells = (self.ammo_cells + (_d / SBAR_PRINT));
					}
					if ((self.building.real_owner != self))
					{
						sprint2 (self.building.real_owner, SBAR_PRINT, self.netname, " dismantled your Dispenser.\n");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, " dismantled ");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.building.real_owner.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, "'s Dispenser.\n");
					}
					dremove (self.building);
					self.building.real_owner.has_dispenser = RANGE_MELEE;
				}
			}
		}
	}
	if (((inp >= SBAR_GRENS) && (inp <= 5)))
	{
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		self.building = world;
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void () Menu_EngineerFix_SentryGun =
{
	if (((self.building.weapon < AS_MELEE) && (self.ammo_cells >= 130)))
	{
		CenterPrint (self, "Action:                            \nêìë Put Ammo into Sentry Gun    \nêîë Upgrade Sentry Gun          \nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
	else
	{
		CenterPrint (self, "Action:                            \nêìë Put Ammo into Sentry Gun    \n\nêïë Repair Sentry Gun           \nêñë Dismantle Sentry Gun        \nêóë Nothing                     \n\nêòë Rotate SentryGun            \n");
	}
};

void (float inp) Menu_EngineerFix_SentryGun_Input =
{
	local float am;
	local float metalcost;
	local string st;

	if ((self.building.real_owner.has_sentry == RANGE_MELEE))
	{
		return;
	}
	if (((self.classname != "player") || (self.building == world)))
	{
		return;
	}
	if ((inp == SBAR_GRENS))
	{
		am = (20 * SBAR_PRINT);
		if ((am > self.ammo_shells))
		{
			am = self.ammo_shells;
		}
		if ((am > (self.building.maxammo_shells - self.building.ammo_shells)))
		{
			am = (self.building.maxammo_shells - self.building.ammo_shells);
		}
		if (!practice)
		{
			self.ammo_shells = (self.ammo_shells - am);
		}
		self.building.ammo_shells = (self.building.ammo_shells + am);
		if ((self.building.weapon == AS_MELEE))
		{
			am = (enter * SBAR_PRINT);
			if ((am > self.ammo_rockets))
			{
				am = self.ammo_rockets;
			}
			if ((am > (self.building.maxammo_rockets - self.building.ammo_rockets)))
			{
				am = (self.building.maxammo_rockets - self.building.ammo_rockets);
			}
			if (!practice)
			{
				self.ammo_rockets = (self.ammo_rockets - am);
			}
			self.building.ammo_rockets = (self.building.ammo_rockets + am);
		}
	}
	else
	{
		if ((((self.building.weapon < AS_MELEE) && (inp == SBAR_PRINT)) && (self.ammo_cells >= 130)))
		{
			if (!practice)
			{
				self.ammo_cells = (self.ammo_cells - 130);
			}
			self.building.weapon = (self.building.weapon + SBAR_GRENS);
			if (sgtype)
			{
				self.building.max_health = floor ((self.building.max_health * 1.25));
			}
			else
			{
				self.building.max_health = floor ((self.building.max_health * 1.2));
			}
			self.building.health = self.building.max_health;
			self.building.maxammo_shells = (self.building.maxammo_shells * 1.2);
			if ((self.building.weapon == SBAR_PRINT))
			{
				sound (self.building, AS_MELEE, "weapons/turrset.wav", SBAR_GRENS, SBAR_GRENS);
				if (sgtype)
				{
					self.building.think = lvl2_sentry_stand;
				}
				else
				{
					self.building.think = lvl2_oldsentry_stand;
				}
				self.building.skin = SBAR_GRENS;
			}
			else
			{
				sound (self.building, AS_MELEE, "weapons/turrset.wav", SBAR_GRENS, SBAR_GRENS);
				if (sgtype)
				{
					self.building.think = lvl3_sentry_stand;
				}
				else
				{
					self.building.think = lvl3_oldsentry_stand;
				}
				self.building.skin = SBAR_PRINT;
			}
			sprint (self, SBAR_PRINT, "You upgrade the Sentry Gun to level ");
			st = ftos (self.building.weapon);
			sprint (self, SBAR_PRINT, st);
			sprint (self, SBAR_PRINT, "\n");
		}
		else
		{
			if ((inp == AS_MELEE))
			{
				metalcost = ((self.building.max_health - self.building.health) / 5);
				if ((metalcost > self.ammo_cells))
				{
					metalcost = self.ammo_cells;
				}
				if (!practice)
				{
					self.ammo_cells = (self.ammo_cells - metalcost);
				}
				self.building.health = (self.building.health + (metalcost * 5));
			}
			else
			{
				if ((inp == AS_MISSILE))
				{
					sprint (self, SBAR_PRINT, "You dismantle the Sentry Gun.\n");
					if (!practice)
					{
						self.ammo_cells = (self.ammo_cells + (130 / SBAR_PRINT));
					}
					if ((self.building.real_owner != self))
					{
						sprint2 (self.building.real_owner, SBAR_PRINT, self.netname, " dismantled your Sentry Gun.\n");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, " dismantled ");
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, self.building.real_owner.netname);
						teamsprint (self.building.real_owner.team_no, self.building.real_owner, "'s Sentry Gun.\n");
					}
					dremove (self.building.trigger_field);
					dremove (self.building);
					self.building.real_owner.has_sentry = RANGE_MELEE;
				}
				else
				{
					if ((inp == 6))
					{
						sprint (self, SBAR_PRINT, "Rotating 45 degrees to the left...\n");
						self.building.waitmin = anglemod ((self.building.waitmin + minus));
						self.building.waitmax = anglemod ((self.building.waitmax + minus));
					}
				}
			}
		}
	}
	if (((inp >= SBAR_GRENS) && (inp <= 6)))
	{
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};

void () Menu_Dispenser =
{
	CenterPrint (self, "Use Dispenser:                     \nêìë Withdraw some ammo          \nêîë Withdraw some Armor         \nêïë Nothing                     \n\n");
};

void (float inp) Menu_Dispenser_Input =
{
	local float am;
	local float empty;

	empty = RANGE_MELEE;
	if ((inp == SBAR_GRENS))
	{
		if (((((self.building.ammo_shells == RANGE_MELEE) && (self.building.ammo_nails == RANGE_MELEE)) && (self.building.ammo_rockets == RANGE_MELEE)) && (self.building.ammo_cells == RANGE_MELEE)))
		{
			empty = SBAR_GRENS;
		}
		else
		{
			am = (self.maxammo_shells - self.ammo_shells);
			if ((am > self.building.ammo_shells))
			{
				am = self.building.ammo_shells;
			}
			self.building.ammo_shells = (self.building.ammo_shells - am);
			self.ammo_shells = (self.ammo_shells + am);
			am = (self.maxammo_nails - self.ammo_nails);
			if ((am > self.building.ammo_nails))
			{
				am = self.building.ammo_nails;
			}
			self.building.ammo_nails = (self.building.ammo_nails - am);
			self.ammo_nails = (self.ammo_nails + am);
			am = (self.maxammo_rockets - self.ammo_rockets);
			if ((am > self.building.ammo_rockets))
			{
				am = self.building.ammo_rockets;
			}
			self.building.ammo_rockets = (self.building.ammo_rockets - am);
			self.ammo_rockets = (self.ammo_rockets + am);
			am = (self.maxammo_cells - self.ammo_cells);
			if ((am > self.building.ammo_cells))
			{
				am = self.building.ammo_cells;
			}
			self.building.ammo_cells = (self.building.ammo_cells - am);
			self.ammo_cells = (self.ammo_cells + am);
		}
	}
	else
	{
		if ((inp == SBAR_PRINT))
		{
			if ((self.building.armorvalue == RANGE_MELEE))
			{
				empty = SBAR_GRENS;
			}
			else
			{
				am = (self.maxarmor - self.armorvalue);
				if ((am > self.building.armorvalue))
				{
					am = self.building.armorvalue;
				}
				if ((self.armortype == RANGE_MELEE))
				{
					self.armortype = 0.3;
					self.items = (self.items | 8192);
				}
				self.building.armorvalue = (self.building.armorvalue - am);
				self.armorvalue = (self.armorvalue + am);
			}
		}
	}
	if (((inp >= SBAR_GRENS) && (inp <= AS_MELEE)))
	{
		if (empty)
		{
			sprint (self, SBAR_PRINT, "The dispenser is empty.\n");
		}
		ResetMenu ();
		self.impulse = RANGE_MELEE;
		self.building = world;
		self.building_wait = (time + 0.5);
		bound_other_ammo (self);
		if ((self.armorvalue == RANGE_MELEE))
		{
			self.armortype = RANGE_MELEE;
			self.armorclass = RANGE_MELEE;
			self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
		}
		W_SetCurrentAmmo ();
	}
};
void (vector tdest, float tspeed, void() func) SUB_CalcMove;
void (vector destangle, float tspeed, void() func) SUB_CalcAngleMove;
void (entity Goal, entity AP) DoGoalWork;
void (entity Goal, entity AP) DoGroupWork;

void () SUB_Null =
{
};

void () SUB_Remove =
{
	dremove (self);
};

void () SetMovedir =
{
	if ((self.angles == '0 -1 0'))
	{
		self.movedir = '0 0 1';
	}
	else
	{
		if ((self.angles == '0 -2 0'))
		{
			self.movedir = '0 0 -1';
		}
		else
		{
			makevectors (self.angles);
			self.movedir = v_forward;
		}
	}
	self.angles = '0 0 0';
};

void () InitTrigger =
{
	if ((self.angles != '0 0 0'))
	{
		SetMovedir ();
	}
	self.solid = SBAR_GRENS;
	setmodel (self, self.model);
	self.movetype = RANGE_MELEE;
	self.modelindex = RANGE_MELEE;
	self.model = "";
};

void (vector tdest, float tspeed, void() func) SUB_CalcMove =
{
	local vector vdestdelta;
	local float len;
	local float traveltime;

	if (!tspeed)
	{
		objerror ("No speed is defined!");
	}
	self.think1 = func;
	self.finaldest = tdest;
	self.think = SUB_CalcMoveDone;
	if ((tdest == self.origin))
	{
		self.velocity = '0 0 0';
		self.nextthink = (self.ltime + 0.1);
		return;
	}
	vdestdelta = (tdest - self.origin);
	len = vlen (vdestdelta);
	traveltime = (len / tspeed);
	if ((traveltime < 0.03))
	{
		traveltime = 0.03;
	}
	self.nextthink = (self.ltime + traveltime);
	self.velocity = (vdestdelta * (SBAR_GRENS / traveltime));
};

void () SUB_CalcMoveDone =
{
	setorigin (self, self.finaldest);
	self.velocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
	{
		self.think1 ();
	}
};

void (vector destangle, float tspeed, void() func) SUB_CalcAngleMove =
{
	local vector destdelta;
	local float len;
	local float traveltime;

	if (!tspeed)
	{
		objerror ("No speed is defined!");
	}
	destdelta = (destangle - self.angles);
	len = vlen (destdelta);
	traveltime = (len / tspeed);
	self.nextthink = (self.ltime + traveltime);
	self.avelocity = (destdelta * (SBAR_GRENS / traveltime));
	self.think1 = func;
	self.finalangle = destangle;
	self.think = SUB_CalcAngleMoveDone;
};

void () SUB_CalcAngleMoveDone =
{
	self.angles = self.finalangle;
	self.avelocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
	{
		self.think1 ();
	}
};

void () DelayThink =
{
	activator = self.enemy;
	SUB_UseTargets ();
	dremove (self);
};

void () SUB_UseTargets =
{
	local entity t;
	local entity stemp;
	local entity otemp;
	local entity act;

	if (self.dont_do_triggerwork)
	{
		self.dont_do_triggerwork = RANGE_MELEE;
		return;
	}
	if (self.delay)
	{
		t = spawn ();
		t.classname = "DelayedUse";
		t.nextthink = (time + self.delay);
		t.think = DelayThink;
		t.enemy = activator;
		t.message = self.message;
		t.killtarget = self.killtarget;
		t.target = self.target;
		return;
	}
	if (((activator.classname == "player") && (self.message != "")))
	{
		CenterPrint (activator, self.message);
		if (!self.noise)
		{
			sound (activator, SBAR_PRINT, "misc/talk.wav", SBAR_GRENS, SBAR_GRENS);
		}
	}
	if ((activator.classname == "player"))
	{
		DoGroupWork (self, activator);
		DoGoalWork (self, activator);
	}
	if (self.killtarget)
	{
		t = world;
		do
		{
			t = find (t, targetname, self.killtarget);
			if (!t)
			{
				return;
			}
			remove (t);

		} while (SBAR_GRENS);
	}
	if (self.target)
	{
		act = activator;
		t = world;
		do
		{
			t = find (t, targetname, self.target);
			if (!t)
			{
				return;
			}
			stemp = self;
			otemp = other;
			self = t;
			other = stemp;
			if ((self.use != SUB_Null))
			{
				if (self.use)
				{
					self.use ();
				}
			}
			self = stemp;
			other = otemp;
			activator = act;

		} while (SBAR_GRENS);
	}
};

void (float normal) SUB_AttackFinished =
{
	self.cnt = RANGE_MELEE;
	if ((skill < AS_MELEE))
	{
		self.attack_finished = (time + normal);
	}
};
void () Napalm_touch;
void () T_MissileTouch;
void () info_player_start;
void (entity targ, entity attacker) ClientObituary;
void (entity Goal, entity AP, float addb) DoResults;
float (entity Goal, entity AP) Activated;
void () monster_death_use;

float (entity targ, entity inflictor) CanDamage =
{
	if ((targ.movetype == 7))
	{
		traceline (inflictor.origin, (0.5 * (targ.absmin + targ.absmax)), SBAR_GRENS, self);
		if ((trace_fraction == SBAR_GRENS))
		{
			return (SBAR_GRENS);
		}
		if ((trace_ent == targ))
		{
			return (SBAR_GRENS);
		}
		return (RANGE_MELEE);
	}
	traceline (inflictor.origin, targ.origin, SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return (SBAR_GRENS);
	}
	traceline (inflictor.origin, (targ.origin + '15 15 0'), SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return (SBAR_GRENS);
	}
	traceline (inflictor.origin, (targ.origin + '-15 -15 0'), SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return (SBAR_GRENS);
	}
	traceline (inflictor.origin, (targ.origin + '-15 15 0'), SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return (SBAR_GRENS);
	}
	traceline (inflictor.origin, (targ.origin + '15 -15 0'), SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return (SBAR_GRENS);
	}
	return (RANGE_MELEE);
};

void (entity targ, entity attacker) Killed =
{
	local entity oself;
	local string db;

	oself = self;
	self = targ;
	if ((self.health < -99))
	{
		self.health = -99;
	}
	if (((self.movetype == 7) || (self.movetype == RANGE_MELEE)))
	{
		self.th_die ();
		self = oself;
		return;
	}
	self.enemy = attacker;
	if ((self.flags & space))
	{
		killed_monsters = (killed_monsters + SBAR_GRENS);
		WriteByte (SBAR_PRINT, SBAR_350);
	}
	ClientObituary (self, attacker);
	self.takedamage = RANGE_MELEE;
	self.touch = SUB_Null;
	monster_death_use ();
	self.th_die ();
	self = oself;
};

void (entity targ, entity inflictor, entity attacker, float damage) T_Damage =
{
	local vector dir;
	local entity oldself;
	local entity te;
	local float save;
	local float take;

	if (!targ.takedamage)
	{
		return;
	}
	if ((attacker.classname == "player"))
	{
		damage = (damage * 0.9);
	}
	if ((attacker.classname == "player"))
	{
		if ((attacker.super_damage_finished > time))
		{
			damage = (damage * AS_MISSILE);
		}
		if ((targ.classname != "player"))
		{
			if (!Activated (targ, attacker))
			{
				if ((targ.else_goal != RANGE_MELEE))
				{
					te = Findgoal (targ.else_goal);
					if (te)
					{
						AttemptToActivate (te, attacker, targ);
					}
				}
				return;
			}
		}
	}
	damage_attacker = attacker;
	save = ceil ((targ.armortype * damage));
	if ((save >= targ.armorvalue))
	{
		save = targ.armorvalue;
		targ.armortype = RANGE_MELEE;
		targ.armorclass = RANGE_MELEE;
		targ.items = (targ.items - (targ.items & ((8192 | 16384) | 32768)));
	}
	targ.armorvalue = (targ.armorvalue - save);
	take = ceil ((damage - save));
	if ((targ.flags & 8))
	{
		targ.dmg_take = (targ.dmg_take + take);
		targ.dmg_save = (targ.dmg_save + save);
		targ.dmg_inflictor = inflictor;
	}
	if (((inflictor != world) && (targ.movetype == AS_MELEE)))
	{
		targ.immune_to_check = (time + (damage / 20));
		dir = (targ.origin - ((inflictor.absmin + inflictor.absmax) * 0.5));
		dir = normalize (dir);
		if ((((damage < SBAR_600) & ((attacker.classname == "player") & (targ.classname == "player"))) & (attacker.netname != targ.netname)))
		{
			targ.velocity = (targ.velocity + ((dir * damage) * SBAR_200));
		}
		else
		{
			targ.velocity = (targ.velocity + ((dir * damage) * 8));
		}
		if ((((rj > SBAR_GRENS) & ((attacker.classname == "player") & (targ.classname == "player"))) & (attacker.netname == targ.netname)))
		{
			targ.velocity = (targ.velocity + ((dir * damage) * rj));
		}
	}
	if ((targ.flags & 64))
	{
		return;
	}
	if ((targ.invincible_finished >= time))
	{
		if ((self.invincible_sound < time))
		{
			sound (targ, AS_MELEE, "items/protect3.wav", SBAR_GRENS, SBAR_GRENS);
			self.invincible_sound = (time + SBAR_PRINT);
		}
		return;
	}
	if (((attacker.classname == "player") && ((targ.classname == "player") || (targ.classname == "building_sentrygun"))))
	{
		if ((((targ.team_no > RANGE_MELEE) && (targ.team_no == attacker.team_no)) && (targ != attacker)))
		{
			if ((teamplay & SBAR_240))
			{
				return;
			}
			else
			{
				if ((teamplay & 8))
				{
					take = (take / SBAR_PRINT);
				}
			}
		}
	}
	if (((take < SBAR_GRENS) && (take != RANGE_MELEE)))
	{
		take = SBAR_GRENS;
	}
	if ((practice && (targ.classname == "player")))
	{
		targ.health = (1000 + take);
	}
	else
	{
		targ.health = (targ.health - take);
	}
	if ((targ.armorvalue < SBAR_GRENS))
	{
		targ.armorclass = RANGE_MELEE;
		targ.armorvalue = RANGE_MELEE;
	}
	if ((targ.health <= RANGE_MELEE))
	{
		Killed (targ, attacker);
		return;
	}
	oldself = self;
	self = targ;
	if (self.th_pain)
	{
		self.th_pain (attacker, take);
		if ((skill >= AS_MELEE))
		{
			self.pain_finished = (time + 5);
		}
	}
	self = oldself;
};

void (entity targ, entity inflictor, entity attacker, float damage, float T_flags, float T_AttackType) TF_T_Damage =
{
	local vector dir;
	local entity oldself;
	local entity te;
	local float save;
	local float take;
	local float olddmsg;
	local float no_damage;
	local float moment;

	if ((targ.takedamage == RANGE_MELEE))
	{
		return;
	}
	if ((T_AttackType & 256))
	{
		targ.health = damage;
		return;
	}
	if (cease_fire)
	{
		return;
	}
	no_damage = RANGE_MELEE;
	if ((targ.classname == "player"))
	{
		if (!cb_prematch)
		{
			targ.dmg_recieved = (targ.dmg_recieved + damage);
			if ((attacker.classname == "player"))
			{
				if ((attacker == targ))
				{
					attacker.dmg_self = (attacker.dmg_self + damage);
				}
				else
				{
					if ((attacker.team_no == targ.team_no))
					{
						attacker.dmg_team = (attacker.dmg_team + damage);
					}
					else
					{
						attacker.dmg_inflicted = (attacker.dmg_inflicted + damage);
					}
				}
			}
		}
	}
	if ((attacker.classname == "player"))
	{
		damage = (damage * 0.9);
		if ((attacker.super_damage_finished > time))
		{
			damage = (damage * AS_MISSILE);
		}
		if ((((targ.classname != "player") && (targ.classname != "building_sentrygun")) && (targ.classname != "building_dispenser")))
		{
			if (!Activated (targ, attacker))
			{
				if ((targ.else_goal != RANGE_MELEE))
				{
					te = Findgoal (targ.else_goal);
					if (te)
					{
						AttemptToActivate (te, attacker, targ);
					}
				}
				return;
			}
		}
	}
	damage_attacker = attacker;
	if (((targ.armorclass != RANGE_MELEE) && (T_AttackType != RANGE_MELEE)))
	{
		if (((targ.armorclass & SBAR_GRENS) && (T_AttackType & SBAR_GRENS)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & SBAR_PRINT) && (T_AttackType & SBAR_PRINT)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & AS_MISSILE) && (T_AttackType & AS_MISSILE)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & 8) && (T_AttackType & 8)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & SBAR_240) && (T_AttackType & SBAR_240)))
		{
			damage = floor ((damage * 0.5));
		}
	}
	if ((T_flags & SBAR_GRENS))
	{
		take = damage;
		save = RANGE_MELEE;
	}
	else
	{
		save = ceil ((targ.armortype * damage));
		if ((((((attacker.classname == "player") && (targ.team_no > RANGE_MELEE)) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & SBAR_PRINT)))
		{
			if ((T_AttackType & AS_MISSILE))
			{
				if ((teamplay & 1024))
				{
					save = RANGE_MELEE;
				}
				else
				{
					if ((teamplay & 512))
					{
						save = (save / SBAR_PRINT);
					}
				}
			}
			else
			{
				if ((teamplay & 256))
				{
					save = RANGE_MELEE;
				}
				else
				{
					if ((teamplay & 128))
					{
						save = (save / SBAR_PRINT);
					}
				}
			}
		}
		if ((save >= targ.armorvalue))
		{
			save = targ.armorvalue;
			targ.armortype = RANGE_MELEE;
			targ.armorclass = RANGE_MELEE;
			targ.items = (targ.items - (targ.items & ((8192 | 16384) | 32768)));
		}
		targ.armorvalue = (targ.armorvalue - save);
		take = ceil ((damage - save));
	}
	if ((targ.flags & 8))
	{
		targ.dmg_take = (targ.dmg_take + take);
		targ.dmg_save = (targ.dmg_save + save);
		targ.dmg_inflictor = inflictor;
	}
	if ((((inflictor != world) && (targ.movetype == AS_MELEE)) && !(targ.tfstate & 65536)))
	{
		if ((deathmsg != 9))
		{
			targ.immune_to_check = (time + (damage / 20));
			dir = (targ.origin - ((inflictor.absmin + inflictor.absmax) * 0.5));
			dir = normalize (dir);
			if ((targ.playerclass == 6))
			{
				moment = (damage / AS_MISSILE);
				if ((damage <= _2))
				{
					moment = RANGE_MELEE;
				}
			}
			else
			{
				moment = damage;
			}
			if ((((moment < SBAR_600) && ((attacker.classname == "player") && (targ.classname == "player"))) && (attacker.netname != targ.netname)))
			{
				targ.velocity = (targ.velocity + ((dir * moment) * SBAR_200));
			}
			else
			{
				targ.velocity = (targ.velocity + ((dir * moment) * 8));
			}
			if ((((rj > SBAR_GRENS) && ((attacker.classname == "player") && (targ.classname == "player"))) && (attacker.netname == targ.netname)))
			{
				targ.velocity = (targ.velocity + ((dir * moment) * rj));
			}
		}
	}
	if ((targ.flags & 64))
	{
		return;
	}
	if ((targ.invincible_finished >= time))
	{
		if ((self.invincible_sound < time))
		{
			sound (targ, AS_MELEE, "items/protect3.wav", SBAR_GRENS, SBAR_GRENS);
			self.invincible_sound = (time + SBAR_PRINT);
		}
		return;
	}
	if (((attacker.classname == "player") && (((((targ.classname == "player") || (targ.classname == "building_sentrygun")) || (targ.classname == "building_dispenser")) || (targ.classname == "building_teleporter_entrance")) || (targ.classname == "building_teleporter_exit"))))
	{
		if (((((targ.team_no > RANGE_MELEE) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & SBAR_PRINT)))
		{
			if ((T_AttackType & AS_MISSILE))
			{
				if ((teamplay & SBAR_240))
				{
					no_damage = SBAR_GRENS;
				}
				else
				{
					if ((teamplay & 8))
					{
						take = (take / SBAR_PRINT);
					}
				}
			}
			else
			{
				if ((teamplay & AS_MISSILE))
				{
					no_damage = SBAR_GRENS;
				}
				else
				{
					if ((teamplay & SBAR_PRINT))
					{
						take = (take / SBAR_PRINT);
					}
				}
			}
		}
	}
	if ((T_flags & AS_MISSILE))
	{
		if ((targ == attacker))
		{
			return;
		}
	}
	if ((take < SBAR_GRENS))
	{
		take = SBAR_GRENS;
	}
	take = rint (take);
	if ((no_damage == RANGE_MELEE))
	{
		if ((practice && (targ.classname == "player")))
		{
			targ.health = (1000 + take);
		}
		else
		{
			targ.health = (targ.health - take);
		}
	}
	if (((attacker.classname == "player") && (((targ.classname == "player") || (targ.classname == "building_sentrygun")) || (targ.classname == "building_dispenser"))))
	{
		if (((((targ.team_no > RANGE_MELEE) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & SBAR_PRINT)))
		{
			olddmsg = deathmsg;
			if ((T_AttackType & AS_MISSILE))
			{
				deathmsg = 37;
				if ((teamplay & 16384))
				{
					TF_T_Damage (attacker, world, world, take, SBAR_GRENS, RANGE_MELEE);
				}
				else
				{
					if ((teamplay & 8192))
					{
						TF_T_Damage (attacker, world, world, (take / SBAR_PRINT), SBAR_GRENS, RANGE_MELEE);
					}
				}
			}
			else
			{
				deathmsg = 37;
				if ((teamplay & 4096))
				{
					TF_T_Damage (attacker, world, world, take, SBAR_GRENS, RANGE_MELEE);
				}
				else
				{
					if ((teamplay & 2048))
					{
						TF_T_Damage (attacker, world, world, (take / SBAR_PRINT), SBAR_GRENS, RANGE_MELEE);
					}
				}
			}
			deathmsg = olddmsg;
		}
	}
	if ((no_damage == SBAR_GRENS))
	{
		return;
	}
	if ((targ.armorvalue < SBAR_GRENS))
	{
		targ.armorclass = RANGE_MELEE;
		targ.armorvalue = RANGE_MELEE;
	}
	if ((targ.health <= RANGE_MELEE))
	{
		if ((((inflictor.classname == "detpack") && (inflictor.weaponmode == SBAR_GRENS)) && (inflictor.enemy == targ)))
		{
			deathmsg = SBAR_240;
		}
		Killed (targ, attacker);
		return;
	}
	oldself = self;
	self = targ;
	if (self.th_pain)
	{
		self.th_pain (attacker, take);
		if ((skill >= AS_MELEE))
		{
			self.pain_finished = (time + 5);
		}
	}
	self = oldself;
};

void (entity inflictor, entity attacker, float damage, entity ignore) T_RadiusDamage =
{
	local float points;
	local entity head;
	local entity te;
	local vector org;

	head = findradius (inflictor.origin, (damage + 40));
	while (head)
	{
		if ((head != ignore))
		{
			if (head.takedamage)
			{
				org = (head.origin + ((head.mins + head.maxs) * 0.5));
				points = (0.5 * vlen ((inflictor.origin - org)));
				if ((points < RANGE_MELEE))
				{
					points = RANGE_MELEE;
				}
				points = (damage - points);
				if ((head == attacker))
				{
					points = (points * 0.75);
				}
				if ((points > RANGE_MELEE))
				{
					if (CanDamage (head, inflictor))
					{
						if ((inflictor.weapon == SBAR_384))
						{
							TF_T_Damage (head, inflictor, attacker, points, SBAR_PRINT, AS_MISSILE);
							other = head;
							Napalm_touch ();
							if ((other.classname == "player"))
							{
								stuffcmd (other, "bf\nbf\n");
							}
						}
						else
						{
							TF_T_Damage (head, inflictor, attacker, points, SBAR_PRINT, AS_MISSILE);
						}
					}
				}
			}
		}
		head = head.chain;
	}
};

void (entity attacker, float damage) T_BeamDamage =
{
	local float points;
	local entity head;

	head = findradius (attacker.origin, (damage + 40));
	while (head)
	{
		if (head.takedamage)
		{
			points = (0.5 * vlen ((attacker.origin - head.origin)));
			points = (damage - points);
			if ((head == attacker))
			{
				points = (points * 0.5);
			}
			if ((points > RANGE_MELEE))
			{
				if (CanDamage (head, attacker))
				{
					T_Damage (head, attacker, attacker, points);
				}
			}
		}
		head = head.chain;
	}
};
float (entity Retriever, float AmmoType) TeamFortress_GetMaxAmmo;
float (entity Retriever, float WeaponType) TeamFortress_CanGetWeapon;
void (entity Retriever, entity Items) TeamFortress_AddBackpackItems;
void (entity p) TeamFortress_SetSpeed;
void () tfgoal_touch;

void () SUB_regen =
{
	self.model = self.mdl;
	self.solid = SBAR_GRENS;
	sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
	setorigin (self, self.origin);
};

void () noclass =
{
	dprint ("noclass spawned at");
	dprint (vtos (self.origin));
	dprint ("\n");
	remove (self);
};

void () q_touch =
{
	local entity stemp;
	local float best;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	self.mdl = self.model;
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | 4194304);
	self.model = string_null;
	other.super_time = SBAR_GRENS;
	other.super_damage_finished = self.cnt;
	s = ftos (rint ((other.super_damage_finished - time)));
	bprint (RANGE_MELEE, other.netname);
	bprint (RANGE_MELEE, " recovered a Quad with ");
	bprint (RANGE_MELEE, s);
	bprint (RANGE_MELEE, " seconds remaining!\n");
	activator = other;
	SUB_UseTargets ();
};

void (float timeleft) DropQuad =
{
	local entity item;

	item = spawn ();
	item.origin = (self.origin - '0 0 24');
	item.velocity_z = 300;
	item.velocity_x = (-100 + (random () * 200));
	item.velocity_y = (-100 + (random () * 200));
	item.flags = 256;
	item.solid = SBAR_GRENS;
	item.movetype = 6;
	item.noise = "items/damage.wav";
	setmodel (item, "progs/quaddama.mdl");
	setsize (item, '-16 -16 -24', '16 16 32');
	item.cnt = (time + timeleft);
	item.touch = q_touch;
	item.nextthink = (time + timeleft);
	item.think = SUB_Remove;
};

void () r_touch =
{
	local entity stemp;
	local float best;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	self.mdl = self.model;
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | 524288);
	self.model = string_null;
	other.invisible_time = SBAR_GRENS;
	other.invisible_finished = self.cnt;
	s = ftos (rint ((other.invisible_finished - time)));
	bprint (RANGE_MELEE, other.netname);
	bprint (RANGE_MELEE, " recovered a Ring with ");
	bprint (RANGE_MELEE, s);
	bprint (RANGE_MELEE, " seconds remaining!\n");
	activator = other;
	SUB_UseTargets ();
};

void (float timeleft) DropRing =
{
	local entity item;

	item = spawn ();
	item.origin = (self.origin - '0 0 24');
	item.velocity_z = 300;
	item.velocity_x = (-100 + (random () * 200));
	item.velocity_y = (-100 + (random () * 200));
	item.flags = 256;
	item.solid = SBAR_GRENS;
	item.movetype = 6;
	item.noise = "items/inv1.wav";
	setmodel (item, "progs/invisibl.mdl");
	setsize (item, '-16 -16 -24', '16 16 32');
	item.cnt = (time + timeleft);
	item.touch = r_touch;
	item.nextthink = (time + timeleft);
	item.think = SUB_Remove;
};

void () PlaceItem =
{
	local float oldz;

	self.mdl = self.model;
	self.flags = 256;
	self.movetype = 6;
	self.solid = SBAR_GRENS;
	self.velocity = '0 0 0';
	self.origin_z = (self.origin_z + 6);
	oldz = self.origin_z;
	if (!droptofloor ())
	{
		dprint ("Bonus item fell out of level at ");
		dprint (vtos (self.origin));
		dprint (" ");
		dprint (self.classname);
		dprint ("\n");
		dremove (self);
		return;
	}
};

void () StartItem =
{
	self.nextthink = (time + 0.2);
	self.think = PlaceItem;
};

float (entity e, float healamount, float ignore) T_Heal =
{
	if (practice)
	{
		e.health = 1000;
		return (RANGE_MELEE);
	}
	if ((e.health <= RANGE_MELEE))
	{
		return (RANGE_MELEE);
	}
	if ((!ignore && (e.health >= e.max_health)))
	{
		if (e.leg_damage)
		{
			e.leg_damage = (e.leg_damage - ceil ((e.health / 20)));
			if ((e.leg_damage < SBAR_GRENS))
			{
				e.leg_damage = RANGE_MELEE;
			}
			TeamFortress_SetSpeed (e);
			return (SBAR_GRENS);
		}
		else
		{
			return (RANGE_MELEE);
		}
	}
	healamount = ceil (healamount);
	e.health = (e.health + healamount);
	if ((!ignore && (e.health >= e.max_health)))
	{
		e.health = e.max_health;
	}
	if ((e.health > 250))
	{
		e.health = 250;
	}
	if (e.leg_damage)
	{
		if ((e.health > __))
		{
			e.leg_damage = RANGE_MELEE;
		}
		else
		{
			e.leg_damage = (e.leg_damage - ceil ((e.health / 20)));
		}
		if ((e.leg_damage < SBAR_GRENS))
		{
			e.leg_damage = RANGE_MELEE;
		}
		TeamFortress_SetSpeed (e);
	}
	return (SBAR_GRENS);
};
.float healamount;
.float healtype;
void () health_touch;
void () item_megahealth_rot;

void () item_health =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = health_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_bh10.bsp");
		precache_sound ("items/r_item1.wav");
		setmodel (self, "maps/b_bh10.bsp");
		self.noise = "items/r_item1.wav";
		self.healamount = 15;
		self.healtype = RANGE_MELEE;
	}
	else
	{
		if ((self.spawnflags & SBAR_PRINT))
		{
			precache_model ("maps/b_bh100.bsp");
			precache_sound ("items/r_item2.wav");
			setmodel (self, "maps/b_bh100.bsp");
			self.noise = "items/r_item2.wav";
			self.healamount = _d;
			self.healtype = SBAR_PRINT;
		}
		else
		{
			precache_model ("maps/b_bh25.bsp");
			precache_sound ("items/health1.wav");
			setmodel (self, "maps/b_bh25.bsp");
			self.noise = "items/health1.wav";
			self.healamount = 25;
			self.healtype = SBAR_GRENS;
		}
	}
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_healthkit =
{
	item_health ();
};

void () health_touch =
{
	local float amount;
	local float medi;
	local string s;

	if ((other.classname != "player"))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	medi = RANGE_MELEE;
	if ((self.healtype == SBAR_PRINT))
	{
		if (!(other.tfstate & SBAR_240))
		{
			if ((other.health >= 250))
			{
				return;
			}
			if (!T_Heal (other, self.healamount, SBAR_GRENS))
			{
				return;
			}
		}
	}
	else
	{
		if (!T_Heal (other, self.healamount, RANGE_MELEE))
		{
			if ((other.weapons_carried & AS_MISSILE))
			{
				if ((other.ammo_medikit < other.maxammo_medikit))
				{
					other.ammo_medikit = (other.ammo_medikit + self.healamount);
					if ((other.ammo_medikit > other.maxammo_medikit))
					{
						other.ammo_medikit = other.maxammo_medikit;
					}
					s = ftos (self.healamount);
					sprint (other, RANGE_MELEE, "You gather ");
					sprint (other, RANGE_MELEE, s);
					sprint (other, RANGE_MELEE, " medikit ammo\n");
					sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
					stuffcmd (other, "bf\n");
					self.model = string_null;
					self.solid = RANGE_MELEE;
					if ((deathmatch != SBAR_PRINT))
					{
						if (deathmatch)
						{
							self.nextthink = (time + 20);
						}
						self.think = SUB_regen;
					}
					activator = other;
					W_SetCurrentAmmo ();
					SUB_UseTargets ();
				}
			}
			return;
		}
	}
	if (((other.tfstate & SBAR_240) && (self.healamount > _P)))
	{
		sprint (other, SBAR_GRENS, "You have been healed of your infection!");
		other.tfstate = (other.tfstate - (other.tfstate & SBAR_240));
	}
	else
	{
		s = ftos (self.healamount);
		sprint (other, RANGE_MELEE, "You receive ");
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " health\n");
	}
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.model = string_null;
	self.solid = RANGE_MELEE;
	if ((self.healtype == SBAR_PRINT))
	{
		other.items = (other.items | 65536);
		self.nextthink = (time + 5);
		self.think = item_megahealth_rot;
		self.owner = other;
	}
	else
	{
		if ((deathmatch != SBAR_PRINT))
		{
			if (deathmatch)
			{
				self.nextthink = (time + 20);
			}
			self.think = SUB_regen;
		}
	}
	activator = other;
	SUB_UseTargets ();
};

void () item_megahealth_rot =
{
	other = self.owner;
	if ((other.health > other.max_health))
	{
		other.health = (other.health - SBAR_GRENS);
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	other.items = (other.items - (other.items & 65536));
	if ((self.classname == "medikit_rot"))
	{
		dremove (self);
		return;
	}
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 20);
		self.think = SUB_regen;
	}
};

void () armor_touch =
{
	local float type;
	local float value;
	local float bit;
	local string s;
	local entity oldself;

	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((self.classname == "item_armor1"))
	{
		type = 0.3;
		value = _d;
		bit = 8192;
	}
	else
	{
		if ((self.classname == "item_armor2"))
		{
			type = 0.6;
			value = 150;
			bit = 16384;
		}
		else
		{
			type = 0.8;
			value = 300;
			bit = 32768;
		}
	}
	if (((other.armortype * other.armorvalue) >= (type * value)))
	{
		if ((other.playerclass == 9))
		{
			if ((other.ammo_cells >= other.maxammo_cells))
			{
				return;
			}
		}
		else
		{
			return;
		}
	}
	if (((other.armor_allowed * other.maxarmor) <= (type * value)))
	{
		if ((other.armor_allowed == other.armortype))
		{
			if ((other.maxarmor == other.armorvalue))
			{
				if ((other.playerclass == 9))
				{
					if ((other.ammo_cells >= other.maxammo_cells))
					{
						return;
					}
				}
				else
				{
					return;
				}
			}
		}
	}
	if ((type > other.armor_allowed))
	{
		type = other.armor_allowed;
		if ((type == 0.3))
		{
			bit = 8192;
		}
		else
		{
			if ((type == 0.6))
			{
				bit = 16384;
			}
			else
			{
				if ((type == 0.8))
				{
					bit = 32768;
				}
			}
		}
	}
	sprint (other, RANGE_MELEE, "You got armor\n");
	if ((value > other.maxarmor))
	{
		if (((other.playerclass == 9) && (other.ammo_cells < other.maxammo_cells)))
		{
			s = ftos ((value - other.maxarmor));
			sprint (other, RANGE_MELEE, s);
			sprint (other, RANGE_MELEE, " metal\n");
			other.ammo_cells = (other.ammo_cells + (value - other.maxarmor));
			if ((other.ammo_cells > other.maxammo_cells))
			{
				other.ammo_cells = other.maxammo_cells;
			}
			oldself = self;
			self = other;
			W_SetCurrentAmmo ();
			self = oldself;
		}
		value = other.maxarmor;
	}
	if (((other.armortype * other.armorvalue) < (type * value)))
	{
		other.armortype = type;
		other.armorvalue = value;
		other.items = ((other.items - (other.items & ((8192 | 16384) | 32768))) + bit);
	}
	if ((self.armorclass > RANGE_MELEE))
	{
		other.armorclass = self.armorclass;
	}
	self.solid = RANGE_MELEE;
	self.model = string_null;
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 20);
	}
	if (coop)
	{
		self.nextthink = (time + 40);
	}
	self.think = SUB_regen;
	sound (other, AS_MELEE, "items/armor1.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	activator = other;
	SUB_UseTargets ();
};

void () item_armor1 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = RANGE_MELEE;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armor2 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = SBAR_GRENS;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armorInv =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = armor_touch;
	precache_model ("progs/armor.mdl");
	setmodel (self, "progs/armor.mdl");
	self.skin = SBAR_PRINT;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () item_armor3 =
{
	item_armorInv ();
};

void (entity p) bound_other_ammo =
{
	if ((p.ammo_shells > TeamFortress_GetMaxAmmo (p, 256)))
	{
		p.ammo_shells = TeamFortress_GetMaxAmmo (p, 256);
	}
	if ((p.ammo_nails > TeamFortress_GetMaxAmmo (p, 512)))
	{
		p.ammo_nails = TeamFortress_GetMaxAmmo (p, 512);
	}
	if ((p.ammo_rockets > TeamFortress_GetMaxAmmo (p, 1024)))
	{
		p.ammo_rockets = TeamFortress_GetMaxAmmo (p, 1024);
	}
	if ((p.ammo_cells > TeamFortress_GetMaxAmmo (p, 2048)))
	{
		p.ammo_cells = TeamFortress_GetMaxAmmo (p, 2048);
	}
	if ((p.ammo_medikit > p.maxammo_medikit))
	{
		p.ammo_medikit = p.maxammo_medikit;
	}
	if ((p.armorvalue > p.maxarmor))
	{
		p.armorvalue = p.maxarmor;
	}
	if ((p.no_grenades_1 > AS_MISSILE))
	{
		p.no_grenades_1 = AS_MISSILE;
	}
	if ((p.no_grenades_2 > AS_MISSILE))
	{
		p.no_grenades_2 = AS_MISSILE;
	}
	if (((p.tp_grenades_1 == AS_MELEE) && (p.no_grenades_1 > SBAR_PRINT)))
	{
		p.no_grenades_1 = SBAR_PRINT;
	}
	if (((p.tp_grenades_2 == AS_MELEE) && (p.no_grenades_2 > SBAR_PRINT)))
	{
		p.no_grenades_2 = SBAR_PRINT;
	}
	if (((p.tp_grenades_1 == SBAR_PRINT) && (p.no_grenades_1 > AS_MELEE)))
	{
		p.no_grenades_1 = AS_MELEE;
	}
	if (((p.tp_grenades_2 == SBAR_PRINT) && (p.no_grenades_2 > AS_MELEE)))
	{
		p.no_grenades_2 = AS_MELEE;
	}
	if (((p.tp_grenades_1 == enter) && (p.no_grenades_1 > AS_MELEE)))
	{
		p.no_grenades_1 = AS_MELEE;
	}
	if (((p.tp_grenades_2 == enter) && (p.no_grenades_2 > AS_MELEE)))
	{
		p.no_grenades_2 = AS_MELEE;
	}
};

float (float w) RankForWeapon =
{
	if ((w == 65536))
	{
		return (SBAR_GRENS);
	}
	if ((w == 8192))
	{
		return (SBAR_PRINT);
	}
	if ((w == 1024))
	{
		return (AS_MELEE);
	}
	if ((w == 2048))
	{
		return (AS_MISSILE);
	}
	if ((w == 256))
	{
		return (5);
	}
	if ((w == 512))
	{
		return (6);
	}
	return (7);
};

void (float old, float new) Deathmatch_Weapon =
{
};
void () ammo_touch;

void (entity ritem, entity act) Respawn_Item =
{
	local entity oldself;

	oldself = self;
	self = ritem;
	self.model = string_null;
	self.solid = RANGE_MELEE;
	if ((deathmatch != SBAR_PRINT))
	{
		self.nextthink = (time + 30);
	}
	else
	{
		if ((coop && (ritem.touch == ammo_touch)))
		{
			self.nextthink = (time + minus);
		}
	}
	self.think = SUB_regen;
	activator = act;
	SUB_UseTargets ();
	self = oldself;
};
float () W_BestWeapon;

void () weapon_touch =
{
	local float hadammo;
	local float best;
	local float new;
	local float old;
	local entity stemp;
	local float leave;

	if (!(other.flags & 8))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	stemp = self;
	self = other;
	best = W_BestWeapon ();
	self = stemp;
	if (((deathmatch == SBAR_PRINT) || coop))
	{
		leave = SBAR_GRENS;
	}
	else
	{
		leave = RANGE_MELEE;
	}
	if ((self.classname == "weapon_nailgun"))
	{
		if ((leave && (other.weapons_carried & 512)))
		{
			return;
		}
		if (!TeamFortress_CanGetWeapon (other, 512))
		{
			return;
		}
		hadammo = other.ammo_nails;
		new = 512;
		other.ammo_nails = (other.ammo_nails + 30);
	}
	else
	{
		if ((self.classname == "weapon_supernailgun"))
		{
			if ((leave && (other.weapons_carried & 1024)))
			{
				return;
			}
			if (!TeamFortress_CanGetWeapon (other, 1024))
			{
				return;
			}
			hadammo = other.ammo_rockets;
			new = 1024;
			other.ammo_nails = (other.ammo_nails + 30);
		}
		else
		{
			if ((self.classname == "weapon_supershotgun"))
			{
				if ((leave && (other.weapons_carried & 256)))
				{
					return;
				}
				if (!TeamFortress_CanGetWeapon (other, 256))
				{
					return;
				}
				hadammo = other.ammo_rockets;
				new = 256;
				other.ammo_shells = (other.ammo_shells + 5);
			}
			else
			{
				if ((self.classname == "weapon_rocketlauncher"))
				{
					if ((leave && (other.weapons_carried & 8192)))
					{
						return;
					}
					if (!TeamFortress_CanGetWeapon (other, 8192))
					{
						return;
					}
					hadammo = other.ammo_rockets;
					new = 8192;
					other.ammo_rockets = (other.ammo_rockets + 5);
				}
				else
				{
					if ((self.classname == "weapon_grenadelauncher"))
					{
						if ((leave && (other.weapons_carried & 2048)))
						{
							return;
						}
						if (!TeamFortress_CanGetWeapon (other, 2048))
						{
							return;
						}
						hadammo = other.ammo_rockets;
						new = 2048;
						other.ammo_rockets = (other.ammo_rockets + 5);
					}
					else
					{
						if ((self.classname == "weapon_lightning"))
						{
							if ((leave && (other.weapons_carried & 65536)))
							{
								return;
							}
							if (!TeamFortress_CanGetWeapon (other, 65536))
							{
								return;
							}
							hadammo = other.ammo_rockets;
							new = 65536;
							other.ammo_cells = (other.ammo_cells + 15);
						}
						else
						{
							objerror ("weapon_touch: unknown classname");
						}
					}
				}
			}
		}
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, "weapons/pkup.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	bound_other_ammo (other);
	old = other.weapons_carried;
	other.weapons_carried = (other.weapons_carried | new);
	stemp = self;
	self = other;
	Deathmatch_Weapon (old, new);
	W_SetCurrentAmmo ();
	self = stemp;
	if (leave)
	{
		return;
	}
	Respawn_Item (self, other);
};

void () weapon_supershotgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_shot.mdl");
	setmodel (self, "progs/g_shot.mdl");
	self.weapon = 256;
	self.netname = "Double-barrelled Shotgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_nailgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_nail.mdl");
	setmodel (self, "progs/g_nail.mdl");
	self.weapon = 512;
	self.netname = "nailgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_supernailgun =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_nail2.mdl");
	setmodel (self, "progs/g_nail2.mdl");
	self.weapon = 1024;
	self.netname = "Super Nailgun";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_grenadelauncher =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_rock.mdl");
	setmodel (self, "progs/g_rock.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Grenade Launcher";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_rocketlauncher =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_rock2.mdl");
	setmodel (self, "progs/g_rock2.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Rocket Launcher";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void () weapon_lightning =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/g_light.mdl");
	setmodel (self, "progs/g_light.mdl");
	self.weapon = AS_MELEE;
	self.netname = "Thunderbolt";
	self.touch = weapon_touch;
	setsize (self, '-16 -16 0', '16 16 56');
	StartItem ();
};

void (entity pl, float typ) PrintGrenadeType =
{
	local string st;

	if ((typ == SBAR_GRENS))
	{
		st = "Normal";
	}
	else
	{
		if ((typ == SBAR_PRINT))
		{
			st = "Concussion";
		}
		else
		{
			if ((typ == AS_MELEE))
			{
				st = "Nail";
			}
			else
			{
				if ((typ == AS_MISSILE))
				{
					st = "Mirv";
				}
				else
				{
					if ((typ == 5))
					{
						st = "Napalm";
					}
					else
					{
						if ((typ == 6))
						{
							st = "Flare";
						}
						else
						{
							if ((typ == 7))
							{
								st = "Gas";
							}
							else
							{
								if ((typ == 8))
								{
									st = "EMP";
								}
								else
								{
									if ((typ == enter))
									{
										st = "Caltrop";
									}
								}
							}
						}
					}
				}
			}
		}
	}
	sprint (pl, SBAR_PRINT, st);
};

float () GetGrenadePossibility =
{
	local float maxg;

	if ((random () < 0.5))
	{
		return (RANGE_MELEE);
	}
	maxg = AS_MISSILE;
	if ((random () < 0.5))
	{
		if ((other.tp_grenades_1 == AS_MELEE))
		{
			maxg = SBAR_PRINT;
		}
		if ((other.tp_grenades_1 == enter))
		{
			maxg = AS_MELEE;
		}
		if (((other.tp_grenades_1 != RANGE_MELEE) && (other.no_grenades_1 < maxg)))
		{
			other.no_grenades_1 = (other.no_grenades_1 + SBAR_GRENS);
			sprint (other, SBAR_PRINT, "You found a ");
			PrintGrenadeType (other, other.tp_grenades_1);
			if ((other.tp_grenades_1 == enter))
			{
				sprint (other, SBAR_PRINT, " canister\n");
			}
			else
			{
				sprint (other, SBAR_PRINT, " grenade\n");
			}
			return (SBAR_GRENS);
		}
	}
	else
	{
		if ((other.tp_grenades_2 == AS_MELEE))
		{
			maxg = SBAR_PRINT;
		}
		if ((other.tp_grenades_2 == SBAR_PRINT))
		{
			maxg = AS_MELEE;
		}
		if (((other.tp_grenades_2 != RANGE_MELEE) && (other.no_grenades_2 < maxg)))
		{
			other.no_grenades_2 = (other.no_grenades_2 + SBAR_GRENS);
			sprint (other, SBAR_PRINT, "You found a ");
			PrintGrenadeType (other, other.tp_grenades_2);
			sprint (other, SBAR_PRINT, " grenade\n");
			return (SBAR_GRENS);
		}
	}
	return (RANGE_MELEE);
};

void () ammo_touch =
{
	local entity stemp;
	local float best;
	local float gotgren;
	local float gotbox;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	gotgren = RANGE_MELEE;
	gotbox = RANGE_MELEE;
	stemp = self;
	self = other;
	best = W_BestWeapon ();
	self = stemp;
	if ((self.weapon == SBAR_GRENS))
	{
		if ((other.ammo_shells >= TeamFortress_GetMaxAmmo (other, 256)))
		{
			return;
		}
		other.ammo_shells = (other.ammo_shells + self.aflag);
		gotbox = SBAR_GRENS;
	}
	if ((self.weapon == SBAR_PRINT))
	{
		if ((other.ammo_nails >= TeamFortress_GetMaxAmmo (other, 512)))
		{
			return;
		}
		other.ammo_nails = (other.ammo_nails + self.aflag);
		gotbox = SBAR_GRENS;
	}
	else
	{
		if ((self.weapon == AS_MELEE))
		{
			gotgren = GetGrenadePossibility ();
			if ((other.ammo_rockets >= TeamFortress_GetMaxAmmo (other, 1024)))
			{
				gotbox = RANGE_MELEE;
			}
			else
			{
				gotbox = SBAR_GRENS;
				other.ammo_rockets = (other.ammo_rockets + self.aflag);
			}
		}
		else
		{
			if ((self.weapon == AS_MISSILE))
			{
				if ((other.ammo_cells >= TeamFortress_GetMaxAmmo (other, 2048)))
				{
					return;
				}
				other.ammo_cells = (other.ammo_cells + self.aflag);
				gotbox = SBAR_GRENS;
			}
		}
	}
	if ((!gotbox && !gotgren))
	{
		return;
	}
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	if (gotbox)
	{
		bound_other_ammo (other);
		sprint (other, RANGE_MELEE, "You got the ");
		sprint (other, RANGE_MELEE, self.netname);
		sprint (other, RANGE_MELEE, "\n");
		stemp = self;
		self = other;
		W_SetCurrentAmmo ();
		self = stemp;
	}
	Respawn_Item (self, other);
};

void () item_shells =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_shell1.bsp");
		setmodel (self, "maps/b_shell1.bsp");
		self.aflag = 40;
	}
	else
	{
		precache_model ("maps/b_shell0.bsp");
		setmodel (self, "maps/b_shell0.bsp");
		self.aflag = 20;
	}
	self.weapon = SBAR_GRENS;
	self.netname = "shells";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_spikes =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_nail1.bsp");
		setmodel (self, "maps/b_nail1.bsp");
		self.aflag = _2;
	}
	else
	{
		precache_model ("maps/b_nail0.bsp");
		setmodel (self, "maps/b_nail0.bsp");
		self.aflag = 25;
	}
	self.weapon = SBAR_PRINT;
	self.netname = "nails";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_rockets =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_rock1.bsp");
		setmodel (self, "maps/b_rock1.bsp");
		self.aflag = enter;
	}
	else
	{
		precache_model ("maps/b_rock0.bsp");
		setmodel (self, "maps/b_rock0.bsp");
		self.aflag = 5;
	}
	self.weapon = AS_MELEE;
	self.netname = "rockets";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_cells =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("maps/b_batt1.bsp");
		setmodel (self, "maps/b_batt1.bsp");
		self.aflag = 12;
	}
	else
	{
		precache_model ("maps/b_batt0.bsp");
		setmodel (self, "maps/b_batt0.bsp");
		self.aflag = 6;
	}
	self.weapon = AS_MISSILE;
	self.netname = "cells";
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () item_weapon =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = ammo_touch;
	if ((self.spawnflags & SBAR_GRENS))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_shell1.bsp");
			setmodel (self, "maps/b_shell1.bsp");
			self.aflag = 40;
		}
		else
		{
			precache_model ("maps/b_shell0.bsp");
			setmodel (self, "maps/b_shell0.bsp");
			self.aflag = 20;
		}
		self.weapon = SBAR_GRENS;
		self.netname = "shells";
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_nail1.bsp");
			setmodel (self, "maps/b_nail1.bsp");
			self.aflag = 40;
		}
		else
		{
			precache_model ("maps/b_nail0.bsp");
			setmodel (self, "maps/b_nail0.bsp");
			self.aflag = 20;
		}
		self.weapon = SBAR_PRINT;
		self.netname = "spikes";
	}
	if ((self.spawnflags & SBAR_PRINT))
	{
		if ((self.spawnflags & 8))
		{
			precache_model ("maps/b_rock1.bsp");
			setmodel (self, "maps/b_rock1.bsp");
			self.aflag = enter;
		}
		else
		{
			precache_model ("maps/b_rock0.bsp");
			setmodel (self, "maps/b_rock0.bsp");
			self.aflag = 5;
		}
		self.weapon = AS_MELEE;
		self.netname = "rockets";
	}
	setsize (self, '0 0 0', '32 32 56');
	StartItem ();
};

void () key_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if ((other.items & self.items))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	other.items = (other.items | self.items);
	if (!coop)
	{
		self.solid = RANGE_MELEE;
		self.model = string_null;
	}
	else
	{
		if ((coop && self.deadflag))
		{
			dremove (self);
			return;
		}
	}
	activator = other;
	SUB_UseTargets ();
};

void () key_setsounds =
{
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_sound ("misc/medkey.wav");
		self.noise = "misc/medkey.wav";
	}
	if ((world.worldtype == SBAR_GRENS))
	{
		precache_sound ("misc/runekey.wav");
		self.noise = "misc/runekey.wav";
	}
	if ((world.worldtype == SBAR_PRINT))
	{
		precache_sound2 ("misc/basekey.wav");
		self.noise = "misc/basekey.wav";
	}
};

void () item_key1 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_model ("progs/w_s_key.mdl");
		setmodel (self, "progs/w_s_key.mdl");
		self.netname = "silver key";
	}
	else
	{
		if ((world.worldtype == SBAR_GRENS))
		{
			precache_model ("progs/m_s_key.mdl");
			setmodel (self, "progs/m_s_key.mdl");
			self.netname = "silver runekey";
		}
		else
		{
			if ((world.worldtype == SBAR_PRINT))
			{
				precache_model2 ("progs/b_s_key.mdl");
				setmodel (self, "progs/b_s_key.mdl");
				self.netname = "silver keycard";
			}
		}
	}
	key_setsounds ();
	self.touch = key_touch;
	self.items = 131072;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_key2 =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if ((world.worldtype == RANGE_MELEE))
	{
		precache_model ("progs/w_g_key.mdl");
		setmodel (self, "progs/w_g_key.mdl");
		self.netname = "gold key";
	}
	if ((world.worldtype == SBAR_GRENS))
	{
		precache_model ("progs/m_g_key.mdl");
		setmodel (self, "progs/m_g_key.mdl");
		self.netname = "gold runekey";
	}
	if ((world.worldtype == SBAR_PRINT))
	{
		precache_model2 ("progs/b_g_key.mdl");
		setmodel (self, "progs/b_g_key.mdl");
		self.netname = "gold keycard";
	}
	key_setsounds ();
	self.touch = key_touch;
	self.items = 262144;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () sigil_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sound (other, AS_MELEE, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	self.model = string_null;
	serverflags = (serverflags | (self.spawnflags & 15));
	self.classname = "";
	activator = other;
	SUB_UseTargets ();
};

void () item_sigil =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	if (!self.spawnflags)
	{
		objerror ("no spawnflags");
	}
	precache_sound ("misc/runekey.wav");
	self.noise = "misc/runekey.wav";
	if ((self.spawnflags & SBAR_GRENS))
	{
		precache_model ("progs/end1.mdl");
		setmodel (self, "progs/end1.mdl");
	}
	if ((self.spawnflags & SBAR_PRINT))
	{
		precache_model2 ("progs/end2.mdl");
		setmodel (self, "progs/end2.mdl");
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		precache_model2 ("progs/end3.mdl");
		setmodel (self, "progs/end3.mdl");
	}
	if ((self.spawnflags & 8))
	{
		precache_model2 ("progs/end4.mdl");
		setmodel (self, "progs/end4.mdl");
	}
	self.touch = sigil_touch;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () powerup_touch =
{
	local entity stemp;
	local float best;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((cb_prematch == SBAR_GRENS))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	sprint (other, RANGE_MELEE, "You got the ");
	sprint (other, RANGE_MELEE, self.netname);
	sprint (other, RANGE_MELEE, "\n");
	if (deathmatch)
	{
		self.mdl = self.model;
		if (((self.classname == "item_artifact_invulnerability") || (self.classname == "item_artifact_invisibility")))
		{
			self.nextthink = (time + (SBAR_600 * 5));
		}
		else
		{
			self.nextthink = (time + SBAR_600);
		}
		self.think = SUB_regen;
	}
	else
	{
		if (coop)
		{
			self.mdl = self.model;
			if (((self.classname == "item_artifact_invulnerability") || (self.classname == "item_artifact_invisibility")))
			{
				self.nextthink = (time + (_x * 5));
			}
			else
			{
				self.nextthink = (time + _x);
			}
			self.think = SUB_regen;
		}
	}
	sound (other, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	self.solid = RANGE_MELEE;
	other.items = (other.items | self.items);
	self.model = string_null;
	if ((self.classname == "item_artifact_envirosuit"))
	{
		other.rad_time = SBAR_GRENS;
		other.radsuit_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_invulnerability"))
	{
		other.invincible_time = SBAR_GRENS;
		other.invincible_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_invisibility"))
	{
		other.invisible_time = SBAR_GRENS;
		other.invisible_finished = (time + 30);
	}
	if ((self.classname == "item_artifact_super_damage"))
	{
		other.super_time = SBAR_GRENS;
		other.super_damage_finished = (time + 30);
	}
	activator = other;
	SUB_UseTargets ();
};

void () item_artifact_invulnerability =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/invulner.mdl");
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	self.noise = "items/protect.wav";
	setmodel (self, "progs/invulner.mdl");
	self.effects = (self.effects | 128);
	self.netname = "Pentagram of Protection";
	self.items = 1048576;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_envirosuit =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/suit.mdl");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	self.noise = "items/suit.wav";
	setmodel (self, "progs/suit.mdl");
	self.netname = "Biosuit";
	self.items = 2097152;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_invisibility =
{
	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/invisibl.mdl");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	self.noise = "items/inv1.wav";
	setmodel (self, "progs/invisibl.mdl");
	self.netname = "Ring of Shadows";
	self.items = 524288;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () item_artifact_super_damage =
{
	local string st;

	if ((CheckExistence () == RANGE_MELEE))
	{
		dremove (self);
		return;
	}
	st = infokey (world, "noquad");
	if ((st == "on"))
	{
		dremove (self);
		return;
	}
	self.touch = powerup_touch;
	precache_model ("progs/quaddama.mdl");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	self.noise = "items/damage.wav";
	setmodel (self, "progs/quaddama.mdl");
	self.effects = (self.effects | 64);
	self.netname = "Quad Damage";
	self.items = 4194304;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem ();
};

void () BackpackTouch =
{
	local string s;
	local float best;
	local entity stemp;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= RANGE_MELEE))
	{
		return;
	}
	if (other.button0)
	{
		return;
	}
	other.ammo_shells = (other.ammo_shells + self.ammo_shells);
	other.ammo_nails = (other.ammo_nails + self.ammo_nails);
	other.ammo_rockets = (other.ammo_rockets + self.ammo_rockets);
	other.ammo_cells = (other.ammo_cells + self.ammo_cells);
	other.ammo_detpack = (other.ammo_detpack + self.ammo_detpack);
	other.no_grenades_1 = (other.no_grenades_1 + self.no_grenades_1);
	other.no_grenades_2 = (other.no_grenades_2 + self.no_grenades_2);
	bound_other_ammo (other);
	sprint (other, RANGE_MELEE, "You get ");
	if (self.ammo_shells)
	{
		s = ftos (self.ammo_shells);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " shells  ");
	}
	if (self.ammo_nails)
	{
		s = ftos (self.ammo_nails);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " nails ");
	}
	if (self.ammo_rockets)
	{
		s = ftos (self.ammo_rockets);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " rockets  ");
	}
	if (self.ammo_cells)
	{
		s = ftos (self.ammo_cells);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " cells  ");
	}
	if (((self.armorvalue && (other.playerclass == 9)) && (other.ammo_cells < other.maxammo_cells)))
	{
		s = ftos (self.armorvalue);
		sprint (other, RANGE_MELEE, s);
		sprint (other, RANGE_MELEE, " metal  ");
		other.ammo_cells = (other.ammo_cells + self.armorvalue);
		if ((other.ammo_cells > other.maxammo_cells))
		{
			other.ammo_cells = other.maxammo_cells;
		}
	}
	sprint (other, RANGE_MELEE, "\n");
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	dremove (self);
	self = other;
	W_SetCurrentAmmo ();
};

void () DropBackpack =
{
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (!(((self.ammo_shells + self.ammo_nails) + self.ammo_rockets) + self.ammo_cells))
	{
		return;
	}
	newmis = spawn ();
	newmis.origin = (self.origin - '0 0 24');
	newmis.ammo_shells = self.ammo_shells;
	newmis.ammo_nails = self.ammo_nails;
	newmis.ammo_rockets = self.ammo_rockets;
	newmis.ammo_cells = self.ammo_cells;
	if (allow_grenpack)
	{
		newmis.ammo_detpack = self.ammo_detpack;
		newmis.no_grenades_1 = self.no_grenades_1;
		newmis.no_grenades_2 = self.no_grenades_2;
	}
	newmis.armorvalue = self.armorvalue;
	newmis.velocity_z = 300;
	newmis.velocity_x = (-100 + (random () * 200));
	newmis.velocity_y = (-100 + (random () * 200));
	newmis.flags = 256;
	newmis.solid = SBAR_GRENS;
	newmis.movetype = 6;
	setmodel (newmis, "progs/backpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 56');
	newmis.touch = BackpackTouch;
	newmis.nextthink = (time + _Z);
	newmis.think = SUB_Remove;
};
.float fAverageFrameTime;
.float fFrameCount;
.float fFrameReset;
.float fLowestFrameTime;
.float real_time;

float () crandom =
{
	return ((SBAR_PRINT * (random () - 0.5)));
};

void () autoteam_think =
{
	toggleflags = (toggleflags | 64);
	dremove (self);
};

void () CheckFps =
{
	self.fAverageFrameTime = (self.fAverageFrameTime + frametime);
	self.fFrameCount = (self.fFrameCount + SBAR_GRENS);
	if ((frametime < self.fLowestFrameTime))
	{
		self.fLowestFrameTime = frametime;
	}
	if ((self.fFrameReset < time))
	{
		self.real_time = time;
		self.fFrameReset = (time + 15);
		self.fAverageFrameTime = RANGE_MELEE;
		self.fFrameCount = RANGE_MELEE;
		self.fLowestFrameTime = 0.013;
	}
};

void () Calibrate_Level =
{
	local string st;
	local float autoteam_time;
	local entity ent;

	st = infokey (world, "max_pipebombs");
	num_max_pipebombs = (stof (st) + SBAR_GRENS);
	if (((num_max_pipebombs < SBAR_200) || (num_max_pipebombs > 25)))
	{
		if ((number_of_teams == AS_MISSILE))
		{
			num_max_pipebombs = 21;
		}
		else
		{
			num_max_pipebombs = 15;
		}
	}
	st = infokey (world, "max_flares");
	num_max_flares = (stof (st) + SBAR_GRENS);
	if (((num_max_flares < 5) || (num_max_flares > 17)))
	{
		num_max_flares = 9;
	}
	st = infokey (world, "max_ammoboxes");
	num_max_ammoboxes = (stof (st) + SBAR_GRENS);
	if (((num_max_ammoboxes < 13) || (num_max_ammoboxes > 29)))
	{
		num_max_ammoboxes = 21;
	}
	st = infokey (world, "grapple");
	if (((st == "on") || (toggleflags & 1024)))
	{
		allow_hook = SBAR_GRENS;
	}
	else
	{
		allow_hook = RANGE_MELEE;
	}
	st = infokey (world, "flashlight");
	if ((st == "on"))
	{
		allow_flash = SBAR_GRENS;
	}
	else
	{
		allow_flash = RANGE_MELEE;
	}
	st = infokey (world, "grenpacks");
	if ((st == "on"))
	{
		allow_grenpack = SBAR_GRENS;
	}
	else
	{
		allow_grenpack = RANGE_MELEE;
	}
	st = infokey (world, "autoteam");
	if ((st == "on"))
	{
		autoteam_time = 30;
		toggleflags = (toggleflags | 64);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & 64));
		}
		else
		{
			if ((stof (st) != RANGE_MELEE))
			{
				toggleflags = (toggleflags | 64);
				autoteam_time = stof (st);
			}
		}
	}
	st = infokey (world, "autokick_time");
	autokick_time = stof (st);
	if ((autokick_time != RANGE_MELEE))
	{
		st = infokey (world, "autokick_kills");
		autokick_kills = stof (st);
	}
	st = infokey (world, "teamfrags");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | 128);
	}
	else
	{
		if ((st == "off"))
		{
			toggleflags = (toggleflags - (toggleflags & 128));
		}
	}
	st = infokey (world, "fullteamscore");
	if ((st == "on"))
	{
		toggleflags = (toggleflags | 2048);
	}
	st = infokey (world, "rd");
	respawn_delay_time = stof (st);
	if (respawn_delay_time)
	{
		toggleflags = (toggleflags | AS_MISSILE);
	}
	if (((toggleflags & AS_MISSILE) && (respawn_delay_time == RANGE_MELEE)))
	{
		respawn_delay_time = AS_MELEE;
	}
	if ((toggleflags & 64))
	{
		toggleflags = (toggleflags - (toggleflags & 64));
		ent = spawn ();
		ent.nextthink = (time + autoteam_time);
		ent.think = autoteam_think;
	}
	st = infokey (world, "grentype");
	grentype = stof (st);
	if (((grentype > SBAR_GRENS) || (grentype < RANGE_MELEE)))
	{
		grentype = RANGE_MELEE;
	}
	gspeed = stof (infokey (world, "gspeed"));
	if (((gspeed < RANGE_MELEE) || (gspeed > AS_MELEE)))
	{
		gspeed = RANGE_MELEE;
	}
	st = infokey (world, "sentrytype");
	sgtype = stof (st);
	if (((sgtype > AS_MELEE) || (sgtype < RANGE_MELEE)))
	{
		sgtype = RANGE_MELEE;
	}
	st = infokey (world, "sentryspeed");
	sentry_speed = stof (st);
	if (((sentry_speed > 0.18) || (sentry_speed < 0.06)))
	{
		sentry_speed = 0.1;
	}
	st = infokey (world, "sentrydelay");
	sentry_delay = stof (st);
	if (((sentry_delay > SBAR_GRENS) || (sentry_delay < 0.1)))
	{
		sentry_delay = 0.25;
	}
	st = infokey (world, "sentryfire");
	sentry_fire = stof (st);
	if (((sentry_fire > SBAR_PRINT) || (sentry_fire < RANGE_MELEE)))
	{
		sentry_fire = RANGE_MELEE;
	}
	st = infokey (world, "pipedelay");
	if ((st == "off"))
	{
		pipedelay = RANGE_MELEE;
	}
	else
	{
		pipedelay = SBAR_GRENS;
	}
};

void () flash_update =
{
	if ((self.owner.deadflag != RANGE_MELEE))
	{
		self.effects = RANGE_MELEE;
	}
	else
	{
		self.effects = 8;
	}
	makevectors (self.owner.v_angle);
	traceline (self.owner.origin, (self.owner.origin + (v_forward * 500)), RANGE_MELEE, self);
	setorigin (self, (trace_endpos + (v_forward * -5)));
	self.nextthink = (time + 0.02);
};

void () flash_on =
{
	local entity myflash;

	myflash = spawn ();
	myflash.movetype = RANGE_MELEE;
	myflash.solid = RANGE_MELEE;
	setmodel (myflash, "progs/s_bubble.spr");
	setsize (myflash, '0 0 0', '0 0 0');
	myflash.owner = self;
	self.flash = myflash;
	myflash.classname = "flash";
	myflash.effects = 8;
	makevectors (self.v_angle);
	traceline (self.origin, (self.origin + (v_forward * 500)), RANGE_MELEE, self);
	setorigin (myflash, trace_endpos);
	myflash.think = flash_update;
	myflash.nextthink = (time + 0.02);
};

void () flash_toggle =
{
	if (!self.playerclass)
	{
		return;
	}
	if ((self.flash_flag == RANGE_MELEE))
	{
		self.flash_flag = SBAR_GRENS;
		flash_on ();
	}
	else
	{
		self.flash_flag = RANGE_MELEE;
		W_SetCurrentAmmo ();
		self.flash.think = SUB_Remove;
		self.flash.nextthink = (time + 0.1);
	}
};

void () fadetoblack =
{
	local float fade;
	local string x;

	fade = enter;
	while ((fade <= 250))
	{
		x = ftos (fade);
		stuffcmd (self, "v_cshift 0 0 0 ");
		stuffcmd (self, x);
		stuffcmd (self, ";wait\n");
		fade = (fade + enter);
	}
	stuffcmd (self, "v_cshift 0 0 0 255\n");
};

void () fadefromblack =
{
	local float fade;
	local string x;

	fade = 250;
	while ((fade >= RANGE_MELEE))
	{
		x = ftos (fade);
		stuffcmd (self, "v_cshift 0 0 0 ");
		stuffcmd (self, x);
		stuffcmd (self, ";wait\n");
		fade = (fade - enter);
	}
	stuffcmd (self, "v_cshift 0 0 0 0\n");
};

void () Flymode =
{
	local entity spot;

	self.tracking = RANGE_MELEE;
	self.gravity = SBAR_GRENS;
	spot = find (world, classname, "info_player_start");
	self.origin = spot.origin;
};

void () Toggle_Tracking =
{
	if (self.playerclass)
	{
		return;
	}
	if ((self.goalentity == world))
	{
		return;
	}
	if (!self.tracking)
	{
		self.tracking = SBAR_GRENS;
		self.gravity = RANGE_MELEE;
		sprint (self, SBAR_PRINT, "Tracking mode: 3rd Person.\n");
	}
	else
	{
		if ((((self.goalentity.classname == "player") || (self.goalentity.classname == "building_sentrygun")) && (self.tracking == SBAR_GRENS)))
		{
			self.tracking = SBAR_PRINT;
			sprint (self, SBAR_PRINT, "Tracking mode: 1st Person.\n");
		}
		else
		{
			Flymode ();
			sprint (self, SBAR_PRINT, "Tracking mode: Flymode.\n");
		}
	}
};

void (float amount) Pan_Out =
{
	self.camdist = (self.camdist + amount);
	if ((self.camdist > 500))
	{
		self.camdist = 500;
	}
};

void (float amount) Pan_In =
{
	self.camdist = (self.camdist - amount);
	if ((self.camdist < _2))
	{
		self.camdist = _2;
	}
};

void () Track_Object =
{
	local vector v1;
	local vector v2;
	local vector v3;
	local entity goal;

	if ((self.goalentity != world))
	{
		if ((self.goalentity.solid == RANGE_MELEE))
		{
			goal = self.goalentity.owner;
		}
		else
		{
			if (((self.goalentity.classname == "player") && (self.goalentity.health <= RANGE_MELEE)))
			{
				goal = self.goalentity.enemy;
			}
			else
			{
				goal = self.goalentity;
			}
		}
		if ((((goal.classname == "player") || (goal.classname == "building_sentrygun")) && (self.tracking == SBAR_PRINT)))
		{
			self.origin = (self.goalentity.origin + self.goalentity.view_ofs);
			if ((self.goalentity.classname == "player"))
			{
				self.angles_x = (self.goalentity.angles_x * -1);
				self.angles_y = self.goalentity.angles_y;
			}
			else
			{
				if ((self.goalentity.classname == "building_sentrygun"))
				{
					self.angles = self.goalentity.angles;
				}
			}
			self.fixangle = SBAR_GRENS;
			return;
		}
		else
		{
			if (self.tracking)
			{
				v1 = goal.origin;
				v2 = self.v_angle;
				makevectors (v2);
				v2 = (v_forward * self.camdist);
				traceline (v1, (v1 - v2), SBAR_GRENS, goal);
				v2 = (v2 * trace_fraction);
				v3 = (v1 - (v2 * 0.6));
				v2 = (v1 - v2);
				traceline (self.origin, v2, SBAR_GRENS, goal);
				if ((trace_fraction == SBAR_GRENS))
				{
					v1 = (v3 - self.origin);
					v1 = (v1 * enter);
					self.velocity = v1;
				}
				self.origin = v3;
			}
		}
		if ((goal.classname == "player"))
		{
			self.items = goal.items;
			self.armorvalue = goal.armorvalue;
			if ((goal.health <= RANGE_MELEE))
			{
				self.health = SBAR_GRENS;
			}
			else
			{
				self.health = goal.health;
			}
			self.weapon = goal.weapon;
			self.currentammo = goal.currentammo;
		}
		else
		{
			if ((goal.classname == "building_sentrygun"))
			{
				if ((goal.health <= RANGE_MELEE))
				{
					self.health = SBAR_GRENS;
				}
				else
				{
					self.health = goal.health;
				}
				self.weapon = goal.weapon;
				self.currentammo = goal.ammo_shells;
			}
			else
			{
				if ((goal.classname == "item_tfgoal"))
				{
					self.armorvalue = (goal.nextthink - time);
					self.health = SBAR_GRENS;
					self.currentammo = RANGE_MELEE;
				}
			}
		}
	}
};

void () Track_Tfgoal =
{
	self.goalentity = find (self.goalentity, classname, "item_tfgoal");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "item_tfgoal");
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.netname, ".\n");
	}
	else
	{
		CenterPrint (self, "No Flags in game to track.\n");
		Flymode ();
	}
};

void () Track_Player =
{
	local float endloop;

	self.goalentity = find (self.goalentity, classname, "player");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "player");
	}
	while (((self.goalentity != world) && !endloop))
	{
		if ((!self.goalentity.playerclass || self.goalentity.deadflag))
		{
			self.goalentity = find (self.goalentity, classname, "player");
		}
		else
		{
			endloop = SBAR_GRENS;
		}
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.netname, ".\n");
	}
	else
	{
		CenterPrint (self, "No Players in game to track.\n");
		Flymode ();
	}
};

void () Track_Sentry =
{
	self.goalentity = find (self.goalentity, classname, "building_sentrygun");
	if ((self.goalentity == world))
	{
		self.goalentity = find (self.goalentity, classname, "building_sentrygun");
	}
	if ((self.goalentity != world))
	{
		if (!self.tracking)
		{
			Toggle_Tracking ();
		}
		CenterPrint3 (self, "You are tracking: ", self.goalentity.owner.netname, "'s Sentry Gun.\n");
	}
	else
	{
		CenterPrint (self, "No Sentry Gun's in game to track.\n");
		Flymode ();
	}
};

void () Check_Track =
{
	if (self.tracking)
	{
		if ((self.goalentity != world))
		{
			Track_Object ();
		}
	}
};
void () player_run;
void () TeamFortress_DisplayDetectionItems;
float (vector veca, vector vecb) crossproduct;
void (vector org, float damage) SpawnBlood;
void (entity rhook) Reset_Grapple;
void () SuperDamageSound;
void () ConcussionGrenadeTimer;
void () W_PrintWeaponMessage;
void () button_touch;
void () button_fire;
void (entity pl, float fr, float type) TF_AddFrags;
void () DropGoalItems;
void () RemoveGrenade;
void () TeamFortress_DisplayLegalClasses;
void () TeamFortress_Inventory;
void () TeamFortress_SaveMe;
void () TeamFortress_ID;
void () TeamFortress_ShowTF;
void () TeamFortress_SniperWeapon;
void () TeamFortress_AssaultWeapon;
void () TeamFortress_IncendiaryCannon;
void () TeamFortress_FlameThrower;
void () TeamFortress_PrimeGrenade;
void () TeamFortress_ThrowGrenade;
void () TeamFortress_Discard;
void () TeamFortress_DetonatePipebombs;
void () TeamFortress_DetpackStop;
void () SniperSight_Create;
void (float zoom_level) TF_zoom;
void () TeamFortress_ReloadCurrentWeapon;
void () TeamFortress_AutoZoomToggle;
void () TeamFortress_StatusQuery;
void () TeamFortress_SpyGoUndercover;
void () TeamFortress_EngineerBuild;
void () DropKey;
void () Drop_detpack;
void (entity print) ShowFrags;
void () ShowFps;
void () ShowStats;
void () UseSpecialSkill;
void () RemoveFlare;
void () ScannerSwitch;
void () TeamFortress_Scan;
void (float timer) TeamFortress_SetDetpack;
void (float all) TeamFortress_TeamShowScores;
void (entity Player) TeamFortress_TeamShowMemberClasses;
void () Admin_CountPlayers;
void () Admin_CycleDeal;
void () Admin_DoKick;
void () Admin_CeaseFire;
void () Admin_ListIPs;
void () AbortElect;
void () VoteAdmin;
void () VoteYes;
void () VoteNo;
void (float t) TimeDown;
void (float t) TimeUp;
void (float t) PmTimeDown;
void (float t) PmTimeUp;
void (float t) CFTimeDown;
void (float t) CFTimeUp;
void (float t) OverTimeDown;
void (float t) OverTimeUp;
void () FragsDown;
void () FragsUp;
void () ChangeTP;
void () ClanMode;
void () RestartMap;
void () GroundSpeed;
void () StartTimer;
void () PlayerBreak;
void () Commands;
void () ToggleSpecTalk;
void () ToggleFreeze;
void () Toggle_TFvsDM;
void () Toggle_SpeedCap;
void () Toggle_Practice;
void () Toggle_TFStrike;
void () Toggle_Duel;
void () Toggle_Rounds;
void () ToggleFlash;
void () ShowVersion;
void () ResetSetup;
void () ClanSetup;
void () Toggle_Teamfrags;
void () Toggle_Fullts;
void () Toggle_Grapple;
void () TogglePointing;
void () ToggleEnemy;
void () ToggleFbskins;
void () Toggle_Frj;
void () Toggle_flag_emu;
void () Toggle_Grenpacks;
void () Toggle_Gibs;
void () Toggle_Highlander;
void () Toggle_SentryType;
void () Toggle_SentryFire;
void () Toggle_PipeDelay;
void () ModStatus;
void () Toggle_Detpack;
void (entity disp) Engineer_UseDispenser;
void (entity gun) Engineer_UseSentryGun;
void () TeamFortress_MOTD;
void () TeamFortress_HelpMap;
void () BioInfection_Decay;
void () BioInfection_MonsterDecay;
void () W_FireFlame;
void () W_FireIncendiaryCannon;
void () W_FireTranq;
void () W_FireRail;
void () HallucinationTimer;
void () TranquiliserTimer;
void () TeamFortress_CTF_FlagInfo;
void () TF_MovePlayer;
string (float tno) GetTeamName;

void () W_Precache =
{
	precache_sound ("weapons/r_exp3.wav");
	precache_sound ("weapons/rocket1i.wav");
	precache_sound ("weapons/sgun1.wav");
	precache_sound ("weapons/guncock.wav");
	precache_sound ("weapons/ric1.wav");
	precache_sound ("weapons/ric2.wav");
	precache_sound ("weapons/ric3.wav");
	precache_sound ("weapons/spike2.wav");
	precache_sound ("weapons/tink1.wav");
	precache_sound ("weapons/grenade.wav");
	precache_sound ("weapons/bounce.wav");
	precache_sound ("weapons/shotgn2.wav");
	precache_sound ("wizard/wattack.wav");
	precache_sound ("items/r_item1.wav");
	precache_sound ("items/r_item2.wav");
	precache_model ("progs/flame2.mdl");
	precache_sound ("ambience/fire1.wav");
	precache_sound2 ("blob/land1.wav");
	precache_model2 ("progs/v_spike.mdl");
	precache_sound ("hknight/hit.wav");
	precache_sound ("weapons/detpack.wav");
	precache_sound ("weapons/turrset.wav");
	precache_sound ("weapons/turrspot.wav");
	precache_sound ("weapons/turridle.wav");
	precache_sound ("weapons/sniper.wav");
	precache_sound ("weapons/flmfire2.wav");
	precache_sound ("weapons/flmgrexp.wav");
	precache_sound ("misc/vapeur2.wav");
	precache_sound ("weapons/asscan1.wav");
	precache_sound ("weapons/asscan2.wav");
	precache_sound ("weapons/asscan3.wav");
	precache_sound ("weapons/asscan4.wav");
	precache_sound ("weapons/railgun.wav");
	precache_sound ("weapons/dartgun.wav");
};

void (float att_delay) Attack_Finished =
{
	if ((self.tfstate & 32768))
	{
		self.attack_finished = (time + (att_delay * SBAR_PRINT));
	}
	else
	{
		self.attack_finished = (time + att_delay);
	}
};

void () W_FireAxe =
{
	local vector source;
	local vector org;
	local vector def;

	makevectors (self.v_angle);
	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), RANGE_MELEE, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return;
	}
	org = (trace_endpos - (v_forward * AS_MISSILE));
	if (trace_ent.takedamage)
	{
		trace_ent.axhitme = SBAR_GRENS;
		SpawnBlood (org, 20);
		if (((self.playerclass != 8) || (trace_ent.classname != "player")))
		{
			deathmsg = 17;
			TF_T_Damage (trace_ent, self, self, 20, SBAR_PRINT, RANGE_MELEE);
		}
		else
		{
			self.weaponmode = SBAR_GRENS;
			self.weaponmodel = "progs/v_knife2.mdl";
			makevectors (trace_ent.v_angle);
			def = v_right;
			makevectors (self.v_angle);
			if ((crossproduct (def, v_forward) > RANGE_MELEE))
			{
				deathmsg = SBAR_300;
				TF_T_Damage (trace_ent, self, self, _x, (SBAR_PRINT | SBAR_GRENS), RANGE_MELEE);
			}
			else
			{
				deathmsg = 17;
				TF_T_Damage (trace_ent, self, self, 40, SBAR_PRINT, RANGE_MELEE);
			}
		}
	}
	else
	{
		sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, SBAR_PRINT);
	}
};

void () W_FireSpanner =
{
	local vector source;
	local vector org;
	local vector def;
	local float healam;
	local entity te;

	makevectors (self.v_angle);
	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), RANGE_MELEE, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return;
	}
	org = (trace_endpos - (v_forward * AS_MISSILE));
	if ((trace_ent.goal_activation & 8))
	{
		if (Activated (trace_ent, self))
		{
			DoResults (trace_ent, self, SBAR_GRENS);
			if ((trace_ent.classname == "func_button"))
			{
				trace_ent.enemy = self;
				other = self;
				self = trace_ent;
				self.dont_do_triggerwork = SBAR_GRENS;
				button_fire ();
				self = other;
			}
		}
		else
		{
			if ((trace_ent.else_goal != RANGE_MELEE))
			{
				te = Findgoal (trace_ent.else_goal);
				if (te)
				{
					AttemptToActivate (te, self, trace_ent);
				}
			}
			else
			{
				sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
				WriteByte (AS_MISSILE, 23);
				WriteByte (AS_MISSILE, SBAR_PRINT);
				WriteByte (AS_MISSILE, AS_MELEE);
				WriteCoord (AS_MISSILE, org_x);
				WriteCoord (AS_MISSILE, org_y);
				WriteCoord (AS_MISSILE, org_z);
				multicast (org, SBAR_PRINT);
			}
		}
		return;
	}
	if (trace_ent.takedamage)
	{
		if ((trace_ent.classname == "building_dispenser"))
		{
			Engineer_UseDispenser (trace_ent);
			return;
		}
		else
		{
			if ((trace_ent.classname == "building_sentrygun"))
			{
				Engineer_UseSentryGun (trace_ent);
				return;
			}
			else
			{
				if ((trace_ent.classname == "building_sentrygun_base"))
				{
					if (trace_ent.oldenemy)
					{
						Engineer_UseSentryGun (trace_ent.oldenemy);
					}
					return;
				}
				else
				{
					if ((trace_ent.classname == "player"))
					{
						if (((((trace_ent.team_no == self.team_no) && (self.team_no != RANGE_MELEE)) && teamplay) || coop))
						{
							healam = enter;
							if ((self.ammo_cells < healam))
							{
								healam = self.ammo_cells;
							}
							if ((trace_ent.armortype == RANGE_MELEE))
							{
								return;
							}
							if (((trace_ent.maxarmor - trace_ent.armorvalue) < (healam * AS_MISSILE)))
							{
								healam = ceil (((trace_ent.maxarmor - trace_ent.armorvalue) / AS_MISSILE));
							}
							if ((healam > RANGE_MELEE))
							{
								trace_ent.armorvalue = (trace_ent.armorvalue + (healam * AS_MISSILE));
								if ((trace_ent.armorvalue > trace_ent.maxarmor))
								{
									trace_ent.armorvalue = trace_ent.maxarmor;
								}
								self.ammo_cells = (self.ammo_cells - healam);
								sound (trace_ent, SBAR_GRENS, "items/r_item1.wav", SBAR_GRENS, SBAR_GRENS);
								WriteByte (AS_MISSILE, 23);
								WriteByte (AS_MISSILE, SBAR_PRINT);
								WriteByte (AS_MISSILE, AS_MELEE);
								WriteCoord (AS_MISSILE, org_x);
								WriteCoord (AS_MISSILE, org_y);
								WriteCoord (AS_MISSILE, org_z);
								multicast (org, SBAR_PRINT);
								W_SetCurrentAmmo ();
							}
							return;
						}
					}
					trace_ent.axhitme = SBAR_GRENS;
					SpawnBlood (org, 20);
					deathmsg = space;
					TF_T_Damage (trace_ent, self, self, 20, SBAR_PRINT, RANGE_MELEE);
				}
			}
		}
	}
	else
	{
		sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, SBAR_PRINT);
	}
};

void () W_FireMedikit =
{
	local vector source;
	local vector org;
	local float healam;
	local entity te;
	local entity BioInfection;

	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), RANGE_MELEE, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return;
	}
	org = (trace_endpos - (v_forward * AS_MISSILE));
	if (trace_ent.takedamage)
	{
		if ((trace_ent.classname == "player"))
		{
			if ((((trace_ent.team_no == self.team_no) && (self.team_no != RANGE_MELEE)) || coop))
			{
				healam = 200;
				te = find (world, classname, "timer");
				while ((((te.owner != trace_ent) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
				{
					te = find (te, classname, "timer");
				}
				if ((te != world))
				{
					SpawnBlood (org, 20);
					bprint (SBAR_GRENS, self.netname);
					bprint (SBAR_GRENS, " cured ");
					bprint (SBAR_GRENS, trace_ent.netname);
					bprint (SBAR_GRENS, "'s concussion\n");
					if ((te.team_no != self.team_no))
					{
						TF_AddFrags (self, SBAR_GRENS, RANGE_MELEE);
					}
					dremove (te);
				}
				if ((trace_ent.tfstate & 16384))
				{
					te = find (world, classname, "timer");
					while ((((te.owner != trace_ent) || (te.think != HallucinationTimer)) && (te != world)))
					{
						te = find (te, classname, "timer");
					}
					if ((te != world))
					{
						trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & 16384));
						SpawnBlood (org, 20);
						bprint (SBAR_GRENS, self.netname);
						bprint (SBAR_GRENS, " healed ");
						bprint (SBAR_GRENS, trace_ent.netname);
						bprint (SBAR_GRENS, " of his hallucinations\n");
						if ((te.team_no != self.team_no))
						{
							TF_AddFrags (self, SBAR_GRENS, RANGE_MELEE);
						}
						dremove (te);
					}
					else
					{
						dprint ("Warning: Error in Hallucination Timer logic.\n");
					}
				}
				if ((trace_ent.tfstate & 32768))
				{
					te = find (world, classname, "timer");
					while ((((te.owner != trace_ent) || (te.think != TranquiliserTimer)) && (te != world)))
					{
						te = find (te, classname, "timer");
					}
					if ((te != world))
					{
						trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & 32768));
						TeamFortress_SetSpeed (trace_ent);
						SpawnBlood (org, 20);
						bprint (SBAR_GRENS, self.netname);
						bprint (SBAR_GRENS, " healed ");
						bprint (SBAR_GRENS, trace_ent.netname);
						bprint (SBAR_GRENS, "'s tranquilisation\n");
						if ((te.team_no != self.team_no))
						{
							TF_AddFrags (self, SBAR_GRENS, RANGE_MELEE);
						}
						dremove (te);
					}
					else
					{
						dprint ("Warning: Error in Tranquilisation Timer logic.\n");
					}
				}
				if ((trace_ent.tfstate & SBAR_240))
				{
					healam = rint ((trace_ent.health / SBAR_PRINT));
					trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & SBAR_240));
					deathmsg = 23;
					T_Damage (trace_ent, self, self, healam);
					SpawnBlood (org, 30);
					if ((self.classname == "player"))
					{
						bprint (SBAR_GRENS, self.netname);
						bprint (SBAR_GRENS, " cured ");
						bprint (SBAR_GRENS, trace_ent.netname);
						bprint (SBAR_GRENS, "'s infection\n");
						if ((trace_ent.infection_team_no != self.team_no))
						{
							TF_AddFrags (self, SBAR_GRENS, RANGE_MELEE);
						}
					}
					return;
				}
				if ((trace_ent.numflames > RANGE_MELEE))
				{
					sound (trace_ent, SBAR_GRENS, "items/r_item1.wav", SBAR_GRENS, SBAR_GRENS);
					trace_ent.numflames = RANGE_MELEE;
					if ((self.classname == "player"))
					{
						bprint (SBAR_GRENS, self.netname);
						bprint (SBAR_GRENS, " put out ");
						bprint (SBAR_GRENS, trace_ent.netname);
						bprint (SBAR_GRENS, "'s fire.\n");
					}
					return;
				}
				if (((healam > RANGE_MELEE) && (trace_ent.health < trace_ent.max_health)))
				{
					sound (trace_ent, SBAR_GRENS, "items/r_item1.wav", SBAR_GRENS, SBAR_GRENS);
					trace_ent.axhitme = SBAR_GRENS;
					SpawnBlood (org, 20);
					T_Heal (trace_ent, healam, RANGE_MELEE);
				}
				else
				{
					if (((trace_ent.health >= trace_ent.max_health) && (trace_ent.health < (trace_ent.max_health + _2))))
					{
						healam = 5;
						if ((healam > (self.ammo_medikit * 5)))
						{
							healam = (self.ammo_medikit * 5);
						}
						if ((healam > RANGE_MELEE))
						{
							sound (trace_ent, AS_MELEE, "items/r_item2.wav", SBAR_GRENS, SBAR_GRENS);
							T_Heal (trace_ent, healam, SBAR_GRENS);
							self.ammo_medikit = (self.ammo_medikit - rint ((healam / 5)));
							if (!(trace_ent.items & 65536))
							{
								trace_ent.items = (trace_ent.items | 65536);
								newmis = spawn ();
								newmis.nextthink = (time + 5);
								newmis.think = item_megahealth_rot;
								newmis.owner = trace_ent;
							}
						}
					}
				}
			}
			else
			{
				trace_ent.axhitme = SBAR_GRENS;
				SpawnBlood (org, 20);
				deathmsg = 14;
				T_Damage (trace_ent, self, self, enter);
				if ((trace_ent.playerclass == 5))
				{
					return;
				}
				if (cb_prematch)
				{
					return;
				}
				if ((trace_ent.tfstate & SBAR_240))
				{
					return;
				}
				trace_ent.tfstate = (trace_ent.tfstate | SBAR_240);
				BioInfection = spawn ();
				BioInfection.classname = "timer";
				BioInfection.owner = trace_ent;
				BioInfection.nextthink = (time + SBAR_PRINT);
				BioInfection.think = BioInfection_Decay;
				BioInfection.enemy = self;
				trace_ent.infection_team_no = self.team_no;
			}
		}
	}
	else
	{
		sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, SBAR_PRINT);
	}
};

void () W_FireBioweapon =
{
	local vector source;
	local vector org;
	local float healam;
	local entity BioInfection;

	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), RANGE_MELEE, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		return;
	}
	org = (trace_endpos - (v_forward * AS_MISSILE));
	if (trace_ent.takedamage)
	{
		if ((trace_ent.classname == "player"))
		{
			if (((((trace_ent.team_no != self.team_no) && (self.team_no != RANGE_MELEE)) && teamplay) || (teamplay == RANGE_MELEE)))
			{
				trace_ent.axhitme = SBAR_GRENS;
				SpawnBlood (org, 20);
				deathmsg = 14;
				T_Damage (trace_ent, self, self, enter);
				if ((trace_ent.playerclass == 5))
				{
					return;
				}
				if (cb_prematch)
				{
					return;
				}
				trace_ent.tfstate = (trace_ent.tfstate | SBAR_240);
				BioInfection = spawn ();
				BioInfection.classname = "timer";
				BioInfection.owner = trace_ent;
				BioInfection.nextthink = (time + SBAR_PRINT);
				BioInfection.think = BioInfection_Decay;
				BioInfection.enemy = self;
				trace_ent.infection_team_no = self.team_no;
			}
		}
		else
		{
			if ((trace_ent.flags & space))
			{
				trace_ent.axhitme = SBAR_GRENS;
				SpawnBlood (org, 20);
				T_Damage (trace_ent, self, self, enter);
				BioInfection = spawn ();
				BioInfection.classname = "timer";
				BioInfection.nextthink = (time + SBAR_PRINT);
				BioInfection.think = BioInfection_MonsterDecay;
				BioInfection.owner = self;
				BioInfection.enemy = trace_ent;
			}
			else
			{
				trace_ent.axhitme = SBAR_GRENS;
				SpawnBlood (org, 30);
				T_Damage (trace_ent, self, self, 40);
			}
		}
	}
	else
	{
		sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, SBAR_PRINT);
	}
};

vector () wall_velocity =
{
	local vector vel;

	vel = normalize (self.velocity);
	vel = normalize (((vel + (v_up * (random () - 0.5))) + (v_right * (random () - 0.5))));
	vel = (vel + (SBAR_PRINT * trace_plane_normal));
	vel = (vel * 200);
	return (vel);
};

void (vector org, vector vel) SpawnMeatSpray =
{
	local entity missile;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = enter;
	missile.solid = RANGE_MELEE;
	makevectors (self.angles);
	missile.velocity = vel;
	missile.velocity_z = ((missile.velocity_z + 250) + (_2 * random ()));
	missile.avelocity = '3000 1000 2000';
	missile.nextthink = (time + SBAR_GRENS);
	missile.think = SUB_Remove;
	setmodel (missile, "progs/zom_gib.mdl");
	setsize (missile, '0 0 0', '0 0 0');
	setorigin (missile, org);
};

void (vector org, float damage) SpawnBlood =
{
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, 12);
	WriteByte (AS_MISSILE, SBAR_GRENS);
	WriteCoord (AS_MISSILE, org_x);
	WriteCoord (AS_MISSILE, org_y);
	WriteCoord (AS_MISSILE, org_z);
	multicast (org, SBAR_PRINT);
};

void (float damage) spawn_touchblood =
{
	local vector vel;

	vel = (wall_velocity () * 0.2);
	SpawnBlood ((self.origin + (vel * 0.01)), damage);
};

void (vector org, vector vel) SpawnChunk =
{
	particle (org, (vel * 0.02), RANGE_MELEE, enter);
};
entity multi_ent;
float multi_damage;
vector blood_org;
float blood_count;
vector puff_org;
float puff_count;

void () ClearMultiDamage =
{
	multi_ent = world;
	multi_damage = RANGE_MELEE;
	blood_count = RANGE_MELEE;
	puff_count = RANGE_MELEE;
};

void () ApplyMultiDamage =
{
	if (!multi_ent)
	{
		return;
	}
	TF_T_Damage (multi_ent, self, self, multi_damage, SBAR_PRINT, SBAR_GRENS);
};

void (entity hit, float damage) AddMultiDamage =
{
	if (!hit)
	{
		return;
	}
	if ((hit != multi_ent))
	{
		ApplyMultiDamage ();
		multi_damage = damage;
		multi_ent = hit;
	}
	else
	{
		multi_damage = (multi_damage + damage);
	}
};

void () Multi_Finish =
{
	if (puff_count)
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, puff_count);
		WriteCoord (AS_MISSILE, puff_org_x);
		WriteCoord (AS_MISSILE, puff_org_y);
		WriteCoord (AS_MISSILE, puff_org_z);
		multicast (puff_org, SBAR_PRINT);
	}
	if (blood_count)
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, 12);
		WriteByte (AS_MISSILE, blood_count);
		WriteCoord (AS_MISSILE, blood_org_x);
		WriteCoord (AS_MISSILE, blood_org_y);
		WriteCoord (AS_MISSILE, blood_org_z);
		multicast (puff_org, SBAR_PRINT);
	}
};

void (float damage, vector dir) TraceAttack =
{
	local vector vel;
	local vector org;

	vel = normalize (((dir + (v_up * crandom ())) + (v_right * crandom ())));
	vel = (vel + (SBAR_PRINT * trace_plane_normal));
	vel = (vel * 200);
	org = (trace_endpos - (dir * AS_MISSILE));
	if (trace_ent.takedamage)
	{
		blood_count = (blood_count + SBAR_GRENS);
		blood_org = org;
		AddMultiDamage (trace_ent, damage);
	}
	else
	{
		puff_count = (puff_count + SBAR_GRENS);
	}
};

void (float shotcount, vector dir, vector spread) FireBullets =
{
	local vector direction;
	local vector src;

	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	ClearMultiDamage ();
	traceline (src, (src + (dir * 2048)), RANGE_MELEE, self);
	puff_org = (trace_endpos - (dir * AS_MISSILE));
	while ((shotcount > RANGE_MELEE))
	{
		direction = ((dir + ((crandom () * spread_x) * v_right)) + ((crandom () * spread_y) * v_up));
		traceline (src, (src + (direction * 2048)), RANGE_MELEE, self);
		if ((trace_fraction != SBAR_GRENS))
		{
			if ((self.current_weapon != 32768))
			{
				TraceAttack (AS_MISSILE, direction);
			}
			else
			{
				TraceAttack (5, direction);
			}
		}
		shotcount = (shotcount - SBAR_GRENS);
		if ((self.current_weapon == 32768))
		{
			puff_org = (trace_endpos + direction);
			Multi_Finish ();
		}
	}
	ApplyMultiDamage ();
	if ((self.current_weapon != 32768))
	{
		Multi_Finish ();
	}
};

void () W_FireShotgun =
{
	local vector dir;

	sound (self, SBAR_GRENS, "weapons/guncock.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = SBAR_GRENS;
	FireBullets (6, dir, '0.04 0.04 0');
};

void () W_FireSuperShotgun =
{
	local vector dir;

	if ((self.currentammo == SBAR_GRENS))
	{
		W_FireShotgun ();
		return;
	}
	sound (self, SBAR_GRENS, "weapons/shotgn2.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-4, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_PRINT);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = SBAR_PRINT;
	FireBullets (14, dir, '0.14 0.08 0');
};

void (vector direction, float damage) FireSniperBullet =
{
	local vector src;

	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	ClearMultiDamage ();
	traceline (src, (src + (direction * 4096)), RANGE_MELEE, self);
	if ((trace_fraction != SBAR_GRENS))
	{
		TraceAttack (damage, direction);
	}
	ApplyMultiDamage ();
};

void () W_FireSniperRifle =
{
	local vector dir;
	local vector src;
	local float dam_mult;
	local float zdif;
	local float use_this;
	local float x;
	local vector f;
	local vector g;
	local vector h;

	sound (self, SBAR_GRENS, "weapons/sniper.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
		self.currentammo = self.ammo_shells;
	}
	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	use_this = RANGE_MELEE;
	traceline (src, (src + (dir * 8092)), RANGE_MELEE, self);
	if ((trace_fraction != SBAR_GRENS))
	{
		if ((trace_ent != world))
		{
			if ((trace_ent.classname == "player"))
			{
				use_this = SBAR_GRENS;
			}
		}
	}
	KickPlayer (-4, self);
	if (!use_this)
	{
		dir = aim (self, 10000);
		traceline (src, (src + (dir * 3072)), RANGE_MELEE, self);
	}
	deathmsg = COLOR_GREEN;
	dam_mult = 0.8;
	if (trace_ent)
	{
		if ((trace_ent.classname == "player"))
		{
			f = (trace_endpos - src);
			g_x = trace_endpos_x;
			g_y = trace_endpos_y;
			g_z = RANGE_MELEE;
			h_x = trace_ent.origin_x;
			h_y = trace_ent.origin_y;
			h_z = RANGE_MELEE;
			x = vlen ((g - h));
			f = ((normalize (f) * x) + trace_endpos);
			zdif = (f_z - trace_ent.origin_z);
			deathmsg = COLOR_GREEN;
			trace_ent.head_shot_vector = '0 0 0';
			if ((zdif < RANGE_MELEE))
			{
				dam_mult = 0.4;
				trace_ent.leg_damage = (trace_ent.leg_damage + SBAR_GRENS);
				TeamFortress_SetSpeed (trace_ent);
				deathmsg = 28;
				TF_T_Damage (trace_ent, self, self, (self.heat * dam_mult), SBAR_PRINT, SBAR_GRENS);
				if ((trace_ent.health > RANGE_MELEE))
				{
					sprint (trace_ent, RANGE_MELEE, "Leg injury!\n");
					sprint (self, SBAR_GRENS, "Leg shot - that'll slow him down!\n");
				}
				return;
			}
			else
			{
				if ((zdif > 20))
				{
					dam_mult = 1.2;
					stuffcmd (trace_ent, "bf\n");
					trace_ent.head_shot_vector = (trace_ent.origin - self.origin);
					deathmsg = 29;
					TF_T_Damage (trace_ent, self, self, (self.heat * dam_mult), SBAR_PRINT, SBAR_GRENS);
					if ((trace_ent.health > RANGE_MELEE))
					{
						sprint (trace_ent, RANGE_MELEE, "Head injury!\n");
						sprint (self, SBAR_GRENS, "Head shot - that's gotta hurt!\n");
					}
					return;
				}
				else
				{
					deathmsg = COLOR_GREEN;
				}
			}
		}
	}
	ClearMultiDamage ();
	if ((trace_fraction != SBAR_GRENS))
	{
		TraceAttack ((self.heat * dam_mult), dir);
	}
	ApplyMultiDamage ();
};

void () W_FireAutoRifle =
{
	local vector dir;

	sound (self, SBAR_GRENS, "weapons/sniper.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-1, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
		self.currentammo = self.ammo_shells;
	}
	makevectors (self.v_angle);
	dir = v_forward;
	deathmsg = 19;
	FireSniperBullet (dir, 8);
};

void () W_FireAssaultCannon =
{
	local vector dir;

	KickPlayer (-4, self);
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
		self.currentammo = self.ammo_shells;
	}
	dir = aim (self, 100000);
	deathmsg = 20;
	if ((self.velocity == '0 0 0'))
	{
		FireBullets (4.5, dir, '0.05 0.05 0');
	}
	else
	{
		FireBullets (AS_MISSILE, dir, '0.1 0.1 0');
	}
};

void () s_explode1 = [ 0, s_explode2 ]
{
};

void () s_explode2 = [ 1, s_explode3 ]
{
};

void () s_explode3 = [ 2, s_explode4 ]
{
};

void () s_explode4 = [ 3, s_explode5 ]
{
};

void () s_explode5 = [ 4, s_explode6 ]
{
};

void () s_explode6 = [ 5, SUB_Remove ]
{
};

void () MissileRadius =
{
	local float damg;

	if ((self.owner.classname == "building_sentrygun"))
	{
		damg = 150;
	}
	else
	{
		if ((self.playerclass == SBAR_200))
		{
			damg = _x;
		}
		else
		{
			damg = 92;
		}
	}
	deathmsg = self.weapon;
	T_RadiusDamage (self, self.owner, damg, other);
	self.origin = (self.origin - (8 * normalize (self.velocity)));
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () T_MissileTouch =
{
	local float damg;

	if (self.voided)
	{
		return;
	}
	self.voided = SBAR_GRENS;
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if ((self.playerclass == SBAR_200))
	{
		damg = (_d + (random () * 20));
	}
	else
	{
		damg = (92 + (random () * 20));
	}
	deathmsg = self.weapon;
	if (other.health)
	{
		TF_T_Damage (other, self, self.owner, damg, SBAR_PRINT, RANGE_MELEE);
	}
	MissileRadius ();
};

void () W_FireRocket =
{
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - SBAR_GRENS);
		self.currentammo = self.ammo_rockets;
	}
	sound (self, SBAR_GRENS, "weapons/sgun1.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	makevectors (self.v_angle);
	newmis.velocity = v_forward;
	if ((self.playerclass == SBAR_200))
	{
		newmis.velocity = (newmis.velocity * 1000);
	}
	else
	{
		newmis.velocity = (newmis.velocity * 900);
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.classname = "rocket";
	newmis.touch = T_MissileTouch;
	newmis.voided = RANGE_MELEE;
	newmis.nextthink = (time + 5);
	newmis.think = MissileRadius;
	newmis.weapon = 6;
	setmodel (newmis, "progs/missile.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void (entity from, float damage) LightningHit =
{
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, 13);
	WriteCoord (AS_MISSILE, trace_endpos_x);
	WriteCoord (AS_MISSILE, trace_endpos_y);
	WriteCoord (AS_MISSILE, trace_endpos_z);
	multicast (trace_endpos, SBAR_PRINT);
	deathmsg = 7;
	TF_T_Damage (trace_ent, from, from, damage, SBAR_PRINT, 8);
};

void (vector p1, vector p2, entity from, float damage) LightningDamage =
{
	local entity e1;
	local entity e2;
	local vector f;

	f = (p2 - p1);
	normalize (f);
	f_x = (RANGE_MELEE - f_y);
	f_y = f_x;
	f_z = RANGE_MELEE;
	f = (f * SBAR_240);
	e2 = world;
	e1 = world;
	traceline (p1, p2, RANGE_MELEE, self);
	if (trace_ent.takedamage)
	{
		LightningHit (from, damage);
		if ((self.classname == "player"))
		{
			if ((other.classname == "player"))
			{
				trace_ent.velocity_z = (trace_ent.velocity_z + 400);
			}
		}
	}
	e1 = trace_ent;
	traceline ((p1 + f), (p2 + f), RANGE_MELEE, self);
	if (((trace_ent != e1) && trace_ent.takedamage))
	{
		LightningHit (from, damage);
	}
	e2 = trace_ent;
	traceline ((p1 - f), (p2 - f), RANGE_MELEE, self);
	if ((((trace_ent != e1) && (trace_ent != e2)) && trace_ent.takedamage))
	{
		LightningHit (from, damage);
	}
};

void () W_FireLightning =
{
	local vector org;
	local float cells;

	if ((self.ammo_cells < SBAR_GRENS))
	{
		self.last_weapon = self.current_weapon;
		self.last_weaponmode = self.weaponmode;
		self.current_weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
		W_PrintWeaponMessage ();
		return;
	}
	if ((self.waterlevel > SBAR_GRENS))
	{
		cells = self.ammo_cells;
		self.ammo_cells = RANGE_MELEE;
		W_SetCurrentAmmo ();
		deathmsg = 7;
		T_RadiusDamage (self, self, (SBAR_400 * cells), world);
		return;
	}
	if ((self.t_width < time))
	{
		sound (self, SBAR_GRENS, "weapons/lhit.wav", SBAR_GRENS, SBAR_GRENS);
		self.t_width = (time + 0.6);
	}
	KickPlayer (-2, self);
	if (!practice)
	{
		self.ammo_cells = (self.ammo_cells - SBAR_GRENS);
		self.currentammo = self.ammo_cells;
	}
	org = (self.origin + '0 0 16');
	traceline (org, (org + (v_forward * 600)), SBAR_GRENS, self);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, 6);
	WriteEntity (AS_MISSILE, self);
	WriteCoord (AS_MISSILE, org_x);
	WriteCoord (AS_MISSILE, org_y);
	WriteCoord (AS_MISSILE, org_z);
	WriteCoord (AS_MISSILE, trace_endpos_x);
	WriteCoord (AS_MISSILE, trace_endpos_y);
	WriteCoord (AS_MISSILE, trace_endpos_z);
	multicast (org, SBAR_GRENS);
	LightningDamage (self.origin, (trace_endpos + (v_forward * AS_MISSILE)), self, 30);
};

float (float tno) num_team_pipebombs =
{
	if ((tno == SBAR_GRENS))
	{
		return (num_team_pipebombs_1);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			return (num_team_pipebombs_2);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				return (num_team_pipebombs_3);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					return (num_team_pipebombs_4);
				}
			}
		}
	}
	return (RANGE_MELEE);
};

float (float tno) num_team_flares =
{
	if ((tno == SBAR_GRENS))
	{
		return (num_team_flares_1);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			return (num_team_flares_2);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				return (num_team_flares_3);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					return (num_team_flares_4);
				}
			}
		}
	}
	return (RANGE_MELEE);
};

void (float tno) RemoveOldFlare =
{
	local entity old;
	local float index;

	if ((tno != RANGE_MELEE))
	{
		index = num_team_flares (tno);
		index = (index - (num_max_flares / number_of_teams));
	}
	else
	{
		index = (num_world_flares - num_max_flares);
	}
	old = find (world, mdl, "flare");
	while ((index > RANGE_MELEE))
	{
		if ((old == world))
		{
			num_world_flares = RANGE_MELEE;
			num_team_flares_1 = RANGE_MELEE;
			num_team_flares_2 = RANGE_MELEE;
			num_team_flares_3 = RANGE_MELEE;
			num_team_flares_4 = RANGE_MELEE;
			return;
		}
		if (((old.weapon == tno) || (tno == RANGE_MELEE)))
		{
			old.think = RemoveFlare;
			old.nextthink = (time + 0.1);
			index = (index - SBAR_GRENS);
		}
		old = find (old, mdl, "flare");
	}
};

void (float tno) ExplodeOldPipebomb =
{
	local entity old;
	local float index;

	if ((tno != RANGE_MELEE))
	{
		index = num_team_pipebombs (tno);
		index = (index - (num_max_pipebombs / number_of_teams));
	}
	else
	{
		index = (num_world_pipebombs - num_max_pipebombs);
	}
	old = find (world, classname, "pipebomb");
	while ((index > RANGE_MELEE))
	{
		if ((old == world))
		{
			num_world_pipebombs = RANGE_MELEE;
			num_team_pipebombs_1 = RANGE_MELEE;
			num_team_pipebombs_2 = RANGE_MELEE;
			num_team_pipebombs_3 = RANGE_MELEE;
			num_team_pipebombs_4 = RANGE_MELEE;
			return;
		}
		if (((old.owner.team_no == tno) || (tno == RANGE_MELEE)))
		{
			old.nextthink = (time + 0.5);
			index = (index - SBAR_GRENS);
		}
		old = find (old, classname, "pipebomb");
	}
};

void (float tno) increment_team_pipebombs =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_pipebombs_1 = (num_team_pipebombs_1 + SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_pipebombs_2 = (num_team_pipebombs_2 + SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_pipebombs_3 = (num_team_pipebombs_3 + SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_pipebombs_4 = (num_team_pipebombs_4 + SBAR_GRENS);
				}
			}
		}
	}
};

void (float tno) decrement_team_pipebombs =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_pipebombs_1 = (num_team_pipebombs_1 - SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_pipebombs_2 = (num_team_pipebombs_2 - SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_pipebombs_3 = (num_team_pipebombs_3 - SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_pipebombs_4 = (num_team_pipebombs_4 - SBAR_GRENS);
				}
			}
		}
	}
};

void (float tno) increment_team_flares =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_flares_1 = (num_team_flares_1 + SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_flares_2 = (num_team_flares_2 + SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_flares_3 = (num_team_flares_3 + SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_flares_4 = (num_team_flares_4 + SBAR_GRENS);
				}
			}
		}
	}
};

void (float tno) decrement_team_flares =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_flares_1 = (num_team_flares_1 - SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_flares_2 = (num_team_flares_2 - SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_flares_3 = (num_team_flares_3 - SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_flares_4 = (num_team_flares_4 - SBAR_GRENS);
				}
			}
		}
	}
};

void () GrenadeExplode =
{
	local entity te;

	if (self.voided)
	{
		return;
	}
	self.voided = SBAR_GRENS;
	if ((self.classname == "pipebomb"))
	{
		num_world_pipebombs = (num_world_pipebombs - SBAR_GRENS);
		decrement_team_pipebombs (self.team_no);
		if (!(self.flags & 512))
		{
			self.weapon = 40;
		}
	}
	if ((self.owner.has_disconnected != SBAR_GRENS))
	{
		deathmsg = self.weapon;
		T_RadiusDamage (self, self.owner, _x, world);
	}
	if ((self.no_active_nail_grens != RANGE_MELEE))
	{
		self.no_active_nail_grens = RANGE_MELEE;
		self.owner.no_active_nail_grens = (self.owner.no_active_nail_grens - SBAR_GRENS);
		te = find (world, classname, "grenade");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_nail_grens > RANGE_MELEE)))
			{
				te.no_active_nail_grens = (te.no_active_nail_grens - SBAR_GRENS);
			}
			te = find (te, classname, "grenade");
		}
	}
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () PipebombTouch =
{
	if ((other.classname != "worldspawn"))
	{
		return;
	}
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () GrenadeTouch =
{
	if ((other == self.owner))
	{
		return;
	}
	if ((other.takedamage == SBAR_PRINT))
	{
		GrenadeExplode ();
		return;
	}
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () W_FireGrenade =
{
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - SBAR_GRENS);
		self.currentammo = self.ammo_rockets;
	}
	sound (self, SBAR_GRENS, "weapons/grenade.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.voided = RANGE_MELEE;
	newmis.owner = self;
	newmis.movetype = enter;
	newmis.solid = SBAR_PRINT;
	if (((self.weaponmode == RANGE_MELEE) || cb_prematch))
	{
		newmis.weapon = 5;
		newmis.classname = "grenade";
		newmis.skin = SBAR_GRENS;
		newmis.touch = GrenadeTouch;
		newmis.nextthink = (time + 2.5);
	}
	else
	{
		if ((self.team_no != RANGE_MELEE))
		{
			increment_team_pipebombs (self.team_no);
			if ((num_team_pipebombs (self.team_no) > (num_max_pipebombs / number_of_teams)))
			{
				ExplodeOldPipebomb (self.team_no);
			}
		}
		else
		{
			num_world_pipebombs = (num_world_pipebombs + SBAR_GRENS);
			if ((num_world_pipebombs > num_max_pipebombs))
			{
				ExplodeOldPipebomb (RANGE_MELEE);
			}
		}
		newmis.classname = "pipebomb";
		newmis.touch = PipebombTouch;
		newmis.skin = SBAR_PRINT;
		newmis.nextthink = (time + _x);
		newmis.weapon = SBAR_200;
		newmis.team_no = self.team_no;
	}
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((((v_forward * 600) + (v_up * 200)) + ((crandom () * v_right) * enter)) + ((crandom () * v_up) * enter));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 600);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '300 300 300';
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = GrenadeExplode;
	setmodel (newmis, "progs/grenade2.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
};
void () spike_touch;
void () superspike_touch;

void (vector org, vector dir) launch_spike =
{
	newmis = spawn ();
	newmis.voided = RANGE_MELEE;
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	newmis.angles = vectoangles (dir);
	newmis.touch = spike_touch;
	newmis.weapon = AS_MELEE;
	newmis.classname = "spike";
	newmis.think = SUB_Remove;
	newmis.nextthink = (time + AS_MELEE);
	setmodel (newmis, "progs/spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
	newmis.velocity = (dir * 1000);
};

void () W_FireSuperSpikes =
{
	local vector dir;
	local entity old;

	sound (self, SBAR_GRENS, "weapons/spike2.wav", SBAR_GRENS, SBAR_GRENS);
	if (!practice)
	{
		self.ammo_nails = (self.ammo_nails - AS_MISSILE);
		self.currentammo = self.ammo_nails;
	}
	dir = aim (self, 1000);
	launch_spike ((self.origin + '0 0 16'), dir);
	newmis.touch = superspike_touch;
	newmis.weapon = AS_MISSILE;
	setmodel (newmis, "progs/s_spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	KickPlayer (-2, self);
};

void (float ox) W_FireSpikes =
{
	local vector dir;
	local entity old;

	makevectors (self.v_angle);
	if (((self.ammo_nails >= AS_MISSILE) && (self.current_weapon == 1024)))
	{
		W_FireSuperSpikes ();
		return;
	}
	if ((self.ammo_nails < SBAR_GRENS))
	{
		self.last_weapon = self.current_weapon;
		self.last_weaponmode = self.weaponmode;
		self.current_weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
		W_PrintWeaponMessage ();
		return;
	}
	sound (self, SBAR_GRENS, "weapons/rocket1i.wav", SBAR_GRENS, SBAR_GRENS);
	if (!practice)
	{
		if ((self.ammo_nails == SBAR_GRENS))
		{
			self.ammo_nails = (self.ammo_nails - SBAR_GRENS);
			self.currentammo = self.ammo_nails;
		}
		else
		{
			self.ammo_nails = (self.ammo_nails - SBAR_PRINT);
			self.currentammo = self.ammo_nails;
		}
	}
	dir = aim (self, 1000);
	launch_spike (((self.origin + '0 0 16') + (v_right * ox)), dir);
	KickPlayer (-2, self);
};
.float hit_z;

void () spike_touch =
{
	if (self.voided)
	{
		return;
	}
	self.voided = SBAR_GRENS;
	if ((other.solid == SBAR_GRENS))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if (other.takedamage)
	{
		spawn_touchblood (9);
		deathmsg = self.weapon;
		if ((self.owner.classname == "grenade"))
		{
			TF_T_Damage (other, self, self.owner.owner, 9, SBAR_PRINT, SBAR_PRINT);
		}
		else
		{
			TF_T_Damage (other, self, self.owner, COLOR_GREEN, SBAR_PRINT, SBAR_PRINT);
		}
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		if ((self.classname == "wizspike"))
		{
			WriteByte (AS_MISSILE, 7);
		}
		else
		{
			if ((self.classname == "knightspike"))
			{
				WriteByte (AS_MISSILE, 8);
			}
			else
			{
				WriteByte (AS_MISSILE, RANGE_MELEE);
			}
		}
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	dremove (self);
};

void () superspike_touch =
{
	local float ndmg;

	if (self.voided)
	{
		return;
	}
	self.voided = SBAR_GRENS;
	if ((other == self.owner))
	{
		return;
	}
	if ((other.solid == SBAR_GRENS))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if (other.takedamage)
	{
		spawn_touchblood (COLOR_GREEN);
		deathmsg = self.weapon;
		if ((deathmsg == 9))
		{
			ndmg = 40;
		}
		else
		{
			ndmg = 26;
		}
		if ((self.owner.classname == "grenade"))
		{
			TF_T_Damage (other, self, self.owner.owner, ndmg, SBAR_PRINT, SBAR_PRINT);
		}
		else
		{
			TF_T_Damage (other, self, self.owner, ndmg, SBAR_PRINT, SBAR_PRINT);
		}
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_GRENS);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	dremove (self);
};

void () W_SetCurrentAmmo =
{
	local string st;

	if (((self.health <= RANGE_MELEE) || (self.current_weapon == RANGE_MELEE)))
	{
		return;
	}
	if (((self.current_weapon == 32768) && (self.tfstate & 2048)))
	{
		return;
	}
	player_run ();
	self.items = (self.items - (self.items & (((256 | 512) | 1024) | 2048)));
	self.weapon = RANGE_MELEE;
	if ((self.current_weapon == SBAR_240))
	{
		self.currentammo = RANGE_MELEE;
		if ((self.playerclass == 8))
		{
			if ((self.weaponmode == RANGE_MELEE))
			{
				self.weaponmodel = "progs/v_knife.mdl";
			}
			else
			{
				self.weaponmodel = "progs/v_knife2.mdl";
			}
		}
		else
		{
			if (tfstrike)
			{
				self.weaponmodel = "progs/v_knife.mdl";
			}
			else
			{
				self.weaponmodel = "progs/v_axe.mdl";
			}
		}
		self.weaponframe = RANGE_MELEE;
	}
	else
	{
		if ((self.current_weapon == SBAR_GRENS))
		{
			self.currentammo = RANGE_MELEE;
			self.weaponmodel = "progs/v_grap.mdl";
			self.weaponframe = RANGE_MELEE;
		}
		else
		{
			if ((self.current_weapon == 8))
			{
				self.currentammo = self.ammo_cells;
				self.weaponmodel = "progs/v_span.mdl";
				self.weaponframe = RANGE_MELEE;
			}
			else
			{
				if ((self.current_weapon == 128))
				{
					self.currentammo = self.ammo_shells;
					self.items = (self.items | 2048);
					if (!(self.tfstate & SBAR_PRINT))
					{
						self.weaponmodel = "progs/v_shot.mdl";
						self.weaponframe = RANGE_MELEE;
					}
					self.items = (self.items | 256);
					self.weapon = SBAR_GRENS;
				}
				else
				{
					if ((self.current_weapon == 256))
					{
						self.currentammo = self.ammo_shells;
						if (!(self.tfstate & SBAR_PRINT))
						{
							self.weaponmodel = "progs/v_shot2.mdl";
							self.weaponframe = RANGE_MELEE;
						}
						self.items = (self.items | 256);
						self.weapon = SBAR_PRINT;
					}
					else
					{
						if ((self.current_weapon == 512))
						{
							self.currentammo = self.ammo_nails;
							if (!(self.tfstate & SBAR_PRINT))
							{
								self.weaponmodel = "progs/v_nail.mdl";
								self.weaponframe = RANGE_MELEE;
							}
							self.items = (self.items | 512);
							self.weapon = AS_MISSILE;
						}
						else
						{
							if ((self.current_weapon == 1024))
							{
								self.currentammo = self.ammo_nails;
								if (!(self.tfstate & SBAR_PRINT))
								{
									self.weaponmodel = "progs/v_nail2.mdl";
									self.weaponframe = RANGE_MELEE;
								}
								self.items = (self.items | 512);
								self.weapon = 8;
							}
							else
							{
								if ((self.current_weapon == 2048))
								{
									self.currentammo = self.ammo_rockets;
									if (!(self.tfstate & SBAR_PRINT))
									{
										self.weaponmodel = "progs/v_rock.mdl";
										self.weaponframe = RANGE_MELEE;
									}
									self.weapon = SBAR_240;
									self.items = (self.items | 1024);
								}
								else
								{
									if ((self.current_weapon == 8192))
									{
										self.currentammo = self.ammo_rockets;
										if (!(self.tfstate & SBAR_PRINT))
										{
											self.weaponmodel = "progs/v_rock2.mdl";
											self.weaponframe = RANGE_MELEE;
										}
										self.items = (self.items | 1024);
										self.weapon = space;
									}
									else
									{
										if ((self.current_weapon == 65536))
										{
											self.currentammo = self.ammo_cells;
											if (!(self.tfstate & SBAR_PRINT))
											{
												self.weaponmodel = "progs/v_light.mdl";
												self.weaponframe = RANGE_MELEE;
											}
											self.items = (self.items | 2048);
											self.weapon = 64;
										}
										else
										{
											if ((self.current_weapon == space))
											{
												self.currentammo = self.ammo_shells;
												if (!(self.tfstate & SBAR_PRINT))
												{
													self.weaponmodel = "progs/v_srifle.mdl";
													self.weaponframe = RANGE_MELEE;
												}
												self.items = (self.items | 256);
												self.weapon = SBAR_GRENS;
											}
											else
											{
												if ((self.current_weapon == 64))
												{
													self.currentammo = self.ammo_shells;
													if (!(self.tfstate & SBAR_PRINT))
													{
														self.weaponmodel = "progs/v_srifle.mdl";
														self.weaponframe = RANGE_MELEE;
													}
													self.items = (self.items | 256);
													self.weapon = SBAR_PRINT;
												}
												else
												{
													if ((self.current_weapon == 32768))
													{
														self.currentammo = self.ammo_shells;
														if (!(self.tfstate & SBAR_PRINT))
														{
															self.weaponmodel = "progs/v_asscan.mdl";
															self.weaponframe = RANGE_MELEE;
														}
														self.items = (self.items | 256);
														self.weapon = space;
													}
													else
													{
														if ((self.current_weapon == 4096))
														{
															self.currentammo = self.ammo_cells;
															if (!(self.tfstate & SBAR_PRINT))
															{
																self.weaponmodel = "progs/v_rock.mdl";
																self.weaponframe = RANGE_MELEE;
															}
															self.items = (self.items | 2048);
															self.weapon = 8;
														}
														else
														{
															if ((self.current_weapon == 16384))
															{
																self.currentammo = self.ammo_rockets;
																if (!(self.tfstate & SBAR_PRINT))
																{
																	self.weaponmodel = "progs/v_rock2.mdl";
																	self.weaponframe = RANGE_MELEE;
																}
																self.items = (self.items | 1024);
																self.weapon = SBAR_240;
															}
															else
															{
																if ((self.current_weapon == AS_MISSILE))
																{
																	self.currentammo = self.ammo_medikit;
																	self.weaponmodel = "progs/v_medi.mdl";
																	self.weaponframe = RANGE_MELEE;
																}
																else
																{
																	if ((self.current_weapon == SBAR_PRINT))
																	{
																		self.currentammo = RANGE_MELEE;
																		self.weaponmodel = "progs/v_bio.mdl";
																		self.weaponframe = RANGE_MELEE;
																	}
																	else
																	{
																		if ((self.current_weapon == 262144))
																		{
																			self.currentammo = self.ammo_shells;
																			if (!(self.tfstate & SBAR_PRINT))
																			{
																				self.weaponmodel = "progs/v_shot.mdl";
																				self.weaponframe = RANGE_MELEE;
																			}
																			self.items = (self.items | 256);
																			self.weapon = SBAR_GRENS;
																		}
																		else
																		{
																			if ((self.current_weapon == 524288))
																			{
																				self.currentammo = self.ammo_nails;
																				if (!(self.tfstate & SBAR_PRINT))
																				{
																					self.weaponmodel = "progs/v_rail.mdl";
																					self.weaponframe = RANGE_MELEE;
																				}
																				self.items = (self.items | 512);
																				self.weapon = SBAR_GRENS;
																			}
																			else
																			{
																				self.currentammo = RANGE_MELEE;
																				self.weaponmodel = "";
																				self.weaponframe = RANGE_MELEE;
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

float () W_BestWeapon =
{
	local float it;

	it = self.weapons_carried;
	if ((((self.ammo_cells >= SBAR_GRENS) && (it & 65536)) && (self.waterlevel <= SBAR_GRENS)))
	{
		return (65536);
	}
	else
	{
		if ((((self.ammo_cells >= 7) && (self.ammo_shells >= SBAR_GRENS)) && (it & 32768)))
		{
			return (32768);
		}
		else
		{
			if (((self.ammo_cells >= SBAR_GRENS) && (it & 4096)))
			{
				return (4096);
			}
			else
			{
				if (((self.ammo_nails >= SBAR_PRINT) && (it & 1024)))
				{
					return (1024);
				}
				else
				{
					if (((self.ammo_shells >= SBAR_PRINT) && (it & 256)))
					{
						return (256);
					}
					else
					{
						if (((self.ammo_nails >= SBAR_GRENS) && (it & 524288)))
						{
							return (524288);
						}
						else
						{
							if (((self.ammo_nails >= SBAR_GRENS) && (it & 512)))
							{
								return (512);
							}
							else
							{
								if (((self.ammo_shells >= SBAR_GRENS) && (it & 128)))
								{
									return (128);
								}
								else
								{
									if (((self.ammo_shells >= SBAR_GRENS) && (it & 262144)))
									{
										return (262144);
									}
									else
									{
										if ((it & AS_MISSILE))
										{
											return (AS_MISSILE);
										}
										else
										{
											if ((it & 8))
											{
												return (8);
											}
											else
											{
												if ((it & SBAR_240))
												{
													return (SBAR_240);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (RANGE_MELEE);
};

float () W_CheckNoAmmo =
{
	if ((self.current_weapon == AS_MISSILE))
	{
		return (SBAR_GRENS);
	}
	else
	{
		if ((self.current_weapon == SBAR_PRINT))
		{
			return (SBAR_GRENS);
		}
		else
		{
			if ((((self.current_weapon == SBAR_240) || (self.current_weapon == SBAR_GRENS)) || (self.current_weapon == 8)))
			{
				return (SBAR_GRENS);
			}
			else
			{
				if ((self.current_weapon == 16384))
				{
					if ((self.weaponmode == SBAR_GRENS))
					{
						if ((self.currentammo >= SBAR_PRINT))
						{
							return (SBAR_GRENS);
						}
					}
					else
					{
						if ((self.currentammo >= AS_MELEE))
						{
							return (SBAR_GRENS);
						}
					}
				}
				else
				{
					if ((self.currentammo > RANGE_MELEE))
					{
						return (SBAR_GRENS);
					}
				}
			}
		}
	}
	self.current_weapon = W_BestWeapon ();
	W_SetCurrentAmmo ();
	W_PrintWeaponMessage ();
	return (RANGE_MELEE);
};

void () W_Reload_shotgun =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_PRINT));
	self.owner.weaponmodel = "progs/v_shot.mdl";
	sprint (self.owner, SBAR_PRINT, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_super_shotgun =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_PRINT));
	self.owner.weaponmodel = "progs/v_shot2.mdl";
	sprint (self.owner, SBAR_PRINT, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_grenade_launcher =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_PRINT));
	self.owner.weaponmodel = "progs/v_rock.mdl";
	sprint (self.owner, SBAR_PRINT, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_rocket_launcher =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_PRINT));
	self.owner.weaponmodel = "progs/v_rock2.mdl";
	sprint (self.owner, SBAR_PRINT, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

float () CheckForReload =
{
	local entity tWeapon;

	if (practice)
	{
		return (RANGE_MELEE);
	}
	if ((self.playerclass != SBAR_200))
	{
		if ((self.current_weapon == 128))
		{
			if (((self.reload_shotgun >= 8) && (self.ammo_shells > RANGE_MELEE)))
			{
				self.reload_shotgun = RANGE_MELEE;
				if ((self.ammo_shells < 8))
				{
					self.reload_shotgun = (8 - self.ammo_shells);
				}
				sprint (self, SBAR_PRINT, "reloading... \n");
				self.tfstate = (self.tfstate | SBAR_PRINT);
				tWeapon = spawn ();
				tWeapon.owner = self;
				tWeapon.classname = "timer";
				tWeapon.nextthink = (time + SBAR_PRINT);
				tWeapon.think = W_Reload_shotgun;
				self.weaponmodel = "";
				self.weaponframe = RANGE_MELEE;
				return (SBAR_GRENS);
			}
		}
		else
		{
			if ((self.current_weapon == 256))
			{
				if ((self.reload_super_shotgun > SBAR_240))
				{
					self.reload_super_shotgun = SBAR_240;
				}
				if (((self.reload_super_shotgun >= SBAR_240) && (self.ammo_shells > RANGE_MELEE)))
				{
					self.reload_super_shotgun = RANGE_MELEE;
					if ((self.ammo_shells < SBAR_240))
					{
						self.reload_super_shotgun = (SBAR_240 - self.ammo_shells);
					}
					sprint (self, SBAR_PRINT, "reloading... \n");
					self.tfstate = (self.tfstate | SBAR_PRINT);
					tWeapon = spawn ();
					tWeapon.owner = self;
					tWeapon.classname = "timer";
					tWeapon.nextthink = (time + AS_MELEE);
					tWeapon.think = W_Reload_super_shotgun;
					self.weaponmodel = "";
					self.weaponframe = RANGE_MELEE;
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((self.current_weapon == 2048))
				{
					if (((self.reload_grenade_launcher >= 6) && (self.ammo_rockets > RANGE_MELEE)))
					{
						self.reload_grenade_launcher = RANGE_MELEE;
						if ((self.ammo_rockets < 6))
						{
							self.reload_grenade_launcher = (6 - self.ammo_rockets);
						}
						sprint (self, SBAR_PRINT, "reloading...\n");
						self.tfstate = (self.tfstate | SBAR_PRINT);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + AS_MISSILE);
						tWeapon.think = W_Reload_grenade_launcher;
						self.weaponmodel = "";
						self.weaponframe = RANGE_MELEE;
						return (SBAR_GRENS);
					}
				}
				else
				{
					if ((self.current_weapon == 8192))
					{
						if (((self.reload_rocket_launcher >= AS_MISSILE) && (self.ammo_rockets > RANGE_MELEE)))
						{
							self.reload_rocket_launcher = RANGE_MELEE;
							if ((self.ammo_rockets < AS_MISSILE))
							{
								self.reload_rocket_launcher = (AS_MISSILE - self.ammo_rockets);
							}
							sprint (self, SBAR_PRINT, "reloading... \n");
							self.tfstate = (self.tfstate | SBAR_PRINT);
							tWeapon = spawn ();
							tWeapon.owner = self;
							tWeapon.classname = "timer";
							tWeapon.nextthink = (time + 5);
							tWeapon.think = W_Reload_rocket_launcher;
							self.weaponmodel = "";
							self.weaponframe = RANGE_MELEE;
							return (SBAR_GRENS);
						}
					}
				}
			}
		}
	}
	return (RANGE_MELEE);
};
void () player_axe1;
void () player_axeb1;
void () player_axec1;
void () player_axed1;
void () player_shot1;
void () player_nail1;
void () player_light1;
void () player_rocket1;
void () player_autorifle1;
void () player_assaultcannon1;
void () player_assaultcannonup1;
void () player_assaultcannondown1;
void () player_medikit1;
void () player_medikitb1;
void () player_medikitc1;
void () player_medikitd1;
void () player_bioweapon1;
void () player_bioweaponb1;
void () player_bioweaponc1;
void () player_bioweapond1;
void () player_chain1;
void () player_chain2;
void () player_chain3;
void () player_chain4;
void () player_chain5;

void () W_Attack =
{
	local float r;
	local float tc;
	local entity te;
	local string st;

	if (!W_CheckNoAmmo ())
	{
		return;
	}
	if ((self.has_disconnected == SBAR_GRENS))
	{
		return;
	}
	if (!self.playerclass)
	{
		return;
	}
	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	if (((self.is_undercover || (self.undercover_team != RANGE_MELEE)) || (self.undercover_skin != RANGE_MELEE)))
	{
		Spy_RemoveDisguise (self);
	}
	makevectors (self.v_angle);
	self.show_hostile = (time + SBAR_GRENS);
	if ((self.current_weapon == SBAR_240))
	{
		Attack_Finished (0.5);
		sound (self, SBAR_GRENS, "weapons/ax1.wav", SBAR_GRENS, SBAR_GRENS);
		r = random ();
		if ((r < 0.25))
		{
			player_axe1 ();
		}
		else
		{
			if ((r < 0.5))
			{
				player_axeb1 ();
			}
			else
			{
				if ((r < 0.75))
				{
					player_axec1 ();
				}
				else
				{
					player_axed1 ();
				}
			}
		}
	}
	else
	{
		if ((self.current_weapon == 8))
		{
			Attack_Finished (0.5);
			sound (self, SBAR_GRENS, "weapons/ax1.wav", SBAR_GRENS, SBAR_GRENS);
			player_axe1 ();
		}
		else
		{
			if ((self.current_weapon == SBAR_GRENS))
			{
				if (!self.hook_out)
				{
					player_chain1 ();
				}
				Attack_Finished (0.1);
			}
			else
			{
				if ((self.current_weapon == 128))
				{
					if (CheckForReload ())
					{
						return;
					}
					player_shot1 ();
					W_FireShotgun ();
					self.reload_shotgun = (self.reload_shotgun + SBAR_GRENS);
					self.StatusRefreshTime = (time + 0.1);
					CheckForReload ();
					Attack_Finished (0.5);
				}
				else
				{
					if ((self.current_weapon == 256))
					{
						if (CheckForReload ())
						{
							return;
						}
						player_shot1 ();
						W_FireSuperShotgun ();
						self.reload_super_shotgun = (self.reload_super_shotgun + SBAR_PRINT);
						self.StatusRefreshTime = (time + 0.1);
						CheckForReload ();
						Attack_Finished (0.7);
					}
					else
					{
						if ((self.current_weapon == 512))
						{
							player_nail1 ();
						}
						else
						{
							if ((self.current_weapon == 1024))
							{
								player_nail1 ();
							}
							else
							{
								if ((self.current_weapon == 2048))
								{
									if (CheckForReload ())
									{
										return;
									}
									player_rocket1 ();
									W_FireGrenade ();
									self.reload_grenade_launcher = (self.reload_grenade_launcher + SBAR_GRENS);
									self.StatusRefreshTime = (time + 0.1);
									CheckForReload ();
									Attack_Finished (0.6);
								}
								else
								{
									if ((self.current_weapon == 8192))
									{
										if (CheckForReload ())
										{
											return;
										}
										player_rocket1 ();
										W_FireRocket ();
										self.reload_rocket_launcher = (self.reload_rocket_launcher + SBAR_GRENS);
										self.StatusRefreshTime = (time + 0.1);
										CheckForReload ();
										Attack_Finished (0.8);
									}
									else
									{
										if ((self.current_weapon == 65536))
										{
											player_light1 ();
											Attack_Finished (0.1);
											sound (self, RANGE_MELEE, "weapons/lstart.wav", SBAR_GRENS, SBAR_GRENS);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((self.current_weapon == space))
	{
		if (((self.flags & 512) || self.hook_out))
		{
			player_shot1 ();
			W_FireSniperRifle ();
			Attack_Finished (1.7);
		}
	}
	else
	{
		if ((self.current_weapon == 64))
		{
			player_autorifle1 ();
			W_FireAutoRifle ();
			Attack_Finished (0.1);
		}
		else
		{
			if ((self.current_weapon == 32768))
			{
				if ((self.ammo_cells < 7))
				{
					sprint (self, SBAR_GRENS, "Insufficient cells to power up the Assault Cannon.\n");
				}
				else
				{
					self.ammo_cells = (self.ammo_cells - 7);
					self.heat = SBAR_GRENS;
					self.immune_to_check = (time + 5);
					self.tfstate = (self.tfstate | 2048);
					TeamFortress_SetSpeed (self);
					player_assaultcannonup1 ();
				}
			}
			else
			{
				if ((self.current_weapon == 4096))
				{
					player_shot1 ();
					W_FireFlame ();
					if ((self.waterlevel > SBAR_PRINT))
					{
						Attack_Finished (SBAR_GRENS);
					}
					else
					{
						Attack_Finished (0.15);
					}
				}
				else
				{
					if ((self.current_weapon == 16384))
					{
						player_rocket1 ();
						W_FireIncendiaryCannon ();
						if ((self.weaponmode == SBAR_GRENS))
						{
							Attack_Finished (0.9);
						}
						else
						{
							Attack_Finished (1.2);
						}
					}
					else
					{
						if ((self.current_weapon == AS_MISSILE))
						{
							sound (self, SBAR_GRENS, "weapons/ax1.wav", SBAR_GRENS, SBAR_GRENS);
							r = random ();
							if ((r < 0.25))
							{
								player_medikit1 ();
							}
							else
							{
								if ((r < 0.5))
								{
									player_medikitb1 ();
								}
								else
								{
									if ((r < 0.75))
									{
										player_medikitc1 ();
									}
									else
									{
										player_medikitd1 ();
									}
								}
							}
							Attack_Finished (0.5);
						}
						else
						{
							if ((self.current_weapon == SBAR_PRINT))
							{
								sound (self, SBAR_GRENS, "weapons/ax1.wav", SBAR_GRENS, SBAR_GRENS);
								r = random ();
								if ((r < 0.25))
								{
									player_bioweapon1 ();
								}
								else
								{
									if ((r < 0.5))
									{
										player_bioweaponb1 ();
									}
									else
									{
										if ((r < 0.75))
										{
											player_bioweaponc1 ();
										}
										else
										{
											player_bioweapond1 ();
										}
									}
								}
								Attack_Finished (0.5);
							}
							else
							{
								if ((self.current_weapon == 262144))
								{
									sound (self, SBAR_GRENS, "weapons/dartgun.wav", SBAR_GRENS, SBAR_GRENS);
									player_shot1 ();
									W_FireTranq ();
									Attack_Finished (1.5);
								}
								else
								{
									if ((self.current_weapon == 524288))
									{
										sound (self, SBAR_GRENS, "weapons/railgun.wav", SBAR_GRENS, SBAR_GRENS);
										player_shot1 ();
										W_FireRail ();
										Attack_Finished (0.4);
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () W_PrintWeaponMessage =
{
	if (((self.current_weapon == SBAR_240) && allow_hook))
	{
		if ((self.playerclass != 8))
		{
			sprint (self, SBAR_GRENS, "Axe selected\n");
		}
	}
	else
	{
		if ((self.current_weapon == SBAR_GRENS))
		{
			sprint (self, SBAR_GRENS, "grappling hook selected\n");
		}
		else
		{
			if ((self.current_weapon == 2048))
			{
				if (((self.weaponmode == RANGE_MELEE) && (self.playerclass != SBAR_200)))
				{
					sprint (self, SBAR_GRENS, "Normal grenade mode\n");
				}
				else
				{
					if (cb_prematch)
					{
						sprint (self, SBAR_GRENS, "Pipebomb mode not available in PreMatch\n");
					}
					else
					{
						if ((self.weaponmode == SBAR_GRENS))
						{
							sprint (self, SBAR_GRENS, "Pipebomb mode\n");
						}
					}
				}
			}
			else
			{
				if ((self.current_weapon == space))
				{
					sprint (self, SBAR_GRENS, "Sniper rifle ready\n");
				}
				else
				{
					if ((self.current_weapon == 64))
					{
						sprint (self, SBAR_GRENS, "rifle on fully auto\n");
					}
					else
					{
						if ((self.current_weapon == 262144))
						{
							sprint (self, SBAR_GRENS, "Tranquiliser gun selected\n");
						}
						else
						{
							if ((self.current_weapon == SBAR_PRINT))
							{
								sprint (self, SBAR_GRENS, "BioWeapon readied\n");
							}
							else
							{
								if ((self.current_weapon == AS_MISSILE))
								{
									sprint (self, SBAR_GRENS, "Medikit/Bioweapon readied\n");
								}
								else
								{
									if ((self.current_weapon == 16384))
									{
										if ((self.weaponmode == RANGE_MELEE))
										{
											sprint (self, SBAR_GRENS, "Heavy Incendiary Cannon\n");
										}
										else
										{
											if ((self.weaponmode == SBAR_GRENS))
											{
												sprint (self, SBAR_GRENS, "Light Incendiary Cannon\n");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () W_ChangeWeapon =
{
	local float it;
	local float am;
	local float fl;
	local float wm;
	local float have_weapon;
	local float usable;

	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	it = self.weapons_carried;
	fl = self.current_weapon;
	am = RANGE_MELEE;
	usable = RANGE_MELEE;
	have_weapon = SBAR_GRENS;
	if ((self.impulse == SBAR_GRENS))
	{
		if (!(it & ((((SBAR_GRENS | SBAR_PRINT) | AS_MISSILE) | SBAR_240) | 8)))
		{
			have_weapon = RANGE_MELEE;
		}
		while ((!usable && have_weapon))
		{
			if ((fl == 8))
			{
				fl = SBAR_PRINT;
				if ((it & SBAR_PRINT))
				{
					usable = SBAR_GRENS;
				}
				usable = RANGE_MELEE;
			}
			else
			{
				if ((fl == SBAR_PRINT))
				{
					fl = AS_MISSILE;
					if ((it & AS_MISSILE))
					{
						usable = SBAR_GRENS;
					}
				}
				else
				{
					if ((fl == AS_MISSILE))
					{
						fl = SBAR_GRENS;
						if ((allow_hook && (fl & SBAR_GRENS)))
						{
							usable = SBAR_GRENS;
						}
						if (self.hook_out)
						{
							Reset_Grapple (self.hook);
						}
					}
					else
					{
						if ((fl == SBAR_GRENS))
						{
							fl = SBAR_240;
							if ((it & SBAR_240))
							{
								usable = SBAR_GRENS;
							}
						}
						else
						{
							fl = 8;
							if ((it & 8))
							{
								usable = SBAR_GRENS;
							}
						}
					}
				}
			}
		}
	}
	else
	{
		if ((allow_hook && ((self.impulse == SBAR_300) || (self.impulse == 39))))
		{
			fl = SBAR_GRENS;
		}
		else
		{
			if ((self.impulse == 40))
			{
				if (!(it & (((SBAR_PRINT | AS_MISSILE) | SBAR_240) | 8)))
				{
					have_weapon = RANGE_MELEE;
				}
				while ((!usable && have_weapon))
				{
					if ((fl == 8))
					{
						fl = SBAR_PRINT;
						if ((it & SBAR_PRINT))
						{
							usable = SBAR_GRENS;
						}
						usable = RANGE_MELEE;
					}
					else
					{
						if ((fl == SBAR_PRINT))
						{
							fl = AS_MISSILE;
							if ((it & AS_MISSILE))
							{
								usable = SBAR_GRENS;
							}
						}
						else
						{
							if ((fl == AS_MISSILE))
							{
								fl = SBAR_240;
								if ((it & SBAR_240))
								{
									usable = SBAR_GRENS;
								}
							}
							else
							{
								fl = 8;
								if ((it & 8))
								{
									usable = SBAR_GRENS;
								}
							}
						}
					}
				}
			}
			else
			{
				if ((self.impulse == SBAR_PRINT))
				{
					if ((it & space))
					{
						fl = space;
						if ((self.ammo_shells < SBAR_GRENS))
						{
							am = SBAR_GRENS;
						}
					}
					else
					{
						if ((it & 128))
						{
							fl = 128;
							if ((self.ammo_shells < SBAR_GRENS))
							{
								am = SBAR_GRENS;
							}
						}
						else
						{
							if ((it & 262144))
							{
								fl = 262144;
								if ((self.ammo_shells < SBAR_GRENS))
								{
									am = SBAR_GRENS;
								}
							}
							else
							{
								if ((it & 524288))
								{
									fl = 524288;
									if ((self.ammo_nails < SBAR_GRENS))
									{
										am = SBAR_GRENS;
									}
								}
								else
								{
									have_weapon = RANGE_MELEE;
								}
							}
						}
					}
				}
				else
				{
					if ((self.impulse == AS_MELEE))
					{
						if ((it & 64))
						{
							fl = 64;
							if ((self.ammo_shells < SBAR_GRENS))
							{
								am = SBAR_GRENS;
							}
						}
						else
						{
							fl = 256;
							if ((self.ammo_shells < SBAR_PRINT))
							{
								am = SBAR_GRENS;
							}
						}
					}
					else
					{
						if ((self.impulse == AS_MISSILE))
						{
							fl = 512;
							if ((self.ammo_nails < SBAR_GRENS))
							{
								am = SBAR_GRENS;
							}
						}
						else
						{
							if ((self.impulse == 5))
							{
								if ((it & 1024))
								{
									fl = 1024;
									if ((self.ammo_nails < SBAR_PRINT))
									{
										am = SBAR_GRENS;
									}
								}
								else
								{
									if ((it & 4096))
									{
										fl = 4096;
										if ((self.ammo_cells < SBAR_GRENS))
										{
											am = SBAR_GRENS;
										}
									}
								}
							}
							else
							{
								if ((self.impulse == 6))
								{
									if ((it & 16384))
									{
										fl = 16384;
										if ((self.ammo_rockets < SBAR_PRINT))
										{
											am = SBAR_GRENS;
										}
										wm = SBAR_GRENS;
									}
									else
									{
										if ((it & 2048))
										{
											fl = 2048;
											if ((self.ammo_rockets < SBAR_GRENS))
											{
												am = SBAR_GRENS;
											}
											wm = RANGE_MELEE;
										}
										else
										{
											have_weapon = RANGE_MELEE;
										}
									}
								}
								else
								{
									if ((self.impulse == 7))
									{
										if ((it & 16384))
										{
											fl = 16384;
											if ((self.ammo_rockets < AS_MELEE))
											{
												am = SBAR_GRENS;
											}
											wm = RANGE_MELEE;
										}
										else
										{
											if ((it & 8192))
											{
												fl = 8192;
												if ((self.ammo_rockets < SBAR_GRENS))
												{
													am = SBAR_GRENS;
												}
											}
											else
											{
												if ((it & 32768))
												{
													fl = 32768;
													if ((self.ammo_shells < SBAR_GRENS))
													{
														am = SBAR_GRENS;
													}
													else
													{
														if ((self.ammo_cells < 7))
														{
															am = SBAR_PRINT;
														}
													}
												}
												else
												{
													if ((it & 2048))
													{
														fl = 2048;
														wm = SBAR_GRENS;
														if ((self.ammo_rockets < SBAR_GRENS))
														{
															am = SBAR_GRENS;
														}
													}
													else
													{
														have_weapon = RANGE_MELEE;
													}
												}
											}
										}
									}
									else
									{
										if ((self.impulse == 8))
										{
											fl = 65536;
											if ((self.ammo_cells < SBAR_GRENS))
											{
												am = SBAR_GRENS;
											}
										}
										else
										{
											if ((self.impulse == COLOR_RED))
											{
												fl = AS_MISSILE;
												if ((it & AS_MISSILE))
												{
													usable = SBAR_GRENS;
												}
											}
											else
											{
												if ((self.impulse == 12))
												{
													fl = self.last_weapon;
													if ((it & self.last_weapon))
													{
														usable = SBAR_GRENS;
													}
													if ((((fl & (((((space | 64) | 128) | 256) | 32768) | 262144)) != RANGE_MELEE) && (self.ammo_shells < SBAR_GRENS)))
													{
														am = SBAR_GRENS;
													}
													else
													{
														if ((((fl & ((512 | 1024) | 524288)) != RANGE_MELEE) && (self.ammo_nails < SBAR_GRENS)))
														{
															am = SBAR_GRENS;
														}
														else
														{
															if ((((fl & (2048 | 8192)) != RANGE_MELEE) && (self.ammo_rockets < SBAR_GRENS)))
															{
																am = SBAR_GRENS;
															}
															else
															{
																if ((((fl & (4096 | 65536)) != RANGE_MELEE) && (self.ammo_cells < SBAR_GRENS)))
																{
																	am = SBAR_GRENS;
																}
																else
																{
																	if (((fl & 16384) != RANGE_MELEE))
																	{
																		if ((self.weaponmode == SBAR_GRENS))
																		{
																			if ((self.ammo_rockets < SBAR_PRINT))
																			{
																				am = SBAR_GRENS;
																			}
																		}
																		else
																		{
																			if ((self.ammo_rockets < AS_MELEE))
																			{
																				am = SBAR_GRENS;
																			}
																		}
																	}
																	else
																	{
																		if (((fl == 32768) && (self.ammo_cells < 7)))
																		{
																			am = SBAR_PRINT;
																		}
																	}
																}
															}
														}
													}
													if ((am == RANGE_MELEE))
													{
														wm = self.last_weaponmode;
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	self.impulse = RANGE_MELEE;
	if ((!have_weapon || !(it & fl)))
	{
		sprint (self, SBAR_PRINT, "no weapon.\n");
		return;
	}
	if ((am == SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "not enough ammo.\n");
		return;
	}
	if ((am == SBAR_PRINT))
	{
		sprint (self, SBAR_PRINT, "not enough cells to power assault cannon.\n");
		return;
	}
	self.last_weaponmode = self.weaponmode;
	self.last_weapon = self.current_weapon;
	self.current_weapon = fl;
	self.weaponmode = wm;
	W_SetCurrentAmmo ();
	W_PrintWeaponMessage ();
	self.StatusRefreshTime = (time + 0.1);
};

void () CycleWeaponCommand =
{
	local float it;
	local float am;
	local float cont;
	local float loopcount;
	local float lw;

	if (((self.weaponmodel == string_null) || (self.current_weapon == RANGE_MELEE)))
	{
		return;
	}
	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	it = self.weapons_carried;
	self.impulse = RANGE_MELEE;
	loopcount = RANGE_MELEE;
	lw = self.current_weapon;
	while (SBAR_GRENS)
	{
		am = RANGE_MELEE;
		cont = RANGE_MELEE;
		if ((self.current_weapon == SBAR_240))
		{
			self.current_weapon = 8;
		}
		else
		{
			if ((self.current_weapon == 8))
			{
				self.current_weapon = 128;
				if ((self.ammo_shells < SBAR_GRENS))
				{
					am = SBAR_GRENS;
				}
			}
			else
			{
				if ((self.current_weapon == 128))
				{
					self.current_weapon = 524288;
					if ((self.ammo_nails < SBAR_GRENS))
					{
						am = SBAR_GRENS;
					}
				}
				else
				{
					if ((self.current_weapon == 524288))
					{
						self.current_weapon = 262144;
						if ((self.ammo_shells < SBAR_GRENS))
						{
							am = SBAR_GRENS;
						}
					}
					else
					{
						if ((self.current_weapon == 262144))
						{
							self.current_weapon = space;
							if ((self.ammo_shells < SBAR_GRENS))
							{
								am = SBAR_GRENS;
							}
						}
						else
						{
							if ((self.current_weapon == space))
							{
								self.current_weapon = 64;
								if ((self.ammo_shells < SBAR_GRENS))
								{
									am = SBAR_GRENS;
								}
							}
							else
							{
								if ((self.current_weapon == 64))
								{
									self.current_weapon = 256;
									if ((self.ammo_shells < SBAR_PRINT))
									{
										am = SBAR_GRENS;
									}
								}
								else
								{
									if ((self.current_weapon == 256))
									{
										self.current_weapon = 512;
										if ((self.ammo_nails < SBAR_GRENS))
										{
											am = SBAR_GRENS;
										}
									}
									else
									{
										if ((self.current_weapon == 512))
										{
											self.current_weapon = 1024;
											if ((self.ammo_nails < SBAR_PRINT))
											{
												am = SBAR_GRENS;
											}
										}
										else
										{
											if ((self.current_weapon == 1024))
											{
												self.current_weapon = 2048;
												self.weaponmode = RANGE_MELEE;
												if ((self.ammo_rockets < SBAR_GRENS))
												{
													am = SBAR_GRENS;
												}
											}
											else
											{
												if (((self.current_weapon == 2048) && (self.weaponmode == RANGE_MELEE)))
												{
													if ((self.playerclass != SBAR_200))
													{
														self.current_weapon = 2048;
														self.weaponmode = SBAR_GRENS;
													}
													else
													{
														self.current_weapon = 8192;
													}
													if ((self.ammo_rockets < SBAR_GRENS))
													{
														am = SBAR_GRENS;
													}
												}
												else
												{
													if (((self.current_weapon == 2048) && (self.weaponmode == SBAR_GRENS)))
													{
														self.current_weapon = 8192;
														if ((self.ammo_rockets < SBAR_GRENS))
														{
															am = SBAR_GRENS;
														}
													}
													else
													{
														if ((self.current_weapon == 8192))
														{
															self.current_weapon = 65536;
															if ((self.ammo_cells < SBAR_GRENS))
															{
																am = SBAR_GRENS;
															}
														}
														else
														{
															if ((self.current_weapon == 65536))
															{
																self.current_weapon = 4096;
																if ((self.ammo_cells < SBAR_GRENS))
																{
																	am = SBAR_GRENS;
																}
															}
															else
															{
																if ((self.current_weapon == 4096))
																{
																	self.current_weapon = 16384;
																	self.weaponmode = SBAR_GRENS;
																	if ((self.ammo_rockets < AS_MELEE))
																	{
																		am = SBAR_GRENS;
																	}
																}
																else
																{
																	if (((self.current_weapon == 16384) && (self.weaponmode == SBAR_GRENS)))
																	{
																		self.current_weapon = 16384;
																		self.weaponmode = RANGE_MELEE;
																		if ((self.ammo_rockets < SBAR_PRINT))
																		{
																			am = SBAR_GRENS;
																		}
																	}
																	else
																	{
																		if (((self.current_weapon == 16384) && (self.weaponmode == RANGE_MELEE)))
																		{
																			self.current_weapon = 32768;
																			if ((self.ammo_cells < 7))
																			{
																				am = SBAR_GRENS;
																			}
																			if ((self.ammo_shells < SBAR_GRENS))
																			{
																				am = SBAR_GRENS;
																			}
																		}
																		else
																		{
																			if ((self.current_weapon == 32768))
																			{
																				self.current_weapon = SBAR_GRENS;
																				if (!allow_hook)
																				{
																					am = SBAR_GRENS;
																				}
																			}
																			else
																			{
																				if ((self.current_weapon == SBAR_GRENS))
																				{
																					self.current_weapon = AS_MISSILE;
																				}
																				else
																				{
																					if ((self.current_weapon == SBAR_PRINT))
																					{
																						self.current_weapon = AS_MISSILE;
																					}
																					else
																					{
																						if ((self.current_weapon == AS_MISSILE))
																						{
																							self.current_weapon = SBAR_240;
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if ((loopcount > 31))
		{
			return;
		}
		loopcount = (loopcount + SBAR_GRENS);
		if (((self.weapons_carried & self.current_weapon) && (am == RANGE_MELEE)))
		{
			if (((self.current_weapon != 2048) && (self.current_weapon != 16384)))
			{
				self.weaponmode = RANGE_MELEE;
			}
			self.last_weapon = lw;
			W_SetCurrentAmmo ();
			W_PrintWeaponMessage ();
			self.StatusRefreshTime = (time + 0.1);
			return;
		}
	}
};
float () PreMatchImpulses;
void () CommandImpulses;
float () DeadImpulses;

void () ImpulseCommands =
{
	local entity te;
	local string st;

	if (self.last_impulse)
	{
		if (self.impulse)
		{
			if ((self.last_impulse == 168))
			{
				TeamFortress_SetDetpack (self.impulse);
				self.impulse = RANGE_MELEE;
				return;
			}
			if ((self.last_impulse == _G))
			{
				StatusRes (self.impulse);
				self.impulse = RANGE_MELEE;
				return;
			}
		}
	}
	if (((cb_prematch || cease_fire) || round_over))
	{
		if (PreMatchImpulses ())
		{
			return;
		}
		if (DeadImpulses ())
		{
			return;
		}
		CommandImpulses ();
		self.impulse = RANGE_MELEE;
		return;
	}
	if ((self.impulse == 171))
	{
		UseSpecialSkill ();
		return;
	}
	if (tfvsdm)
	{
		if (((self.team_no == SBAR_GRENS) || (self.team_no == AS_MELEE)))
		{
			if (((self.impulse == 8) && (self.current_menu != 6)))
			{
				self.current_menu = 6;
				self.menu_count = 25;
				self.menu_displaytime = RANGE_MELEE;
				self.impulse = RANGE_MELEE;
				return;
			}
		}
	}
	else
	{
		if (((self.impulse == 8) && (self.current_menu != 6)))
		{
			self.current_menu = 6;
			self.menu_count = 25;
			self.menu_displaytime = RANGE_MELEE;
			self.impulse = RANGE_MELEE;
			return;
		}
	}
	if ((self.impulse == __))
	{
		if ((clanbattle && !cb_prematch))
		{
			sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
			self.impulse = RANGE_MELEE;
			return;
		}
		self.current_menu = SBAR_PRINT;
		self.menu_count = 25;
		self.impulse = RANGE_MELEE;
		return;
	}
	if ((self.impulse == 168))
	{
		dprint ("hi\n");
		self.last_impulse = self.impulse;
		self.impulse = RANGE_MELEE;
		return;
	}
	if ((self.impulse == 170))
	{
		if (pipedelay)
		{
			if ((time < self.attack_finished))
			{
				return;
			}
		}
		TeamFortress_DetonatePipebombs ();
		self.impulse = RANGE_MELEE;
		return;
	}
	if (((!self.is_building && !self.is_detpacking) && !self.is_feigning))
	{
		if ((((self.impulse >= SBAR_GRENS) && (self.impulse < 9)) || (self.impulse == COLOR_RED)))
		{
			W_ChangeWeapon ();
			self.impulse = RANGE_MELEE;
			return;
		}
		else
		{
			if ((allow_hook && ((self.impulse == SBAR_300) || (self.impulse == 39))))
			{
				W_ChangeWeapon ();
				self.impulse = RANGE_MELEE;
				return;
			}
			else
			{
				if ((self.impulse == 40))
				{
					W_ChangeWeapon ();
					self.impulse = RANGE_MELEE;
					return;
				}
				else
				{
					if ((self.impulse == enter))
					{
						CycleWeaponCommand ();
						self.impulse = RANGE_MELEE;
						return;
					}
					else
					{
						if (((self.impulse == 12) && (self.last_weapon != RANGE_MELEE)))
						{
							W_ChangeWeapon ();
							self.impulse = RANGE_MELEE;
							return;
						}
						else
						{
							if ((self.impulse == 150))
							{
								TeamFortress_PrimeGrenade ();
								self.impulse = RANGE_MELEE;
								return;
							}
							else
							{
								if ((self.impulse == 151))
								{
									TeamFortress_PrimeGrenade ();
									self.impulse = RANGE_MELEE;
									return;
								}
								else
								{
									if ((self.impulse == 173))
									{
										if ((time < self.attack_finished))
										{
											return;
										}
										TeamFortress_ReloadCurrentWeapon ();
										self.impulse = RANGE_MELEE;
										return;
									}
									else
									{
										if ((self.impulse == 164))
										{
											TeamFortress_SetDetpack (5);
											self.impulse = RANGE_MELEE;
											return;
										}
										else
										{
											if ((self.impulse == 165))
											{
												TeamFortress_SetDetpack (20);
												self.impulse = RANGE_MELEE;
												return;
											}
											else
											{
												if ((self.impulse == 166))
												{
													TeamFortress_SetDetpack (_2);
													self.impulse = RANGE_MELEE;
													return;
												}
												else
												{
													if ((self.impulse == 167))
													{
														TeamFortress_SetDetpack (255);
														self.impulse = RANGE_MELEE;
														return;
													}
													else
													{
														if ((self.impulse == 172))
														{
															self.current_menu = AS_MISSILE;
															self.menu_count = 25;
															self.impulse = RANGE_MELEE;
															return;
														}
														else
														{
															if ((self.impulse == 184))
															{
																TeamFortress_Discard ();
																self.impulse = RANGE_MELEE;
																return;
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((self.impulse == redlamp))
	{
		TeamFortress_Inventory ();
		self.impulse = RANGE_MELEE;
		return;
	}
	else
	{
		if ((self.playerclass && (self.impulse == 181)))
		{
			TeamFortress_SaveMe ();
			self.impulse = RANGE_MELEE;
			return;
		}
		else
		{
			if ((self.impulse == 152))
			{
				TeamFortress_ThrowGrenade ();
				self.impulse = RANGE_MELEE;
				return;
			}
			else
			{
				if ((self.impulse == 185))
				{
					TeamFortress_ID ();
					self.impulse = RANGE_MELEE;
					return;
				}
				else
				{
					if ((self.playerclass && (self.impulse == 194)))
					{
						DropGoalItems ();
						self.impulse = RANGE_MELEE;
						return;
					}
					else
					{
						if ((self.impulse == 169))
						{
							TeamFortress_DetpackStop ();
							self.impulse = RANGE_MELEE;
							return;
						}
						else
						{
							if (((self.impulse == 188) && (self.playerclass == 9)))
							{
								DestroyBuilding (self, "building_sentrygun");
								self.impulse = RANGE_MELEE;
								return;
							}
							else
							{
								if (((self.impulse == 187) && (self.playerclass == 9)))
								{
									DestroyBuilding (self, "building_dispenser");
									self.impulse = RANGE_MELEE;
									return;
								}
								else
								{
									if (((self.impulse == 177) && (self.playerclass == 8)))
									{
										TeamFortress_SpyGoUndercover ();
										self.impulse = RANGE_MELEE;
										return;
									}
									else
									{
										if (((self.impulse == 178) && (self.playerclass == 8)))
										{
											TeamFortress_SpyFeignDeath (RANGE_MELEE);
											self.impulse = RANGE_MELEE;
											return;
										}
										else
										{
											if (((self.impulse == 199) && (self.playerclass == 8)))
											{
												TeamFortress_SpyFeignDeath (SBAR_GRENS);
												self.impulse = RANGE_MELEE;
												return;
											}
											else
											{
												if (((self.impulse == 179) && (self.playerclass == 9)))
												{
													TeamFortress_EngineerBuild ();
													self.impulse = RANGE_MELEE;
													return;
												}
												else
												{
													if ((self.impulse == 23))
													{
														if ((CTF_Map == SBAR_GRENS))
														{
															TeamFortress_CTF_FlagInfo ();
														}
														else
														{
															TeamFortress_DisplayDetectionItems ();
														}
														self.impulse = RANGE_MELEE;
														return;
													}
													else
													{
														if ((self.impulse == _v))
														{
															display_location ();
															self.impulse = RANGE_MELEE;
															return;
														}
														else
														{
															if (DeadImpulses ())
															{
																return;
															}
															CommandImpulses ();
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	self.impulse = RANGE_MELEE;
};

void () CommandImpulses =
{
	if ((self.impulse == 41))
	{
		Toggle_Tracking ();
		self.impulse = RANGE_MELEE;
		return;
	}
	else
	{
		if ((self.impulse == _p))
		{
			if ((self.classname != "observer"))
			{
				if (clanbattle)
				{
					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
					self.impulse = RANGE_MELEE;
					return;
				}
			}
			if (self.playerclass)
			{
				return;
			}
			if ((self.tracking != SBAR_GRENS))
			{
				return;
			}
			Pan_In (15);
			self.impulse = RANGE_MELEE;
			return;
		}
		else
		{
			if ((self.impulse == _q))
			{
				if ((self.classname != "observer"))
				{
					if (clanbattle)
					{
						sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
						self.impulse = RANGE_MELEE;
						return;
					}
				}
				if (self.playerclass)
				{
					return;
				}
				if ((self.tracking != SBAR_GRENS))
				{
					return;
				}
				Pan_Out (15);
				self.impulse = RANGE_MELEE;
				return;
			}
			else
			{
				if ((self.impulse == 42))
				{
					if ((self.classname != "observer"))
					{
						if (clanbattle)
						{
							sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
							self.impulse = RANGE_MELEE;
							return;
						}
					}
					if ((self.playerclass || self.deadflag))
					{
						return;
					}
					Track_Player ();
					self.last_impulse = self.impulse;
					self.impulse = RANGE_MELEE;
					return;
				}
				else
				{
					if ((self.impulse == 43))
					{
						if ((self.classname != "observer"))
						{
							if (clanbattle)
							{
								sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
								self.impulse = RANGE_MELEE;
								return;
							}
						}
						if ((self.playerclass || self.deadflag))
						{
							return;
						}
						Track_Tfgoal ();
						self.last_impulse = self.impulse;
						self.impulse = RANGE_MELEE;
						return;
					}
					else
					{
						if ((self.impulse == 44))
						{
							if ((self.classname != "observer"))
							{
								if (clanbattle)
								{
									sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
									self.impulse = RANGE_MELEE;
									return;
								}
							}
							if ((self.playerclass || self.deadflag))
							{
								return;
							}
							Track_Sentry ();
							if (!self.tracking)
							{
								Toggle_Tracking ();
							}
							self.last_impulse = self.impulse;
							self.impulse = RANGE_MELEE;
							return;
						}
						else
						{
							if ((self.impulse == 180))
							{
								Drop_detpack ();
								self.impulse = RANGE_MELEE;
								return;
							}
							else
							{
								if ((self.impulse == _H))
								{
									ShowFrags (self);
									self.impulse = RANGE_MELEE;
									return;
								}
								else
								{
									if ((self.impulse == _I))
									{
										ShowFps ();
										self.impulse = RANGE_MELEE;
										return;
									}
									else
									{
										if ((self.impulse == _J))
										{
											ShowStats ();
											self.impulse = RANGE_MELEE;
											return;
										}
										else
										{
											if ((self.impulse == _S))
											{
												VoteYes ();
												self.impulse = RANGE_MELEE;
												return;
											}
											else
											{
												if ((self.impulse == _T))
												{
													VoteNo ();
													self.impulse = RANGE_MELEE;
													return;
												}
												else
												{
													if ((self.impulse == _U))
													{
														PlayerBreak ();
														self.impulse = RANGE_MELEE;
														return;
													}
													else
													{
														if ((self.impulse == _V))
														{
															if ((allow_flash == SBAR_GRENS))
															{
																flash_toggle ();
															}
															self.impulse = RANGE_MELEE;
															return;
														}
														else
														{
															if ((self.impulse == _X))
															{
																Commands ();
																self.impulse = RANGE_MELEE;
																return;
															}
															else
															{
																if ((self.impulse == _W))
																{
																	ShowVersion ();
																	self.impulse = RANGE_MELEE;
																	return;
																}
																else
																{
																	if ((self.impulse == _Y))
																	{
																		ModStatus ();
																		self.impulse = RANGE_MELEE;
																		return;
																	}
																	else
																	{
																		if ((self.impulse == _R))
																		{
																			if (!stof (infokey (world, "adminlevel")))
																			{
																				sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																				self.impulse = RANGE_MELEE;
																				return;
																			}
																			VoteAdmin ();
																			self.impulse = RANGE_MELEE;
																			return;
																		}
																		else
																		{
																			if (((self.is_admin != SBAR_GRENS) && (self.is_admin != AS_MELEE)))
																			{
																				self.impulse = RANGE_MELEE;
																				return;
																			}
																			else
																			{
																				if ((self.impulse == 192))
																				{
																					if ((self.is_admin != AS_MELEE))
																					{
																						if (!stof (infokey (world, "adminlevel")))
																						{
																							sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																							self.impulse = RANGE_MELEE;
																							return;
																						}
																					}
																					Admin_CountPlayers ();
																					self.impulse = RANGE_MELEE;
																					return;
																				}
																				else
																				{
																					if ((self.impulse == 218))
																					{
																						if ((self.is_admin != AS_MELEE))
																						{
																							if ((stof (infokey (world, "adminlevel")) < AS_MELEE))
																							{
																								sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																								self.impulse = RANGE_MELEE;
																								return;
																							}
																						}
																						Calibrate_Level ();
																						self.impulse = RANGE_MELEE;
																						return;
																					}
																					else
																					{
																						if ((self.impulse == 189))
																						{
																							if ((self.is_admin != AS_MELEE))
																							{
																								if ((stof (infokey (world, "adminlevel")) < AS_MELEE))
																								{
																									sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																									self.impulse = RANGE_MELEE;
																									return;
																								}
																							}
																							Admin_CycleDeal ();
																							self.impulse = RANGE_MELEE;
																							return;
																						}
																						else
																						{
																							if (((self.impulse == 190) && (self.admin_mode == SBAR_GRENS)))
																							{
																								if ((self.is_admin != AS_MELEE))
																								{
																									if ((stof (infokey (world, "adminlevel")) < AS_MELEE))
																									{
																										sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																										self.impulse = RANGE_MELEE;
																										return;
																									}
																								}
																								Admin_DoKick ();
																								self.impulse = RANGE_MELEE;
																								return;
																							}
																							else
																							{
																								if (((self.impulse == 195) && (self.admin_mode == SBAR_GRENS)))
																								{
																									if ((self.is_admin != AS_MELEE))
																									{
																										if ((stof (infokey (world, "adminlevel")) < AS_MELEE))
																										{
																											sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																											self.impulse = RANGE_MELEE;
																											return;
																										}
																									}
																									Admin_CycleDeal ();
																									self.impulse = RANGE_MELEE;
																									return;
																								}
																								else
																								{
																									if ((self.impulse == 198))
																									{
																										if ((self.is_admin != AS_MELEE))
																										{
																											if ((stof (infokey (world, "adminlevel")) < AS_MELEE))
																											{
																												sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																												self.impulse = RANGE_MELEE;
																												return;
																											}
																										}
																										Admin_ListIPs ();
																										self.impulse = RANGE_MELEE;
																										return;
																									}
																									else
																									{
																										if ((self.impulse == 200))
																										{
																											if ((self.is_admin != AS_MELEE))
																											{
																												if (!stof (infokey (world, "adminlevel")))
																												{
																													sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																													self.impulse = RANGE_MELEE;
																													return;
																												}
																											}
																											if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																											{
																												sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																												self.impulse = RANGE_MELEE;
																												return;
																											}
																											TimeDown (5);
																											self.impulse = RANGE_MELEE;
																											return;
																										}
																										else
																										{
																											if ((self.impulse == 201))
																											{
																												if ((self.is_admin != AS_MELEE))
																												{
																													if (!stof (infokey (world, "adminlevel")))
																													{
																														sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																														self.impulse = RANGE_MELEE;
																														return;
																													}
																												}
																												if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																												{
																													sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																													self.impulse = RANGE_MELEE;
																													return;
																												}
																												TimeUp (5);
																												self.impulse = RANGE_MELEE;
																												return;
																											}
																											else
																											{
																												if ((self.impulse == 228))
																												{
																													if ((self.is_admin != AS_MELEE))
																													{
																														if (!stof (infokey (world, "adminlevel")))
																														{
																															sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																															self.impulse = RANGE_MELEE;
																															return;
																														}
																													}
																													if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																													{
																														sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																														self.impulse = RANGE_MELEE;
																														return;
																													}
																													PmTimeDown (SBAR_GRENS);
																													self.impulse = RANGE_MELEE;
																													return;
																												}
																												else
																												{
																													if ((self.impulse == 229))
																													{
																														if ((self.is_admin != AS_MELEE))
																														{
																															if (!stof (infokey (world, "adminlevel")))
																															{
																																sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																self.impulse = RANGE_MELEE;
																																return;
																															}
																														}
																														if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																														{
																															sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																															self.impulse = RANGE_MELEE;
																															return;
																														}
																														PmTimeUp (SBAR_GRENS);
																														self.impulse = RANGE_MELEE;
																														return;
																													}
																													else
																													{
																														if ((self.impulse == 96))
																														{
																															if ((self.is_admin != AS_MELEE))
																															{
																																if (!stof (infokey (world, "adminlevel")))
																																{
																																	sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																	self.impulse = RANGE_MELEE;
																																	return;
																																}
																															}
																															if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																															{
																																sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																self.impulse = RANGE_MELEE;
																																return;
																															}
																															CFTimeDown (SBAR_GRENS);
																															self.impulse = RANGE_MELEE;
																															return;
																														}
																														else
																														{
																															if ((self.impulse == _a))
																															{
																																if ((self.is_admin != AS_MELEE))
																																{
																																	if (!stof (infokey (world, "adminlevel")))
																																	{
																																		sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																		self.impulse = RANGE_MELEE;
																																		return;
																																	}
																																}
																																if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																{
																																	sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																	self.impulse = RANGE_MELEE;
																																	return;
																																}
																																CFTimeUp (SBAR_GRENS);
																																self.impulse = RANGE_MELEE;
																																return;
																															}
																															else
																															{
																																if ((self.impulse == _b))
																																{
																																	if ((self.is_admin != AS_MELEE))
																																	{
																																		if (!stof (infokey (world, "adminlevel")))
																																		{
																																			sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																			self.impulse = RANGE_MELEE;
																																			return;
																																		}
																																	}
																																	if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																	{
																																		sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																		self.impulse = RANGE_MELEE;
																																		return;
																																	}
																																	OverTimeDown (SBAR_GRENS);
																																	self.impulse = RANGE_MELEE;
																																	return;
																																}
																																else
																																{
																																	if ((self.impulse == _c))
																																	{
																																		if ((self.is_admin != AS_MELEE))
																																		{
																																			if (!stof (infokey (world, "adminlevel")))
																																			{
																																				sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																				self.impulse = RANGE_MELEE;
																																				return;
																																			}
																																		}
																																		if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																		{
																																			sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																			self.impulse = RANGE_MELEE;
																																			return;
																																		}
																																		OverTimeUp (SBAR_GRENS);
																																		self.impulse = RANGE_MELEE;
																																		return;
																																	}
																																	else
																																	{
																																		if ((self.impulse == 202))
																																		{
																																			if ((self.is_admin != AS_MELEE))
																																			{
																																				if (!stof (infokey (world, "adminlevel")))
																																				{
																																					sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																					self.impulse = RANGE_MELEE;
																																					return;
																																				}
																																			}
																																			if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																			{
																																				sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																				self.impulse = RANGE_MELEE;
																																				return;
																																			}
																																			pmtime = RANGE_MELEE;
																																			StartTimer ();
																																			self.impulse = RANGE_MELEE;
																																			return;
																																		}
																																		else
																																		{
																																			if ((self.impulse == 204))
																																			{
																																				if ((self.is_admin != AS_MELEE))
																																				{
																																					if (!stof (infokey (world, "adminlevel")))
																																					{
																																						sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																						self.impulse = RANGE_MELEE;
																																						return;
																																					}
																																				}
																																				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																				{
																																					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																					self.impulse = RANGE_MELEE;
																																					return;
																																				}
																																				FragsDown ();
																																				self.impulse = RANGE_MELEE;
																																				return;
																																			}
																																			else
																																			{
																																				if ((self.impulse == 205))
																																				{
																																					if ((self.is_admin != AS_MELEE))
																																					{
																																						if (!stof (infokey (world, "adminlevel")))
																																						{
																																							sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																							self.impulse = RANGE_MELEE;
																																							return;
																																						}
																																					}
																																					if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																					{
																																						sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																						self.impulse = RANGE_MELEE;
																																						return;
																																					}
																																					FragsUp ();
																																					self.impulse = RANGE_MELEE;
																																					return;
																																				}
																																				else
																																				{
																																					if ((self.impulse == 207))
																																					{
																																						if ((self.is_admin != AS_MELEE))
																																						{
																																							if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																							{
																																								sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																								self.impulse = RANGE_MELEE;
																																								return;
																																							}
																																						}
																																						ClanMode ();
																																						self.impulse = RANGE_MELEE;
																																						return;
																																					}
																																					else
																																					{
																																						if ((self.impulse == 208))
																																						{
																																							if ((self.is_admin != AS_MELEE))
																																							{
																																								if (!stof (infokey (world, "adminlevel")))
																																								{
																																									sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																									self.impulse = RANGE_MELEE;
																																									return;
																																								}
																																							}
																																							if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																							{
																																								sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																								self.impulse = RANGE_MELEE;
																																								return;
																																							}
																																							RestartMap ();
																																							self.impulse = RANGE_MELEE;
																																							return;
																																						}
																																						else
																																						{
																																							if ((self.impulse == 214))
																																							{
																																								if ((self.is_admin != AS_MELEE))
																																								{
																																									if (!stof (infokey (world, "adminlevel")))
																																									{
																																										sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																										self.impulse = RANGE_MELEE;
																																										return;
																																									}
																																								}
																																								if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																								{
																																									sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																									self.impulse = RANGE_MELEE;
																																									return;
																																								}
																																								ToggleSpecTalk ();
																																								self.impulse = RANGE_MELEE;
																																								return;
																																							}
																																							else
																																							{
																																								if ((self.impulse == 216))
																																								{
																																									if ((self.is_admin != AS_MELEE))
																																									{
																																										if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																										{
																																											sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																											self.impulse = RANGE_MELEE;
																																											return;
																																										}
																																									}
																																									Toggle_TFvsDM ();
																																									self.impulse = RANGE_MELEE;
																																									return;
																																								}
																																								else
																																								{
																																									if ((self.impulse == 94))
																																									{
																																										if ((self.is_admin != AS_MELEE))
																																										{
																																											if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																											{
																																												sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																												self.impulse = RANGE_MELEE;
																																												return;
																																											}
																																										}
																																										Toggle_Practice ();
																																										self.impulse = RANGE_MELEE;
																																										return;
																																									}
																																									else
																																									{
																																										if ((self.impulse == _Q))
																																										{
																																											if ((self.is_admin != AS_MELEE))
																																											{
																																												if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																												{
																																													sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																													self.impulse = RANGE_MELEE;
																																													return;
																																												}
																																											}
																																											Toggle_SpeedCap ();
																																											self.impulse = RANGE_MELEE;
																																											return;
																																										}
																																										else
																																										{
																																											if ((self.impulse == _P))
																																											{
																																												if ((self.is_admin != AS_MELEE))
																																												{
																																													if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																													{
																																														sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																														self.impulse = RANGE_MELEE;
																																														return;
																																													}
																																												}
																																												Toggle_Duel ();
																																												self.impulse = RANGE_MELEE;
																																												return;
																																											}
																																											else
																																											{
																																												if ((self.impulse == _O))
																																												{
																																													if ((self.is_admin != AS_MELEE))
																																													{
																																														if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																														{
																																															sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																															self.impulse = RANGE_MELEE;
																																															return;
																																														}
																																													}
																																													Toggle_Rounds ();
																																													self.impulse = RANGE_MELEE;
																																													return;
																																												}
																																												else
																																												{
																																													if ((self.impulse == _N))
																																													{
																																														if ((self.is_admin != AS_MELEE))
																																														{
																																															if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																															{
																																																sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																self.impulse = RANGE_MELEE;
																																																return;
																																															}
																																														}
																																														Toggle_TFStrike ();
																																														self.impulse = RANGE_MELEE;
																																														return;
																																													}
																																													else
																																													{
																																														if ((self.impulse == 220))
																																														{
																																															if ((self.is_admin != AS_MELEE))
																																															{
																																																if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																{
																																																	sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																	self.impulse = RANGE_MELEE;
																																																	return;
																																																}
																																															}
																																															if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																															{
																																																sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																self.impulse = RANGE_MELEE;
																																																return;
																																															}
																																															ResetSetup ();
																																															self.impulse = RANGE_MELEE;
																																															return;
																																														}
																																														else
																																														{
																																															if ((self.impulse == 221))
																																															{
																																																if ((self.is_admin != AS_MELEE))
																																																{
																																																	if (!stof (infokey (world, "adminlevel")))
																																																	{
																																																		sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																																		self.impulse = RANGE_MELEE;
																																																		return;
																																																	}
																																																}
																																																Toggle_Teamfrags ();
																																																self.impulse = RANGE_MELEE;
																																																return;
																																															}
																																															else
																																															{
																																																if ((self.impulse == 222))
																																																{
																																																	if ((self.is_admin != AS_MELEE))
																																																	{
																																																		if (!stof (infokey (world, "adminlevel")))
																																																		{
																																																			sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																																			self.impulse = RANGE_MELEE;
																																																			return;
																																																		}
																																																	}
																																																	Toggle_Fullts ();
																																																	self.impulse = RANGE_MELEE;
																																																	return;
																																																}
																																																else
																																																{
																																																	if ((self.impulse == 223))
																																																	{
																																																		if ((self.is_admin != AS_MELEE))
																																																		{
																																																			if (!stof (infokey (world, "adminlevel")))
																																																			{
																																																				sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																																				self.impulse = RANGE_MELEE;
																																																				return;
																																																			}
																																																		}
																																																		Toggle_Grapple ();
																																																		self.impulse = RANGE_MELEE;
																																																		return;
																																																	}
																																																	else
																																																	{
																																																		if ((self.impulse == 217))
																																																		{
																																																			if ((self.is_admin != AS_MELEE))
																																																			{
																																																				if (!stof (infokey (world, "adminlevel")))
																																																				{
																																																					sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																																					self.impulse = RANGE_MELEE;
																																																					return;
																																																				}
																																																			}
																																																			ToggleFlash ();
																																																			self.impulse = RANGE_MELEE;
																																																			return;
																																																		}
																																																		else
																																																		{
																																																			if ((self.impulse == 224))
																																																			{
																																																				if ((self.is_admin != AS_MELEE))
																																																				{
																																																					if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																					{
																																																						sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																						self.impulse = RANGE_MELEE;
																																																						return;
																																																					}
																																																				}
																																																				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																				{
																																																					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																					self.impulse = RANGE_MELEE;
																																																					return;
																																																				}
																																																				ClanSetup ();
																																																				self.impulse = RANGE_MELEE;
																																																				return;
																																																			}
																																																			else
																																																			{
																																																				if ((self.impulse == 230))
																																																				{
																																																					if ((self.is_admin != AS_MELEE))
																																																					{
																																																						if (!stof (infokey (world, "adminlevel")))
																																																						{
																																																							sprint (self, SBAR_PRINT, "Admins are not allowed on this server.\n");
																																																							self.impulse = RANGE_MELEE;
																																																							return;
																																																						}
																																																					}
																																																					if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																					{
																																																						sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																						self.impulse = RANGE_MELEE;
																																																						return;
																																																					}
																																																					Toggle_Gibs ();
																																																					self.impulse = RANGE_MELEE;
																																																					return;
																																																				}
																																																				else
																																																				{
																																																					if ((self.impulse == 193))
																																																					{
																																																						if ((self.is_admin != AS_MELEE))
																																																						{
																																																							if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																							{
																																																								sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																								self.impulse = RANGE_MELEE;
																																																								return;
																																																							}
																																																						}
																																																						Admin_CeaseFire ();
																																																						self.impulse = RANGE_MELEE;
																																																						return;
																																																					}
																																																					else
																																																					{
																																																						if ((self.impulse == 215))
																																																						{
																																																							if ((self.is_admin != AS_MELEE))
																																																							{
																																																								if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																								{
																																																									sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																									self.impulse = RANGE_MELEE;
																																																									return;
																																																								}
																																																							}
																																																							if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																							{
																																																								sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																								self.impulse = RANGE_MELEE;
																																																								return;
																																																							}
																																																							ToggleFreeze ();
																																																							self.impulse = RANGE_MELEE;
																																																							return;
																																																						}
																																																						else
																																																						{
																																																							if ((self.impulse == 231))
																																																							{
																																																								if ((self.is_admin != AS_MELEE))
																																																								{
																																																									if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																									{
																																																										sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																										self.impulse = RANGE_MELEE;
																																																										return;
																																																									}
																																																								}
																																																								Toggle_Highlander ();
																																																								self.impulse = RANGE_MELEE;
																																																								return;
																																																							}
																																																							else
																																																							{
																																																								if ((self.impulse == 206))
																																																								{
																																																									if ((self.is_admin != AS_MELEE))
																																																									{
																																																										if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																										{
																																																											sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																											self.impulse = RANGE_MELEE;
																																																											return;
																																																										}
																																																									}
																																																									if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																									{
																																																										sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																										self.impulse = RANGE_MELEE;
																																																										return;
																																																									}
																																																									ChangeTP ();
																																																									self.impulse = RANGE_MELEE;
																																																									return;
																																																								}
																																																								else
																																																								{
																																																									if ((self.impulse == 213))
																																																									{
																																																										if ((self.is_admin != AS_MELEE))
																																																										{
																																																											if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																											{
																																																												sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																												self.impulse = RANGE_MELEE;
																																																												return;
																																																											}
																																																										}
																																																										if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																										{
																																																											sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																											self.impulse = RANGE_MELEE;
																																																											return;
																																																										}
																																																										GroundSpeed ();
																																																										self.impulse = RANGE_MELEE;
																																																										return;
																																																									}
																																																									else
																																																									{
																																																										if ((self.impulse == 233))
																																																										{
																																																											if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																											{
																																																												sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																												self.impulse = RANGE_MELEE;
																																																												return;
																																																											}
																																																											if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																											{
																																																												sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																												self.impulse = RANGE_MELEE;
																																																												return;
																																																											}
																																																											Toggle_Grenpacks ();
																																																											self.impulse = RANGE_MELEE;
																																																											return;
																																																										}
																																																										else
																																																										{
																																																											if ((self.impulse == 225))
																																																											{
																																																												if ((self.is_admin != AS_MELEE))
																																																												{
																																																													if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																													{
																																																														sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																														self.impulse = RANGE_MELEE;
																																																														return;
																																																													}
																																																												}
																																																												if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																												{
																																																													sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																													self.impulse = RANGE_MELEE;
																																																													return;
																																																												}
																																																												ToggleFbskins ();
																																																												self.impulse = RANGE_MELEE;
																																																												return;
																																																											}
																																																											else
																																																											{
																																																												if ((self.impulse == 226))
																																																												{
																																																													if ((self.is_admin != AS_MELEE))
																																																													{
																																																														if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																														{
																																																															sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																															self.impulse = RANGE_MELEE;
																																																															return;
																																																														}
																																																													}
																																																													if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																													{
																																																														sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																														self.impulse = RANGE_MELEE;
																																																														return;
																																																													}
																																																													ToggleEnemy ();
																																																													self.impulse = RANGE_MELEE;
																																																													return;
																																																												}
																																																												else
																																																												{
																																																													if ((self.impulse == 227))
																																																													{
																																																														if ((self.is_admin != AS_MELEE))
																																																														{
																																																															if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																															{
																																																																sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																self.impulse = RANGE_MELEE;
																																																																return;
																																																															}
																																																														}
																																																														if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																														{
																																																															sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																															self.impulse = RANGE_MELEE;
																																																															return;
																																																														}
																																																														TogglePointing ();
																																																														self.impulse = RANGE_MELEE;
																																																														return;
																																																													}
																																																													else
																																																													{
																																																														if ((self.impulse == 235))
																																																														{
																																																															if ((self.is_admin != AS_MELEE))
																																																															{
																																																																if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																{
																																																																	sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																	self.impulse = RANGE_MELEE;
																																																																	return;
																																																																}
																																																															}
																																																															if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																															{
																																																																sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																																self.impulse = RANGE_MELEE;
																																																																return;
																																																															}
																																																															Toggle_Detpack ();
																																																															self.impulse = RANGE_MELEE;
																																																															return;
																																																														}
																																																														else
																																																														{
																																																															if ((self.impulse == 236))
																																																															{
																																																																if ((self.is_admin != AS_MELEE))
																																																																{
																																																																	if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																	{
																																																																		sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																		self.impulse = RANGE_MELEE;
																																																																		return;
																																																																	}
																																																																}
																																																																Toggle_flag_emu ();
																																																																self.impulse = RANGE_MELEE;
																																																																return;
																																																															}
																																																															else
																																																															{
																																																																if ((self.impulse == 232))
																																																																{
																																																																	if ((self.is_admin != AS_MELEE))
																																																																	{
																																																																		if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																		{
																																																																			sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																			self.impulse = RANGE_MELEE;
																																																																			return;
																																																																		}
																																																																	}
																																																																	if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																																	{
																																																																		sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																																		self.impulse = RANGE_MELEE;
																																																																		return;
																																																																	}
																																																																	Toggle_SentryType ();
																																																																	self.impulse = RANGE_MELEE;
																																																																	return;
																																																																}
																																																																else
																																																																{
																																																																	if ((self.impulse == 191))
																																																																	{
																																																																		if ((self.is_admin != AS_MELEE))
																																																																		{
																																																																			if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																			{
																																																																				sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																				self.impulse = RANGE_MELEE;
																																																																				return;
																																																																			}
																																																																		}
																																																																		if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																																		{
																																																																			sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																																			self.impulse = RANGE_MELEE;
																																																																			return;
																																																																		}
																																																																		Toggle_SentryFire ();
																																																																		self.impulse = RANGE_MELEE;
																																																																		return;
																																																																	}
																																																																	else
																																																																	{
																																																																		if ((self.impulse == 234))
																																																																		{
																																																																			if ((self.is_admin != AS_MELEE))
																																																																			{
																																																																				if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																				{
																																																																					sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																					self.impulse = RANGE_MELEE;
																																																																					return;
																																																																				}
																																																																			}
																																																																			if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																																			{
																																																																				sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																																				self.impulse = RANGE_MELEE;
																																																																				return;
																																																																			}
																																																																			Toggle_PipeDelay ();
																																																																			self.impulse = RANGE_MELEE;
																																																																			return;
																																																																		}
																																																																		else
																																																																		{
																																																																			if ((self.impulse == 238))
																																																																			{
																																																																				if ((self.is_admin != AS_MELEE))
																																																																				{
																																																																					if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																																																																					{
																																																																						sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																																																																						self.impulse = RANGE_MELEE;
																																																																						return;
																																																																					}
																																																																				}
																																																																				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																																																																				{
																																																																					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																																																																					self.impulse = RANGE_MELEE;
																																																																					return;
																																																																				}
																																																																				Toggle_Frj ();
																																																																				self.impulse = RANGE_MELEE;
																																																																				return;
																																																																			}
																																																																		}
																																																																	}
																																																																}
																																																															}
																																																														}
																																																													}
																																																												}
																																																											}
																																																										}
																																																									}
																																																								}
																																																							}
																																																						}
																																																					}
																																																				}
																																																			}
																																																		}
																																																	}
																																																}
																																															}
																																														}
																																													}
																																												}
																																											}
																																										}
																																									}
																																								}
																																							}
																																						}
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

float () PreMatchImpulses =
{
	if ((tfvsdm == SBAR_GRENS))
	{
		if (((self.team_no == SBAR_GRENS) || (self.team_no == AS_MELEE)))
		{
			if (((self.impulse == 8) && (self.current_menu != 6)))
			{
				self.current_menu = 6;
				self.menu_count = 25;
				self.menu_displaytime = RANGE_MELEE;
				self.impulse = RANGE_MELEE;
				return (SBAR_GRENS);
			}
		}
	}
	else
	{
		if (((self.impulse == 8) && (self.current_menu != 6)))
		{
			self.current_menu = 6;
			self.menu_count = 25;
			self.menu_displaytime = RANGE_MELEE;
			self.impulse = RANGE_MELEE;
			return (SBAR_GRENS);
		}
	}
	if ((((self.impulse >= SBAR_GRENS) && (self.impulse < 9)) || (self.impulse == COLOR_RED)))
	{
		W_ChangeWeapon ();
		self.impulse = RANGE_MELEE;
		return (SBAR_GRENS);
	}
	else
	{
		if ((allow_hook && ((self.impulse == SBAR_300) || (self.impulse == 39))))
		{
			W_ChangeWeapon ();
			self.impulse = RANGE_MELEE;
			return (SBAR_GRENS);
		}
		else
		{
			if ((self.impulse == 40))
			{
				W_ChangeWeapon ();
				self.impulse = RANGE_MELEE;
				return (SBAR_GRENS);
			}
			else
			{
				if ((self.impulse == enter))
				{
					CycleWeaponCommand ();
					self.impulse = RANGE_MELEE;
					return (SBAR_GRENS);
				}
			}
		}
	}
	if ((self.impulse == redlamp))
	{
		TeamFortress_Inventory ();
		self.impulse = RANGE_MELEE;
		return (SBAR_GRENS);
	}
	else
	{
		if ((self.impulse == 185))
		{
			TeamFortress_ID ();
			self.impulse = RANGE_MELEE;
			return (SBAR_GRENS);
		}
		else
		{
			if ((self.impulse == 23))
			{
				if ((CTF_Map == SBAR_GRENS))
				{
					TeamFortress_CTF_FlagInfo ();
				}
				else
				{
					TeamFortress_DisplayDetectionItems ();
				}
				self.impulse = RANGE_MELEE;
				return (SBAR_GRENS);
			}
			else
			{
				if ((self.impulse == _v))
				{
					display_location ();
					self.impulse = RANGE_MELEE;
					return (SBAR_GRENS);
				}
			}
		}
	}
};

float () DeadImpulses =
{
	local string st;

	if ((self.impulse == yellowlamp))
	{
		TeamFortress_ShowTF ();
		self.impulse = RANGE_MELEE;
		return (SBAR_GRENS);
	}
	else
	{
		if ((self.impulse == 174))
		{
			TeamFortress_AutoZoomToggle ();
			self.impulse = RANGE_MELEE;
			return (SBAR_GRENS);
		}
		else
		{
			if ((self.impulse == bluelamp))
			{
				TeamFortress_DisplayLegalClasses ();
				self.impulse = RANGE_MELEE;
				return (SBAR_GRENS);
			}
			else
			{
				if (((self.impulse > _d) && (self.impulse <= (_d + SBAR_200))))
				{
					TeamFortress_ChangeClass ((self.impulse - _d));
					self.impulse = RANGE_MELEE;
					return (SBAR_GRENS);
				}
				else
				{
					if (((self.playerclass && (self.impulse == _c)) && !cb_prematch))
					{
						self.current_menu = 20;
						self.menu_count = 25;
						self.impulse = RANGE_MELEE;
						return (SBAR_GRENS);
					}
					else
					{
						if ((self.impulse == _G))
						{
							self.last_impulse = self.impulse;
							return (SBAR_GRENS);
						}
					}
				}
			}
		}
	}
	if ((self.impulse == 131))
	{
		TeamFortress_HelpMap ();
		self.impulse = RANGE_MELEE;
		return (SBAR_GRENS);
	}
	else
	{
		if ((self.impulse == _w))
		{
			TeamFortress_StatusQuery ();
			self.impulse = RANGE_MELEE;
			return (SBAR_GRENS);
		}
		else
		{
			if ((self.impulse == 140))
			{
				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
				{
					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
					self.impulse = RANGE_MELEE;
					return (SBAR_GRENS);
				}
				TeamFortress_TeamSet (SBAR_GRENS);
				self.impulse = RANGE_MELEE;
				return (SBAR_GRENS);
			}
			else
			{
				if ((self.impulse == 141))
				{
					if (((clanbattle == SBAR_GRENS) && !cb_prematch))
					{
						sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
						self.impulse = RANGE_MELEE;
						return (SBAR_GRENS);
					}
					TeamFortress_TeamSet (SBAR_PRINT);
					self.impulse = RANGE_MELEE;
					return (SBAR_GRENS);
				}
				else
				{
					if ((self.impulse == 142))
					{
						if (((clanbattle == SBAR_GRENS) && !cb_prematch))
						{
							sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
							self.impulse = RANGE_MELEE;
							return (SBAR_GRENS);
						}
						TeamFortress_TeamSet (AS_MELEE);
						self.impulse = RANGE_MELEE;
						return (SBAR_GRENS);
					}
					else
					{
						if ((self.impulse == 143))
						{
							if (((clanbattle == SBAR_GRENS) && !cb_prematch))
							{
								sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
								self.impulse = RANGE_MELEE;
								return (SBAR_GRENS);
							}
							TeamFortress_TeamSet (AS_MISSILE);
							self.impulse = RANGE_MELEE;
							return (SBAR_GRENS);
						}
						else
						{
							if ((self.impulse == 145))
							{
								TeamFortress_TeamShowScores (RANGE_MELEE);
								self.impulse = RANGE_MELEE;
								return (SBAR_GRENS);
							}
							else
							{
								if ((self.impulse == 144))
								{
									TeamFortress_TeamShowMemberClasses (self);
									self.impulse = RANGE_MELEE;
									return (SBAR_GRENS);
								}
								else
								{
									if (((self.playerclass == SBAR_GRENS) && (self.impulse == 159)))
									{
										ScannerSwitch ();
										self.impulse = RANGE_MELEE;
										return (SBAR_GRENS);
									}
									else
									{
										if (((self.playerclass == SBAR_GRENS) && (self.impulse == 162)))
										{
											sprint (self, SBAR_PRINT, "Scanner sound: ");
											if ((self.tf_items_flags & AS_MISSILE))
											{
												self.tf_items_flags = (self.tf_items_flags - AS_MISSILE);
												sprint (self, SBAR_PRINT, "Off\n");
											}
											else
											{
												self.tf_items_flags = (self.tf_items_flags | AS_MISSILE);
												sprint (self, SBAR_PRINT, "On\n");
											}
											self.impulse = RANGE_MELEE;
											return (SBAR_GRENS);
										}
										else
										{
											if (((self.playerclass == SBAR_GRENS) && (self.impulse == 160)))
											{
												sprint (self, SBAR_PRINT, "Scanning for: ");
												if ((self.tf_items_flags & SBAR_GRENS))
												{
													self.tf_items_flags = (self.tf_items_flags - SBAR_GRENS);
													if ((self.tf_items_flags & SBAR_PRINT))
													{
														sprint (self, SBAR_PRINT, "Friendlies Only.\n");
													}
													else
													{
														sprint (self, SBAR_PRINT, "Nothing\n");
													}
												}
												else
												{
													self.tf_items_flags = (self.tf_items_flags | SBAR_GRENS);
													if ((self.tf_items_flags & SBAR_PRINT))
													{
														sprint (self, SBAR_PRINT, "Friendlies && Enemies\n");
													}
													else
													{
														sprint (self, SBAR_PRINT, "Enemies Only\n");
													}
												}
												self.impulse = RANGE_MELEE;
												return (SBAR_GRENS);
											}
											else
											{
												if (((self.playerclass == SBAR_GRENS) && (self.impulse == 161)))
												{
													sprint (self, SBAR_PRINT, "Scanning for: ");
													if ((self.tf_items_flags & SBAR_PRINT))
													{
														self.tf_items_flags = (self.tf_items_flags - SBAR_PRINT);
														if ((self.tf_items_flags & SBAR_GRENS))
														{
															sprint (self, SBAR_PRINT, "Enemies Only.\n");
														}
														else
														{
															sprint (self, SBAR_PRINT, "Nothing\n");
														}
													}
													else
													{
														self.tf_items_flags = (self.tf_items_flags | SBAR_PRINT);
														if ((self.tf_items_flags & SBAR_GRENS))
														{
															sprint (self, SBAR_PRINT, "Friendlies && Enemies\n");
														}
														else
														{
															sprint (self, SBAR_PRINT, "Friendlies Only\n");
														}
													}
													self.impulse = RANGE_MELEE;
													return (SBAR_GRENS);
												}
												else
												{
													if ((self.impulse == 182))
													{
														st = infokey (self, "sbs");
														if ((st == string_null))
														{
															st = infokey (self, "sbar_size");
														}
														self.StatusBarSize = stof (st);
														if (((self.StatusBarSize > enter) || (self.StatusBarSize < SBAR_GRENS)))
														{
															self.StatusBarSize = AS_MELEE;
														}
														StatusBar_On ();
														self.impulse = RANGE_MELEE;
														return (SBAR_GRENS);
													}
													else
													{
														if ((self.impulse == 183))
														{
															self.StatusBarSize = RANGE_MELEE;
															StatusBar_On ();
															self.impulse = RANGE_MELEE;
															return (SBAR_GRENS);
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void () W_WeaponFrame =
{
	local vector tv;
	local string st;

	if (!(self.tfstate & 2048))
	{
		if (((self.height > 29) && (self.height < self.oldheight)))
		{
			self.height = (self.height + 8);
			if ((self.height > self.oldheight))
			{
				self.height = self.oldheight;
			}
			TF_zoom (self.height);
		}
	}
	if (round_active)
	{
		st = GetTeamName (self.team_no);
		if ((st == "observe"))
		{
			if ((self.playerclass || self.deadflag))
			{
				return;
			}
			if (self.last_impulse)
			{
				if (self.impulse)
				{
					if ((self.last_impulse == _G))
					{
						StatusRes (self.impulse);
						self.impulse = RANGE_MELEE;
						return;
					}
				}
			}
			if (self.impulse)
			{
				if (DeadImpulses ())
				{
					return;
				}
				CommandImpulses ();
				self.impulse = RANGE_MELEE;
			}
			return;
		}
	}
	if ((self.current_menu > RANGE_MELEE))
	{
		Player_Menu ();
		if (((self.impulse > RANGE_MELEE) && (((self.current_menu == 21) || (self.current_menu == SBAR_300)) || (self.current_menu == 23))))
		{
			Menu_Input (self.impulse);
		}
		else
		{
			if (((self.impulse > RANGE_MELEE) && (self.impulse < SBAR_200)))
			{
				Menu_Input (self.impulse);
				if ((self.impulse != RANGE_MELEE))
				{
					if (((self.team_no == RANGE_MELEE) && teamplay))
					{
						Menu_Team_Input (self.impulse);
					}
					else
					{
						if (!self.playerclass)
						{
							if (round_active)
							{
								return;
							}
							Menu_Class_Input (self.impulse);
						}
					}
				}
			}
		}
	}
	if (((self.current_weapon == 32768) || (self.current_weapon == 8)))
	{
		if ((time < self.attack_finished))
		{
			return;
		}
	}
	if (((self.impulse != RANGE_MELEE) && (self.has_disconnected == RANGE_MELEE)))
	{
		ImpulseCommands ();
	}
	if ((time < self.attack_finished))
	{
		return;
	}
	if (cease_fire)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((((self.is_building != RANGE_MELEE) || (self.is_detpacking != RANGE_MELEE)) || (self.is_feigning != RANGE_MELEE)))
	{
		return;
	}
	if (((!self.button0 && self.fire_held_down) && (self.current_weapon == 32768)))
	{
		self.fire_held_down = RANGE_MELEE;
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		player_run ();
		return;
	}
	if ((self.button0 && !self.fire_held_down))
	{
		if (((self.current_menu == 6) || (self.current_menu == 7)))
		{
			self.current_menu = 8;
			self.menu_count = 25;
			Attack_Finished (0.2);
		}
		else
		{
			if ((self.current_weapon == space))
			{
				if ((self.tfstate & 2048))
				{
					if ((self.heat < 400))
					{
						self.heat = (self.heat + AS_MELEE);
					}
					if ((self.height > 30))
					{
						self.height = (self.height - 5);
						TF_zoom (self.height);
					}
				}
				else
				{
					tv = self.velocity;
					tv_z = RANGE_MELEE;
					if ((vlen (tv) <= _2))
					{
						SniperSight_Create ();
						self.heat = _2;
						self.height = self.oldheight;
						self.tfstate = (self.tfstate | 2048);
						TeamFortress_SetSpeed (self);
					}
				}
			}
			else
			{
				if ((self.current_weapon == 32768))
				{
					if ((self.flags & 512))
					{
						SuperDamageSound ();
						W_Attack ();
					}
				}
				else
				{
					SuperDamageSound ();
					W_Attack ();
				}
			}
		}
	}
	else
	{
		if (!self.playerclass)
		{
			self.weaponmode = RANGE_MELEE;
		}
		else
		{
			if ((self.tfstate & 2048))
			{
				if ((self.current_weapon != 32768))
				{
					W_Attack ();
				}
				self.tfstate = (self.tfstate - 2048);
				TeamFortress_SetSpeed (self);
				self.heat = RANGE_MELEE;
			}
		}
	}
};

void () SuperDamageSound =
{
	if ((self.super_damage_finished > time))
	{
		if ((self.super_sound < time))
		{
			self.super_sound = (time + SBAR_GRENS);
			sound (self, AS_MISSILE, "items/damage3.wav", SBAR_GRENS, SBAR_GRENS);
		}
	}
	return;
};

void () RemoveGrenade =
{
	local entity te;

	if ((self.no_active_napalm_grens > RANGE_MELEE))
	{
		self.no_active_napalm_grens = RANGE_MELEE;
		self.owner.no_active_napalm_grens = (self.owner.no_active_napalm_grens - SBAR_GRENS);
		if ((self.owner.no_active_napalm_grens < RANGE_MELEE))
		{
			self.owner.no_active_napalm_grens = RANGE_MELEE;
		}
		te = find (world, classname, "grentimer");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_napalm_grens > RANGE_MELEE)))
			{
				te.no_active_napalm_grens = (te.no_active_napalm_grens - SBAR_GRENS);
			}
			te = find (te, classname, "grentimer");
		}
		dremove (self.enemy);
		dremove (self);
	}
	if ((self.no_active_gas_grens > RANGE_MELEE))
	{
		self.no_active_gas_grens = RANGE_MELEE;
		self.owner.no_active_gas_grens = (self.owner.no_active_gas_grens - SBAR_GRENS);
		if ((self.owner.no_active_gas_grens < RANGE_MELEE))
		{
			self.owner.no_active_gas_grens = RANGE_MELEE;
		}
		te = find (world, classname, "grentimer");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_gas_grens > RANGE_MELEE)))
			{
				te.no_active_gas_grens = (te.no_active_gas_grens - SBAR_GRENS);
			}
			te = find (te, classname, "grentimer");
		}
		dremove (self);
	}
};
void () Sentry_Rotate;
void () InitBodyQue;

void () Eluminate =
{
	lights = SBAR_GRENS;
	lightstyle (RANGE_MELEE, "m");
	lightstyle (SBAR_GRENS, "mmnmmommommnonmmonqnmmo");
	lightstyle (SBAR_PRINT, "abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba");
	lightstyle (AS_MELEE, "mmmmmaaaaammmmmaaaaaabcdefgabcdefg");
	lightstyle (AS_MISSILE, "mamamamamama");
	lightstyle (5, "jklmnopqrstuvwxyzyxwvutsrqponmlkj");
	lightstyle (6, "nmonqnmomnmomomno");
	lightstyle (7, "mmmaaaabcdefgmmmmaaaammmaamm");
	lightstyle (8, "mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa");
	lightstyle (9, "aaaaaaaazzzzzzzz");
	lightstyle (enter, "mmamammmmammamamaaamammma");
	lightstyle (SBAR_200, "abcdefghijklmnopqrrqponmlkjihgfedcba");
	lightstyle (63, "a");
};

void () Deluminate =
{
	lights = RANGE_MELEE;
	lightstyle (RANGE_MELEE, "a");
	lightstyle (SBAR_GRENS, "a");
	lightstyle (SBAR_PRINT, "a");
	lightstyle (AS_MELEE, "a");
	lightstyle (AS_MISSILE, "a");
	lightstyle (5, "a");
	lightstyle (6, "a");
	lightstyle (7, "a");
	lightstyle (8, "a");
	lightstyle (9, "a");
	lightstyle (enter, "a");
	lightstyle (SBAR_200, "a");
	lightstyle (63, "a");
};

void () main =
{
	precache_file ("progs.dat");
	precache_file ("gfx.wad");
	precache_file ("quake.rc");
	precache_file ("default.cfg");
	precache_file ("end1.bin");
	precache_file2 ("end2.bin");
	precache_file ("demo1.dem");
	precache_file ("demo2.dem");
	precache_file ("demo3.dem");
	precache_file ("gfx/palette.lmp");
	precache_file ("gfx/colormap.lmp");
	precache_file2 ("gfx/pop.lmp");
	precache_file ("gfx/complete.lmp");
	precache_file ("gfx/inter.lmp");
	precache_file ("gfx/ranking.lmp");
	precache_file ("gfx/vidmodes.lmp");
	precache_file ("gfx/finale.lmp");
	precache_file ("gfx/conback.lmp");
	precache_file ("gfx/qplaque.lmp");
	precache_file ("gfx/menudot1.lmp");
	precache_file ("gfx/menudot2.lmp");
	precache_file ("gfx/menudot3.lmp");
	precache_file ("gfx/menudot4.lmp");
	precache_file ("gfx/menudot5.lmp");
	precache_file ("gfx/menudot6.lmp");
	precache_file ("gfx/menuplyr.lmp");
	precache_file ("gfx/bigbox.lmp");
	precache_file ("gfx/dim_modm.lmp");
	precache_file ("gfx/dim_drct.lmp");
	precache_file ("gfx/dim_ipx.lmp");
	precache_file ("gfx/dim_tcp.lmp");
	precache_file ("gfx/dim_mult.lmp");
	precache_file ("gfx/mainmenu.lmp");
	precache_file ("gfx/box_tl.lmp");
	precache_file ("gfx/box_tm.lmp");
	precache_file ("gfx/box_tr.lmp");
	precache_file ("gfx/box_ml.lmp");
	precache_file ("gfx/box_mm.lmp");
	precache_file ("gfx/box_mm2.lmp");
	precache_file ("gfx/box_mr.lmp");
	precache_file ("gfx/box_bl.lmp");
	precache_file ("gfx/box_bm.lmp");
	precache_file ("gfx/box_br.lmp");
	precache_file ("gfx/sp_menu.lmp");
	precache_file ("gfx/ttl_sgl.lmp");
	precache_file ("gfx/ttl_main.lmp");
	precache_file ("gfx/ttl_cstm.lmp");
	precache_file ("gfx/mp_menu.lmp");
	precache_file ("gfx/netmen1.lmp");
	precache_file ("gfx/netmen2.lmp");
	precache_file ("gfx/netmen3.lmp");
	precache_file ("gfx/netmen4.lmp");
	precache_file ("gfx/netmen5.lmp");
	precache_file ("gfx/sell.lmp");
	precache_file ("gfx/help0.lmp");
	precache_file ("gfx/help1.lmp");
	precache_file ("gfx/help2.lmp");
	precache_file ("gfx/help3.lmp");
	precache_file ("gfx/help4.lmp");
	precache_file ("gfx/help5.lmp");
	precache_file ("gfx/pause.lmp");
	precache_file ("gfx/loading.lmp");
	precache_file ("gfx/p_option.lmp");
	precache_file ("gfx/p_load.lmp");
	precache_file ("gfx/p_save.lmp");
	precache_file ("gfx/p_multi.lmp");
	precache_sound ("misc/menu1.wav");
	precache_sound ("misc/menu2.wav");
	precache_sound ("misc/menu3.wav");
	precache_sound ("ambience/water1.wav");
	precache_sound ("ambience/wind2.wav");
	precache_file2 ("gfx/pop.lmp");
};
entity lastspawn;

void () worldspawn =
{
	local string st;

	lastspawn = world;
	number_of_teams = RANGE_MELEE;
	InitBodyQue ();
	if ((self.model == "maps/e1m8.bsp"))
	{
		cvar_set ("sv_gravity", "100");
	}
	else
	{
		cvar_set ("sv_gravity", "800");
	}
	cvar_set ("pausable", "0");
	cvar_set ("sv_friction", "6");
	cvar_set ("sv_waterfriction", "1");
	st = infokey (world, "exec_map_cfgs");
	if ((st == "on"))
	{
		st = infokey (world, "cycledir");
		if ((st != string_null))
		{
			localcmd ("exec ");
			localcmd (st);
			localcmd ("/");
		}
		else
		{
			localcmd ("exec qwmcycle/");
		}
		localcmd (mapname);
		localcmd (".cfg\n");
	}
	W_Precache ();
	precache_sound ("demon/dland2.wav");
	precache_sound ("misc/h2ohit1.wav");
	precache_sound ("items/itembk2.wav");
	precache_sound ("player/plyrjmp8.wav");
	precache_sound ("player/land.wav");
	precache_sound ("player/land2.wav");
	precache_sound ("player/drown1.wav");
	precache_sound ("player/drown2.wav");
	precache_sound ("player/gasp1.wav");
	precache_sound ("player/gasp2.wav");
	precache_sound ("player/h2odeath.wav");
	precache_sound ("misc/talk.wav");
	precache_sound ("player/teledth1.wav");
	precache_sound ("misc/r_tele1.wav");
	precache_sound ("misc/r_tele2.wav");
	precache_sound ("misc/r_tele3.wav");
	precache_sound ("misc/r_tele4.wav");
	precache_sound ("misc/r_tele5.wav");
	precache_sound ("weapons/lock4.wav");
	precache_sound ("weapons/pkup.wav");
	precache_sound ("items/armor1.wav");
	precache_sound ("weapons/lhit.wav");
	precache_sound ("weapons/lstart.wav");
	precache_sound ("items/damage3.wav");
	precache_sound ("misc/power.wav");
	precache_sound ("player/gib.wav");
	precache_sound ("player/udeath.wav");
	precache_sound ("player/tornoff2.wav");
	precache_sound ("player/pain1.wav");
	precache_sound ("player/pain2.wav");
	precache_sound ("player/pain3.wav");
	precache_sound ("player/pain4.wav");
	precache_sound ("player/pain5.wav");
	precache_sound ("player/pain6.wav");
	precache_sound ("player/death1.wav");
	precache_sound ("player/death2.wav");
	precache_sound ("player/death3.wav");
	precache_sound ("player/death4.wav");
	precache_sound ("player/death5.wav");
	precache_sound ("boss1/sight1.wav");
	precache_sound ("weapons/ax1.wav");
	precache_sound ("player/axhit1.wav");
	precache_sound ("player/axhit2.wav");
	precache_sound ("player/h2ojump.wav");
	precache_sound ("player/slimbrn2.wav");
	precache_sound ("player/inh2o.wav");
	precache_sound ("player/inlava.wav");
	precache_sound ("misc/outwater.wav");
	precache_sound ("player/lburn1.wav");
	precache_sound ("player/lburn2.wav");
	precache_sound ("misc/water1.wav");
	precache_sound ("misc/water2.wav");
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	precache_sound ("speech/ctwin.wav");
	precache_sound ("speech/terwin.wav");
	precache_model ("progs/player.mdl");
	precache_model ("progs/eyes.mdl");
	precache_model ("progs/h_player.mdl");
	precache_model ("progs/gib1.mdl");
	precache_model ("progs/gib2.mdl");
	precache_model ("progs/gib3.mdl");
	precache_model ("progs/s_bubble.spr");
	precache_model ("progs/s_explod.spr");
	precache_model ("progs/v_axe.mdl");
	precache_model ("progs/v_shot.mdl");
	precache_model ("progs/v_nail.mdl");
	precache_model ("progs/v_rock.mdl");
	precache_model ("progs/v_shot2.mdl");
	precache_model ("progs/v_nail2.mdl");
	precache_model ("progs/v_rock2.mdl");
	precache_model ("progs/grenade.mdl");
	precache_model ("progs/bolt.mdl");
	precache_model ("progs/bolt2.mdl");
	precache_model ("progs/bolt3.mdl");
	precache_model ("progs/lavaball.mdl");
	precache_model ("progs/missile.mdl");
	precache_model ("progs/spike.mdl");
	precache_model ("progs/s_spike.mdl");
	precache_model ("progs/backpack.mdl");
	precache_model ("progs/zom_gib.mdl");
	precache_model ("progs/v_light.mdl");
	precache_model2 ("progs/laser.mdl");
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("hknight/attack1.wav");
	precache_model2 ("progs/sight.spr");
	precache_model2 ("progs/dot1.spr");
	precache_model2 ("progs/dot2.spr");
	precache_model2 ("progs/dot3.spr");
	precache_model2 ("progs/dot4.spr");
	precache_model2 ("progs/caltrop.mdl");
	precache_model2 ("progs/cross1.mdl");
	precache_model2 ("progs/v_medi.mdl");
	precache_model2 ("progs/v_bio.mdl");
	precache_model2 ("progs/hgren2.mdl");
	precache_model2 ("progs/biggren.mdl");
	precache_model2 ("progs/flare.mdl");
	precache_model2 ("progs/v_srifle.mdl");
	precache_model2 ("progs/v_asscan.mdl");
	precache_model2 ("progs/detpack.mdl");
	precache_model2 ("progs/ammobox.mdl");
	precache_model2 ("progs/v_knife.mdl");
	precache_model2 ("progs/v_knife2.mdl");
	precache_model2 ("progs/v_span.mdl");
	precache_model2 ("progs/e_spike1.mdl");
	precache_model2 ("progs/e_spike2.mdl");
	precache_model2 ("progs/v_rail.mdl");
	precache_model2 ("progs/turrgun.mdl");
	precache_model2 ("progs/turrbase.mdl");
	precache_model2 ("progs/tgib1.mdl");
	precache_model2 ("progs/tgib2.mdl");
	precache_model2 ("progs/tgib3.mdl");
	precache_model2 ("progs/disp.mdl");
	precache_model2 ("progs/dgib1.mdl");
	precache_model2 ("progs/dgib2.mdl");
	precache_model2 ("progs/dgib3.mdl");
	precache_model2 ("progs/grenade2.mdl");
	precache_model2 ("progs/v_grap.mdl");
	precache_model2 ("progs/hook.mdl");
	precache_model2 ("progs/caltrop.mdl");
	precache_sound ("doors/baseuse.wav");
	precache_sound ("doors/medtry.wav");
	precache_sound2 ("speech/saveme1.wav");
	precache_sound2 ("speech/saveme2.wav");
	precache_model2 ("progs/detpack2.mdl");
	precache_model2 ("progs/grenade3.mdl");
	Eluminate ();
};

void () StartFrame =
{
	teamplay = cvar ("teamplay");
	timelimit = (cvar ("timelimit") * SBAR_600);
	fraglimit = cvar ("fraglimit");
	deathmatch = cvar ("deathmatch");
};
entity bodyque_head;

void () bodyque =
{
};

void () InitBodyQue =
{
	local entity e;

	bodyque_head = spawn ();
	bodyque_head.classname = "bodyque";
	bodyque_head.owner = spawn ();
	bodyque_head.owner.classname = "bodyque";
	bodyque_head.owner.owner = spawn ();
	bodyque_head.owner.owner.classname = "bodyque";
	bodyque_head.owner.owner.owner = spawn ();
	bodyque_head.owner.owner.owner.classname = "bodyque";
	bodyque_head.owner.owner.owner.owner = bodyque_head;
};

void (entity ent) CopyToBodyQue =
{
	if (cb_prematch)
	{
		return;
	}
	bodyque_head.angles = ent.angles;
	bodyque_head.model = ent.model;
	bodyque_head.skin = ent.skin;
	bodyque_head.modelindex = ent.modelindex;
	bodyque_head.frame = ent.frame;
	bodyque_head.colormap = ent.colormap;
	bodyque_head.movetype = ent.movetype;
	bodyque_head.velocity = ent.velocity;
	bodyque_head.flags = RANGE_MELEE;
	setorigin (bodyque_head, ent.origin);
	setsize (bodyque_head, ent.mins, ent.maxs);
	bodyque_head = bodyque_head.owner;
};
void () player_pain;
void () player_stand1;
void (vector org) spawn_tfog;
void (vector org, entity death_owner) spawn_tdeath;
float modelindex_eyes;
float modelindex_player;
float modelindex_null;
void () TeamFortress_CheckTeamCheats;
void (entity Viewer, float pc, float rpc) TeamFortress_PrintClassName;
void () TeamFortress_RemoveTimers;
void () TeamFortress_SetupRespawn;
float (float pc) IsLegalClass;
void () CeaseFire_think;
void () StartRound;
void () RemoveVotes;
void (entity eng) Engineer_RemoveBuildings;
void (string halias, float himpulse1, float himpulse2) TeamFortress_Alias;
void (entity p) CheckAutoKick;
void (entity p) TeamFortress_ExecClassScript;
void (entity p) TeamFortress_ExecMapScript;
void () PreMatch_Think;
void (entity p) SetTeamName;
void () autokick_think;
float (float tno, float pc) ClassIsRestricted;
float (float tno) CheckClassAvailable;
void () Service_Grapple;
void (entity AD) ParseTFDetect;
entity (float ino) Finditem;
void (entity Item, entity AP, entity Goal) tfgoalitem_GiveToPlayer;
void () CTF_FlagCheck;
string nextmap;
float intermission_running;
float intermission_exittime;

void () CheckAllRates =
{
	local float player_rate;
	local float maxrate;
	local float minrate;
	local string tmp;
	local entity p;

	maxrate = stof (infokey (world, "maxrate"));
	minrate = stof (infokey (world, "minrate"));
	if (((maxrate != minrate) || (minrate != minrate)))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				player_rate = stof (infokey (p, "rate"));
				if (((player_rate > maxrate) && (maxrate != minrate)))
				{
					sprint (p, SBAR_PRINT, "\nYour Ú·ÙÂ setting is too high for this server.\n");
					tmp = ftos (maxrate);
					sprint (p, SBAR_PRINT, "Rate set to ");
					sprint2 (p, AS_MELEE, tmp, "\n");
					stuffcmd (p, "rate ");
					stuffcmd (p, tmp);
					stuffcmd (p, "\n");
				}
				if (((player_rate < minrate) && (minrate < maxrate)))
				{
					sprint (p, SBAR_PRINT, "\nYour Ú·ÙÂ setting is too low for this server.\n");
					tmp = ftos (minrate);
					sprint (p, SBAR_PRINT, "Rate set to ");
					sprint2 (p, AS_MELEE, tmp, "\n");
					stuffcmd (p, "rate ");
					stuffcmd (p, tmp);
					stuffcmd (p, "\n");
				}
			}
			p = find (p, classname, "player");
		}
	}
};

void () CheckConnectRate =
{
	local float player_rate;
	local float maxrate;
	local float minrate;
	local string tmp;

	player_rate = stof (infokey (self, "rate"));
	maxrate = stof (infokey (world, "maxrate"));
	minrate = stof (infokey (world, "minrate"));
	if ((maxrate || minrate))
	{
		if (((player_rate > maxrate) && (maxrate != minrate)))
		{
			sprint (self, SBAR_PRINT, "\nYour Ú·ÙÂ setting is too high for this server.\n");
			tmp = ftos (maxrate);
			sprint (self, SBAR_PRINT, "Rate set to ");
			sprint2 (self, AS_MELEE, tmp, "\n");
			stuffcmd (self, "rate ");
			stuffcmd (self, tmp);
			stuffcmd (self, "\n");
		}
		if (((player_rate < minrate) && (minrate < maxrate)))
		{
			sprint (self, SBAR_PRINT, "\nYour Ú·ÙÂ setting is too low for this server.\n");
			tmp = ftos (minrate);
			sprint (self, SBAR_PRINT, "Rate set to ");
			sprint2 (self, AS_MELEE, tmp, "\n");
			stuffcmd (self, "rate ");
			stuffcmd (self, tmp);
			stuffcmd (self, "\n");
		}
	}
};

void () info_intermission =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void () SetChangeParms =
{
	if ((self.health <= minrate))
	{
		SetNewParms ();
		return;
	}
	self.items = (self.items - (self.items & (((((131072 | 262144) | 524288) | 1048576) | 2097152) | 4194304)));
	if ((self.health > _d))
	{
		self.health = _d;
	}
	if ((self.health < _2))
	{
		self.health = _2;
	}
	parm1 = self.items;
	parm2 = self.health;
	parm3 = self.armorvalue;
	if ((self.ammo_shells < 25))
	{
		parm4 = 25;
	}
	else
	{
		parm4 = self.ammo_shells;
	}
	parm5 = self.ammo_nails;
	parm6 = self.ammo_rockets;
	parm7 = self.ammo_cells;
	parm8 = self.current_weapon;
	parm9 = (self.armortype * _d);
	parm10 = minrate;
	parm11 = minrate;
	parm12 = minrate;
	parm13 = self.StatusBarRes;
	parm14 = self.StatusBarSize;
	parm15 = self.is_admin;
};

void () SetNewParms =
{
	parm1 = minrate;
	parm2 = _d;
	parm3 = minrate;
	parm4 = 25;
	parm5 = minrate;
	parm6 = minrate;
	parm7 = minrate;
	parm8 = SBAR_GRENS;
	parm9 = minrate;
	parm10 = minrate;
	parm11 = minrate;
	parm12 = minrate;
	parm13 = minrate;
	parm14 = minrate;
	parm15 = minrate;
};

void () autokick_think =
{
	self.owner.teamkills = minrate;
	dremove (self);
};
void () Check_illclasses;

void () DecodeLevelParms =
{
	local string st;
	local entity ent;
	local entity te;
	local float fl;

	if (serverflags)
	{
		if ((world.model == "maps/start.bsp"))
		{
			SetNewParms ();
		}
	}
	localcmd ("serverinfo huetf 1.45\n");
	self.items = parm1;
	self.health = parm2;
	self.armorvalue = parm3;
	self.ammo_shells = parm4;
	self.ammo_nails = parm5;
	self.ammo_rockets = parm6;
	self.ammo_cells = parm7;
	self.current_weapon = parm8;
	self.armortype = (parm9 * 0.01);
	if (!(toggleflags & 256))
	{
		flagem_checked = minrate;
		if ((coop || !deathmatch))
		{
			toggleflags = (toggleflags | SBAR_GRENS);
		}
		nextmap = mapname;
		ent = find (world, classname, "info_tfdetect");
		if ((ent != world))
		{
			if ((teamplay == minrate))
			{
				cvar_set ("teamplay", "21?TeamFortress");
			}
			ParseTFDetect (ent);
			if (((number_of_teams <= minrate) || (number_of_teams >= 5)))
			{
				number_of_teams = AS_MISSILE;
			}
		}
		else
		{
			ent = find (world, classname, "info_player_team1");
			if (((ent != world) || (CTF_Map == SBAR_GRENS)))
			{
				CTF_Map = SBAR_GRENS;
				if ((teamplay == minrate))
				{
					cvar_set ("teamplay", "21?TeamFortress");
				}
				ent = spawn ();
				ent.nextthink = (time + 30);
				ent.think = CTF_FlagCheck;
				number_of_teams = SBAR_PRINT;
			}
			else
			{
				number_of_teams = AS_MISSILE;
			}
			team1maxplayers = _d;
			team2maxplayers = _d;
			team3maxplayers = _d;
			team4maxplayers = _d;
		}
		ent = find (world, classname, "func_bomb_target");
		if ((ent != world))
		{
			tfstrike = SBAR_GRENS;
			rounds = -1;
			number_of_teams = SBAR_PRINT;
		}
		ent = find (world, classname, "func_hostage_rescue");
		if ((ent != world))
		{
			tfstrike = SBAR_GRENS;
			rounds = -1;
			number_of_teams = SBAR_PRINT;
		}
		ent = find (world, classname, "info_soccer_goal");
		if ((ent != world))
		{
			rounds = -1;
		}
		bprint (SBAR_PRINT, "Mapname: ");
		bprint (SBAR_PRINT, mapname);
		bprint (SBAR_PRINT, "\n");
		team4frags = minrate;
		team3frags = minrate;
		team2frags = minrate;
		team1frags = minrate;
		team4score = minrate;
		team3score = minrate;
		team2score = minrate;
		team1score = minrate;
		autokick_kills = minrate;
		autokick_time = minrate;
		cease_fire = minrate;
		if (SBAR_GRENS)
		{
			toggleflags = (toggleflags - (toggleflags & 128));
		}
		if (minrate)
		{
			toggleflags = (toggleflags | 128);
		}
		toggleflags = (toggleflags - (toggleflags & SBAR_PRINT));
		toggleflags = (toggleflags | 256);
		st = infokey (world, "temp1");
		fl = stof (st);
		if (fl)
		{
			toggleflags = (toggleflags | fl);
		}
		st = infokey (world, "highlander");
		if ((st == "on"))
		{
			localcmd ("localinfo cr_scout 1\n");
			localcmd ("localinfo cr_sniper 1\n");
			localcmd ("localinfo cr_soldier 1\n");
			localcmd ("localinfo cr_demoman 1\n");
			localcmd ("localinfo cr_medic 1\n");
			localcmd ("localinfo cr_hwguy 1\n");
			localcmd ("localinfo cr_pyro 1\n");
			localcmd ("localinfo cr_spy 1\n");
			localcmd ("localinfo cr_engineer 1\n");
			localcmd ("localinfo cr_random 1\n");
		}
		else
		{
			Check_illclasses ();
		}
		st = infokey (world, "tfstrike");
		if ((st == "on"))
		{
			tfstrike = SBAR_GRENS;
			rounds = -1;
		}
		st = infokey (world, "duel");
		if ((st == "on"))
		{
			duel = SBAR_GRENS;
			rounds = -1;
		}
		st = infokey (world, "speedcap");
		if ((st == "on"))
		{
			speedcap = SBAR_GRENS;
			rounds = -1;
		}
		st = infokey (world, "rounds");
		if ((st == "on"))
		{
			rounds = -1;
		}
		else
		{
			if ((stof (st) > minrate))
			{
				rounds = (stof (st) + SBAR_GRENS);
			}
		}
		st = infokey (world, "practice");
		if ((st == "on"))
		{
			practice = SBAR_GRENS;
		}
		else
		{
			practice = minrate;
		}
		st = infokey (world, "clan");
		if ((st == "on"))
		{
			localcmd ("serverinfo status Standby\n");
			clanbattle = SBAR_GRENS;
			practice = minrate;
			cb_prematch = SBAR_GRENS;
			st = infokey (world, "freeze");
			if ((st == "on"))
			{
				freeze = SBAR_GRENS;
			}
			else
			{
				if (((mapname == "spaz4") || (mapname == "canalzon")))
				{
					localcmd ("localinfo freeze on\n");
					freeze = SBAR_GRENS;
				}
			}
			pmtime = stof (infokey (world, "prematch"));
			if (pmtime)
			{
				StartTimer ();
			}
			if (!pmtime)
			{
				st = infokey (world, "cft");
				pmtime = stof (st);
				if (pmtime)
				{
					cease_fire = SBAR_GRENS;
					bprint (SBAR_PRINT, "CEASE FIRE\n");
					te = find (world, classname, "player");
					while (te)
					{
						centerprint (te, "CEASE FIRE\n");
						te.immune_to_check = (time + 5);
						te.tfstate = (te.tfstate | 65536);
						TeamFortress_SetSpeed (te);
						te = find (te, classname, "player");
					}
					te = spawn ();
					te.classname = "ceasefire";
					te.think = CeaseFire_think;
					te.nextthink = (time + 5);
					te.weapon = SBAR_GRENS;
					StartTimer ();
				}
			}
		}
		else
		{
			clanbattle = minrate;
			localcmd ("serverinfo status Normal\n");
		}
		if (rounds)
		{
			if (tfstrike)
			{
				st = infokey (world, "grenpacks");
				if ((st == "on"))
				{
					localcmd ("localinfo grenpacks off\n");
				}
				allow_grenpack = minrate;
			}
			st = infokey (world, "round_time");
			round_over = SBAR_GRENS;
			te = spawn ();
			te.owner = world;
			te.classname = "round";
			te.cnt = stof (st);
			if (!clanbattle)
			{
				StartRound ();
			}
		}
		st = infokey (world, "tfvsdm");
		if ((st == "on"))
		{
			civilianteams = enter;
			tfvsdm = SBAR_GRENS;
		}
		Calibrate_Level ();
	}
	if (parm11)
	{
		self.tfstate = parm11;
	}
	if (!self.playerclass)
	{
		self.playerclass = parm12;
	}
	if (parm13)
	{
		self.StatusBarRes = parm13;
	}
	if (parm14)
	{
		self.StatusBarSize = parm14;
	}
	if (parm15)
	{
		self.is_admin = parm15;
	}
};

entity () FindIntermission =
{
	local entity spot;
	local float cyc;

	spot = find (world, classname, "info_intermission");
	if (spot)
	{
		cyc = (random () * SBAR_GRENS);
		return (spot);
	}
	spot = find (world, classname, "info_player_start");
	if (spot)
	{
		return (spot);
	}
	spot = find (world, classname, "info_player_deathmatch");
	if (spot)
	{
		cyc = (random () * 6);
		while ((cyc > SBAR_GRENS))
		{
			spot = find (spot, classname, "info_player_deathmatch");
			if (!spot)
			{
				spot = find (spot, classname, "info_player_deathmatch");
			}
			cyc = (cyc - SBAR_GRENS);
		}
		return (spot);
	}
	objerror ("FindIntermission: no spot");
};

entity (entity start_point) FindNextIntermission =
{
	local entity spot;
	local float cyc;

	if (deathmatch)
	{
		if (((start_point.classname == "info_intermission") || (start_point == world)))
		{
			spot = find (start_point, classname, "info_intermission");
			if (spot)
			{
				return (spot);
			}
			else
			{
				start_point = world;
			}
		}
		if (((start_point.classname == "info_player_deathmatch") || (start_point == world)))
		{
			spot = find (start_point, classname, "info_player_deathmatch");
			if (spot)
			{
				return (spot);
			}
		}
		spot = find (world, classname, "info_intermission");
		if (spot)
		{
			return (spot);
		}
		spot = find (world, classname, "info_player_deathmatch");
		if (spot)
		{
			return (spot);
		}
	}
	else
	{
		spot = find (world, classname, "info_player_start");
		if (spot)
		{
			return (spot);
		}
	}
	return (FindIntermission ());
};

void () TF_MovePlayer =
{
	local entity place;

	place = FindNextIntermission (self.observer_list);
	self.observer_list = place;
	setorigin (self, (place.origin + '0 0 1'));
	self.angles = place.angles;
	self.fixangle = SBAR_GRENS;
};

void () GotoNextMap =
{
	local float nextlevel;
	local string sl;
	local string st;
	local entity te;

	if ((nextmap != mapname))
	{
		changelevel (nextmap);
		already_chosen_map = SBAR_GRENS;
	}
	sl = infokey (world, mapname);
	if ((sl != string_null))
	{
		nextmap = sl;
		already_chosen_map = SBAR_GRENS;
		return;
	}
	if (!already_chosen_map)
	{
		sl = infokey (world, "n");
		nextlevel = stof (sl);
		nextlevel = (nextlevel + SBAR_GRENS);
		sl = ftos (nextlevel);
		localcmd ("localinfo n ");
		localcmd (sl);
		localcmd ("\n");
		st = infokey (world, "cd");
		if ((st == string_null))
		{
			st = infokey (world, "cycledir");
		}
		if ((st != string_null))
		{
			localcmd ("exec ");
			localcmd (st);
			localcmd ("/map");
		}
		else
		{
			localcmd ("exec qwmcycle/map");
		}
		localcmd (sl);
		localcmd (".cfg\n");
		already_chosen_map = SBAR_GRENS;
	}
	if ((infokey (world, "n") == "0"))
	{
		already_chosen_map = minrate;
	}
};

void () ExitIntermission =
{
	dprint ("Exiting intermission...\n");
	if (deathmatch)
	{
		dprint ("Exit Intermission in Deathmatch.\n");
		GotoNextMap ();
		return;
	}
	intermission_exittime = (time + SBAR_GRENS);
	intermission_running = (intermission_running + SBAR_GRENS);
	if ((intermission_running == SBAR_PRINT))
	{
		if ((world.model == "maps/e1m7.bsp"))
		{
			WriteByte (SBAR_PRINT, space);
			WriteByte (SBAR_PRINT, SBAR_PRINT);
			WriteByte (SBAR_PRINT, AS_MELEE);
			if (!cvar ("registered"))
			{
				WriteByte (SBAR_PRINT, 31);
				WriteString (SBAR_PRINT, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task in...");
			}
			else
			{
				WriteByte (SBAR_PRINT, 31);
				WriteString (SBAR_PRINT, "As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task. A...");
			}
			return;
		}
		else
		{
			if ((world.model == "maps/e2m6.bsp"))
			{
				WriteByte (SBAR_PRINT, space);
				WriteByte (SBAR_PRINT, SBAR_PRINT);
				WriteByte (SBAR_PRINT, AS_MELEE);
				WriteByte (SBAR_PRINT, 31);
				WriteString (SBAR_PRINT, "The Rune of Black Magic throbs evilly in\nyour hand && whispers dark thoughts\ninto your brain. You learn the inmost\nlore of the Hell-Mother; Shub-Niggurath!\nYou now know that she is behind all the\nterrible plotting which has led to so\nmuch death...");
				return;
			}
			else
			{
				if ((world.model == "maps/e3m6.bsp"))
				{
					WriteByte (SBAR_PRINT, space);
					WriteByte (SBAR_PRINT, SBAR_PRINT);
					WriteByte (SBAR_PRINT, AS_MELEE);
					WriteByte (SBAR_PRINT, 31);
					WriteString (SBAR_PRINT, "The charred viscera of diabolic horrors\nbubble viscously as you seize the Rune\nof Hell Magic. Its heat scorches your\nhand, && its terrible secrets blight\nyour mind. Gathering the shreds of your\ncourage, you shake the devil's shackles\nfrom your ...");
					return;
				}
				else
				{
					if ((world.model == "maps/e4m7.bsp"))
					{
						WriteByte (SBAR_PRINT, space);
						WriteByte (SBAR_PRINT, SBAR_PRINT);
						WriteByte (SBAR_PRINT, AS_MELEE);
						WriteByte (SBAR_PRINT, 31);
						WriteString (SBAR_PRINT, "Despite the awful might of the Elder\nWorld, you have achieved the Rune of\nElder Magic, capstone of all types of\narcane wisdom. Beyond good && evil,\nbeyond life && death, the Rune\npulsates, heavy with import. Patient and\npotent, the Elder Being...");
						return;
					}
				}
			}
		}
		GotoNextMap ();
	}
	if ((intermission_running == AS_MELEE))
	{
		if (!cvar ("registered"))
		{
			WriteByte (SBAR_PRINT, SBAR_384);
			return;
		}
		if (((serverflags & 15) == 15))
		{
			WriteByte (SBAR_PRINT, 31);
			WriteString (SBAR_PRINT, "Now, you have all four Runes. You sense\ntremendous invisible forces moving to\nunseal ancient barriers. Shub-Niggurath\nhad hoped to use the Runes Herself to\nclear off the Earth, but now instead,\nyou will use them to enter her home and\nconfront he...");
			return;
		}
	}
	dprint ("Exit Intermission.\n");
	GotoNextMap ();
};

void () IntermissionThink =
{
	local float minp;
	local float maxp;
	local float currp;
	local string sl;
	local string st;

	if ((time < intermission_exittime))
	{
		return;
	}
	if ((infokey (world, "serverdemo") != string_null))
	{
		localcmd ("stop\n");
		st = infokey (world, "demo_auto_left");
		currp = stof (st);
		if ((currp > minrate))
		{
			currp = (currp - SBAR_GRENS);
			st = ftos (currp);
			localcmd ("localinfo demo_auto_left ");
			localcmd (st);
			localcmd ("\n");
		}
	}
	if (((!self.button0 && !self.button1) && !self.button2))
	{
		return;
	}
	dprint ("Intermission think.\n");
	GotoNextMap ();
	sl = infokey (world, "nmap");
	if ((sl != string_null))
	{
		st = infokey (world, "minp");
		minp = stof (st);
		st = infokey (world, "maxp");
		maxp = stof (st);
		currp = TeamFortress_GetNoPlayers ();
		dprint ("MAP CYCLING: Player Counting... ");
		if (((currp >= minp) && (currp <= maxp)))
		{
			dprint ("within range. Changing maps...\n");
			st = infokey (world, "cd");
			if ((st == string_null))
			{
				st = infokey (world, "cycledir");
			}
			if ((st != string_null))
			{
				localcmd ("exec ");
				localcmd (st);
				localcmd ("/");
			}
			else
			{
				localcmd ("exec qwmcycle/");
			}
			localcmd (sl);
			localcmd (".cfg\n");
		}
		else
		{
			dprint ("outside range. Next map.\n");
			already_chosen_map = minrate;
		}
		localcmd ("localinfo minp \"\"\n");
		localcmd ("localinfo maxp \"\"\n");
		localcmd ("localinfo nmap \"\"\n");
	}
};

void () execute_changelevel =
{
	local entity pos;

	dprint ("execute_changelevel()\n");
	intermission_running = SBAR_GRENS;
	intermission_exittime = (time + 5);
	pos = FindIntermission ();
	WriteByte (SBAR_PRINT, space);
	WriteByte (SBAR_PRINT, AS_MELEE);
	WriteByte (SBAR_PRINT, 30);
	WriteCoord (SBAR_PRINT, pos.origin_x);
	WriteCoord (SBAR_PRINT, pos.origin_y);
	WriteCoord (SBAR_PRINT, pos.origin_z);
	WriteAngle (SBAR_PRINT, pos.mangle_x);
	WriteAngle (SBAR_PRINT, pos.mangle_y);
	WriteAngle (SBAR_PRINT, pos.mangle_z);
	localcmd ("serverinfo status Standby\n");
	other = find (world, classname, "player");
	while ((other != world))
	{
		stuffcmd (other, "play endgame.wav\n");
		ShowFrags (other);
		other.takedamage = minrate;
		other.solid = minrate;
		other.movetype = minrate;
		other.modelindex = minrate;
		other = find (other, classname, "player");
	}
};

void () changelevel_touch =
{
	local entity pos;
	local float ne;
	local string st;

	if ((other.classname != "player"))
	{
		return;
	}
	if (((cvar ("samelevel") == SBAR_PRINT) || ((cvar ("samelevel") == AS_MELEE) && (mapname != "start"))))
	{
		return;
	}
	bprint (SBAR_PRINT, other.netname);
	bprint (SBAR_PRINT, " exited the level\n");
	nextmap = self.map;
	SUB_UseTargets ();
	if (((self.spawnflags & SBAR_GRENS) && (deathmatch == minrate)))
	{
		GotoNextMap ();
		return;
	}
	self.touch = SUB_Null;
	self.think = execute_changelevel;
	self.nextthink = (time + 0.1);
};

void () trigger_changelevel =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.map)
	{
		objerror ("changelevel trigger doesn't have map");
	}
	InitTrigger ();
	self.touch = changelevel_touch;
};
void () set_suicide_frame;

void () respawn =
{
	if ((self.has_disconnected == SBAR_GRENS))
	{
		return;
	}
	if (cease_fire)
	{
		return;
	}
	CopyToBodyQue (self);
	setspawnparms (self);
	PutClientInServer ();
};

void () ClientKill =
{
	local entity te;

	if ((self.has_disconnected == SBAR_GRENS))
	{
		return;
	}
	if ((self.respawn_time > time))
	{
		return;
	}
	if (self.deadflag)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (practice)
	{
		self.respawn_time = (time + SBAR_GRENS);
	}
	else
	{
		self.respawn_time = (time + 5);
	}
	if (self.playerclass)
	{
		bprint (SBAR_GRENS, self.netname);
		bprint (SBAR_GRENS, " suicides\n");
		TF_AddFrags (self, -1, minrate);
		set_suicide_frame ();
		self.modelindex = modelindex_player;
		if ((self.tfstate & SBAR_240))
		{
			te = find (world, classname, "timer");
			while (te)
			{
				if (((te.owner == self) && (te.think == BioInfection_Decay)))
				{
					logfrag (te, self);
					TF_AddFrags (te.enemy, SBAR_GRENS, SBAR_GRENS);
				}
				te = find (te, classname, "timer");
			}
		}
		else
		{
			logfrag (self, self);
		}
	}
	self.weaponmodel = "";
	self.view_ofs = '0 0 -8';
	self.movetype = minrate;
	TeamFortress_RemoveTimers ();
	TeamFortress_SetupRespawn ();
	self.health = -1;
	self.th_die ();
	self.deadflag = AS_MELEE;
	self.takedamage = minrate;
};
entity lastspawn_team1;
entity lastspawn_team2;
entity lastspawn_team3;
entity lastspawn_team4;

entity (float team_num) FindTeamSpawnPoint =
{
	local entity spot;
	local entity at_spot;
	local float spot_found;
	local float attempts;

	if ((team_num == SBAR_GRENS))
	{
		spot = lastspawn_team1;
		attempts = minrate;
		while (SBAR_GRENS)
		{
			attempts = (attempts + SBAR_GRENS);
			if (tfstrike)
			{
				spot = find (spot, classname, "info_player_start");
			}
			else
			{
				spot = find (spot, team_str_home, "ts1");
			}
			if ((spot == world))
			{
				if (tfstrike)
				{
					spot = find (world, classname, "info_player_start");
				}
				else
				{
					spot = find (world, team_str_home, "ts1");
				}
			}
			if ((spot == world))
			{
				return (world);
			}
			at_spot = findradius (spot.origin, 40);
			spot_found = SBAR_GRENS;
			while ((at_spot != world))
			{
				if (((at_spot.classname == "player") && (at_spot.deadflag == minrate)))
				{
					spot_found = minrate;
				}
				at_spot = at_spot.chain;
			}
			if (!Activated (spot, self))
			{
				spot_found = minrate;
			}
			if ((spot_found || (attempts >= 30)))
			{
				lastspawn_team1 = spot;
				return (spot);
			}
		}
	}
	else
	{
		if ((team_num == SBAR_PRINT))
		{
			spot = lastspawn_team2;
			attempts = minrate;
			while (SBAR_GRENS)
			{
				attempts = (attempts + SBAR_GRENS);
				if (tfstrike)
				{
					spot = find (spot, classname, "info_player_deathmatch");
				}
				else
				{
					spot = find (spot, team_str_home, "ts2");
				}
				if ((spot == world))
				{
					if (tfstrike)
					{
						spot = find (world, classname, "info_player_deathmatch");
					}
					else
					{
						spot = find (world, team_str_home, "ts2");
					}
				}
				if ((spot == world))
				{
					return (world);
				}
				at_spot = findradius (spot.origin, 40);
				spot_found = SBAR_GRENS;
				while ((at_spot != world))
				{
					if (((at_spot.classname == "player") && (at_spot.deadflag == minrate)))
					{
						spot_found = minrate;
					}
					at_spot = at_spot.chain;
				}
				if (!Activated (spot, self))
				{
					spot_found = minrate;
				}
				if ((spot_found || (attempts >= 30)))
				{
					lastspawn_team2 = spot;
					return (spot);
				}
			}
		}
		else
		{
			if ((team_num == AS_MELEE))
			{
				spot = lastspawn_team3;
				attempts = minrate;
				while (SBAR_GRENS)
				{
					attempts = (attempts + SBAR_GRENS);
					spot = find (spot, team_str_home, "ts3");
					if ((spot == world))
					{
						spot = find (world, team_str_home, "ts3");
					}
					if ((spot == world))
					{
						return (world);
					}
					at_spot = findradius (spot.origin, 40);
					spot_found = SBAR_GRENS;
					while ((at_spot != world))
					{
						if (((at_spot.classname == "player") && (at_spot.deadflag == minrate)))
						{
							spot_found = minrate;
						}
						at_spot = at_spot.chain;
					}
					if (!Activated (spot, self))
					{
						spot_found = minrate;
					}
					if ((spot_found || (attempts >= 30)))
					{
						lastspawn_team3 = spot;
						return (spot);
					}
				}
			}
			else
			{
				if ((team_num == AS_MISSILE))
				{
					spot = lastspawn_team4;
					attempts = minrate;
					while (SBAR_GRENS)
					{
						attempts = (attempts + SBAR_GRENS);
						spot = find (spot, team_str_home, "ts4");
						if ((spot == world))
						{
							spot = find (world, team_str_home, "ts4");
						}
						if ((spot == world))
						{
							return (world);
						}
						at_spot = findradius (spot.origin, 40);
						spot_found = SBAR_GRENS;
						while ((at_spot != world))
						{
							if (((at_spot.classname == "player") && (at_spot.deadflag == minrate)))
							{
								spot_found = minrate;
							}
							at_spot = at_spot.chain;
						}
						if (!Activated (spot, self))
						{
							spot_found = minrate;
						}
						if ((spot_found || (attempts >= 30)))
						{
							lastspawn_team4 = spot;
							return (spot);
						}
					}
				}
			}
		}
	}
	return (world);
};

void (entity e) ValidateUser =
{
};

entity () SelectSpawnPoint =
{
	local entity spot;
	local entity at_spot;
	local float spot_found;
	local float attempts;

	if ((self.team_no != minrate))
	{
		spot = FindTeamSpawnPoint (self.team_no);
		if ((spot != world))
		{
			return (spot);
		}
	}
	if (coop)
	{
		lastspawn = find (lastspawn, classname, "info_player_coop");
		if ((lastspawn == world))
		{
			lastspawn = find (world, classname, "info_player_coop");
		}
		if ((lastspawn != world))
		{
			return (lastspawn);
		}
	}
	else
	{
		if (deathmatch)
		{
			spot = find (lastspawn, classname, "info_player_deathmatch");
			if ((spot == world))
			{
				spot = find (world, classname, "info_player_deathmatch");
			}
			attempts = minrate;
			while (((spot != world) && (attempts < _d)))
			{
				attempts = (attempts + SBAR_GRENS);
				at_spot = findradius (spot.origin, 40);
				spot_found = SBAR_GRENS;
				while (at_spot)
				{
					if (((at_spot.classname == "player") && (at_spot.deadflag == minrate)))
					{
						spot_found = minrate;
					}
					at_spot = at_spot.chain;
				}
				if ((spot_found || (attempts >= enter)))
				{
					lastspawn = spot;
					return (spot);
				}
				spot = find (spot, classname, "info_player_deathmatch");
				if ((spot == world))
				{
					spot = find (world, classname, "info_player_deathmatch");
				}
			}
		}
	}
	if (serverflags)
	{
		spot = find (world, classname, "info_player_start2");
		if (spot)
		{
			return (spot);
		}
	}
	spot = find (world, classname, "info_player_start");
	if (!spot)
	{
		error ("PutClientInServer: no info_player_start on level\n");
	}
	return (spot);
};
void () PlayerDie;
void () TeamFortress_SetHealth;
void () TeamFortress_SetEquipment;
void () player_touch;

void () PutClientInServer =
{
	local string st;
	local float iszoom;
	local entity spot;
	local entity te;
	local float oldclass;

	self.immune_to_check = (time + 5);
	self.touch = player_touch;
	self.classname = "player";
	self.health = _d;
	self.solid = AS_MELEE;
	self.movetype = AS_MELEE;
	self.show_hostile = minrate;
	self.max_health = _d;
	self.flags = 8;
	self.air_finished = (time + 12);
	self.dmg = SBAR_PRINT;
	self.super_damage_finished = minrate;
	self.radsuit_finished = minrate;
	self.invisible_finished = minrate;
	self.invincible_finished = minrate;
	self.effects = minrate;
	self.invincible_time = minrate;
	self.reload_shotgun = minrate;
	self.reload_super_shotgun = minrate;
	self.reload_grenade_launcher = minrate;
	self.reload_rocket_launcher = minrate;
	self.on_hook = minrate;
	self.hook_out = minrate;
	self.fire_held_down = minrate;
	self.mapcount = _d;
	self.gravity = SBAR_GRENS;
	self.camdist = minrate;
	DecodeLevelParms ();
	if (self.team_no)
	{
		if (!self.playerclass)
		{
			if (TeamFortress_TeamIsCivilian (self.team_no))
			{
				self.nextpc = SBAR_200;
			}
		}
	}
	iszoom = minrate;
	if ((self.tfstate & 4096))
	{
		iszoom = SBAR_GRENS;
	}
	if (round_active)
	{
		self.playerclass = minrate;
	}
	else
	{
		if ((self.nextpc != minrate))
		{
			self.playerclass = self.nextpc;
			self.nextpc = minrate;
			if ((self.playerclass == enter))
			{
				self.tfstate = (self.tfstate | 8);
			}
			else
			{
				self.tfstate = (self.tfstate - (self.tfstate & 8));
				TeamFortress_ExecClassScript (self);
			}
		}
	}
	if ((self.tfstate & 8))
	{
		if (round_active)
		{
			self.playerclass = minrate;
		}
		else
		{
			if (CheckClassAvailable (self.team_no))
			{
				oldclass = self.playerclass;
				self.playerclass = (SBAR_GRENS + floor ((random () * (enter - SBAR_GRENS))));
				while (((!IsLegalClass (self.playerclass) || (self.playerclass == oldclass)) || ClassIsRestricted (self.team_no, self.playerclass)))
				{
					self.playerclass = (SBAR_GRENS + floor ((random () * (enter - SBAR_GRENS))));
				}
			}
			else
			{
				sprint (self, SBAR_PRINT, "All classes disabled, returning to Observer mode.\n");
				self.playerclass = minrate;
			}
			self.tfstate = 8;
			TeamFortress_ExecClassScript (self);
		}
	}
	else
	{
		self.tfstate = minrate;
	}
	if ((iszoom == SBAR_GRENS))
	{
		self.oldheight = stof (infokey (self, "fov"));
		self.tfstate = (self.tfstate | 4096);
	}
	if ((self.playerclass != 9))
	{
		Engineer_RemoveBuildings (self);
	}
	self.takedamage = SBAR_PRINT;
	TeamFortress_PrintClassName (self, self.playerclass, (self.tfstate & 8));
	TeamFortress_SetEquipment ();
	TeamFortress_SetHealth ();
	TeamFortress_SetSpeed (self);
	TeamFortress_SetSkin (self);
	stuffcmd (self, "v_cshift; wait; bf\n");
	W_SetCurrentAmmo ();
	self.attack_finished = (time + 0.3);
	self.th_pain = player_pain;
	self.th_die = PlayerDie;
	self.deadflag = minrate;
	self.pausetime = minrate;
	spot = SelectSpawnPoint ();
	if (self.playerclass)
	{
		spawn_tdeath (spot.origin, self);
	}
	self.observer_list = spot;
	self.origin = (spot.origin + '0 0 1');
	self.angles = spot.angles;
	self.fixangle = SBAR_GRENS;
	if (((spot.classname == "info_player_teamspawn") && !cb_prematch))
	{
		if ((spot.items != minrate))
		{
			te = Finditem (spot.items);
			if (te)
			{
				tfgoalitem_GiveToPlayer (te, self, self);
			}
			if (!(spot.goal_activation & SBAR_GRENS))
			{
				spot.items = minrate;
			}
		}
		if (spot.message)
		{
			CenterPrint (self, spot.message);
			if (!(spot.goal_activation & SBAR_PRINT))
			{
				spot.message = string_null;
			}
		}
		if ((spot.activate_goal_no != minrate))
		{
			te = Findgoal (spot.activate_goal_no);
			if (te)
			{
				AttemptToActivate (te, self, spot);
			}
		}
		if ((spot.goal_effects == SBAR_GRENS))
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + SBAR_GRENS);
			spot.think = SUB_Remove;
		}
	}
	setmodel (self, string_null);
	modelindex_null = self.modelindex;
	setmodel (self, "progs/eyes.mdl");
	modelindex_eyes = self.modelindex;
	setmodel (self, "progs/player.mdl");
	modelindex_player = self.modelindex;
	if (!self.playerclass)
	{
		self.modelindex = modelindex_null;
		if ((round_active || (self.playerclass == -1)))
		{
			self.current_menu = minrate;
		}
		if (!self.camdist)
		{
			self.camdist = 160;
		}
		self.movetype = 5;
		stuffcmd (self, "color ");
		iszoom = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
		st = ftos (iszoom);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		SetTeamName (self);
	}
	setsize (self, '-16 -16 -24', '16 16 32');
	self.view_ofs = '0 0 22';
	self.velocity = '0 0 0';
	player_stand1 ();
	if ((deathmatch || coop))
	{
		makevectors (self.angles);
		if (self.playerclass)
		{
			spawn_tfog ((self.origin + (v_forward * 20)));
		}
	}
	if ((stof (infokey (world, "rj")) != minrate))
	{
		rj = stof (infokey (world, "rj"));
	}
	else
	{
		rj = SBAR_GRENS;
	}
	if (cease_fire)
	{
		sprint (self, SBAR_PRINT, "\n\nCEASE FIRE MODE\n");
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | 65536);
		TeamFortress_SetSpeed (self);
	}
};

void () info_player_start =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void () info_player_start2 =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void () testplayerstart =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void () info_player_deathmatch =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void () info_player_coop =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
};

void (entity c) PrintClientScore =
{
	if (((c.frags > -10) && (c.frags < minrate)))
	{
		bprint (SBAR_GRENS, " ");
	}
	else
	{
		if ((c.frags >= minrate))
		{
			if ((c.frags < _d))
			{
				bprint (SBAR_GRENS, " ");
			}
			if ((c.frags < enter))
			{
				bprint (SBAR_GRENS, " ");
			}
		}
	}
	bprint (c.frags, ftos (c.frags));
	bprint (SBAR_GRENS, " ");
	bprint (SBAR_GRENS, c.netname);
	bprint (SBAR_GRENS, "\n");
};

void () DumpScore =
{
	local entity e;
	local entity sort;
	local entity walk;

	if (world.chain)
	{
		error ("DumpScore: world.chain is set");
	}
	e = find (world, classname, "player");
	sort = world;
	while (e)
	{
		if (!sort)
		{
			sort = e;
			e.chain = world;
		}
		else
		{
			if ((e.frags > sort.frags))
			{
				e.chain = sort;
				sort = e;
			}
			else
			{
				walk = sort;
				do
				{
					if (!walk.chain)
					{
						e.chain = world;
						walk.chain = e;
					}
					else
					{
						if ((walk.chain.frags < e.frags))
						{
							e.chain = walk.chain;
							walk.chain = e;
						}
						else
						{
							walk = walk.chain;
						}
					}

				} while ((walk.chain != e));
			}
		}
		e = find (e, classname, "player");
	}
	bprint (SBAR_GRENS, "\n");
	while (sort)
	{
		PrintClientScore (sort);
		sort = sort.chain;
	}
	bprint (SBAR_GRENS, "\n");
};
float already_cycled;

void () NextLevel =
{
	local entity o;

	if (already_cycled)
	{
		return;
	}
	already_cycled = SBAR_GRENS;
	o = spawn ();
	o.map = nextmap;
	o.think = execute_changelevel;
	o.nextthink = (time + 0.1);
};

void () CheckRules =
{
	if (!clanbattle)
	{
		if ((timelimit && (time >= timelimit)))
		{
			NextLevel ();
		}
	}
	if ((fraglimit && (self.frags >= fraglimit)))
	{
		NextLevel ();
	}
};

void () PlayerDeathThink =
{
	local float fwd;

	if ((self.flags & 512))
	{
		fwd = vlen (self.velocity);
		fwd = (fwd - 20);
		if ((fwd <= minrate))
		{
			self.velocity = '0 0 0';
		}
		else
		{
			self.velocity = (fwd * normalize (self.velocity));
		}
	}
	if ((self.deadflag == SBAR_PRINT))
	{
		if (((self.button2 || self.button1) || self.button0))
		{
			return;
		}
		self.deadflag = AS_MELEE;
		return;
	}
	if ((round_over == SBAR_PRINT))
	{
		self.button0 = minrate;
		self.button1 = minrate;
		self.button2 = minrate;
		return;
	}
	if ((round_active && !duel))
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = minrate;
			self.button1 = minrate;
			self.button2 = minrate;
			respawn ();
		}
		return;
	}
	if (((!self.button2 && !self.button1) && !self.button0))
	{
		if (self.respawn_time)
		{
			if ((self.respawn_time <= time))
			{
				self.button0 = minrate;
				self.button1 = minrate;
				self.button2 = minrate;
			}
			return;
		}
	}
	else
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = minrate;
			self.button1 = minrate;
			self.button2 = minrate;
			respawn ();
		}
		return;
	}
	if ((self.impulse == 171))
	{
		if ((self.respawn_time <= time))
		{
			self.button0 = minrate;
			self.button1 = minrate;
			self.button2 = minrate;
			respawn ();
		}
		self.impulse = minrate;
		return;
	}
};

void () PlayerJump =
{
	local entity te;
	local float stumble;

	if ((self.has_disconnected == SBAR_GRENS))
	{
		return;
	}
	if ((self.flags & 2048))
	{
		return;
	}
	if ((self.tfstate & 65536))
	{
		return;
	}
	if (!self.playerclass)
	{
		if ((self.waterlevel >= SBAR_PRINT))
		{
			self.velocity_z = 350;
		}
		else
		{
			self.velocity_z = 200;
		}
		if ((self.flags & 4096))
		{
			self.flags = (self.flags - (self.flags & 4096));
		}
		self.button2 = minrate;
		return;
	}
	if ((self.waterlevel >= SBAR_PRINT))
	{
		if ((self.watertype == -3))
		{
			self.velocity_z = _d;
		}
		else
		{
			if ((self.watertype == -4))
			{
				self.velocity_z = _P;
			}
			else
			{
				self.velocity_z = _2;
			}
		}
		if ((self.swim_flag < time))
		{
			self.swim_flag = (time + SBAR_GRENS);
			if ((random () < 0.5))
			{
				sound (self, AS_MISSILE, "misc/water1.wav", SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				sound (self, AS_MISSILE, "misc/water2.wav", SBAR_GRENS, SBAR_GRENS);
			}
		}
		if ((self.fire_held_down && (self.current_weapon == 32768)))
		{
			self.tfstate = (self.tfstate - (self.tfstate & 2048));
			TeamFortress_SetSpeed (self);
			self.weaponframe = minrate;
			self.heat = minrate;
			self.count = SBAR_GRENS;
			player_assaultcannondown1 ();
		}
		return;
	}
	if (!(self.flags & 512))
	{
		return;
	}
	if (!(self.flags & 4096))
	{
		return;
	}
	self.flags = (self.flags - (self.flags & 4096));
	self.button2 = minrate;
	sound (self, AS_MISSILE, "player/plyrjmp8.wav", SBAR_GRENS, SBAR_GRENS);
	te = find (world, classname, "timer");
	while ((((te.owner != self) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
	{
		te = find (te, classname, "timer");
	}
	if (((te != world) && (te != self)))
	{
		if (!self.is_feigning)
		{
			crandom ();
			crandom ();
			stumble = (crandom () * (te.health / _d));
			if ((crandom () < minrate))
			{
				self.velocity_x = (self.velocity_y + stumble);
				self.velocity_y = (self.velocity_x + stumble);
			}
			else
			{
				self.velocity_x = ((-1 * self.velocity_y) + stumble);
				self.velocity_y = ((-1 * self.velocity_x) + stumble);
			}
		}
	}
	if ((self.button0 && (self.current_weapon == 32768)))
	{
		sprint (self, SBAR_GRENS, "You cannot fire the assault cannon without your feet on the ground...\n");
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.weaponframe = minrate;
		self.count = SBAR_GRENS;
		self.heat = minrate;
		player_assaultcannondown1 ();
	}
	return;
};
.float dmgtime;

void () WaterMove =
{
	if ((self.movetype == 8))
	{
		return;
	}
	if ((self.health < minrate))
	{
		return;
	}
	if ((self.waterlevel != AS_MELEE))
	{
		if ((self.air_finished < time))
		{
			sound (self, SBAR_PRINT, "player/gasp2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			if ((self.air_finished < (time + 9)))
			{
				sound (self, SBAR_PRINT, "player/gasp1.wav", SBAR_GRENS, SBAR_GRENS);
			}
		}
		self.air_finished = (time + 12);
		self.dmg = SBAR_PRINT;
	}
	else
	{
		if ((self.air_finished < time))
		{
			if ((self.pain_finished < time))
			{
				self.dmg = (self.dmg + SBAR_PRINT);
				if ((self.dmg > 15))
				{
					self.dmg = enter;
				}
				TF_T_Damage (self, world, world, self.dmg, SBAR_GRENS, minrate);
				self.pain_finished = (time + SBAR_GRENS);
			}
		}
	}
	if (!self.waterlevel)
	{
		if ((self.flags & SBAR_240))
		{
			sound (self, AS_MISSILE, "misc/outwater.wav", SBAR_GRENS, SBAR_GRENS);
			self.flags = (self.flags - SBAR_240);
		}
		return;
	}
	if ((self.watertype == -5))
	{
		if ((self.dmgtime < time))
		{
			if ((self.radsuit_finished > time))
			{
				self.dmgtime = (time + SBAR_GRENS);
			}
			else
			{
				self.dmgtime = (time + 0.2);
			}
			TF_T_Damage (self, world, world, (enter * self.waterlevel), minrate, SBAR_240);
		}
	}
	else
	{
		if ((self.watertype == -4))
		{
			if (((self.dmgtime < time) && (self.radsuit_finished < time)))
			{
				self.dmgtime = (time + SBAR_GRENS);
				T_Damage (self, world, world, (AS_MISSILE * self.waterlevel));
			}
		}
	}
	if (!(self.flags & SBAR_240))
	{
		if ((self.watertype == -5))
		{
			sound (self, AS_MISSILE, "player/inlava.wav", SBAR_GRENS, SBAR_GRENS);
		}
		if ((self.watertype == -3))
		{
			sound (self, AS_MISSILE, "player/inh2o.wav", SBAR_GRENS, SBAR_GRENS);
		}
		if ((self.watertype == -4))
		{
			sound (self, AS_MISSILE, "player/slimbrn2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		self.flags = (self.flags + SBAR_240);
		self.dmgtime = minrate;
	}
};

void () CheckWaterJump =
{
	local vector start;
	local vector end;

	makevectors (self.angles);
	start = self.origin;
	start_z = (start_z + 8);
	v_forward_z = minrate;
	normalize (v_forward);
	end = (start + (v_forward * 24));
	traceline (start, end, SBAR_GRENS, self);
	if ((trace_fraction < SBAR_GRENS))
	{
		start_z = ((start_z + self.maxs_z) - 8);
		end = (start + (v_forward * 24));
		self.movedir = (trace_plane_normal * -50);
		traceline (start, end, SBAR_GRENS, self);
		if ((trace_fraction == SBAR_GRENS))
		{
			self.flags = (self.flags | 2048);
			self.velocity_z = 225;
			self.flags = (self.flags - (self.flags & 4096));
			self.teleport_time = (time + SBAR_PRINT);
			return;
		}
	}
};

void () PlayerPreThink =
{
	if ((self.is_feigning && (self.waterlevel == SBAR_GRENS)))
	{
		self.watertype = -3;
		self.waterlevel = AS_MELEE;
	}
	if (intermission_running)
	{
		IntermissionThink ();
		return;
	}
	CheckFps ();
	makevectors (self.v_angle);
	if ((self.view_ofs == '0 0 0'))
	{
		return;
	}
	CheckRules ();
	if ((self.deadflag >= SBAR_PRINT))
	{
		self.movetype = 6;
		PlayerDeathThink ();
		return;
	}
	if (((self.undercover_team || self.undercover_skin) || self.is_undercover))
	{
		if ((self.effects & (8 | AS_MISSILE)))
		{
			sprint (self, SBAR_GRENS, "The glowing removes your disguise.\n");
			Spy_RemoveDisguise (self);
		}
		if ((tfstrike && self.ammo_detpack))
		{
			sprint (self, SBAR_GRENS, "The bomb removes your disguise.\n");
			Spy_RemoveDisguise (self);
		}
	}
	if ((self.deadflag == SBAR_GRENS))
	{
		return;
	}
	if (!self.is_feigning)
	{
		if (self.button2)
		{
			PlayerJump ();
		}
		else
		{
			self.flags = (self.flags | 4096);
		}
	}
	else
	{
		if (self.waterlevel)
		{
			self.velocity_z = -100;
		}
	}
	if (((time < self.pausetime) || (cease_fire == SBAR_GRENS)))
	{
		self.velocity = '0 0 0';
	}
	if ((((time > self.attack_finished) && (self.currentammo == minrate)) && (self.weapon > SBAR_240)))
	{
		self.weapon = W_BestWeapon ();
		W_SetCurrentAmmo ();
	}
	if (self.on_hook)
	{
		Service_Grapple ();
	}
};

void () CheckPowerups =
{
	local float lighton;
	local entity te;

	if ((self.health <= minrate))
	{
		return;
	}
	if (!self.playerclass)
	{
		self.modelindex = modelindex_null;
	}
	else
	{
		if (self.invisible_finished)
		{
			if ((self.tfstate & 64))
			{
				if ((self.invisible_finished < (time + enter)))
				{
					self.invisible_finished = (time + 666);
				}
			}
			if ((self.invisible_sound < time))
			{
				sound (self, minrate, "items/inv3.wav", 0.5, SBAR_PRINT);
				self.invisible_sound = (time + ((random () * AS_MELEE) + SBAR_GRENS));
			}
			if ((self.invisible_finished < (time + AS_MELEE)))
			{
				if ((self.invisible_time == SBAR_GRENS))
				{
					sprint (self, SBAR_PRINT, "Ring of Shadows magic is fading\n");
					stuffcmd (self, "bf\n");
					sound (self, minrate, "items/inv2.wav", SBAR_GRENS, SBAR_GRENS);
					self.invisible_time = (time + SBAR_GRENS);
				}
				if ((self.invisible_time < time))
				{
					self.invisible_time = (time + SBAR_GRENS);
					stuffcmd (self, "bf\n");
				}
			}
			if ((self.invisible_finished < time))
			{
				self.items = (self.items - 524288);
				self.invisible_finished = minrate;
				self.invisible_time = minrate;
			}
			self.frame = minrate;
			self.modelindex = modelindex_eyes;
		}
		else
		{
			self.modelindex = modelindex_player;
		}
	}
	if (self.invincible_finished)
	{
		if ((self.tfstate & space))
		{
			if ((self.invincible_finished < (time + enter)))
			{
				self.invincible_finished = (time + 666);
			}
		}
		if ((self.invincible_finished < (time + AS_MELEE)))
		{
			if ((self.invincible_time == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Protection is almost burned out\n");
				stuffcmd (self, "bf\n");
				sound (self, minrate, "items/protect2.wav", SBAR_GRENS, SBAR_GRENS);
				self.invincible_time = (time + SBAR_GRENS);
			}
			if ((self.invincible_time < time))
			{
				self.invincible_time = (time + SBAR_GRENS);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.invincible_finished < time))
		{
			self.items = (self.items - 1048576);
			self.invincible_time = minrate;
			self.invincible_finished = minrate;
		}
		if ((self.invincible_finished > time))
		{
			self.effects = (self.effects | 8);
			self.effects = (self.effects | 128);
		}
		else
		{
			lighton = minrate;
			te = find (world, classname, "item_tfgoal");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.goal_activation & SBAR_GRENS))
					{
						lighton = SBAR_GRENS;
					}
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!lighton)
			{
				self.effects = (self.effects - (self.effects & 8));
				self.effects = (self.effects - (self.effects & space));
				self.effects = (self.effects - (self.effects & 128));
			}
		}
	}
	if (self.super_damage_finished)
	{
		if ((self.tfstate & 128))
		{
			if ((self.super_damage_finished == (time + enter)))
			{
				self.super_damage_finished = (time + 666);
			}
		}
		if ((self.super_damage_finished < (time + AS_MELEE)))
		{
			if ((self.super_time == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Quad Damage is wearing off\n");
				stuffcmd (self, "bf\n");
				sound (self, minrate, "items/damage2.wav", SBAR_GRENS, SBAR_GRENS);
				self.super_time = (time + SBAR_GRENS);
			}
			if ((self.super_time < time))
			{
				self.super_time = (time + SBAR_GRENS);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.super_damage_finished < time))
		{
			self.items = (self.items - 4194304);
			self.super_damage_finished = minrate;
			self.super_time = minrate;
		}
		if ((self.super_damage_finished > time))
		{
			self.effects = (self.effects | 8);
			self.effects = (self.effects | 64);
		}
		else
		{
			lighton = minrate;
			te = find (world, classname, "item_tfgoal");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.goal_activation & SBAR_GRENS))
					{
						lighton = SBAR_GRENS;
					}
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!lighton)
			{
				self.effects = (self.effects - (self.effects & 8));
				self.effects = (self.effects - (self.effects & SBAR_240));
				self.effects = (self.effects - (self.effects & 64));
			}
		}
	}
	if (self.radsuit_finished)
	{
		self.air_finished = (time + 12);
		if ((self.tfstate & 256))
		{
			if ((self.radsuit_finished == (time + enter)))
			{
				self.radsuit_finished = (time + 666);
			}
		}
		if ((self.radsuit_finished < (time + AS_MELEE)))
		{
			if ((self.rad_time == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Air supply in Biosuit expiring\n");
				stuffcmd (self, "bf\n");
				sound (self, minrate, "items/suit2.wav", SBAR_GRENS, SBAR_GRENS);
				self.rad_time = (time + SBAR_GRENS);
			}
			if ((self.rad_time < time))
			{
				self.rad_time = (time + SBAR_GRENS);
				stuffcmd (self, "bf\n");
			}
		}
		if ((self.radsuit_finished < time))
		{
			self.items = (self.items - 2097152);
			self.rad_time = minrate;
			self.radsuit_finished = minrate;
		}
	}
};

void () Admin_Aliases =
{
	TeamFortress_Alias ("countplayers", 192, minrate);
	TeamFortress_Alias ("deal", 189, minrate);
	TeamFortress_Alias ("kick", 190, minrate);
	TeamFortress_Alias ("next", 195, minrate);
	TeamFortress_Alias ("ceasefire", 193, minrate);
	TeamFortress_Alias ("listips", 198, minrate);
	TeamFortress_Alias ("timedown", 200, minrate);
	TeamFortress_Alias ("timeup", 201, minrate);
	TeamFortress_Alias ("pmdown", 228, minrate);
	TeamFortress_Alias ("pmup", 229, minrate);
	TeamFortress_Alias ("cfdown", 96, minrate);
	TeamFortress_Alias ("cfup", _a, minrate);
	TeamFortress_Alias ("otdown", _b, minrate);
	TeamFortress_Alias ("otup", _c, minrate);
	TeamFortress_Alias ("startmatch", 202, minrate);
	TeamFortress_Alias ("fragsdown", 204, minrate);
	TeamFortress_Alias ("fragsup", 205, minrate);
	TeamFortress_Alias ("tp", 206, minrate);
	TeamFortress_Alias ("clan", 207, minrate);
	TeamFortress_Alias ("restartmap", 208, minrate);
	TeamFortress_Alias ("gspeed", 213, minrate);
	TeamFortress_Alias ("silence", 214, minrate);
	TeamFortress_Alias ("freeze", 215, minrate);
	TeamFortress_Alias ("tfvsdm", 216, minrate);
	TeamFortress_Alias ("flashlight", 217, minrate);
	TeamFortress_Alias ("calibrate", 218, minrate);
	TeamFortress_Alias ("reset", 220, minrate);
	TeamFortress_Alias ("teamfrags", 221, minrate);
	TeamFortress_Alias ("fullts", 222, minrate);
	TeamFortress_Alias ("grapple", 223, minrate);
	TeamFortress_Alias ("clansetup", 224, minrate);
	TeamFortress_Alias ("fbskins", 225, minrate);
	TeamFortress_Alias ("enemy", 226, minrate);
	TeamFortress_Alias ("pointing", 227, minrate);
	TeamFortress_Alias ("grenpack", 233, minrate);
	TeamFortress_Alias ("gibs", 230, minrate);
	TeamFortress_Alias ("highlander", 231, minrate);
	TeamFortress_Alias ("sgtype", 232, minrate);
	TeamFortress_Alias ("sgfire", 191, minrate);
	TeamFortress_Alias ("pipedelay", 234, minrate);
	TeamFortress_Alias ("soliddet", 235, minrate);
	TeamFortress_Alias ("flag_model", 236, minrate);
	TeamFortress_Alias ("frjump", 238, minrate);
	TeamFortress_Alias ("rounds", _O, minrate);
	TeamFortress_Alias ("duel", _P, minrate);
	TeamFortress_Alias ("speedcap", _Q, minrate);
	TeamFortress_Alias ("practice", 94, minrate);
	TeamFortress_Alias ("tfstrike", _N, minrate);
	self.get_admin_aliases = minrate;
};

void () PlayerPostThink =
{
	local float g;
	local float speedpos;
	local float speedneg;
	local float fdmg;

	if ((self.motd <= _A))
	{
		TeamFortress_MOTD ();
	}
	else
	{
		if (((time > self.StatusRefreshTime) && (self.StatusBarSize != minrate)))
		{
			RefreshStatusBar ();
		}
		if (self.is_admin)
		{
			if (self.get_admin_aliases)
			{
				Admin_Aliases ();
			}
		}
	}
	if ((self.view_ofs == '0 0 0'))
	{
		return;
	}
	if (self.deadflag)
	{
		if ((self.impulse && !self.has_disconnected))
		{
			if (DeadImpulses ())
			{
				return;
			}
			CommandImpulses ();
			self.impulse = minrate;
		}
		self.movetype = 6;
		return;
	}
	if (self.playerclass)
	{
		WaterMove ();
		if ((self.flags & 512))
		{
			if ((gspeed >= SBAR_GRENS))
			{
				speedpos = (minrate + (self.maxspeed * gspeed));
				speedneg = (minrate - (self.maxspeed * gspeed));
				if ((self.velocity_y > speedpos))
				{
					self.velocity_y = speedpos;
				}
				if ((self.velocity_y < speedneg))
				{
					self.velocity_y = speedneg;
				}
				if ((self.velocity_x > speedpos))
				{
					self.velocity_x = speedpos;
				}
				if ((self.velocity_x < speedneg))
				{
					self.velocity_x = speedneg;
				}
			}
			if (((self.jump_flag < -300) && (self.health > minrate)))
			{
				if ((self.watertype == -3))
				{
					sound (self, AS_MISSILE, "player/h2ojump.wav", SBAR_GRENS, SBAR_GRENS);
				}
				else
				{
					if ((self.jump_flag < -650))
					{
						if ((infokey (world, "fallbunny") != "off"))
						{
							fdmg = 5;
							fdmg = ((fdmg * (self.jump_flag / 300)) * -1);
							if ((self.playerclass == SBAR_GRENS))
							{
								fdmg = (fdmg / SBAR_PRINT);
							}
							else
							{
								if ((self.playerclass == 6))
								{
									fdmg = (fdmg * 1.5);
								}
							}
							fdmg = rint (fdmg);
							TF_T_Damage (self, world, world, fdmg, SBAR_GRENS, minrate);
							self.deathtype = "falling";
						}
						sound (self, SBAR_PRINT, "player/land2.wav", SBAR_GRENS, SBAR_GRENS);
					}
					else
					{
						sound (self, SBAR_PRINT, "player/land.wav", SBAR_GRENS, SBAR_GRENS);
					}
				}
			}
		}
	}
	else
	{
		if ((self.impulse == 171))
		{
			UseSpecialSkill ();
			self.impulse = minrate;
		}
		if (!clanbattle)
		{
			Check_Track ();
		}
	}
	self.jump_flag = self.velocity_z;
	CheckPowerups ();
	W_WeaponFrame ();
	if ((self.cheat_check <= time))
	{
		TeamFortress_CheckTeamCheats ();
		self.cheat_check = (time + SBAR_PRINT);
	}
};

void (string cl_pwd) Admin_Check =
{
	local string st2;

	st2 = infokey (world, "adminpwd");
	if ((cl_pwd != string_null))
	{
		stuffcmd (self, "setinfo adminpwd \"");
		stuffcmd (self, "\"\n");
		if (((st2 != string_null) && (cl_pwd == st2)))
		{
			self.is_admin = AS_MELEE;
		}
	}
};

void () ClientConnect =
{
	local entity te;
	local string st;
	local string st2;
	local float res;

	st = infokey (self, "*FuhQuake");
	if ((st == string_null))
	{
		st = infokey (self, "*client");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*z_ver");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*z_version");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*ver");
	}
	if ((st == string_null))
	{
		st = infokey (self, "*prov");
	}
	st2 = infokey (world, "ban_oldclient");
	res = stof (st2);
	if ((st != string_null))
	{
		dprint ("Client version: ");
		dprint (st);
		dprint ("\n");
		if ((res == SBAR_PRINT))
		{
			if (((((st != "0.26") && (st != "0.27")) && (st != "0.28")) && (st != "GryMQ 0.11")))
			{
				sprint (self, SBAR_PRINT, "Client Version Illegal!\nPlease update your client to the latest FuhQuake || GreyMQuake clients.\n\n");
				sprint (self, SBAR_PRINT, "FuhQuake client available at http://www.fuhquake.net/\n");
				sprint (self, SBAR_PRINT, "GreyMQuake client available at http://qwtf.ausfortress.com/greymquake/\n\n");
				stuffcmd (self, "disconnect\n");
				stuffcmd (self, "cmd drop\n");
				return;
			}
		}
	}
	else
	{
		if ((res == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "Client Version Unknown. Please update your client.\n");
			stuffcmd (self, "disconnect\n");
			return;
		}
		if ((res == SBAR_PRINT))
		{
			sprint (self, SBAR_PRINT, "Client Version Illegal!\nPlease update your client to the latest FuhQuake || GreyMQuake clients.\n\n");
			sprint (self, SBAR_PRINT, "FuhQuake client available at http://www.fuhquake.net/\n");
			sprint (self, SBAR_PRINT, "GreyMQuake client available at http://qwtf.ausfortress.com/greymquake/\n\n");
			stuffcmd (self, "disconnect\n");
			stuffcmd (self, "cmd drop\n");
			return;
		}
	}
	bprint (SBAR_PRINT, self.netname);
	bprint (SBAR_PRINT, " entered the game\n");
	stuffcmd (self, "say -d\n");
	if ((minrate == minrate))
	{
		self.tfstate = (self.tfstate | 4096);
	}
	self.motd = minrate;
	self.get_aliases = SBAR_GRENS;
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}
	TeamFortress_Alias ("id", 185, minrate);
	st = infokey (self, "tfk");
	if ((st != string_null))
	{
		self.tfkey = stof (st);
	}
	st = infokey (self, "sbr");
	if ((st == string_null))
	{
		st = infokey (self, "sbar_res");
	}
	res = stof (st);
	if ((res == 768))
	{
		self.StatusBarRes = SBAR_768;
	}
	else
	{
		if ((res == 600))
		{
			self.StatusBarRes = SBAR_600;
		}
		else
		{
			if ((res == 480))
			{
				self.StatusBarRes = SBAR_480;
			}
			else
			{
				if ((res == 400))
				{
					self.StatusBarRes = SBAR_400;
				}
				else
				{
					if ((res == 384))
					{
						self.StatusBarRes = SBAR_384;
					}
					else
					{
						if ((res == 350))
						{
							self.StatusBarRes = SBAR_350;
						}
						else
						{
							if ((res == 300))
							{
								self.StatusBarRes = SBAR_300;
							}
							else
							{
								if ((res == 240))
								{
									self.StatusBarRes = SBAR_240;
								}
								else
								{
									if ((res == 200))
									{
										self.StatusBarRes = SBAR_200;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	st = infokey (self, "sbs");
	if ((st == string_null))
	{
		st = infokey (self, "sbar_size");
	}
	self.StatusBarSize = stof (st);
	if (((self.StatusBarSize > enter) || (self.StatusBarSize < SBAR_GRENS)))
	{
		if ((self.tfkey & 8))
		{
			self.StatusBarSize = AS_MELEE;
		}
		else
		{
			self.StatusBarSize = minrate;
		}
	}
	CheckConnectRate ();
	TeamFortress_ExecMapScript (self);
	self.has_disconnected = minrate;
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}
	if (intermission_running)
	{
		GotoNextMap ();
	}
	st = infokey (self, "adminpwd");
	Admin_Check (st);
	if (self.is_admin)
	{
		self.get_admin_aliases = SBAR_GRENS;
	}
	if (cb_prematch)
	{
		sprint (self, SBAR_PRINT, "CURRENTLY IN PREMATCH TIME\n");
	}
};

void () ClientDisconnect =
{
	local entity te;
	local string st;
	local float fr;

	fr = rint (self.frags);
	st = ftos (fr);
	bprint4 (SBAR_PRINT, self.netname, " left the game with ", st, " frags\n");
	sound (self, AS_MISSILE, "player/tornoff2.wav", SBAR_GRENS, minrate);
	self.has_disconnected = SBAR_GRENS;
	TeamFortress_RemoveTimers ();
	RemoveVotes ();
	Engineer_RemoveBuildings (self);
	if (!tfstrike)
	{
		te = find (world, classname, "detpack");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((te.weaponmode == SBAR_GRENS))
				{
					TeamFortress_SetSpeed (te.enemy);
					dremove (te.oldenemy);
					dremove (te.observer_list);
				}
				dremove (te);
				te = world;
			}
			te = find (te, classname, "detpack");
		}
	}
	else
	{
		if (self.is_detpacking)
		{
			self.ammo_detpack = SBAR_GRENS;
		}
		Drop_detpack ();
	}
	set_suicide_frame ();
	self.netname = string_null;
	self.team_no = minrate;
	self.infection_team_no = minrate;
	self.solid = minrate;
	self.is_building = minrate;
	self.is_detpacking = minrate;
	self.is_undercover = minrate;
	self.is_feigning = minrate;
	self.is_unabletospy = minrate;
	self.ammo_medikit = minrate;
	self.maxammo_medikit = minrate;
	self.ammo_detpack = minrate;
	self.maxammo_detpack = minrate;
	self.items_allowed = minrate;
	self.armor_allowed = minrate;
	self.maxarmor = minrate;
	self.weaponmode = minrate;
	self.respawn_time = minrate;
	self.heat = minrate;
	self.ammo_rockets = minrate;
	self.ammo_nails = minrate;
	self.ammo_shells = minrate;
	self.ammo_cells = minrate;
	self.maxammo_rockets = minrate;
	self.maxammo_nails = minrate;
	self.maxammo_shells = minrate;
	self.maxammo_cells = minrate;
	self.no_grenades_1 = minrate;
	self.no_grenades_2 = minrate;
	self.tp_grenades_1 = minrate;
	self.tp_grenades_2 = minrate;
	self.tf_items = minrate;
	self.ScannerOn = minrate;
	self.armorclass = minrate;
	self.armortype = minrate;
	self.armorvalue = minrate;
	self.current_weapon = minrate;
	self.items = minrate;
	self.weapons_carried = minrate;
	self.touch = SUB_Null;
	self.classname = string_null;
	self.health = minrate;
	self.movetype = minrate;
	self.show_hostile = minrate;
	self.max_health = minrate;
	self.flags = minrate;
	self.air_finished = minrate;
	self.dmg = minrate;
	self.super_damage_finished = minrate;
	self.radsuit_finished = minrate;
	self.invisible_finished = minrate;
	self.invincible_finished = minrate;
	self.effects = minrate;
	self.invincible_time = minrate;
	self.reload_shotgun = minrate;
	self.reload_super_shotgun = minrate;
	self.reload_grenade_launcher = minrate;
	self.reload_rocket_launcher = minrate;
	self.on_hook = minrate;
	self.hook_out = minrate;
	self.fire_held_down = minrate;
	self.mapcount = minrate;
	self.motd = minrate;
	self.menu_count = minrate;
	self.menu_displaytime = minrate;
	self.current_menu = minrate;
	self.tfstate = minrate;
	self.cheat_check = minrate;
	self.maxspeed = minrate;
	self.attack_finished = minrate;
	self.gravity = minrate;
	self.walkframe = minrate;
	self.frame = minrate;
	self.watertype = minrate;
	self.colormap = minrate;
	self.skin = minrate;
	self.weapon = minrate;
	self.weaponmodel = string_null;
	self.pain_finished = minrate;
	self.playerclass = minrate;
	self.has_dispenser = minrate;
	self.has_sentry = minrate;
	self.deaths = minrate;
	self.real_frags = minrate;
	self.teamkills = minrate;
	self.last_weaponmode = minrate;
	self.heat = minrate;
	self.immune_to_check = minrate;
	self.last_sound = minrate;
	self.on_hook = minrate;
	self.fire_held_down = minrate;
	self.StatusRefreshTime = minrate;
	self.StatusBarSize = minrate;
	self.StatusBarRes = minrate;
	self.currentammo = minrate;
	self.takedamage = minrate;
	self.dmg_inflicted = minrate;
	self.dmg_recieved = minrate;
	self.dmg_self = minrate;
	self.dmg_team = minrate;
	self.vote = minrate;
	self.bvote = minrate;
	self.is_admin = minrate;
	self.admin_mode = minrate;
	self.velocity = '0 0 0';
	self.angles = '0 0 0';
	self.avelocity = '0 0 0';
	self.origin = '0 0 0';
	self.v_angle = '0 0 0';
	self.view_ofs = '0 0 0';
	self.absmin = '0 0 0';
	self.absmax = '0 0 0';
	self.noise = string_null;
	self.th_pain = SUB_Null;
	self.th_die = SUB_Null;
	setsize (self, '0 0 0', '0 0 0');
	self.nextthink = minrate;
	self.think = SUB_Null;
};

void (entity targ, entity attacker) ClientObituary =
{
	local float rnum;
	local string deathstring;
	local string deathstring2;
	local float attackerteam;
	local float targteam;
	local entity te;

	rnum = random ();
	if (cb_prematch)
	{
		return;
	}
	if ((targ.classname == "player"))
	{
		if ((attacker.classname == "teledeath"))
		{
			bprint (SBAR_GRENS, targ.netname);
			bprint (SBAR_GRENS, " was telefragged by ");
			bprint (SBAR_GRENS, attacker.owner.netname);
			bprint (SBAR_GRENS, "\n");
			if (((attacker.owner.team_no != targ.team_no) || (attacker.owner.team_no < SBAR_GRENS)))
			{
				TF_AddFrags (attacker.owner, SBAR_GRENS, minrate);
			}
			return;
		}
		if ((attacker.classname == "teledeath2"))
		{
			bprint (SBAR_GRENS, "Satan's power deflects ");
			bprint (SBAR_GRENS, targ.netname);
			bprint (SBAR_GRENS, "'s telefrag\n");
			TF_AddFrags (targ, -1, minrate);
			logfrag (targ, targ);
			return;
		}
		if ((deathmsg == 37))
		{
			bprint (SBAR_GRENS, targ.netname);
			bprint (SBAR_GRENS, " shoots his teammate one too many times.\n");
			return;
		}
		if (((attacker.classname == "info_tfgoal") || (attacker.classname == "item_tfgoal")))
		{
			if ((attacker.deathtype != ""))
			{
				bprint (SBAR_GRENS, targ.netname);
				bprint (SBAR_GRENS, attacker.deathtype);
			}
			logfrag (targ, targ);
			return;
		}
		if ((attacker.classname == "player"))
		{
			if ((targ == attacker))
			{
				TF_AddFrags (attacker, -1, minrate);
				bprint (SBAR_GRENS, targ.netname);
				if ((deathmsg == 8))
				{
					if ((targ.playerclass == SBAR_PRINT))
					{
						deathstring = " got splattered by his own grenade\n";
					}
					else
					{
						if ((targ.playerclass == AS_MELEE))
						{
							deathstring = " sat on his own grenade\n";
						}
						else
						{
							if ((targ.playerclass == AS_MISSILE))
							{
								deathstring = " got to know his grenade too well\n";
							}
							else
							{
								if ((targ.playerclass == 5))
								{
									deathstring = " caught the end of his own grenade\n";
								}
								else
								{
									if ((targ.playerclass == 6))
									{
										deathstring = " got too close to his own grenade\n";
									}
									else
									{
										if ((targ.playerclass == 7))
										{
											deathstring = " let his own grenade get the best of him\n";
										}
										else
										{
											if ((targ.playerclass == 8))
											{
												deathstring = " tiptoed over his own grenade\n";
											}
											else
											{
												if ((targ.playerclass == 9))
												{
													deathstring = " stared at his grenade too long\n";
												}
												else
												{
													deathstring = " grenades himself\n";
												}
											}
										}
									}
								}
							}
						}
					}
				}
				else
				{
					if ((deathmsg == 9))
					{
						deathstring = " hammers himself\n";
					}
					else
					{
						if ((deathmsg == enter))
						{
							if ((targ.playerclass == AS_MISSILE))
							{
								deathstring = " practiced his own Mirv dance\n";
							}
							else
							{
								if ((targ.playerclass == 6))
								{
									deathstring = " allowed his Mirv to turn against him\n";
								}
								else
								{
									deathstring = " goes to pieces\n";
								}
							}
						}
						else
						{
							if ((deathmsg == SBAR_200))
							{
								deathstring = " ambushes himself with his own pipebombs\n";
							}
							else
							{
								if ((deathmsg == 40))
								{
									deathstring = " tried to juggle his own pipebombs\n";
								}
								else
								{
									if ((deathmsg == 24))
									{
										deathstring = " chokes on his own gas\n";
									}
									else
									{
										if ((deathmsg == 30))
										{
											deathstring = " explodes his ammo && body\n";
										}
										else
										{
											if ((deathmsg == 41))
											{
												deathstring = " stepped on too many of his own caltrops\n";
											}
											else
											{
												if ((deathmsg == SBAR_400))
												{
													deathstring = " is charred by his own flash grenade\n";
												}
												else
												{
													if ((deathmsg == 31))
													{
														deathstring = " detonates an ammo box too close to him\n";
													}
													else
													{
														if ((deathmsg == 12))
														{
															deathstring = " set the detpack && forgot to run\n";
														}
														else
														{
															if ((deathmsg == 13))
															{
																deathstring = " died impossibly!\n";
															}
															else
															{
																if ((deathmsg == 6))
																{
																	if (rnum)
																	{
																		deathstring = " becomes bored with life\n";
																	}
																	else
																	{
																		deathstring = " checks if his weapon is loaded\n";
																	}
																}
																else
																{
																	if ((deathmsg == SBAR_384))
																	{
																		deathstring = " chars himself with an incendiary rocket\n";
																	}
																	else
																	{
																		if ((deathmsg == 5))
																		{
																			deathstring = " tries to put the pin back in\n";
																		}
																		else
																		{
																			if ((deathmsg == 15))
																			{
																				deathstring = " torches himself\n";
																			}
																			else
																			{
																				if (((deathmsg == 7) && (targ.waterlevel > SBAR_GRENS)))
																				{
																					bprint (SBAR_GRENS, " discharges into the water.\n");
																					return;
																				}
																				else
																				{
																					if ((deathmsg == 38))
																					{
																						deathstring = " gets too friendly with his sentrygun.\n";
																					}
																					else
																					{
																						if ((deathmsg == 39))
																						{
																							deathstring = " dispenses with himself.\n";
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				bprint (SBAR_GRENS, deathstring);
				return;
			}
			else
			{
				if (((teamplay && (attacker.team_no == targ.team_no)) && (attacker.team_no > minrate)))
				{
					TF_AddFrags (attacker, -1, minrate);
					if ((targ.undercover_team == minrate))
					{
						attacker.teamkills = (attacker.teamkills + SBAR_GRENS);
					}
					deathstring2 = "\n";
					if ((rnum < 0.25))
					{
						deathstring = " mows down teammate ";
						deathstring2 = "\n";
					}
					else
					{
						if ((rnum < 0.5))
						{
							deathstring = " checks his glasses after killing ";
							deathstring2 = "\n";
						}
						else
						{
							if ((rnum < 0.75))
							{
								deathstring = " gets a frag for the other team with ";
								deathstring2 = "'s death\n";
							}
							else
							{
								deathstring = " killed his supposed friend ";
								deathstring2 = "\n";
							}
						}
					}
					if ((deathmsg == 23))
					{
						bprint (SBAR_GRENS, targ.netname);
						bprint (SBAR_GRENS, " didn't survive the operation by ");
						bprint (SBAR_GRENS, attacker.netname);
						bprint (SBAR_GRENS, "\n");
						return;
					}
					bprint (SBAR_GRENS, attacker.netname);
					bprint (SBAR_GRENS, deathstring);
					bprint (SBAR_GRENS, targ.netname);
					bprint (SBAR_GRENS, deathstring2);
					CheckAutoKick (attacker);
					return;
				}
				else
				{
					TF_AddFrags (attacker, SBAR_GRENS, SBAR_GRENS);
					logfrag (attacker, targ);
					if ((deathmsg == 8))
					{
						if ((attacker.playerclass == SBAR_PRINT))
						{
							deathstring = " got up-close && personal with ";
							deathstring2 = "'s grenade\n";
						}
						else
						{
							if ((attacker.playerclass == AS_MELEE))
							{
								deathstring = " played catch with ";
								deathstring2 = "'s grenade\n";
							}
							else
							{
								if ((attacker.playerclass == AS_MISSILE))
								{
									deathstring = " received a pineapple enema from ";
									deathstring2 = "\n";
								}
								else
								{
									if ((attacker.playerclass == 5))
									{
										deathstring = " fetched ";
										deathstring2 = "'s pineapple\n";
									}
									else
									{
										if ((attacker.playerclass == 6))
										{
											deathstring = " caught too much shrapnel from ";
											deathstring2 = "'s grenade\n";
										}
										else
										{
											if ((attacker.playerclass == 7))
											{
												deathstring = " tried to pick up ";
												deathstring2 = "'s hot potato\n";
											}
											else
											{
												if ((attacker.playerclass == 8))
												{
													deathstring = " thought ";
													deathstring2 = " was tossing him a spare grenade\n";
												}
												else
												{
													if ((attacker.playerclass == 9))
													{
														deathstring = " stops to ponder the technical details of ";
														deathstring2 = "'s grenade\n";
													}
													else
													{
														deathstring = " surfs on a grenade from ";
														deathstring2 = "\n";
													}
												}
											}
										}
									}
								}
							}
						}
					}
					else
					{
						if ((deathmsg == 9))
						{
							deathstring = " gets flayed by ";
							deathstring2 = "'s nail grenade\n";
						}
						else
						{
							if ((deathmsg == enter))
							{
								if ((attacker.playerclass == AS_MISSILE))
								{
									deathstring = " does a dance on ";
									deathstring2 = "'s Mirv grenade\n";
								}
								else
								{
									deathstring = " gets spammed by ";
									deathstring2 = "'s Mirv grenade\n";
								}
							}
							else
							{
								if ((deathmsg == SBAR_200))
								{
									deathstring = " is caught by ";
									deathstring2 = "'s pipebomb trap\n";
								}
								else
								{
									if ((deathmsg == 40))
									{
										deathstring = " fell victim to ";
										deathstring2 = "'s fireworks\n";
									}
									else
									{
										if ((deathmsg == 24))
										{
											deathstring = " gags on ";
											deathstring2 = "'s noxious gasses\n";
										}
										else
										{
											if ((deathmsg == 30))
											{
												deathstring = "'s ammo detonates him as ";
												deathstring2 = "'s EMP fries it\n";
											}
											else
											{
												if ((deathmsg == 41))
												{
													deathstring = " stepped on too many of ";
													deathstring2 = "'s caltrops\n";
												}
												else
												{
													if ((deathmsg == SBAR_400))
													{
														deathstring = " is charred by ";
														deathstring2 = "'s flash grenade\n";
													}
													else
													{
														if ((deathmsg == 31))
														{
															deathstring = " stands near some ammo as ";
															deathstring2 = "'s EMP nukes it\n";
														}
														else
														{
															if ((deathmsg == 12))
															{
																deathstring = " reaches orbit via ";
																deathstring2 = "'s detpack\n";
															}
															else
															{
																if ((deathmsg == SBAR_240))
																{
																	deathstring = " cut the red wire of ";
																	deathstring2 = "'s detpack\n";
																}
																else
																{
																	if ((deathmsg == 13))
																	{
																		deathstring = " dies from ";
																		deathstring2 = "'s mysterious tropical disease\n";
																	}
																	else
																	{
																		if ((deathmsg == 14))
																		{
																			deathstring = " escapes infection from ";
																			deathstring2 = " by dying first\n";
																		}
																		else
																		{
																			if ((deathmsg == 5))
																			{
																				deathstring = " eats ";
																				deathstring2 = "'s pineapple\n";
																				if ((targ.health < -40))
																				{
																					deathstring = " was gibbed by ";
																					deathstring2 = "'s grenade\n";
																				}
																			}
																			else
																			{
																				if ((deathmsg == 6))
																				{
																					deathstring = " rides ";
																					deathstring2 = "'s rocket\n";
																					if ((targ.health < -40))
																					{
																						deathstring = " was gibbed by ";
																						deathstring2 = "'s rocket\n";
																					}
																				}
																				else
																				{
																					if ((deathmsg == 15))
																					{
																						if ((rnum < 0.2))
																						{
																							deathstring = " is burnt up by ";
																							deathstring2 = "'s flame\n";
																						}
																						else
																						{
																							if ((rnum < 0.4))
																							{
																								deathstring = " is fried by ";
																								deathstring2 = "'s fire\n";
																							}
																							else
																							{
																								if ((rnum < 0.6))
																								{
																									deathstring = " feels ";
																									deathstring2 = "'s fire of wrath\n";
																								}
																								else
																								{
																									if ((rnum < 0.8))
																									{
																										deathstring = " is reduced to ashes by ";
																										deathstring2 = "\n";
																									}
																									else
																									{
																										deathstring = " is grilled by ";
																										deathstring2 = "'s flame\n";
																									}
																								}
																							}
																						}
																					}
																					else
																					{
																						if ((deathmsg == 17))
																						{
																							deathstring2 = "\n";
																							if ((attacker.playerclass == 8))
																							{
																								deathstring = " was knife-murdered by ";
																							}
																							else
																							{
																								if ((attacker.playerclass == SBAR_GRENS))
																								{
																									deathstring = "'s mellon was split by ";
																								}
																								else
																								{
																									if ((attacker.playerclass == SBAR_PRINT))
																									{
																										deathstring = " was put on the chop block by ";
																									}
																									else
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " was sliced && diced by ";
																											deathstring2 = "'s blade\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == AS_MISSILE))
																											{
																												deathstring = " is split from crotch to sternum by ";
																												deathstring2 = "'s axe swing\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 6))
																												{
																													deathstring = " is split in two with a powerful axe blow from ";
																												}
																												else
																												{
																													if ((attacker.playerclass == 7))
																													{
																														deathstring = "'s death put another notch on ";
																														deathstring2 = "'s axe\n";
																													}
																													else
																													{
																														deathstring = " was ax-murdered by ";
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																						else
																						{
																							if ((deathmsg == space))
																							{
																								deathstring = " was spanner-murdered by ";
																								deathstring2 = "\n";
																							}
																							else
																							{
																								if ((deathmsg == SBAR_GRENS))
																								{
																									if ((attacker.playerclass == SBAR_GRENS))
																									{
																										deathstring = " got too close to ";
																										deathstring2 = "'s muzzleflash\n";
																									}
																									else
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " practices being ";
																											deathstring2 = "'s clay pigeon\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == AS_MISSILE))
																											{
																												deathstring = " was on the receiving end of ";
																												deathstring2 = "'s shotgun barrel\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 5))
																												{
																													deathstring = " was fed a lead diet by ";
																													deathstring2 = "\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 6))
																													{
																														deathstring = " got blasted by ";
																														deathstring2 = "'s last resort\n";
																													}
																													else
																													{
																														if ((attacker.playerclass == 7))
																														{
																															deathstring = " got more than a powderburn from ";
																															deathstring2 = "'s shotgun blast\n";
																														}
																														else
																														{
																															deathstring = " chewed on ";
																															deathstring2 = "'s boomstick\n";
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																								else
																								{
																									if ((deathmsg == SBAR_PRINT))
																									{
																										if ((attacker.playerclass == AS_MELEE))
																										{
																											deathstring = " was turned into swiss cheese by ";
																											deathstring2 = "'s buckshot\n";
																										}
																										else
																										{
																											if ((attacker.playerclass == 5))
																											{
																												deathstring = " got a double-dose of ";
																												deathstring2 = "'s buckshot\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == 6))
																												{
																													deathstring = " unfortunately forgot ";
																													deathstring2 = " carried a super-shotgun\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 8))
																													{
																														deathstring = " gets ventilated by ";
																														deathstring2 = "'s super-shotgun blast\n";
																													}
																													else
																													{
																														if ((attacker.playerclass == 9))
																														{
																															deathstring = "'s body got chuck full of ";
																															deathstring2 = "'s lead pellets\n";
																														}
																														else
																														{
																															deathstring = " ate 2 loads of ";
																															deathstring2 = "'s buckshot\n";
																														}
																													}
																												}
																											}
																										}
																									}
																									else
																									{
																										if ((deathmsg == AS_MELEE))
																										{
																											if ((attacker.playerclass == SBAR_GRENS))
																											{
																												deathstring = " caught one too many nails from ";
																												deathstring2 = "\n";
																											}
																											else
																											{
																												if ((attacker.playerclass == SBAR_PRINT))
																												{
																													deathstring = " ran into ";
																													deathstring2 = "'s nails\n";
																												}
																												else
																												{
																													if ((attacker.playerclass == 8))
																													{
																														deathstring = " was turned into ";
																														deathstring2 = "'s pin-cushion\n";
																													}
																													else
																													{
																														deathstring = " was nailed by ";
																														deathstring2 = "\n";
																													}
																												}
																											}
																										}
																										else
																										{
																											if ((deathmsg == AS_MISSILE))
																											{
																												deathstring = " was punctured by ";
																												deathstring2 = "\n";
																											}
																											else
																											{
																												if ((deathmsg == 7))
																												{
																													deathstring = " accepts ";
																													if ((attacker.waterlevel > SBAR_GRENS))
																													{
																														deathstring2 = "'s discharge\n";
																													}
																													else
																													{
																														deathstring2 = "'s shaft\n";
																													}
																												}
																												else
																												{
																													if ((deathmsg == 21))
																													{
																														deathstring = " grappled with ";
																														deathstring2 = "\n";
																													}
																													else
																													{
																														if ((deathmsg == COLOR_GREEN))
																														{
																															if ((rnum <= 0.3))
																															{
																																deathstring = " takes a bullet in the chest from ";
																																deathstring2 = "\n";
																															}
																															else
																															{
																																deathstring = " succumbs to sniperfire from ";
																																deathstring2 = "\n";
																															}
																														}
																														else
																														{
																															if ((deathmsg == 29))
																															{
																																if ((rnum <= 0.5))
																																{
																																	deathstring = " gets a third eye from ";
																																	deathstring2 = "\n";
																																}
																																else
																																{
																																	deathstring = " gets his head blown off by ";
																																	deathstring2 = "\n";
																																}
																															}
																															else
																															{
																																if ((deathmsg == 28))
																																{
																																	if ((rnum <= 0.5))
																																	{
																																		deathstring = " is made legless by ";
																																		deathstring2 = "\n";
																																	}
																																	else
																																	{
																																		deathstring = " gets his legs blown off by ";
																																		deathstring2 = "\n";
																																	}
																																}
																																else
																																{
																																	if ((deathmsg == 19))
																																	{
																																		deathstring = " collects ";
																																		deathstring2 = "'s bullet spray.\n";
																																	}
																																	else
																																	{
																																		if ((deathmsg == 20))
																																		{
																																			deathstring = " gets sawn in half by ";
																																			deathstring2 = "\n";
																																		}
																																		else
																																		{
																																			if ((deathmsg == SBAR_300))
																																			{
																																				deathstring = " gets knifed from behind by ";
																																				deathstring2 = "\n";
																																			}
																																			else
																																			{
																																				if ((deathmsg == 25))
																																				{
																																					deathstring = " is put to sleep by ";
																																					deathstring2 = "\n";
																																				}
																																				else
																																				{
																																					if ((deathmsg == 26))
																																					{
																																						deathstring = " gets a hole in his heart from ";
																																						deathstring2 = "'s railgun\n";
																																					}
																																					else
																																					{
																																						if ((deathmsg == SBAR_384))
																																						{
																																							deathstring = " gets well done by ";
																																							deathstring2 = "'s incendiary rocket\n";
																																						}
																																						else
																																						{
																																							if ((deathmsg == 38))
																																							{
																																								deathstring = " gets destroyed by ";
																																								deathstring2 = "'s exploding sentrygun\n";
																																							}
																																							else
																																							{
																																								if ((deathmsg == 39))
																																								{
																																									deathstring = " didn't insert the correct change into ";
																																									deathstring2 = "'s dispenser.\n";
																																								}
																																							}
																																						}
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					if (((attacker.has_disconnected == SBAR_GRENS) || (attacker.netname == string_null)))
					{
						deathstring = " died.";
						deathstring2 = "\n";
					}
					bprint (SBAR_GRENS, targ.netname);
					bprint (SBAR_GRENS, deathstring);
					bprint (SBAR_GRENS, attacker.netname);
					bprint (SBAR_GRENS, deathstring2);
				}
			}
			return;
		}
		else
		{
			if ((attacker.classname == "building_sentrygun"))
			{
				if ((targ == attacker.real_owner))
				{
					if ((deathmsg == quote))
					{
						deathstring = " intercepts his sentry gun's rocket\n";
					}
					else
					{
						if ((deathmsg == SBAR_350))
						{
							deathstring = " crossed his sentry gun's line of fire\n";
						}
						else
						{
							if ((deathmsg == 7))
							{
								deathstring = " crossed his sentry gun's shaft\n";
							}
						}
					}
					bprint (SBAR_GRENS, targ.netname);
					bprint (SBAR_GRENS, deathstring);
				}
				else
				{
					if (((teamplay && (attacker.team_no == targ.team_no)) && (attacker.team_no > minrate)))
					{
						bprint (SBAR_GRENS, targ.netname);
						bprint (SBAR_GRENS, " obstructs his team's sentry gun\n");
					}
					else
					{
						TF_AddFrags (attacker.real_owner, SBAR_GRENS, SBAR_GRENS);
						logfrag (attacker.real_owner, targ);
						if ((deathmsg == quote))
						{
							deathstring = " hates ";
							deathstring2 = "'s sentry gun\n";
						}
						else
						{
							if ((deathmsg == SBAR_350))
							{
								deathstring = " is mown down by ";
								deathstring2 = "'s sentry gun\n";
							}
							else
							{
								if ((deathmsg == 7))
								{
									deathstring = " is electrocuted by ";
									deathstring2 = "'s sentry gun\n";
								}
							}
						}
						bprint (SBAR_GRENS, targ.netname);
						bprint (SBAR_GRENS, deathstring);
						bprint (SBAR_GRENS, attacker.real_owner.netname);
						bprint (SBAR_GRENS, deathstring2);
					}
				}
			}
			else
			{
				logfrag (targ, targ);
				TF_AddFrags (targ, -1, minrate);
				rnum = targ.watertype;
				bprint (SBAR_GRENS, targ.netname);
				if ((rnum == -3))
				{
					if ((random () < 0.5))
					{
						deathstring = " sleeps with the fishes\n";
					}
					else
					{
						deathstring = " sucks it down\n";
					}
				}
				else
				{
					if ((rnum == -4))
					{
						if ((random () < 0.5))
						{
							deathstring = " gulped a load of slime\n";
						}
						else
						{
							deathstring = " can't exist on slime alone\n";
						}
					}
					else
					{
						if ((rnum == -5))
						{
							if ((targ.health < -15))
							{
								deathstring = " burst into flames\n";
							}
							else
							{
								if ((random () < 0.5))
								{
									deathstring = " turned into hot slag\n";
								}
								else
								{
									deathstring = " visits the Volcano God\n";
								}
							}
						}
						else
						{
							if ((attacker.classname == "explo_box"))
							{
								deathstring = " blew up\n";
							}
							else
							{
								if (((attacker.solid == AS_MISSILE) && (attacker != world)))
								{
									deathstring = " was squished\n";
								}
								else
								{
									if ((targ.deathtype == "falling"))
									{
										targ.deathtype = string_null;
										deathstring = " fell to his death\n";
									}
									else
									{
										if (((attacker.classname == "trap_shooter") || (attacker.classname == "trap_spikeshooter")))
										{
											deathstring = " was spiked\n";
										}
										else
										{
											if ((attacker.classname == "fireball"))
											{
												deathstring = " ate a lavaball\n";
											}
											else
											{
												if ((attacker.classname == "trigger_changelevel"))
												{
													deathstring = " tried to leave\n";
												}
												else
												{
													deathstring = " died\n";
												}
											}
										}
									}
								}
							}
						}
					}
				}
				bprint (SBAR_GRENS, deathstring);
			}
		}
	}
	else
	{
		if ((targ.classname == "building_sentrygun"))
		{
			if ((attacker.classname == "teledeath"))
			{
				bprint (SBAR_GRENS, targ.real_owner.netname);
				bprint (SBAR_GRENS, "'s sentrygun was telefragged by ");
				bprint (SBAR_GRENS, attacker.owner.netname);
				bprint (SBAR_GRENS, "\n");
				return;
			}
			if ((attacker.classname == "player"))
			{
				if ((attacker == targ.real_owner))
				{
					bprint (SBAR_GRENS, targ.real_owner.netname);
					bprint (SBAR_GRENS, " destroys his sentrygun\n");
					return;
				}
				bprint (SBAR_GRENS, targ.real_owner.netname);
				bprint (SBAR_GRENS, "'s sentrygun was destroyed by ");
				bprint (SBAR_GRENS, attacker.netname);
				bprint (SBAR_GRENS, "\n");
				if (((attacker.team_no > minrate) && (attacker.team_no == targ.real_owner.team_no)))
				{
					TF_AddFrags (attacker, -1, minrate);
					attacker.teamkills = (attacker.teamkills + SBAR_GRENS);
					CheckAutoKick (attacker);
				}
				else
				{
					TF_AddFrags (attacker, SBAR_GRENS, SBAR_GRENS);
				}
				return;
			}
		}
		else
		{
			if ((targ.classname == "building_dispenser"))
			{
				if (((attacker.team_no > minrate) && (attacker.team_no == targ.real_owner.team_no)))
				{
					TF_AddFrags (attacker, -1, minrate);
					attacker.teamkills = (attacker.teamkills + SBAR_GRENS);
					CheckAutoKick (attacker);
				}
			}
		}
	}
};
void () bubble_bob;
void () Throw_Grapple;
void () T_Dispenser;
void () Headless_Think;

void () player_touch =
{
	local entity Bio;
	local entity te;
	local float v1;
	local float v2;
	local float found;

	if ((self.deadflag > minrate))
	{
		return;
	}
	if ((self.playerclass == 8))
	{
		if ((other.classname == "player"))
		{
			if (((self.undercover_team != minrate) || (self.undercover_skin != minrate)))
			{
				if ((((other.playerclass == 8) || (other.playerclass == SBAR_GRENS)) && (other.team_no != self.team_no)))
				{
					TF_AddFrags (other, SBAR_GRENS, minrate);
					bprint (SBAR_GRENS, other.netname);
					bprint (SBAR_GRENS, " uncovered an enemy spy!\n");
					Spy_RemoveDisguise (self);
				}
			}
			if (((other.undercover_team != minrate) || (other.undercover_skin != minrate)))
			{
				if ((((self.playerclass == 8) || (self.playerclass == SBAR_GRENS)) && (self.team_no != other.team_no)))
				{
					TF_AddFrags (self, SBAR_GRENS, minrate);
					bprint (SBAR_GRENS, self.netname);
					bprint (SBAR_GRENS, " uncovered an enemy spy!\n");
					Spy_RemoveDisguise (other);
				}
			}
		}
	}
	if ((((self.tfstate & SBAR_240) && !cb_prematch) && !practice))
	{
		if (((other.classname == "player") && te.playerclass))
		{
			if (!(other.tfstate & SBAR_240))
			{
				if ((other.playerclass != 5))
				{
					if (!(((teamplay & SBAR_240) && (self.owner.team_no == self.enemy.team_no)) && (self.owner.team_no != minrate)))
					{
						found = minrate;
						te = find (world, classname, "timer");
						while (((te != world) && (found == minrate)))
						{
							if (((te.owner == self) && (te.think == BioInfection_Decay)))
							{
								found = SBAR_GRENS;
							}
							else
							{
								te = find (te, classname, "timer");
							}
						}
						Bio = spawn ();
						Bio.nextthink = SBAR_PRINT;
						Bio.think = BioInfection_Decay;
						Bio.owner = other;
						Bio.classname = "timer";
						Bio.enemy = te.enemy;
						other.tfstate = (other.tfstate | SBAR_240);
						other.infection_team_no = self.infection_team_no;
						sprint (other, SBAR_GRENS, "You have been infected by ");
						sprint (other, SBAR_GRENS, self.netname);
						sprint (other, SBAR_GRENS, "!\n");
						sprint (self, SBAR_GRENS, "You have infected ");
						sprint (self, SBAR_GRENS, other.netname);
						sprint (self, SBAR_GRENS, "!\n");
					}
				}
			}
		}
	}
};

void () player_stand1 = [ 17, player_stand1 ]
{
	self.weaponframe = minrate;
	if ((self.velocity_x || self.velocity_y))
	{
		self.walkframe = minrate;
		player_run ();
		return;
	}
	if ((self.current_weapon <= SBAR_240))
	{
		if ((self.walkframe >= 12))
		{
			self.walkframe = minrate;
		}
		self.frame = (17 + self.walkframe);
	}
	else
	{
		if ((self.walkframe >= 5))
		{
			self.walkframe = minrate;
		}
		self.frame = (12 + self.walkframe);
	}
	self.walkframe = (self.walkframe + SBAR_GRENS);
};

void () player_run = [ 6, player_run ]
{
	self.weaponframe = minrate;
	if ((!self.velocity_x && !self.velocity_y))
	{
		self.walkframe = minrate;
		player_stand1 ();
		return;
	}
	if ((self.current_weapon <= SBAR_240))
	{
		if ((self.walkframe >= 6))
		{
			self.walkframe = minrate;
		}
		self.frame = (minrate + self.walkframe);
	}
	else
	{
		if ((self.walkframe >= 6))
		{
			self.walkframe = minrate;
		}
		self.frame = (self.frame + self.walkframe);
	}
	self.walkframe = (self.walkframe + SBAR_GRENS);
};

void () player_shot1 = [ 113, player_shot2 ]
{
	self.weaponframe = SBAR_GRENS;
	muzzleflash ();
};

void () player_shot2 = [ 114, player_shot3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_shot3 = [ 115, player_shot4 ]
{
	self.weaponframe = AS_MELEE;
};

void () player_shot4 = [ 116, player_shot5 ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_shot5 = [ 117, player_shot6 ]
{
	self.weaponframe = 5;
};

void () player_shot6 = [ 118, player_run ]
{
	self.weaponframe = 6;
};

void () player_autorifle1 = [ 113, player_autorifle2 ]
{
	self.weaponframe = SBAR_GRENS;
	muzzleflash ();
};

void () player_autorifle2 = [ 114, player_autorifle3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_autorifle3 = [ 118, player_run ]
{
	self.weaponframe = 6;
};

void () player_axe1 = [ 119, player_axe2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_axe2 = [ 120, player_axe3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_axe3 = [ 121, player_axe4 ]
{
	self.weaponframe = AS_MELEE;
	if ((self.current_weapon == SBAR_240))
	{
		W_FireAxe ();
	}
	else
	{
		W_FireSpanner ();
	}
};

void () player_axe4 = [ 122, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_axeb1 = [ 125, player_axeb2 ]
{
	self.weaponframe = 5;
};

void () player_axeb2 = [ 126, player_axeb3 ]
{
	self.weaponframe = 6;
};

void () player_axeb3 = [ 127, player_axeb4 ]
{
	self.weaponframe = 7;
	if ((self.current_weapon == SBAR_240))
	{
		W_FireAxe ();
	}
	else
	{
		W_FireSpanner ();
	}
};

void () player_axeb4 = [ 128, player_run ]
{
	self.weaponframe = 8;
};

void () player_axec1 = [ 131, player_axec2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_axec2 = [ 132, player_axec3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_axec3 = [ 133, player_axec4 ]
{
	self.weaponframe = AS_MELEE;
	if ((self.current_weapon == SBAR_240))
	{
		W_FireAxe ();
	}
	else
	{
		W_FireSpanner ();
	}
};

void () player_axec4 = [ 134, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_axed1 = [ 137, player_axed2 ]
{
	self.weaponframe = 5;
};

void () player_axed2 = [ 138, player_axed3 ]
{
	self.weaponframe = 6;
};

void () player_axed3 = [ 139, player_axed4 ]
{
	self.weaponframe = 7;
	if ((self.current_weapon == SBAR_240))
	{
		W_FireAxe ();
	}
	else
	{
		W_FireSpanner ();
	}
};

void () player_axed4 = [ 140, player_run ]
{
	self.weaponframe = 8;
};

void () player_chain1 = [ 137, player_chain1a ]
{
	self.weaponframe = SBAR_GRENS;
	Throw_Grapple ();
};

void () player_chain1a = [ 137, player_chain2 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_chain2 = [ 138, player_chain2a ]
{
	self.weaponframe = AS_MELEE;
};

void () player_chain2a = [ 138, player_chain3 ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_chain3 = [ 139, player_chain3 ]
{
	self.weaponframe = 6;
	if (!self.hook_out)
	{
		player_chain5 ();
		return;
	}
	if ((vlen (self.velocity) >= 750))
	{
		player_chain4 ();
		return;
	}
};

void () player_chain4 = [ 73, player_chain4 ]
{
	self.weaponframe = 6;
	if (!self.hook_out)
	{
		player_chain5 ();
		return;
	}
	if ((vlen (self.velocity) < 750))
	{
		player_chain3 ();
		return;
	}
};

void () player_chain5 = [ 140, player_run ]
{
	self.weaponframe = minrate;
};

void () player_medikit1 = [ 119, player_medikit2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_medikit2 = [ 120, player_medikit3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_medikit3 = [ 121, player_medikit4 ]
{
	self.weaponframe = AS_MELEE;
	W_FireMedikit ();
};

void () player_medikit4 = [ 122, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_medikitb1 = [ 125, player_medikitb2 ]
{
	self.weaponframe = 5;
};

void () player_medikitb2 = [ 126, player_medikitb3 ]
{
	self.weaponframe = 6;
};

void () player_medikitb3 = [ 127, player_medikitb4 ]
{
	self.weaponframe = 7;
	W_FireMedikit ();
};

void () player_medikitb4 = [ 128, player_run ]
{
	self.weaponframe = 8;
};

void () player_medikitc1 = [ 131, player_medikitc2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_medikitc2 = [ 132, player_medikitc3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_medikitc3 = [ 133, player_medikitc4 ]
{
	self.weaponframe = AS_MELEE;
	W_FireMedikit ();
};

void () player_medikitc4 = [ 134, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_medikitd1 = [ 137, player_medikitd2 ]
{
	self.weaponframe = 5;
};

void () player_medikitd2 = [ 138, player_medikitd3 ]
{
	self.weaponframe = 6;
};

void () player_medikitd3 = [ 139, player_medikitd4 ]
{
	self.weaponframe = 7;
	W_FireMedikit ();
};

void () player_medikitd4 = [ 140, player_run ]
{
	self.weaponframe = 8;
};

void () player_bioweapon1 = [ 119, player_bioweapon2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_bioweapon2 = [ 120, player_bioweapon3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_bioweapon3 = [ 121, player_bioweapon4 ]
{
	self.weaponframe = AS_MELEE;
	W_FireBioweapon ();
};

void () player_bioweapon4 = [ 122, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_bioweaponb1 = [ 125, player_bioweaponb2 ]
{
	self.weaponframe = 5;
};

void () player_bioweaponb2 = [ 126, player_bioweaponb3 ]
{
	self.weaponframe = 6;
};

void () player_bioweaponb3 = [ 127, player_bioweaponb4 ]
{
	self.weaponframe = 7;
	W_FireBioweapon ();
};

void () player_bioweaponb4 = [ 128, player_run ]
{
	self.weaponframe = 8;
};

void () player_bioweaponc1 = [ 131, player_bioweaponc2 ]
{
	self.weaponframe = SBAR_GRENS;
};

void () player_bioweaponc2 = [ 132, player_bioweaponc3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_bioweaponc3 = [ 133, player_bioweaponc4 ]
{
	self.weaponframe = AS_MELEE;
	W_FireBioweapon ();
};

void () player_bioweaponc4 = [ 134, player_run ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_bioweapond1 = [ 137, player_bioweapond2 ]
{
	self.weaponframe = 5;
};

void () player_bioweapond2 = [ 138, player_bioweapond3 ]
{
	self.weaponframe = 6;
};

void () player_bioweapond3 = [ 139, player_bioweapond4 ]
{
	self.weaponframe = 7;
	W_FireBioweapon ();
};

void () player_bioweapond4 = [ 140, player_run ]
{
	self.weaponframe = 8;
};

void () player_nail1 = [ 103, player_nail2 ]
{
	muzzleflash ();
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + SBAR_GRENS);
	if ((self.weaponframe == 9))
	{
		self.weaponframe = SBAR_GRENS;
	}
	SuperDamageSound ();
	if ((self.nailpos == minrate))
	{
		W_FireSpikes (AS_MISSILE);
		self.nailpos = SBAR_GRENS;
	}
	else
	{
		W_FireSpikes (-4);
		self.nailpos = minrate;
	}
	Attack_Finished (0.2);
};

void () player_nail2 = [ 104, player_nail1 ]
{
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + SBAR_GRENS);
	if ((self.weaponframe == 9))
	{
		self.weaponframe = SBAR_GRENS;
	}
	Attack_Finished (0.2);
};

void () player_assaultcannonup1 = [ 103, player_assaultcannonup2 ]
{
	if (((!self.button0 || (self.ammo_shells < SBAR_GRENS)) || intermission_running))
	{
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.count = SBAR_GRENS;
		self.heat = minrate;
		player_assaultcannondown1 ();
		return;
	}
	self.fire_held_down = SBAR_GRENS;
	if ((self.heat == SBAR_GRENS))
	{
		sound (self, SBAR_GRENS, "weapons/asscan1.wav", SBAR_GRENS, SBAR_GRENS);
	}
	SuperDamageSound ();
	Attack_Finished (0.1);
	if (((self.heat != SBAR_PRINT) && (self.heat != AS_MISSILE)))
	{
		if ((self.weaponframe >= AS_MELEE))
		{
			self.weaponframe = minrate;
		}
		else
		{
			self.weaponframe = (self.weaponframe + SBAR_GRENS);
		}
	}
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat >= 7))
	{
		self.heat = minrate;
		player_assaultcannon1 ();
	}
};

void () player_assaultcannonup2 = [ 103, player_assaultcannonup1 ]
{
	if ((((!self.button0 || (self.ammo_shells < SBAR_GRENS)) || intermission_running) || !(self.flags & 512)))
	{
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.count = SBAR_GRENS;
		self.heat = minrate;
		player_assaultcannondown1 ();
		return;
	}
	SuperDamageSound ();
	Attack_Finished (0.1);
	if ((((self.heat != SBAR_PRINT) && (self.heat != AS_MISSILE)) && (self.heat != 7)))
	{
		if (((self.weaponframe == SBAR_PRINT) && (self.heat >= 9)))
		{
			self.weaponframe = minrate;
		}
		else
		{
			if ((self.weaponframe >= AS_MELEE))
			{
				self.weaponframe = minrate;
			}
			else
			{
				self.weaponframe = (self.weaponframe + SBAR_GRENS);
			}
		}
	}
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat >= 13))
	{
		self.heat = minrate;
		player_assaultcannon1 ();
	}
};

void () player_assaultcannon1 = [ 103, player_assaultcannon2 ]
{
	if ((vlen (self.velocity) < 150))
	{
		muzzleflash ();
		sound (self, SBAR_GRENS, "weapons/asscan2.wav", SBAR_GRENS, SBAR_GRENS);
		if ((self.weaponframe == SBAR_PRINT))
		{
			self.weaponframe = AS_MISSILE;
		}
		else
		{
			self.weaponframe = SBAR_PRINT;
		}
		SuperDamageSound ();
		W_FireAssaultCannon ();
	}
	else
	{
		sound (self, SBAR_GRENS, "weapons/asscan4.wav", SBAR_GRENS, SBAR_GRENS);
		if ((self.weaponframe == SBAR_PRINT))
		{
			self.weaponframe = minrate;
		}
		else
		{
			self.weaponframe = SBAR_PRINT;
		}
	}
	if (((!self.button0 || (self.ammo_shells < SBAR_GRENS)) || intermission_running))
	{
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.weaponframe = minrate;
		self.count = SBAR_GRENS;
		player_assaultcannondown1 ();
		return;
	}
	Attack_Finished (0.1);
};

void () player_assaultcannon2 = [ 104, player_assaultcannon1 ]
{
	if ((vlen (self.velocity) < redlamp))
	{
		if ((self.weaponframe == SBAR_PRINT))
		{
			self.weaponframe = AS_MISSILE;
		}
		else
		{
			self.weaponframe = SBAR_PRINT;
		}
		SuperDamageSound ();
		W_FireAssaultCannon ();
		self.heat = (self.heat + 0.1);
		stuffcmd (self, "bf\n");
	}
	else
	{
		if ((self.weaponframe == SBAR_PRINT))
		{
			self.weaponframe = minrate;
		}
		else
		{
			self.weaponframe = SBAR_PRINT;
		}
	}
	if (((!self.button0 || (self.ammo_shells < SBAR_GRENS)) || intermission_running))
	{
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		self.weaponframe = minrate;
		self.count = SBAR_GRENS;
		player_assaultcannondown1 ();
		return;
	}
	Attack_Finished (0.1);
};

void () player_assaultcannondown1 = [ 103, player_assaultcannondown1 ]
{
	local entity tcool;

	if ((self.flags & 512))
	{
		if ((self.count == SBAR_GRENS))
		{
			sound (self, SBAR_GRENS, "weapons/asscan3.wav", SBAR_GRENS, SBAR_GRENS);
		}
		if ((self.count >= 15))
		{
			self.heat = minrate;
			self.fire_held_down = minrate;
			self.tfstate = (self.tfstate - (self.tfstate & 2048));
			TeamFortress_SetSpeed (self);
			if (((self.ammo_shells < SBAR_GRENS) || (self.ammo_cells < 7)))
			{
				self.last_weapon = self.current_weapon;
				self.last_weaponmode = self.weaponmode;
				self.current_weapon = W_BestWeapon ();
				W_SetCurrentAmmo ();
				W_PrintWeaponMessage ();
				return;
			}
			player_run ();
			return;
		}
		if (((((self.count != 8) && (self.count != enter)) && (self.count != 12)) && (self.count != 14)))
		{
			if ((self.weaponframe == AS_MELEE))
			{
				self.weaponframe = minrate;
			}
			else
			{
				self.weaponframe = (self.weaponframe + SBAR_GRENS);
			}
		}
		self.count = (self.count + SBAR_GRENS);
		Attack_Finished (0.1);
	}
	else
	{
		self.heat = minrate;
		self.fire_held_down = minrate;
		self.tfstate = (self.tfstate - (self.tfstate & 2048));
		TeamFortress_SetSpeed (self);
		if (((self.ammo_shells < SBAR_GRENS) || (self.ammo_cells < 7)))
		{
			self.last_weapon = self.current_weapon;
			self.last_weaponmode = self.weaponmode;
			self.current_weapon = W_BestWeapon ();
			W_SetCurrentAmmo ();
			W_PrintWeaponMessage ();
			return;
		}
		player_run ();
		return;
	}
};

void () player_light1 = [ 105, player_light2 ]
{
	muzzleflash ();
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + SBAR_GRENS);
	if ((self.weaponframe == 5))
	{
		self.weaponframe = SBAR_GRENS;
	}
	SuperDamageSound ();
	W_FireLightning ();
	Attack_Finished (0.2);
};

void () player_light2 = [ 106, player_light1 ]
{
	if ((!self.button0 || intermission_running))
	{
		player_run ();
		return;
	}
	self.weaponframe = (self.weaponframe + SBAR_GRENS);
	if ((self.weaponframe == 5))
	{
		self.weaponframe = SBAR_GRENS;
	}
	SuperDamageSound ();
	W_FireLightning ();
	Attack_Finished (0.2);
};

void () player_rocket1 = [ 107, player_rocket2 ]
{
	self.weaponframe = SBAR_GRENS;
	muzzleflash ();
};

void () player_rocket2 = [ 108, player_rocket3 ]
{
	self.weaponframe = SBAR_PRINT;
};

void () player_rocket3 = [ 109, player_rocket4 ]
{
	self.weaponframe = AS_MELEE;
};

void () player_rocket4 = [ 110, player_rocket5 ]
{
	self.weaponframe = AS_MISSILE;
};

void () player_rocket5 = [ 111, player_rocket6 ]
{
	self.weaponframe = 5;
};

void () player_rocket6 = [ 112, player_run ]
{
	self.weaponframe = 6;
};
void (float num_bubbles) DeathBubbles;

void () PainSound =
{
	local float rs;

	if ((self.health < minrate))
	{
		return;
	}
	if ((damage_attacker.classname == "teledeath"))
	{
		sound (self, SBAR_PRINT, "player/teledth1.wav", SBAR_GRENS, minrate);
		return;
	}
	if (((self.watertype == -3) && (self.waterlevel == AS_MELEE)))
	{
		DeathBubbles (SBAR_GRENS);
		if ((random () > 0.5))
		{
			sound (self, SBAR_PRINT, "player/drown1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_PRINT, "player/drown2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		return;
	}
	if ((self.watertype == -4))
	{
		if ((random () > 0.5))
		{
			sound (self, SBAR_PRINT, "player/lburn1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_PRINT, "player/lburn2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		return;
	}
	if ((self.watertype == -5))
	{
		if ((random () > 0.5))
		{
			sound (self, SBAR_PRINT, "player/lburn1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_PRINT, "player/lburn2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		return;
	}
	if ((self.pain_finished > time))
	{
		self.axhitme = minrate;
		return;
	}
	self.pain_finished = (time + 0.5);
	if ((self.axhitme == SBAR_GRENS))
	{
		self.axhitme = minrate;
		sound (self, SBAR_PRINT, "player/axhit1.wav", SBAR_GRENS, SBAR_GRENS);
		return;
	}
	rs = rint (((random () * 5) + SBAR_GRENS));
	self.noise = "";
	if ((rs == SBAR_GRENS))
	{
		self.noise = "player/pain1.wav";
	}
	else
	{
		if ((rs == SBAR_PRINT))
		{
			self.noise = "player/pain2.wav";
		}
		else
		{
			if ((rs == AS_MELEE))
			{
				self.noise = "player/pain3.wav";
			}
			else
			{
				if ((rs == AS_MISSILE))
				{
					self.noise = "player/pain4.wav";
				}
				else
				{
					if ((rs == 5))
					{
						self.noise = "player/pain5.wav";
					}
					else
					{
						self.noise = "player/pain6.wav";
					}
				}
			}
		}
	}
	sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	return;
};

void () player_pain1 = [ 35, player_pain2 ]
{
	PainSound ();
	self.weaponframe = minrate;
};

void () player_pain2 = [ 36, player_pain3 ]
{
};

void () player_pain3 = [ 37, player_pain4 ]
{
};

void () player_pain4 = [ 38, player_pain5 ]
{
};

void () player_pain5 = [ 39, player_pain6 ]
{
};

void () player_pain6 = [ 40, player_run ]
{
};

void () player_axpain1 = [ 29, player_axpain2 ]
{
	PainSound ();
	self.weaponframe = minrate;
};

void () player_axpain2 = [ 30, player_axpain3 ]
{
};

void () player_axpain3 = [ 31, player_axpain4 ]
{
};

void () player_axpain4 = [ 32, player_axpain5 ]
{
};

void () player_axpain5 = [ 33, player_axpain6 ]
{
};

void () player_axpain6 = [ 34, player_run ]
{
};

void () player_pain =
{
	if (self.weaponframe)
	{
		if ((deathmsg == 37))
		{
			PainSound ();
		}
		return;
	}
	if ((self.invisible_finished > time))
	{
		return;
	}
	if (self.is_feigning)
	{
		PainSound ();
		return;
	}
	if ((self.button0 && (self.current_weapon == 32768)))
	{
		return;
	}
	if ((self.current_weapon <= SBAR_240))
	{
		player_axpain1 ();
	}
	else
	{
		player_pain1 ();
	}
};
void () player_diea1;
void () player_dieb1;
void () player_diec1;
void () player_died1;
void () player_diee1;
void () player_die_ax1;

void () DeathBubblesSpawn =
{
	if ((self.owner.waterlevel != AS_MELEE))
	{
		dremove (self);
		return;
	}
	newmis = spawn ();
	setmodel (newmis, "progs/s_bubble.spr");
	setorigin (newmis, (self.owner.origin + '0 0 24'));
	newmis.movetype = 8;
	newmis.solid = minrate;
	newmis.velocity = '0 0 15';
	newmis.nextthink = (time + 0.5);
	newmis.think = bubble_bob;
	newmis.classname = "bubble";
	newmis.frame = minrate;
	newmis.cnt = minrate;
	setsize (newmis, '-8 -8 -8', '8 8 8');
	self.nextthink = (time + 0.1);
	self.think = DeathBubblesSpawn;
	self.air_finished = (self.air_finished + SBAR_GRENS);
	if ((self.air_finished >= self.bubble_count))
	{
		dremove (self);
	}
};

void (float num_bubbles) DeathBubbles =
{
	local entity bubble_spawner;

	bubble_spawner = spawn ();
	setorigin (bubble_spawner, self.origin);
	bubble_spawner.movetype = minrate;
	bubble_spawner.solid = minrate;
	bubble_spawner.nextthink = (time + 0.1);
	bubble_spawner.think = DeathBubblesSpawn;
	bubble_spawner.air_finished = minrate;
	bubble_spawner.owner = self;
	bubble_spawner.bubble_count = num_bubbles;
	return;
};

void () DeathSound =
{
	local float rs;

	if ((self.waterlevel == AS_MELEE))
	{
		if (self.is_feigning)
		{
			DeathBubbles (SBAR_PRINT);
		}
		else
		{
			DeathBubbles (enter);
		}
		sound (self, SBAR_PRINT, "player/h2odeath.wav", SBAR_GRENS, minrate);
		return;
	}
	rs = rint (((random () * AS_MISSILE) + SBAR_GRENS));
	if ((rs == SBAR_GRENS))
	{
		self.noise = "player/death1.wav";
	}
	if ((rs == SBAR_PRINT))
	{
		self.noise = "player/death2.wav";
	}
	if ((rs == AS_MELEE))
	{
		self.noise = "player/death3.wav";
	}
	if ((rs == AS_MISSILE))
	{
		self.noise = "player/death4.wav";
	}
	if ((rs == 5))
	{
		self.noise = "player/death5.wav";
	}
	sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, minrate);
	return;
};

void () PlayerDead =
{
	self.nextthink = -1;
	self.deadflag = SBAR_PRINT;
};

vector (float dm) VelocityForDamage =
{
	local vector v;

	v_x = (_d * crandom ());
	v_y = (_d * crandom ());
	v_z = (200 + (_d * random ()));
	if ((dm > -50))
	{
		v = (v * 0.7);
	}
	else
	{
		if ((dm > -200))
		{
			v = (v * SBAR_PRINT);
		}
		else
		{
			v = (v * enter);
		}
	}
	return (v);
};

void (string gibname, float dm) ThrowGib =
{
	newmis = spawn ();
	newmis.origin = self.origin;
	setmodel (newmis, gibname);
	setsize (newmis, '0 0 0', '0 0 0');
	newmis.velocity = VelocityForDamage (dm);
	newmis.movetype = enter;
	newmis.solid = minrate;
	newmis.avelocity_x = (random () * 600);
	newmis.avelocity_y = (random () * 600);
	newmis.avelocity_z = (random () * 600);
	newmis.think = SUB_Remove;
	newmis.ltime = time;
	newmis.nextthink = ((time + enter) + (random () * enter));
	newmis.frame = minrate;
	newmis.flags = minrate;
};

void (string gibname, float dm) ThrowHead =
{
	setmodel (self, gibname);
	self.skin = minrate;
	self.frame = minrate;
	self.nextthink = -1;
	self.movetype = enter;
	self.takedamage = minrate;
	self.solid = minrate;
	self.view_ofs = '0 0 8';
	setsize (self, '-16 -16 0', '16 16 56');
	self.velocity = VelocityForDamage (dm);
	self.origin_z = (self.origin_z - 24);
	self.flags = (self.flags - (self.flags & 512));
	self.avelocity = (crandom () * '0 600 0');
};

void (string gibname) HeadShotThrowHead =
{
	setmodel (self, gibname);
	self.frame = minrate;
	self.nextthink = -1;
	self.movetype = enter;
	self.takedamage = minrate;
	self.solid = minrate;
	self.view_ofs = '0 0 8';
	setsize (self, '-16 -16 0', '16 16 56');
	self.velocity = (normalize (self.head_shot_vector) * 600);
	self.origin_z = (self.origin_z + 24);
	self.flags = (self.flags - (self.flags & 512));
	self.avelocity = '0 0 0';
};

void () KillPlayer =
{
	self.owner.deadflag = SBAR_PRINT;
	dremove (self);
};

void () GibPlayer =
{
	ThrowHead ("progs/h_player.mdl", self.health);
	ThrowGib ("progs/gib1.mdl", self.health);
	ThrowGib ("progs/gib2.mdl", self.health);
	ThrowGib ("progs/gib3.mdl", self.health);
	if ((deathmsg == 36))
	{
		newmis = spawn ();
		newmis.owner = self;
		newmis.think = KillPlayer;
		newmis.nextthink = (time + SBAR_GRENS);
	}
	else
	{
		self.deadflag = SBAR_PRINT;
	}
	TeamFortress_SetupRespawn ();
	if ((damage_attacker.classname == "teledeath"))
	{
		sound (self, SBAR_PRINT, "player/teledth1.wav", SBAR_GRENS, minrate);
		self.respawn_time = ((time + SBAR_PRINT) + (random () * SBAR_PRINT));
		return;
	}
	if ((damage_attacker.classname == "teledeath2"))
	{
		sound (self, SBAR_PRINT, "player/teledth1.wav", SBAR_GRENS, minrate);
		self.respawn_time = ((time + SBAR_PRINT) + (random () * SBAR_PRINT));
		return;
	}
	if ((random () < 0.5))
	{
		sound (self, SBAR_PRINT, "player/gib.wav", SBAR_GRENS, minrate);
	}
	else
	{
		sound (self, SBAR_PRINT, "player/udeath.wav", SBAR_GRENS, minrate);
	}
};

void () PlayerDie =
{
	local float i;
	local entity te;
	local string st;

	if (self.hook_out)
	{
		Reset_Grapple (self.hook);
		Attack_Finished (0.75);
		self.hook_out = SBAR_GRENS;
	}
	if ((self.flash_flag == SBAR_GRENS))
	{
		self.flash_flag = minrate;
		W_SetCurrentAmmo ();
		self.flash.think = SUB_Remove;
		self.flash.nextthink = (time + 0.1);
	}
	self.items = (self.items - (self.items & 524288));
	self.invisible_finished = minrate;
	self.invincible_finished = minrate;
	self.super_damage_finished = minrate;
	self.radsuit_finished = minrate;
	self.modelindex = modelindex_player;
	if (((self.tfstate & SBAR_240) && (self == self.enemy)))
	{
		te = find (world, classname, "timer");
		while (te)
		{
			if (((te.owner == self) && (te.think == BioInfection_Decay)))
			{
				logfrag (te.enemy, self);
				TF_AddFrags (te.enemy, SBAR_GRENS, SBAR_GRENS);
			}
			te = find (te, classname, "timer");
		}
	}
	TeamFortress_RemoveTimers ();
	if ((deathmatch || coop))
	{
		DropBackpack ();
		if (tfstrike)
		{
			if (self.is_detpacking)
			{
				self.ammo_detpack = SBAR_GRENS;
			}
			Drop_detpack ();
		}
	}
	self.weaponmodel = "";
	if (rounds)
	{
		self.respawn_time = (time + SBAR_GRENS);
	}
	else
	{
		if ((self.respawn_time < time))
		{
			self.respawn_time = (time + respawn_delay_time);
		}
	}
	self.view_ofs = '0 0 -8';
	self.deadflag = SBAR_GRENS;
	self.solid = minrate;
	self.flags = (self.flags - (self.flags & 512));
	self.movetype = 6;
	if ((!intermission_running && !cb_prematch))
	{
		self.deaths = (self.deaths + SBAR_GRENS);
	}
	if ((self.velocity_z < enter))
	{
		self.velocity_z = (self.velocity_z + (random () * 300));
	}
	if ((self.health < -40))
	{
		if ((infokey (world, "gibs") != "off"))
		{
			GibPlayer ();
			return;
		}
	}
	DeathSound ();
	self.angles_x = minrate;
	self.angles_z = minrate;
	if ((self.current_weapon <= SBAR_240))
	{
		player_die_ax1 ();
		TeamFortress_SetupRespawn ();
		return;
	}
	i = (SBAR_GRENS + floor ((random () * 6)));
	if ((i == SBAR_GRENS))
	{
		player_diea1 ();
	}
	else
	{
		if ((i == SBAR_PRINT))
		{
			player_dieb1 ();
		}
		else
		{
			if ((i == AS_MELEE))
			{
				player_diec1 ();
			}
			else
			{
				if ((i == AS_MISSILE))
				{
					player_died1 ();
				}
				else
				{
					player_diee1 ();
				}
			}
		}
	}
	TeamFortress_SetupRespawn ();
};

void () set_suicide_frame =
{
	if ((self.model != "progs/player.mdl"))
	{
		return;
	}
	setmodel (self, string_null);
	setsize (self, '-16 -16 -24', '16 16 32');
};

void () player_diea1 = [ 50, player_diea2 ]
{
};

void () player_diea2 = [ 51, player_diea3 ]
{
};

void () player_diea3 = [ 52, player_diea4 ]
{
};

void () player_diea4 = [ 53, player_diea5 ]
{
};

void () player_diea5 = [ 54, player_diea6 ]
{
};

void () player_diea6 = [ 55, player_diea7 ]
{
};

void () player_diea7 = [ 56, player_diea8 ]
{
};

void () player_diea8 = [ 57, player_diea9 ]
{
};

void () player_diea9 = [ 58, player_diea10 ]
{
};

void () player_diea10 = [ 59, player_diea11 ]
{
};

void () player_diea11 = [ 60, player_diea11 ]
{
	PlayerDead ();
};

void () player_dieb1 = [ 61, player_dieb2 ]
{
};

void () player_dieb2 = [ 62, player_dieb3 ]
{
};

void () player_dieb3 = [ 63, player_dieb4 ]
{
};

void () player_dieb4 = [ 64, player_dieb5 ]
{
};

void () player_dieb5 = [ 65, player_dieb6 ]
{
};

void () player_dieb6 = [ 66, player_dieb7 ]
{
};

void () player_dieb7 = [ 67, player_dieb8 ]
{
};

void () player_dieb8 = [ 68, player_dieb9 ]
{
};

void () player_dieb9 = [ 69, player_dieb9 ]
{
	PlayerDead ();
};

void () player_diec1 = [ 70, player_diec2 ]
{
};

void () player_diec2 = [ 71, player_diec3 ]
{
};

void () player_diec3 = [ 72, player_diec4 ]
{
};

void () player_diec4 = [ 73, player_diec5 ]
{
};

void () player_diec5 = [ 74, player_diec6 ]
{
};

void () player_diec6 = [ 75, player_diec7 ]
{
};

void () player_diec7 = [ 76, player_diec8 ]
{
};

void () player_diec8 = [ 77, player_diec9 ]
{
};

void () player_diec9 = [ 78, player_diec10 ]
{
};

void () player_diec10 = [ 79, player_diec11 ]
{
};

void () player_diec11 = [ 80, player_diec12 ]
{
};

void () player_diec12 = [ 81, player_diec13 ]
{
};

void () player_diec13 = [ 82, player_diec14 ]
{
};

void () player_diec14 = [ 83, player_diec15 ]
{
};

void () player_diec15 = [ 84, player_diec15 ]
{
	PlayerDead ();
};

void () player_died1 = [ 85, player_died2 ]
{
};

void () player_died2 = [ 86, player_died3 ]
{
};

void () player_died3 = [ 87, player_died4 ]
{
};

void () player_died4 = [ 88, player_died5 ]
{
};

void () player_died5 = [ 89, player_died6 ]
{
};

void () player_died6 = [ 90, player_died7 ]
{
};

void () player_died7 = [ 91, player_died8 ]
{
};

void () player_died8 = [ 92, player_died9 ]
{
};

void () player_died9 = [ 93, player_died9 ]
{
	PlayerDead ();
};

void () player_diee1 = [ 94, player_diee2 ]
{
};

void () player_diee2 = [ 95, player_diee3 ]
{
};

void () player_diee3 = [ 96, player_diee4 ]
{
};

void () player_diee4 = [ 97, player_diee5 ]
{
};

void () player_diee5 = [ 98, player_diee6 ]
{
};

void () player_diee6 = [ 99, player_diee7 ]
{
};

void () player_diee7 = [ 100, player_diee8 ]
{
};

void () player_diee8 = [ 101, player_diee9 ]
{
};

void () player_diee9 = [ 102, player_diee9 ]
{
	PlayerDead ();
};

void () player_die_ax1 = [ 41, player_die_ax2 ]
{
};

void () player_die_ax2 = [ 42, player_die_ax3 ]
{
};

void () player_die_ax3 = [ 43, player_die_ax4 ]
{
};

void () player_die_ax4 = [ 44, player_die_ax5 ]
{
};

void () player_die_ax5 = [ 45, player_die_ax6 ]
{
};

void () player_die_ax6 = [ 46, player_die_ax7 ]
{
};

void () player_die_ax7 = [ 47, player_die_ax8 ]
{
};

void () player_die_ax8 = [ 48, player_die_ax9 ]
{
};

void () player_die_ax9 = [ 49, player_die_ax9 ]
{
	PlayerDead ();
};

void () Headless_Think =
{
	self.frame = (self.frame + SBAR_GRENS);
	if (((self.frame == 7) || (self.frame == COLOR_GREEN)))
	{
		self.nextthink = ((time + enter) + (random () * enter));
		self.think = SUB_Remove;
		return;
	}
	self.nextthink = (time + 0.1);
};
void () door_go_down;
void () door_go_up;

void () door_blocked =
{
	if ((other.classname == "detpack"))
	{
		sprint (other.owner, SBAR_PRINT, "Your detpack was squashed.\n");
		if ((other.weaponmode == SBAR_GRENS))
		{
			TeamFortress_SetSpeed (other.enemy);
			dremove (other.observer_list);
		}
		dremove (other.oldenemy);
		dremove (other);
		return;
	}
	T_Damage (other, self, self, self.dmg);
	if ((self.wait >= minrate))
	{
		if ((self.state == AS_MELEE))
		{
			door_go_up ();
		}
		else
		{
			door_go_down ();
		}
	}
};

void () door_hit_top =
{
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	self.state = minrate;
	if ((self.spawnflags & space))
	{
		return;
	}
	self.think = door_go_down;
	self.nextthink = (self.ltime + self.wait);
};

void () door_hit_bottom =
{
	self.goal_state = SBAR_PRINT;
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	self.state = SBAR_GRENS;
};

void () door_go_down =
{
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
	if (self.max_health)
	{
		self.takedamage = SBAR_GRENS;
		self.health = self.max_health;
	}
	self.state = AS_MELEE;
	SUB_CalcMove (self.pos1, self.speed, door_hit_bottom);
};

void () door_go_up =
{
	if ((self.state == SBAR_PRINT))
	{
		return;
	}
	if ((self.state == minrate))
	{
		self.nextthink = (self.ltime + self.wait);
		return;
	}
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
	self.state = SBAR_PRINT;
	SUB_CalcMove (self.pos2, self.speed, door_hit_top);
	SUB_UseTargets ();
};

void () door_fire =
{
	local entity oself;
	local entity starte;

	if ((self.owner != self))
	{
		objerror ("door_fire: self.owner != self");
	}
	if (self.items)
	{
		sound (self, SBAR_PRINT, self.noise4, SBAR_GRENS, SBAR_GRENS);
	}
	self.message = string_null;
	oself = self;
	if ((self.spawnflags & space))
	{
		if (((self.state == SBAR_PRINT) || (self.state == minrate)))
		{
			starte = self;
			do
			{
				door_go_down ();
				self = self.enemy;

			} while (((self != starte) && (self != world)));
			self = oself;
			return;
		}
	}
	starte = self;
	do
	{
		door_go_up ();
		self = self.enemy;

	} while (((self != starte) && (self != world)));
	self = oself;
};

void () door_use =
{
	local entity oself;

	self.message = "";
	self.owner.message = "";
	self.enemy.message = "";
	oself = self;
	self = self.owner;
	door_fire ();
	self = oself;
};

void () door_trigger_touch =
{
	local entity te;

	if ((freeze == SBAR_GRENS))
	{
		return;
	}
	if ((other.health <= minrate))
	{
		return;
	}
	if (!other.playerclass)
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + SBAR_GRENS);
	activator = other;
	self = self.owner;
	door_use ();
};

void () door_killed =
{
	local entity oself;

	oself = self;
	self = self.owner;
	self.health = self.max_health;
	self.takedamage = minrate;
	door_use ();
	self = oself;
};

void () door_touch =
{
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((self.owner.attack_finished > time))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	self.owner.attack_finished = (time + SBAR_PRINT);
	if ((self.owner.message != ""))
	{
		CenterPrint (other, self.owner.message);
		sound (other, SBAR_PRINT, "misc/talk.wav", SBAR_GRENS, SBAR_GRENS);
	}
	if (!self.items)
	{
		return;
	}
	if (((self.items & other.items) != self.items))
	{
		if ((self.owner.items == 131072))
		{
			if ((world.worldtype == SBAR_PRINT))
			{
				CenterPrint (other, "You need the silver keycard");
				sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				if ((world.worldtype == SBAR_GRENS))
				{
					CenterPrint (other, "You need the silver runekey");
					sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
				}
				else
				{
					if ((world.worldtype == minrate))
					{
						CenterPrint (other, "You need the silver key");
						sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
					}
				}
			}
		}
		else
		{
			if ((world.worldtype == SBAR_PRINT))
			{
				CenterPrint (other, "You need the gold keycard\n");
				sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				if ((world.worldtype == SBAR_GRENS))
				{
					CenterPrint (other, "You need the gold runekey");
					sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
				}
				else
				{
					if ((world.worldtype == minrate))
					{
						CenterPrint (other, "You need the gold key");
						sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
					}
				}
			}
		}
		return;
	}
	other.items = (other.items - self.items);
	other.tf_items = (other.tf_items | self.items);
	self.touch = SUB_Null;
	if (self.enemy)
	{
		self.enemy.touch = SUB_Null;
	}
	door_use ();
};

entity (vector fmins, vector fmaxs) spawn_field =
{
	local entity trigger;
	local vector t1;
	local vector t2;

	trigger = spawn ();
	trigger.movetype = minrate;
	trigger.solid = SBAR_GRENS;
	trigger.owner = self;
	trigger.touch = door_trigger_touch;
	trigger.team_no = self.team_no;
	trigger.playerclass = self.playerclass;
	trigger.items_allowed = self.items_allowed;
	trigger.activate_goal_no = self.activate_goal_no;
	trigger.inactivate_goal_no = self.inactivate_goal_no;
	trigger.remove_goal_no = self.remove_goal_no;
	trigger.restore_goal_no = self.restore_goal_no;
	trigger.activate_group_no = self.activate_group_no;
	trigger.inactivate_group_no = self.inactivate_group_no;
	trigger.remove_group_no = self.remove_group_no;
	trigger.restore_group_no = self.restore_group_no;
	trigger.goal_activation = self.goal_activation;
	trigger.goal_effects = self.goal_effects;
	trigger.goal_result = self.goal_result;
	trigger.goal_group = self.goal_group;
	trigger.all_active = self.all_active;
	trigger.last_impulse = self.last_impulse;
	trigger.else_goal = self.else_goal;
	t1 = fmins;
	t2 = fmaxs;
	setsize (trigger, (t1 - '60 60 8'), (t2 + '60 60 8'));
	return (trigger);
};

float (entity e1, entity e2) EntitiesTouching =
{
	if ((e1.mins_x > e2.maxs_x))
	{
		return (minrate);
	}
	if ((e1.mins_y > e2.maxs_y))
	{
		return (minrate);
	}
	if ((e1.mins_z > e2.maxs_z))
	{
		return (minrate);
	}
	if ((e1.maxs_x < e2.mins_x))
	{
		return (minrate);
	}
	if ((e1.maxs_y < e2.mins_y))
	{
		return (minrate);
	}
	if ((e1.maxs_z < e2.mins_z))
	{
		return (minrate);
	}
	return (SBAR_GRENS);
};

void () LinkDoors =
{
	local entity t;
	local entity starte;
	local vector cmins;
	local vector cmaxs;

	if (self.enemy)
	{
		return;
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		self.enemy = self;
		self.owner = self;
		return;
	}
	cmins = self.mins;
	cmaxs = self.maxs;
	starte = self;
	t = self;
	do
	{
		self.owner = starte;
		if (self.health)
		{
			starte.health = self.health;
		}
		if (self.targetname)
		{
			starte.targetname = self.targetname;
		}
		if ((self.message != ""))
		{
			starte.message = self.message;
		}
		t = find (t, classname, self.classname);
		if (!t)
		{
			self.enemy = starte;
			self = self.owner;
			if (self.health)
			{
				return;
			}
			if (self.targetname)
			{
				return;
			}
			if (self.items)
			{
				return;
			}
			self.owner.trigger_field = spawn_field (cmins, cmaxs);
			return;
		}
		if (EntitiesTouching (self, t))
		{
			if (t.enemy)
			{
				objerror ("cross connected doors");
			}
			self.enemy = t;
			self = t;
			if ((t.mins_x < cmins_x))
			{
				cmins_x = t.mins_x;
			}
			if ((t.mins_y < cmins_y))
			{
				cmins_y = t.mins_y;
			}
			if ((t.mins_z < cmins_z))
			{
				cmins_z = t.mins_z;
			}
			if ((t.maxs_x > cmaxs_x))
			{
				cmaxs_x = t.maxs_x;
			}
			if ((t.maxs_y > cmaxs_y))
			{
				cmaxs_y = t.maxs_y;
			}
			if ((t.maxs_z > cmaxs_z))
			{
				cmaxs_z = t.maxs_z;
			}
		}

	} while (SBAR_GRENS);
};

void () func_door =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if ((world.worldtype == minrate))
	{
		precache_sound ("doors/medtry.wav");
		precache_sound ("doors/meduse.wav");
		self.noise3 = "doors/medtry.wav";
		self.noise4 = "doors/meduse.wav";
	}
	else
	{
		if ((world.worldtype == SBAR_GRENS))
		{
			precache_sound ("doors/runetry.wav");
			precache_sound ("doors/runeuse.wav");
			self.noise3 = "doors/runetry.wav";
			self.noise4 = "doors/runeuse.wav";
		}
		else
		{
			if ((world.worldtype == SBAR_PRINT))
			{
				precache_sound ("doors/basetry.wav");
				precache_sound ("doors/baseuse.wav");
				self.noise3 = "doors/basetry.wav";
				self.noise4 = "doors/baseuse.wav";
			}
			else
			{
				dprint ("no worldtype set!\n");
			}
		}
	}
	if ((self.sounds == minrate))
	{
		precache_sound ("misc/null.wav");
		precache_sound ("misc/null.wav");
		self.noise1 = "misc/null.wav";
		self.noise2 = "misc/null.wav";
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("doors/drclos4.wav");
		precache_sound ("doors/doormv1.wav");
		self.noise1 = "doors/drclos4.wav";
		self.noise2 = "doors/doormv1.wav";
	}
	if ((self.sounds == SBAR_PRINT))
	{
		precache_sound ("doors/hydro1.wav");
		precache_sound ("doors/hydro2.wav");
		self.noise2 = "doors/hydro1.wav";
		self.noise1 = "doors/hydro2.wav";
	}
	if ((self.sounds == AS_MELEE))
	{
		precache_sound ("doors/stndr1.wav");
		precache_sound ("doors/stndr2.wav");
		self.noise2 = "doors/stndr1.wav";
		self.noise1 = "doors/stndr2.wav";
	}
	if ((self.sounds == AS_MISSILE))
	{
		precache_sound ("doors/ddoor1.wav");
		precache_sound ("doors/ddoor2.wav");
		self.noise1 = "doors/ddoor2.wav";
		self.noise2 = "doors/ddoor1.wav";
	}
	SetMovedir ();
	self.max_health = self.health;
	self.solid = AS_MISSILE;
	self.movetype = 7;
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "door";
	self.blocked = door_blocked;
	self.use = door_use;
	if ((self.spawnflags & SBAR_240))
	{
		self.items = 131072;
	}
	if ((self.spawnflags & 8))
	{
		self.items = 262144;
	}
	if (!self.speed)
	{
		self.speed = _d;
	}
	if (!self.wait)
	{
		self.wait = AS_MELEE;
	}
	if (!self.lip)
	{
		self.lip = 8;
	}
	if (!self.dmg)
	{
		self.dmg = SBAR_PRINT;
	}
	self.pos1 = self.origin;
	self.pos2 = (self.pos1 + (self.movedir * (fabs ((self.movedir * self.size)) - self.lip)));
	if ((self.spawnflags & SBAR_GRENS))
	{
		setorigin (self, self.pos2);
		self.pos2 = self.pos1;
		self.pos1 = self.origin;
	}
	self.state = SBAR_GRENS;
	if (self.health)
	{
		self.takedamage = SBAR_GRENS;
		self.th_die = door_killed;
	}
	if (self.items)
	{
		self.wait = -1;
	}
	self.touch = door_touch;
	self.think = LinkDoors;
	self.nextthink = (self.ltime + 0.1);
};
void () fd_secret_move1;
void () fd_secret_move2;
void () fd_secret_move3;
void () fd_secret_move4;
void () fd_secret_move5;
void () fd_secret_move6;
void () fd_secret_done;

void () fd_secret_use =
{
	local float temp;

	self.health = 10000;
	if ((self.origin != self.oldorigin))
	{
		return;
	}
	if ((self.spawnflags & space))
	{
		return;
	}
	self.message = string_null;
	SUB_UseTargets ();
	if (!(self.spawnflags & 8))
	{
		self.th_pain = SUB_Null;
		self.takedamage = minrate;
	}
	self.velocity = '0 0 0';
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	self.nextthink = (self.ltime + 0.1);
	temp = (SBAR_GRENS - (self.spawnflags & SBAR_PRINT));
	makevectors (self.mangle);
	if (!self.t_width)
	{
		if ((self.spawnflags & AS_MISSILE))
		{
			self.t_width = fabs ((v_up * self.size));
		}
		else
		{
			self.t_width = fabs ((v_right * self.size));
		}
	}
	if (!self.t_length)
	{
		self.t_length = fabs ((v_forward * self.size));
	}
	if ((self.spawnflags & AS_MISSILE))
	{
		self.dest1 = (self.origin - (v_up * self.t_width));
	}
	else
	{
		self.dest1 = (self.origin + (v_right * (self.t_width * temp)));
	}
	self.dest2 = (self.dest1 + (v_forward * self.t_length));
	SUB_CalcMove (self.dest1, self.speed, fd_secret_move1);
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
};

void () fd_secret_move1 =
{
	self.nextthink = (self.ltime + SBAR_GRENS);
	self.think = fd_secret_move2;
	sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
};

void () fd_secret_move2 =
{
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
	SUB_CalcMove (self.dest2, self.speed, fd_secret_move3);
};

void () fd_secret_move3 =
{
	sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
	if (!(self.spawnflags & SBAR_GRENS))
	{
		self.nextthink = (self.ltime + self.wait);
		self.think = fd_secret_move4;
	}
};

void () fd_secret_move4 =
{
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
	SUB_CalcMove (self.dest1, self.speed, fd_secret_move5);
};

void () fd_secret_move5 =
{
	self.nextthink = (self.ltime + SBAR_GRENS);
	self.think = fd_secret_move6;
	sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
};

void () fd_secret_move6 =
{
	sound (self, SBAR_PRINT, self.noise2, SBAR_GRENS, SBAR_GRENS);
	SUB_CalcMove (self.oldorigin, self.speed, fd_secret_done);
};

void () fd_secret_done =
{
	if ((!self.targetname || (self.spawnflags & SBAR_240)))
	{
		self.health = 10000;
		self.takedamage = SBAR_GRENS;
		self.th_pain = fd_secret_use;
		self.th_die = fd_secret_use;
	}
	sound (self, SBAR_PRINT, self.noise3, SBAR_GRENS, SBAR_GRENS);
};

void () secret_blocked =
{
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + 0.5);
	T_Damage (other, self, self, self.dmg);
};

void () secret_touch =
{
	if ((freeze == SBAR_GRENS))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if ((self.attack_finished > time))
	{
		return;
	}
	if ((self.spawnflags & space))
	{
		return;
	}
	self.attack_finished = (time + SBAR_PRINT);
	if (self.message)
	{
		CenterPrint (other, self.message);
		sound (other, AS_MISSILE, "misc/talk.wav", SBAR_GRENS, SBAR_GRENS);
	}
};

void () func_door_secret =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if ((self.sounds == minrate))
	{
		self.sounds = AS_MELEE;
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("doors/latch2.wav");
		precache_sound ("doors/winch2.wav");
		precache_sound ("doors/drclos4.wav");
		self.noise1 = "doors/latch2.wav";
		self.noise2 = "doors/winch2.wav";
		self.noise3 = "doors/drclos4.wav";
	}
	if ((self.sounds == SBAR_PRINT))
	{
		precache_sound ("doors/airdoor1.wav");
		precache_sound ("doors/airdoor2.wav");
		self.noise2 = "doors/airdoor1.wav";
		self.noise1 = "doors/airdoor2.wav";
		self.noise3 = "doors/airdoor2.wav";
	}
	if ((self.sounds == AS_MELEE))
	{
		precache_sound ("doors/basesec1.wav");
		precache_sound ("doors/basesec2.wav");
		self.noise2 = "doors/basesec1.wav";
		self.noise1 = "doors/basesec2.wav";
		self.noise3 = "doors/basesec2.wav";
	}
	if (!self.dmg)
	{
		self.dmg = SBAR_PRINT;
	}
	self.mangle = self.angles;
	self.angles = '0 0 0';
	self.solid = AS_MISSILE;
	self.movetype = 7;
	self.classname = "door";
	setmodel (self, self.model);
	setorigin (self, self.origin);
	self.touch = secret_touch;
	self.blocked = secret_blocked;
	self.speed = _2;
	self.use = fd_secret_use;
	if ((!self.targetname || (self.spawnflags & SBAR_240)))
	{
		self.health = 10000;
		self.takedamage = SBAR_GRENS;
		self.th_pain = fd_secret_use;
	}
	self.oldorigin = self.origin;
	if (!self.wait)
	{
		self.wait = 5;
	}
};
void () button_return;

void () button_wait =
{
	self.state = minrate;
	self.nextthink = (self.ltime + self.wait);
	self.think = button_return;
	activator = self.enemy;
	SUB_UseTargets ();
	self.frame = SBAR_GRENS;
};

void () button_done =
{
	self.state = SBAR_GRENS;
};

void () button_return =
{
	self.goal_state = SBAR_PRINT;
	self.state = AS_MELEE;
	SUB_CalcMove (self.pos1, self.speed, button_done);
	self.frame = minrate;
	if (self.health)
	{
		self.takedamage = SBAR_GRENS;
	}
};

void () button_blocked =
{
};

void () button_fire =
{
	if (((self.state == SBAR_PRINT) || (self.state == minrate)))
	{
		return;
	}
	sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	self.state = SBAR_PRINT;
	SUB_CalcMove (self.pos2, self.speed, button_wait);
};

void () button_use =
{
	self.enemy = activator;
	button_fire ();
};

void () button_touch =
{
	local entity te;

	if (cb_prematch)
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if ((self.goal_activation & 8))
	{
		return;
	}
	if (!other.playerclass)
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	self.enemy = other;
	button_fire ();
};

void () button_killed =
{
	if ((self.goal_activation & 8))
	{
		return;
	}
	self.enemy = damage_attacker;
	self.health = self.max_health;
	self.takedamage = minrate;
	button_fire ();
};

void () func_button =
{
	local float gtemp;
	local float ftemp;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if ((self.sounds == minrate))
	{
		precache_sound ("buttons/airbut1.wav");
		self.noise = "buttons/airbut1.wav";
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("buttons/switch21.wav");
		self.noise = "buttons/switch21.wav";
	}
	if ((self.sounds == SBAR_PRINT))
	{
		precache_sound ("buttons/switch02.wav");
		self.noise = "buttons/switch02.wav";
	}
	if ((self.sounds == AS_MELEE))
	{
		precache_sound ("buttons/switch04.wav");
		self.noise = "buttons/switch04.wav";
	}
	SetMovedir ();
	self.movetype = 7;
	self.solid = AS_MISSILE;
	setmodel (self, self.model);
	self.blocked = button_blocked;
	self.use = button_use;
	if (self.health)
	{
		self.max_health = self.health;
		self.th_die = button_killed;
		self.takedamage = SBAR_GRENS;
	}
	else
	{
		self.touch = button_touch;
	}
	if (!self.speed)
	{
		self.speed = 40;
	}
	if (!self.wait)
	{
		self.wait = SBAR_GRENS;
	}
	if (!self.lip)
	{
		self.lip = AS_MISSILE;
	}
	self.state = SBAR_GRENS;
	self.pos1 = self.origin;
	self.pos2 = (self.pos1 + (self.movedir * (fabs ((self.movedir * self.size)) - self.lip)));
	if ((self.spawnflags & space))
	{
		button_fire ();
	}
};
entity stemp;
entity otemp;
entity s;
entity old;
void () TeamFortress_DetpackExplode;

void () trigger_reactivate =
{
	self.solid = SBAR_GRENS;
};

void () multi_wait =
{
	if (self.max_health)
	{
		self.health = self.max_health;
		self.takedamage = SBAR_GRENS;
		self.solid = SBAR_PRINT;
	}
};

void () multi_trigger =
{
	if ((self.nextthink > time))
	{
		return;
	}
	if ((self.classname == "trigger_secret"))
	{
		if ((self.enemy.classname != "player"))
		{
			return;
		}
		found_secrets = (found_secrets + SBAR_GRENS);
		WriteByte (SBAR_PRINT, 28);
	}
	if (self.noise)
	{
		sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	}
	self.takedamage = minrate;
	activator = self.enemy;
	SUB_UseTargets ();
	if ((self.wait > minrate))
	{
		self.think = multi_wait;
		self.nextthink = (time + self.wait);
	}
	else
	{
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = SUB_Remove;
	}
};

void () multi_killed =
{
	self.enemy = damage_attacker;
	multi_trigger ();
};

void () multi_use =
{
	self.enemy = activator;
	multi_trigger ();
};

void () multi_touch =
{
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((freeze == SBAR_GRENS))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((self.movedir != '0 0 0'))
	{
		makevectors (other.angles);
		if (((v_forward * self.movedir) < minrate))
		{
			return;
		}
	}
	self.enemy = other;
	multi_trigger ();
};

void () trigger_multiple =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("misc/secret.wav");
		self.noise = "misc/secret.wav";
	}
	else
	{
		if ((self.sounds == SBAR_PRINT))
		{
			precache_sound ("misc/talk.wav");
			self.noise = "misc/talk.wav";
		}
		else
		{
			if ((self.sounds == AS_MELEE))
			{
				precache_sound ("misc/trigger1.wav");
				self.noise = "misc/trigger1.wav";
			}
		}
	}
	if (!self.wait)
	{
		self.wait = 0.2;
	}
	self.use = multi_use;
	InitTrigger ();
	if (self.health)
	{
		if ((self.spawnflags & SBAR_GRENS))
		{
			objerror ("health && notouch don't make sense\n");
		}
		self.max_health = self.health;
		self.th_die = multi_killed;
		self.takedamage = SBAR_GRENS;
		self.solid = SBAR_PRINT;
		setorigin (self, self.origin);
	}
	else
	{
		if (!(self.spawnflags & SBAR_GRENS))
		{
			self.touch = multi_touch;
		}
	}
};

void () trigger_once =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.wait = -1;
	trigger_multiple ();
};

void () trigger_relay =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.use = SUB_UseTargets;
};

void () trigger_secret =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	total_secrets = (total_secrets + SBAR_GRENS);
	self.wait = -1;
	if (!self.message)
	{
		self.message = "You found a secret area!";
	}
	if (!self.sounds)
	{
		self.sounds = SBAR_GRENS;
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("misc/secret.wav");
		self.noise = "misc/secret.wav";
	}
	else
	{
		if ((self.sounds == SBAR_PRINT))
		{
			precache_sound ("misc/talk.wav");
			self.noise = "misc/talk.wav";
		}
	}
	trigger_multiple ();
};

void () counter_use =
{
	local string junk;

	self.count = (self.count - SBAR_GRENS);
	if ((self.count < minrate))
	{
		return;
	}
	if ((self.count != minrate))
	{
		if (((activator.classname == "player") && ((self.spawnflags & SBAR_GRENS) == minrate)))
		{
			if ((self.count >= AS_MISSILE))
			{
				CenterPrint (activator, "There are more to go...");
			}
			else
			{
				if ((self.count == AS_MELEE))
				{
					CenterPrint (activator, "Only 3 more to go...");
				}
				else
				{
					if ((self.count == SBAR_PRINT))
					{
						CenterPrint (activator, "Only 2 more to go...");
					}
					else
					{
						CenterPrint (activator, "Only 1 more to go...");
					}
				}
			}
		}
		return;
	}
	if (((activator.classname == "player") && ((self.spawnflags & SBAR_GRENS) == minrate)))
	{
		CenterPrint (activator, "Sequence completed!");
	}
	self.enemy = activator;
	multi_trigger ();
};

void () trigger_counter =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.wait = -1;
	if (!self.count)
	{
		self.count = SBAR_PRINT;
	}
	self.use = counter_use;
};

void () play_teleport =
{
	local float v;
	local string tmpstr;

	v = (random () * 5);
	if ((v < SBAR_GRENS))
	{
		tmpstr = "misc/r_tele1.wav";
	}
	else
	{
		if ((v < SBAR_PRINT))
		{
			tmpstr = "misc/r_tele2.wav";
		}
		else
		{
			if ((v < AS_MELEE))
			{
				tmpstr = "misc/r_tele3.wav";
			}
			else
			{
				if ((v < AS_MISSILE))
				{
					tmpstr = "misc/r_tele4.wav";
				}
				else
				{
					tmpstr = "misc/r_tele5.wav";
				}
			}
		}
	}
	sound (self, SBAR_PRINT, tmpstr, SBAR_GRENS, SBAR_GRENS);
	remove (self);
};

void (vector org) spawn_tfog =
{
	s = spawn ();
	s.origin = org;
	s.nextthink = (time + 0.2);
	s.think = play_teleport;
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, SBAR_200);
	WriteCoord (AS_MISSILE, org_x);
	WriteCoord (AS_MISSILE, org_y);
	WriteCoord (AS_MISSILE, org_z);
	multicast (org, SBAR_GRENS);
};

void () tdeath_touch =
{
	local entity spot;

	if ((other == self.owner))
	{
		return;
	}
	if ((other.classname == "player"))
	{
		if ((other.invincible_finished > time))
		{
			self.classname = "teledeath2";
		}
		if ((self.owner.classname != "player"))
		{
			T_Damage (self.owner, self, self, 5000);
			return;
		}
	}
	if (other.health)
	{
		T_Damage (other, self, self, 5000);
	}
};

void (vector org, entity death_owner) spawn_tdeath =
{
	local entity death;

	death = spawn ();
	death.classname = "teledeath";
	death.movetype = minrate;
	death.solid = SBAR_GRENS;
	death.angles = '0 0 0';
	setsize (death, (death_owner.mins - '4 4 4'), (death_owner.maxs + '4 4 4'));
	setorigin (death, org);
	death.touch = tdeath_touch;
	death.nextthink = (time + 0.2);
	death.think = SUB_Remove;
	death.owner = death_owner;
	force_retouch = SBAR_PRINT;
};

void () teleport_touch =
{
	local entity t;
	local entity te;
	local vector org;

	if (self.targetname)
	{
		if ((self.nextthink < time))
		{
			return;
		}
	}
	if ((self.spawnflags & SBAR_GRENS))
	{
		if ((other.classname != "player"))
		{
			return;
		}
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if (((other.health <= minrate) || (other.solid != AS_MELEE)))
	{
		return;
	}
	SUB_UseTargets ();
	spawn_tfog (other.origin);
	t = find (world, targetname, self.target);
	if (!t)
	{
		objerror ("couldn't find target");
	}
	makevectors (t.mangle);
	org = (t.origin + (space * v_forward));
	spawn_tfog (org);
	spawn_tdeath (t.origin, other);
	if (!other.health)
	{
		other.origin = t.origin;
		other.velocity = ((v_forward * other.velocity_x) + (v_forward * other.velocity_y));
		return;
	}
	setorigin (other, t.origin);
	other.angles = t.mangle;
	if ((other.classname == "player"))
	{
		if (((other.weapon == SBAR_GRENS) && other.hook_out))
		{
			sound (other, SBAR_GRENS, "weapons/bounce2.wav", SBAR_GRENS, SBAR_GRENS);
			other.on_hook = minrate;
			other.hook_out = minrate;
			other.fire_held_down = minrate;
			other.weaponframe = minrate;
			other.attack_finished = (time + 0.75);
		}
		other.fixangle = SBAR_GRENS;
		other.teleport_time = (time + 0.7);
		if ((other.flags & 512))
		{
			other.flags = (other.flags - 512);
		}
		other.velocity = (v_forward * 300);
	}
	other.flags = (other.flags - (other.flags & 512));
};

void () info_teleport_destination =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.mangle = self.angles;
	self.angles = '0 0 0';
	self.model = "";
	self.origin = (self.origin + '0 0 27');
	if (!self.targetname)
	{
		objerror ("no targetname");
	}
};

void () teleport_use =
{
	self.nextthink = (time + 0.2);
	force_retouch = SBAR_PRINT;
	self.think = SUB_Null;
};

void () trigger_teleport =
{
	local vector o;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	InitTrigger ();
	self.touch = teleport_touch;
	if (!self.target)
	{
		objerror ("no target");
	}
	self.use = teleport_use;
	if (!(self.spawnflags & SBAR_PRINT))
	{
		precache_sound ("ambience/hum1.wav");
		o = ((self.mins + self.maxs) * 0.5);
		ambientsound (o, "ambience/hum1.wav", 0.5, AS_MELEE);
	}
};

void () trigger_skill_touch =
{
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	cvar_set ("skill", self.message);
};

void () trigger_setskill =
{
	dremove (self);
	return;
};

void () trigger_onlyregistered_touch =
{
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((self.attack_finished > time))
	{
		return;
	}
	self.attack_finished = (time + SBAR_PRINT);
	if (cvar ("registered"))
	{
		self.message = "";
		SUB_UseTargets ();
		remove (self);
	}
	else
	{
		if ((self.message != ""))
		{
			CenterPrint (other, self.message);
			sound (other, AS_MISSILE, "misc/talk.wav", SBAR_GRENS, SBAR_GRENS);
		}
	}
};

void () trigger_onlyregistered =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("misc/talk.wav");
	InitTrigger ();
	self.touch = trigger_onlyregistered_touch;
};

void (entity ent, float amount) hurt_setdamage =
{
	ent.dmg = amount;
	if (!amount)
	{
		ent.solid = minrate;
	}
	else
	{
		ent.solid = SBAR_GRENS;
	}
	ent.nextthink = -1;
};

void () hurt_on =
{
	self.solid = SBAR_GRENS;
	self.nextthink = -1;
};

void () hurt_touch =
{
	local entity te;

	if (other.takedamage)
	{
		if (!Activated (self, other))
		{
			if ((self.else_goal != minrate))
			{
				te = Findgoal (self.else_goal);
				if (te)
				{
					AttemptToActivate (te, other, self);
				}
			}
			return;
		}
		if ((self.cnt > minrate))
		{
			self.cnt = (self.cnt - SBAR_GRENS);
			if ((self.cnt == minrate))
			{
				self.touch = SUB_Null;
				self.nextthink = (time + 0.1);
				self.think = SUB_Remove;
			}
		}
		self.solid = minrate;
		deathmsg = 36;
		TF_T_Damage (other, self, self, self.dmg, SBAR_GRENS, minrate);
		self.think = hurt_on;
		self.nextthink = (time + SBAR_GRENS);
	}
};

void () trigger_hurt =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	InitTrigger ();
	self.touch = hurt_touch;
	if (!self.dmg)
	{
		self.dmg = 5;
	}
};

void () trigger_push_touch =
{
	local entity te;

	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((other.classname == "grenade"))
	{
		other.velocity = ((self.speed * self.movedir) * enter);
	}
	else
	{
		if ((other.health > minrate))
		{
			other.velocity = ((self.speed * self.movedir) * enter);
			if ((other.classname == "player"))
			{
				if ((other.fly_sound < time))
				{
					other.fly_sound = (time + 1.5);
					sound (other, minrate, "ambience/windfly.wav", SBAR_GRENS, SBAR_GRENS);
				}
			}
		}
	}
	if ((self.spawnflags & SBAR_GRENS))
	{
		dremove (self);
	}
};

void () trigger_push =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	InitTrigger ();
	precache_sound ("ambience/windfly.wav");
	self.touch = trigger_push_touch;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void () func_pushable =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	InitTrigger ();
	self.touch = trigger_push_touch;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void () trigger_monsterjump_touch =
{
	if (((other.flags & ((space | SBAR_GRENS) | SBAR_PRINT)) != space))
	{
		return;
	}
	other.velocity_x = (self.movedir_x * self.speed);
	other.velocity_y = (self.movedir_y * self.speed);
	if (!(other.flags & 512))
	{
		return;
	}
	other.flags = (other.flags - 512);
	other.velocity_z = self.height;
};

void () trigger_monsterjump =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.speed)
	{
		self.speed = 200;
	}
	if (!self.height)
	{
		self.height = 200;
	}
	if ((self.angles == '0 0 0'))
	{
		self.angles = '0 360 0';
	}
	InitTrigger ();
	self.touch = trigger_monsterjump_touch;
};
float () TeamFortress_TeamGetWinner;
float () TeamFortress_TeamGetSecond;
float (float tno) TeamFortress_TeamGetScore;
void (float tno) TeamFortress_TeamSetColor;
void (float tno, float scoretoadd) TeamFortress_TeamIncreaseScore;
float (float tno) TeamFortress_TeamGetMaxPlayers;
string (float tno) TeamFortress_TeamGetColorString;
float (float tno) TeamFortress_TeamGetIllegalClasses;
string (entity p) TeamFortress_GetSkin;

float () TeamFortress_TeamPutPlayerInTeam =
{
	local float i;
	local float j;
	local float k;
	local float lowscore;
	local float lowest;
	local float likely_team;
	local string st;

	i = SBAR_GRENS;
	likely_team = (random () * number_of_teams);
	likely_team = ceil (likely_team);
	if ((likely_team == minrate))
	{
		likely_team = number_of_teams;
	}
	lowest = SBAR_384;
	while ((i < (number_of_teams + SBAR_GRENS)))
	{
		j = TeamFortress_TeamGetNoPlayers (i);
		if ((j < lowest))
		{
			if ((TeamFortress_TeamGetMaxPlayers (i) > j))
			{
				lowest = j;
				lowscore = TeamFortress_TeamGetScore (i);
				likely_team = i;
			}
		}
		if ((j == lowest))
		{
			k = TeamFortress_TeamGetScore (i);
			if ((k < lowscore))
			{
				lowscore = k;
				likely_team = i;
			}
		}
		i = (i + SBAR_GRENS);
	}
	return (TeamFortress_TeamSet (likely_team));
};

float (float tno) TeamFortress_TeamGetColor =
{
	if (!self.playerclass)
	{
		return (SBAR_GRENS);
	}
	if ((tno == SBAR_GRENS))
	{
		return (14);
	}
	if ((tno == SBAR_PRINT))
	{
		return (5);
	}
	if ((tno == AS_MELEE))
	{
		return (13);
	}
	if ((tno == AS_MISSILE))
	{
		return (12);
	}
	return (minrate);
};

float (float tno) TeamFortress_GetColor =
{
	if ((tno == SBAR_GRENS))
	{
		return (14);
	}
	if ((tno == SBAR_PRINT))
	{
		return (5);
	}
	if ((tno == AS_MELEE))
	{
		return (13);
	}
	if ((tno == AS_MISSILE))
	{
		return (12);
	}
	return (minrate);
};

void (float tno) TeamFortress_TeamSetColor =
{
	if ((tno == SBAR_GRENS))
	{
		team1col = 14;
		return;
	}
	if ((tno == SBAR_PRINT))
	{
		team2col = 5;
		return;
	}
	if ((tno == AS_MELEE))
	{
		team3col = 13;
		return;
	}
	if ((tno == AS_MISSILE))
	{
		team4col = 12;
		return;
	}
};

string (float tno) GetTeamName =
{
	local string st;

	if ((self.classname == "player"))
	{
		if (!self.playerclass)
		{
			return ("observe");
		}
	}
	if ((tno == SBAR_GRENS))
	{
		st = infokey (world, "team1");
		if ((st == string_null))
		{
			return ("blue");
		}
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			st = infokey (world, "team2");
			if ((st == string_null))
			{
				return ("red");
			}
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				st = infokey (world, "team3");
				if ((st == string_null))
				{
					return ("yell");
				}
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					st = infokey (world, "team4");
					if ((st == string_null))
					{
						return ("gren");
					}
				}
				else
				{
					st = "\"\"";
				}
			}
		}
	}
	return (st);
};

void (entity p) SetTeamName =
{
	local string st;

	stuffcmd (p, "team ");
	st = GetTeamName (p.team_no);
	stuffcmd (p, st);
	stuffcmd (p, "\n");
};

float (float tno) TeamFortress_TeamSet =
{
	local string st;
	local float tc;
	local entity te;

	if ((teamplay < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "Teamplay is not On, so FortressTeams are inactive.\n");
		return (minrate);
	}
	if ((tno == -1))
	{
		if (self.team_no)
		{
			Engineer_RemoveBuildings (self);
			te = find (world, classname, "detpack");
			while (te)
			{
				if ((te.owner == self))
				{
					if ((te.weaponmode == SBAR_GRENS))
					{
						TeamFortress_SetSpeed (te.enemy);
						dremove (te.oldenemy);
						dremove (te.observer_list);
					}
					dremove (te);
					te = world;
				}
				te = find (te, classname, "detpack");
			}
			ClientKill ();
		}
		bprint (SBAR_PRINT, self.netname);
		bprint (SBAR_PRINT, " has joined as an Observer.\n");
		self.team_no = minrate;
		self.playerclass = minrate;
		return (SBAR_GRENS);
	}
	if (((tno > number_of_teams) && (number_of_teams != minrate)))
	{
		sprint (self, SBAR_PRINT, "There can be only ");
		st = ftos (number_of_teams);
		sprint (self, SBAR_PRINT, st);
		sprint (self, SBAR_PRINT, " teams on this map.\nTry again\n");
		return (minrate);
	}
	if ((self.team_no == tno))
	{
		sprint (self, SBAR_PRINT, "You are already in that team. Pick another.\n");
		return (minrate);
	}
	if (self.team_no)
	{
		if ((self.respawn_time > time))
		{
			return (minrate);
		}
		Engineer_RemoveBuildings (self);
		te = find (world, classname, "detpack");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((te.weaponmode == SBAR_GRENS))
				{
					TeamFortress_SetSpeed (te.enemy);
					dremove (te.oldenemy);
					dremove (te.observer_list);
				}
				dremove (te);
				te = world;
			}
			te = find (te, classname, "detpack");
		}
		self.playerclass = minrate;
		ClientKill ();
		if (TeamFortress_TeamIsCivilian (tno))
		{
			self.nextpc = SBAR_200;
		}
		else
		{
			self.nextpc = minrate;
		}
	}
	tc = TeamFortress_TeamGetNoPlayers (tno);
	if ((tc >= TeamFortress_TeamGetMaxPlayers (tno)))
	{
		sprint (self, SBAR_PRINT, "That team is full. Pick another.\n");
		return (minrate);
	}
	if ((TeamFortress_TeamGetColor (tno) == minrate))
	{
		TeamFortress_TeamSetColor (tno);
		if ((TeamFortress_TeamGetColor (tno) == minrate))
		{
			sprint (self, SBAR_PRINT, "You can't start a new team with your color, since another ");
			sprint (self, SBAR_PRINT, "already using that color. Change your pants color, then try again.\n");
			return (minrate);
		}
		bprint (SBAR_PRINT, self.netname);
		bprint (SBAR_PRINT, " has started Team No ");
		st = ftos (tno);
		bprint (SBAR_PRINT, st);
		bprint (SBAR_PRINT, ".\n");
		self.immune_to_check = (time + 5);
		if (((toggleflags & 128) || (toggleflags & 2048)))
		{
			self.frags = TeamFortress_TeamGetScore (tno);
		}
		stuffcmd (self, "color ");
		tc = (TeamFortress_TeamGetColor (tno) - SBAR_GRENS);
		st = ftos (tc);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		self.team_no = tno;
		SetTeamName (self);
		return (SBAR_GRENS);
	}
	bprint (SBAR_PRINT, self.netname);
	bprint (SBAR_PRINT, " has joined Team No ");
	st = ftos (tno);
	bprint (SBAR_PRINT, st);
	bprint (SBAR_PRINT, ".\n");
	self.playerclass = minrate;
	self.team_no = tno;
	self.immune_to_check = (time + 5);
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		self.frags = TeamFortress_TeamGetScore (tno);
	}
	TeamFortress_TeamShowMemberClasses (self);
	return (SBAR_GRENS);
};

void () TeamFortress_CheckTeamCheats =
{
	local string st;
	local string sk;
	local float tc;

	if ((self.immune_to_check > time))
	{
		return;
	}
	if ((self.netname == string_null))
	{
		stuffcmd (self, "disconnect\n");
	}
	else
	{
		CheckAllRates ();
		if (((self.playerclass && (self.team_no == minrate)) && teamplay))
		{
			stuffcmd (self, "disconnect\n");
		}
	}
	if ((teamplay && (self.team_no == minrate)))
	{
		if ((self.motd > _A))
		{
			st = GetTeamName (self.team_no);
			if ((st != infokey (self, "team")))
			{
				SetTeamName (self);
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing team.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your team. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
			st = infokey (self, "bottomcolor");
			tc = stof (st);
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
			}
		}
	}
	if (tfstrike)
	{
		if ((((self.team_no > minrate) && teamplay) && self.playerclass))
		{
			st = infokey (self, "topcolor");
			tc = stof (st);
			if (self.ammo_detpack)
			{
				if (tc)
				{
					stuffcmd (self, "topcolor 0\n");
					if ((self.immune_to_check != floor (time)))
					{
						self.immune_to_check = (floor (time) + SBAR_PRINT);
					}
					else
					{
						bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing top color.\n");
						sprint (self, SBAR_PRINT, "You have been kicked for changing your top color. Don't do it.\n");
						stuffcmd (self, "disconnect\n");
						return;
					}
				}
			}
			else
			{
				if ((self.team_no == SBAR_PRINT))
				{
					if (((self.playerclass == 8) && (self.undercover_team != minrate)))
					{
						return;
					}
					if ((tc != (TeamFortress_GetColor (self.team_no) - SBAR_GRENS)))
					{
						stuffcmd (self, "topcolor ");
						tc = (TeamFortress_GetColor (self.team_no) - SBAR_GRENS);
						st = ftos (tc);
						stuffcmd (self, st);
						stuffcmd (self, "\n");
						if ((self.immune_to_check != floor (time)))
						{
							self.immune_to_check = (floor (time) + SBAR_PRINT);
						}
						else
						{
							bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing top color.\n");
							sprint (self, SBAR_PRINT, "You have been kicked for changing your top color. Don't do it.\n");
							stuffcmd (self, "disconnect\n");
							return;
						}
					}
				}
			}
		}
	}
	if (((self.team_no > minrate) && teamplay))
	{
		st = infokey (self, "bottomcolor");
		tc = stof (st);
		if (((self.playerclass == 8) && (self.undercover_team != minrate)))
		{
			if (((TeamFortress_GetColor (self.undercover_team) - SBAR_GRENS) != tc))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_GetColor (self.undercover_team) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing color.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your pants color. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
		}
		else
		{
			if ((tc != (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS)))
			{
				stuffcmd (self, "color ");
				tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
				st = ftos (tc);
				stuffcmd (self, st);
				stuffcmd (self, "\n");
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing color.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your pants color. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
		}
		if (self.playerclass)
		{
			st = infokey (self, "skin");
			tc = minrate;
			sk = TeamFortress_GetSkin (self);
			if ((st != sk))
			{
				TeamFortress_SetSkin (self);
				if ((self.immune_to_check != floor (time)))
				{
					self.immune_to_check = (floor (time) + SBAR_PRINT);
				}
				else
				{
					bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing skin.\n");
					sprint (self, SBAR_PRINT, "You have been kicked for changing your skin. Don't do it.\n");
					stuffcmd (self, "disconnect\n");
					return;
				}
			}
			if ((tc == 8))
			{
				self.playerclass = 8;
			}
		}
		st = GetTeamName (self.team_no);
		if ((st != infokey (self, "team")))
		{
			SetTeamName (self);
			if ((self.immune_to_check != floor (time)))
			{
				self.immune_to_check = (floor (time) + SBAR_PRINT);
			}
			else
			{
				bprint2 (SBAR_GRENS, self.netname, " has been kicked for changing team.\n");
				sprint (self, SBAR_PRINT, "You have been kicked for changing your team. Don't do it.\n");
				stuffcmd (self, "disconnect\n");
				return;
			}
		}
	}
};

void (float tno, float scoretoadd) TeamFortress_TeamIncreaseScore =
{
	local entity e;

	if (((tno == minrate) || (scoretoadd == minrate)))
	{
		return;
	}
	if ((tno == SBAR_GRENS))
	{
		team1score = (team1score + scoretoadd);
	}
	if ((tno == SBAR_PRINT))
	{
		team2score = (team2score + scoretoadd);
	}
	if ((tno == AS_MELEE))
	{
		team3score = (team3score + scoretoadd);
	}
	if ((tno == AS_MISSILE))
	{
		team4score = (team4score + scoretoadd);
	}
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		e = find (world, classname, "player");
		while (e)
		{
			if ((e.team_no == tno))
			{
				e.frags = TeamFortress_TeamGetScore (tno);
			}
			e = find (e, classname, "player");
		}
	}
};

float (float tno) TeamFortress_TeamGetScore =
{
	if ((tno == SBAR_GRENS))
	{
		return (team1score);
	}
	if ((tno == SBAR_PRINT))
	{
		return (team2score);
	}
	if ((tno == AS_MELEE))
	{
		return (team3score);
	}
	if ((tno == AS_MISSILE))
	{
		return (team4score);
	}
	return (minrate);
};

float (float tno) TeamFortress_TeamGetScoreFrags =
{
	if (((toggleflags & 128) || (toggleflags & 2048)))
	{
		TeamFortress_TeamGetScore (tno);
	}
	else
	{
		if ((tno == SBAR_GRENS))
		{
			return (team1frags);
		}
		if ((tno == SBAR_PRINT))
		{
			return (team2frags);
		}
		if ((tno == AS_MELEE))
		{
			return (team3frags);
		}
		if ((tno == AS_MISSILE))
		{
			return (team4frags);
		}
	}
	return (minrate);
};

float (float tno) TeamFortress_TeamGetNoPlayers =
{
	local float size_team;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.team_no == tno))
		{
			size_team = (size_team + SBAR_GRENS);
		}
		search = find (search, classname, "player");
	}
	if ((tno == minrate))
	{
		search = find (world, classname, "observer");
		while ((search != world))
		{
			if ((search.team_no == tno))
			{
				size_team = (size_team + SBAR_GRENS);
			}
			search = find (search, classname, "observer");
		}
	}
	return (size_team);
};

float (float tno) TeamFortress_GetNoPlayersClass =
{
	local float size_team;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.team_no == tno))
		{
			if (search.playerclass)
			{
				size_team = (size_team + SBAR_GRENS);
			}
		}
		search = find (search, classname, "player");
	}
	return (size_team);
};

float () TeamFortress_NoTeams =
{
	local float no_teams;
	local float i;
	local float p;

	i = SBAR_GRENS;
	p = TeamFortress_GetNoPlayersClass (i);
	while ((i <= number_of_teams))
	{
		p = TeamFortress_GetNoPlayersClass (i);
		if ((p > minrate))
		{
			no_teams = (no_teams + SBAR_GRENS);
		}
		i = (i + SBAR_GRENS);
	}
	return (no_teams);
};

float () TeamFortress_GetNoPlayers =
{
	local float nump;
	local entity search;

	search = find (world, classname, "player");
	while ((search != world))
	{
		if ((search.netname != string_null))
		{
			nump = (nump + SBAR_GRENS);
		}
		search = find (search, classname, "player");
	}
	return (nump);
};

float (float tno) TeamFortress_TeamGetMaxPlayers =
{
	if ((tno == SBAR_GRENS))
	{
		return (team1maxplayers);
	}
	if ((tno == SBAR_PRINT))
	{
		return (team2maxplayers);
	}
	if ((tno == AS_MELEE))
	{
		return (team3maxplayers);
	}
	if ((tno == AS_MISSILE))
	{
		return (team4maxplayers);
	}
	return (minrate);
};

float () TeamFortress_TeamGetWinner =
{
	local float i;
	local float j;
	local float highest;
	local float highestteam;

	i = SBAR_GRENS;
	highest = minrate;
	highestteam = minrate;
	while ((i <= number_of_teams))
	{
		j = TeamFortress_TeamGetScoreFrags (i);
		if ((j > highest))
		{
			highest = j;
			highestteam = i;
		}
		i = (i + SBAR_GRENS);
	}
	return (highestteam);
};

float () TeamFortress_TeamGetSecond =
{
	local float i;
	local float j;
	local float highest;
	local float highestteam;
	local float secondteam;
	local float second;

	i = SBAR_GRENS;
	highestteam = TeamFortress_TeamGetWinner ();
	highest = TeamFortress_TeamGetScoreFrags (highestteam);
	secondteam = minrate;
	second = minrate;
	while ((i <= number_of_teams))
	{
		j = TeamFortress_TeamGetScoreFrags (i);
		if (((j < highest) && (j > second)))
		{
			second = j;
			secondteam = i;
		}
		i = (i + SBAR_GRENS);
	}
	return (secondteam);
};

float () TeamFortress_CheckDraw =
{
	local float i;
	local float j;
	local float score;
	local float score2;
	local float result;
	local float no_teams;

	i = SBAR_GRENS;
	score2 = minrate;
	result = minrate;
	no_teams = TeamFortress_NoTeams ();
	while ((i <= no_teams))
	{
		j = TeamFortress_TeamGetScore (i);
		if ((i > SBAR_GRENS))
		{
			score2 = j;
			if ((score != score2))
			{
				result = minrate;
			}
			else
			{
				result = SBAR_GRENS;
			}
		}
		else
		{
			score = j;
		}
		i = (i + SBAR_GRENS);
	}
	return (result);
};

void (float all) TeamFortress_TeamShowScores =
{
	local string st;
	local float i;
	local float j;

	i = SBAR_GRENS;
	if ((all == SBAR_PRINT))
	{
		while ((i <= number_of_teams))
		{
			if ((TeamFortress_GetColor (i) > minrate))
			{
				j = TeamFortress_TeamGetScore (i);
				st = TeamFortress_TeamGetColorString (i);
				bprint (SBAR_PRINT, st);
				bprint (SBAR_PRINT, ": ");
				st = ftos (j);
				bprint (SBAR_PRINT, st);
				bprint (SBAR_PRINT, " ");
			}
			i = (i + SBAR_GRENS);
		}
		bprint (SBAR_PRINT, "\n");
		return;
	}
	while ((i <= number_of_teams))
	{
		if ((TeamFortress_GetColor (i) > minrate))
		{
			if (all)
			{
				bprint (SBAR_PRINT, "Team ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "Team ");
			}
			st = ftos (i);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, " (");
			}
			else
			{
				sprint (self, SBAR_PRINT, " (");
			}
			st = TeamFortress_TeamGetColorString (i);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, ") : ");
			}
			else
			{
				sprint (self, SBAR_PRINT, ") : ");
			}
			j = TeamFortress_TeamGetScore (i);
			st = ftos (j);
			if (all)
			{
				bprint (SBAR_PRINT, st);
			}
			else
			{
				sprint (self, SBAR_PRINT, st);
			}
			if (all)
			{
				bprint (SBAR_PRINT, "\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "\n");
			}
		}
		i = (i + SBAR_GRENS);
	}
};

string (float tno) TeamFortress_TeamGetColorString =
{
	local float col;

	col = TeamFortress_GetColor (tno);
	if ((col == SBAR_GRENS))
	{
		return ("White");
	}
	if ((col == SBAR_PRINT))
	{
		return ("Brown");
	}
	if ((col == AS_MELEE))
	{
		return ("Blue");
	}
	if ((col == AS_MISSILE))
	{
		return ("Green");
	}
	if ((col == 5))
	{
		return ("Red");
	}
	if ((col == 6))
	{
		return ("Tan");
	}
	if ((col == 7))
	{
		return ("Pink");
	}
	if ((col == 8))
	{
		return ("Orange");
	}
	if ((col == 9))
	{
		return ("Purple");
	}
	if ((col == enter))
	{
		return ("DarkPurple");
	}
	if ((col == SBAR_200))
	{
		return ("Grey");
	}
	if ((col == 12))
	{
		return ("DarkGreen");
	}
	if ((col == 13))
	{
		return ("Yellow");
	}
	return ("DarkBlue");
};

void (entity Player) TeamFortress_TeamShowMemberClasses =
{
	local entity e;
	local float found;

	found = minrate;
	e = find (world, classname, "player");
	while (e)
	{
		if ((((e.team_no == Player.team_no) || (e.team_no == minrate)) && (e != Player)))
		{
			if ((e.model != string_null))
			{
				if (!found)
				{
					found = SBAR_GRENS;
					sprint (self, SBAR_PRINT, "The other members of your team are:\n");
				}
				sprint (Player, SBAR_PRINT, e.netname);
				sprint (Player, SBAR_PRINT, " : ");
				TeamFortress_PrintClassName (Player, e.playerclass, (e.tfstate & 8));
			}
		}
		e = find (e, classname, "player");
	}
	if (!found)
	{
		sprint (Player, SBAR_PRINT, "There are no other players on your team.\n");
	}
};

void () TeamFortress_StatusQuery =
{
	local float ft;
	local string st;

	sprint (self, SBAR_PRINT, "players per team: ");
	ft = TeamFortress_TeamGetNoPlayers (SBAR_GRENS);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (SBAR_PRINT);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (AS_MELEE);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "  ");
	ft = TeamFortress_TeamGetNoPlayers (AS_MISSILE);
	st = ftos (ft);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "\n");
	st = ftos (teamplay);
	sprint (self, SBAR_PRINT, "Teamplay is ");
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, "\n");
};

float (float tno) TeamFortress_TeamGetIllegalClasses =
{
	local entity te;

	te = find (world, classname, "info_tfdetect");
	if ((te != world))
	{
		if ((tno == SBAR_GRENS))
		{
			return (te.maxammo_shells);
		}
		if ((tno == SBAR_PRINT))
		{
			return (te.maxammo_nails);
		}
		if ((tno == AS_MELEE))
		{
			return (te.maxammo_rockets);
		}
		if ((tno == AS_MISSILE))
		{
			return (te.maxammo_cells);
		}
	}
	return (minrate);
};

float (float tno) TeamFortress_TeamIsCivilian =
{
	local entity te;

	if ((tno == SBAR_GRENS))
	{
		if ((civilianteams & SBAR_GRENS))
		{
			return (SBAR_GRENS);
		}
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			if ((civilianteams & SBAR_PRINT))
			{
				return (SBAR_GRENS);
			}
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				if ((civilianteams & AS_MISSILE))
				{
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((civilianteams & 8))
				{
					return (SBAR_GRENS);
				}
			}
		}
	}
	return (minrate);
};

float (float tno) CheckClassAvailable =
{
	local float pc;

	pc = SBAR_GRENS;
	while ((pc < enter))
	{
		if (!ClassIsRestricted (tno, pc))
		{
			return (SBAR_GRENS);
		}
		pc = (pc + SBAR_GRENS);
	}
	return (minrate);
};

float (float tno, float pc) ClassIsRestricted =
{
	local float num;
	local float max;
	local entity te;
	local string st;

	if ((tno == minrate))
	{
		return (minrate);
	}
	if ((pc == SBAR_GRENS))
	{
		st = infokey (world, "cr_scout");
		max = stof (st);
	}
	else
	{
		if ((pc == SBAR_PRINT))
		{
			st = infokey (world, "cr_sniper");
			max = stof (st);
		}
		else
		{
			if ((pc == AS_MELEE))
			{
				st = infokey (world, "cr_soldier");
				max = stof (st);
			}
			else
			{
				if ((pc == AS_MISSILE))
				{
					st = infokey (world, "cr_demoman");
					max = stof (st);
				}
				else
				{
					if ((pc == 5))
					{
						st = infokey (world, "cr_medic");
						max = stof (st);
					}
					else
					{
						if ((pc == 6))
						{
							st = infokey (world, "cr_hwguy");
							max = stof (st);
						}
						else
						{
							if ((pc == 7))
							{
								st = infokey (world, "cr_pyro");
								max = stof (st);
							}
							else
							{
								if ((pc == 8))
								{
									st = infokey (world, "cr_spy");
									max = stof (st);
								}
								else
								{
									if ((pc == 9))
									{
										st = infokey (world, "cr_engineer");
										max = stof (st);
									}
									else
									{
										if ((pc == enter))
										{
											st = infokey (world, "cr_random");
											max = stof (st);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((max == -1))
	{
		return (SBAR_GRENS);
	}
	if ((max > minrate))
	{
		num = minrate;
		te = find (world, classname, "player");
		while (te)
		{
			if ((te.team_no == tno))
			{
				if ((pc == enter))
				{
					if ((te.tfstate & 8))
					{
						num = (num + SBAR_GRENS);
					}
				}
				else
				{
					if (((te.playerclass == pc) || (te.nextpc == pc)))
					{
						if (!(te.tfstate & 8))
						{
							num = (num + SBAR_GRENS);
						}
					}
				}
			}
			te = find (te, classname, "player");
		}
		if ((num >= max))
		{
			return (SBAR_GRENS);
		}
	}
	return (minrate);
};

void (float tno, entity ignore, string st) teamsprint =
{
	local entity te;

	if ((tno == minrate))
	{
		return;
	}
	te = find (world, classname, "player");
	while (te)
	{
		if (((te.team_no == tno) && (te != ignore)))
		{
			sprint (te, SBAR_PRINT, st);
		}
		te = find (te, classname, "player");
	}
};
void () plat_center_touch;
void () plat_outside_touch;
void () plat_trigger_use;
void () plat_go_up;
void () plat_go_down;
void () plat_crush;

void () plat_spawn_inside_trigger =
{
	local entity trigger;
	local vector tmin;
	local vector tmax;

	trigger = spawn ();
	trigger.touch = plat_center_touch;
	trigger.movetype = minrate;
	trigger.solid = SBAR_GRENS;
	trigger.enemy = self;
	trigger.team_no = self.team_no;
	trigger.playerclass = self.playerclass;
	trigger.items_allowed = self.items_allowed;
	trigger.activate_goal_no = self.activate_goal_no;
	trigger.inactivate_goal_no = self.inactivate_goal_no;
	trigger.remove_goal_no = self.remove_goal_no;
	trigger.restore_goal_no = self.restore_goal_no;
	trigger.activate_group_no = self.activate_group_no;
	trigger.inactivate_group_no = self.inactivate_group_no;
	trigger.remove_group_no = self.remove_group_no;
	trigger.restore_group_no = self.restore_group_no;
	trigger.goal_activation = self.goal_activation;
	trigger.goal_effects = self.goal_effects;
	trigger.goal_result = self.goal_result;
	trigger.goal_group = self.goal_group;
	tmin = (self.mins + '25 25 0');
	tmax = (self.maxs - '25 25 -8');
	tmin_z = (tmax_z - ((self.pos1_z - self.pos2_z) + 8));
	if ((self.spawnflags & SBAR_GRENS))
	{
		tmax_z = (tmin_z + 8);
	}
	if ((self.size_x <= _2))
	{
		tmin_x = ((self.mins_x + self.maxs_x) / SBAR_PRINT);
		tmax_x = (tmin_x + SBAR_GRENS);
	}
	if ((self.size_y <= _2))
	{
		tmin_y = ((self.mins_y + self.maxs_y) / SBAR_PRINT);
		tmax_y = (tmin_y + SBAR_GRENS);
	}
	setsize (trigger, tmin, tmax);
};

void () plat_hit_top =
{
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	self.state = minrate;
	self.think = plat_go_down;
	self.nextthink = (self.ltime + AS_MELEE);
};

void () plat_hit_bottom =
{
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	self.state = SBAR_GRENS;
};

void () plat_go_down =
{
	sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	self.state = AS_MELEE;
	SUB_CalcMove (self.pos2, self.speed, plat_hit_bottom);
};

void () plat_go_up =
{
	sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	self.state = SBAR_PRINT;
	SUB_CalcMove (self.pos1, self.speed, plat_hit_top);
};

void () plat_center_touch =
{
	local entity te;

	if ((freeze == SBAR_GRENS))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (!other.playerclass)
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((other.health <= minrate))
	{
		return;
	}
	self = self.enemy;
	if ((self.state == SBAR_GRENS))
	{
		plat_go_up ();
	}
	else
	{
		if ((self.state == minrate))
		{
			self.nextthink = (self.ltime + SBAR_GRENS);
		}
	}
};

void () plat_outside_touch =
{
	local entity te;

	if ((freeze == SBAR_GRENS))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if ((other.health <= minrate))
	{
		return;
	}
	self = self.enemy;
	if ((self.state == minrate))
	{
		plat_go_down ();
	}
};

void () plat_trigger_use =
{
	if (self.think)
	{
		return;
	}
	plat_go_down ();
};

void () plat_crush =
{
	if ((other.classname == "detpack"))
	{
		sprint (other.owner, SBAR_PRINT, "Your detpack was squashed.\n");
		if ((other.weaponmode == SBAR_GRENS))
		{
			TeamFortress_SetSpeed (other.enemy);
			dremove (other.observer_list);
		}
		dremove (other.oldenemy);
		dremove (other);
		return;
	}
	T_Damage (other, self, self, SBAR_GRENS);
	if ((self.state == SBAR_PRINT))
	{
		plat_go_down ();
	}
	else
	{
		if ((self.state == AS_MELEE))
		{
			plat_go_up ();
		}
		else
		{
			objerror ("plat_crush: bad self.state\n");
		}
	}
};

void () plat_use =
{
	self.use = SUB_Null;
	if ((self.state != SBAR_PRINT))
	{
		objerror ("plat_use: not in up state");
	}
	plat_go_down ();
};

void () func_plat =
{
	local entity t;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.t_length)
	{
		self.t_length = _P;
	}
	if (!self.t_width)
	{
		self.t_width = enter;
	}
	if ((self.sounds == minrate))
	{
		self.sounds = SBAR_PRINT;
	}
	if ((self.sounds == SBAR_GRENS))
	{
		precache_sound ("plats/plat1.wav");
		precache_sound ("plats/plat2.wav");
		self.noise = "plats/plat1.wav";
		self.noise1 = "plats/plat2.wav";
	}
	if ((self.sounds == SBAR_PRINT))
	{
		precache_sound ("plats/medplat1.wav");
		precache_sound ("plats/medplat2.wav");
		self.noise = "plats/medplat1.wav";
		self.noise1 = "plats/medplat2.wav";
	}
	self.mangle = self.angles;
	self.angles = '0 0 0';
	self.classname = "plat";
	self.solid = AS_MISSILE;
	self.movetype = 7;
	setorigin (self, self.origin);
	setmodel (self, self.model);
	setsize (self, self.mins, self.maxs);
	self.blocked = plat_crush;
	if (!self.speed)
	{
		self.speed = 150;
	}
	self.pos1 = self.origin;
	self.pos2 = self.origin;
	if (self.height)
	{
		self.pos2_z = (self.origin_z - self.height);
	}
	else
	{
		self.pos2_z = ((self.origin_z - self.size_z) + 8);
	}
	self.use = plat_trigger_use;
	plat_spawn_inside_trigger ();
	if (self.targetname)
	{
		self.state = SBAR_PRINT;
		self.use = plat_use;
	}
	else
	{
		setorigin (self, self.pos2);
		self.state = SBAR_GRENS;
	}
};
void () train_next;
void () func_train_find;

void () train_blocked =
{
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + 0.5);
	T_Damage (other, self, self, self.dmg);
};

void () train_use =
{
	if ((self.think != func_train_find))
	{
		return;
	}
	train_next ();
};

void () train_wait =
{
	if (self.wait)
	{
		self.nextthink = (self.ltime + self.wait);
		sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, SBAR_GRENS);
	}
	else
	{
		self.nextthink = (self.ltime + 0.1);
	}
	self.think = train_next;
};

void () train_next =
{
	local entity targ;

	targ = find (world, targetname, self.target);
	self.target = targ.target;
	if (!self.target)
	{
		objerror ("train_next: no next target");
	}
	if (targ.wait)
	{
		self.wait = targ.wait;
	}
	else
	{
		self.wait = minrate;
	}
	sound (self, SBAR_PRINT, self.noise1, SBAR_GRENS, SBAR_GRENS);
	SUB_CalcMove ((targ.origin - self.mins), self.speed, train_wait);
};

void () func_train_find =
{
	local entity targ;

	targ = find (world, targetname, self.target);
	self.target = targ.target;
	setorigin (self, (targ.origin - self.mins));
	if (!self.targetname)
	{
		self.nextthink = (self.ltime + 0.1);
		self.think = train_next;
	}
};

void () func_train =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.speed)
	{
		self.speed = _d;
	}
	if (!self.target)
	{
		objerror ("func_train without a target");
	}
	if (!self.dmg)
	{
		self.dmg = SBAR_PRINT;
	}
	if ((self.sounds == minrate))
	{
		self.noise = "misc/null.wav";
		precache_sound ("misc/null.wav");
		self.noise1 = "misc/null.wav";
		precache_sound ("misc/null.wav");
	}
	if ((self.sounds == SBAR_GRENS))
	{
		self.noise = "plats/train2.wav";
		precache_sound ("plats/train2.wav");
		self.noise1 = "plats/train1.wav";
		precache_sound ("plats/train1.wav");
	}
	self.cnt = SBAR_GRENS;
	self.solid = AS_MISSILE;
	self.movetype = 7;
	self.blocked = train_blocked;
	self.use = train_use;
	self.classname = "train";
	setmodel (self, self.model);
	setsize (self, self.mins, self.maxs);
	setorigin (self, self.origin);
	self.nextthink = (self.ltime + 0.1);
	self.think = func_train_find;
};

void () misc_teleporttrain =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.speed)
	{
		self.speed = _d;
	}
	if (!self.target)
	{
		objerror ("func_train without a target");
	}
	self.cnt = SBAR_GRENS;
	self.solid = minrate;
	self.movetype = 7;
	self.blocked = train_blocked;
	self.use = train_use;
	self.avelocity = '100 200 300';
	self.noise = "misc/null.wav";
	precache_sound ("misc/null.wav");
	self.noise1 = "misc/null.wav";
	precache_sound ("misc/null.wav");
	precache_model2 ("progs/teleport.mdl");
	setmodel (self, "progs/teleport.mdl");
	setsize (self, self.mins, self.maxs);
	setorigin (self, self.origin);
	self.nextthink = (self.ltime + 0.1);
	self.think = func_train_find;
};

void () info_null =
{
	dremove (self);
};

void () info_notnull =
{
};

void () light_use =
{
	if ((self.spawnflags & SBAR_GRENS))
	{
		lightstyle (self.style, "m");
		self.spawnflags = (self.spawnflags - SBAR_GRENS);
	}
	else
	{
		lightstyle (self.style, "a");
		self.spawnflags = (self.spawnflags + SBAR_GRENS);
	}
};

void () light =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & SBAR_GRENS))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_spot =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & SBAR_GRENS))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_environment =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.targetname)
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & SBAR_GRENS))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
};

void () light_fluoro =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if ((self.style >= space))
	{
		self.use = light_use;
		if ((self.spawnflags & SBAR_GRENS))
		{
			lightstyle (self.style, "a");
		}
		else
		{
			lightstyle (self.style, "m");
		}
	}
	precache_sound ("ambience/fl_hum1.wav");
	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, AS_MELEE);
};

void () light_fluorospark =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = enter;
	}
	precache_sound ("ambience/buzz1.wav");
	ambientsound (self.origin, "ambience/buzz1.wav", 0.5, AS_MELEE);
};

void () light_globe =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/s_light.spr");
	setmodel (self, "progs/s_light.spr");
	makestatic (self);
};

void () FireAmbient =
{
	precache_sound ("ambience/fire1.wav");
	ambientsound (self.origin, "ambience/fire1.wav", 0.5, AS_MELEE);
};

void () light_torch_small_walltorch =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = 8;
	}
	precache_model ("progs/flame.mdl");
	setmodel (self, "progs/flame.mdl");
	FireAmbient ();
	makestatic (self);
};

void () light_flame_large_yellow =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = 7;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	self.frame = SBAR_GRENS;
	FireAmbient ();
	makestatic (self);
};

void () light_flame_small_yellow =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = AS_MELEE;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	FireAmbient ();
	makestatic (self);
};

void () light_flame_small_white =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!self.style)
	{
		self.style = AS_MELEE;
	}
	precache_model ("progs/flame2.mdl");
	setmodel (self, "progs/flame2.mdl");
	FireAmbient ();
	makestatic (self);
};
void () fire_fly;
void () fire_touch;

void () misc_fireball =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_model ("progs/lavaball.mdl");
	self.classname = "fireball";
	self.nextthink = (time + (random () * 5));
	self.think = fire_fly;
	if (!self.speed)
	{
		self.speed = 1000;
	}
};

void () fire_fly =
{
	newmis = spawn ();
	newmis.solid = SBAR_GRENS;
	newmis.movetype = 6;
	newmis.velocity = '0 0 1000';
	newmis.velocity_x = ((random () * _d) - _2);
	newmis.velocity_y = ((random () * _d) - _2);
	newmis.velocity_z = (self.speed + (random () * 200));
	newmis.classname = "fireball";
	setmodel (newmis, "progs/lavaball.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = fire_touch;
	self.nextthink = ((time + (random () * 5)) + AS_MELEE);
	self.think = fire_fly;
};

void () fire_touch =
{
	if (other.takedamage)
	{
		TF_T_Damage (other, self, self, 20, minrate, SBAR_240);
	}
	dremove (self);
};

void () barrel_explode =
{
	self.takedamage = minrate;
	self.classname = "explo_box";
	T_RadiusDamage (self, self, 160, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, (self.origin_z + space));
	multicast (self.origin, SBAR_GRENS);
	remove (self);
};

void () misc_explobox =
{
	local float oldz;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.solid = SBAR_PRINT;
	self.movetype = minrate;
	precache_model ("maps/b_explob.bsp");
	setmodel (self, "maps/b_explob.bsp");
	setsize (self, '0 0 0', '32 32 64');
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = SBAR_PRINT;
	self.origin_z = (self.origin_z + SBAR_PRINT);
	oldz = self.origin_z;
	droptofloor ();
	if (((oldz - self.origin_z) > 250))
	{
		dprint ("item fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
	}
};

void () misc_explobox2 =
{
	local float oldz;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.solid = SBAR_PRINT;
	self.movetype = minrate;
	precache_model2 ("maps/b_exbox2.bsp");
	setmodel (self, "maps/b_exbox2.bsp");
	setsize (self, '0 0 0', '32 32 32');
	precache_sound ("weapons/r_exp3.wav");
	self.health = 20;
	self.th_die = barrel_explode;
	self.takedamage = SBAR_PRINT;
	self.origin_z = (self.origin_z + SBAR_PRINT);
	oldz = self.origin_z;
	droptofloor ();
	if (((oldz - self.origin_z) > 250))
	{
		dprint ("item fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
	}
};
void (vector org, vector vec) LaunchLaser;

void () Laser_Touch =
{
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	sound (self, SBAR_GRENS, "enforcer/enfstop.wav", SBAR_GRENS, AS_MELEE);
	org = (self.origin - (8 * normalize (self.velocity)));
	if (other.health)
	{
		SpawnBlood (org, 15);
		TF_T_Damage (other, self, self.owner, 15, minrate, 8);
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, SBAR_PRINT);
		WriteByte (AS_MISSILE, 5);
		WriteCoord (AS_MISSILE, org_x);
		WriteCoord (AS_MISSILE, org_y);
		WriteCoord (AS_MISSILE, org_z);
		multicast (org, SBAR_PRINT);
	}
	dremove (self);
};

void (vector org, vector vec) LaunchLaser =
{
	sound (self, SBAR_GRENS, "enforcer/enfire.wav", SBAR_GRENS, SBAR_GRENS);
	vec = normalize (vec);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 5;
	newmis.solid = SBAR_PRINT;
	newmis.effects = 8;
	setmodel (newmis, "progs/laser.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
	newmis.velocity = (vec * 900);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = Laser_Touch;
};

void () spikeshooter_use =
{
	if ((self.spawnflags & SBAR_PRINT))
	{
		sound (self, SBAR_PRINT, "enforcer/enfire.wav", SBAR_GRENS, SBAR_GRENS);
		LaunchLaser (self.origin, self.movedir);
	}
	else
	{
		sound (self, SBAR_PRINT, "weapons/spike2.wav", SBAR_GRENS, SBAR_GRENS);
		launch_spike (self.origin, self.movedir);
		newmis.velocity = (self.movedir * 500);
		if ((self.spawnflags & SBAR_GRENS))
		{
			newmis.touch = superspike_touch;
		}
	}
};

void () shooter_think =
{
	spikeshooter_use ();
	self.nextthink = (time + self.wait);
	newmis.velocity = (self.movedir * 500);
};

void () trap_spikeshooter =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	SetMovedir ();
	self.use = spikeshooter_use;
	if ((self.spawnflags & SBAR_PRINT))
	{
		precache_model2 ("progs/laser.mdl");
		precache_sound2 ("enforcer/enfire.wav");
		precache_sound2 ("enforcer/enfstop.wav");
	}
	else
	{
		precache_sound ("weapons/spike2.wav");
	}
};

void () trap_shooter =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	trap_spikeshooter ();
	if ((self.wait == minrate))
	{
		self.wait = SBAR_GRENS;
	}
	self.nextthink = ((self.nextthink + self.wait) + self.ltime);
	self.think = shooter_think;
};
void () make_bubbles;
void () bubble_remove;

void () air_bubbles =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	dremove (self);
};

void () make_bubbles =
{
	newmis = spawn ();
	setmodel (newmis, "progs/s_bubble.spr");
	setorigin (newmis, self.origin);
	newmis.movetype = 8;
	newmis.solid = minrate;
	newmis.velocity = '0 0 15';
	newmis.nextthink = (time + 0.5);
	newmis.think = bubble_bob;
	newmis.touch = bubble_remove;
	newmis.classname = "bubble";
	newmis.frame = minrate;
	newmis.cnt = minrate;
	setsize (newmis, '-8 -8 -8', '8 8 8');
	self.nextthink = ((time + random ()) + 0.5);
	self.think = make_bubbles;
};

void () bubble_split =
{
	newmis = spawn ();
	setmodel (newmis, "progs/s_bubble.spr");
	setorigin (newmis, self.origin);
	newmis.movetype = 8;
	newmis.solid = minrate;
	newmis.velocity = self.velocity;
	newmis.nextthink = (time + 0.5);
	newmis.think = bubble_bob;
	newmis.touch = bubble_remove;
	newmis.classname = "bubble";
	newmis.frame = SBAR_GRENS;
	newmis.cnt = enter;
	setsize (newmis, '-8 -8 -8', '8 8 8');
	self.frame = SBAR_GRENS;
	self.cnt = enter;
	if ((self.waterlevel != AS_MELEE))
	{
		remove (self);
	}
};

void () bubble_remove =
{
	if ((other.classname == self.classname))
	{
		return;
	}
	dremove (self);
};

void () bubble_bob =
{
	local float rnd1;
	local float rnd2;
	local float rnd3;
	local vector vtmp1;
	local vector modi;

	self.cnt = (self.cnt + SBAR_GRENS);
	if ((self.cnt == AS_MISSILE))
	{
		bubble_split ();
	}
	if ((self.cnt == 20))
	{
		dremove (self);
	}
	rnd1 = (self.velocity_x + (-10 + (random () * 20)));
	rnd2 = (self.velocity_y + (-10 + (random () * 20)));
	rnd3 = ((self.velocity_z + enter) + (random () * enter));
	if ((rnd1 > enter))
	{
		rnd1 = 5;
	}
	if ((rnd1 < -10))
	{
		rnd1 = -5;
	}
	if ((rnd2 > enter))
	{
		rnd2 = 5;
	}
	if ((rnd2 < -10))
	{
		rnd2 = -5;
	}
	if ((rnd3 < enter))
	{
		rnd3 = 15;
	}
	if ((rnd3 > 30))
	{
		rnd3 = 25;
	}
	self.velocity_x = rnd1;
	self.velocity_y = rnd2;
	self.velocity_z = rnd3;
	self.nextthink = (time + 0.5);
	self.think = bubble_bob;
};

void () viewthing =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.movetype = minrate;
	self.solid = minrate;
	precache_model ("progs/player.mdl");
	setmodel (self, "progs/player.mdl");
};

void () func_wall_use =
{
	self.frame = (SBAR_GRENS - self.frame);
};

void () func_wall =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () func_illusionary =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	self.angles = '0 0 0';
	self.movetype = minrate;
	self.solid = minrate;
	setmodel (self, self.model);
	makestatic (self);
};

void () func_episodegate =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (!(serverflags & self.spawnflags))
	{
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () func_bossgate =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (((serverflags & 15) == 15))
	{
		return;
	}
	self.angles = '0 0 0';
	self.movetype = 7;
	self.solid = AS_MISSILE;
	self.use = func_wall_use;
	setmodel (self, self.model);
};

void () ambient_suck_wind =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/suck1.wav");
	ambientsound (self.origin, "ambience/suck1.wav", SBAR_GRENS, AS_MELEE);
};

void () ambient_drone =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/drone6.wav");
	ambientsound (self.origin, "ambience/drone6.wav", 0.5, AS_MELEE);
};

void () ambient_flouro_buzz =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/buzz1.wav");
	ambientsound (self.origin, "ambience/buzz1.wav", SBAR_GRENS, AS_MELEE);
};

void () ambient_drip =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/drip1.wav");
	ambientsound (self.origin, "ambience/drip1.wav", 0.5, AS_MELEE);
};

void () ambient_comp_hum =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/comp1.wav");
	ambientsound (self.origin, "ambience/comp1.wav", SBAR_GRENS, AS_MELEE);
};

void () ambient_thunder =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/thunder1.wav");
	ambientsound (self.origin, "ambience/thunder1.wav", 0.5, AS_MELEE);
};

void () ambient_light_buzz =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/fl_hum1.wav");
	ambientsound (self.origin, "ambience/fl_hum1.wav", 0.5, AS_MELEE);
};

void () ambient_swamp1 =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/swamp1.wav");
	ambientsound (self.origin, "ambience/swamp1.wav", 0.5, AS_MELEE);
};

void () ambient_swamp2 =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound ("ambience/swamp2.wav");
	ambientsound (self.origin, "ambience/swamp2.wav", 0.5, AS_MELEE);
};

void () noise_think =
{
	self.nextthink = (time + 0.5);
	sound (self, SBAR_GRENS, "enforcer/enfire.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, SBAR_PRINT, "enforcer/enfstop.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, AS_MELEE, "enforcer/sight1.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, AS_MISSILE, "enforcer/sight2.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, 5, "enforcer/sight3.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, 6, "enforcer/sight4.wav", SBAR_GRENS, SBAR_GRENS);
	sound (self, 7, "enforcer/pain1.wav", SBAR_GRENS, SBAR_GRENS);
};

void () misc_noisemaker =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/idle1.wav");
	self.nextthink = ((time + 0.1) + random ());
	self.think = noise_think;
};

void () monster_ogre =
{
	dremove (self);
};

void () monster_knight =
{
	dremove (self);
};

void () monster_shambler =
{
	dremove (self);
};

void () monster_demon1 =
{
	dremove (self);
};

void () monster_wizard =
{
	dremove (self);
};

void () monster_zombie =
{
	dremove (self);
};

void () monster_dog =
{
	dremove (self);
};

void () monster_hell_knight =
{
	dremove (self);
};

void () monster_tarbaby =
{
	dremove (self);
};

void () monster_vomit =
{
	dremove (self);
};

void () monster_enforcer =
{
	dremove (self);
};

void () monster_shalrath =
{
	dremove (self);
};

void () monster_dragon =
{
	dremove (self);
};

void () monster_army =
{
	dremove (self);
};

void () monster_armagon =
{
	dremove (self);
};

void () monster_gremlin =
{
	dremove (self);
};

void () monster_scourge =
{
	dremove (self);
};

void () FlareGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if ((other == world))
	{
		self.movetype = minrate;
		self.velocity = '0 0 0';
	}
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
		self.touch = SUB_Null;
	}
};

void () FlareGrenadeThink =
{
	local float rnum;
	local float time_left;

	time_left = (self.health - time);
	if ((time_left > SBAR_384))
	{
		rnum = random ();
		if ((rnum < 0.5))
		{
			self.effects = 8;
		}
		else
		{
			self.effects = minrate;
		}
		self.nextthink = ((time + 0.05) + (random () * 0.1));
	}
	else
	{
		if ((time_left > 31))
		{
			rnum = random ();
			if ((rnum < 0.5))
			{
				self.effects = AS_MISSILE;
			}
			else
			{
				self.effects = 8;
			}
			self.nextthink = ((time + 0.05) + (random () * 0.1));
		}
		else
		{
			if ((time_left > 15))
			{
				self.effects = AS_MISSILE;
				self.nextthink = (time + enter);
			}
			else
			{
				if ((time_left < SBAR_GRENS))
				{
					RemoveFlare ();
				}
				else
				{
					self.effects = 8;
					self.nextthink = (time + time_left);
				}
			}
		}
	}
};

void () FlareGrenadeExplode =
{
	if ((self.weapon != minrate))
	{
		increment_team_flares (self.weapon);
		if ((num_team_flares (self.weapon) > (num_max_flares / number_of_teams)))
		{
			RemoveOldFlare (self.weapon);
		}
	}
	else
	{
		num_world_flares = (num_world_flares + SBAR_GRENS);
		if ((num_world_flares > num_max_flares))
		{
			RemoveOldFlare (minrate);
		}
	}
	self.skin = SBAR_GRENS;
	self.health = (time + 40);
	self.nextthink = ((time + 0.05) + (random () * 0.1));
	self.think = FlareGrenadeThink;
};

void () RemoveFlare =
{
	self.effects = (self.effects - (self.effects & AS_MISSILE));
	dremove (self);
	num_world_flares = (num_world_flares - SBAR_GRENS);
	decrement_team_flares (self.weapon);
};
void (entity bld) CheckBelowBuilding;
void (entity gunhead) CheckSentry;
void () Sentry_Target;
float () Sentry_FindTarget;
float () OldSentry_FindTarget;
void () OldSentry_FoundTarget;
void () Sentry_HuntTarget;
void () Sentry_Pain;
void () Sentry_Die;
float () Sentry_Fire;
float () OldSentry_Fire;
void () Sentry_MuzzleFlash;

void () ai_face =
{
	self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
	self.ideal_yaw = anglemod (self.ideal_yaw);
	ChangeYaw ();
};
void () lvl1_sentry_atk3;

void () lvl1_sentry_stand = [ 0, lvl1_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl1_sentry_target = [ 0, lvl1_sentry_target ]
{
	Sentry_Target ();
};

void () lvl1_sentry_atk1 = [ 1, lvl1_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == minrate))
		{
			lvl1_sentry_target ();
		}
	}
	else
	{
		lvl1_sentry_stand ();
		return;
	}
};
void () lvl1_sentry_atk2;

void () lvl1_sentry_atk3 = [ 2, lvl1_sentry_atk2 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl1_sentry_atk2 = [ 0, lvl1_sentry_atk1 ]
{
	ai_face ();
};
void () lvl2_sentry_atk2;
void () lvl2_sentry_atk3;

void () lvl2_sentry_stand = [ 3, lvl2_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl2_sentry_target = [ 3, lvl2_sentry_target ]
{
	Sentry_Target ();
};

void () lvl2_sentry_atk1 = [ 4, lvl2_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == minrate))
		{
			lvl2_sentry_target ();
		}
	}
	else
	{
		lvl2_sentry_stand ();
		return;
	}
};

void () lvl2_sentry_atk2 = [ 5, lvl2_sentry_atk3 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl2_sentry_atk3 = [ 3, lvl2_sentry_atk1 ]
{
	ai_face ();
	Sentry_Fire ();
};
void () lvl3_sentry_atk2;

void () lvl3_sentry_stand = [ 6, lvl3_sentry_stand ]
{
	Sentry_Rotate ();
};

void () lvl3_sentry_target = [ 6, lvl3_sentry_target ]
{
	Sentry_Target ();
};

void () lvl3_sentry_atk1 = [ 7, lvl3_sentry_atk2 ]
{
	ai_face ();
	if (Sentry_FindTarget ())
	{
		if ((Sentry_Fire () == minrate))
		{
			lvl3_sentry_target ();
		}
	}
	else
	{
		lvl3_sentry_stand ();
		return;
	}
};

void () lvl3_sentry_atk2 = [ 8, lvl3_sentry_atk3 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () lvl3_sentry_atk3 = [ 6, lvl3_sentry_atk1 ]
{
	ai_face ();
	Sentry_Fire ();
};

void () Sentry_Target =
{
	if (Sentry_FindTarget ())
	{
		Sentry_HuntTarget ();
	}
};

void () OldSentry_Rotate =
{
	local float ay;
	local entity gunhead;

	self.effects = (self.effects - (self.effects & 8));
	CheckSentry (self);
	if (OldSentry_FindTarget ())
	{
		return;
	}
	if ((self.heat == minrate))
	{
		self.ideal_yaw = self.waitmin;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmin)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = SBAR_GRENS;
			if ((random () < 0.1))
			{
				sound (self, AS_MELEE, "weapons/turridle.wav", SBAR_GRENS, SBAR_GRENS);
			}
		}
	}
	else
	{
		self.ideal_yaw = self.waitmax;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmax)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = minrate;
		}
	}
};

float () Target_IsEnemy =
{
	if ((self.enemy != world))
	{
		if (!self.enemy.is_feigning)
		{
			if ((self.enemy.health > minrate))
			{
				if (visible (self.enemy))
				{
					if (!self.enemy.has_disconnected)
					{
						return (SBAR_GRENS);
					}
				}
			}
		}
	}
	return (minrate);
};
void () lvl1_oldsentry_atk3;

void () lvl1_oldsentry_stand = [ 0, lvl1_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl1_oldsentry_atk1 = [ 1, lvl1_oldsentry_atk3 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl1_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == minrate))
		{
			lvl1_oldsentry_atk3 ();
		}
	}
};

void () lvl1_oldsentry_atk2 = [ 2, lvl1_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl1_oldsentry_atk3 = [ 0, lvl1_oldsentry_atk1 ]
{
	ai_face ();
};
void () lvl2_oldsentry_atk2;
void () lvl2_oldsentry_atk3;

void () lvl2_oldsentry_stand = [ 3, lvl2_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl2_oldsentry_atk1 = [ 4, lvl2_oldsentry_atk2 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl2_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == minrate))
		{
			lvl2_oldsentry_atk3 ();
		}
	}
};

void () lvl2_oldsentry_atk2 = [ 5, lvl2_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl2_oldsentry_atk3 = [ 3, lvl2_oldsentry_atk1 ]
{
	ai_face ();
	OldSentry_Fire ();
};
void () lvl3_oldsentry_atk3;

void () lvl3_oldsentry_stand = [ 6, lvl3_oldsentry_stand ]
{
	OldSentry_Rotate ();
};

void () lvl3_oldsentry_atk1 = [ 7, lvl3_oldsentry_atk2 ]
{
	ai_face ();
	if (!Target_IsEnemy ())
	{
		lvl3_oldsentry_stand ();
	}
	else
	{
		if ((OldSentry_Fire () == minrate))
		{
			lvl3_oldsentry_atk3 ();
		}
	}
};

void () lvl3_oldsentry_atk2 = [ 8, lvl3_oldsentry_atk3 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () lvl3_oldsentry_atk3 = [ 6, lvl3_oldsentry_atk1 ]
{
	ai_face ();
	OldSentry_Fire ();
};

void () Sentry_Rotate =
{
	local float ay;
	local entity gunhead;
	local string st;

	self.effects = (self.effects - (self.effects & 8));
	CheckSentry (self);
	if (Sentry_FindTarget ())
	{
		self.think = Sentry_HuntTarget;
		self.nextthink = (time + sentry_delay);
		sound (self, SBAR_PRINT, "weapons/turrspot.wav", SBAR_GRENS, SBAR_GRENS);
		return;
	}
	if ((self.heat == minrate))
	{
		self.ideal_yaw = self.waitmin;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmin)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = SBAR_GRENS;
			if ((random () < 0.1))
			{
				sound (self, AS_MELEE, "weapons/turridle.wav", SBAR_GRENS, SBAR_GRENS);
			}
		}
	}
	else
	{
		self.ideal_yaw = self.waitmax;
		ChangeYaw ();
		ay = anglemod (self.angles_y);
		ay = rint (ay);
		if ((ay == rint (self.waitmax)))
		{
			CheckBelowBuilding (self.trigger_field);
			self.heat = minrate;
		}
	}
};

float (entity targ) Sentry_InRange =
{
	local float r;

	r = vlen ((self.origin - targ.origin));
	if (((r <= 1350) && infront (targ)))
	{
		return (SBAR_GRENS);
	}
	else
	{
		if ((r < 950))
		{
			return (SBAR_GRENS);
		}
	}
	return (minrate);
};

float () Sentry_FindTarget =
{
	local entity e;
	local float found;
	local float r;

	if (((self.ammo_shells <= minrate) && (self.ammo_rockets <= minrate)))
	{
		return (minrate);
	}
	found = minrate;
	r = minrate;
	e = find (world, classname, "player");
	if (!e)
	{
		found = -1;
	}
	while ((found == minrate))
	{
		if (!e.has_disconnected)
		{
			if ((e != self.real_owner))
			{
				if (!e.is_feigning)
				{
					if (!e.deadflag)
					{
						if (e.takedamage)
						{
							if (!(e.flags & 128))
							{
								if (!(e.items & 524288))
								{
									if (teamplay)
									{
										if (e.team_no)
										{
											if (e.playerclass)
											{
												if ((e.team_no != self.team_no))
												{
													if ((e.undercover_team != self.team_no))
													{
														if ((e.effects & 8))
														{
															if (visible (e))
															{
																if (Sentry_InRange (e))
																{
																	found = SBAR_GRENS;
																}
															}
														}
														else
														{
															if (visible (e))
															{
																if (Sentry_InRange (e))
																{
																	found = SBAR_GRENS;
																}
															}
														}
													}
												}
											}
										}
									}
									else
									{
										if (visible (e))
										{
											if (e.playerclass)
											{
												if (Sentry_InRange (e))
												{
													found = SBAR_GRENS;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if ((found != SBAR_GRENS))
		{
			e = find (e, classname, "player");
			if (!e)
			{
				found = -1;
			}
		}
	}
	if ((found == SBAR_GRENS))
	{
		self.enemy = e;
		return (SBAR_GRENS);
	}
	else
	{
		return (minrate);
	}
};

float () OldSentry_FindTarget =
{
	local entity client;
	local float r;
	local float gotone;
	local float loopc;

	r = minrate;
	loopc = minrate;
	gotone = minrate;
	while (((loopc < 12) && (gotone == minrate)))
	{
		client = checkclient ();
		gotone = SBAR_GRENS;
		if (!client)
		{
			gotone = minrate;
		}
		if (((client == self.real_owner) || !client.takedamage))
		{
			gotone = minrate;
		}
		if ((client.has_disconnected == SBAR_GRENS))
		{
			gotone = minrate;
		}
		if (teamplay)
		{
			if (((client.team_no == self.team_no) && (self.team_no != minrate)))
			{
				gotone = minrate;
			}
			if (((client.undercover_team == self.team_no) && (self.team_no != minrate)))
			{
				gotone = minrate;
			}
		}
		if (client.is_feigning)
		{
			gotone = minrate;
		}
		if (((client.flags & 128) || (client.items & 524288)))
		{
			gotone = minrate;
		}
		if (!visible (client))
		{
			gotone = minrate;
		}
		r = range (client);
		if ((r == AS_MELEE))
		{
			gotone = minrate;
		}
		else
		{
			if (((r == SBAR_PRINT) && !infront (client)))
			{
				gotone = minrate;
			}
		}
		loopc = (loopc + SBAR_GRENS);
	}
	if (!gotone)
	{
		return (minrate);
	}
	self.enemy = client;
	if ((self.enemy.classname != "player"))
	{
		self.enemy = self.enemy.enemy;
		if ((self.enemy.classname != "player"))
		{
			self.enemy = world;
			return (minrate);
		}
	}
	OldSentry_FoundTarget ();
	return (SBAR_GRENS);
};

void () OldSentry_FoundTarget =
{
	if (((self.ammo_shells > minrate) || ((self.ammo_rockets > minrate) && (self.weapon == AS_MELEE))))
	{
		sound (self, SBAR_PRINT, "weapons/turrspot.wav", SBAR_GRENS, SBAR_GRENS);
	}
	Sentry_HuntTarget ();
};

void () Sentry_HuntTarget =
{
	if (!sgtype)
	{
		if ((self.weapon == SBAR_GRENS))
		{
			self.think = lvl1_oldsentry_atk1;
		}
		else
		{
			if ((self.weapon == SBAR_PRINT))
			{
				self.think = lvl2_oldsentry_atk1;
			}
			else
			{
				self.think = lvl3_oldsentry_atk1;
			}
		}
		self.ideal_yaw = vectoyaw ((self.enemy.origin - self.origin));
		self.nextthink = (time + 0.1);
	}
	else
	{
		if ((self.weapon == SBAR_GRENS))
		{
			self.think = lvl1_sentry_atk1;
		}
		else
		{
			if ((self.weapon == SBAR_PRINT))
			{
				self.think = lvl2_sentry_atk1;
			}
			else
			{
				self.think = lvl3_sentry_atk1;
			}
		}
		self.nextthink = (time + sentry_speed);
	}
	if ((self.super_damage_finished < time))
	{
		self.super_damage_finished = (time + 0.5);
	}
};

void () Sentry_Pain =
{
	self.real_owner.StatusRefreshTime = (time + 0.2);
};

void () Sentry_Explode =
{
	ThrowGib ("progs/tgib1.mdl", -70);
	ThrowGib ("progs/tgib2.mdl", -70);
	ThrowGib ("progs/tgib3.mdl", -70);
	if ((self.real_owner.has_disconnected != SBAR_GRENS))
	{
		deathmsg = 38;
		T_RadiusDamage (self, self.real_owner, (_K + (self.ammo_rockets * 8)), self);
	}
	if ((self.classname == "building_sentrygun_base"))
	{
		if (self.oldenemy)
		{
			dremove (self.oldenemy);
		}
	}
	else
	{
		dremove (self.trigger_field);
	}
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void (float damg, vector dir, vector spread) FireSentry =
{
	local vector direction;
	local vector src;

	makevectors (self.v_angle);
	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	ClearMultiDamage ();
	traceline (src, (src + (dir * 2048)), minrate, self);
	puff_org = (trace_endpos - (dir * AS_MISSILE));
	direction = ((dir + ((crandom () * spread_x) * v_right)) + ((crandom () * spread_y) * v_up));
	traceline (src, (src + (direction * 2048)), minrate, self);
	if ((trace_fraction != SBAR_GRENS))
	{
		if ((self.weapon == SBAR_GRENS))
		{
			TraceAttack (damg, direction);
		}
		else
		{
			TraceAttack ((damg * 0.8), direction);
		}
	}
	ApplyMultiDamage ();
};

void () Sentry_Die =
{
	sprint (self.real_owner, SBAR_PRINT, "Your sentry gun was destroyed.\n");
	self.real_owner.has_sentry = minrate;
	self.think = Sentry_Explode;
	self.nextthink = (time + 0.1);
};

float () OldSentry_Fire =
{
	local vector dir;

	self.effects = (self.effects - (self.effects & 8));
	dir = (self.enemy.origin - self.origin);
	if ((((self.ideal_yaw - anglemod (self.angles_y)) < -10) || ((self.ideal_yaw - anglemod (self.angles_y)) > enter)))
	{
		return (minrate);
	}
	if ((((self.weapon == AS_MELEE) && (self.ammo_rockets > minrate)) && (self.super_damage_finished < time)))
	{
		Sentry_MuzzleFlash ();
		sound (self, SBAR_GRENS, "weapons/rocket1i.wav", SBAR_GRENS, SBAR_GRENS);
		newmis = spawn ();
		newmis.owner = self;
		newmis.movetype = 9;
		newmis.solid = SBAR_PRINT;
		newmis.velocity = (normalize ((self.enemy.origin - self.origin)) * 800);
		newmis.angles = vectoangles (newmis.velocity);
		newmis.weapon = quote;
		newmis.touch = T_MissileTouch;
		newmis.nextthink = (time + 5);
		newmis.think = SUB_Remove;
		setmodel (newmis, "progs/missile.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
		setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
		self.super_damage_finished = (time + AS_MELEE);
		self.ammo_rockets = (self.ammo_rockets - SBAR_GRENS);
		if ((self.ammo_rockets == enter))
		{
			sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is low on rockets.\n");
		}
	}
	self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
	if ((self.ammo_shells < minrate))
	{
		self.ammo_shells = minrate;
		return (minrate);
	}
	Sentry_MuzzleFlash ();
	sound (self, SBAR_GRENS, "weapons/sniper.wav", SBAR_GRENS, SBAR_GRENS);
	deathmsg = SBAR_350;
	self.v_angle = self.angles;
	FireBullets (AS_MISSILE, dir, '0.1 0.1 0');
	if (((self.ammo_shells == minrate) && (random () < 0.1)))
	{
		sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is out of shells.\n");
	}
	else
	{
		if ((self.ammo_shells == 20))
		{
			sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is low on shells.\n");
		}
	}
	if ((((self.ammo_rockets == minrate) && (self.weapon == AS_MELEE)) && (random () < 0.1)))
	{
		sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is out of rockets.\n");
		if ((self.ammo_shells == minrate))
		{
			return (minrate);
		}
	}
	return (SBAR_GRENS);
};

float () Sentry_Fire =
{
	local vector dir;
	local float r;
	local vector org;

	if ((self.tfstate > time))
	{
		return (SBAR_GRENS);
	}
	self.effects = (self.effects - (self.effects & 8));
	dir = (self.enemy.origin - (self.origin + '0 0 16'));
	r = vlen (dir);
	if ((r < 150))
	{
		if ((((self.ideal_yaw - anglemod (self.angles_y)) < -10) || ((self.ideal_yaw - anglemod (self.angles_y)) > enter)))
		{
			return (minrate);
		}
	}
	else
	{
		if ((r < 250))
		{
			if ((((self.ideal_yaw - anglemod (self.angles_y)) < -6.5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 6.5)))
			{
				return (minrate);
			}
		}
		else
		{
			if ((r < 400))
			{
				if ((((self.ideal_yaw - anglemod (self.angles_y)) < -5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 5)))
				{
					return (minrate);
				}
			}
			else
			{
				if ((r < 650))
				{
					if ((((self.ideal_yaw - anglemod (self.angles_y)) < -3.5) || ((self.ideal_yaw - anglemod (self.angles_y)) > 3.5)))
					{
						return (minrate);
					}
				}
				else
				{
					if ((r < 900))
					{
						if ((((self.ideal_yaw - anglemod (self.angles_y)) < -2.4) || ((self.ideal_yaw - anglemod (self.angles_y)) > 2.4)))
						{
							return (minrate);
						}
					}
					else
					{
						if ((r < 1200))
						{
							if ((((self.ideal_yaw - anglemod (self.angles_y)) < -1.3) || ((self.ideal_yaw - anglemod (self.angles_y)) > 1.3)))
							{
								return (minrate);
							}
						}
						else
						{
							if ((((self.ideal_yaw - anglemod (self.angles_y)) < -0.4) || ((self.ideal_yaw - anglemod (self.angles_y)) > 0.4)))
							{
								return (minrate);
							}
						}
					}
				}
			}
		}
	}
	if ((((self.weapon == AS_MELEE) && (self.ammo_rockets > minrate)) && (self.super_damage_finished < time)))
	{
		Sentry_MuzzleFlash ();
		sound (self, SBAR_GRENS, "weapons/rocket1i.wav", SBAR_GRENS, SBAR_GRENS);
		newmis = spawn ();
		newmis.owner = self;
		newmis.movetype = 9;
		newmis.solid = SBAR_PRINT;
		newmis.velocity = (normalize ((self.enemy.origin - self.origin)) * 800);
		newmis.angles = vectoangles (newmis.velocity);
		newmis.weapon = quote;
		newmis.touch = T_MissileTouch;
		newmis.nextthink = (time + 5);
		newmis.think = SUB_Remove;
		setmodel (newmis, "progs/missile.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
		setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
		self.super_damage_finished = (time + AS_MELEE);
		self.ammo_rockets = (self.ammo_rockets - SBAR_GRENS);
		if ((self.ammo_rockets == enter))
		{
			sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is low on rockets.\n");
		}
		if ((self.ammo_rockets == minrate))
		{
			sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is out of rockets.\n");
		}
	}
	org = (self.origin + '0 0 16');
	if ((sentry_fire == SBAR_GRENS))
	{
		if ((self.ammo_shells > minrate))
		{
			Sentry_MuzzleFlash ();
			sound (self, SBAR_GRENS, "weapons/lhit.wav", SBAR_GRENS, SBAR_GRENS);
			traceline (org, (self.enemy.origin + '0 0 16'), SBAR_GRENS, self);
			WriteByte (AS_MISSILE, 23);
			WriteByte (AS_MISSILE, 6);
			WriteEntity (AS_MISSILE, self);
			WriteCoord (AS_MISSILE, org_x);
			WriteCoord (AS_MISSILE, org_y);
			WriteCoord (AS_MISSILE, org_z);
			WriteCoord (AS_MISSILE, trace_endpos_x);
			WriteCoord (AS_MISSILE, trace_endpos_y);
			WriteCoord (AS_MISSILE, trace_endpos_z);
			multicast (org, SBAR_GRENS);
			if ((r <= 700))
			{
				LightningDamage (org, (trace_endpos + (v_forward * AS_MISSILE)), self, 23);
			}
			else
			{
				if ((r <= 1100))
				{
					LightningDamage (org, (trace_endpos + (v_forward * AS_MISSILE)), self, 17);
				}
				else
				{
					LightningDamage (org, (trace_endpos + (v_forward * AS_MISSILE)), self, enter);
				}
			}
			self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
			if ((self.ammo_shells == 20))
			{
				sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is low on shells.\n");
			}
			if ((self.ammo_shells <= minrate))
			{
				sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is out of shells.\n");
				self.ammo_shells = minrate;
			}
		}
	}
	else
	{
		if ((self.ammo_shells > minrate))
		{
			Sentry_MuzzleFlash ();
			self.v_angle = self.angles;
			deathmsg = SBAR_350;
			if ((sentry_fire == SBAR_PRINT))
			{
				LaunchLaser (org, dir);
			}
			else
			{
				sound (self, SBAR_GRENS, "weapons/sniper.wav", SBAR_GRENS, SBAR_GRENS);
				if ((r <= 700))
				{
					FireSentry (14, dir, '0.1 0.1 0');
				}
				else
				{
					if ((r <= 1100))
					{
						FireSentry (enter, dir, '0.3 0.3 0.1');
					}
					else
					{
						FireSentry (6, dir, '0.7 0.5 0.5');
					}
				}
			}
			self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
			if ((self.ammo_shells == 20))
			{
				sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is low on shells.\n");
			}
			if ((self.ammo_shells <= minrate))
			{
				sprint (self.real_owner, SBAR_PRINT, "Sentry Gun is out of shells.\n");
				self.ammo_shells = minrate;
			}
		}
	}
	return (SBAR_GRENS);
};

void () Sentry_MuzzleFlash =
{
	self.effects = (self.effects | 8);
};

void () monster_boss =
{
	dremove (self);
};

void () event_lightning =
{
	self.use = event_lightning;
};
void () StopTimer;

void () Admin_CountPlayers =
{
	local string st;
	local float nump;

	nump = TeamFortress_GetNoPlayers ();
	st = ftos (nump);
	sprint3 (self, SBAR_PRINT, "Players In Game : ", st, "\n");
	if ((number_of_teams > minrate))
	{
		nump = TeamFortress_TeamGetNoPlayers (SBAR_GRENS);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team1: ", st, "\n");
	}
	if ((number_of_teams > SBAR_GRENS))
	{
		nump = TeamFortress_TeamGetNoPlayers (SBAR_PRINT);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team2: ", st, "\n");
	}
	if ((number_of_teams > SBAR_PRINT))
	{
		nump = TeamFortress_TeamGetNoPlayers (AS_MELEE);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team3: ", st, "\n");
	}
	if ((number_of_teams > AS_MELEE))
	{
		nump = TeamFortress_TeamGetNoPlayers (AS_MISSILE);
		st = ftos (nump);
		sprint3 (self, SBAR_PRINT, "Players In Team4: ", st, "\n");
	}
};

void () Admin_ListIPs =
{
	if ((TeamFortress_GetNoPlayers () <= SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "No other players in the game.\n");
		self.admin_use = world;
		return;
	}
	self.admin_use = find (self.admin_use, classname, "player");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, SBAR_PRINT, self.admin_use.netname);
			sprint (self, SBAR_PRINT, " (");
			sprint (self, SBAR_PRINT, self.admin_use.ip);
			sprint (self, SBAR_PRINT, ")");
			sprint (self, SBAR_PRINT, "\n");
		}
		self.admin_use = find (self.admin_use, classname, "player");
	}
	self.admin_use = find (self.admin_use, classname, "observer");
	while ((self.admin_use != world))
	{
		if (((self.admin_use.netname != string_null) && (self.admin_use != self)))
		{
			self.admin_use.ip = infokey (self.admin_use, "ip");
			sprint (self, SBAR_PRINT, self.admin_use.netname);
			sprint (self, SBAR_PRINT, " (");
			sprint (self, SBAR_PRINT, self.admin_use.ip);
			sprint (self, SBAR_PRINT, ")");
			sprint (self, SBAR_PRINT, " (SPECTATOR)\n");
		}
		self.admin_use = find (self.admin_use, classname, "observer");
	}
	sprint (self, SBAR_PRINT, "End of player list\n");
	self.admin_use = world;
};

void () Admin_CycleDeal =
{
	if ((TeamFortress_GetNoPlayers () <= SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "No other players in the game.\n");
		self.admin_use = world;
		self.admin_mode = minrate;
		return;
	}
	if ((self.admin_use.classname != "observer"))
	{
		self.admin_use = find (self.admin_use, classname, "player");
		while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
		{
			self.admin_use = find (self.admin_use, classname, "player");
		}
		if ((self.admin_use == world))
		{
			self.admin_use = find (self.admin_use, classname, "observer");
			while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
			{
				self.admin_use = find (self.admin_use, classname, "observer");
			}
		}
	}
	else
	{
		self.admin_use = find (self.admin_use, classname, "observer");
		while (((self.admin_use != world) && ((self.admin_use.netname == string_null) || (self.admin_use == self))))
		{
			self.admin_use = find (self.admin_use, classname, "observer");
		}
	}
	if (self.admin_use)
	{
		self.admin_use.ip = infokey (self.admin_use, "ip");
		self.admin_mode = SBAR_GRENS;
		sprint (self, SBAR_PRINT, self.admin_use.netname);
		sprint3 (self, SBAR_PRINT, " (", self.admin_use.ip, ")");
		if ((self.admin_use.classname == "observer"))
		{
			sprint (self, SBAR_PRINT, " (SPECTATOR)");
		}
		sprint (self, SBAR_PRINT, "\n");
		sprint (self, SBAR_PRINT, "   KICK/NEXT?\n");
	}
	else
	{
		self.admin_mode = minrate;
		sprint (self, SBAR_PRINT, "End of player list\n");
	}
};

void () Admin_DoKick =
{
	bprint4 (SBAR_PRINT, self.admin_use.netname, " was kicked by ", self.netname, "\n");
	stuffcmd (self.admin_use, "disconnect\n");
	self.admin_mode = minrate;
	self.admin_use = world;
};

void () CeaseFire_think =
{
	local entity te;

	if (!cease_fire)
	{
		dremove (self);
		return;
	}
	te = find (world, classname, "player");
	while (te)
	{
		CenterPrint3 (te, "CEASE FIRE\nCalled by: ", self.owner.netname, "\n");
		te = find (te, classname, "player");
	}
	self.nextthink = (time + 5);
};

void () Admin_CeaseFire =
{
	local entity te;

	if (!cease_fire)
	{
		if (cb_prematch)
		{
			StopTimer ();
		}
		cease_fire = SBAR_GRENS;
		bprint (SBAR_PRINT, "CEASE FIRE\n");
		te = find (world, classname, "player");
		while (te)
		{
			CenterPrint3 (te, "CEASE FIRE\nCalled by: ", self.netname, "\n");
			te.immune_to_check = (time + 5);
			te.tfstate = (te.tfstate | 65536);
			TeamFortress_SetSpeed (te);
			te = find (te, classname, "player");
		}
		te = spawn ();
		te.owner = self;
		te.classname = "ceasefire";
		te.think = CeaseFire_think;
		te.nextthink = (time + 5);
	}
	else
	{
		te = find (world, classname, "ceasefire");
		if (te)
		{
			dremove (te);
		}
		cease_fire = minrate;
		if (cb_prematch)
		{
			pmtime = minrate;
			StartTimer ();
		}
		bprint (SBAR_PRINT, "RESUME FIRE\n");
		te = find (world, classname, "player");
		while (te)
		{
			CenterPrint3 (te, "RESUME FIRE\nCalled by: ", self.netname, "\n");
			te.immune_to_check = (time + 5);
			te.tfstate = (te.tfstate - (te.tfstate & 65536));
			TeamFortress_SetSpeed (te);
			te = find (te, classname, "player");
		}
	}
};

void (entity p) CheckAutoKick =
{
	local float rnum;
	local entity te;

	if (((p.teamkills >= autokick_kills) && (autokick_kills != minrate)))
	{
		bprint2 (SBAR_PRINT, p.netname, " was kicked for killing teammates.\n");
		sprint (p, SBAR_PRINT, "You were kicked for killing teammates.\n");
		stuffcmd (p, "disconnect\n");
	}
	else
	{
		if ((autokick_kills != minrate))
		{
			if ((p.teamkills == (autokick_kills - SBAR_GRENS)))
			{
				sprint (p, SBAR_PRINT, "Kill one more teammate, && you're outta here.\n");
			}
			rnum = minrate;
			te = find (world, classname, "ak_timer");
			while (te)
			{
				if ((te.owner == p))
				{
					rnum = SBAR_GRENS;
					te = world;
				}
				else
				{
					te = find (te, classname, "ak_timer");
				}
			}
			if ((rnum == minrate))
			{
				te = spawn ();
				te.classname = "ak_timer";
				te.owner = p;
				te.think = autokick_think;
				te.nextthink = (time + autokick_time);
			}
		}
	}
};

void () AbortElect =
{
	local entity p;

	elect = minrate;
	p = find (world, classname, "player");
	while ((p != world))
	{
		if ((p.netname != ""))
		{
			p.vote = minrate;
			if ((p.is_admin == SBAR_PRINT))
			{
				p.is_admin = minrate;
			}
		}
		p = find (p, classname, "player");
	}
	p = find (world, classname, "spectator");
	while ((p != world))
	{
		if (((p.netname != "") && (p.is_admin == SBAR_PRINT)))
		{
			p.is_admin = minrate;
		}
		p = find (p, classname, "spectator");
	}
	p = find (world, classname, "electguard");
	if ((p.classname == "electguard"))
	{
		dremove (p);
	}
};

void () ElectThink =
{
	bprint (SBAR_PRINT, "The voting has timed out.\nElection aborted\n");
	self.nextthink = -1;
	AbortElect ();
};

void () VoteAdmin =
{
	local float f1;
	local float f2;
	local float f3;
	local string tmp;
	local entity electguard;

	if ((self.electtime > time))
	{
		sprint (self, SBAR_PRINT, "You cannot elect at this time.\n");
		return;
	}
	self.electtime = (time + AS_MELEE);
	if (((self.is_admin == SBAR_GRENS) || (self.is_admin == AS_MELEE)))
	{
		sprint (self, SBAR_PRINT, "You are already an admin\n");
		return;
	}
	if ((self.is_admin == SBAR_PRINT))
	{
		bprint2 (SBAR_PRINT, self.netname, " aborts election!");
		bprint (AS_MELEE, "\n");
		AbortElect ();
		return;
	}
	if ((elect != minrate))
	{
		sprint (self, SBAR_PRINT, "An election is already in progress\n");
		return;
	}
	if ((self.classname == "spectator"))
	{
		return;
	}
	bprint2 (SBAR_PRINT, self.netname, " has requested admin rights!\n");
	self.is_admin = SBAR_PRINT;
	elect = SBAR_GRENS;
	tmp = infokey (world, "votespercentage");
	f3 = stof (tmp);
	if (((f3 < 5) || (f3 > __)))
	{
		f3 = _2;
	}
	f3 = (f3 / _d);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (elect / f1);
	if ((f2 > f3))
	{
		if ((self.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, self.netname, " Á·ÈÓÛ ·‰ÌÈÓ ÛÙ·ÙıÛ!");
			bprint (AS_MELEE, "\n");
			sprint (self, SBAR_PRINT, "Type „ÔÌÌ·Ó‰Û for admin commands.\n");
			self.is_admin = SBAR_GRENS;
			self.get_admin_aliases = SBAR_GRENS;
			elect = minrate;
		}
	}
	else
	{
		bprint (SBAR_PRINT, "Type");
		bprint (AS_MELEE, " yes");
		bprint (SBAR_PRINT, " in console to approve\n");
		sprint (self, SBAR_PRINT, "Type ÂÏÂ„Ù to abort election\n");
		electguard = spawn ();
		electguard.owner = world;
		electguard.classname = "electguard";
		electguard.think = ElectThink;
		electguard.nextthink = (time + SBAR_600);
	}
};

void () VoteYes =
{
	local float f1;
	local float f2;
	local float f3;
	local string tmp;
	local entity p;

	if (!elect)
	{
		return;
	}
	if ((self.is_admin == SBAR_PRINT))
	{
		sprint (self, SBAR_PRINT, "You cannot vote for yourself\n");
		return;
	}
	if (self.vote)
	{
		sprint (self, SBAR_PRINT, "--- your vote is still good ---\n");
		return;
	}
	elect = (elect + SBAR_GRENS);
	bprint2 (SBAR_PRINT, self.netname, " gives ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (SBAR_PRINT, "her");
	}
	else
	{
		bprint (SBAR_PRINT, "his");
	}
	bprint (SBAR_PRINT, " vote\n");
	self.vote = SBAR_GRENS;
	tmp = infokey (world, "votespercentage");
	f3 = stof (tmp);
	if (((f3 < 5) || (f3 > __)))
	{
		f3 = _2;
	}
	f3 = (f3 / _d);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (elect / f1);
	if ((f2 >= f3))
	{
		p = find (world, classname, "player");
		while ((p.is_admin != SBAR_PRINT))
		{
			p = find (p, classname, "player");
		}
		if ((p.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, p.netname, " Á·ÈÓÛ ·‰ÌÈÓ ÛÙ·ÙıÛ!");
			bprint (AS_MELEE, "\n");
			sprint (p, SBAR_PRINT, "Type „ÔÌÌ·Ó‰Û for admin commands.\n");
			p.is_admin = SBAR_GRENS;
			p.get_admin_aliases = SBAR_GRENS;
			elect = minrate;
			p.vote = minrate;
			p = find (world, classname, "electguard");
			if ((p.classname == "electguard"))
			{
				remove (p);
			}
			p = find (world, classname, "player");
		}
		self.vote = minrate;
	}
	if ((elect != minrate))
	{
		f1 = (f2 - elect);
		tmp = ftos (rint (f1));
		bprint3 (SBAR_PRINT, "ê", tmp, "ë more vote");
		if ((f1 > SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " needed\n");
	}
};

void () VoteNo =
{
	local float f1;
	local float f2;
	local string tmp;

	if ((self.is_admin == SBAR_GRENS))
	{
		return;
	}
	if ((((elect == minrate) || (self.is_admin == SBAR_PRINT)) || (self.vote == minrate)))
	{
		return;
	}
	bprint2 (SBAR_PRINT, self.netname, " withdraws ");
	if ((infokey (self, "gender") == "f"))
	{
		bprint (SBAR_PRINT, "her");
	}
	else
	{
		bprint (SBAR_PRINT, "his");
	}
	bprint (SBAR_PRINT, " vote\n");
	self.vote = minrate;
	elect = (elect - SBAR_GRENS);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / SBAR_PRINT)) + SBAR_GRENS);
	f1 = (f2 - elect);
	tmp = ftos (f1);
	bprint3 (SBAR_PRINT, "ê", tmp, "ë more vote");
	if ((f1 > SBAR_GRENS))
	{
		bprint (SBAR_PRINT, "s");
	}
	bprint (SBAR_PRINT, " needed\n");
};
void () NapalmGrenadeTouch;
void (vector org, entity shooter) NapalmGrenadeLaunch;
float (string id_flame) RemoveFlameFromQueue;

entity (string type, entity p_owner) FlameSpawn =
{
	if ((cb_prematch == SBAR_GRENS))
	{
		return (world);
	}
	if ((type != "1"))
	{
		return (world);
	}
	num_world_flames = (num_world_flames + SBAR_GRENS);
	while ((num_world_flames > SBAR_240))
	{
		if (!RemoveFlameFromQueue (type))
		{
			return (world);
		}
	}
	newmis = spawn ();
	if ((type == "1"))
	{
		newmis.movetype = 9;
		newmis.solid = SBAR_PRINT;
		newmis.effects = 8;
		newmis.flame_id = "1";
		setmodel (newmis, "progs/flame2.mdl");
		setsize (newmis, '0 0 0', '0 0 0');
	}
	else
	{
		if ((type == "2"))
		{
			newmis.movetype = enter;
			newmis.solid = SBAR_PRINT;
			newmis.flame_id = "2";
			setmodel (newmis, "progs/flame2.mdl");
			newmis.frame = SBAR_GRENS;
			setsize (newmis, '0 0 0', '0 0 0');
		}
		else
		{
			if ((type == "3"))
			{
				newmis.movetype = 9;
				newmis.solid = SBAR_PRINT;
				newmis.flame_id = "3";
				setmodel (newmis, "progs/flame2.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
			}
			else
			{
				if ((type == "4"))
				{
					newmis.movetype = 9;
					newmis.flame_id = "4";
					newmis.frame = SBAR_GRENS;
					newmis.solid = SBAR_PRINT;
					setmodel (newmis, "progs/flame2.mdl");
					setsize (newmis, '0 0 0', '0 0 0');
				}
			}
		}
	}
	newmis.owner = p_owner;
	return (newmis);
};

void (entity this) FlameDestroy =
{
	num_world_flames = (num_world_flames - SBAR_GRENS);
	dremove (this);
};

float (string id_flame) RemoveFlameFromQueue =
{
	local entity tmp;

	if ((num_world_flames < 20))
	{
		dprint ("ERROR in RemoveFlameFromQueue\n");
		return (minrate);
	}
	num_world_flames = (num_world_flames - SBAR_GRENS);
	tmp = find (world, flame_id, "4");
	if (!tmp)
	{
		if ((id_flame == "4"))
		{
			return (minrate);
		}
		tmp = find (world, flame_id, "3");
		if (!tmp)
		{
			if ((id_flame == "3"))
			{
				return (minrate);
			}
			tmp = find (world, flame_id, "2");
			if (!tmp)
			{
				if ((id_flame == "2"))
				{
					return (minrate);
				}
				tmp = find (world, flame_id, "1");
				if (!tmp)
				{
					dprint ("\n\nRemoveFlameFromQueue():BOOM!\n");
					return (minrate);
				}
			}
		}
	}
	remove (tmp);
	return (SBAR_GRENS);
};

void () Remove =
{
	FlameDestroy (self);
};

void () NapalmGrenadeFollow =
{
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		FlameDestroy (self);
	}
	if ((self.velocity == '0 0 0'))
	{
		FlameDestroy (self);
	}
	self.nextthink = (time + 0.1);
};

void () NapalmGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NapalmGrenadeNetThink =
{
	local entity head;
	local entity te;

	if ((self.heat == minrate))
	{
		self.owner.no_active_napalm_grens = (self.owner.no_active_napalm_grens + SBAR_GRENS);
		if ((self.owner.no_active_napalm_grens > SBAR_PRINT))
		{
			te = find (world, classname, "grentimer");
			while (te)
			{
				if (((te.owner == self.owner) && (te.no_active_napalm_grens == SBAR_GRENS)))
				{
					te.weapon = 15;
					te.think = RemoveGrenade;
					te.nextthink = (time + 0.1);
				}
				te = find (te, classname, "grentimer");
			}
		}
		self.no_active_napalm_grens = self.owner.no_active_napalm_grens;
	}
	self.nextthink = (time + SBAR_GRENS);
	self.origin = self.enemy.origin;
	makevectors (self.v_angle);
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		RemoveGrenade ();
		return;
	}
	head = findradius (self.origin, 180);
	while (head)
	{
		if (head.takedamage)
		{
			deathmsg = 15;
			TF_T_Damage (head, self, self.owner, 20, SBAR_PRINT, SBAR_240);
			other = head;
			Napalm_touch ();
			if ((other.classname == "player"))
			{
				stuffcmd (other, "bf\nbf\n");
			}
		}
		head = head.chain;
	}
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat > 7))
	{
		RemoveGrenade ();
	}
};

void () NapalmGrenadeExplode =
{
	local float i;
	local entity te;
	local entity head;

	sound (self, minrate, "weapons/flmgrexp.wav", SBAR_GRENS, SBAR_GRENS);
	traceline (self.origin, self.origin, SBAR_GRENS, self);
	if ((trace_inwater == SBAR_GRENS))
	{
		dremove (self);
		return;
	}
	self.effects = (self.effects | 8);
	head = spawn ();
	head.think = NapalmGrenadeNetThink;
	head.classname = "grentimer";
	head.nextthink = (time + 0.1);
	head.heat = minrate;
	head.origin = self.origin;
	head.owner = self.owner;
	head.team_no = self.owner.team_no;
	head.enemy = self;
};

void (vector org, entity shooter) NapalmGrenadeLaunch =
{
	local float xdir;
	local float ydir;
	local float zdir;
	local float spin;

	xdir = ((150 * random ()) - _K);
	ydir = ((150 * random ()) - _K);
	zdir = (40 * random ());
	newmis = FlameSpawn ("2", shooter);
	if ((newmis == world))
	{
		return;
	}
	self.touch = SUB_Null;
	newmis.classname = "fire";
	newmis.touch = Napalm_touch;
	newmis.think = NapalmGrenadeFollow;
	newmis.nextthink = (time + 0.1);
	newmis.enemy = shooter.owner;
	newmis.velocity_x = (xdir * SBAR_PRINT);
	newmis.velocity_y = (ydir * SBAR_PRINT);
	newmis.velocity_z = (zdir * 15);
	spin = ((random () * enter) / SBAR_PRINT);
	if ((spin <= minrate))
	{
		newmis.avelocity = '250 300 400';
	}
	if ((spin == SBAR_GRENS))
	{
		newmis.avelocity = '400 250 300';
	}
	if ((spin == SBAR_PRINT))
	{
		newmis.avelocity = '300 400 250';
	}
	if ((spin == AS_MELEE))
	{
		newmis.avelocity = '300 300 300';
	}
	if ((spin >= AS_MISSILE))
	{
		newmis.avelocity = '400 250 400';
	}
	setorigin (newmis, org);
	setsize (newmis, '0 0 0', '0 0 0');
};
void () OnPlayerFlame_touch;

void () FlameFollow =
{
	local vector dir;
	local vector vtemp;
	local vector boundsize;
	local float damage;

	vtemp = self.enemy.absmin;
	boundsize = self.enemy.size;
	self.solid = minrate;
	self.movetype = minrate;
	if ((self.enemy.numflames == minrate))
	{
		FlameDestroy (self);
		return;
	}
	if ((self.enemy.health < SBAR_GRENS))
	{
		deathmsg = 15;
		T_RadiusDamage (self, self, enter, self);
		self.enemy.numflames = minrate;
		FlameDestroy (self);
		return;
	}
	if (((self.enemy.armorclass & SBAR_240) && (self.enemy.armorvalue > minrate)))
	{
		self.health = minrate;
	}
	if ((self.enemy.tfstate & 131072))
	{
		self.health = minus;
		self.enemy.tfstate = (self.enemy.tfstate - (self.enemy.tfstate & 131072));
	}
	if ((self.health < SBAR_GRENS))
	{
		if (((self.effects != 8) || (self.enemy.numflames <= SBAR_GRENS)))
		{
			self.enemy.numflames = (self.enemy.numflames - SBAR_GRENS);
			self.enemy.numflames = minrate;
			FlameDestroy (self);
			return;
		}
	}
	self.health = (self.health - SBAR_GRENS);
	if ((vlen (self.enemy.velocity) < _2))
	{
		dir_x = (((random () * boundsize_x) / SBAR_PRINT) + (boundsize_x / AS_MISSILE));
		dir_y = (((random () * boundsize_y) / SBAR_PRINT) + (boundsize_y / AS_MISSILE));
		dir_z = (((random () * boundsize_z) / AS_MELEE) + (boundsize_z / SBAR_PRINT));
		vtemp = (vtemp + dir);
		setorigin (self, vtemp);
		if ((self.model != "progs/flame2.mdl"))
		{
			self.model = "progs/flame2.mdl";
			setmodel (self, self.model);
		}
	}
	else
	{
		if ((self.model == "progs/flame2.mdl"))
		{
			self.model = string_null;
			setmodel (self, self.model);
		}
	}
	if ((self.enemy.waterlevel > SBAR_GRENS))
	{
		sound (self, SBAR_PRINT, "misc/vapeur2.wav", SBAR_GRENS, SBAR_GRENS);
		self.enemy.numflames = (self.enemy.numflames - SBAR_GRENS);
		FlameDestroy (self);
		return;
	}
	self.nextthink = (time + 0.1);
	if (((self.effects == 8) && (self.heat >= AS_MELEE)))
	{
		damage = ((self.enemy.numflames * 0.3) * AS_MELEE);
		if ((damage < SBAR_GRENS))
		{
			damage = SBAR_GRENS;
		}
		self.heat = SBAR_GRENS;
		deathmsg = 15;
		TF_T_Damage (self.enemy, self, self.owner, damage, SBAR_PRINT, SBAR_240);
	}
	else
	{
		if ((self.effects == 8))
		{
			self.heat = (self.heat + SBAR_GRENS);
		}
	}
};

void () OnPlayerFlame_touch =
{
	local entity flame;
	local vector vtemp;

	if ((((other != world) && (other.health > minrate)) && (other != self.enemy)))
	{
		if ((cb_prematch == SBAR_GRENS))
		{
			return;
		}
		if ((other.numflames >= AS_MISSILE))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & SBAR_240) && (other.team_no > minrate)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < SBAR_GRENS))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			flame = FlameSpawn ("3", other);
			if ((flame == world))
			{
				return;
			}
		}
		flame.classname = "fire";
		flame.health = minus;
		other.numflames = (other.numflames + SBAR_GRENS);
		flame.velocity = other.velocity;
		flame.enemy = other;
		flame.touch = OnPlayerFlame_touch;
		flame.owner = self.owner;
		vtemp = self.origin;
		setorigin (flame, vtemp);
		flame.nextthink = (time + 0.1);
		flame.think = FlameFollow;
	}
};
void () QW_Flame_ResetTouch;

void () WorldFlame_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	deathmsg = 15;
	TF_T_Damage (other, self, self.enemy, enter, SBAR_PRINT, SBAR_240);
	self.touch = SUB_Null;
	if ((self.heat > (time + SBAR_GRENS)))
	{
		self.think = QW_Flame_ResetTouch;
		self.nextthink = (time + SBAR_GRENS);
	}
	if ((((other != world) && (other.solid != SBAR_GRENS)) && (other.health > minrate)))
	{
		if ((cb_prematch == SBAR_GRENS))
		{
			return;
		}
		if ((other.numflames >= AS_MISSILE))
		{
			other.tfstate = (other.tfstate | 131072);
			return;
		}
		if ((other.classname == "player"))
		{
			if ((((teamplay & SBAR_240) && (other.team_no > minrate)) && (other.team_no == self.owner.team_no)))
			{
				return;
			}
			CenterPrint (other, "You are on fire!\n");
			stuffcmd (other, "bf\n");
		}
		if ((other.numflames < SBAR_GRENS))
		{
			flame = FlameSpawn ("1", other);
			sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			flame = FlameSpawn ("3", other);
			if ((flame == world))
			{
				return;
			}
		}
		flame.classname = "fire";
		flame.health = minrate;
		other.numflames = (other.numflames + SBAR_GRENS);
		flame.velocity = other.velocity;
		flame.enemy = other;
		flame.touch = OnPlayerFlame_touch;
		flame.owner = self.owner;
		vtemp = (self.origin + '0 0 10');
		setorigin (flame, vtemp);
		flame.nextthink = (time + 0.15);
		flame.think = FlameFollow;
	}
};

void () QW_Flame_ResetTouch =
{
	self.touch = WorldFlame_touch;
	self.think = Remove;
	self.nextthink = self.heat;
};

void () Flamer_stream_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == SBAR_PRINT) && (other.health > minrate)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, enter, SBAR_PRINT, SBAR_240);
			if (cb_prematch)
			{
				return;
			}
			if ((other.numflames >= AS_MISSILE))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & SBAR_240) && (other.armorvalue > minrate)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & SBAR_240) && (other.team_no > minrate)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < SBAR_GRENS))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				flame = FlameSpawn ("3", other);
				if ((flame == world))
				{
					return;
				}
			}
			flame.classname = "fire";
			flame.health = minus;
			other.numflames = (other.numflames + SBAR_GRENS);
			flame.velocity = other.velocity;
			flame.enemy = other;
			flame.touch = OnPlayerFlame_touch;
			flame.owner = self.owner;
			vtemp = self.origin;
			setorigin (flame, vtemp);
			flame.nextthink = (time + 0.1);
			flame.think = FlameFollow;
		}
	}
	else
	{
		if (((random () < 0.3) || (pointcontents ((self.origin + '0 0 1')) != -1)))
		{
			remove (self);
			return;
		}
		flame = FlameSpawn ("4", other);
		if ((flame != world))
		{
			flame.touch = WorldFlame_touch;
			flame.classname = "fire";
			vtemp = (self.origin + '0 0 10');
			setorigin (flame, vtemp);
			flame.nextthink = (time + 8);
			flame.heat = flame.nextthink;
			flame.think = Remove;
			flame.enemy = self.owner;
		}
		remove (self);
	}
};

void () Napalm_touch =
{
	local entity flame;
	local vector dir;
	local vector vtemp;

	if ((other.classname == "fire"))
	{
		return;
	}
	if ((other != world))
	{
		if (((other.takedamage == SBAR_PRINT) && (other.health > minrate)))
		{
			deathmsg = 15;
			TF_T_Damage (other, self, self.owner, 6, SBAR_PRINT, SBAR_240);
			if ((cb_prematch == SBAR_GRENS))
			{
				return;
			}
			if ((other.numflames >= AS_MISSILE))
			{
				other.tfstate = (other.tfstate | 131072);
				return;
			}
			if (((other.armorclass & SBAR_240) && (other.armorvalue > minrate)))
			{
				return;
			}
			if ((other.classname == "player"))
			{
				if ((((teamplay & SBAR_240) && (other.team_no > minrate)) && (other.team_no == self.owner.team_no)))
				{
					return;
				}
				CenterPrint (other, "You are on fire!\n");
				stuffcmd (other, "bf\n");
			}
			if ((other.numflames < SBAR_GRENS))
			{
				flame = FlameSpawn ("1", other);
				sound (flame, SBAR_PRINT, "ambience/fire1.wav", SBAR_GRENS, SBAR_GRENS);
			}
			else
			{
				flame = FlameSpawn ("3", other);
				if ((flame == world))
				{
					return;
				}
			}
			flame.classname = "fire";
			flame.health = minus;
			other.numflames = (other.numflames + SBAR_GRENS);
			flame.velocity = other.velocity;
			flame.enemy = other;
			flame.touch = OnPlayerFlame_touch;
			flame.owner = self.owner;
			vtemp = self.origin;
			setorigin (flame, vtemp);
			flame.nextthink = (time + 0.1);
			flame.think = FlameFollow;
		}
	}
	else
	{
		if ((pointcontents ((self.origin + '0 0 1')) != -1))
		{
			FlameDestroy (self);
			return;
		}
		flame = FlameSpawn ("4", other);
		if ((flame != world))
		{
			flame.touch = WorldFlame_touch;
			flame.classname = "fire";
			vtemp = (self.origin + '0 0 10');
			setorigin (flame, vtemp);
			flame.nextthink = (time + 20);
			flame.heat = flame.nextthink;
			flame.think = Remove;
			flame.enemy = self.owner;
		}
		FlameDestroy (self);
	}
};

void (float num_bubbles, vector bub_origin) NewBubbles =
{
	local entity bubble_spawner;

	bubble_spawner = spawn ();
	setorigin (bubble_spawner, bub_origin);
	bubble_spawner.movetype = minrate;
	bubble_spawner.solid = minrate;
	bubble_spawner.nextthink = (time + 0.1);
	if ((self.classname == "player"))
	{
		bubble_spawner.owner = self;
	}
	else
	{
		bubble_spawner.owner = self.enemy;
	}
	bubble_spawner.think = DeathBubblesSpawn;
	bubble_spawner.bubble_count = num_bubbles;
	return;
};

void () W_FireFlame =
{
	local entity flame;
	local float rn;

	if ((self.waterlevel > SBAR_PRINT))
	{
		makevectors (self.v_angle);
		NewBubbles (SBAR_PRINT, (self.origin + (v_forward * 64)));
		rn = random ();
		if ((rn < 0.5))
		{
			sound (self, SBAR_GRENS, "misc/water1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_GRENS, "misc/water2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		return;
	}
	if (!practice)
	{
		self.ammo_cells = (self.ammo_cells - SBAR_GRENS);
		self.currentammo = self.ammo_cells;
	}
	sound (self, minrate, "weapons/flmfire2.wav", SBAR_GRENS, SBAR_GRENS);
	flame = spawn ();
	flame.owner = self;
	flame.movetype = 9;
	flame.solid = SBAR_PRINT;
	flame.classname = "flamerflame";
	makevectors (self.v_angle);
	flame.velocity = aim (self, 10000);
	flame.velocity = (flame.velocity * 700);
	flame.touch = Flamer_stream_touch;
	flame.think = s_explode1;
	flame.nextthink = (time + 0.15);
	setmodel (flame, "progs/s_explod.spr");
	setsize (flame, '0 0 0', '0 0 0');
	setorigin (flame, ((self.origin + (v_forward * SBAR_240)) + '0 0 16'));
};

void () IncendiaryRadius =
{
	local float damg;

	if ((self.weaponmode == SBAR_GRENS))
	{
		damg = _4;
	}
	else
	{
		damg = 64;
	}
	deathmsg = 15;
	T_RadiusDamage (self, self.owner, damg, other);
	self.origin = (self.origin - (8 * normalize (self.velocity)));
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () T_IncendiaryTouch =
{
	local float damg;
	local entity head;
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		remove (self);
		return;
	}
	self.effects = (self.effects | AS_MISSILE);
	if ((self.weaponmode == SBAR_GRENS))
	{
		damg = (space + (random () * enter));
	}
	else
	{
		damg = (_2 + (random () * 20));
	}
	deathmsg = 15;
	if (other.health)
	{
		TF_T_Damage (other, self, self.owner, damg, SBAR_PRINT, minrate);
	}
	IncendiaryRadius ();
};

void () W_FireIncendiaryCannon =
{
	if (!practice)
	{
		if ((self.weaponmode == SBAR_GRENS))
		{
			if ((self.ammo_rockets < SBAR_PRINT))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - SBAR_PRINT);
			self.currentammo = self.ammo_rockets;
		}
		else
		{
			if ((self.ammo_rockets < AS_MELEE))
			{
				return;
			}
			self.ammo_rockets = (self.ammo_rockets - AS_MELEE);
			self.currentammo = self.ammo_rockets;
		}
	}
	newmis = spawn ();
	newmis.owner = self;
	sound (self, SBAR_GRENS, "weapons/sgun1.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-3, self);
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "rocket";
	makevectors (self.v_angle);
	newmis.velocity = aim (self, 1000);
	if ((self.weaponmode == SBAR_GRENS))
	{
		newmis.velocity = (newmis.velocity * 800);
	}
	else
	{
		newmis.velocity = (newmis.velocity * 600);
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.weaponmode = self.weaponmode;
	newmis.touch = T_IncendiaryTouch;
	newmis.nextthink = (time + 5);
	newmis.think = IncendiaryRadius;
	newmis.weapon = SBAR_384;
	setmodel (newmis, "progs/missile.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void () TeamFortress_IncendiaryCannon =
{
	if (!(self.weapons_carried & 16384))
	{
		return;
	}
	if ((self.weaponmode == SBAR_GRENS))
	{
		if ((self.ammo_rockets < SBAR_PRINT))
		{
			sprint (self, SBAR_PRINT, "not enough ammo.\n");
			return;
		}
	}
	else
	{
		if ((self.ammo_rockets < AS_MELEE))
		{
			sprint (self, SBAR_PRINT, "not enough ammo.\n");
			return;
		}
	}
	self.current_weapon = 16384;
	W_SetCurrentAmmo ();
};

void () TeamFortress_FlameThrower =
{
	if (!(self.weapons_carried & 4096))
	{
		return;
	}
	if ((self.ammo_cells < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "not enough ammo.\n");
		return;
	}
	self.current_weapon = 4096;
	W_SetCurrentAmmo ();
};
void (entity Item, entity AP, float method) tfgoalitem_RemoveFromPlayer;
void (entity spy) TeamFortress_SpyCalcName;
void () TeamFortress_SpyUndercoverThink;
void () GasGrenadeMakeGas;
void () T_TranqDartTouch;

void () spy_diea1 = [ 50, spy_diea2 ]
{
};

void () spy_diea2 = [ 51, spy_diea3 ]
{
};

void () spy_diea3 = [ 52, spy_diea4 ]
{
};

void () spy_diea4 = [ 53, spy_diea5 ]
{
};

void () spy_diea5 = [ 54, spy_diea6 ]
{
};

void () spy_diea6 = [ 55, spy_diea7 ]
{
};

void () spy_diea7 = [ 56, spy_diea8 ]
{
};

void () spy_diea8 = [ 57, spy_diea9 ]
{
};

void () spy_diea9 = [ 58, spy_diea10 ]
{
};

void () spy_diea10 = [ 59, spy_diea11 ]
{
};

void () spy_diea11 = [ 60, spy_diea11 ]
{
};

void () spy_dieb1 = [ 61, spy_dieb2 ]
{
};

void () spy_dieb2 = [ 62, spy_dieb3 ]
{
};

void () spy_dieb3 = [ 63, spy_dieb4 ]
{
};

void () spy_dieb4 = [ 64, spy_dieb5 ]
{
};

void () spy_dieb5 = [ 65, spy_dieb6 ]
{
};

void () spy_dieb6 = [ 66, spy_dieb7 ]
{
};

void () spy_dieb7 = [ 67, spy_dieb8 ]
{
};

void () spy_dieb8 = [ 68, spy_dieb9 ]
{
};

void () spy_dieb9 = [ 69, spy_dieb9 ]
{
};

void () spy_diec1 = [ 70, spy_diec2 ]
{
};

void () spy_diec2 = [ 71, spy_diec3 ]
{
};

void () spy_diec3 = [ 72, spy_diec4 ]
{
};

void () spy_diec4 = [ 73, spy_diec5 ]
{
};

void () spy_diec5 = [ 74, spy_diec6 ]
{
};

void () spy_diec6 = [ 75, spy_diec7 ]
{
};

void () spy_diec7 = [ 76, spy_diec8 ]
{
};

void () spy_diec8 = [ 77, spy_diec9 ]
{
};

void () spy_diec9 = [ 78, spy_diec10 ]
{
};

void () spy_diec10 = [ 79, spy_diec11 ]
{
};

void () spy_diec11 = [ 80, spy_diec12 ]
{
};

void () spy_diec12 = [ 81, spy_diec13 ]
{
};

void () spy_diec13 = [ 82, spy_diec14 ]
{
};

void () spy_diec14 = [ 83, spy_diec15 ]
{
};

void () spy_diec15 = [ 84, spy_diec15 ]
{
};

void () spy_died1 = [ 85, spy_died2 ]
{
};

void () spy_died2 = [ 86, spy_died3 ]
{
};

void () spy_died3 = [ 87, spy_died4 ]
{
};

void () spy_died4 = [ 88, spy_died5 ]
{
};

void () spy_died5 = [ 89, spy_died6 ]
{
};

void () spy_died6 = [ 90, spy_died7 ]
{
};

void () spy_died7 = [ 91, spy_died8 ]
{
};

void () spy_died8 = [ 92, spy_died9 ]
{
};

void () spy_died9 = [ 93, spy_died9 ]
{
};

void () spy_diee1 = [ 94, spy_diee2 ]
{
};

void () spy_diee2 = [ 95, spy_diee3 ]
{
};

void () spy_diee3 = [ 96, spy_diee4 ]
{
};

void () spy_diee4 = [ 97, spy_diee5 ]
{
};

void () spy_diee5 = [ 98, spy_diee6 ]
{
};

void () spy_diee6 = [ 99, spy_diee7 ]
{
};

void () spy_diee7 = [ 100, spy_diee8 ]
{
};

void () spy_diee8 = [ 101, spy_diee9 ]
{
};

void () spy_diee9 = [ 102, spy_diee9 ]
{
};

void () spy_die_ax1 = [ 41, spy_die_ax2 ]
{
};

void () spy_die_ax2 = [ 42, spy_die_ax3 ]
{
};

void () spy_die_ax3 = [ 43, spy_die_ax4 ]
{
};

void () spy_die_ax4 = [ 44, spy_die_ax5 ]
{
};

void () spy_die_ax5 = [ 45, spy_die_ax6 ]
{
};

void () spy_die_ax6 = [ 46, spy_die_ax7 ]
{
};

void () spy_die_ax7 = [ 47, spy_die_ax8 ]
{
};

void () spy_die_ax8 = [ 48, spy_die_ax9 ]
{
};

void () spy_die_ax9 = [ 49, spy_die_ax9 ]
{
};

void () spy_upb1 = [ 69, spy_upb2 ]
{
};

void () spy_upb2 = [ 68, spy_upb3 ]
{
};

void () spy_upb3 = [ 67, spy_upb4 ]
{
};

void () spy_upb4 = [ 66, spy_upb5 ]
{
};

void () spy_upb5 = [ 65, spy_upb6 ]
{
};

void () spy_upb6 = [ 64, spy_upb7 ]
{
};

void () spy_upb7 = [ 63, spy_upb8 ]
{
};

void () spy_upb8 = [ 62, spy_upb9 ]
{
};

void () spy_upb9 = [ 61, spy_upb9 ]
{
	player_stand1 ();
};

void () spy_upc1 = [ 84, spy_upc2 ]
{
};

void () spy_upc2 = [ 83, spy_upc3 ]
{
};

void () spy_upc3 = [ 82, spy_upc4 ]
{
};

void () spy_upc4 = [ 81, spy_upc5 ]
{
};

void () spy_upc5 = [ 80, spy_upc6 ]
{
};

void () spy_upc6 = [ 79, spy_upc7 ]
{
};

void () spy_upc7 = [ 78, spy_upc8 ]
{
};

void () spy_upc8 = [ 77, spy_upc9 ]
{
};

void () spy_upc9 = [ 76, spy_upc10 ]
{
};

void () spy_upc10 = [ 75, spy_upc11 ]
{
};

void () spy_upc11 = [ 74, spy_upc12 ]
{
};

void () spy_upc12 = [ 73, spy_upc13 ]
{
};

void () spy_upc13 = [ 72, spy_upc14 ]
{
};

void () spy_upc14 = [ 71, spy_upc15 ]
{
};

void () spy_upc15 = [ 70, spy_upc15 ]
{
	player_stand1 ();
};

void () spy_upd1 = [ 93, spy_upd2 ]
{
};

void () spy_upd2 = [ 92, spy_upd3 ]
{
};

void () spy_upd3 = [ 91, spy_upd4 ]
{
};

void () spy_upd4 = [ 90, spy_upd5 ]
{
};

void () spy_upd5 = [ 89, spy_upd6 ]
{
};

void () spy_upd6 = [ 88, spy_upd7 ]
{
};

void () spy_upd7 = [ 87, spy_upd8 ]
{
};

void () spy_upd8 = [ 86, spy_upd9 ]
{
};

void () spy_upd9 = [ 85, spy_upd9 ]
{
	player_stand1 ();
};

void () spy_upe1 = [ 94, spy_upe9 ]
{
};
void () spy_upe9;

void () spy_upe2 = [ 95, spy_upe8 ]
{
};
void () spy_upe8;

void () spy_upe3 = [ 96, spy_upe7 ]
{
};
void () spy_upe7;

void () spy_upe4 = [ 97, spy_upe6 ]
{
};
void () spy_upe6;

void () spy_upe5 = [ 98, spy_upe5 ]
{
};

void () spy_upe6 = [ 99, spy_upe4 ]
{
};

void () spy_upe7 = [ 100, spy_upe3 ]
{
};

void () spy_upe8 = [ 101, spy_upe2 ]
{
};

void () spy_upe9 = [ 102, spy_upe1 ]
{
	player_stand1 ();
};

void () spy_upaxe1 = [ 49, spy_upaxe2 ]
{
};

void () spy_upaxe2 = [ 48, spy_upaxe3 ]
{
};

void () spy_upaxe3 = [ 47, spy_upaxe4 ]
{
};

void () spy_upaxe4 = [ 46, spy_upaxe5 ]
{
};

void () spy_upaxe5 = [ 45, spy_upaxe6 ]
{
};

void () spy_upaxe6 = [ 44, spy_upaxe7 ]
{
};

void () spy_upaxe7 = [ 43, spy_upaxe8 ]
{
};

void () spy_upaxe8 = [ 42, spy_upaxe9 ]
{
};

void () spy_upaxe9 = [ 41, spy_upaxe9 ]
{
	player_stand1 ();
};

void (float issilent) TeamFortress_SpyFeignDeath =
{
	local float i;
	local float j;
	local entity at_spot;
	local entity te;

	if (self.is_feigning)
	{
		at_spot = findradius (self.origin, 40);
		i = SBAR_GRENS;
		j = minrate;
		while ((at_spot != world))
		{
			if ((at_spot.mdl == "progs/detpack.mdl"))
			{
				j = SBAR_GRENS;
			}
			else
			{
				if ((at_spot.mdl == "progs/turrbase.mdl"))
				{
					j = SBAR_GRENS;
				}
				else
				{
					if ((at_spot.mdl == "progs/turrgun.mdl"))
					{
						j = SBAR_GRENS;
					}
					else
					{
						if ((at_spot.mdl == "progs/disp.mdl"))
						{
							j = SBAR_GRENS;
						}
						else
						{
							if ((((at_spot.classname == "player") && (at_spot.deadflag == minrate)) && (self != at_spot)))
							{
								j = SBAR_PRINT;
							}
						}
					}
				}
			}
			if ((j > minrate))
			{
				i = minrate;
			}
			at_spot = at_spot.chain;
		}
		if ((i == SBAR_GRENS))
		{
			i = (SBAR_GRENS + floor ((random () * 5)));
			self.velocity = '0 0 0';
			setsize (self, '-16 -16 -24', '16 16 32');
			self.view_ofs = '0 0 22';
			self.movetype = AS_MELEE;
			self.is_feigning = minrate;
			self.current_weapon = self.weapon;
			W_SetCurrentAmmo ();
			self.tfstate = (self.tfstate - (self.tfstate & 65536));
			TeamFortress_SetSpeed (self);
			if ((self.weapon <= SBAR_240))
			{
				spy_upaxe1 ();
				return;
			}
			if ((i == SBAR_GRENS))
			{
				spy_upb1 ();
			}
			else
			{
				if ((i == SBAR_PRINT))
				{
					spy_upc1 ();
				}
				else
				{
					if ((i == AS_MELEE))
					{
						spy_upd1 ();
					}
					else
					{
						spy_upe1 ();
					}
				}
			}
		}
		else
		{
			if ((j == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "You can't get up with something\non top of you.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "You can't get up while someone\nis standing on you.\n");
			}
		}
	}
	else
	{
		if ((self.is_unabletospy == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "You can't feign right now.\n");
			return;
		}
		if (self.hook_out)
		{
			sprint (self, SBAR_PRINT, "You can't feign with the hook out.\n");
			return;
		}
		if ((!(self.flags & 512) && (self.waterlevel == minrate)))
		{
			sprint (self, SBAR_PRINT, "You can't feign in the air.\n");
			return;
		}
		at_spot = findradius (self.origin, 64);
		while ((at_spot != world))
		{
			if ((((at_spot.classname == "player") && (self != at_spot)) && (at_spot.is_feigning == SBAR_GRENS)))
			{
				sprint (self, SBAR_PRINT, "You can't feign on top of another spy!\n");
				return;
			}
			at_spot = at_spot.chain;
		}
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | 65536);
		TeamFortress_SetSpeed (self);
		self.is_feigning = SBAR_GRENS;
		Attack_Finished (0.8);
		self.invisible_finished = minrate;
		self.modelindex = modelindex_player;
		self.weapon = self.current_weapon;
		self.current_weapon = minrate;
		self.weaponmodel = "";
		self.weaponframe = minrate;
		setsize (self, '-16 -16 -24', '16 16 -16');
		self.view_ofs = '0 0 4';
		self.movetype = 6;
		if ((issilent == minrate))
		{
			DeathSound ();
		}
		if ((self.weapon <= SBAR_240))
		{
			spy_die_ax1 ();
			return;
		}
		te = find (world, classname, "item_tfgoal");
		while (te)
		{
			if ((te.owner == self))
			{
				if ((!(te.goal_activation & 256) || (self.has_disconnected == SBAR_GRENS)))
				{
					tfgoalitem_RemoveFromPlayer (te, self, minrate);
				}
				if (((CTF_Map == SBAR_GRENS) && (te.goal_no == SBAR_GRENS)))
				{
					bprint (SBAR_PRINT, self.netname);
					bprint (SBAR_PRINT, " Ãœ”‘ the ¬Ã’≈ flag!\n");
				}
				else
				{
					if (((CTF_Map == SBAR_GRENS) && (te.goal_no == SBAR_PRINT)))
					{
						bprint (SBAR_PRINT, self.netname);
						bprint (SBAR_PRINT, " Ãœ”‘ the “≈ƒ flag!\n");
					}
				}
			}
			te = find (te, classname, "item_tfgoal");
		}
		if ((te != world))
		{
			dremove (te);
		}
		i = (SBAR_GRENS + floor ((random () * 6)));
		if ((i == SBAR_GRENS))
		{
			spy_diea1 ();
		}
		else
		{
			if ((i == SBAR_PRINT))
			{
				spy_dieb1 ();
			}
			else
			{
				if ((i == AS_MELEE))
				{
					spy_diec1 ();
				}
				else
				{
					if ((i == AS_MISSILE))
					{
						spy_died1 ();
					}
					else
					{
						spy_diee1 ();
					}
				}
			}
		}
	}
};

void () TeamFortress_SpyGoUndercover =
{
	local entity te;

	if ((self.effects & (8 | AS_MISSILE)))
	{
		sprint (self, SBAR_GRENS, "You cannot disguise while glowing.\n");
		return;
	}
	if ((self.is_unabletospy == SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "You can't go undercover right now.\n");
		return;
	}
	if ((self.is_undercover != SBAR_PRINT))
	{
		self.current_menu = 12;
		self.menu_count = 25;
	}
	else
	{
		sprint (self, SBAR_PRINT, "You stop going undercover.\n");
		self.is_undercover = minrate;
	}
};

void (entity spy) TeamFortress_SpyCalcName =
{
	local entity te;

	spy.undercover_name = string_null;
	if ((spy.undercover_team != minrate))
	{
		te = find (world, classname, "player");
		while (te)
		{
			if (((te.team_no == spy.undercover_team) && (te.skin == spy.undercover_skin)))
			{
				spy.undercover_name = te.netname;
				te = world;
			}
			else
			{
				te = find (te, classname, "player");
			}
		}
		if ((spy.undercover_name == string_null))
		{
			te = find (world, classname, "player");
			while (te)
			{
				if ((te.team_no == spy.undercover_team))
				{
					spy.undercover_name = te.netname;
					te = world;
				}
				else
				{
					te = find (te, classname, "player");
				}
			}
		}
	}
};

void () TeamFortress_SpyUndercoverThink =
{
	local float tc;
	local string st;

	if ((self.owner.playerclass != 8))
	{
		return;
	}
	if ((self.owner.is_undercover == SBAR_PRINT))
	{
		self.owner.immune_to_check = (time + 5);
		if ((self.skin != minrate))
		{
			sprint (self.owner, SBAR_PRINT, "Skin set to ");
			TeamFortress_PrintClassName (self.owner, self.skin, minrate);
			self.owner.undercover_skin = self.skin;
			TeamFortress_SetSkin (self.owner);
		}
		if ((self.team != minrate))
		{
			sprint (self.owner, SBAR_PRINT, "Colors set to Team ");
			st = ftos (self.team);
			sprint (self.owner, SBAR_PRINT, st);
			sprint (self.owner, SBAR_PRINT, "\n");
			self.owner.undercover_team = self.team;
			stuffcmd (self.owner, "color ");
			tc = (TeamFortress_GetColor (self.team) - SBAR_GRENS);
			st = ftos (tc);
			stuffcmd (self.owner, st);
			stuffcmd (self.owner, "\n");
			TeamFortress_SetSkin (self.owner);
		}
		TeamFortress_SpyCalcName (self.owner);
		if ((self.owner.StatusBarSize == minrate))
		{
			CenterPrint (self.owner, "You are now disguised.\n");
		}
		self.owner.is_undercover = SBAR_GRENS;
	}
	self.owner.StatusRefreshTime = (time + 0.1);
	dremove (self);
};

void (float class) TeamFortress_SpyChangeSkin =
{
	local entity te;

	if (class == 8)
	{
		sprint (self, SBAR_PRINT, "Skin reset.\n");
		self.undercover_skin = minrate;
		TeamFortress_SetSkin (self);
		if ((self.undercover_team == minrate))
		{
			self.is_undercover = minrate;
		}
		return;
	}
	sprint (self, SBAR_PRINT, "Going undercover...\n");
	self.is_undercover = SBAR_PRINT;
	te = spawn ();
	te.classname = "timer";
	te.owner = self;
	te.think = TeamFortress_SpyUndercoverThink;
	te.nextthink = (time + AS_MISSILE);
	te.skin = class;
	TeamFortress_SetSkin (self);
};

void (float teamno) TeamFortress_SpyChangeColor =
{
	local entity te;
	local string st;
	local float tc;

	if ((teamno == self.team_no))
	{
		sprint (self, SBAR_PRINT, "Colors reset.\n");
		self.immune_to_check = (time + 5);
		self.undercover_team = minrate;
		stuffcmd (self, "color ");
		tc = (TeamFortress_GetColor (self.team_no) - SBAR_GRENS);
		st = ftos (tc);
		stuffcmd (self, st);
		stuffcmd (self, "\n");
		if ((self.undercover_skin == minrate))
		{
			self.is_undercover = minrate;
		}
		TeamFortress_SetSkin (self);
		return;
	}
	sprint (self, SBAR_PRINT, "Going undercover...\n");
	self.is_undercover = SBAR_PRINT;
	te = spawn ();
	te.classname = "timer";
	te.owner = self;
	te.think = TeamFortress_SpyUndercoverThink;
	te.nextthink = (time + AS_MISSILE);
	te.team = teamno;
};

void () GasGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () GasGrenadeExplode =
{
	local vector tmpv;
	local entity te;
	local float pos;

	pos = pointcontents (self.origin);
	if ((pos == -1))
	{
		te = spawn ();
		te.think = GasGrenadeMakeGas;
		te.nextthink = (time + 0.1);
		te.classname = "grentimer";
		te.heat = minrate;
		te.origin = self.origin;
		te.owner = self.owner;
		te.team_no = self.owner.team_no;
		te.weapon = minrate;
		te.enemy = self;
	}
	else
	{
		pos = minrate;
		while ((pos < enter))
		{
			newmis = spawn ();
			setmodel (newmis, "progs/s_bubble.spr");
			setorigin (newmis, self.origin);
			newmis.movetype = 8;
			newmis.solid = minrate;
			newmis.velocity = '0 0 15';
			newmis.velocity_z = (enter + (random () * 20));
			newmis.nextthink = (time + 0.5);
			newmis.think = bubble_bob;
			newmis.classname = "bubble";
			newmis.frame = minrate;
			newmis.cnt = minrate;
			setsize (newmis, '-8 -8 -8', '8 8 8');
			pos = (pos + SBAR_GRENS);
		}
	}
	dremove (self);
};

void () GasGrenadeMakeGas =
{
	local entity te;
	local entity timer;

	if ((self.heat == minrate))
	{
		self.owner.no_active_gas_grens = (self.owner.no_active_gas_grens + SBAR_GRENS);
		if ((self.owner.no_active_gas_grens > SBAR_PRINT))
		{
			te = find (world, classname, "grentimer");
			while ((te != world))
			{
				if (((te.owner == self.owner) && (te.no_active_gas_grens == SBAR_GRENS)))
				{
					te.weapon = 24;
					te.think = RemoveGrenade;
					te.nextthink = (time + 0.1);
				}
				te = find (te, classname, "grentimer");
			}
		}
		self.no_active_gas_grens = self.owner.no_active_gas_grens;
	}
	self.nextthink = (time + 0.75);
	te = findradius (self.origin, 200);
	while ((te != world))
	{
		if ((((te.classname == "player") && (te.deadflag == minrate)) && (te.has_disconnected != SBAR_GRENS)))
		{
			deathmsg = 24;
			TF_T_Damage (te, world, self.owner, enter, (SBAR_GRENS | SBAR_PRINT), minrate);
			if ((te.tfstate & 16384))
			{
				timer = find (world, classname, "timer");
				while ((((timer.owner != te) || (timer.think != HallucinationTimer)) && (timer != world)))
				{
					timer = find (timer, classname, "timer");
				}
				if ((timer != world))
				{
					timer.health = (timer.health + 25);
					if ((timer.health < 150))
					{
						timer.health = 150;
					}
				}
			}
			else
			{
				sprint (te, SBAR_PRINT, "Run for cover! They're everywhere!\n");
				te.tfstate = (te.tfstate | 16384);
				timer = spawn ();
				timer.nextthink = (time + 0.3);
				timer.think = HallucinationTimer;
				timer.classname = "timer";
				timer.owner = te;
				timer.health = 150;
				timer.team_no = self.team_no;
			}
		}
		te = te.chain;
	}
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat == SBAR_GRENS))
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, AS_MISSILE);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_PRINT);
		return;
	}
	if ((self.heat <= 20))
	{
		self.weapon = (self.weapon + SBAR_GRENS);
		if ((self.weapon == SBAR_GRENS))
		{
			WriteByte (AS_MISSILE, 23);
			WriteByte (AS_MISSILE, enter);
			WriteCoord (AS_MISSILE, self.origin_x);
			WriteCoord (AS_MISSILE, self.origin_y);
			WriteCoord (AS_MISSILE, (self.origin_z - 24));
			multicast (self.origin, SBAR_PRINT);
		}
		else
		{
			if ((self.weapon == SBAR_PRINT))
			{
				self.weapon = minrate;
			}
		}
		return;
	}
	RemoveGrenade ();
};

void () HallucinationTimer =
{
	local entity te;
	local float tmpx;
	local float tmpy;
	local float halltype;
	local float halltype2;
	local string st;

	self.health = (self.health - AS_MELEE);
	if ((self.owner.playerclass == 5))
	{
		self.health = (self.health - SBAR_PRINT);
	}
	if ((((self.health <= minrate) || (self.owner.deadflag != minrate)) || (self.owner.has_disconnected == SBAR_GRENS)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 16384));
	}
	if (((self.owner.deadflag != minrate) || (self.owner.has_disconnected == SBAR_GRENS)))
	{
		dremove (self);
		return;
	}
	if (!(self.owner.tfstate & 16384))
	{
		sprint (self.owner, SBAR_PRINT, "You feel a little better now.\n");
		dremove (self);
		return;
	}
	self.nextthink = (time + 0.3);
	if ((random () < 0.5))
	{
		KickPlayer (-10, self.owner);
	}
	tmpx = ((random () * 800) - 400);
	tmpy = ((random () * 800) - 400);
	halltype = random ();
	halltype2 = random ();
	msg_entity = self.owner;
	if ((halltype < 0.4))
	{
		WriteByte (SBAR_GRENS, 23);
		if ((halltype < 0.25))
		{
			WriteByte (SBAR_GRENS, AS_MELEE);
		}
		else
		{
			if ((halltype < 0.35))
			{
				WriteByte (SBAR_GRENS, AS_MISSILE);
			}
			else
			{
				WriteByte (SBAR_GRENS, enter);
			}
		}
		WriteCoord (SBAR_GRENS, (msg_entity.origin_x + tmpx));
		WriteCoord (SBAR_GRENS, (msg_entity.origin_y + tmpy));
		WriteCoord (SBAR_GRENS, msg_entity.origin_z);
		T_Damage (self.owner, self.owner, self.owner, minrate);
	}
	else
	{
		if ((halltype < 0.7))
		{
			WriteByte (SBAR_GRENS, 23);
			WriteByte (SBAR_GRENS, SBAR_200);
			WriteCoord (SBAR_GRENS, (msg_entity.origin_x + tmpx));
			WriteCoord (SBAR_GRENS, (msg_entity.origin_y + tmpy));
			WriteCoord (SBAR_GRENS, msg_entity.origin_z);
			if ((halltype2 < 0.1))
			{
				stuffcmd (self.owner, "play weapons/r_exp3.wav\n");
			}
			else
			{
				if ((halltype2 < 0.15))
				{
					stuffcmd (self.owner, "play weapons/rocket1i.wav\n");
				}
				else
				{
					if ((halltype2 < 0.2))
					{
						stuffcmd (self.owner, "play weapons/sgun1.wav\n");
					}
					else
					{
						if ((halltype2 < 0.25))
						{
							stuffcmd (self.owner, "play weapons/guncock.wav\n");
						}
						else
						{
							if ((halltype2 < 0.3))
							{
								stuffcmd (self.owner, "play weapons/ric1.wav\n");
							}
							else
							{
								if ((halltype2 < 0.35))
								{
									stuffcmd (self.owner, "play weapons/ric2.wav\n");
								}
								else
								{
									if ((halltype2 < 0.4))
									{
										stuffcmd (self.owner, "play weapons/ric3.wav\n");
									}
									else
									{
										if ((halltype2 < 0.45))
										{
											stuffcmd (self.owner, "play weapons/spike2.wav\n");
										}
										else
										{
											if ((halltype2 < 0.5))
											{
												stuffcmd (self.owner, "play weapons/tink1.wav\n");
											}
											else
											{
												if ((halltype2 < 0.55))
												{
													CenterPrint2 (self.owner, "\n\n\n", "Your team √¡–‘’“≈ƒ the flag!!");
													stuffcmd (self.owner, "play weapons/grenade.wav\n");
												}
												else
												{
													if ((halltype2 < 0.6))
													{
														stuffcmd (self.owner, "play weapons/bounce.wav\n");
													}
													else
													{
														if ((halltype2 < 0.65))
														{
															stuffcmd (self.owner, "play weapons/shotgn2.wav\n");
														}
														else
														{
															if ((halltype2 < 0.7))
															{
																stuffcmd (self.owner, "play wizard/wattack.wav\n");
															}
															else
															{
																if ((halltype2 < 0.75))
																{
																	stuffcmd (self.owner, "play items/r_item1.wav\n");
																}
																else
																{
																	if ((halltype2 < 0.8))
																	{
																		stuffcmd (self.owner, "play items/r_item2.wav\n");
																	}
																	else
																	{
																		if ((halltype2 < 0.85))
																		{
																			CenterPrint (self.owner, "You are on fire!\n");
																			stuffcmd (self.owner, "play weapons/lhit.wav\n");
																		}
																		else
																		{
																			if ((halltype2 < 0.9))
																			{
																				stuffcmd (self.owner, "play misc/r_tele1.wav\n");
																			}
																			else
																			{
																				stuffcmd (self.owner, "play weapons/railgun.wav\n");
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			te = spawn ();
			te.origin_x = (msg_entity.origin_x + tmpx);
			te.origin_y = (msg_entity.origin_y + tmpy);
			te.origin_z = msg_entity.origin_z;
			WriteByte (SBAR_GRENS, 23);
			WriteByte (SBAR_GRENS, 6);
			WriteEntity (SBAR_GRENS, te);
			WriteCoord (SBAR_GRENS, te.origin_x);
			WriteCoord (SBAR_GRENS, te.origin_y);
			WriteCoord (SBAR_GRENS, te.origin_z);
			tmpx = ((random () * 800) - 400);
			tmpy = ((random () * 800) - 400);
			WriteCoord (SBAR_GRENS, (msg_entity.origin_x + tmpx));
			WriteCoord (SBAR_GRENS, (msg_entity.origin_y + tmpy));
			WriteCoord (SBAR_GRENS, msg_entity.origin_z);
			if ((halltype2 < 0.1))
			{
				stuffcmd (self.owner, "play weapons/detpack.wav\n");
			}
			else
			{
				if ((halltype2 < 0.2))
				{
					stuffcmd (self.owner, "play weapons/turrset.wav\n");
				}
				else
				{
					if ((halltype2 < 0.3))
					{
						stuffcmd (self.owner, "play weapons/turrspot.wav\n");
					}
					else
					{
						if ((halltype2 < 0.4))
						{
							stuffcmd (self.owner, "play weapons/turridle.wav\n");
						}
						else
						{
							if ((halltype2 < 0.5))
							{
								stuffcmd (self.owner, "play weapons/sniper.wav\n");
							}
							else
							{
								if ((halltype2 < 0.6))
								{
									CenterPrint2 (self.owner, "\n\n\n", "Your flag has been ‘¡À≈Œ!!");
									stuffcmd (self.owner, "play weapons/flmfire2.wav\n");
								}
								else
								{
									if ((halltype2 < 0.7))
									{
										stuffcmd (self.owner, "play weapons/flmgrexp.wav\n");
									}
									else
									{
										if ((halltype2 < 0.8))
										{
											stuffcmd (self.owner, "play misc/vapeur2.wav\n");
										}
										else
										{
											if ((halltype2 < 0.9))
											{
												stuffcmd (self.owner, "play weapons/asscan1.wav\n");
											}
											else
											{
												stuffcmd (self.owner, "play weapons/asscan2.wav\n");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if ((te != world))
		{
			dremove (te);
		}
	}
};

void () W_FireTranq =
{
	if (!practice)
	{
		self.ammo_shells = (self.ammo_shells - SBAR_GRENS);
		self.currentammo = self.ammo_shells;
	}
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	makevectors (self.v_angle);
	newmis.velocity = v_forward;
	newmis.velocity = (newmis.velocity * 1500);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.touch = T_TranqDartTouch;
	newmis.think = SUB_Remove;
	newmis.nextthink = (time + 6);
	setmodel (newmis, "progs/spike.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, ((self.origin + (v_forward * 8)) + '0 0 16'));
};

void () T_TranqDartTouch =
{
	local entity timer;

	if ((other.solid == SBAR_GRENS))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	if (other.takedamage)
	{
		if (((other.classname == "player") && !((other.team_no == self.owner.team_no) && (teamplay & (SBAR_PRINT | AS_MISSILE)))))
		{
			if ((other.tfstate & 32768))
			{
				timer = find (world, classname, "timer");
				while ((((timer.owner != other) || (timer.think != TranquiliserTimer)) && (timer != world)))
				{
					timer = find (timer, classname, "timer");
				}
				if ((timer != world))
				{
					timer.nextthink = (time + 15);
				}
			}
			else
			{
				sprint (other, SBAR_PRINT, "You feel tired...\n");
				other.tfstate = (other.tfstate | 32768);
				timer = spawn ();
				timer.nextthink = (time + 15);
				timer.think = TranquiliserTimer;
				timer.classname = "timer";
				timer.owner = other;
				timer.team_no = self.owner.team_no;
				TeamFortress_SetSpeed (other);
			}
		}
		spawn_touchblood (9);
		deathmsg = 25;
		TF_T_Damage (other, self, self.owner, 20, SBAR_PRINT, SBAR_PRINT);
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		if ((self.classname == "wizspike"))
		{
			WriteByte (AS_MISSILE, 7);
		}
		else
		{
			if ((self.classname == "knightspike"))
			{
				WriteByte (AS_MISSILE, 8);
			}
			else
			{
				WriteByte (AS_MISSILE, minrate);
			}
		}
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_PRINT);
	}
	dremove (self);
};

void () TranquiliserTimer =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 32768));
	TeamFortress_SetSpeed (self.owner);
	sprint (self.owner, SBAR_PRINT, "You feel more alert now\n");
	dremove (self);
};

void (entity spy) Spy_RemoveDisguise =
{
	local string st;
	local float tc;
	local float reset;

	if ((spy.playerclass == 8))
	{
		if ((spy.undercover_team != minrate))
		{
			spy.immune_to_check = (time + 5);
			spy.undercover_team = minrate;
			stuffcmd (spy, "color ");
			tc = (TeamFortress_GetColor (spy.team_no) - SBAR_GRENS);
			st = ftos (tc);
			stuffcmd (spy, st);
			stuffcmd (spy, "\n");
		}
		if ((spy.undercover_skin != minrate))
		{
			spy.immune_to_check = (time + 5);
			spy.undercover_skin = minrate;
			spy.skin = minrate;
		}
		spy.is_undercover = minrate;
		self.StatusRefreshTime = (time + 0.1);
		TeamFortress_SetSkin (spy);
		TeamFortress_SpyCalcName (spy);
	}
};
void () NormalGrenadeTouch;
void () NormalGrenadeExplode;
void () MirvGrenadeTouch;
void () MirvGrenadeExplode;
void (vector org, entity shooter) MirvGrenadeLaunch;
void () TeamFortress_DetpackSet;
void () TeamFortress_DetpackTouch;
void () TeamFortress_DetpackDisarm;
void () TeamFortress_DetpackCountDown;

void () TeamFortress_DetonatePipebombs =
{
	local entity e;

	e = find (world, classname, "pipebomb");
	while ((e != world))
	{
		if ((e.owner == self))
		{
			e.nextthink = time;
		}
		e = find (e, classname, "pipebomb");
	}
};

void () MirvGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () MirvGrenadeExplode =
{
	local float i;

	deathmsg = enter;
	T_RadiusDamage (self, self.owner, _d, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	self.solid = minrate;
	i = minrate;
	while ((i < AS_MISSILE))
	{
		MirvGrenadeLaunch ((self.origin + '0 0 -1'), self.owner);
		i = (i + SBAR_GRENS);
	}
	dremove (self);
};

void (vector org, entity shooter) MirvGrenadeLaunch =
{
	local float xdir;
	local float ydir;
	local float zdir;

	xdir = ((150 * random ()) - _K);
	ydir = ((150 * random ()) - _K);
	zdir = (40 * random ());
	newmis = spawn ();
	newmis.owner = shooter;
	newmis.movetype = enter;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "grenade";
	newmis.weapon = enter;
	newmis.touch = NormalGrenadeTouch;
	newmis.think = NormalGrenadeExplode;
	newmis.nextthink = ((time + SBAR_PRINT) + random ());
	newmis.velocity_x = (xdir * SBAR_PRINT);
	newmis.velocity_y = (ydir * SBAR_PRINT);
	newmis.velocity_z = (zdir * 15);
	newmis.avelocity = '250 300 400';
	setmodel (newmis, "progs/grenade2.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, org);
};

void (entity bowner) TeamFortress_SetBomb =
{
	local string stimer;
	local float timer;
	local entity at_spot;
	local float found_site;
	local float bombarmtime;

	bowner.is_detpacking = minrate;
	if ((bowner.team_no != SBAR_PRINT))
	{
		return;
	}
	if (!(bowner.weapons_carried & 131072))
	{
		sprint (bowner, SBAR_PRINT, "You do not have the Bomb!\n");
		return;
	}
	at_spot = findradius (bowner.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (bowner != at_spot)))
		{
			sprint (bowner, SBAR_PRINT, "You can't set a bomb on someone!\n");
			bowner.is_detpacking = minrate;
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (bowner, SBAR_PRINT, "You can't set a bomb on a sentry gun!\n");
				bowner.is_detpacking = minrate;
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (bowner, SBAR_PRINT, "You can't set a bomb on a dispenser!\n");
					bowner.is_detpacking = minrate;
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (bowner, SBAR_PRINT, "Bombs can't be stacked!\n");
						bowner.is_detpacking = minrate;
						return;
					}
				}
			}
		}
		at_spot = at_spot.chain;
	}
	if (!(bowner.flags & 512))
	{
		sprint (bowner, SBAR_PRINT, "You can't set the bomb in the air!\n");
		bowner.is_detpacking = minrate;
		return;
	}
	if (!practice)
	{
		bowner.ammo_detpack = (bowner.ammo_detpack - SBAR_GRENS);
	}
	bowner.immune_to_check = (time + 5);
	bowner.tfstate = (bowner.tfstate | 65536);
	bowner.weapon = bowner.current_weapon;
	bowner.current_weapon = minrate;
	bowner.weaponmodel = "";
	bowner.weaponframe = minrate;
	TeamFortress_SetSpeed (bowner);
	if (bowner.is_unabletospy)
	{
		bowner.is_unabletospy = minrate;
	}
	timer = stof (infokey (world, "bombtime"));
	if (((timer < 5) || (timer > _Z)))
	{
		timer = _2;
	}
	stimer = ftos (timer);
	bombarmtime = stof (infokey (world, "bombarmtime"));
	if (((bombarmtime < SBAR_GRENS) || (bombarmtime > enter)))
	{
		bombarmtime = AS_MELEE;
	}
	bowner.pausetime = (time + bombarmtime);
	sprint (bowner, SBAR_PRINT, "Setting Bomb...\n");
	newmis = spawn ();
	newmis.owner = bowner;
	newmis.classname = "timer";
	newmis.netname = "detpack_timer";
	newmis.nextthink = (time + bombarmtime);
	newmis.think = TeamFortress_DetpackSet;
	newmis.health = timer;
};

void (float timer) TeamFortress_SetDetpack =
{
	local string stimer;
	local entity te;
	local entity at_spot;

	if (tfstrike)
	{
		self.is_detpacking = SBAR_GRENS;
		return;
	}
	self.impulse = minrate;
	self.last_impulse = minrate;
	if (!(self.weapons_carried & 131072))
	{
		return;
	}
	if ((self.ammo_detpack <= minrate))
	{
		sprint (self, SBAR_PRINT, "You have no detpacks left!\n");
		return;
	}
	at_spot = findradius (self.origin, _A);
	while ((at_spot != world))
	{
		if (((at_spot.classname == "player") && (self != at_spot)))
		{
			sprint (self, SBAR_PRINT, "You can't set a detpack on someone!\n");
			return;
		}
		else
		{
			if (((at_spot.mdl == "progs/turrbase.mdl") || (at_spot.mdl == "progs/turrgun.mdl")))
			{
				sprint (self, SBAR_PRINT, "You can't set a detpack on a sentry gun!\n");
				return;
			}
			else
			{
				if ((at_spot.mdl == "progs/disp.mdl"))
				{
					sprint (self, SBAR_PRINT, "You can't set a detpack on a dispenser!\n");
					return;
				}
				else
				{
					if ((at_spot.classname == "detpack"))
					{
						sprint (self, SBAR_PRINT, "Detpacks can't be stacked!\n");
						return;
					}
				}
			}
		}
		at_spot = at_spot.chain;
	}
	if (!(self.flags & 512))
	{
		sprint (self, SBAR_PRINT, "You can't set detpacks in the air!\n");
		return;
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if ((te.owner == self))
		{
			sprint (self, SBAR_PRINT, "You can only have 1 detpack active at a time.\n");
			return;
		}
		te = find (te, classname, "detpack");
	}
	if ((timer < 5))
	{
		sprint (self, SBAR_PRINT, "You can't set detpacks for less than 5 seconds.\n");
		return;
	}
	self.is_detpacking = SBAR_GRENS;
	if (!practice)
	{
		self.ammo_detpack = (self.ammo_detpack - SBAR_GRENS);
	}
	self.immune_to_check = (time + 5);
	self.tfstate = (self.tfstate | 65536);
	self.weapon = self.current_weapon;
	self.current_weapon = minrate;
	self.weaponmodel = "";
	self.weaponframe = minrate;
	TeamFortress_SetSpeed (self);
	if (self.is_unabletospy)
	{
		self.is_unabletospy = minrate;
	}
	stimer = ftos (timer);
	self.pausetime = (time + AS_MELEE);
	sprint (self, SBAR_PRINT, "Setting detpack for ");
	sprint (self, SBAR_PRINT, stimer);
	sprint (self, SBAR_PRINT, " seconds...\n");
	newmis = spawn ();
	newmis.owner = self;
	newmis.classname = "timer";
	newmis.netname = "detpack_timer";
	newmis.nextthink = (time + AS_MELEE);
	newmis.think = TeamFortress_DetpackSet;
	newmis.health = timer;
};

void () TeamFortress_DetpackStop =
{
	local entity detpack_timer;

	self.is_detpacking = minrate;
	detpack_timer = find (world, netname, "detpack_timer");
	while (((detpack_timer.owner != self) && (detpack_timer != world)))
	{
		detpack_timer = find (detpack_timer, netname, "detpack_timer");
	}
	if ((detpack_timer == world))
	{
		return;
	}
	sprint (self, SBAR_PRINT, "Detpack retrieved.\n");
	self.ammo_detpack = (self.ammo_detpack + SBAR_GRENS);
	dremove (detpack_timer);
	self.tfstate = (self.tfstate - (self.tfstate & 65536));
	self.current_weapon = self.weapon;
	W_SetCurrentAmmo ();
	TeamFortress_SetSpeed (self);
	self.pausetime = time;
};

void () TeamFortress_DetpackSet =
{
	local entity countd;
	local entity oldself;
	local float skinno;
	local string st;

	self.is_detpacking = minrate;
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 65536));
	TeamFortress_SetSpeed (self.owner);
	oldself = self;
	self = self.owner;
	self.is_detpacking = minrate;
	self.current_weapon = self.weapon;
	W_SetCurrentAmmo ();
	self = oldself;
	newmis = spawn ();
	newmis.owner = self.owner;
	newmis.origin = (self.owner.origin - '0 0 23');
	newmis.movetype = enter;
	st = infokey (world, "soliddet");
	if ((st == "off"))
	{
		newmis.solid = SBAR_GRENS;
	}
	else
	{
		newmis.solid = SBAR_PRINT;
	}
	newmis.classname = "detpack";
	newmis.flags = 256;
	newmis.angles = '90 0 0';
	newmis.angles_y = self.owner.angles_y;
	newmis.velocity = '0 0 0';
	newmis.avelocity = '0 0 0';
	newmis.weaponmode = minrate;
	newmis.touch = TeamFortress_DetpackTouch;
	setmodel (newmis, "progs/detpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 8');
	setorigin (newmis, self.owner.origin);
	countd = spawn ();
	newmis.linked_list = countd;
	countd.think = TeamFortress_DetpackCountDown;
	countd.health = (self.health - SBAR_GRENS);
	countd.owner = self.owner;
	countd.classname = "countdown_timer";
	countd.enemy = newmis;
	newmis.oldenemy = countd;
	if ((self.health <= 255))
	{
		countd.nextthink = (time + SBAR_GRENS);
	}
	else
	{
		countd.nextthink = ((time + self.health) - enter);
		countd.health = 9;
	}
	newmis.nextthink = (time + self.health);
	newmis.think = TeamFortress_DetpackExplode;
	if (tfstrike)
	{
		newmis.targetname = self.owner.target;
		self.owner.target = string_null;
		bprint (SBAR_PRINT, "The Bomb has been planted!\n");
		sound (self.owner, SBAR_PRINT, "speech/bombpl.wav", SBAR_GRENS, minrate);
	}
	else
	{
		sound (self.owner, SBAR_PRINT, "doors/medtry.wav", SBAR_GRENS, SBAR_GRENS);
		sprint (self.owner, SBAR_PRINT, "Detpack set!\n");
	}
	dremove (self);
};

void () TeamFortress_DetpackExplode =
{
	local float pos;
	local float points;
	local entity head;
	local entity te;
	local vector org;

	bprint (SBAR_GRENS, "FIRE IN THE HOLE!\n");
	sound (self, SBAR_GRENS, "weapons/detpack.wav", SBAR_GRENS, minrate);
	pos = pointcontents (self.origin);
	if ((((pos != -2) && (pos != -6)) && !self.owner.has_disconnected))
	{
		deathmsg = 12;
		head = findradius (self.origin, 1500);
		while (head)
		{
			if ((head.classname == "info_tfgoal"))
			{
				if (((head.goal_activation & SBAR_PRINT) && (head.search_time == minrate)))
				{
					traceline (self.origin, head.origin, SBAR_GRENS, self);
					if ((trace_fraction == SBAR_GRENS))
					{
						if (Activated (head, self.owner))
						{
							DoResults (head, self.owner, SBAR_GRENS);
						}
						else
						{
							if ((head.else_goal != minrate))
							{
								te = Findgoal (head.else_goal);
								if (te)
								{
									AttemptToActivate (te, self.owner, head);
								}
							}
						}
					}
				}
			}
			else
			{
				if ((head.takedamage && (vlen ((head.origin - self.origin)) <= 700)))
				{
					org = (head.origin + ((head.mins + head.maxs) * 0.5));
					points = (0.5 * vlen ((self.origin - org)));
					if ((points < minrate))
					{
						points = minrate;
					}
					points = (700 - points);
					if (points)
					{
						if (tfstrike)
						{
							TF_T_Damage (head, self, self.owner, (points * SBAR_PRINT), SBAR_PRINT, AS_MISSILE);
						}
						else
						{
							if (CanDamage (head, self))
							{
								TF_T_Damage (head, self, self.owner, (points * SBAR_PRINT), SBAR_PRINT, AS_MISSILE);
							}
						}
					}
				}
			}
			head = head.chain;
		}
		if (tfstrike)
		{
			te = find (world, classname, "func_breakable");
			while (te)
			{
				if ((te.targetname == self.targetname))
				{
					te.solid = minrate;
					setmodel (te, string_null);
				}
				te = find (te, classname, "func_breakable");
			}
			te = find (world, classname, "env_explosion");
			while (te)
			{
				if ((te.targetname == self.targetname))
				{
					te.nextthink = (time + (random () * 0.2));
				}
				te = find (te, classname, "env_explosion");
			}
			tfs_winner = self.owner.team_no;
		}
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	else
	{
		sprint (self.owner, SBAR_PRINT, "Your detpack fizzled out.\n");
	}
	if ((self.weaponmode == SBAR_GRENS))
	{
		TeamFortress_SetSpeed (self.enemy);
		dremove (self.oldenemy);
		dremove (self.observer_list);
	}
	dremove (self);
};

void () TeamFortress_DetpackTouch =
{
	local entity disarm;
	local vector source;
	local vector org;
	local vector def;
	local float defusetime;

	CheckBelowBuilding (self);
	if ((other.classname != "player"))
	{
		return;
	}
	if (!tfstrike)
	{
		if ((other.playerclass != SBAR_GRENS))
		{
			return;
		}
	}
	else
	{
		if ((!other.playerclass || (other.team_no == SBAR_PRINT)))
		{
			return;
		}
	}
	if (other.deadflag)
	{
		return;
	}
	if ((self.weaponmode == SBAR_GRENS))
	{
		return;
	}
	if (((other.team_no == self.owner.team_no) && (self.owner.team_no != minrate)))
	{
		return;
	}
	makevectors (other.v_angle);
	source = (other.origin + '0 0 16');
	traceline (source, (source + (v_forward * 64)), minrate, other);
	if ((self.solid == SBAR_PRINT))
	{
		if (((trace_fraction == SBAR_GRENS) || (trace_ent != self)))
		{
			return;
		}
	}
	else
	{
		if ((trace_fraction == SBAR_GRENS))
		{
			return;
		}
	}
	other.immune_to_check = (time + 5);
	other.tfstate = (other.tfstate | 65536);
	TeamFortress_SetSpeed (other);
	disarm = spawn ();
	disarm.owner = other;
	disarm.enemy = self;
	disarm.classname = "timer";
	if (tfstrike)
	{
		defusetime = stof (infokey (world, "bombdefusetime"));
		if (((defusetime < AS_MELEE) || (defusetime > 15)))
		{
			defusetime = 8;
		}
		disarm.nextthink = (time + SBAR_GRENS);
		disarm.weapon = defusetime;
		sprint (other, SBAR_PRINT, "Defusing Bomb...\n");
	}
	else
	{
		disarm.nextthink = (time + AS_MELEE);
		sprint (other, SBAR_PRINT, "Disarming detpack...\n");
	}
	disarm.think = TeamFortress_DetpackDisarm;
	self.weaponmode = SBAR_GRENS;
	self.enemy = other;
	self.observer_list = disarm;
};

void () TeamFortress_DetpackDisarm =
{
	if (self.owner.deadflag)
	{
		dremove (self);
		return;
	}
	if (tfstrike)
	{
		if ((self.weapon > minrate))
		{
			ftos (self.weapon);
			CenterPrint3 (self.owner, "Defusing Bomb in ", ftos (self.weapon), " second(s)\n");
			self.weapon = (self.weapon - SBAR_GRENS);
			self.nextthink = (time + SBAR_GRENS);
			return;
		}
		bprint (SBAR_GRENS, self.enemy.owner.netname);
		bprint (SBAR_GRENS, "'s bomb was defused by ");
		bprint (SBAR_GRENS, self.owner.netname);
		bprint (SBAR_GRENS, "\n");
		tfs_winner = self.owner.team_no;
	}
	else
	{
		bprint (SBAR_GRENS, self.enemy.owner.netname);
		bprint (SBAR_GRENS, "'s detpack was defused by ");
		bprint (SBAR_GRENS, self.owner.netname);
		bprint (SBAR_GRENS, "\n");
	}
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 65536));
	TF_AddFrags (self.owner, SBAR_GRENS, minrate);
	TeamFortress_SetSpeed (self.owner);
	dremove (self.enemy.oldenemy);
	dremove (self.enemy);
	dremove (self);
};

void () TeamFortress_DetpackCountDown =
{
	local string cd;

	cd = ftos (self.health);
	CheckBelowBuilding (self.enemy);
	self.nextthink = (time + SBAR_GRENS);
	self.health = (self.health - SBAR_GRENS);
	if ((self.health < enter))
	{
		sprint (self.owner, SBAR_PRINT, cd);
		sprint (self.owner, SBAR_PRINT, "...\n");
		if (((self.health < 5) && (self.has_disconnected == minrate)))
		{
			sound (self.enemy, SBAR_PRINT, "doors/baseuse.wav", SBAR_GRENS, SBAR_GRENS);
			self.has_disconnected = SBAR_GRENS;
		}
		if (((self.health < 5) && (self.enemy.skin == minrate)))
		{
			self.enemy.skin = SBAR_GRENS;
		}
		else
		{
			self.enemy.skin = minrate;
		}
		if ((self.health <= minrate))
		{
			dremove (self);
		}
	}
};
void () CaltropTouch;
void () CaltropScatterThink;
void () ScatterCaltrops;
void () ConcussionGrenadeTouch;
void () ConcussionGrenadeExplode;
void (entity inflictor, entity attacker, float bounce, entity ignore) T_RadiusBounce;
entity (entity scanner, float scanrange, float enemies, float friends) T_RadiusScan;

void () CanisterTouch =
{
	sound (self, SBAR_GRENS, "weapons/tink1.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () CaltropTouch =
{
	if ((((other.classname != "player") || !(other.flags & 512)) || other.deadflag))
	{
		return;
	}
	if (((((teamplay & SBAR_240) && (other != self.owner)) && (other.team_no == self.owner.team_no)) && (self.owner.team_no != minrate)))
	{
		return;
	}
	sprint (other, SBAR_PRINT, "Ow, Ow, Ow! Caltrops!\n");
	if (!practice)
	{
		other.leg_damage = (other.leg_damage + SBAR_PRINT);
		TeamFortress_SetSpeed (other);
		deathmsg = 41;
		T_Damage (other, self, self.owner, enter);
	}
	dremove (self);
};

void () CaltropScatterThink =
{
	self.nextthink = (time + 0.2);
	if ((self.velocity == '0 0 0'))
	{
		if ((self.flags & 512))
		{
			self.nextthink = ((time + enter) + (random () * 5));
			self.think = SUB_Remove;
			self.solid = SBAR_GRENS;
			self.movetype = 6;
			self.touch = CaltropTouch;
			self.angles = '90 90 90';
			sound (self, minrate, "weapons/tink1.wav", SBAR_GRENS, SBAR_GRENS);
			setorigin (self, self.origin);
			return;
		}
		else
		{
			self.nextthink = ((time + enter) + (random () * 5));
			self.think = SUB_Remove;
			self.solid = SBAR_GRENS;
			self.movetype = 6;
			self.touch = CanisterTouch;
			setorigin (self, self.origin);
			return;
		}
	}
	traceline (self.movedir, self.origin, SBAR_GRENS, self);
	if ((trace_fraction == SBAR_GRENS))
	{
		self.movedir = self.origin;
		return;
	}
	self.velocity = (self.velocity * -1);
	self.heat = (self.heat + SBAR_GRENS);
	if ((self.heat > enter))
	{
		remove (self);
		return;
	}
};

void () ScatterCaltrops =
{
	local float num;
	local entity e;

	num = 6;
	while ((num > minrate))
	{
		e = spawn ();
		e.classname = "grenade";
		e.weapon = enter;
		e.owner = self.owner;
		e.team_no = self.owner.team_no;
		setmodel (e, "progs/caltrop.mdl");
		e.mins = '-4 -4 -8';
		e.maxs = '4 4 4';
		e.angles = '0 0 0';
		e.angles_x = (random () * 360);
		e.velocity_x = (crandom () * _d);
		e.velocity_y = (crandom () * _d);
		e.velocity_z = (200 + (random () * _d));
		e.avelocity_x = (crandom () * 400);
		e.avelocity_y = (crandom () * 400);
		e.avelocity_z = (crandom () * 400);
		setorigin (e, self.owner.origin);
		e.movedir = e.origin;
		e.heat = minrate;
		e.movetype = enter;
		e.solid = minrate;
		e.nextthink = (time + 0.2);
		e.think = CaltropScatterThink;
		num = (num - SBAR_GRENS);
	}
	dremove (self);
};

void () ConcussionGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () ConcussionGrenadeExplode =
{
	T_RadiusBounce (self, self.owner, 240, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () ConcussionGrenadeTimer =
{
	local string st;
	local vector src;
	local float pos;
	local float concadjust;
	local float stumble;

	if ((self.owner.invincible_finished > time))
	{
		sprint (self.owner, SBAR_PRINT, "Your head feels better now.\n");
		dremove (self);
		return;
	}
	if ((self.deadflag > minrate))
	{
		dremove (self);
		return;
	}
	if ((((((self.health == 200) || (self.health == 400)) || (self.health == 600)) || (self.health == 800)) || (self.health == 1000)))
	{
		newmis = spawn ();
		setmodel (newmis, "progs/s_bubble.spr");
		setorigin (newmis, self.owner.origin);
		newmis.movetype = 8;
		newmis.solid = minrate;
		newmis.velocity = '0 0 15';
		newmis.nextthink = (time + 0.5);
		newmis.think = bubble_bob;
		newmis.touch = bubble_remove;
		newmis.classname = "bubble";
		newmis.frame = minrate;
		newmis.cnt = minrate;
		setsize (newmis, '-8 -8 -8', '8 8 8');
	}
	self.health = (self.health - enter);
	if ((self.owner.playerclass == 5))
	{
		self.health = (self.health - enter);
	}
	if ((self.health < minrate))
	{
		self.health = minrate;
	}
	if (grentype)
	{
		self.nextthink = (time + 0.25);
	}
	else
	{
		concadjust = SBAR_GRENS;
		self.nextthink = (time + (0.25 * concadjust));
		if ((concadjust > SBAR_GRENS))
		{
			self.health = (self.health - concadjust);
		}
	}
	pos = pointcontents (self.owner.origin);
	src_x = ((self.owner.origin_x + self.owner.maxs_x) + SBAR_PRINT);
	src_y = ((self.owner.origin_y + self.owner.maxs_y) + SBAR_PRINT);
	src_z = self.owner.origin_z;
	pos = pointcontents (src);
	if (((self.owner.flags & 512) || (self.owner.flags & SBAR_240)))
	{
		if (!self.owner.is_feigning)
		{
			makevectors (self.owner.v_angle);
			stumble = (crandom () * self.health);
			if ((self.owner.playerclass == 6))
			{
				stumble = (stumble / AS_MELEE);
			}
			if (!((pos == -2) && (self.owner.velocity == '0 0 0')))
			{
				if ((crandom () < minrate))
				{
					self.owner.velocity_x = (self.owner.velocity_y + stumble);
					self.owner.velocity_y = (self.owner.velocity_x + stumble);
				}
				else
				{
					self.owner.velocity_x = ((-1 * self.owner.velocity_y) + stumble);
					self.owner.velocity_y = ((-1 * self.owner.velocity_x) + stumble);
				}
			}
		}
	}
	if ((self.health <= minrate))
	{
		sprint (self.owner, SBAR_PRINT, "Your head feels better now.\n");
		dremove (self);
	}
};

void () ScannerSwitch =
{
	local entity te;

	if ((self.ScannerOn != SBAR_GRENS))
	{
		te = spawn ();
		te.nextthink = (time + SBAR_PRINT);
		te.think = TeamFortress_Scan;
		te.owner = self;
		te.classname = "timer";
		te.netname = "scanner";
		sprint (self, SBAR_PRINT, "Scanner On.\n");
		self.ScannerOn = SBAR_GRENS;
	}
	else
	{
		te = find (world, netname, "scanner");
		while (te)
		{
			if ((te.owner == self))
			{
				dremove (te);
			}
			te = find (te, netname, "scanner");
		}
		sprint (self, SBAR_PRINT, "Scanner Off.\n");
		self.ScannerOn = minrate;
	}
};

void () TeamFortress_Scan =
{
	local string power;
	local entity list;
	local float scancost;
	local float scanrange;
	local float scen;
	local float scfr;
	local float num;
	local vector lightningvec;
	local float enemy_detected;
	local float any_detected;
	local vector vf;
	local vector vr;
	local vector e;
	local float res1;
	local float res2;
	local float res3;
	local float vf_e_angle;
	local float vr_e_angle;

	scanrange = _d;
	self.owner.impulse = minrate;
	self.owner.last_impulse = minrate;
	if ((self.owner.classname == "player"))
	{
		if (!(self.owner.tf_items & SBAR_GRENS))
		{
			return;
		}
		scancost = SBAR_PRINT;
		if ((self.owner.ammo_cells <= minrate))
		{
			sprint (self.owner, SBAR_PRINT, "Not enough cells to run scanner.\n");
			self.owner.ammo_cells = minrate;
			W_SetCurrentAmmo ();
			self.owner.ScannerOn = minrate;
			dremove (self);
			return;
		}
		if ((scancost > self.owner.ammo_cells))
		{
			scanrange = (self.owner.ammo_cells * 20);
			scancost = self.owner.ammo_cells;
			W_SetCurrentAmmo ();
		}
		scen = minrate;
		scfr = minrate;
		if ((self.owner.tf_items_flags & SBAR_GRENS))
		{
			scen = SBAR_GRENS;
		}
		if ((self.owner.tf_items_flags & SBAR_PRINT))
		{
			scfr = SBAR_GRENS;
		}
		if (((scen == minrate) && (scfr == minrate)))
		{
			sprint (self.owner, SBAR_PRINT, "No target specified.\n");
			self.owner.ScannerOn = minrate;
			dremove (self);
			return;
		}
		self.owner.ammo_cells = (self.owner.ammo_cells - SBAR_PRINT);
		if ((self.owner.ammo_cells < minrate))
		{
			self.owner.ammo_cells = minrate;
		}
		W_SetCurrentAmmo ();
		scanrange = (scanrange * 25);
		list = T_RadiusScan (self.owner, scanrange, scen, scfr);
	}
	scen = minrate;
	scfr = minrate;
	makevectors (self.owner.v_angle);
	if ((list != world))
	{
		any_detected = SBAR_GRENS;
		if (((((list.team_no > minrate) && (self.owner.team_no > minrate)) && (list.team_no == self.owner.team_no)) && ((list.classname == "player") || (list.classname == "building_sentrygun"))))
		{
			scfr = (scfr + SBAR_GRENS);
			enemy_detected = minrate;
		}
		else
		{
			if (((((list.goal_no > minrate) && (self.owner.team_no > minrate)) && (list.goal_no == self.owner.team_no)) && (list.classname == "item_tfgoal")))
			{
				scfr = (scfr + SBAR_GRENS);
				enemy_detected = minrate;
			}
			else
			{
				scen = (scen + SBAR_GRENS);
				enemy_detected = SBAR_GRENS;
			}
		}
		if (any_detected)
		{
			lightningvec = normalize ((list.origin - self.owner.origin));
			lightningvec = (lightningvec * (vlen ((list.origin - self.owner.origin)) / 5));
			lightningvec = (lightningvec + self.owner.origin);
			msg_entity = self.owner;
			WriteByte (SBAR_GRENS, 23);
			WriteByte (SBAR_GRENS, 5);
			WriteEntity (SBAR_GRENS, self.owner);
			WriteCoord (SBAR_GRENS, self.owner.origin_x);
			WriteCoord (SBAR_GRENS, self.owner.origin_y);
			WriteCoord (SBAR_GRENS, (self.owner.origin_z + 8));
			WriteCoord (SBAR_GRENS, lightningvec_x);
			WriteCoord (SBAR_GRENS, lightningvec_y);
			WriteCoord (SBAR_GRENS, (lightningvec_z + 8));
			if ((self.owner.tf_items_flags & AS_MISSILE))
			{
				stuffcmd (self.owner, "play misc/basekey.wav\n");
			}
			num = vlen ((list.origin - self.owner.origin));
			num = (num / enter);
			num = (num / AS_MELEE);
			num = rint (num);
			self.health = num;
			if ((list.classname == "player"))
			{
				if (((list.playerclass == 8) && (list.team_no != self.owner.team_no)))
				{
					if ((list.undercover_skin != minrate))
					{
						self.playerclass = list.undercover_skin;
					}
					else
					{
						self.playerclass = list.playerclass;
					}
					if ((list.undercover_team != minrate))
					{
						self.team_no = list.undercover_team;
					}
					else
					{
						self.team_no = list.team_no;
					}
				}
				else
				{
					self.playerclass = list.playerclass;
					self.team_no = list.team_no;
				}
			}
			else
			{
				if ((list.classname == "building_sentrygun"))
				{
					self.playerclass = 13;
					self.team_no = list.team_no;
				}
				else
				{
					if ((list.classname == "item_tfgoal"))
					{
						self.playerclass = 14;
						self.team_no = list.goal_no;
					}
				}
			}
			self.owner.StatusRefreshTime = (time + 0.2);
		}
	}
	if (((scen == minrate) && (scfr == minrate)))
	{
		self.health = minrate;
		self.owner.StatusRefreshTime = (time + 0.2);
		self.nextthink = (time + SBAR_PRINT);
		return;
	}
	W_SetCurrentAmmo ();
	self.nextthink = (time + SBAR_PRINT);
	return;
};

void (entity inflictor, entity attacker, float bounce, entity ignore) T_RadiusBounce =
{
	local float points;
	local entity head;
	local entity te;
	local vector org;
	local string st;

	head = findradius (inflictor.origin, (bounce + 40));
	while (head)
	{
		if ((head != ignore))
		{
			if (head.takedamage)
			{
				org = (head.origin + ((head.mins + head.maxs) * 0.5));
				points = (0.5 * vlen ((org - inflictor.origin)));
				if ((points < minrate))
				{
					points = minrate;
				}
				points = (bounce - points);
				if (((((head.classname != "building_dispenser") && (head.classname != "building_sentrygun")) && (head.classname != "building_sentrygun_base")) && (points > minrate)))
				{
					head.velocity = (org - inflictor.origin);
					head.velocity = (head.velocity * (points / 20));
					if ((head.classname == "player"))
					{
						te = find (world, classname, "timer");
						while ((((te.owner != head) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
						{
							te = find (te, classname, "timer");
						}
						if (practice)
						{
							return;
						}
						if ((te != world))
						{
							te.health = 800;
							te.nextthink = (time + 0.25);
						}
						else
						{
							te = spawn ();
							te.nextthink = (time + 0.25);
							te.think = ConcussionGrenadeTimer;
							te.team_no = attacker.team_no;
							te.classname = "timer";
							te.owner = head;
							te.health = 800;
						}
					}
				}
			}
		}
		head = head.chain;
	}
};

entity (entity scanner, float scanrange, float enemies, float friends) T_RadiusScan =
{
	local entity head;
	local float rangedist;

	rangedist = minrate;
	head = world;
	while ((rangedist <= scanrange))
	{
		if ((rangedist <= minrate))
		{
			rangedist = SBAR_GRENS;
		}
		head = findradius (scanner.origin, rangedist);
		while (head)
		{
			if ((head != scanner))
			{
				if ((((head.takedamage != minrate) && (head.health > minrate)) || (head.classname == "item_tfgoal")))
				{
					if ((((head.classname == "player") || (head.classname == "building_sentrygun")) && (friends || enemies)))
					{
						if (teamplay)
						{
							if ((((friends != minrate) && (head.team_no > minrate)) && (scanner.team_no > minrate)))
							{
								if (((head.playerclass == 8) && (head.team_no != scanner.team_no)))
								{
									if ((head.is_feigning != SBAR_GRENS))
									{
										if ((head.undercover_team == scanner.team_no))
										{
											return (head);
										}
									}
								}
								else
								{
									if ((head.team_no == scanner.team_no))
									{
										return (head);
									}
								}
							}
							if ((((enemies != minrate) && (head.team_no > minrate)) && (scanner.team_no > minrate)))
							{
								if (((head.playerclass == 8) && (head.team_no != scanner.team_no)))
								{
									if ((head.is_feigning != SBAR_GRENS))
									{
										if ((head.undercover_team != scanner.team_no))
										{
											return (head);
										}
									}
								}
								else
								{
									if ((head.team_no != scanner.team_no))
									{
										return (head);
									}
								}
							}
						}
						else
						{
							return (head);
						}
					}
					else
					{
						if (((head.classname == "item_tfgoal") && (friends || enemies)))
						{
							if (teamplay)
							{
								if (((((friends != minrate) && (head.goal_no > minrate)) && (scanner.team_no > minrate)) && (head.goal_no == scanner.team_no)))
								{
									return (head);
								}
								if (((((enemies != minrate) && (head.team_no > minrate)) && (scanner.team_no > minrate)) && (head.goal_no != scanner.team_no)))
								{
									return (head);
								}
							}
						}
					}
				}
			}
			head = head.chain;
		}
		rangedist = (rangedist + _d);
	}
	return (world);
};
void () Rail_Touch;
void () EMPExplode;
void () EMPGrenadeTouch;
void () EMPGrenadeExplode;
void () TeamFortress_FinishedBuilding;
void (entity Gren) TeamFortress_ExplodePerson;
void () Dispenser_Die;
void () CheckDistance;
float (entity obj, entity builder) CheckArea;

void () Rail_Think =
{
	self.solid = SBAR_GRENS;
	self.movetype = 9;
	self.velocity = self.oldorigin;
	self.touch = Rail_Touch;
	setmodel (self, "progs/e_spike2.mdl");
	self.nextthink = (time + SBAR_GRENS);
	self.think = SUB_Remove;
};

void () Rail_Touch =
{
	local vector org;

	if ((other == self.owner))
	{
		return;
	}
	if (((other == self.enemy) && (self.enemy != world)))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		dremove (self);
		return;
	}
	org = (self.origin - (8 * normalize (self.velocity)));
	if (other.health)
	{
		SpawnBlood (org, 15);
		deathmsg = 26;
		TF_T_Damage (other, self, self.enemy, 25, SBAR_PRINT, 8);
		self.velocity = self.oldorigin;
		self.owner = other;
		setmodel (self, string_null);
		self.touch = SUB_Null;
		self.nextthink = (time + 0.1);
		self.think = Rail_Think;
		return;
	}
	else
	{
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, minrate);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	dremove (self);
};

void () W_FireRail =
{
	local vector vec;
	local vector org;

	if (!practice)
	{
		self.ammo_nails = (self.ammo_nails - SBAR_GRENS);
		self.currentammo = self.ammo_nails;
	}
	makevectors (self.v_angle);
	org = (self.origin + (v_forward * 8));
	vec = aim (self, 10000);
	vec = normalize (vec);
	newmis = spawn ();
	newmis.owner = self;
	newmis.enemy = self;
	newmis.movetype = 9;
	newmis.solid = SBAR_GRENS;
	setmodel (newmis, "progs/e_spike1.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, (org + '0 0 16'));
	newmis.velocity = (vec * 1500);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.oldorigin = newmis.velocity;
	newmis.nextthink = (time + 5);
	newmis.think = SUB_Remove;
	newmis.touch = Rail_Touch;
};

void () EMPExplode =
{
	local float expsize;

	expsize = enter;
	if ((self.touch == weapon_touch))
	{
		expsize = SBAR_600;
	}
	else
	{
		if ((self.classname == "item_shells"))
		{
			expsize = (_2 + self.aflag);
		}
		else
		{
			if ((self.classname == "item_spikes"))
			{
				expsize = 40;
			}
			else
			{
				if ((self.classname == "item_rockets"))
				{
					expsize = (_d + (self.aflag * AS_MISSILE));
				}
				else
				{
					if ((self.classname == "item_cells"))
					{
						expsize = (SBAR_600 + (self.aflag * AS_MELEE));
					}
					else
					{
						if ((self.classname == "item_weapon"))
						{
							expsize = SBAR_600;
						}
						else
						{
							dprint ("EMPExplode: Attempting to explode a ");
							dprint (self.classname);
							dprint ("\n");
							return;
						}
					}
				}
			}
		}
	}
	deathmsg = 31;
	T_RadiusDamage (self, self.enemy, expsize, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	Respawn_Item (self, self.enemy);
};

void () EMPGrenadeTouch =
{
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () EMPGrenadeExplode =
{
	local float expsize;
	local entity te;
	local entity oldself;

	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MISSILE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	te = findradius (self.origin, 240);
	while (te)
	{
		if ((te.classname != "item_spikes"))
		{
			if (((te.touch == ammo_touch) || (te.touch == weapon_touch)))
			{
				te.solid = minrate;
				te.enemy = self.owner;
				te.nextthink = (time + (random () * 0.8));
				te.think = EMPExplode;
			}
			else
			{
				if (((te.classname == "player") || (te.touch == BackpackTouch)))
				{
					if (!(((teamplay & SBAR_240) && (te.team_no > minrate)) && (te.team_no == self.owner.team_no)))
					{
						expsize = minrate;
						expsize = (expsize + (te.ammo_shells * 0.75));
						expsize = (expsize + ((te.ammo_rockets * 0.75) * SBAR_PRINT));
						if ((te.playerclass != 9))
						{
							expsize = (expsize + (te.ammo_cells * 0.75));
						}
						if ((expsize > minrate))
						{
							deathmsg = 30;
							T_RadiusDamage (te, self.owner, expsize, te);
							if ((te.touch != BackpackTouch))
							{
								TF_T_Damage (te, self, self.owner, expsize, SBAR_PRINT, AS_MISSILE);
								if (!practice)
								{
									te.ammo_shells = ceil ((te.ammo_shells * 0.25));
									te.ammo_rockets = ceil ((te.ammo_rockets * 0.25));
								}
								if ((te.playerclass != 9))
								{
									if (!practice)
									{
										te.ammo_cells = ceil ((te.ammo_cells * 0.25));
									}
								}
								oldself = self;
								self = te;
								W_SetCurrentAmmo ();
								self = oldself;
							}
							else
							{
								te.think = SUB_Remove;
								te.nextthink = (time + 0.1);
							}
							WriteByte (AS_MISSILE, 23);
							WriteByte (AS_MISSILE, AS_MELEE);
							WriteCoord (AS_MISSILE, te.origin_x);
							WriteCoord (AS_MISSILE, te.origin_y);
							WriteCoord (AS_MISSILE, te.origin_z);
							multicast (te.origin, SBAR_GRENS);
						}
					}
				}
				else
				{
					if ((te.classname == "pipebomb"))
					{
						te.nextthink = (time + (random () * 0.4));
					}
					else
					{
						if (grentype)
						{
							if (((te.classname == "grenade") || (te.classname == "rocket")))
							{
								te.nextthink = time;
							}
						}
						else
						{
							if (((te.classname == "building_dispenser") || (te.classname == "building_sentrygun")))
							{
								if (!(((teamplay & SBAR_240) && (te.team_no > minrate)) && (te.team_no == self.owner.team_no)))
								{
									TF_T_Damage (te, self, self.owner, 200, minrate, AS_MISSILE);
								}
							}
							else
							{
								if ((te.classname == "ammobox"))
								{
									expsize = minrate;
									expsize = (expsize + (te.ammo_shells * 0.75));
									expsize = (expsize + ((te.ammo_rockets * 0.75) * SBAR_PRINT));
									expsize = (expsize + ((te.ammo_cells * 0.75) * SBAR_PRINT));
									if ((expsize > minrate))
									{
										te.solid = minrate;
										deathmsg = 30;
										T_RadiusDamage (te, self.owner, expsize, te);
										te.think = SUB_Remove;
										te.nextthink = (time + 0.1);
										WriteByte (AS_MISSILE, 23);
										WriteByte (AS_MISSILE, AS_MELEE);
										WriteCoord (AS_MISSILE, te.origin_x);
										WriteCoord (AS_MISSILE, te.origin_y);
										WriteCoord (AS_MISSILE, te.origin_z);
										multicast (te.origin, SBAR_GRENS);
									}
								}
								else
								{
									if (!tfstrike)
									{
										if ((te.think == TeamFortress_DetpackExplode))
										{
											te.solid = minrate;
											te.nextthink = (time + (random () * SBAR_PRINT));
											dremove (te.oldenemy);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		te = te.chain;
	}
	dremove (self);
};

void () TeamFortress_EngineerBuild =
{
	local entity te;

	if (!(self.flags & 512))
	{
		CenterPrint (self, "You can't build in the air!\n\n");
		return;
	}
	if ((self.is_building == minrate))
	{
		if ((((self.ammo_cells < _d) && !self.has_dispenser) && !self.has_sentry))
		{
			CenterPrint (self, "You don't have enough metal to \nbuild anything.\n\n");
			return;
		}
		self.current_menu = 15;
		self.menu_count = 25;
	}
	else
	{
		if ((self.is_building == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "You stop building.\n");
			self.tfstate = (self.tfstate - (self.tfstate & 65536));
			TeamFortress_SetSpeed (self);
			te = find (world, netname, "build_timer");
			while (te)
			{
				if ((te.owner == self))
				{
					dremove (te);
					te = world;
				}
				else
				{
					te = find (te, netname, "build_timer");
				}
			}
			self.is_building = minrate;
			self.current_weapon = self.weapon;
			W_SetCurrentAmmo ();
		}
	}
};

float (entity obj, entity builder) CheckArea =
{
	local vector src;
	local vector end;
	local float pos;
	local entity te;

	pos = pointcontents (obj.origin);
	if (((pos == -2) || (pos == -6)))
	{
		return (minrate);
	}
	src_x = ((obj.origin_x + obj.maxs_x) + 24);
	src_y = ((obj.origin_y + obj.maxs_y) + 24);
	src_z = ((obj.origin_z + obj.maxs_z) + SBAR_240);
	pos = pointcontents (src);
	if (((pos == -2) || (pos == -6)))
	{
		return (minrate);
	}
	end_x = ((obj.origin_x + obj.mins_x) - SBAR_240);
	end_y = ((obj.origin_y + obj.mins_y) - SBAR_240);
	end_z = ((obj.origin_z + obj.mins_z) - SBAR_240);
	traceline (src, end, SBAR_GRENS, obj);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	pos = pointcontents (end);
	if (((pos == -2) || (pos == -6)))
	{
		return (minrate);
	}
	src_x = ((obj.origin_x + obj.mins_x) - SBAR_240);
	src_y = ((obj.origin_y + obj.maxs_y) + SBAR_240);
	src_z = ((obj.origin_z + obj.maxs_z) + SBAR_240);
	pos = pointcontents (src);
	if (((pos == -2) || (pos == -6)))
	{
		return (minrate);
	}
	end_x = ((obj.origin_x + obj.maxs_x) + SBAR_240);
	end_y = ((obj.origin_y + obj.mins_y) - SBAR_240);
	end_z = ((obj.origin_z + obj.mins_z) - SBAR_240);
	traceline (src, end, SBAR_GRENS, obj);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	pos = pointcontents (end);
	if (((pos == -2) || (pos == -6)))
	{
		return (minrate);
	}
	traceline (builder.origin, obj.origin, SBAR_GRENS, builder);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	te = findradius (obj.origin, 64);
	if ((te != world))
	{
		return (minrate);
	}
	return (SBAR_GRENS);
};

void (float objtobuild) TeamFortress_Build =
{
	local float btime;
	local entity te;
	local vector tmp1;
	local vector tmp2;
	local string st;
	local float maxsgs;
	local float nosgs;

	newmis = spawn ();
	makevectors (self.v_angle);
	v_forward_z = minrate;
	v_forward = (normalize (v_forward) * 64);
	newmis.origin = (self.origin + v_forward);
	if ((CheckArea (newmis, self) == minrate))
	{
		sprint (self, SBAR_PRINT, "Not enough room to build here\n");
		dremove (newmis);
		return;
	}
	if ((objtobuild == SBAR_GRENS))
	{
		if (self.has_dispenser)
		{
			sprint (self, SBAR_PRINT, "You can only have one dispenser.\nTry dismantling your old one.\n");
			return;
		}
		tmp1 = '-16 -16 0';
		tmp2 = '16 16 48';
		newmis.mdl = "progs/disp.mdl";
		newmis.netname = "dispenser";
		btime = (time + SBAR_PRINT);
	}
	else
	{
		if ((objtobuild == SBAR_PRINT))
		{
			if (self.has_sentry)
			{
				sprint (self, SBAR_PRINT, "You can only have one sentry gun.\nTry dismantling your old one.\n");
				return;
			}
			st = infokey (world, "max_teamsgs");
			maxsgs = stof (st);
			if ((maxsgs == -1))
			{
				sprint (self, SBAR_PRINT, "You cannot have sentry guns on your team.\nDisabled by Administrator.\n");
				return;
			}
			if ((maxsgs > minrate))
			{
				te = find (world, classname, "building_sentry");
				while ((te != world))
				{
					if ((te.team_no == self.team_no))
					{
						nosgs = (nosgs + SBAR_GRENS);
					}
					te = find (te, classname, "building_sentry");
				}
				if ((nosgs >= maxsgs))
				{
					sprint3 (self, SBAR_PRINT, "You can only have ", st, " sentry guns on your team.\n");
					return;
				}
			}
			tmp1 = '-16 -16 0';
			tmp2 = '16 16 48';
			newmis.mdl = "progs/turrbase.mdl";
			newmis.netname = "sentrygun";
			btime = (time + 5);
		}
	}
	if (!(self.flags & 512))
	{
		CenterPrint (self, "You can't build in the air!\n\n");
		return;
	}
	self.is_building = SBAR_GRENS;
	self.immune_to_check = (time + 5);
	self.tfstate = (self.tfstate | 65536);
	self.weapon = self.current_weapon;
	self.current_weapon = minrate;
	self.weaponmodel = "";
	self.weaponframe = minrate;
	TeamFortress_SetSpeed (self);
	newmis.owner = self;
	newmis.classname = "timer";
	newmis.netname = "build_timer";
	newmis.nextthink = btime;
	newmis.think = TeamFortress_FinishedBuilding;
	newmis.colormap = self.colormap;
	newmis.weapon = objtobuild;
	newmis.angles_y = anglemod ((self.angles_y + 180));
	newmis.velocity = '0 0 8';
	newmis.movetype = 6;
	newmis.solid = SBAR_PRINT;
	setmodel (newmis, newmis.mdl);
	setsize (newmis, tmp1, tmp2);
	setorigin (newmis, newmis.origin);
	newmis.flags = (newmis.flags - (newmis.flags & 512));
};

void (entity bld) CheckBelowBuilding =
{
	local vector below;

	below = bld.origin;
	if ((bld.classname == "detpack"))
	{
		below_z = (below_z - 8);
	}
	else
	{
		below_z = (below_z - 24);
	}
	traceline (bld.origin, below, SBAR_GRENS, bld);
	if ((trace_fraction == SBAR_GRENS))
	{
		bld.movetype = 6;
		bld.flags = (bld.flags - (bld.flags & 512));
	}
};

void () DispenserThink =
{
	CheckBelowBuilding (self);
	if ((self.hook_out > AS_MELEE))
	{
		self.ammo_shells = (self.ammo_shells + rint ((400 / 20)));
		self.ammo_cells = (self.ammo_cells + rint ((400 / 20)));
		self.ammo_nails = (self.ammo_nails + rint ((600 / 20)));
		self.ammo_rockets = (self.ammo_rockets + rint ((300 / 20)));
		self.armorvalue = (self.armorvalue + rint ((500 / 20)));
		if ((self.ammo_shells > 400))
		{
			self.ammo_shells = 400;
		}
		if ((self.ammo_nails > 600))
		{
			self.ammo_nails = 600;
		}
		if ((self.ammo_rockets > 300))
		{
			self.ammo_rockets = 300;
		}
		if ((self.ammo_cells > 400))
		{
			self.ammo_cells = 400;
		}
		if ((self.armorvalue > 500))
		{
			self.armorvalue = 500;
		}
		self.hook_out = minrate;
	}
	self.hook_out = (self.hook_out + SBAR_GRENS);
	self.nextthink = (time + AS_MELEE);
};

void () TeamFortress_FinishedBuilding =
{
	local entity oldself;
	local entity te;
	local vector source;

	if ((self.owner.is_building != SBAR_GRENS))
	{
		return;
	}
	oldself = self;
	self = self.owner;
	oldself.owner = world;
	oldself.real_owner = self;
	self.is_building = minrate;
	self.tfstate = (self.tfstate - (self.tfstate & 65536));
	self.current_weapon = self.weapon;
	self.StatusRefreshTime = (time + 0.1);
	TeamFortress_SetSpeed (self);
	if ((oldself.weapon == SBAR_GRENS))
	{
		self.has_dispenser = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "You finish building the dispenser.\n");
		teamsprint (self.team_no, self, self.netname);
		teamsprint (self.team_no, self, " has built a Dispenser.\n");
		if (!practice)
		{
			self.ammo_cells = (self.ammo_cells - _d);
		}
		oldself.classname = "building_dispenser";
		oldself.netname = "dispenser";
		oldself.blocked = T_Dispenser;
		oldself.touch = T_Dispenser;
		oldself.max_health = 150;
		oldself.health = 150;
		oldself.hook_out = SBAR_GRENS;
		oldself.think = DispenserThink;
		oldself.nextthink = (time + AS_MELEE);
		oldself.th_die = Dispenser_Die;
		oldself.mdl = "progs/disp.mdl";
		oldself.team_no = self.team_no;
		oldself.real_owner = self;
		oldself.colormap = self.colormap;
		oldself.takedamage = SBAR_PRINT;
		oldself.owner = world;
		oldself.movetype = 6;
		oldself.velocity = '0 0 8';
		oldself.flags = (oldself.flags - (oldself.flags & 512));
		oldself.ammo_shells = ceil ((self.ammo_shells * 0.25));
		oldself.ammo_nails = ceil ((self.ammo_nails * 0.25));
		oldself.ammo_rockets = ceil ((self.ammo_rockets * 0.25));
		oldself.ammo_cells = ceil ((self.ammo_cells * 0.25));
		oldself.armorvalue = ceil ((self.armorvalue * 0.25));
		self.ammo_shells = ceil ((self.ammo_shells * 0.75));
		self.ammo_nails = ceil ((self.ammo_nails * 0.75));
		self.ammo_rockets = ceil ((self.ammo_rockets * 0.75));
		self.ammo_cells = ceil ((self.ammo_cells * 0.75));
		self.armorvalue = ceil ((self.armorvalue * 0.75));
		oldself.solid = SBAR_PRINT;
		setmodel (oldself, oldself.mdl);
		setsize (oldself, '-8 -8 0', '8 8 24');
		setorigin (oldself, (oldself.origin + '0 0 8'));
	}
	else
	{
		if ((oldself.weapon == SBAR_PRINT))
		{
			self.has_sentry = SBAR_GRENS;
			sprint (self, SBAR_PRINT, "You finish building the sentry gun.\n");
			teamsprint (self.team_no, self, self.netname);
			teamsprint (self.team_no, self, " has built a Sentry Gun.\n");
			oldself.classname = "building_sentrygun_base";
			oldself.netname = "sentry gun";
			oldself.takedamage = minrate;
			oldself.th_die = Sentry_Die;
			oldself.team_no = self.team_no;
			if (!practice)
			{
				self.ammo_cells = (self.ammo_cells - 130);
			}
			setsize (oldself, '-16 -16 0', '16 16 4');
			newmis = spawn ();
			newmis.classname = "building_sentrygun";
			newmis.health = 150;
			newmis.max_health = newmis.health;
			newmis.weapon = SBAR_GRENS;
			newmis.th_die = Sentry_Die;
			newmis.th_pain = Sentry_Pain;
			newmis.mdl = "progs/turrgun.mdl";
			sound (oldself, AS_MELEE, "weapons/turrset.wav", SBAR_GRENS, SBAR_GRENS);
			newmis.solid = SBAR_PRINT;
			setmodel (newmis, newmis.mdl);
			setsize (newmis, '-16 -16 0', '16 16 48');
			setorigin (newmis, (oldself.origin + '0 0 8'));
			newmis.view_ofs = '0 0 22';
			newmis.real_owner = oldself.real_owner;
			newmis.trigger_field = oldself;
			oldself.oldenemy = newmis;
			newmis.movetype = AS_MISSILE;
			oldself.colormap = self.colormap;
			newmis.colormap = self.colormap;
			newmis.takedamage = SBAR_PRINT;
			newmis.velocity = '0 0 -8';
			newmis.flags = (newmis.flags - (newmis.flags & 512));
			oldself.flags = (oldself.flags - (oldself.flags & 512));
			newmis.team_no = self.team_no;
			if (sgtype)
			{
				newmis.think = lvl1_sentry_stand;
				newmis.yaw_speed = (15 - (sentry_speed * SBAR_400));
			}
			else
			{
				newmis.think = lvl1_oldsentry_stand;
				newmis.yaw_speed = enter;
			}
			newmis.nextthink = (time + 0.5);
			newmis.heat = minrate;
			newmis.angles_x = minrate;
			newmis.angles_y = rint (oldself.angles_y);
			newmis.angles_z = minrate;
			newmis.waitmin = rint ((newmis.angles_y - _2));
			newmis.waitmin = anglemod (newmis.waitmin);
			newmis.waitmax = rint ((newmis.angles_y + _2));
			newmis.waitmax = anglemod (newmis.waitmax);
			if ((newmis.waitmin > newmis.waitmax))
			{
				newmis.waitmin = newmis.waitmax;
				newmis.waitmax = anglemod ((newmis.angles_y - _2));
			}
			newmis.ammo_shells = 25;
			newmis.maxammo_shells = _d;
			newmis.maxammo_rockets = 20;
		}
	}
	W_SetCurrentAmmo ();
	self = oldself;
};

void () T_Dispenser =
{
	local entity dist_checker;

	if ((other.classname != "player"))
	{
		return;
	}
	if (!other.team_no)
	{
		return;
	}
	if (((other.team_no != minrate) && (other.team_no != self.team_no)))
	{
		centerprint (self.real_owner, "Enemies are using your dispenser!\n");
	}
	if (((other.building == world) && (other.building_wait < time)))
	{
		other.current_menu = 19;
		other.menu_count = 25;
		other.building = self;
		dist_checker = spawn ();
		dist_checker.classname = "timer";
		dist_checker.owner = other;
		dist_checker.enemy = self;
		dist_checker.think = CheckDistance;
		dist_checker.nextthink = (time + 0.3);
	}
};

void () Dispenser_Explode =
{
	local float sdmg;

	if ((self.real_owner.has_disconnected != SBAR_GRENS))
	{
		deathmsg = 39;
		sdmg = ((25 + (self.ammo_rockets * 1.5)) + self.ammo_cells);
		if ((sdmg > 250))
		{
			sdmg = 250;
		}
		T_RadiusDamage (self, self.real_owner, sdmg, self);
	}
	ThrowGib ("progs/dgib1.mdl", -30);
	ThrowGib ("progs/dgib2.mdl", -50);
	ThrowGib ("progs/dgib3.mdl", -50);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () Dispenser_Die =
{
	self.real_owner.has_dispenser = minrate;
	self.think = Dispenser_Explode;
	self.nextthink = (time + 0.1);
};

void (entity disp) Engineer_UseDispenser =
{
	local entity dist_checker;
	local string st;

	sprint (self, SBAR_PRINT, "Dispenser has ");
	st = ftos (disp.health);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " health\n");
	st = ftos (disp.ammo_shells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " shells, ");
	st = ftos (disp.ammo_nails);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " nails,");
	st = ftos (disp.ammo_rockets);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " rockets\n");
	st = ftos (disp.ammo_cells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " cells, && ");
	st = ftos (disp.armorvalue);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " armor\n");
	self.current_menu = SBAR_240;
	self.menu_count = 25;
	self.building = disp;
	dist_checker = spawn ();
	dist_checker.classname = "timer";
	dist_checker.owner = self;
	dist_checker.enemy = disp;
	dist_checker.think = CheckDistance;
	dist_checker.nextthink = (time + 0.3);
};

void (entity gun) Engineer_UseSentryGun =
{
	local entity dist_checker;
	local string st;

	sprint (self, SBAR_PRINT, "Level ");
	st = ftos (gun.weapon);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " Sentry Gun has ");
	st = ftos (gun.health);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " health, ");
	st = ftos (gun.ammo_shells);
	sprint (self, SBAR_PRINT, st);
	sprint (self, SBAR_PRINT, " shells");
	if ((gun.weapon == AS_MELEE))
	{
		st = ftos (gun.ammo_rockets);
		sprint (self, SBAR_PRINT, ", ");
		sprint (self, SBAR_PRINT, st);
		sprint (self, SBAR_PRINT, " rockets");
	}
	sprint (self, SBAR_PRINT, "\n");
	self.current_menu = 17;
	self.menu_count = 25;
	self.building = gun;
	dist_checker = spawn ();
	dist_checker.classname = "timer";
	dist_checker.owner = self;
	dist_checker.enemy = gun;
	dist_checker.think = CheckDistance;
	dist_checker.nextthink = (time + 0.3);
};

void (entity gunhead) CheckSentry =
{
	local vector dist;
	local entity gunbase;

	gunbase = gunhead.trigger_field;
	dist = (gunbase.origin - gunhead.origin);
	if ((vlen (dist) > 15))
	{
		bprint (SBAR_GRENS, self.real_owner.netname);
		bprint (SBAR_GRENS, "'s sentry gun malfunctioned\n");
		Sentry_Die ();
	}
};

void () CheckDistance =
{
	local vector dist;

	if ((self.owner.building != self.enemy))
	{
		dremove (self);
		return;
	}
	dist = (self.enemy.origin - self.owner.origin);
	if ((vlen (dist) > 64))
	{
		CenterPrint (self.owner, "\n");
		self.owner.menu_count = 25;
		self.owner.current_menu = SBAR_GRENS;
		self.owner.building = world;
		dremove (self);
		return;
	}
	self.nextthink = (time + 0.3);
};

void (entity eng, string bld) DestroyBuilding =
{
	local entity te;
	local entity oldself;
	local float pos;

	te = find (world, classname, bld);
	while (te)
	{
		if ((te.real_owner == eng))
		{
			pos = pointcontents (te.origin);
			if (((pos == -2) || (pos == -6)))
			{
				oldself = self;
				self = eng;
				self.ammo_cells = (self.ammo_cells + _d);
				bound_other_ammo (self);
				W_SetCurrentAmmo ();
				self = oldself;
			}
			if ((te.real_owner.building == te))
			{
				if ((te.real_owner.StatusBarSize == minrate))
				{
					CenterPrint (te.real_owner, "\n");
				}
				else
				{
					te.real_owner.StatusRefreshTime = (time + 0.1);
				}
				te.real_owner.menu_count = 25;
				te.real_owner.current_menu = SBAR_GRENS;
				te.real_owner.building = world;
			}
			TF_T_Damage (te, world, world, 500, minrate, minrate);
		}
		te = find (te, classname, bld);
	}
};

void (entity eng) Engineer_RemoveBuildings =
{
	DestroyBuilding (eng, "building_dispenser");
	DestroyBuilding (eng, "building_sentrygun");
};
void () NailGrenadeExplode;
void () NailGrenadeNailEm;
void () NailGrenadeLaunchNail;

void () NailGrenadeTouch =
{
	if ((other == self.owner))
	{
		return;
	}
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NailGrenadeExplode =
{
	local entity te;

	self.owner.no_active_nail_grens = (self.owner.no_active_nail_grens + SBAR_GRENS);
	if ((self.owner.no_active_nail_grens > minrate))
	{
		te = find (world, classname, "grenade");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_nail_grens == SBAR_GRENS)))
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
	self.nextthink = (time + 0.1);
	self.think = NailGrenadeLaunchNail;
	self.playerclass = minrate;
};

void () NailGrenadeLaunchNail =
{
	local float i;
	local float j;
	local float cur_yaw;

	i = minrate;
	while ((i < AS_MELEE))
	{
		j = ((random () + SBAR_PRINT) * 5);
		cur_yaw = anglemod ((self.angles_y + j));
		self.angles_y = cur_yaw;
		self.angles_x = minrate;
		self.angles_z = minrate;
		makevectors (self.angles);
		deathmsg = 9;
		launch_spike (self.origin, v_forward);
		newmis.touch = superspike_touch;
		newmis.weapon = 9;
		i = (i + SBAR_GRENS);
	}
	self.playerclass = (self.playerclass + SBAR_GRENS);
	self.nextthink = (time + 0.1);
	if ((self.playerclass > _2))
	{
		self.weapon = 9;
		self.think = GrenadeExplode;
	}
};
void () SniperSight_Update;

void () TeamFortress_SniperWeapon =
{
	local float it;

	self.impulse = minrate;
	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	if (!((self.weapons_carried & space) && (self.weapons_carried & 64)))
	{
		return;
	}
	if ((self.ammo_shells < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "not enough ammo.\n");
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

	if ((self.tfstate & 4096))
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

	if ((!(self.owner.tfstate & 2048) || (self.owner.current_weapon != space)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & 2048));
		TeamFortress_SetSpeed (self.owner);
		self.owner.heat = minrate;
		dremove (self);
		return;
	}
	makevectors (self.owner.v_angle);
	org = (self.owner.origin + (v_forward * enter));
	org_z = (self.owner.absmin_z + (self.owner.size_z * 0.7));
	traceline (org, (org + (v_forward * 9192)), minrate, self);
	if ((trace_fraction == SBAR_GRENS))
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

	if ((self.has_disconnected == SBAR_GRENS))
	{
		return;
	}
	self.tfstate = (self.tfstate | 2048);
	sight = spawn ();
	sight.owner = self;
	sight.movetype = 8;
	sight.solid = minrate;
	sight.classname = "timer";
	setorigin (sight, self.origin);
	sight.think = SniperSight_Update;
	sight.nextthink = (time + 0.05);
	if ((self.team_no == SBAR_GRENS))
	{
		setmodel (sight, "progs/dot1.spr");
	}
	else
	{
		if ((self.team_no == SBAR_PRINT))
		{
			setmodel (sight, "progs/dot2.spr");
		}
		else
		{
			if ((self.team_no == AS_MELEE))
			{
				setmodel (sight, "progs/dot3.spr");
			}
			else
			{
				if ((self.team_no == AS_MISSILE))
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
	if ((self.tfstate & 4096))
	{
		self.tfstate = (self.tfstate - 4096);
		sprint (self, SBAR_PRINT, "autozoom ON\n");
	}
	else
	{
		self.tfstate = (self.tfstate | 4096);
		sprint (self, SBAR_PRINT, "autozoom OFF\n");
	}
};

void () AutoRecord =
{
	local float i;
	local string tmp;
	local entity t;

	if ((infokey (world, "serverdemo") != string_null))
	{
		return;
	}
	localcmd ("record ");
	if (tfvsdm)
	{
		localcmd ("tfvsdm_");
	}
	else
	{
		if (tfstrike)
		{
			localcmd ("tfstrike_");
		}
		else
		{
			if (duel)
			{
				localcmd ("duel_");
			}
			else
			{
				if (speedcap)
				{
					localcmd ("speedcap_");
				}
				else
				{
					if (practice)
					{
						localcmd ("practice_");
					}
					else
					{
						if (clanbattle)
						{
							localcmd ("clan_");
						}
					}
				}
			}
		}
	}
	while ((i < number_of_teams))
	{
		i = (i + SBAR_GRENS);
		tmp = GetTeamName (i);
		localcmd (tmp);
		localcmd ("_");
		if ((i < number_of_teams))
		{
			localcmd ("vs_");
		}
	}
	localcmd ("[");
	localcmd (mapname);
	localcmd ("]");
	t = find (world, classname, "prematch");
	if ((t != world))
	{
		if ((world.targetname != string_null))
		{
			calltimeofday ();
			localcmd ("_");
			localcmd (ftos (t.tp_grenades_2));
			localcmd ("-");
			localcmd (ftos (t.armorclass));
			localcmd ("-");
			localcmd (ftos (t.tf_items));
			localcmd ("_");
			localcmd (ftos (t.tp_grenades_1));
			localcmd ("-");
			localcmd (ftos (t.no_grenades_2));
		}
	}
	localcmd ("\n");
};

void () MatchOvertime =
{
	local float f2;

	if (cease_fire)
	{
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	if (TeamFortress_CheckDraw ())
	{
		self.cnt2 = (self.cnt2 + SBAR_GRENS);
		f2 = stof (infokey (world, "overtime"));
		if ((f2 > minrate))
		{
			if ((self.cnt2 <= (f2 * SBAR_600)))
			{
				self.think = MatchOvertime;
				self.nextthink = (time + SBAR_GRENS);
				return;
			}
		}
	}
	self.think = SUB_Remove;
	self.nextthink = (time + 0.5);
	NextLevel ();
};

void () MatchThink =
{
	local string tmp;

	if ((self.cnt == -1))
	{
		return;
	}
	if (cease_fire)
	{
		self.nextthink = (time + SBAR_GRENS);
		return;
	}
	self.cnt2 = (self.cnt2 - SBAR_GRENS);
	if (!TeamFortress_GetNoPlayers ())
	{
		NextLevel ();
		return;
	}
	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - SBAR_GRENS);
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}
	if (!self.cnt2)
	{
		if (((self.cnt == SBAR_GRENS) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (SBAR_PRINT, "ê", tmp, "ë minute");
			if ((self.cnt != SBAR_GRENS))
			{
				bprint (SBAR_PRINT, "s");
			}
			bprint (SBAR_PRINT, " remaining\n");
		}
		if (!self.cnt)
		{
			tmp = infokey (world, "overtime");
			if (stof (tmp))
			{
				if (TeamFortress_CheckDraw ())
				{
					bprint (SBAR_PRINT, "Draw, overtime set.\n Golden Cap WINS!!!\n");
					self.cnt2 = minrate;
					MatchOvertime ();
					self.cnt = -1;
					return;
				}
			}
			self.think = SUB_Remove;
			self.nextthink = (time + 0.1);
			NextLevel ();
			return;
		}
	}
	if ((!self.cnt && (((self.cnt2 == 30) || (self.cnt2 == 15)) || (self.cnt2 <= enter))))
	{
		tmp = ftos (self.cnt2);
		bprint3 (SBAR_PRINT, "ê", tmp, "ë second");
		if ((self.cnt2 != SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " remaining\n");
	}
	self.nextthink = (time + SBAR_GRENS);
};

void () StartMatch =
{
	local string st;
	local float f1;
	local float f2;
	local entity te;
	local entity oldself;
	local entity gren;

	lightstyle (minrate, "m");
	bprint (SBAR_PRINT, "MATCH BEGINS NOW\n");
	team4score = minrate;
	team3score = minrate;
	team2score = minrate;
	team1score = minrate;
	team4frags = minrate;
	team3frags = minrate;
	team2frags = minrate;
	team1frags = minrate;
	te = find (world, classname, "player");
	while (te)
	{
		oldself = self;
		self = te;
		if (self.hook_out)
		{
			Reset_Grapple (self.hook);
			Attack_Finished (0.75);
			self.hook_out = SBAR_GRENS;
		}
		TeamFortress_RemoveTimers ();
		self.frags = minrate;
		self.real_frags = minrate;
		setspawnparms (self);
		PutClientInServer ();
		self = oldself;
		te = find (te, classname, "player");
	}
	gren = find (world, classname, "grenade");
	while (gren)
	{
		gren.think = GrenadeExplode;
		gren.nextthink = (time + 0.1);
		gren = find (gren, classname, "grenade");
	}
	freeze = minrate;
	cb_prematch = minrate;
	cease_fire = minrate;
	te = find (world, classname, "prematch");
	te.classname = "match";
	te.cnt = (timelimit / SBAR_600);
	te.cnt2 = SBAR_600;
	if ((te.cnt == minrate))
	{
		bprint (SBAR_PRINT, "Warning no timelimit set!\n");
		localcmd ("\nserverinfo status \"0 min left\"\n");
		te.cnt = -1;
		te.cnt2 = -1;
	}
	else
	{
		te.cnt = (te.cnt - SBAR_GRENS);
		localcmd ("\nserverinfo status \"");
		st = ftos (te.cnt);
		localcmd (st);
		localcmd (" min left\"\n");
		te.think = MatchThink;
		te.nextthink = (time + SBAR_GRENS);
	}
	st = infokey (world, "spectalk");
	f2 = stof (st);
	if (!f2)
	{
		st = "0";
	}
	localcmd ("sv_spectalk ");
	localcmd (st);
	localcmd ("\n");
	f1 = stof (infokey (world, "fpd"));
	f1 = ((f1 - (f1 & 64)) + (f2 * 64));
	localcmd ("serverinfo fpd ");
	st = ftos (f1);
	localcmd (st);
	localcmd ("\n");
	if (rounds)
	{
		StartRound ();
	}
};

void () PreMatch_Think =
{
	local entity p;
	local string num;
	local float fl;

	self.cnt2 = (self.cnt2 - SBAR_GRENS);
	if ((self.cnt2 == SBAR_GRENS))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				p.respawn_time = (time + SBAR_PRINT);
				p.takedamage = minrate;
				p.solid = minrate;
				p.movetype = minrate;
				p.modelindex = minrate;
				p.model = string_null;
			}
			p = find (p, classname, "player");
		}
	}
	else
	{
		if (!self.cnt2)
		{
			self.nextthink = (time + 0.1);
			self.think = SUB_Remove;
			p = find (world, classname, "player");
			while ((p != world))
			{
				if ((p.netname != ""))
				{
					p.takedamage = SBAR_PRINT;
					p.solid = AS_MELEE;
					p.movetype = AS_MELEE;
				}
				p = find (p, classname, "player");
			}
			StartMatch ();
			return;
		}
	}
	fl = (self.cnt2 / SBAR_600);
	if (((((((((((fl == SBAR_GRENS) || (fl == SBAR_PRINT)) || (fl == AS_MELEE)) || (fl == AS_MISSILE)) || (fl == 5)) || (fl == 6)) || (fl == 7)) || (fl == 8)) || (fl == 9)) || (fl == enter)))
	{
		num = ftos (fl);
		bprint3 (SBAR_PRINT, "Match will begin in ", num, " minute(s).\n");
	}
	if ((self.cnt2 == 30))
	{
		num = ftos ((self.cnt2 / SBAR_600));
		bprint (SBAR_PRINT, "Match will begin in 30 seconds.\n");
	}
	if ((self.cnt2 <= enter))
	{
		if ((self.cnt2 == enter))
		{
			lightstyle (minrate, "e");
			if ((infokey (world, "status") != "Countdown"))
			{
				localcmd ("serverinfo status Countdown\n");
			}
			if ((stof (infokey (world, "demo_auto_left")) > minrate))
			{
				AutoRecord ();
			}
		}
		num = ftos (self.cnt2);
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				CenterPrint3 (p, "Countdown ", num, "\n");
				if ((self.cnt2 < 6))
				{
					cease_fire = minrate;
					stuffcmd (p, "play buttons/switch04.wav\n");
				}
			}
			p = find (p, classname, "player");
		}
		if ((self.cnt2 > SBAR_GRENS))
		{
			bprint2 (SBAR_PRINT, num, " seconds.\n");
		}
		else
		{
			bprint (SBAR_PRINT, "1 second.\n");
		}
	}
	self.nextthink = (time + SBAR_GRENS);
};

void () StartTimer =
{
	local entity timer;
	local entity p;
	local float f1;
	local string tmp;

	if ((clanbattle == minrate))
	{
		if ((self != world))
		{
			sprint (self, SBAR_PRINT, "Clan mode off....\n");
			sprint (self, SBAR_PRINT, "Match cannot be started.\n");
		}
		else
		{
			dprint ("Clan mode off....\n");
			dprint ("Match cannot be started.\n");
		}
		return;
	}
	if (((clanbattle == SBAR_GRENS) && (cb_prematch == minrate)))
	{
		if ((self != world))
		{
			sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
			sprint (self, SBAR_PRINT, "Type break to stop the current battle.\n");
		}
		else
		{
			dprint ("Clan Battle in progress....\n");
			dprint ("Type break to stop the current battle.\n");
		}
		return;
	}
	if ((infokey (world, "status") == "Countdown"))
	{
		if ((self != world))
		{
			sprint (self, SBAR_PRINT, "Countdown in progress....\n");
		}
		else
		{
			dprint ("Countdown in progress....\n");
		}
		return;
	}
	timer = find (world, classname, "prematch");
	while ((timer != world))
	{
		dremove (timer);
		timer = find (timer, classname, "prematch");
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 170))
	{
		bprint (SBAR_PRINT, "QiZmo:");
		if ((f1 & SBAR_PRINT))
		{
			bprint (SBAR_PRINT, " ÙÈÌÂÚ");
		}
		if ((f1 & 8))
		{
			bprint (SBAR_PRINT, " Ï·Á");
		}
		if ((f1 & space))
		{
			bprint (SBAR_PRINT, " ÂÓÂÌ˘");
		}
		if ((f1 & 128))
		{
			bprint (SBAR_PRINT, " ÔÈÓÙ");
		}
		bprint (SBAR_PRINT, " disabled\n");
	}
	f1 = stof (infokey (world, "prematch"));
	timer = spawn ();
	timer.owner = world;
	timer.classname = "prematch";
	timer.cnt = minrate;
	if (pmtime)
	{
		timer.cnt2 = rint ((pmtime * SBAR_600));
		if ((timer.cnt2 < SBAR_GRENS))
		{
			timer.cnt2 = SBAR_GRENS;
		}
	}
	else
	{
		lightstyle (minrate, "e");
		if ((stof (infokey (world, "demo_auto_left")) > minrate))
		{
			AutoRecord ();
		}
		localcmd ("serverinfo status Countdown\n");
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				stuffcmd (p, "play items/protect2.wav\n");
			}
			p = find (timer, classname, "player");
		}
		timer.cnt2 = rint (stof (infokey (world, "count")));
		if ((timer.cnt2 < SBAR_GRENS))
		{
			timer.cnt2 = minrate;
		}
	}
	timer.cnt2 = (timer.cnt2 + SBAR_GRENS);
	timer.nextthink = (time + 0.1);
	tmp = ftos (timer.cnt2);
	timer.think = PreMatch_Think;
};

void () StopTimer =
{
	local entity t;

	if ((infokey (world, "serverdemo") != string_null))
	{
		localcmd ("cancel\n");
	}
	if (cb_prematch)
	{
		t = find (world, classname, "prematch");
		while ((t != world))
		{
			t.nextthink = (time + 0.1);
			t.think = SUB_Remove;
			t = find (t, classname, "prematch");
		}
		localcmd ("serverinfo status Standby\n");
		lightstyle (minrate, "m");
		return;
	}
	t = find (world, classname, "match");
	if ((t != world))
	{
		remove (t);
	}
	localcmd ("serverinfo status Normal\n");
};

void () PlayerBreak =
{
	local float f1;
	local float f2;
	local string tmp;

	if (intermission_running)
	{
		return;
	}
	if ((self.classname != "player"))
	{
		return;
	}
	if (cb_prematch)
	{
		if (!pmtime)
		{
			bprint2 (SBAR_PRINT, self.netname, " stops the countdown\n");
			StopTimer ();
		}
		return;
	}
	tmp = infokey (world, "votetime");
	f1 = (stof (tmp) * SBAR_600);
	if ((f1 > time))
	{
		sprint (self, SBAR_PRINT, "You cannot break at this time.\n");
		return;
	}
	if ((self.allowvote > time))
	{
		return;
	}
	self.allowvote = (time + AS_MELEE);
	if (self.bvote)
	{
		bprint2 (SBAR_PRINT, self.netname, " ˜ÈÙË‰Ú·˜Û ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (SBAR_PRINT, "ËÂÚ ");
		}
		else
		{
			bprint (SBAR_PRINT, "ËÈÛ ");
		}
		bprint (AS_MELEE, "vote\n");
		self.bvote = minrate;
		v_break = (v_break - SBAR_GRENS);
		return;
	}
	if (clanbattle)
	{
		bprint2 (AS_MELEE, self.netname, " votes for stopping the match\n");
	}
	else
	{
		bprint2 (AS_MELEE, self.netname, " votes to end the current map\n");
	}
	self.bvote = SBAR_GRENS;
	v_break = (v_break + SBAR_GRENS);
	f1 = TeamFortress_GetNoPlayers ();
	f2 = (floor ((f1 / SBAR_PRINT)) + SBAR_GRENS);
	if ((v_break >= f2))
	{
		if (clanbattle)
		{
			bprint (SBAR_PRINT, "Match stopped by majority vote\n");
		}
		else
		{
			bprint (SBAR_PRINT, "Map ended by majority vote\n");
		}
		StopTimer ();
		NextLevel ();
		return;
	}
	if ((v_break != minrate))
	{
		f1 = (f2 - v_break);
		tmp = ftos (f1);
		bprint3 (SBAR_PRINT, "ê", tmp, "ë more vote");
		if ((f1 > SBAR_GRENS))
		{
			bprint (SBAR_PRINT, "s");
		}
		bprint (SBAR_PRINT, " needed\n");
	}
};

void () RemoveVotes =
{
	if (self.bvote)
	{
		bprint2 (SBAR_PRINT, self.netname, " ˜ÈÙË‰Ú·˜Û ");
		if ((infokey (self, "gender") == "f"))
		{
			bprint (SBAR_PRINT, "ËÂÚ ");
		}
		else
		{
			bprint (SBAR_PRINT, "ËÈÛ ");
		}
		bprint (AS_MELEE, "vote\n");
		self.bvote = minrate;
		v_break = (v_break - SBAR_GRENS);
	}
	if (elect)
	{
		if ((self.is_admin == SBAR_PRINT))
		{
			bprint2 (SBAR_PRINT, self.netname, " aborts election!");
			bprint (AS_MELEE, "\n");
			AbortElect ();
		}
	}
};
void () ReturnItem;
void () ball_reset;
void () TeamFortress_AmmoboxThink;

float () CheckWinner =
{
	local float team1alive;
	local float team2alive;
	local float team3alive;
	local float team4alive;
	local float nump;
	local float totalp;
	local entity Player;

	if (tfs_winner)
	{
		return (tfs_winner);
	}
	Player = find (world, classname, "player");
	while ((Player != world))
	{
		totalp = (totalp + SBAR_GRENS);
		if ((Player.playerclass && !Player.deadflag))
		{
			nump = (nump + SBAR_GRENS);
			if ((Player.team_no == SBAR_GRENS))
			{
				team1alive = (team1alive + SBAR_GRENS);
			}
			if ((Player.team_no == SBAR_PRINT))
			{
				team2alive = (team2alive + SBAR_GRENS);
			}
			if ((Player.team_no == AS_MELEE))
			{
				team3alive = (team3alive + SBAR_GRENS);
			}
			if ((Player.team_no == AS_MISSILE))
			{
				team4alive = (team4alive + SBAR_GRENS);
			}
		}
		Player = find (Player, classname, "player");
	}
	if (((nump > minrate) && (totalp > SBAR_GRENS)))
	{
		if ((((team1alive && !team2alive) && !team3alive) && !team4alive))
		{
			if (tfstrike)
			{
				Player = find (world, classname, "detpack");
				if ((Player != world))
				{
					return (minrate);
				}
			}
			return (SBAR_GRENS);
		}
		if ((((!team1alive && team2alive) && !team3alive) && !team4alive))
		{
			return (SBAR_PRINT);
		}
		if ((((!team1alive && !team2alive) && team3alive) && !team4alive))
		{
			return (AS_MELEE);
		}
		if ((((!team1alive && !team2alive) && !team3alive) && team4alive))
		{
			return (AS_MISSILE);
		}
	}
	if (!nump)
	{
		if (tfstrike)
		{
			Player = find (world, classname, "detpack");
			if ((Player != world))
			{
				return (SBAR_PRINT);
			}
		}
		return (-1);
	}
	return (minrate);
};

void () RoundOver =
{
	local string st;

	round_over = SBAR_PRINT;
	if ((tfs_winner == -1))
	{
		bprint (SBAR_PRINT, "Round Drawn!\n");
	}
	else
	{
		if ((tfs_winner == SBAR_GRENS))
		{
			if (tfstrike)
			{
				sound (self, SBAR_PRINT, "speech/ctwin.wav", SBAR_GRENS, minrate);
				bprint (SBAR_PRINT, "Counter Terrorists WIN!\n");
				TeamFortress_TeamIncreaseScore (tfs_winner, enter);
			}
			else
			{
				bprint (SBAR_PRINT, "Blue Team Wins the Round!\n");
			}
		}
		else
		{
			if ((tfs_winner == SBAR_PRINT))
			{
				if (tfstrike)
				{
					sound (self, SBAR_PRINT, "speech/terwin.wav", SBAR_GRENS, minrate);
					bprint (SBAR_PRINT, "Terrorists WIN!\n");
					TeamFortress_TeamIncreaseScore (tfs_winner, enter);
				}
				else
				{
					bprint (SBAR_PRINT, "Red Team Wins the Round!\n");
				}
			}
			else
			{
				if ((tfs_winner == AS_MELEE))
				{
					bprint (SBAR_PRINT, "Yellow Team Wins the Round!\n");
				}
				else
				{
					if ((tfs_winner == AS_MISSILE))
					{
						bprint (SBAR_PRINT, "Green Team Wins the Round!\n");
					}
				}
			}
		}
	}
	if (TeamFortress_CheckDraw ())
	{
		if ((rounds == SBAR_GRENS))
		{
			rounds = (rounds + SBAR_GRENS);
		}
	}
	self.think = StartRound;
	self.nextthink = (time + 0.5);
};

void () RoundThink =
{
	local string tmp;
	local float fl;

	tfs_winner = CheckWinner ();
	if (tfs_winner)
	{
		self.think = RoundOver;
		self.nextthink = (time + 0.1);
		return;
	}
	if ((self.cnt == -1))
	{
		return;
	}
	if (!TeamFortress_GetNoPlayers ())
	{
		self.think = StartRound;
		self.nextthink = (time + AS_MELEE);
		return;
	}
	self.cnt2 = (self.cnt2 - 0.5);
	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - SBAR_GRENS);
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}
	if (!self.cnt2)
	{
		if (((self.cnt == SBAR_GRENS) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (SBAR_PRINT, "ê", tmp, "ë minute");
			if ((self.cnt != SBAR_GRENS))
			{
				bprint (SBAR_PRINT, "s");
			}
			bprint (SBAR_PRINT, " remaining\n");
		}
		if (!self.cnt)
		{
			bprint (SBAR_PRINT, "ROUND TIME OVER\n");
			if (tfstrike)
			{
				tfs_winner = SBAR_GRENS;
			}
			else
			{
				tfs_winner = -1;
			}
			self.think = RoundOver;
			self.nextthink = (time + 0.1);
			return;
		}
	}
	if ((!self.cnt && (((self.cnt2 == 30) || (self.cnt2 == 15)) || (self.cnt2 <= enter))))
	{
		fl = ceil (self.cnt2);
		if (!(fl - self.cnt2))
		{
			tmp = ftos (self.cnt2);
			bprint3 (SBAR_PRINT, "ê", tmp, "ë second");
			if ((self.cnt2 != SBAR_GRENS))
			{
				bprint (SBAR_PRINT, "s");
			}
			bprint (SBAR_PRINT, " remaining\n");
		}
	}
	self.nextthink = (time + 0.5);
};

float () tfs_givebomb =
{
	local float counter;
	local entity te;
	local float the_one;

	te = find (world, classname, "player");
	while ((te != world))
	{
		if (((te.team_no == SBAR_PRINT) && te.playerclass))
		{
			counter = (counter + SBAR_GRENS);
		}
		te = find (te, classname, "player");
	}
	if ((counter == SBAR_GRENS))
	{
		the_one = counter;
	}
	else
	{
		if ((counter > SBAR_GRENS))
		{
			the_one = ceil ((random () * counter));
		}
	}
	return (the_one);
};

void () RoundBegin =
{
	local entity te;
	local entity oldself;
	local string st;
	local float bomber;
	local float counter;

	te = find (world, classname, "func_breakable");
	while (te)
	{
		setmodel (te, te.mdl);
		te.solid = AS_MISSILE;
		te = find (te, classname, "func_breakable");
	}
	te = find (world, classname, "func_bomb_target");
	if ((te != world))
	{
		bomber = tfs_givebomb ();
	}
	te = find (world, classname, "player");
	while ((te != world))
	{
		oldself = self;
		self = te;
		if (self.hook_out)
		{
			Reset_Grapple (self.hook);
			Attack_Finished (0.75);
			self.hook_out = SBAR_GRENS;
		}
		TeamFortress_RemoveTimers ();
		if (duel)
		{
			if (self.deadflag)
			{
				PutClientInServer ();
			}
			else
			{
				if ((self.tfstate & 8))
				{
					self.tfstate = 8;
				}
				else
				{
					self.tfstate = minrate;
				}
				self.takedamage = SBAR_PRINT;
				self.flags = 8;
				self.air_finished = (time + 12);
				self.dmg = SBAR_PRINT;
				self.super_damage_finished = minrate;
				self.radsuit_finished = minrate;
				self.invisible_finished = minrate;
				self.invincible_finished = minrate;
				self.effects = minrate;
				self.invincible_time = minrate;
				self.reload_shotgun = minrate;
				self.reload_super_shotgun = minrate;
				self.reload_grenade_launcher = minrate;
				self.reload_rocket_launcher = minrate;
				self.on_hook = minrate;
				self.hook_out = minrate;
				self.fire_held_down = minrate;
				self.mapcount = _d;
				TeamFortress_SetEquipment ();
				TeamFortress_SetHealth ();
				TeamFortress_SetSpeed (self);
				stuffcmd (self, "v_cshift; wait; bf\n");
			}
			stuffcmd (self, "play fight.wav\n");
		}
		else
		{
			PutClientInServer ();
			if (tfstrike)
			{
				if (((self.team_no == SBAR_PRINT) && self.playerclass))
				{
					counter = (counter + SBAR_GRENS);
					if ((counter == bomber))
					{
						self.ammo_detpack = SBAR_GRENS;
						stuffcmd (self, "topcolor 0\n");
						CenterPrint (self, "You have the bomb!\n");
						if ((self.playerclass == 8))
						{
							self.is_unabletospy = SBAR_GRENS;
						}
					}
				}
			}
		}
		self = oldself;
		te = find (te, classname, "player");
	}
	bprint (SBAR_PRINT, "ROUND BEGINS NOW\n");
	round_active = SBAR_GRENS;
	round_over = minrate;
	if (speedcap)
	{
		self.invisible_time = time;
	}
	if (!self.cnt)
	{
		self.cnt = AS_MELEE;
		self.cnt2 = SBAR_600;
	}
	else
	{
		counter = floor (self.cnt);
		if ((counter < self.cnt))
		{
			self.cnt2 = ((self.cnt - counter) * SBAR_600);
		}
		else
		{
			self.cnt2 = SBAR_600;
		}
		if ((self.cnt2 == SBAR_600))
		{
			self.cnt = (self.cnt - SBAR_GRENS);
		}
		else
		{
			self.cnt = counter;
		}
	}
	self.think = RoundThink;
	self.nextthink = (time + 0.1);
};

void () RoundInit =
{
	local string num;
	local float fl;
	local entity p;

	fl = TeamFortress_NoTeams ();
	if ((fl < SBAR_GRENS))
	{
		self.nextthink = (time + SBAR_PRINT);
		return;
	}
	self.cnt2 = (self.cnt2 - SBAR_GRENS);
	if ((self.cnt2 == SBAR_PRINT))
	{
		round_over = SBAR_PRINT;
	}
	if ((self.cnt2 == SBAR_GRENS))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				p.takedamage = minrate;
				p.solid = minrate;
				p.movetype = minrate;
				p.modelindex = minrate;
				p.model = string_null;
			}
			p = find (p, classname, "player");
		}
	}
	else
	{
		if (!self.cnt2)
		{
			self.nextthink = (time + 0.1);
			self.think = RoundBegin;
			p = find (world, classname, "player");
			while ((p != world))
			{
				if ((p.netname != ""))
				{
					p.takedamage = SBAR_PRINT;
					p.solid = AS_MELEE;
					p.movetype = AS_MELEE;
				}
				p = find (p, classname, "player");
			}
			return;
		}
	}
	if ((self.cnt2 <= 5))
	{
		num = ftos (self.cnt2);
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				CenterPrint3 (p, "Round begins in: ", num, " second(s).\n");
				cease_fire = minrate;
				if (duel)
				{
					if ((self.cnt2 == AS_MELEE))
					{
						stuffcmd (p, "play 3.wav\n");
					}
					else
					{
						if ((self.cnt2 == SBAR_PRINT))
						{
							stuffcmd (p, "play 2.wav\n");
						}
						else
						{
							if ((self.cnt2 == SBAR_GRENS))
							{
								stuffcmd (p, "play 1.wav\n");
							}
						}
					}
				}
				else
				{
					stuffcmd (p, "play buttons/switch04.wav\n");
				}
			}
			p = find (p, classname, "player");
		}
	}
	self.nextthink = (time + SBAR_GRENS);
};

void () StartRound =
{
	local string st;
	local float fl;
	local entity te;
	local entity oldself;
	local entity gren;

	if ((rounds == SBAR_GRENS))
	{
		NextLevel ();
		bprint (SBAR_PRINT, "Rounds Over!\n");
	}
	if ((rounds > SBAR_GRENS))
	{
		rounds = (rounds - SBAR_GRENS);
	}
	if (intermission_running)
	{
		return;
	}
	tfs_winner = minrate;
	round_over = SBAR_GRENS;
	if (round_active)
	{
		te = find (world, classname, "player");
		while ((te != world))
		{
			oldself = self;
			self = te;
			if (self.hook_out)
			{
				Reset_Grapple (self.hook);
				Attack_Finished (0.75);
				self.hook_out = SBAR_GRENS;
			}
			self.menu_count = 25;
			self.current_menu = SBAR_GRENS;
			TeamFortress_ThrowGrenade ();
			TeamFortress_RemoveTimers ();
			if ((self.playerclass == 9))
			{
				Engineer_RemoveBuildings (self);
			}
			if (tfstrike)
			{
				if (((self.team_no == SBAR_PRINT) && self.playerclass))
				{
					self.ammo_detpack = minrate;
					stuffcmd (self, "topcolor ");
					fl = (TeamFortress_GetColor (self.team_no) - SBAR_GRENS);
					st = ftos (fl);
					stuffcmd (self, st);
					stuffcmd (self, "\n");
				}
			}
			self = oldself;
			te = find (te, classname, "player");
		}
		round_active = minrate;
	}
	gren = find (world, classname, "grenade");
	while (gren)
	{
		gren.think = SUB_Remove;
		gren.nextthink = (time + 0.1);
		gren = find (gren, classname, "grenade");
	}
	gren = find (world, classname, "grentimer");
	while (gren)
	{
		gren.think = SUB_Remove;
		gren.nextthink = (time + 0.1);
		gren = find (gren, classname, "grentimer");
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if ((te.weaponmode == SBAR_GRENS))
		{
			TeamFortress_SetSpeed (te.enemy);
			dremove (te.oldenemy);
			dremove (te.observer_list);
		}
		dremove (te.linked_list);
		dremove (te);
		te = find (te, classname, "detpack");
	}
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if ((te.origin != te.oldorigin))
		{
			oldself = spawn ();
			oldself.enemy = te;
			oldself.weapon = AS_MELEE;
			oldself.nextthink = (time + 0.2);
			oldself.think = ReturnItem;
		}
		te = find (te, classname, "item_tfgoal");
	}
	te = find (world, classname, "item_ball");
	while (te)
	{
		if ((te.origin != te.oldorigin))
		{
			te.nextthink = (time + 0.3);
			te.think = ball_reset;
		}
		te = find (te, classname, "item_ball");
	}
	te = find (world, classname, "ammobox");
	while (te)
	{
		te.nextthink = (time + 0.3);
		te.think = TeamFortress_AmmoboxThink;
		te = find (te, classname, "ammobox");
	}
	te = find (world, classname, "round");
	st = infokey (world, "count");
	fl = stof (st);
	if (((fl < AS_MELEE) || (fl > 20)))
	{
		fl = enter;
	}
	te.cnt2 = fl;
	st = infokey (world, "round_time");
	te.cnt = stof (st);
	te.think = RoundInit;
	te.nextthink = (time + SBAR_PRINT);
};

float (float tno) num_team_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		return (num_team_ammoboxes_1);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			return (num_team_ammoboxes_2);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				return (num_team_ammoboxes_3);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					return (num_team_ammoboxes_4);
				}
				else
				{
					return (num_world_ammoboxes);
				}
			}
		}
	}
};

void (float tno) increment_num_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 + SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 + SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 + SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 + SBAR_GRENS);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes + SBAR_GRENS);
				}
			}
		}
	}
};

void (float tno) decrement_num_ammoboxes =
{
	if ((tno == SBAR_GRENS))
	{
		num_team_ammoboxes_1 = (num_team_ammoboxes_1 - SBAR_GRENS);
	}
	else
	{
		if ((tno == SBAR_PRINT))
		{
			num_team_ammoboxes_2 = (num_team_ammoboxes_2 - SBAR_GRENS);
		}
		else
		{
			if ((tno == AS_MELEE))
			{
				num_team_ammoboxes_3 = (num_team_ammoboxes_3 - SBAR_GRENS);
			}
			else
			{
				if ((tno == AS_MISSILE))
				{
					num_team_ammoboxes_4 = (num_team_ammoboxes_4 - SBAR_GRENS);
				}
				else
				{
					num_world_ammoboxes = (num_world_ammoboxes - SBAR_GRENS);
				}
			}
		}
	}
};

void () TeamFortress_AmmoboxThink =
{
	decrement_num_ammoboxes (self.team_no);
	dremove (self);
};

void (float tno) RemoveOldAmmobox =
{
	local entity box;
	local entity eold;
	local float rt;

	rt = (time + 999);
	box = find (world, classname, "ammobox");
	while ((box != world))
	{
		if (((box.nextthink < rt) && ((box.team_no == tno) || (tno == minrate))))
		{
			eold = box;
			rt = box.nextthink;
		}
		box = find (box, classname, "ammobox");
	}
	if ((eold == world))
	{
		return;
	}
	decrement_num_ammoboxes (eold.team_no);
	dremove (eold);
};

void () TeamFortress_AmmoboxTouch =
{
	local float took;
	local string quantity;

	took = SBAR_GRENS;
	if (((other == self.enemy) && (time < (self.health + SBAR_PRINT))))
	{
		return;
	}
	if (((other.tfstate & 65536) || (other.tfstate & 2048)))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= minrate))
	{
		return;
	}
	if ((self.weapon == minrate))
	{
		sprint (other, SBAR_PRINT, "You got ");
		if ((self.ammo_shells > minrate))
		{
			other.ammo_shells = (other.ammo_shells + self.ammo_shells);
			quantity = ftos (self.ammo_shells);
			sprint (other, SBAR_PRINT, quantity, " shells  ");
		}
		if ((self.ammo_nails > minrate))
		{
			other.ammo_nails = (other.ammo_nails + self.ammo_nails);
			quantity = ftos (self.ammo_nails);
			sprint (other, SBAR_PRINT, quantity, " nails  ");
		}
		if ((self.ammo_rockets > minrate))
		{
			other.ammo_rockets = (other.ammo_rockets + self.ammo_rockets);
			quantity = ftos (self.ammo_rockets);
			sprint (other, SBAR_PRINT, quantity, " rockets  ");
		}
		if ((self.ammo_cells > minrate))
		{
			other.ammo_cells = (other.ammo_cells + self.ammo_cells);
			quantity = ftos (self.ammo_cells);
			sprint (other, SBAR_PRINT, quantity, " cells  ");
		}
		sprint (other, SBAR_PRINT, " from ", self.enemy.netname, "'s discarded pack.\n");
	}
	else
	{
		if ((self.weapon == SBAR_GRENS))
		{
			if ((other.ammo_shells >= other.maxammo_shells))
			{
				return;
			}
			other.ammo_shells = (other.ammo_shells + self.ammo_shells);
			if ((other.ammo_shells > other.maxammo_shells))
			{
				self.ammo_shells = (other.ammo_shells - other.maxammo_shells);
				took = minrate;
			}
			self.netname = "shell";
		}
		else
		{
			if ((self.weapon == SBAR_PRINT))
			{
				if ((other.ammo_nails >= other.maxammo_nails))
				{
					return;
				}
				other.ammo_nails = (other.ammo_nails + self.aflag);
				if ((other.ammo_nails > other.maxammo_nails))
				{
					self.ammo_nails = (other.ammo_nails - other.maxammo_nails);
					took = minrate;
				}
				self.netname = "nail";
			}
			else
			{
				if ((self.weapon == AS_MELEE))
				{
					if ((other.ammo_rockets >= other.maxammo_rockets))
					{
						return;
					}
					other.ammo_rockets = (other.ammo_rockets + self.aflag);
					if ((other.ammo_rockets > other.maxammo_rockets))
					{
						self.ammo_rockets = (other.ammo_rockets - other.maxammo_rockets);
						took = minrate;
					}
					self.netname = "rocket";
				}
				else
				{
					if ((self.weapon == AS_MISSILE))
					{
						if ((other.ammo_cells >= other.maxammo_cells))
						{
							return;
						}
						other.ammo_cells = (other.ammo_cells + self.ammo_cells);
						if ((other.ammo_cells > other.maxammo_cells))
						{
							self.ammo_cells = (other.ammo_cells - other.maxammo_cells);
							took = minrate;
						}
						self.netname = "cell";
					}
					else
					{
						if ((self.weapon == 5))
						{
							if (((other.no_grenades_1 >= AS_MISSILE) || (other.tp_grenades_1 != self.tp_grenades_1)))
							{
								return;
							}
							other.no_grenades_1 = (other.no_grenades_1 + self.no_grenades_1);
							self.netname = Status_GrenTypeToString (self.tp_grenades_1);
						}
						else
						{
							if ((self.weapon == 6))
							{
								if ((((other.no_grenades_2 >= AS_MISSILE) || ((other.no_grenades_2 >= SBAR_PRINT) && (other.tp_grenades_2 == AS_MELEE))) || (other.tp_grenades_2 != self.tp_grenades_2)))
								{
									return;
								}
								other.no_grenades_2 = (other.no_grenades_2 + self.no_grenades_2);
								self.netname = Status_GrenTypeToString (self.tp_grenades_2);
							}
							else
							{
								if ((self.weapon == enter))
								{
									if (!(other.items_allowed & 131072))
									{
										return;
									}
									if ((other.ammo_detpack >= other.maxammo_detpack))
									{
										return;
									}
									other.ammo_detpack = (other.ammo_detpack + self.ammo_detpack);
									if ((other.ammo_detpack > other.maxammo_detpack))
									{
										self.ammo_detpack = (other.ammo_detpack - other.maxammo_detpack);
										took = minrate;
									}
									if (tfstrike)
									{
										self.netname = "Bomb";
										bprint2 (SBAR_PRINT, other.netname, " picked up the bomb.\n");
										stuffcmd (other, "topcolor 0\n");
										if ((other.playerclass == 8))
										{
											other.is_unabletospy = SBAR_GRENS;
										}
									}
									else
									{
										self.netname = "detpack";
									}
								}
							}
						}
					}
				}
			}
		}
	}
	bound_other_ammo (other);
	if ((self.weapon > minrate))
	{
		quantity = ftos (self.aflag);
		sprint (other, minrate, "You picked up ", quantity, " ", self.netname);
		if ((self.aflag != SBAR_GRENS))
		{
			sprint (other, minrate, "s");
		}
		sprint (other, minrate, "\n");
	}
	sound (other, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	stuffcmd (other, "bf\n");
	if (took)
	{
		decrement_num_ammoboxes (self.team_no);
		dremove (self);
	}
	self = other;
	W_SetCurrentAmmo ();
};

void (float type) TeamFortress_DropAmmo =
{
	local float ammo;

	self.impulse = minrate;
	if ((type == SBAR_GRENS))
	{
		ammo = 20;
		if ((self.ammo_shells < ammo))
		{
			if ((self.playerclass == 9))
			{
				if (((self.ammo_cells / AS_MELEE) > (ammo - self.ammo_shells)))
				{
					sprint (self, SBAR_PRINT, "you make some shells.\n");
					self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_shells) * AS_MELEE));
					self.ammo_shells = ammo;
				}
			}
			if ((self.ammo_shells < ammo))
			{
				return;
			}
		}
		self.ammo_shells = (self.ammo_shells - ammo);
	}
	else
	{
		if ((type == SBAR_PRINT))
		{
			ammo = 20;
			if ((self.ammo_nails < ammo))
			{
				if ((self.playerclass == 9))
				{
					if (((self.ammo_cells / SBAR_PRINT) > (ammo - self.ammo_nails)))
					{
						sprint (self, SBAR_PRINT, "you make some nails.\n");
						self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_nails) * SBAR_PRINT));
						self.ammo_nails = ammo;
					}
				}
				if ((self.ammo_nails < ammo))
				{
					return;
				}
			}
			self.ammo_nails = (self.ammo_nails - ammo);
		}
		else
		{
			if ((type == AS_MELEE))
			{
				ammo = enter;
				if ((self.ammo_rockets < ammo))
				{
					if ((self.playerclass == 9))
					{
						if (((self.ammo_cells / 5) > (ammo - self.ammo_rockets)))
						{
							sprint (self, SBAR_PRINT, "you make some rockets.\n");
							self.ammo_cells = (self.ammo_cells - ((ammo - self.ammo_rockets) * 5));
							self.ammo_rockets = ammo;
						}
					}
					if ((self.ammo_rockets < ammo))
					{
						return;
					}
				}
				self.ammo_rockets = (self.ammo_rockets - ammo);
			}
			else
			{
				if ((type == AS_MISSILE))
				{
					ammo = enter;
					if ((self.ammo_cells < ammo))
					{
						return;
					}
					self.ammo_cells = (self.ammo_cells - ammo);
				}
				else
				{
					if ((type == 5))
					{
						ammo = SBAR_GRENS;
						if ((self.no_grenades_1 < SBAR_GRENS))
						{
							return;
						}
						self.no_grenades_1 = (self.no_grenades_1 - SBAR_GRENS);
					}
					else
					{
						if ((type == 6))
						{
							ammo = SBAR_GRENS;
							if ((self.no_grenades_2 < SBAR_GRENS))
							{
								return;
							}
							self.no_grenades_2 = (self.no_grenades_2 - SBAR_GRENS);
						}
					}
				}
			}
		}
	}
	W_SetCurrentAmmo ();
	increment_num_ammoboxes (self.team_no);
	if ((num_team_ammoboxes (self.team_no) > (num_max_ammoboxes / number_of_teams)))
	{
		RemoveOldAmmobox (self.team_no);
	}
	newmis = spawn ();
	newmis.aflag = ammo;
	newmis.weapon = type;
	if ((newmis.weapon == SBAR_GRENS))
	{
		newmis.ammo_shells = ammo;
	}
	else
	{
		if ((newmis.weapon == SBAR_PRINT))
		{
			newmis.ammo_nails = ammo;
		}
		else
		{
			if ((newmis.weapon == AS_MELEE))
			{
				newmis.ammo_rockets = ammo;
			}
			else
			{
				if ((newmis.weapon == AS_MISSILE))
				{
					newmis.ammo_cells = ammo;
				}
				else
				{
					if ((newmis.weapon == 5))
					{
						newmis.no_grenades_1 = ammo;
						newmis.tp_grenades_1 = self.tp_grenades_1;
					}
					else
					{
						if ((newmis.weapon == 6))
						{
							newmis.no_grenades_2 = ammo;
							newmis.tp_grenades_2 = self.tp_grenades_2;
						}
					}
				}
			}
		}
	}
	newmis.enemy = self;
	newmis.health = time;
	newmis.movetype = 6;
	newmis.solid = SBAR_GRENS;
	newmis.classname = "ammobox";
	newmis.team_no = self.team_no;
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '0 300 0';
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 20);
	newmis.think = TeamFortress_AmmoboxThink;
	newmis.touch = TeamFortress_AmmoboxTouch;
	newmis.skin = (type - SBAR_GRENS);
	if ((newmis.skin > AS_MELEE))
	{
		newmis.skin = SBAR_PRINT;
	}
	setmodel (newmis, "progs/ammobox.mdl");
};

void () Drop_detpack =
{
	local entity te;
	local string st;
	local float tc;

	if (!self.ammo_detpack)
	{
		return;
	}
	if (!self.playerclass)
	{
		return;
	}
	self.ammo_detpack = (self.ammo_detpack - SBAR_GRENS);
	if (tfstrike)
	{
		if ((self.team_no == SBAR_PRINT))
		{
			stuffcmd (self, "topcolor ");
			tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
			st = ftos (tc);
			stuffcmd (self, st);
			stuffcmd (self, "\n");
		}
		self.is_unabletospy = minrate;
	}
	newmis = spawn ();
	newmis.health = time;
	newmis.ammo_detpack = SBAR_GRENS;
	newmis.weapon = enter;
	newmis.team_no = self.team_no;
	newmis.angles = '90 0 0';
	newmis.solid = SBAR_GRENS;
	newmis.movetype = 6;
	newmis.enemy = self;
	newmis.classname = "ammobox";
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '0 300 0';
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	if (!tfstrike)
	{
		newmis.think = TeamFortress_AmmoboxThink;
		newmis.nextthink = (time + 30);
	}
	else
	{
		if (round_active)
		{
			bprint2 (SBAR_PRINT, self.netname, " dropped the bomb!\n");
		}
	}
	newmis.touch = TeamFortress_AmmoboxTouch;
	setmodel (newmis, "progs/detpack.mdl");
	setsize (newmis, '-16 -16 0', '16 16 8');
};

void () TeamFortress_Discard =
{
	local float i;
	local string st;

	newmis = spawn ();
	if ((self.playerclass == SBAR_GRENS))
	{
		newmis.ammo_rockets = self.ammo_rockets;
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			newmis.ammo_rockets = self.ammo_rockets;
			newmis.ammo_cells = self.ammo_cells;
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				newmis.ammo_cells = self.ammo_cells;
				newmis.ammo_nails = self.ammo_nails;
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					newmis.ammo_cells = self.ammo_cells;
					newmis.ammo_nails = self.ammo_nails;
				}
				else
				{
					if ((self.playerclass == 5))
					{
						newmis.ammo_rockets = self.ammo_rockets;
						newmis.ammo_cells = self.ammo_cells;
					}
					else
					{
						if ((self.playerclass == 6))
						{
							newmis.ammo_rockets = self.ammo_rockets;
							newmis.ammo_nails = self.ammo_nails;
						}
						else
						{
							if ((self.playerclass == 7))
							{
								newmis.ammo_nails = self.ammo_nails;
							}
							else
							{
								if ((self.playerclass == 8))
								{
									newmis.ammo_rockets = self.ammo_rockets;
									newmis.ammo_cells = self.ammo_cells;
								}
								else
								{
									if ((self.playerclass == 9))
									{
										newmis.ammo_rockets = self.ammo_rockets;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if (!(((newmis.ammo_shells + newmis.ammo_nails) + (newmis.ammo_rockets * SBAR_PRINT)) + (newmis.ammo_cells * SBAR_PRINT)))
	{
		dremove (newmis);
		return;
	}
	self.ammo_shells = (self.ammo_shells - newmis.ammo_shells);
	self.ammo_nails = (self.ammo_nails - newmis.ammo_nails);
	self.ammo_rockets = (self.ammo_rockets - newmis.ammo_rockets);
	self.ammo_cells = (self.ammo_cells - newmis.ammo_cells);
	W_SetCurrentAmmo ();
	sound (self, AS_MELEE, "weapons/lock4.wav", SBAR_GRENS, SBAR_GRENS);
	increment_num_ammoboxes (self.team_no);
	if ((num_team_ammoboxes (self.team_no) > (num_max_ammoboxes / number_of_teams)))
	{
		RemoveOldAmmobox (self.team_no);
	}
	newmis.enemy = self;
	newmis.health = time;
	newmis.weapon = minrate;
	newmis.movetype = 6;
	newmis.solid = SBAR_GRENS;
	newmis.classname = "ammobox";
	newmis.team_no = self.team_no;
	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((v_forward * 400) + (v_up * 200));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 400);
		newmis.velocity_z = 200;
	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
	newmis.nextthink = (time + 30);
	newmis.think = TeamFortress_AmmoboxThink;
	newmis.touch = TeamFortress_AmmoboxTouch;
	setmodel (newmis, "progs/backpack.mdl");
};

void () Ammobox_Explode =
{
	local float expsize;

	expsize = (((self.ammo_shells * 0.75) + (self.ammo_rockets * 1.5)) + (self.ammo_cells * 1.5));
	if ((expsize > minrate))
	{
		self.solid = minrate;
		deathmsg = 30;
		T_RadiusDamage (self.enemy, self.enemy.owner, expsize, self);
		WriteByte (AS_MISSILE, 23);
		WriteByte (AS_MISSILE, AS_MELEE);
		WriteCoord (AS_MISSILE, self.origin_x);
		WriteCoord (AS_MISSILE, self.origin_y);
		WriteCoord (AS_MISSILE, self.origin_z);
		multicast (self.origin, SBAR_GRENS);
	}
	TeamFortress_AmmoboxThink ();
};
void (entity Goal, entity Player, entity Item) DisplayItemStatus;
void () TeamFortress_CheckClassStats;
void (entity Player, float Armorclass) TeamFortress_DescribeArmor;
void () TeamFortress_Regenerate;

void () UseSpecialSkill =
{
	local vector src;

	self.impulse = minrate;
	if ((self.playerclass == SBAR_GRENS))
	{
		self.impulse = 159;
		return;
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			self.impulse = 174;
			return;
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				self.impulse = 173;
				return;
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					self.impulse = 170;
					return;
				}
				else
				{
					if ((self.playerclass == 5))
					{
						if ((self.current_weapon == 1024))
						{
							self.impulse = COLOR_RED;
							return;
						}
						else
						{
							self.impulse = 5;
							return;
						}
					}
					else
					{
						if ((self.playerclass == 6))
						{
							if ((self.current_weapon == 32768))
							{
								if ((self.tfstate & 2048))
								{
									sprint (self, SBAR_GRENS, "Cannot switch weapons while firing.\n");
									return;
								}
								else
								{
									self.impulse = AS_MELEE;
									return;
								}
							}
							else
							{
								self.impulse = 7;
								return;
							}
						}
						else
						{
							if ((self.playerclass == 7))
							{
								if ((self.current_weapon == 4096))
								{
									self.impulse = 6;
									return;
								}
								else
								{
									self.impulse = 5;
									return;
								}
							}
							else
							{
								if ((self.playerclass == 8))
								{
									self.impulse = 177;
									return;
								}
								else
								{
									if ((self.playerclass == 9))
									{
										self.impulse = 179;
										return;
									}
									else
									{
										if (!self.playerclass)
										{
											if (clanbattle)
											{
												sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
												self.impulse = minrate;
												return;
											}
											src = (self.origin + (v_forward * enter));
											src_z = (self.absmin_z + (self.size_z * 0.7));
											traceline (src, (src + (v_forward * 2048)), minrate, self);
											if ((trace_ent != world))
											{
												if ((trace_ent.netname != string_null))
												{
													sprint3 (self, SBAR_PRINT, "Locked onto ", trace_ent.netname, "\n");
												}
												else
												{
													sprint3 (self, SBAR_PRINT, "Locked onto ", trace_ent.classname, "\n");
												}
												self.goalentity = trace_ent;
												if (!self.tracking)
												{
													Toggle_Tracking ();
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (float inp) TeamFortress_ChangeClass =
{
	local entity spot;
	local entity te;
	local string st;
	local float tc;
	local float oldclass;

	if (!self.playerclass)
	{
		if (round_active)
		{
			if (!IsLegalClass (inp))
			{
				sprint (self, SBAR_PRINT, "Your team cannot play that class.\n");
				TeamFortress_DisplayLegalClasses ();
				return;
			}
			if (ClassIsRestricted (self.team_no, inp))
			{
				sprint (self, SBAR_PRINT, "Your team already has enough of that class.\n");
				return;
			}
			if (TeamFortress_TeamIsCivilian (self.team_no))
			{
				sprint (self, SBAR_PRINT, "You cannot change class.\n");
				self.nextpc = SBAR_200;
				return;
			}
			self.nextpc = inp;
			sprint (self, SBAR_PRINT, "Next Round, you will return as a ");
			TeamFortress_PrintClassName (self, self.nextpc, (self.tfstate & 8));
			return;
		}
	}
	else
	{
		if (!IsLegalClass (inp))
		{
			sprint (self, SBAR_PRINT, "Your team cannot play that class.\n");
			TeamFortress_DisplayLegalClasses ();
			return;
		}
		if (ClassIsRestricted (self.team_no, inp))
		{
			sprint (self, SBAR_PRINT, "Your team already has enough of that class.\n");
			return;
		}
		if (TeamFortress_TeamIsCivilian (self.team_no))
		{
			inp = SBAR_200;
		}
		self.nextpc = inp;
		if (rounds)
		{
			sprint (self, SBAR_PRINT, "Next Round, you will return as a ");
		}
		else
		{
			sprint (self, SBAR_PRINT, "After dying, you will return as a ");
		}
		TeamFortress_PrintClassName (self, self.nextpc, (self.tfstate & 8));
		return;
	}
	if ((teamplay && (self.team_no == minrate)))
	{
		if ((toggleflags & 64))
		{
			if ((TeamFortress_TeamPutPlayerInTeam () == minrate))
			{
				return;
			}
		}
		else
		{
			sprint (self, SBAR_PRINT, "You must join a team first. \n");
			return;
		}
	}
	if ((self.respawn_time > time))
	{
		return;
	}
	if ((round_over == SBAR_PRINT))
	{
		return;
	}
	if ((!IsLegalClass (inp) && (inp != SBAR_200)))
	{
		sprint (self, SBAR_PRINT, "You cannot play that playerclass on this map. \n");
		TeamFortress_DisplayLegalClasses ();
		return;
	}
	if (ClassIsRestricted (self.team_no, inp))
	{
		sprint (self, SBAR_PRINT, "Your team has enough of that class.\n");
		return;
	}
	TeamFortress_ExecClassScript (self);
	if (((inp > minrate) && (inp < 12)))
	{
		self.playerclass = inp;
	}
	else
	{
		self.playerclass = minrate;
	}
	self.nextpc = minrate;
	self.takedamage = SBAR_PRINT;
	self.movetype = AS_MELEE;
	self.flags = (8 | 512);
	self.waterlevel = minrate;
	self.air_finished = (time + 12);
	self.solid = AS_MELEE;
	self.pausetime = minrate;
	self.gravity = SBAR_GRENS;
	spot = SelectSpawnPoint ();
	self.origin = (spot.origin + '0 0 1');
	self.velocity = '0 0 0';
	self.angles = spot.angles;
	self.fixangle = SBAR_GRENS;
	setmodel (self, string_null);
	modelindex_null = self.modelindex;
	setmodel (self, "progs/eyes.mdl");
	modelindex_eyes = self.modelindex;
	setmodel (self, "progs/player.mdl");
	modelindex_player = self.modelindex;
	setsize (self, '-16 -16 -24', '16 16 32');
	self.view_ofs = '0 0 22';
	player_stand1 ();
	if ((deathmatch || coop))
	{
		makevectors (self.angles);
		spawn_tfog ((self.origin + (v_forward * 20)));
	}
	if ((self.playerclass == enter))
	{
		sprint (self, SBAR_PRINT, "Random Playerclass.\n");
		self.tfstate = (self.tfstate | 8);
		self.playerclass = (SBAR_GRENS + floor ((random () * (enter - SBAR_GRENS))));
		if (CheckClassAvailable (self.team_no))
		{
			oldclass = self.playerclass;
			self.playerclass = (SBAR_GRENS + floor ((random () * (enter - SBAR_GRENS))));
			while (((self.playerclass == oldclass) || ClassIsRestricted (self.team_no, self.playerclass)))
			{
				self.playerclass = (SBAR_GRENS + floor ((random () * (enter - SBAR_GRENS))));
			}
		}
		else
		{
			sprint (self, SBAR_PRINT, "All classes disabled, returning to Observer mode.\n");
			self.playerclass = minrate;
		}
	}
	if (((spot.classname == "info_player_teamspawn") && !cb_prematch))
	{
		if ((spot.items != minrate))
		{
			te = Finditem (spot.items);
			if (te)
			{
				tfgoalitem_GiveToPlayer (te, self, self);
			}
			if (!(spot.goal_activation & SBAR_GRENS))
			{
				spot.items = minrate;
			}
		}
		if (spot.message)
		{
			CenterPrint (self, spot.message);
			if (!(spot.goal_activation & SBAR_PRINT))
			{
				spot.message = string_null;
			}
		}
		if ((spot.activate_goal_no != minrate))
		{
			te = Findgoal (spot.activate_goal_no);
			if (te)
			{
				AttemptToActivate (te, self, spot);
			}
		}
		if ((spot.goal_effects == SBAR_GRENS))
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + SBAR_GRENS);
			spot.think = SUB_Remove;
		}
	}
	spot = find (world, classname, "player");
	while (spot)
	{
		if (((spot.team_no == self.team_no) && (spot != self)))
		{
			sprint (spot, SBAR_PRINT, self.netname);
			sprint (spot, SBAR_PRINT, " is playing as a ");
			TeamFortress_PrintClassName (spot, self.playerclass, (self.tfstate & 8));
		}
		spot = find (spot, classname, "player");
	}
	TeamFortress_PrintClassName (self, self.playerclass, (self.tfstate & 8));
	TeamFortress_SetEquipment ();
	TeamFortress_SetHealth ();
	TeamFortress_SetSpeed (self);
	TeamFortress_SetSkin (self);
	TeamFortress_ExecClassScript (self);
	stuffcmd (self, "color ");
	tc = (TeamFortress_TeamGetColor (self.team_no) - SBAR_GRENS);
	st = ftos (tc);
	stuffcmd (self, st);
	stuffcmd (self, "\n");
	SetTeamName (self);
	if (cease_fire)
	{
		sprint (self, SBAR_PRINT, "\n\nCEASE FIRE MODE\n");
		self.immune_to_check = (time + 5);
		self.tfstate = (self.tfstate | 65536);
		TeamFortress_SetSpeed (self);
	}
};

void () TeamFortress_DisplayLegalClasses =
{
	local float gotone;
	local float ill;

	sprint (self, SBAR_PRINT, "Legal Classes for your team are:\n");
	gotone = minrate;
	ill = TeamFortress_TeamGetIllegalClasses (self.team_no);
	if ((!(illegalclasses & SBAR_GRENS) && !(ill & SBAR_GRENS)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Scout");
	}
	if ((!(illegalclasses & SBAR_PRINT) && !(ill & SBAR_PRINT)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Sniper");
	}
	if ((!(illegalclasses & AS_MISSILE) && !(ill & AS_MISSILE)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Soldier");
	}
	if ((!(illegalclasses & 8) && !(ill & 8)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Demolitions Man");
	}
	if ((!(illegalclasses & SBAR_240) && !(ill & SBAR_240)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Combat Medic");
	}
	if ((!(illegalclasses & space) && !(ill & space)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Heavy Weapons Guy");
	}
	if ((!(illegalclasses & 64) && !(ill & 64)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Pyro");
	}
	if ((!(illegalclasses & 256) && !(ill & 256)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Spy");
	}
	if ((!(illegalclasses & 512) && !(ill & 512)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "Engineer");
	}
	if ((!(illegalclasses & 128) && !(ill & 128)))
	{
		if (gotone)
		{
			sprint (self, SBAR_PRINT, ", ");
		}
		gotone = SBAR_GRENS;
		sprint (self, SBAR_PRINT, "RandomPC");
	}
	sprint (self, SBAR_PRINT, "\n");
};

void () TeamFortress_Inventory =
{
	local entity tg;
	local string ac;
	local float col;

	col = (TeamFortress_GetColor (self.team_no) - SBAR_GRENS);
	sprint (self, SBAR_PRINT, "You're in team ");
	ac = ftos (self.team_no);
	sprint (self, SBAR_PRINT, ac);
	sprint (self, SBAR_PRINT, ", color ");
	ac = ftos (col);
	sprint (self, SBAR_PRINT, ac);
	sprint (self, SBAR_PRINT, ".\n");
	if ((self.no_grenades_1 > minrate))
	{
		sprint (self, SBAR_PRINT, "Gren.Type 1 : ");
		if ((self.tp_grenades_1 == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, " Normal(");
		}
		else
		{
			if ((self.tp_grenades_1 == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, " Concussion(");
			}
			else
			{
				if ((self.tp_grenades_1 == AS_MELEE))
				{
					sprint (self, SBAR_PRINT, " Nail(");
				}
				else
				{
					if ((self.tp_grenades_1 == AS_MISSILE))
					{
						sprint (self, SBAR_PRINT, " Mirv(");
					}
					else
					{
						if ((self.tp_grenades_1 == 5))
						{
							sprint (self, SBAR_PRINT, " Napalm(");
						}
						else
						{
							if ((self.tp_grenades_1 == 6))
							{
								sprint (self, SBAR_PRINT, " Flare(");
							}
							else
							{
								if ((self.tp_grenades_1 == 7))
								{
									sprint (self, SBAR_PRINT, " Hallucinogenic(");
								}
								else
								{
									if ((self.tp_grenades_1 == 8))
									{
										sprint (self, SBAR_PRINT, " EMP(");
									}
									else
									{
										if ((self.tp_grenades_1 == enter))
										{
											sprint (self, SBAR_PRINT, " Caltrop(");
										}
										else
										{
											sprint (self, SBAR_PRINT, "N/A(");
										}
									}
								}
							}
						}
					}
				}
			}
		}
		ac = ftos (self.no_grenades_1);
		sprint (self, SBAR_PRINT, ac);
		sprint (self, SBAR_PRINT, ")\n");
	}
	if ((self.no_grenades_2 > minrate))
	{
		sprint (self, SBAR_PRINT, "Gren.Type 2 : ");
		if ((self.tp_grenades_2 == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, " Normal(");
		}
		else
		{
			if ((self.tp_grenades_2 == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, " Concussion(");
			}
			else
			{
				if ((self.tp_grenades_2 == AS_MELEE))
				{
					sprint (self, SBAR_PRINT, " Nail(");
				}
				else
				{
					if ((self.tp_grenades_2 == AS_MISSILE))
					{
						sprint (self, SBAR_PRINT, " Mirv(");
					}
					else
					{
						if ((self.tp_grenades_2 == 5))
						{
							sprint (self, SBAR_PRINT, " Napalm(");
						}
						else
						{
							if ((self.tp_grenades_2 == 6))
							{
								sprint (self, SBAR_PRINT, " Flare(");
							}
							else
							{
								if ((self.tp_grenades_2 == 7))
								{
									sprint (self, SBAR_PRINT, " Hallucinogenic(");
								}
								else
								{
									if ((self.tp_grenades_2 == 8))
									{
										sprint (self, SBAR_PRINT, " EMP(");
									}
									else
									{
										sprint (self, SBAR_PRINT, "N/A(");
									}
								}
							}
						}
					}
				}
			}
		}
		ac = ftos (self.no_grenades_2);
		sprint (self, SBAR_PRINT, ac);
		sprint (self, SBAR_PRINT, ")\n");
	}
	if ((self.tf_items & SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "Scanner. ");
	}
	if ((self.weapons_carried & AS_MISSILE))
	{
		sprint (self, SBAR_PRINT, "Medikit (");
		ac = ftos (self.ammo_medikit);
		sprint (self, SBAR_PRINT, ac);
		sprint (self, SBAR_PRINT, ") ");
	}
	if ((self.weapons_carried & 131072))
	{
		if ((self.ammo_detpack > minrate))
		{
			ac = ftos (self.ammo_detpack);
			sprint (self, SBAR_PRINT, ac);
			if (tfstrike)
			{
				sprint (self, SBAR_PRINT, " Bomb");
			}
			else
			{
				sprint (self, SBAR_PRINT, " Detpack");
			}
			if ((self.ammo_detpack > SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "s");
			}
			sprint (self, SBAR_PRINT, ". ");
		}
	}
	tg = find (world, classname, "item_tfgoal");
	while (tg)
	{
		if ((tg.owner == self))
		{
			sprint (self, SBAR_PRINT, tg.netname);
			sprint (self, SBAR_PRINT, ". ");
		}
		tg = find (tg, classname, "item_tfgoal");
	}
	if ((self.armorvalue > minrate))
	{
		TeamFortress_DescribeArmor (self, self.armorclass);
	}
	if ((self.playerclass == 8))
	{
		sprint (self, SBAR_PRINT, "Skin : ");
		if ((self.undercover_skin != minrate))
		{
			TeamFortress_PrintClassName (self, self.undercover_skin, minrate);
		}
		else
		{
			sprint (self, SBAR_PRINT, "Spy\n");
		}
		sprint (self, SBAR_PRINT, "Colors : Team ");
		if ((self.undercover_team != minrate))
		{
			ac = ftos (self.undercover_team);
		}
		else
		{
			ac = ftos (self.team_no);
		}
		sprint (self, SBAR_PRINT, ac);
	}
	sprint (self, SBAR_PRINT, "\n");
};

void () TeamFortress_ShowTF =
{
	local string st;

	if ((toggleflags & SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "Class Persistence On.\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Class Persistence Off.\n");
	}
	if ((toggleflags & SBAR_PRINT))
	{
		sprint (self, SBAR_PRINT, "Cheat Checking On.\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Cheat Checking Off.\n");
	}
	if ((toggleflags & 64))
	{
		sprint (self, SBAR_PRINT, "AutoTeam On.\n");
	}
	if ((toggleflags & AS_MISSILE))
	{
		st = ftos (respawn_delay_time);
	}
	else
	{
		st = "No";
	}
	sprint (self, SBAR_PRINT, st);
	if ((st != "No"))
	{
		sprint (self, SBAR_PRINT, " second");
	}
	sprint (self, SBAR_PRINT, " Respawn Delay.\n");
	if ((toggleflags & 128))
	{
		sprint (self, SBAR_PRINT, "TeamFrags On.\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "TeamFrags Off.\n");
	}
	if (allow_hook)
	{
		sprint (self, SBAR_PRINT, "Grapple On.\n");
	}
	if (allow_flash)
	{
		sprint (self, SBAR_PRINT, "Grapple On.\n");
	}
	if ((toggleflags & 2048))
	{
		sprint (self, SBAR_PRINT, "Full TeamScore On.\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Full TeamScore Off.\n");
	}
};
void () TeamFortress_GrenadePrimed;

void () TeamFortress_PrimeGrenade =
{
	local float gtype;
	local string gs;
	local string ptime;
	local entity tGrenade;

	if ((self.playerclass == SBAR_200))
	{
		return;
	}
	if (((self.tfstate & SBAR_GRENS) || (self.tfstate & 1024)))
	{
		return;
	}
	if ((self.impulse == 150))
	{
		gtype = self.tp_grenades_1;
		if ((self.tp_grenades_1 == SBAR_PRINT))
		{
			gs = "Concussion grenade";
		}
		else
		{
			if ((self.tp_grenades_1 == AS_MELEE))
			{
				gs = "Nail grenade";
			}
			else
			{
				if ((self.tp_grenades_1 == AS_MISSILE))
				{
					gs = "Mirv grenade";
				}
				else
				{
					if ((self.tp_grenades_1 == 5))
					{
						gs = "Napalm grenade";
					}
					else
					{
						if ((self.tp_grenades_1 == 6))
						{
							gs = "Flare";
						}
						else
						{
							if ((self.tp_grenades_1 == 7))
							{
								gs = "Gas grenade";
							}
							else
							{
								if ((self.tp_grenades_1 == 8))
								{
									gs = "EMP grenade";
								}
								else
								{
									if ((self.tp_grenades_1 == enter))
									{
										gs = "Caltrop canister";
									}
									else
									{
										gs = "Grenade";
									}
								}
							}
						}
					}
				}
			}
		}
		if ((self.no_grenades_1 > minrate))
		{
			if (!practice)
			{
				self.no_grenades_1 = (self.no_grenades_1 - SBAR_GRENS);
			}
			if ((gtype == 6))
			{
				newmis = spawn ();
				newmis.owner = self;
				newmis.movetype = 6;
				newmis.solid = SBAR_PRINT;
				newmis.classname = "grenade";
				makevectors (self.v_angle);
				newmis.velocity = ((v_forward * 600) + (v_up * 25));
				newmis.velocity = (newmis.velocity * 700);
				newmis.angles = vectoangles (newmis.velocity);
				newmis.weapon = self.team_no;
				newmis.think = FlareGrenadeExplode;
				newmis.nextthink = (time + 0.8);
				newmis.touch = FlareGrenadeTouch;
				newmis.skin = SBAR_GRENS;
				newmis.mdl = "flare";
				setmodel (newmis, "progs/flare.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
				setorigin (newmis, self.origin);
				return;
			}
			if ((gtype == enter))
			{
				ptime = ftos (0.5);
				sprint (self, SBAR_PRINT, "Opening ");
				sprint (self, SBAR_PRINT, gs);
				sprint (self, SBAR_PRINT, "...\n");
			}
			else
			{
				ptime = ftos (AS_MELEE);
				sprint (self, SBAR_PRINT, gs);
				sprint (self, SBAR_PRINT, " primed, ");
				sprint (self, SBAR_PRINT, ptime);
				sprint (self, SBAR_PRINT, " seconds...\n");
			}
		}
		else
		{
			sprint (self, SBAR_PRINT, "No ");
			sprint (self, SBAR_PRINT, gs);
			sprint (self, SBAR_PRINT, "s left.\n");
			return;
		}
	}
	if ((self.impulse == 151))
	{
		gtype = self.tp_grenades_2;
		if ((self.tp_grenades_2 == SBAR_PRINT))
		{
			gs = "Concussion grenade";
		}
		else
		{
			if ((self.tp_grenades_2 == AS_MELEE))
			{
				gs = "Nail grenade";
			}
			else
			{
				if ((self.tp_grenades_2 == AS_MISSILE))
				{
					gs = "Mirv grenade";
				}
				else
				{
					if ((self.tp_grenades_2 == 5))
					{
						gs = "Napalm grenade";
					}
					else
					{
						if ((self.tp_grenades_2 == 6))
						{
							gs = "Flare";
						}
						else
						{
							if ((self.tp_grenades_2 == 7))
							{
								gs = "Gas grenade";
							}
							else
							{
								if ((self.tp_grenades_2 == 8))
								{
									gs = "EMP grenade";
								}
								else
								{
									gs = "Grenade";
								}
							}
						}
					}
				}
			}
		}
		if ((self.no_grenades_2 > minrate))
		{
			if (!practice)
			{
				self.no_grenades_2 = (self.no_grenades_2 - SBAR_GRENS);
			}
			if ((gtype == 6))
			{
				newmis = spawn ();
				newmis.owner = self;
				newmis.movetype = 6;
				newmis.solid = SBAR_PRINT;
				newmis.classname = "grenade";
				makevectors (self.v_angle);
				if (self.v_angle_x)
				{
					newmis.velocity = ((v_forward * 1200) + (v_up * 200));
				}
				else
				{
					newmis.velocity = aim (self, 10000);
					newmis.velocity = (newmis.velocity * 1200);
					newmis.velocity_z = _K;
				}
				newmis.angles = vectoangles (newmis.velocity);
				newmis.weapon = self.team_no;
				newmis.think = FlareGrenadeExplode;
				newmis.nextthink = (time + 0.8);
				newmis.touch = FlareGrenadeTouch;
				newmis.skin = SBAR_GRENS;
				newmis.mdl = "flare";
				setmodel (newmis, "progs/flare.mdl");
				setsize (newmis, '0 0 0', '0 0 0');
				setorigin (newmis, self.origin);
				return;
			}
			if ((gtype == enter))
			{
				ptime = ftos (0.5);
				sprint (self, SBAR_PRINT, "Opening ");
				sprint (self, SBAR_PRINT, gs);
				sprint (self, SBAR_PRINT, "...\n");
			}
			else
			{
				ptime = ftos (AS_MELEE);
				sprint (self, SBAR_PRINT, gs);
				sprint (self, SBAR_PRINT, " primed, ");
				sprint (self, SBAR_PRINT, ptime);
				sprint (self, SBAR_PRINT, " seconds...\n");
			}
		}
		else
		{
			sprint (self, SBAR_PRINT, "No ");
			sprint (self, SBAR_PRINT, gs);
			sprint (self, SBAR_PRINT, "s left.\n");
			return;
		}
	}
	self.tfstate = (self.tfstate | SBAR_GRENS);
	tGrenade = spawn ();
	tGrenade.owner = self;
	tGrenade.weapon = gtype;
	tGrenade.classname = "timer";
	tGrenade.impulse = self.impulse;
	tGrenade.nextthink = (time + 0.8);
	if ((gtype == enter))
	{
		tGrenade.heat = ((time + 0.5) + 0.5);
	}
	else
	{
		tGrenade.heat = ((time + AS_MELEE) + 0.8);
	}
	tGrenade.think = TeamFortress_GrenadePrimed;
};

void () TeamFortress_GrenadePrimed =
{
	local entity user;
	local entity oldself;

	user = self.owner;
	if ((!(user.tfstate & 1024) && !user.deadflag))
	{
		self.nextthink = (time + 0.1);
		if (!self.think)
		{
			dremove (self);
		}
		if ((time > self.heat))
		{
			TeamFortress_ExplodePerson (self);
		}
		return;
	}
	if (!(user.tfstate & SBAR_GRENS))
	{
		dprint ("GrenadePrimed logic error\n");
	}
	user.tfstate = (user.tfstate - (user.tfstate & SBAR_GRENS));
	user.tfstate = (user.tfstate - (user.tfstate & 1024));
	sound (user, SBAR_GRENS, "weapons/ax1.wav", SBAR_GRENS, SBAR_GRENS);
	KickPlayer (-1, user);
	newmis = spawn ();
	newmis.owner = user;
	newmis.movetype = enter;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "grenade";
	makevectors (user.v_angle);
	if (user.deadflag)
	{
		newmis.velocity = '0 0 200';
	}
	else
	{
		if (user.v_angle_x)
		{
			newmis.velocity = ((((v_forward * 600) + (v_up * 200)) + ((crandom () * v_right) * enter)) + ((crandom () * v_up) * enter));
		}
		else
		{
			newmis.velocity = aim (user, 10000);
			newmis.velocity = (newmis.velocity * 600);
			newmis.velocity_z = 200;
		}
	}
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = SUB_Null;
	newmis.nextthink = self.heat;
	if ((self.weapon == SBAR_GRENS))
	{
		newmis.touch = NormalGrenadeTouch;
		newmis.think = NormalGrenadeExplode;
		newmis.skin = minrate;
		newmis.avelocity = '300 300 300';
		setmodel (newmis, "progs/hgren2.mdl");
	}
	else
	{
		if ((self.weapon == SBAR_PRINT))
		{
			newmis.touch = ConcussionGrenadeTouch;
			newmis.think = ConcussionGrenadeExplode;
			newmis.skin = SBAR_GRENS;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
		}
		else
		{
			if ((self.weapon == AS_MELEE))
			{
				newmis.touch = NailGrenadeTouch;
				newmis.think = NailGrenadeExplode;
				newmis.skin = SBAR_GRENS;
				newmis.avelocity = '0 300 0';
				setmodel (newmis, "progs/biggren.mdl");
			}
			else
			{
				if ((self.weapon == AS_MISSILE))
				{
					newmis.touch = MirvGrenadeTouch;
					newmis.think = MirvGrenadeExplode;
					newmis.skin = minrate;
					newmis.avelocity = '0 300 0';
					setmodel (newmis, "progs/biggren.mdl");
				}
				else
				{
					if ((self.weapon == 5))
					{
						newmis.touch = NapalmGrenadeTouch;
						newmis.think = NapalmGrenadeExplode;
						newmis.skin = SBAR_PRINT;
						newmis.avelocity = '0 300 0';
						setmodel (newmis, "progs/biggren.mdl");
					}
					else
					{
						if ((self.weapon == 6))
						{
							newmis.touch = FlareGrenadeTouch;
							newmis.weapon = self.team_no;
							newmis.think = FlareGrenadeExplode;
							newmis.skin = SBAR_GRENS;
							newmis.avelocity = '300 300 300';
							newmis.mdl = "flare";
							setmodel (newmis, "progs/flare.mdl");
						}
						else
						{
							if ((self.weapon == 7))
							{
								newmis.touch = GasGrenadeTouch;
								newmis.think = GasGrenadeExplode;
								newmis.skin = AS_MELEE;
								newmis.avelocity = '300 300 300';
								setmodel (newmis, "progs/grenade2.mdl");
							}
							else
							{
								if ((self.weapon == 8))
								{
									newmis.touch = EMPGrenadeTouch;
									newmis.think = EMPGrenadeExplode;
									newmis.skin = AS_MISSILE;
									newmis.avelocity = '300 300 300';
									setmodel (newmis, "progs/grenade2.mdl");
								}
								else
								{
									if ((self.weapon == enter))
									{
										newmis.touch = CanisterTouch;
										newmis.think = ScatterCaltrops;
										newmis.skin = minrate;
										newmis.avelocity = '0 0 0';
									}
								}
							}
						}
					}
				}
			}
		}
	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, user.origin);
	oldself = self;
	self = self.owner;
	self = oldself;
	dremove (self);
};

void () TeamFortress_ThrowGrenade =
{
	if (!(self.tfstate & SBAR_GRENS))
	{
		return;
	}
	self.tfstate = (self.tfstate | 1024);
};

float (float pc) IsLegalClass =
{
	local float bit;

	if ((pc == SBAR_GRENS))
	{
		bit = SBAR_GRENS;
	}
	else
	{
		if ((pc == SBAR_PRINT))
		{
			bit = SBAR_PRINT;
		}
		else
		{
			if ((pc == AS_MELEE))
			{
				bit = AS_MISSILE;
			}
			else
			{
				if ((pc == AS_MISSILE))
				{
					bit = 8;
				}
				else
				{
					if ((pc == 5))
					{
						bit = SBAR_240;
					}
					else
					{
						if ((pc == 6))
						{
							bit = space;
						}
						else
						{
							if ((pc == 7))
							{
								bit = 64;
							}
							else
							{
								if ((pc == 8))
								{
									bit = 256;
								}
								else
								{
									if ((pc == 9))
									{
										bit = 512;
									}
									else
									{
										if ((pc == enter))
										{
											bit = 128;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if (((illegalclasses & bit) || (TeamFortress_TeamGetIllegalClasses (self.team_no) & bit)))
	{
		return (minrate);
	}
	return (SBAR_GRENS);
};

void (entity p) TeamFortress_SetSpeed =
{
	local string sp;
	local float tf;
	local entity te;
	local string st;

	stuffcmd (p, "cl_movespeedkey 1\n");
	if ((p.tfstate & 65536))
	{
		if ((minrate == SBAR_GRENS))
		{
			stuffcmd (p, "m_forward 0\n");
			stuffcmd (p, "m_side 0\n");
		}
		p.velocity = '0 0 0';
		stuffcmd (p, "cl_backspeed 0\n");
		stuffcmd (p, "cl_forwardspeed 0\n");
		stuffcmd (p, "cl_sidespeed 0\n");
		p.maxspeed = minrate;
		return;
	}
	else
	{
		if ((minrate == SBAR_GRENS))
		{
			stuffcmd (p, "m_forward 1\n");
			stuffcmd (p, "m_side 0.8\n");
		}
	}
	if ((p.playerclass == SBAR_GRENS))
	{
		p.maxspeed = 450;
	}
	else
	{
		if ((p.playerclass == SBAR_PRINT))
		{
			p.maxspeed = 300;
		}
		else
		{
			if ((p.playerclass == AS_MELEE))
			{
				p.maxspeed = 240;
			}
			else
			{
				if ((p.playerclass == AS_MISSILE))
				{
					p.maxspeed = 280;
				}
				else
				{
					if ((p.playerclass == 5))
					{
						p.maxspeed = 320;
					}
					else
					{
						if ((p.playerclass == 6))
						{
							p.maxspeed = 230;
						}
						else
						{
							if ((p.playerclass == 7))
							{
								p.maxspeed = 300;
							}
							else
							{
								if ((p.playerclass == SBAR_200))
								{
									if ((tfvsdm == SBAR_GRENS))
									{
										p.maxspeed = 320;
									}
									else
									{
										p.maxspeed = 240;
									}
								}
								else
								{
									if ((p.playerclass == 8))
									{
										p.maxspeed = 300;
									}
									else
									{
										if ((p.playerclass == 9))
										{
											p.maxspeed = 300;
										}
										else
										{
											if (!p.playerclass)
											{
												st = infokey (world, "clan");
												if ((st == "on"))
												{
													p.maxspeed = minrate;
													return;
												}
												else
												{
													p.maxspeed = 400;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	tf = minrate;
	te = find (world, classname, "item_tfgoal");
	while (((te != world) && (tf == minrate)))
	{
		if ((te.owner == p))
		{
			if ((te.goal_activation & SBAR_PRINT))
			{
				tf = SBAR_GRENS;
				p.maxspeed = (p.maxspeed / SBAR_PRINT);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if ((p.tfstate & 32768))
	{
		p.maxspeed = (p.maxspeed / SBAR_PRINT);
	}
	if (p.leg_damage)
	{
		if ((p.leg_damage > 6))
		{
			p.leg_damage = 6;
		}
		p.maxspeed = (p.maxspeed * ((enter - p.leg_damage) / enter));
	}
	if ((p.tfstate & 2048))
	{
		if ((p.current_weapon == 32768))
		{
			if ((p.maxspeed > (p.maxspeed / SBAR_PRINT)))
			{
				p.maxspeed = (p.maxspeed / SBAR_PRINT);
			}
		}
		else
		{
			if ((p.maxspeed > _P))
			{
				p.maxspeed = _P;
			}
		}
	}
	sp = ftos (p.maxspeed);
	stuffcmd (p, "cl_backspeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
	stuffcmd (p, "cl_forwardspeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
	stuffcmd (p, "cl_sidespeed ");
	stuffcmd (p, sp);
	stuffcmd (p, "\n");
};

void () TeamFortress_SetHealth =
{
	if ((self.playerclass == SBAR_GRENS))
	{
		self.max_health = _K;
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			self.max_health = _Z;
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				self.max_health = _d;
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					self.max_health = _Z;
				}
				else
				{
					if ((self.playerclass == 5))
					{
						self.max_health = _Z;
					}
					else
					{
						if ((self.playerclass == 6))
						{
							self.max_health = _d;
						}
						else
						{
							if ((self.playerclass == 7))
							{
								self.max_health = _d;
							}
							else
							{
								if ((self.playerclass == SBAR_200))
								{
									self.max_health = _d;
								}
								else
								{
									if ((self.playerclass == 8))
									{
										self.max_health = _Z;
									}
									else
									{
										if ((self.playerclass == 9))
										{
											self.max_health = _P;
										}
										else
										{
											if (!self.playerclass)
											{
												self.max_health = SBAR_GRENS;
												self.takedamage = minrate;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	self.health = self.max_health;
};

string (entity p) TeamFortress_GetSkin =
{
	local float tn;
	local float pc;
	local string st;

	if (((p.playerclass == SBAR_200) || (p.team_no == minrate)))
	{
		return ("base");
	}
	tn = p.team_no;
	pc = p.playerclass;
	if ((p.playerclass == 8))
	{
		if ((p.undercover_team != minrate))
		{
			tn = p.undercover_team;
		}
		if ((p.undercover_skin != minrate))
		{
			pc = p.undercover_skin;
		}
	}
	if ((tn == AS_MISSILE))
	{
		if ((tfvsdm == SBAR_GRENS))
		{
			if ((pc == SBAR_GRENS))
			{
				st = infokey (world, "sk_t4_civilian");
				if ((st != string_null))
				{
					return (st);
				}
				return ("base");
			}
		}
		else
		{
			if ((pc == SBAR_GRENS))
			{
				st = infokey (world, "sk_t4_scout");
				if ((st != string_null))
				{
					return (st);
				}
				return ("tf_scout");
			}
			else
			{
				if ((pc == SBAR_PRINT))
				{
					st = infokey (world, "sk_t4_sniper");
					if ((st != string_null))
					{
						return (st);
					}
					return ("tf_snipe");
				}
				else
				{
					if ((pc == AS_MELEE))
					{
						st = infokey (world, "sk_t4_soldier");
						if ((st != string_null))
						{
							return (st);
						}
						return ("tf_sold");
					}
					else
					{
						if ((pc == AS_MISSILE))
						{
							st = infokey (world, "sk_t4_demoman");
							if ((st != string_null))
							{
								return (st);
							}
							return ("tf_demo");
						}
						else
						{
							if ((pc == 5))
							{
								st = infokey (world, "sk_t4_medic");
								if ((st != string_null))
								{
									return (st);
								}
								return ("tf_medic");
							}
							else
							{
								if ((pc == 6))
								{
									st = infokey (world, "sk_t4_hwguy");
									if ((st != string_null))
									{
										return (st);
									}
									return ("tf_hwguy");
								}
								else
								{
									if ((pc == 7))
									{
										st = infokey (world, "sk_t4_pyro");
										if ((st != string_null))
										{
											return (st);
										}
										return ("tf_pyro");
									}
									else
									{
										if ((pc == 8))
										{
											st = infokey (world, "sk_t4_spy");
											if ((st != string_null))
											{
												return (st);
											}
											return ("tf_spy");
										}
										else
										{
											if ((pc == 9))
											{
												st = infokey (world, "sk_t4_engineer");
												if ((st != string_null))
												{
													return (st);
												}
												return ("tf_eng");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	else
	{
		if ((tn == AS_MELEE))
		{
			if ((pc == SBAR_GRENS))
			{
				st = infokey (world, "sk_t3_scout");
				if ((st != string_null))
				{
					return (st);
				}
				return ("tf_scout");
			}
			else
			{
				if ((pc == SBAR_PRINT))
				{
					st = infokey (world, "sk_t3_sniper");
					if ((st != string_null))
					{
						return (st);
					}
					return ("tf_snipe");
				}
				else
				{
					if ((pc == AS_MELEE))
					{
						st = infokey (world, "sk_t3_soldier");
						if ((st != string_null))
						{
							return (st);
						}
						return ("tf_sold");
					}
					else
					{
						if ((pc == AS_MISSILE))
						{
							st = infokey (world, "sk_t3_demoman");
							if ((st != string_null))
							{
								return (st);
							}
							return ("tf_demo");
						}
						else
						{
							if ((pc == 5))
							{
								st = infokey (world, "sk_t3_medic");
								if ((st != string_null))
								{
									return (st);
								}
								return ("tf_medic");
							}
							else
							{
								if ((pc == 6))
								{
									st = infokey (world, "sk_t3_hwguy");
									if ((st != string_null))
									{
										return (st);
									}
									return ("tf_hwguy");
								}
								else
								{
									if ((pc == 7))
									{
										st = infokey (world, "sk_t3_pyro");
										if ((st != string_null))
										{
											return (st);
										}
										return ("tf_pyro");
									}
									else
									{
										if ((pc == 8))
										{
											st = infokey (world, "sk_t3_spy");
											if ((st != string_null))
											{
												return (st);
											}
											return ("tf_spy");
										}
										else
										{
											if ((pc == 9))
											{
												st = infokey (world, "sk_t3_engineer");
												if ((st != string_null))
												{
													return (st);
												}
												return ("tf_eng");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			if ((tn == SBAR_PRINT))
			{
				if ((tfvsdm == SBAR_GRENS))
				{
					if ((pc == SBAR_GRENS))
					{
						st = infokey (world, "sk_t2_base");
						if ((st != string_null))
						{
							return (st);
						}
						return ("base");
					}
				}
				else
				{
					if ((pc == SBAR_GRENS))
					{
						st = infokey (world, "sk_t2_scout");
						if ((st != string_null))
						{
							return (st);
						}
						return ("tf_scout");
					}
					else
					{
						if ((pc == SBAR_PRINT))
						{
							st = infokey (world, "sk_t2_sniper");
							if ((st != string_null))
							{
								return (st);
							}
							return ("tf_snipe");
						}
						else
						{
							if ((pc == AS_MELEE))
							{
								st = infokey (world, "sk_t2_soldier");
								if ((st != string_null))
								{
									return (st);
								}
								return ("tf_sold");
							}
							else
							{
								if ((pc == AS_MISSILE))
								{
									st = infokey (world, "sk_t2_demoman");
									if ((st != string_null))
									{
										return (st);
									}
									return ("tf_demo");
								}
								else
								{
									if ((pc == 5))
									{
										st = infokey (world, "sk_t2_medic");
										if ((st != string_null))
										{
											return (st);
										}
										return ("tf_medic");
									}
									else
									{
										if ((pc == 6))
										{
											st = infokey (world, "sk_t2_hwguy");
											if ((st != string_null))
											{
												return (st);
											}
											return ("tf_hwguy");
										}
										else
										{
											if ((pc == 7))
											{
												st = infokey (world, "sk_t2_pyro");
												if ((st != string_null))
												{
													return (st);
												}
												return ("tf_pyro");
											}
											else
											{
												if ((pc == 8))
												{
													st = infokey (world, "sk_t2_spy");
													if ((st != string_null))
													{
														return (st);
													}
													return ("tf_spy");
												}
												else
												{
													if ((pc == 9))
													{
														st = infokey (world, "sk_t2_engineer");
														if ((st != string_null))
														{
															return (st);
														}
														return ("tf_eng");
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			else
			{
				if ((pc == SBAR_GRENS))
				{
					st = infokey (world, "sk_t1_scout");
					if ((st != string_null))
					{
						return (st);
					}
					return ("tf_scout");
				}
				else
				{
					if ((pc == SBAR_PRINT))
					{
						st = infokey (world, "sk_t1_sniper");
						if ((st != string_null))
						{
							return (st);
						}
						return ("tf_snipe");
					}
					else
					{
						if ((pc == AS_MELEE))
						{
							st = infokey (world, "sk_t1_soldier");
							if ((st != string_null))
							{
								return (st);
							}
							return ("tf_sold");
						}
						else
						{
							if ((pc == AS_MISSILE))
							{
								st = infokey (world, "sk_t1_demoman");
								if ((st != string_null))
								{
									return (st);
								}
								return ("tf_demo");
							}
							else
							{
								if ((pc == 5))
								{
									st = infokey (world, "sk_t1_medic");
									if ((st != string_null))
									{
										return (st);
									}
									return ("tf_medic");
								}
								else
								{
									if ((pc == 6))
									{
										st = infokey (world, "sk_t1_hwguy");
										if ((st != string_null))
										{
											return (st);
										}
										return ("tf_hwguy");
									}
									else
									{
										if ((pc == 7))
										{
											st = infokey (world, "sk_t1_pyro");
											if ((st != string_null))
											{
												return (st);
											}
											return ("tf_pyro");
										}
										else
										{
											if ((pc == 8))
											{
												st = infokey (world, "sk_t1_spy");
												if ((st != string_null))
												{
													return (st);
												}
												return ("tf_spy");
											}
											else
											{
												if ((pc == 9))
												{
													st = infokey (world, "sk_t1_engineer");
													if ((st != string_null))
													{
														return (st);
													}
													return ("tf_eng");
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (entity p) TeamFortress_SetSkin =
{
	local string st;
	local float tn;

	if (((p.playerclass == 8) && (p.undercover_skin != minrate)))
	{
		p.skin = p.undercover_skin;
	}
	else
	{
		p.skin = p.playerclass;
	}
	if ((p.skin != minrate))
	{
		stuffcmd (p, "skin ");
		st = TeamFortress_GetSkin (p);
		stuffcmd (p, st);
		stuffcmd (p, "\n");
	}
	else
	{
		stuffcmd (p, "skin base\n");
	}
};

void () TeamFortress_SetEquipment =
{
	local entity te;
	local string st;
	local float kept_items;
	local float noitems;

	if ((self.classname != "player"))
	{
		return;
	}
	kept_items = (self.tf_items & (131072 | 262144));
	self.items = minrate;
	self.last_weaponmode = minrate;
	self.last_weapon = minrate;
	self.current_weapon = minrate;
	self.weapons_carried = minrate;
	self.tf_items = minrate;
	if ((self.playerclass != SBAR_GRENS))
	{
		self.tf_items_flags = minrate;
	}
	self.armorclass = minrate;
	self.impulse = minrate;
	self.undercover_skin = minrate;
	if ((self.undercover_team != minrate))
	{
		self.immune_to_check = (time + 5);
		self.undercover_team = minrate;
		stuffcmd (self, "color ");
		st = ftos ((TeamFortress_GetColor (self.team_no) - SBAR_GRENS));
		stuffcmd (self, st);
		stuffcmd (self, "\n");
	}
	self.is_building = minrate;
	self.is_detpacking = minrate;
	self.is_undercover = minrate;
	self.is_feigning = minrate;
	self.is_unabletospy = minrate;
	self.ammo_medikit = minrate;
	self.maxammo_medikit = minrate;
	self.ammo_detpack = minrate;
	self.maxammo_detpack = minrate;
	self.items_allowed = minrate;
	self.armor_allowed = minrate;
	self.maxarmor = minrate;
	self.weaponmode = minrate;
	self.respawn_time = minrate;
	self.heat = minrate;
	self.tfstate = (self.tfstate - (self.tfstate & SBAR_PRINT));
	self.items = (self.items | kept_items);
	if ((self.playerclass == SBAR_GRENS))
	{
		self.weapons_carried = (((self.weapons_carried | SBAR_240) | 128) | 512);
		self.ammo_rockets = minrate;
		self.ammo_nails = _d;
		self.ammo_shells = 25;
		self.ammo_cells = _2;
		self.maxammo_rockets = 25;
		self.maxammo_nails = 200;
		self.maxammo_shells = _2;
		self.maxammo_cells = _d;
		self.no_grenades_1 = SBAR_PRINT;
		self.no_grenades_2 = AS_MELEE;
		self.tp_grenades_1 = enter;
		self.tp_grenades_2 = SBAR_PRINT;
		self.tf_items = SBAR_GRENS;
		self.ScannerOn = minrate;
		if ((self.tf_items_flags <= minrate))
		{
			self.tf_items_flags = (self.tf_items_flags | SBAR_GRENS);
		}
		self.armorclass = (self.armorclass | minrate);
		self.armortype = 0.3;
		self.armorvalue = 25;
		self.armor_allowed = 0.3;
		self.maxarmor = _2;
		self.current_weapon = 512;
		self.items_allowed = ((SBAR_240 | 128) | 512);
		self.items = ((self.items | SBAR_GRENS) | AS_MISSILE);
	}
	else
	{
		if ((self.playerclass == SBAR_PRINT))
		{
			self.weapons_carried = ((((self.weapons_carried | space) | 64) | SBAR_240) | 512);
			self.ammo_rockets = minrate;
			self.ammo_nails = _2;
			self.ammo_shells = SBAR_600;
			self.ammo_cells = minrate;
			self.maxammo_rockets = 25;
			self.maxammo_nails = _d;
			self.maxammo_shells = _K;
			self.maxammo_cells = _2;
			self.no_grenades_1 = SBAR_PRINT;
			self.no_grenades_2 = SBAR_PRINT;
			self.tp_grenades_1 = SBAR_GRENS;
			self.tp_grenades_2 = 6;
			self.tf_items = minrate;
			self.armorclass = (self.armorclass | minrate);
			self.armortype = 0.3;
			self.armorvalue = minrate;
			self.armor_allowed = 0.3;
			self.maxarmor = _2;
			self.current_weapon = space;
			self.items_allowed = (((space | 64) | SBAR_240) | 512);
			self.items = (((self.items | SBAR_GRENS) | SBAR_PRINT) | AS_MISSILE);
		}
		else
		{
			if ((self.playerclass == AS_MELEE))
			{
				self.weapons_carried = ((((self.weapons_carried | SBAR_240) | 128) | 256) | 8192);
				self.ammo_rockets = enter;
				self.ammo_nails = minrate;
				self.ammo_shells = _2;
				self.ammo_cells = minrate;
				self.maxammo_rockets = _2;
				self.maxammo_nails = _2;
				self.maxammo_shells = _d;
				self.maxammo_cells = _2;
				self.no_grenades_1 = AS_MISSILE;
				self.no_grenades_2 = SBAR_GRENS;
				self.tp_grenades_1 = SBAR_GRENS;
				self.tp_grenades_2 = AS_MELEE;
				self.tf_items = minrate;
				self.armorclass = (self.armorclass | minrate);
				self.armortype = 0.8;
				self.armorvalue = _d;
				self.armor_allowed = 0.8;
				self.maxarmor = 200;
				self.current_weapon = 8192;
				self.items_allowed = (((SBAR_240 | 128) | 256) | 8192);
				self.items = (((self.items | SBAR_GRENS) | SBAR_PRINT) | space);
			}
			else
			{
				if ((self.playerclass == AS_MISSILE))
				{
					self.weapons_carried = ((((self.weapons_carried | SBAR_240) | 128) | 2048) | 131072);
					self.ammo_rockets = 20;
					self.ammo_nails = minrate;
					self.ammo_shells = 30;
					self.ammo_cells = minrate;
					self.maxammo_rockets = _2;
					self.maxammo_nails = _2;
					self.maxammo_shells = _F;
					self.maxammo_cells = _2;
					self.no_grenades_1 = AS_MISSILE;
					self.no_grenades_2 = AS_MISSILE;
					self.tp_grenades_1 = SBAR_GRENS;
					self.tp_grenades_2 = AS_MISSILE;
					self.tf_items = minrate;
					self.ammo_detpack = SBAR_GRENS;
					self.maxammo_detpack = SBAR_GRENS;
					self.armorclass = (self.armorclass | SBAR_PRINT);
					self.armortype = 0.6;
					self.armorvalue = _2;
					self.armor_allowed = 0.6;
					self.maxarmor = _x;
					self.current_weapon = 2048;
					self.items_allowed = (((SBAR_240 | 128) | 2048) | 131072);
					self.items = ((self.items | SBAR_GRENS) | SBAR_240);
				}
				else
				{
					if ((self.playerclass == 5))
					{
						self.weapons_carried = (((((self.weapons_carried | SBAR_PRINT) | AS_MISSILE) | 128) | 256) | 1024);
						self.ammo_rockets = minrate;
						self.ammo_nails = _2;
						self.ammo_shells = _2;
						self.ammo_cells = minrate;
						self.maxammo_rockets = 25;
						self.maxammo_nails = 150;
						self.maxammo_shells = _P;
						self.maxammo_cells = _2;
						self.no_grenades_1 = AS_MELEE;
						self.no_grenades_2 = AS_MELEE;
						self.tp_grenades_1 = SBAR_GRENS;
						self.tp_grenades_2 = SBAR_PRINT;
						self.tf_items = minrate;
						self.armorclass = (self.armorclass | minrate);
						self.armortype = 0.3;
						self.armorvalue = _2;
						self.armor_allowed = 0.6;
						self.maxarmor = _d;
						self.current_weapon = 1024;
						self.ammo_medikit = _2;
						self.maxammo_medikit = _d;
						te = spawn ();
						te.nextthink = (time + AS_MELEE);
						te.think = TeamFortress_Regenerate;
						te.owner = self;
						te.classname = "timer";
						self.items_allowed = ((((SBAR_PRINT | AS_MISSILE) | 128) | 256) | 1024);
						self.items = (((self.items | SBAR_GRENS) | SBAR_PRINT) | 8);
					}
					else
					{
						if ((self.playerclass == 6))
						{
							self.weapons_carried = ((((self.weapons_carried | 32768) | SBAR_240) | 128) | 256);
							self.ammo_rockets = minrate;
							self.ammo_nails = minrate;
							self.ammo_shells = 200;
							self.ammo_cells = 30;
							self.maxammo_rockets = 25;
							self.maxammo_nails = 200;
							self.maxammo_shells = 200;
							self.maxammo_cells = _8;
							self.no_grenades_1 = AS_MISSILE;
							self.no_grenades_2 = SBAR_GRENS;
							self.tp_grenades_1 = SBAR_GRENS;
							self.tp_grenades_2 = AS_MISSILE;
							self.tf_items = minrate;
							self.armorclass = (self.armorclass | minrate);
							self.armortype = 0.8;
							self.armorvalue = 150;
							self.armor_allowed = 0.8;
							self.maxarmor = 300;
							self.current_weapon = 32768;
							self.items_allowed = (((32768 | SBAR_240) | 128) | 256);
							self.items = (((self.items | SBAR_GRENS) | SBAR_PRINT) | space);
						}
						else
						{
							if ((self.playerclass == 7))
							{
								self.weapons_carried = ((((self.weapons_carried | 16384) | 4096) | SBAR_240) | 128);
								self.ammo_rockets = 20;
								self.ammo_nails = minrate;
								self.ammo_shells = 20;
								self.ammo_cells = _x;
								self.maxammo_rockets = SBAR_600;
								self.maxammo_nails = _2;
								self.maxammo_shells = 40;
								self.maxammo_cells = 200;
								self.no_grenades_1 = SBAR_PRINT;
								self.no_grenades_2 = AS_MELEE;
								self.tp_grenades_1 = SBAR_GRENS;
								self.tp_grenades_2 = 5;
								self.tf_items = minrate;
								self.armorclass = (self.armorclass | SBAR_240);
								self.armortype = 0.6;
								self.armorvalue = _2;
								self.armor_allowed = 0.6;
								self.maxarmor = 150;
								self.current_weapon = 4096;
								self.items_allowed = (((16384 | 4096) | SBAR_240) | 128);
								self.items = (((self.items | SBAR_GRENS) | 8) | SBAR_240);
							}
							else
							{
								if ((self.playerclass == SBAR_200))
								{
									if ((tfvsdm == SBAR_GRENS))
									{
										self.weapons_carried = ((((((((self.weapons_carried | SBAR_240) | 128) | 256) | 512) | 1024) | 2048) | 65536) | 8192);
										self.ammo_rockets = enter;
										self.ammo_nails = SBAR_600;
										self.ammo_shells = 40;
										self.ammo_cells = 8;
										self.maxammo_rockets = 25;
										self.maxammo_nails = 200;
										self.maxammo_shells = _d;
										self.maxammo_cells = 20;
										self.armortype = 0.6;
										self.armor_allowed = 0.6;
										self.maxarmor = 140;
										self.current_weapon = 8192;
										self.items_allowed = ((((((((self.weapons_carried | SBAR_240) | 128) | 256) | 512) | 1024) | 2048) | 65536) | 8192);
										self.items = (((((((self.items | SBAR_GRENS) | SBAR_PRINT) | AS_MISSILE) | 8) | SBAR_240) | space) | 64);
									}
									else
									{
										self.weapons_carried = (self.weapons_carried | SBAR_240);
										self.ammo_rockets = minrate;
										self.ammo_nails = minrate;
										self.ammo_shells = minrate;
										self.ammo_cells = minrate;
										self.maxammo_rockets = minrate;
										self.maxammo_nails = minrate;
										self.maxammo_shells = minrate;
										self.maxammo_cells = minrate;
										self.armortype = minrate;
										self.armor_allowed = minrate;
										self.maxarmor = minrate;
										self.current_weapon = SBAR_240;
										self.items_allowed = SBAR_240;
										self.items = minrate;
									}
									self.no_grenades_1 = minrate;
									self.no_grenades_2 = minrate;
									self.tp_grenades_1 = minrate;
									self.tp_grenades_2 = minrate;
									self.tf_items = minrate;
									self.armorvalue = minrate;
									self.armorclass = (self.armorclass | minrate);
								}
								else
								{
									if ((self.playerclass == 8))
									{
										self.weapons_carried = ((((self.weapons_carried | SBAR_240) | 262144) | 256) | 512);
										self.ammo_rockets = minrate;
										self.ammo_nails = _2;
										self.ammo_shells = 40;
										self.ammo_cells = enter;
										self.maxammo_rockets = 15;
										self.maxammo_nails = _d;
										self.maxammo_shells = 40;
										self.maxammo_cells = 30;
										self.no_grenades_1 = AS_MELEE;
										self.no_grenades_2 = AS_MELEE;
										self.tp_grenades_1 = SBAR_GRENS;
										self.tp_grenades_2 = 7;
										self.tf_items = minrate;
										self.armorclass = (self.armorclass | minrate);
										self.armortype = 0.6;
										self.armorvalue = 25;
										self.armor_allowed = 0.6;
										self.maxarmor = _d;
										self.current_weapon = 262144;
										self.items_allowed = (((SBAR_240 | 262144) | 256) | 512);
										self.items = (((self.items | SBAR_GRENS) | SBAR_PRINT) | AS_MISSILE);
									}
									else
									{
										if ((self.playerclass == 9))
										{
											self.weapons_carried = (((self.weapons_carried | 8) | 524288) | 256);
											self.ammo_rockets = minrate;
											self.ammo_nails = 25;
											self.ammo_shells = 20;
											self.ammo_cells = _d;
											self.maxammo_rockets = 30;
											self.maxammo_nails = _2;
											self.maxammo_shells = _2;
											self.maxammo_cells = 200;
											self.no_grenades_1 = SBAR_PRINT;
											self.no_grenades_2 = SBAR_PRINT;
											self.tp_grenades_1 = SBAR_GRENS;
											self.tp_grenades_2 = 8;
											self.tf_items = minrate;
											self.armorclass = (self.armorclass | minrate);
											self.armortype = 0.3;
											self.armorvalue = 25;
											self.armor_allowed = 0.6;
											self.maxarmor = _2;
											self.current_weapon = 524288;
											self.items_allowed = ((8 | 524288) | 256);
											self.items = ((self.items | SBAR_GRENS) | SBAR_PRINT);
										}
										else
										{
											if (!self.playerclass)
											{
												self.items = minrate;
												self.ammo_rockets = minrate;
												self.ammo_nails = minrate;
												self.ammo_shells = minrate;
												self.ammo_cells = minrate;
												self.no_grenades_1 = minrate;
												self.no_grenades_2 = minrate;
												self.tp_grenades_1 = minrate;
												self.tp_grenades_2 = minrate;
												self.armorclass = minrate;
												self.armortype = minrate;
												self.armorvalue = minrate;
												self.weapon = minrate;
												self.current_weapon = minrate;
												self.weapons_carried = minrate;
												self.flags = 8;
												self.gravity = SBAR_GRENS;
												self.waterlevel = -1;
												self.takedamage = minrate;
												self.solid = minrate;
												self.model = string_null;
												self.mdl = string_null;
												self.modelindex = minrate;
												self.weaponmodel = string_null;
												modelindex_player = minrate;
												self.tfstate = (self.tfstate | SBAR_PRINT);
												setmodel (self, string_null);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if (self.playerclass)
	{
		if (rounds)
		{
			self.armorvalue = self.maxarmor;
			self.ammo_detpack = self.maxammo_detpack;
			self.no_grenades_1 = AS_MISSILE;
			self.ammo_rockets = ceil ((self.maxammo_rockets / SBAR_PRINT));
			if ((self.playerclass == 5))
			{
				self.ammo_nails = _d;
			}
			else
			{
				self.ammo_nails = ceil ((self.maxammo_nails / SBAR_PRINT));
			}
			if (((self.playerclass != 6) && (self.playerclass != 8)))
			{
				self.ammo_shells = ceil ((self.maxammo_shells / SBAR_PRINT));
			}
			self.ammo_cells = ceil ((self.maxammo_cells / SBAR_PRINT));
		}
		if (tfstrike)
		{
			self.ammo_detpack = minrate;
			if ((self.team_no == SBAR_PRINT))
			{
				self.maxammo_detpack = SBAR_GRENS;
				self.weapons_carried = (self.weapons_carried | 131072);
				self.items_allowed = (self.items_allowed | 131072);
			}
			else
			{
				self.maxammo_detpack = minrate;
				self.weapons_carried = (self.weapons_carried - (self.weapons_carried & 131072));
				self.items_allowed = (self.items_allowed - (self.items_allowed & 131072));
			}
		}
		if (allow_hook)
		{
			self.weapons_carried = (self.weapons_carried | SBAR_GRENS);
		}
	}
	if ((self.armortype >= 0.8))
	{
		self.items = (self.items | 32768);
	}
	else
	{
		if ((self.armortype >= 0.6))
		{
			self.items = (self.items | 16384);
		}
		else
		{
			if ((self.armortype >= 0.3))
			{
				self.items = (self.items | 8192);
			}
		}
	}
	noitems = stof (infokey (world, "noitems"));
	if ((noitems & SBAR_GRENS))
	{
		self.no_grenades_1 = minrate;
		self.tp_grenades_1 = minrate;
	}
	if ((noitems & SBAR_PRINT))
	{
		self.no_grenades_2 = minrate;
		self.tp_grenades_2 = minrate;
	}
	if ((noitems & AS_MISSILE))
	{
		self.ammo_detpack = minrate;
		self.maxammo_detpack = minrate;
	}
	if (practice)
	{
		self.armorvalue = minrate;
		self.health = 1000;
		self.ammo_rockets = self.maxammo_rockets;
		self.ammo_nails = self.maxammo_nails;
		self.ammo_shells = self.maxammo_shells;
		self.ammo_cells = self.maxammo_cells;
	}
	W_SetCurrentAmmo ();
};

float (entity Retriever, float AmmoType) TeamFortress_GetMaxAmmo =
{
	if ((AmmoType == 256))
	{
		return (Retriever.maxammo_shells);
	}
	else
	{
		if ((AmmoType == 512))
		{
			return (Retriever.maxammo_nails);
		}
		else
		{
			if ((AmmoType == 2048))
			{
				return (Retriever.maxammo_cells);
			}
			else
			{
				if ((AmmoType == 1024))
				{
					return (Retriever.maxammo_rockets);
				}
				else
				{
					if ((AmmoType == AS_MISSILE))
					{
						return (Retriever.maxammo_medikit);
					}
					else
					{
						if ((AmmoType == 131072))
						{
							return (Retriever.maxammo_detpack);
						}
					}
				}
			}
		}
	}
	dprint ("Error in TeamFortress_GetMaxAmmo()\n");
	dprint ("Invalid ammo type passed.\n");
	return (minrate);
};

float (entity Retriever, float WeaponType) TeamFortress_CanGetWeapon =
{
	if ((Retriever.items_allowed & WeaponType))
	{
		return (SBAR_GRENS);
	}
	return (minrate);
};

void (entity Player, float Armorclass) TeamFortress_DescribeArmor =
{
	local string st;

	if ((Armorclass == minrate))
	{
		return;
	}
	if ((Armorclass & SBAR_240))
	{
		sprint (Player, SBAR_PRINT, "Asbestos ");
	}
	if ((Armorclass & SBAR_PRINT))
	{
		sprint (Player, SBAR_PRINT, "Wooden ");
	}
	if ((Armorclass & AS_MISSILE))
	{
		sprint (Player, SBAR_PRINT, "Blast ");
	}
	if ((Armorclass & 8))
	{
		sprint (Player, SBAR_PRINT, "Shockproof ");
	}
	if ((Armorclass & SBAR_GRENS))
	{
		sprint (Player, SBAR_PRINT, "Kevlar ");
	}
	sprint (Player, SBAR_PRINT, "armor\n");
};

void (entity Retriever, entity Items) TeamFortress_AddBackpackItems =
{
	return;
};

string (float pc) TeamFortress_GetClassName =
{
	if ((pc == SBAR_GRENS))
	{
		return ("Scout");
	}
	else
	{
		if ((pc == SBAR_PRINT))
		{
			return ("Sniper");
		}
		else
		{
			if ((pc == AS_MELEE))
			{
				return ("Soldier");
			}
			else
			{
				if ((pc == AS_MISSILE))
				{
					return ("Demolitions Man");
				}
				else
				{
					if ((pc == 5))
					{
						return ("Combat Medic");
					}
					else
					{
						if ((pc == 6))
						{
							return ("Heavy Weapons Guy");
						}
						else
						{
							if ((pc == 7))
							{
								return ("Pyro");
							}
							else
							{
								if ((pc == 8))
								{
									return ("Spy");
								}
								else
								{
									if ((pc == 9))
									{
										return ("Engineer");
									}
									else
									{
										if ((pc == SBAR_200))
										{
											if ((tfvsdm == SBAR_GRENS))
											{
												return ("Quake Soldier");
											}
											else
											{
												return ("Civilian");
											}
										}
										else
										{
											if ((pc == minrate))
											{
												return ("Observer");
											}
											else
											{
												if ((pc == enter))
												{
													return ("Random Playerclass");
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (entity Viewer, float pc, float rpc) TeamFortress_PrintClassName =
{
	local string st;

	st = TeamFortress_GetClassName (pc);
	sprint (Viewer, SBAR_PRINT, st);
	if ((rpc != minrate))
	{
		sprint (Viewer, SBAR_PRINT, " (Random)");
	}
	sprint (Viewer, SBAR_PRINT, "\n");
};

void () TeamFortress_RemoveTimers =
{
	local entity te;

	self.leg_damage = minrate;
	self.is_undercover = minrate;
	self.is_building = minrate;
	self.building = world;
	if ((self.tfstate & 2048))
	{
		self.tfstate = (self.tfstate - 2048);
		TeamFortress_SetSpeed (self);
		self.heat = minrate;
	}
	if ((self.tfstate & SBAR_240))
	{
		self.tfstate = (self.tfstate - (self.tfstate & SBAR_240));
	}
	if ((self.tfstate & 16384))
	{
		self.tfstate = (self.tfstate - (self.tfstate & 16384));
	}
	te = find (world, classname, "timer");
	while ((te != world))
	{
		if (((te.owner == self) && (te.no_active_gas_grens <= minrate)))
		{
			dremove (te);
			te = find (world, classname, "timer");
		}
		else
		{
			te = find (te, classname, "timer");
		}
	}
	te = find (world, classname, "grentimer");
	while ((te != world))
	{
		if (((te.owner == self) && (te.no_active_napalm_grens <= minrate)))
		{
			dremove (te);
			te = find (world, classname, "grentimer");
		}
		else
		{
			te = find (te, classname, "grentimer");
		}
	}
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if ((te.owner == self))
		{
			if ((!(te.goal_activation & 256) || (self.has_disconnected == SBAR_GRENS)))
			{
				tfgoalitem_RemoveFromPlayer (te, self, minrate);
			}
			if (((CTF_Map == SBAR_GRENS) && (te.goal_no == SBAR_GRENS)))
			{
				bprint (SBAR_PRINT, self.netname);
				bprint (SBAR_PRINT, " Ãœ”‘ the ¬Ã’≈ flag!\n");
			}
			else
			{
				if (((CTF_Map == SBAR_GRENS) && (te.goal_no == SBAR_PRINT)))
				{
					bprint (SBAR_PRINT, self.netname);
					bprint (SBAR_PRINT, " Ãœ”‘ the “≈ƒ flag!\n");
				}
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	te = find (world, classname, "detpack");
	while (te)
	{
		if (((te.weaponmode == SBAR_GRENS) && (te.enemy == self)))
		{
			te.weaponmode = minrate;
		}
		te = find (te, classname, "detpack");
	}
	TeamFortress_DetonatePipebombs ();
	if ((self.has_disconnected == SBAR_GRENS))
	{
		te = find (world, classname, "grenade");
		while (te)
		{
			if (((te.owner == self) && (te.model == "progs/caltrop.mdl")))
			{
				dremove (te);
				te = find (world, classname, "grenade");
			}
			else
			{
				te = find (te, classname, "grenade");
			}
		}
	}
	self.item_list = minrate;
	CenterPrint (self, "\n");
	if (!round_active)
	{
		self.menu_count = 25;
		self.current_menu = SBAR_GRENS;
	}
	self.impulse = minrate;
};

void () TeamFortress_SetupRespawn =
{
	local float restime;
	local string db;

	if ((self.respawn_time > time))
	{
		return;
	}
	if ((toggleflags & AS_MISSILE))
	{
		restime = respawn_delay_time;
	}
	else
	{
		restime = minrate;
	}
	if (!restime)
	{
		self.respawn_time = minrate;
	}
	else
	{
		self.respawn_time = (time + restime);
		if ((restime > AS_MELEE))
		{
			db = ftos (restime);
			sprint (self, SBAR_PRINT, db);
			sprint (self, SBAR_PRINT, " seconds till respawn.\n");
		}
	}
};

void () TeamFortress_CheckClassStats =
{
	if ((self.armortype > self.armor_allowed))
	{
		self.armortype = self.armor_allowed;
	}
	if ((self.armorvalue > self.maxarmor))
	{
		self.armorvalue = self.maxarmor;
	}
	if ((self.armortype < minrate))
	{
		self.armortype = minrate;
	}
	if ((self.armorvalue < minrate))
	{
		self.armorvalue = minrate;
	}
	if ((self.ammo_shells > TeamFortress_GetMaxAmmo (self, 256)))
	{
		self.ammo_shells = TeamFortress_GetMaxAmmo (self, 256);
	}
	if ((self.ammo_shells < minrate))
	{
		self.ammo_shells = minrate;
	}
	if ((self.ammo_nails > TeamFortress_GetMaxAmmo (self, 512)))
	{
		self.ammo_nails = TeamFortress_GetMaxAmmo (self, 512);
	}
	if ((self.ammo_nails < minrate))
	{
		self.ammo_nails = minrate;
	}
	if ((self.ammo_rockets > TeamFortress_GetMaxAmmo (self, 1024)))
	{
		self.ammo_rockets = TeamFortress_GetMaxAmmo (self, 1024);
	}
	if ((self.ammo_rockets < minrate))
	{
		self.ammo_rockets = minrate;
	}
	if ((self.ammo_cells > TeamFortress_GetMaxAmmo (self, 2048)))
	{
		self.ammo_cells = TeamFortress_GetMaxAmmo (self, 2048);
	}
	if ((self.ammo_cells < minrate))
	{
		self.ammo_cells = minrate;
	}
	if ((self.ammo_medikit > TeamFortress_GetMaxAmmo (self, AS_MISSILE)))
	{
		self.ammo_medikit = TeamFortress_GetMaxAmmo (self, AS_MISSILE);
	}
	if ((self.ammo_medikit < minrate))
	{
		self.ammo_medikit = minrate;
	}
	if ((self.ammo_detpack > TeamFortress_GetMaxAmmo (self, 131072)))
	{
		self.ammo_detpack = TeamFortress_GetMaxAmmo (self, 131072);
	}
	if ((self.ammo_detpack < minrate))
	{
		self.ammo_detpack = minrate;
	}
	if ((self.no_grenades_1 < minrate))
	{
		self.no_grenades_1 = minrate;
	}
	if ((self.no_grenades_2 < minrate))
	{
		self.no_grenades_2 = minrate;
	}
	if (((self.health > self.max_health) && !(self.items & 65536)))
	{
		TF_T_Damage (self, world, world, (self.max_health - self.health), minrate, 256);
	}
	if ((self.health < minrate))
	{
		T_Heal (self, (self.health - self.health), minrate);
	}
	self.items = (self.items - (self.items & ((8192 | 16384) | 32768)));
	if ((self.armortype >= 0.8))
	{
		self.items = (self.items | 32768);
	}
	else
	{
		if ((self.armortype >= 0.6))
		{
			self.items = (self.items | 16384);
		}
		else
		{
			if ((self.armortype >= 0.3))
			{
				self.items = (self.items | 8192);
			}
		}
	}
};

void () TeamFortress_AssaultWeapon =
{
	local float it;

	self.impulse = minrate;
	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	if (!(self.weapons_carried & 32768))
	{
		return;
	}
	if ((self.heat > minrate))
	{
		sprint (self, SBAR_PRINT, "the assault cannon is still overheated.\n");
		return;
	}
	if ((self.ammo_shells < SBAR_GRENS))
	{
		sprint (self, SBAR_PRINT, "not enough ammo.\n");
		return;
	}
	if ((self.ammo_cells < 6))
	{
		sprint (self, SBAR_PRINT, "not enough cells to power the assault cannon.\n");
		return;
	}
	self.current_weapon = 32768;
	W_SetCurrentAmmo ();
};

void (entity Gren) TeamFortress_ExplodePerson =
{
	local entity te;

	Gren.owner.tfstate = (Gren.owner.tfstate - (Gren.owner.tfstate & SBAR_GRENS));
	KickPlayer (-2, Gren.owner);
	newmis = spawn ();
	newmis.movetype = enter;
	newmis.solid = SBAR_PRINT;
	newmis.classname = "grenade";
	newmis.team_no = Gren.owner.team_no;
	newmis.owner = Gren.owner;
	newmis.velocity = '0 0 0';
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = SUB_Null;
	newmis.nextthink = (time + 0.1);
	if ((Gren.weapon == SBAR_GRENS))
	{
		newmis.touch = NormalGrenadeTouch;
		newmis.think = NormalGrenadeExplode;
		newmis.skin = minrate;
		newmis.avelocity = '300 300 300';
		setmodel (newmis, "progs/hgren2.mdl");
	}
	else
	{
		if ((Gren.weapon == SBAR_PRINT))
		{
			newmis.touch = ConcussionGrenadeTouch;
			newmis.think = ConcussionGrenadeExplode;
			newmis.skin = SBAR_GRENS;
			newmis.avelocity = '300 300 300';
			setmodel (newmis, "progs/hgren2.mdl");
		}
		else
		{
			if ((Gren.weapon == AS_MELEE))
			{
				newmis.touch = NailGrenadeTouch;
				newmis.think = NailGrenadeExplode;
				newmis.skin = SBAR_GRENS;
				newmis.avelocity = '0 300 0';
				setmodel (newmis, "progs/biggren.mdl");
			}
			else
			{
				if ((Gren.weapon == AS_MISSILE))
				{
					newmis.touch = MirvGrenadeTouch;
					newmis.think = MirvGrenadeExplode;
					newmis.skin = minrate;
					newmis.avelocity = '0 300 0';
					setmodel (newmis, "progs/biggren.mdl");
				}
				else
				{
					if ((Gren.weapon == 5))
					{
						newmis.touch = NapalmGrenadeTouch;
						newmis.think = NapalmGrenadeExplode;
						newmis.skin = SBAR_PRINT;
						newmis.avelocity = '0 300 0';
						setmodel (newmis, "progs/biggren.mdl");
					}
					else
					{
						if ((Gren.weapon == 6))
						{
							sprint (Gren.owner, SBAR_PRINT, "Flare lit.\n");
							te = spawn ();
							te.touch = SUB_Null;
							te.think = RemoveFlare;
							te.nextthink = (time + 25);
							te.owner = Gren.owner;
							te.solid = minrate;
							Gren.owner.effects = (Gren.owner.effects | AS_MISSILE);
							dremove (Gren);
							dremove (newmis);
							return;
						}
						else
						{
							if ((Gren.weapon == 7))
							{
								newmis.touch = GasGrenadeTouch;
								newmis.think = GasGrenadeExplode;
								newmis.skin = SBAR_PRINT;
								newmis.avelocity = '300 300 300';
								setmodel (newmis, "progs/grenade2.mdl");
							}
							else
							{
								if ((Gren.weapon == 8))
								{
									newmis.touch = EMPGrenadeTouch;
									newmis.think = EMPGrenadeExplode;
									newmis.skin = AS_MISSILE;
									newmis.avelocity = '300 300 300';
									setmodel (newmis, "progs/grenade2.mdl");
								}
								else
								{
									if ((Gren.weapon == enter))
									{
										newmis.touch = CaltropTouch;
										newmis.think = ScatterCaltrops;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, Gren.owner.origin);
	if (((Gren.owner.playerclass == SBAR_GRENS) && (Gren.weapon != enter)))
	{
		bprint3 (SBAR_GRENS, "No ", Gren.owner.netname, ", swallowing the grenade isn't very effective!\n");
	}
	else
	{
		if ((Gren.owner.playerclass == SBAR_PRINT))
		{
			bprint3 (SBAR_GRENS, "Well ", Gren.owner.netname, ", don't quit your day job!\n");
		}
		else
		{
			if ((Gren.owner.playerclass == AS_MELEE))
			{
				bprint3 (SBAR_GRENS, "Ummm, ", Gren.owner.netname, ", you're supposed to THROW the grenade!\n");
			}
			else
			{
				if ((Gren.owner.playerclass == AS_MISSILE))
				{
					bprint3 (SBAR_GRENS, "Ack! ", Gren.owner.netname, "! The grenade is your friend for another reason!\n");
				}
				else
				{
					if ((Gren.owner.playerclass == 5))
					{
						bprint3 (SBAR_GRENS, "No ", Gren.owner.netname, "! Assist your own suicide some other time!\n");
					}
					else
					{
						if ((Gren.owner.playerclass == 6))
						{
							bprint3 (SBAR_GRENS, "Hey ", Gren.owner.netname, ", you're not THAT heavy!\n");
						}
						else
						{
							if ((Gren.owner.playerclass == 7))
							{
								bprint3 (SBAR_GRENS, "Yes ", Gren.owner.netname, ", the grenade does explode on '3'!\n");
							}
							else
							{
								if ((Gren.owner.playerclass == 8))
								{
									bprint3 (SBAR_GRENS, "You do realize ", Gren.owner.netname, ", you can blow your cover in easier ways!\n");
								}
								else
								{
									if ((Gren.owner.playerclass == 9))
									{
										bprint3 (SBAR_GRENS, "Hey ", Gren.owner.netname, ", study grenade dynamics on your own time!\n");
									}
									else
									{
										bprint3 (SBAR_GRENS, "No ", Gren.owner.netname, ", throw the grenade, not the pin!\n");
									}
								}
							}
						}
					}
				}
			}
		}
	}
	dremove (Gren);
};

void () NormalGrenadeTouch =
{
	if ((other == self.owner))
	{
		return;
	}
	sound (self, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, SBAR_GRENS);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () NormalGrenadeExplode =
{
	deathmsg = 8;
	T_RadiusDamage (self, self.owner, 180, world);
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
	dremove (self);
};

void () TeamFortress_DisplayDetectionItems =
{
	local entity Goal;
	local entity te;

	Goal = find (world, classname, "info_tfdetect");
	if (!Goal)
	{
		return;
	}
	if ((Goal.display_item_status1 != minrate))
	{
		te = Finditem (Goal.display_item_status1);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, SBAR_PRINT, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if ((Goal.display_item_status2 != minrate))
	{
		te = Finditem (Goal.display_item_status2);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, SBAR_PRINT, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if ((Goal.display_item_status3 != minrate))
	{
		te = Finditem (Goal.display_item_status3);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, SBAR_PRINT, "Item is missing.\n");
		}
	}
	else
	{
		return;
	}
	if ((Goal.display_item_status4 != minrate))
	{
		te = Finditem (Goal.display_item_status4);
		if (te)
		{
			DisplayItemStatus (Goal, self, te);
		}
		else
		{
			sprint (self, SBAR_PRINT, "Item is missing.\n");
		}
	}
};

void () BioInfection_Decay =
{
	local entity te;
	local entity Bio;

	if ((((teamplay & SBAR_240) && (self.owner.team_no == self.enemy.team_no)) && (self.owner.team_no != minrate)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_240));
		dremove (self);
		return;
	}
	else
	{
		if ((self.invincible_finished > time))
		{
			self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & SBAR_240));
			dremove (self);
			return;
		}
	}
	if ((!(self.owner.tfstate & SBAR_240) || (self.owner.playerclass == 5)))
	{
		dremove (self);
		return;
	}
	te = findradius (self.owner.origin, _P);
	while (((te != world) && (te != self.owner)))
	{
		if ((((te.classname == "player") && (te.deadflag == minrate)) && te.playerclass))
		{
			if (!(te.tfstate & SBAR_240))
			{
				if ((te.playerclass != 5))
				{
					if (!(((teamplay & SBAR_240) && (self.owner.team_no == self.enemy.team_no)) && (self.owner.team_no != minrate)))
					{
						Bio = spawn ();
						Bio.nextthink = SBAR_PRINT;
						Bio.think = BioInfection_Decay;
						Bio.owner = te;
						Bio.classname = "timer";
						Bio.enemy = self.enemy;
						te.tfstate = (te.tfstate | SBAR_240);
						te.infection_team_no = self.owner.infection_team_no;
						sprint (te, SBAR_GRENS, "You have been infected by ");
						sprint (te, SBAR_GRENS, self.owner.netname);
						sprint (te, SBAR_GRENS, "!\n");
						sprint (self.owner, SBAR_GRENS, "You have infected ");
						sprint (self.owner, SBAR_GRENS, te.netname);
						sprint (self.owner, SBAR_GRENS, "!\n");
					}
				}
			}
		}
		te = te.chain;
	}
	self.nextthink = (time + AS_MELEE);
	deathmsg = 13;
	TF_T_Damage (self.owner, self, self.enemy, 8, SBAR_GRENS, minrate);
	SpawnBlood (self.owner.origin, 30);
};

void () BioInfection_MonsterDecay =
{
	self.nextthink = (time + SBAR_PRINT);
	T_Damage (self.enemy, self, self.owner, 5);
	SpawnBlood (self.enemy.origin, 20);
	if ((self.enemy.health < SBAR_GRENS))
	{
		dremove (self);
	}
};

void (string halias, float himpulse1, float himpulse2) TeamFortress_Alias =
{
	local string imp;

	stuffcmd (self, "alias ");
	stuffcmd (self, halias);
	stuffcmd (self, " \"impulse ");
	imp = ftos (himpulse1);
	stuffcmd (self, imp);
	if ((himpulse2 != minrate))
	{
		stuffcmd (self, ";wait; impulse ");
		imp = ftos (himpulse2);
		stuffcmd (self, imp);
	}
	stuffcmd (self, "\"\n");
};

void () TeamFortress_Regenerate =
{
	if ((self.owner.playerclass == 5))
	{
		self.nextthink = (time + AS_MELEE);
		if ((self.owner.has_disconnected == SBAR_GRENS))
		{
			dremove (self);
			return;
		}
		if ((self.owner.health >= self.owner.max_health))
		{
			return;
		}
		if ((self.owner.ammo_medikit == minrate))
		{
			return;
		}
		if ((self.owner.ammo_medikit < SBAR_PRINT))
		{
			self.owner.health = (self.owner.health + self.owner.ammo_medikit);
			self.owner.ammo_medikit = minrate;
		}
		else
		{
			self.owner.health = (self.owner.health + SBAR_PRINT);
			self.owner.ammo_medikit = (self.owner.ammo_medikit - SBAR_PRINT);
		}
		if ((self.owner.health > self.owner.max_health))
		{
			self.owner.health = self.owner.max_health;
		}
	}
};

float (vector veca, vector vecb) crossproduct =
{
	local float result;

	result = ((veca_x * vecb_y) - (vecb_x * veca_y));
	return (result);
};

void (entity pl, float fr, float type) TF_AddFrags =
{
	local entity e;

	if (((intermission_running != minrate) || (intermission_exittime > time)))
	{
		return;
	}
	if ((type == SBAR_GRENS))
	{
		pl.real_frags = (pl.real_frags + fr);
	}
	if (!pl.team_no)
	{
		return;
	}
	if ((toggleflags & 2048))
	{
		if ((pl.team_no == SBAR_GRENS))
		{
			team1score = (team1score + fr);
		}
		else
		{
			if ((pl.team_no == SBAR_PRINT))
			{
				team2score = (team2score + fr);
			}
			else
			{
				if ((pl.team_no == AS_MELEE))
				{
					team3score = (team3score + fr);
				}
				else
				{
					if ((pl.team_no == AS_MISSILE))
					{
						team4score = (team4score + fr);
					}
				}
			}
		}
	}
	if ((pl.team_no == SBAR_GRENS))
	{
		team1frags = (team1frags + fr);
	}
	else
	{
		if ((pl.team_no == SBAR_PRINT))
		{
			team2frags = (team2frags + fr);
		}
		else
		{
			if ((pl.team_no == AS_MELEE))
			{
				team3frags = (team3frags + fr);
			}
			else
			{
				if ((pl.team_no == AS_MISSILE))
				{
					team4frags = (team4frags + fr);
				}
			}
		}
	}
	if ((toggleflags & 2048))
	{
		e = find (world, classname, "player");
		while (e)
		{
			if ((e.team_no == pl.team_no))
			{
				e.frags = TeamFortress_TeamGetScore (e.team_no);
			}
			e = find (e, classname, "player");
		}
	}
	else
	{
		if (!(toggleflags & 128))
		{
			pl.frags = (pl.frags + fr);
		}
	}
};

void (entity p) TeamFortress_ExecClassScript =
{
	local string st;

	st = infokey (p, "ec");
	if ((st == string_null))
	{
		st = infokey (p, "exec_class");
	}
	if (((st == "on") || (self.tfkey & SBAR_PRINT)))
	{
		if ((p.playerclass == SBAR_GRENS))
		{
			stuffcmd (p, "exec scout.cfg\n");
		}
		else
		{
			if ((p.playerclass == SBAR_PRINT))
			{
				stuffcmd (p, "exec sniper.cfg\n");
			}
			else
			{
				if ((p.playerclass == AS_MELEE))
				{
					stuffcmd (p, "exec soldier.cfg\n");
				}
				else
				{
					if ((p.playerclass == AS_MISSILE))
					{
						stuffcmd (p, "exec demoman.cfg\n");
					}
					else
					{
						if ((p.playerclass == 5))
						{
							stuffcmd (p, "exec medic.cfg\n");
						}
						else
						{
							if ((p.playerclass == 6))
							{
								stuffcmd (p, "exec hwguy.cfg\n");
							}
							else
							{
								if ((p.playerclass == 7))
								{
									stuffcmd (p, "exec pyro.cfg\n");
								}
								else
								{
									if ((p.playerclass == 8))
									{
										stuffcmd (p, "exec spy.cfg\n");
									}
									else
									{
										if ((p.playerclass == 9))
										{
											stuffcmd (p, "exec engineer.cfg\n");
										}
										else
										{
											if ((p.playerclass == SBAR_200))
											{
												stuffcmd (p, "exec dm.cfg\n");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
};

void (entity p) TeamFortress_ExecMapScript =
{
	local string st;

	st = infokey (p, "em");
	if ((st == string_null))
	{
		st = infokey (p, "exec_map");
	}
	if (((st == "on") || (self.tfkey & AS_MISSILE)))
	{
		stuffcmd (p, "exec mapdefault.cfg\n");
		stuffcmd (p, "exec ");
		stuffcmd (p, mapname);
		stuffcmd (p, ".cfg\n");
	}
};

void () TeamFortress_MOTD =
{
	local string ya;

	if ((self.motd <= 20))
	{
		self.motd = (self.motd + SBAR_GRENS);
		return;
	}
	if ((self.motd == 21))
	{
		if ((minrate == minrate))
		{
			self.tfstate = (self.tfstate | 4096);
		}
		if (((teamplay != minrate) && (self.team_no == minrate)))
		{
			stuffcmd (self, "color ");
			ya = ftos (minrate);
			stuffcmd (self, ya);
			stuffcmd (self, "\n");
			stuffcmd (self, "team observe\n");
		}
		if (self.get_aliases)
		{
			sprint (self, SBAR_PRINT, "\n\n\n");
		}
		sprint (self, SBAR_PRINT, "Hue Team Fortress v1.45\nhttp://andi.com.br/\n");
		self.menu_displaytime = minrate;
		self.current_menu = 5;
		self.menu_count = 25;
		self.motd = SBAR_300;
		if (!self.get_aliases)
		{
			return;
		}
		sprint (self, SBAR_PRINT, "binding aliases...\n");
		TeamFortress_Alias ("inv", redlamp, minrate);
		TeamFortress_Alias ("showtf", yellowlamp, minrate);
		TeamFortress_Alias ("autozoom", 174, minrate);
		TeamFortress_Alias ("changeclass", _c, minrate);
		TeamFortress_Alias ("changeteam", __, minrate);
		TeamFortress_Alias ("scout", (_d + SBAR_GRENS), minrate);
		TeamFortress_Alias ("sniper", (_d + SBAR_PRINT), minrate);
		TeamFortress_Alias ("soldier", (_d + AS_MELEE), minrate);
		TeamFortress_Alias ("demoman", (_d + AS_MISSILE), minrate);
		TeamFortress_Alias ("medic", (_d + 5), minrate);
		TeamFortress_Alias ("hwguy", (_d + 6), minrate);
		TeamFortress_Alias ("pyro", (_d + 7), minrate);
		TeamFortress_Alias ("spy", (_d + 8), minrate);
		TeamFortress_Alias ("engineer", (_d + 9), minrate);
		TeamFortress_Alias ("randompc", (_d + enter), minrate);
		TeamFortress_Alias ("elect", _R, minrate);
		TeamFortress_Alias ("yes", _S, minrate);
		TeamFortress_Alias ("no", _T, minrate);
		TeamFortress_Alias ("break", _U, minrate);
		TeamFortress_Alias ("about", _W, minrate);
		TeamFortress_Alias ("modstatus", _Y, minrate);
		return;
	}
	if ((self.motd <= _A))
	{
		self.motd = (self.motd + SBAR_GRENS);
	}
	if ((self.motd == 30))
	{
		TeamFortress_Alias ("showfrags", _H, minrate);
		TeamFortress_Alias ("showstats", _J, minrate);
		TeamFortress_Alias ("detpipe", 170, minrate);
		TeamFortress_Alias ("reload", 173, minrate);
		TeamFortress_Alias ("scansound", 162, minrate);
		TeamFortress_Alias ("autoscan", 159, minrate);
		TeamFortress_Alias ("scanf", 161, minrate);
		TeamFortress_Alias ("scane", 160, minrate);
		return;
	}
	if ((self.motd == SBAR_400))
	{
		TeamFortress_Alias ("primeone", 150, minrate);
		TeamFortress_Alias ("primetwo", 151, minrate);
		TeamFortress_Alias ("throwgren", 152, minrate);
		TeamFortress_Alias ("+gren1", 150, minrate);
		TeamFortress_Alias ("+gren2", 151, minrate);
		TeamFortress_Alias ("-gren1", 152, minrate);
		TeamFortress_Alias ("-gren2", 152, minrate);
		TeamFortress_Alias ("showclasses", 144, minrate);
		TeamFortress_Alias ("query", _w, minrate);
		TeamFortress_Alias ("flash", _V, minrate);
		return;
	}
	if ((self.motd == 40))
	{
		TeamFortress_Alias ("dropammo", 172, minrate);
		TeamFortress_Alias ("dropitems", 194, minrate);
		TeamFortress_Alias ("showloc", _v, minrate);
		TeamFortress_Alias ("special", 171, minrate);
		TeamFortress_Alias ("saveme", 181, minrate);
		TeamFortress_Alias ("discard", 184, minrate);
		TeamFortress_Alias ("id", 185, minrate);
		TeamFortress_Alias ("showfps", _I, minrate);
		return;
	}
	if ((self.motd == minus))
	{
		TeamFortress_Alias ("flaginfo", 23, minrate);
		TeamFortress_Alias ("maphelp", 131, minrate);
		TeamFortress_Alias ("commands", _X, minrate);
		TeamFortress_Alias ("tracking", 41, minrate);
		TeamFortress_Alias ("track_player", 42, minrate);
		TeamFortress_Alias ("track_tfgoal", 43, minrate);
		TeamFortress_Alias ("track_sentry", 44, minrate);
		TeamFortress_Alias ("pan_in", _p, minrate);
		TeamFortress_Alias ("pan_out", _q, minrate);
		stuffcmd (self, "bind 9 \"impulse 9\"\n");
		stuffcmd (self, "bind 0 \"impulse 10\"\n");
		return;
	}
	if ((self.motd == _4))
	{
		TeamFortress_Alias ("sbar_on", 182, minrate);
		TeamFortress_Alias ("sbar_off", 183, minrate);
		TeamFortress_Alias ("sbar_200", _G, SBAR_GRENS);
		TeamFortress_Alias ("sbar_240", _G, SBAR_PRINT);
		TeamFortress_Alias ("sbar_300", _G, AS_MELEE);
		TeamFortress_Alias ("sbar_350", _G, AS_MISSILE);
		TeamFortress_Alias ("sbar_384", _G, 5);
		TeamFortress_Alias ("sbar_400", _G, 6);
		TeamFortress_Alias ("sbar_480", _G, 7);
		TeamFortress_Alias ("sbar_600", _G, 8);
		TeamFortress_Alias ("sbar_768", _G, 9);
		return;
	}
	if ((self.motd == SBAR_600))
	{
		if (tfstrike)
		{
			TeamFortress_Alias ("+bomb", 166, minrate);
			TeamFortress_Alias ("-bomb", 169, minrate);
			TeamFortress_Alias ("dropbomb", 180, minrate);
			return;
		}
		else
		{
			TeamFortress_Alias ("+det5", 164, minrate);
			TeamFortress_Alias ("-det5", 169, minrate);
			TeamFortress_Alias ("+det20", 165, minrate);
			TeamFortress_Alias ("-det20", 169, minrate);
			TeamFortress_Alias ("+det50", 166, minrate);
			TeamFortress_Alias ("-det50", 169, minrate);
			TeamFortress_Alias ("+det255", 167, minrate);
			TeamFortress_Alias ("-det255", 169, minrate);
			return;
		}
	}
	if ((self.motd == _A))
	{
		TeamFortress_Alias ("disguise", 177, minrate);
		TeamFortress_Alias ("feign", 178, minrate);
		TeamFortress_Alias ("sfeign", 199, minrate);
		TeamFortress_Alias ("build", 179, minrate);
		TeamFortress_Alias ("detsentry", 188, minrate);
		TeamFortress_Alias ("detdispenser", 187, minrate);
		TeamFortress_Alias ("detdispenser", 187, minrate);
		if (self.is_admin)
		{
			if (self.get_admin_aliases)
			{
				Admin_Aliases ();
			}
		}
		self.get_aliases = minrate;
	}
};

void () TeamFortress_HelpMap =
{
	local entity te;

	te = find (world, classname, "info_tfdetect");
	if (te)
	{
		if ((te.non_team_broadcast != string_null))
		{
			sprint (self, SBAR_PRINT, te.non_team_broadcast);
			return;
		}
	}
	sprint (self, SBAR_PRINT, "There is no help for this map.\n");
};
.string areaname;
.float material;

void () info_areadef =
{
	dremove (self);
};

void () trigger_camera =
{
	self.classname = "info_player_start";
};

void () Explode =
{
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, AS_MELEE);
	WriteCoord (AS_MISSILE, self.origin_x);
	WriteCoord (AS_MISSILE, self.origin_y);
	WriteCoord (AS_MISSILE, self.origin_z);
	multicast (self.origin, SBAR_GRENS);
};

void () env_explosion =
{
	self.think = Explode;
};

void () Breakaway =
{
	self.solid = minrate;
	setmodel (self, string_null);
};

void () bomb_target_touch =
{
	if (!tfstrike)
	{
		return;
	}
	if (other.is_detpacking)
	{
		TeamFortress_SetBomb (other);
		other.target = self.target;
	}
};

void () nogren_touch =
{
	if ((other.classname == "grenade"))
	{
		other.think = SUB_Remove;
		return;
	}
	if ((other.classname == "grentimer"))
	{
		other.think = SUB_Remove;
		return;
	}
};

void () nobuild_touch =
{
	if ((other.classname == "player"))
	{
		return;
	}
};

void () hostage_rescue_touch =
{
	if ((other.classname != "hostage_entity"))
	{
		return;
	}
	num_hostages = (num_hostages - SBAR_GRENS);
	if (!num_hostages)
	{
		tfs_winner = SBAR_GRENS;
	}
	TF_AddFrags (other.enemy, 5, minrate);
	other.solid = minrate;
	other.tfstate = SBAR_GRENS;
	setmodel (other, string_null);
	sound (self, SBAR_PRINT, "speech/rescued.wav", SBAR_GRENS, minrate);
};

void () func_water =
{
	self.solid = SBAR_GRENS;
	self.movetype = 7;
	setorigin (self, self.origin);
	setmodel (self, self.model);
};

void () func_breakable =
{
	self.solid = AS_MISSILE;
	self.movetype = 7;
	setorigin (self, self.origin);
	self.mdl = self.model;
	setmodel (self, self.mdl);
	setsize (self, self.mins, self.maxs);
	if (!self.targetname)
	{
		self.takedamage = SBAR_GRENS;
		self.th_die = Breakaway;
	}
};

void () func_nogrenades =
{
	InitTrigger ();
	self.touch = nogren_touch;
};

void () func_nobuild =
{
	InitTrigger ();
	self.touch = nobuild_touch;
};

void () func_hostage_rescue =
{
	precache_sound ("speech/rescued.wav");
	InitTrigger ();
	self.touch = hostage_rescue_touch;
};

void () func_bomb_target =
{
	precache_sound ("speech/bombpl.wav");
	InitTrigger ();
	self.touch = bomb_target_touch;
};

void () info_bombsite =
{
	self.classname = "func_bomb_target";
	func_bomb_target ();
};

void () func_ladder =
{
	self.movetype = minrate;
	self.solid = 5;
	setmodel (self, self.model);
	self.model = "";
};

void () ball_reset =
{
	self.solid = SBAR_GRENS;
	self.velocity = '0 0 0';
	self.origin = self.oldorigin;
	setorigin (self, self.origin);
	if (!droptofloor ())
	{
		dprint ("GoalItem fell out of level at ");
		dprint (vtos (self.origin));
		dprint ("\n");
		dremove (self);
		return;
	}
};

void () ball_spin =
{
	local float vel_x;
	local float vel_y;

	if (self.velocity)
	{
		if ((self.velocity_x < minrate))
		{
			vel_x = (self.velocity_x * -1);
		}
		else
		{
			vel_x = self.velocity_x;
		}
		if ((self.velocity_y < minrate))
		{
			vel_y = (self.velocity_y * -1);
		}
		else
		{
			vel_y = self.velocity_y;
		}
		self.avelocity_x = ((vel_x + vel_y) * SBAR_PRINT);
	}
};

void (vector o, float z) ball_kick =
{
	local vector v;

	v_x = ((o_x * 1.65) + (random () * 20));
	v_y = ((o_y * 1.65) + (random () * 20));
	if ((o_x < minrate))
	{
		o_x = (o_x * -1);
	}
	if ((o_y < minrate))
	{
		o_y = (o_y * -1);
	}
	v_z = (((_d + (random () * 30)) + ((o_y + o_x) * 0.2)) + (z * 2.5));
	self.flags = (self.flags - (self.flags & 512));
	self.velocity = v;
	self.angles = vectoangles (self.velocity);
	ball_spin ();
};

void (vector o) ball_fly =
{
	local vector v;

	v_x = ((o_x * 0.6) + (crandom () * 40));
	v_y = ((o_y * 0.6) + (crandom () * 40));
	if ((o_x < minrate))
	{
		o_x = (o_x * -1);
	}
	if ((o_y < minrate))
	{
		o_y = (o_y * -1);
	}
	v_z = ((140 + (crandom () * 40)) + ((o_y + o_x) * 0.2));
	self.flags = (self.flags - (self.flags & 512));
	self.velocity = v;
	self.angles = vectoangles (self.velocity);
	ball_spin ();
};

void () ball_touch =
{
	if ((other.classname == "worldspawn"))
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((other.classname == "player"))
	{
		self.oldenemy = other;
		ball_kick (other.velocity, (other.v_angle_x * -1));
		return;
	}
	self.oldenemy = other.owner;
	ball_fly (other.velocity);
	return;
};

void () item_ball =
{
	self.solid = SBAR_GRENS;
	self.movetype = enter;
	if (self.mdl)
	{
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	else
	{
		precache_model ("progs/ball.mdl");
		self.mdl = "progs/ball.mdl";
		setmodel (self, self.mdl);
	}
	if (!self.netname)
	{
		self.netname = "ball";
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-12 -12 -12';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '12 12 12';
	}
	setsize (self, self.goal_min, self.goal_max);
	setorigin (self, self.origin);
	self.oldorigin = self.origin;
	self.touch = ball_touch;
};

void () soccer_goal_touch =
{
	if (round_over)
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if ((other.classname == "item_ball"))
	{
		if (other.solid)
		{
			TeamFortress_TeamIncreaseScore (self.owned_by, self.count);
			TeamFortress_TeamShowScores (SBAR_PRINT);
			sound (self, SBAR_PRINT, self.noise, SBAR_GRENS, minrate);
			tfs_winner = self.owned_by;
			other.solid = minrate;
		}
		return;
	}
};

void () info_soccer_goal =
{
	if (!self.noise)
	{
		self.noise = "items/tf2kfgc.wav";
	}
	precache_sound (self.noise);
	InitTrigger ();
	self.touch = soccer_goal_touch;
};

void () func_glass =
{
	InitTrigger ();
};
entity lightstyles;

void () lightstyle_use =
{
	if (((self.spawnflags & SBAR_GRENS) || (self.spawnflags & SBAR_PRINT)))
	{
		lightstyle (self.style, self.message);
		if ((self.spawnflags & SBAR_GRENS))
		{
			self.spawnflags = (self.spawnflags - SBAR_GRENS);
		}
	}
	else
	{
		lightstyle (self.style, "a");
		self.spawnflags = (self.spawnflags + SBAR_GRENS);
	}
};

void () func_lightstyle =
{
	if ((self.style > 63))
	{
		dprint ("Warning: style > 63!  Invalid range?");
	}
	if ((self.style <= SBAR_200))
	{
		dprint ("Warning: style <= 11: Old styles overwritten!");
	}
	if (!(self.spawnflags & SBAR_GRENS))
	{
		lightstyle (self.style, self.message);
	}
	if ((self.targetname == ""))
	{
		remove (self);
		return;
	}
	self.use = lightstyle_use;
	if ((self.spawnflags & SBAR_GRENS))
	{
		lightstyle (self.style, "a");
	}
	self.enemy = lightstyles;
	lightstyles = self;
};
void () TF_PlaceItem;
void () TF_StartItem;
void () TF_PlaceGoal;
void () TF_StartGoal;
void () info_tfdetect;
void () info_player_teamspawn;
void () info_tfgoal;
void () info_tfgoal_timer;
void () item_tfgoal;
entity (float gno) Findteamspawn;
void (entity Goal) InactivateGoal;
void (entity Goal) RestoreGoal;
void (entity Goal) RemoveGoal;
float (entity Goal, entity Player, entity AP) IsAffectedBy;
void (entity Goal, entity Player, entity AP, float addb) Apply_Results;
float (entity Goal, entity AP) APMeetsCriteria;
void (entity Goal) SetupRespawn;
void () DoRespawn;
void (entity Item, entity AP) DoItemGroupWork;
void (entity Goal, entity AP) DoTriggerWork;
void (entity Goal, entity Player) RemoveResults;
void () info_tfgoal_use;
void () tfgoal_timer_tick;
void () item_tfgoal_touch;
void () tfgoalitem_remove;
void (entity Item, float PAlive, entity P) tfgoalitem_drop;
void (entity Item) tfgoalitem_checkgoalreturn;
void (entity P) ForceRespawn;

void () CheckModel =
{
	if ((self.mdl == "models/flag.mdl"))
	{
		self.mdl = "progs/tf_stan.mdl";
		if ((self.skin == SBAR_GRENS))
		{
			self.skin = SBAR_PRINT;
		}
		else
		{
			if ((self.skin == SBAR_PRINT))
			{
				self.skin = SBAR_GRENS;
			}
		}
	}
	if ((self.mdl == "models/backpack.mdl"))
	{
		self.mdl = "progs/backpack.mdl";
	}
	if ((self.mdl == "models/keycard.mdl"))
	{
		if ((self.owned_by == SBAR_GRENS))
		{
			self.mdl = "progs/basbkey.bsp";
		}
		else
		{
			if ((self.owned_by == SBAR_PRINT))
			{
				self.mdl = "progs/basrkey.bsp";
			}
		}
	}
	if ((self.mdl == "models/w_suit.mdl"))
	{
		self.mdl = "progs/suit.mdl";
	}
	if ((self.mdl == "models/r_armor.mdl"))
	{
		self.mdl = "progs/armor.mdl";
	}
	if ((self.mdl == "models/ball.mdl"))
	{
		self.mdl = "progs/ball2.mdl";
	}
};

void (entity Goal) UpdateAbbreviations =
{
	local string st;
	local float flag;

	if ((Goal.has_abbreviated == minrate))
	{
		if (((Goal.g_a != minrate) && (Goal.goal_activation == minrate)))
		{
			Goal.goal_activation = Goal.g_a;
		}
		if (((Goal.g_e != minrate) && (Goal.goal_effects == minrate)))
		{
			Goal.goal_effects = Goal.g_e;
		}
		if (((Goal.h_i_g != minrate) && (Goal.has_item_from_group == minrate)))
		{
			Goal.has_item_from_group = Goal.h_i_g;
		}
		if (((Goal.hn_i_g != minrate) && (Goal.hasnt_item_from_group == minrate)))
		{
			Goal.hasnt_item_from_group = Goal.hn_i_g;
		}
		if (((Goal.r_i_g != minrate) && (Goal.remove_item_group == minrate)))
		{
			Goal.remove_item_group = Goal.r_i_g;
		}
		if (((Goal.a_s != minrate) && (Goal.ammo_shells == minrate)))
		{
			Goal.ammo_shells = Goal.a_s;
		}
		if (((Goal.a_n != minrate) && (Goal.ammo_nails == minrate)))
		{
			Goal.ammo_nails = Goal.a_n;
		}
		if (((Goal.a_r != minrate) && (Goal.ammo_rockets == minrate)))
		{
			Goal.ammo_rockets = Goal.a_r;
		}
		if (((Goal.a_c != minrate) && (Goal.ammo_cells == minrate)))
		{
			Goal.ammo_cells = Goal.a_c;
		}
		if (((Goal.rv_s_h != minrate) && (Goal.remove_spawngroup == minrate)))
		{
			Goal.remove_spawngroup = Goal.rv_s_h;
		}
		if (((Goal.rs_s_h != minrate) && (Goal.restore_spawngroup == minrate)))
		{
			Goal.restore_spawngroup = Goal.rs_s_h;
		}
		if (((Goal.rv_gr != minrate) && (Goal.remove_group_no == minrate)))
		{
			Goal.remove_group_no = Goal.rv_gr;
		}
		if (((Goal.rs_gr != minrate) && (Goal.restore_group_no == minrate)))
		{
			Goal.restore_group_no = Goal.rs_gr;
		}
		if (((Goal.rv_g != minrate) && (Goal.remove_goal_no == minrate)))
		{
			Goal.remove_goal_no = Goal.rv_g;
		}
		if (((Goal.rs_g != minrate) && (Goal.restore_goal_no == minrate)))
		{
			Goal.restore_goal_no = Goal.rs_g;
		}
		if ((Goal.t_s_h != string_null))
		{
			Goal.team_str_home = Goal.t_s_h;
		}
		if ((Goal.t_s_m != string_null))
		{
			Goal.team_str_moved = Goal.t_s_m;
		}
		if ((Goal.t_s_c != string_null))
		{
			Goal.team_str_carried = Goal.t_s_c;
		}
		if ((Goal.n_s_h != string_null))
		{
			Goal.non_team_str_home = Goal.n_s_h;
		}
		if ((Goal.n_s_m != string_null))
		{
			Goal.non_team_str_moved = Goal.n_s_m;
		}
		if ((Goal.n_s_c != string_null))
		{
			Goal.non_team_str_carried = Goal.n_s_c;
		}
		if ((Goal.b_b != string_null))
		{
			Goal.broadcast = Goal.b_b;
		}
		if ((Goal.b_t != string_null))
		{
			Goal.team_broadcast = Goal.b_t;
		}
		if ((Goal.b_n != string_null))
		{
			Goal.non_team_broadcast = Goal.b_n;
		}
		if ((Goal.b_o != string_null))
		{
			Goal.owners_team_broadcast = Goal.b_o;
		}
		if ((Goal.n_b != string_null))
		{
			Goal.netname_broadcast = Goal.n_b;
		}
		if ((Goal.n_t != string_null))
		{
			Goal.netname_team_broadcast = Goal.n_t;
		}
		if ((Goal.n_n != string_null))
		{
			Goal.netname_non_team_broadcast = Goal.n_n;
		}
		if ((Goal.n_o != string_null))
		{
			Goal.netname_owners_team_broadcast = Goal.n_o;
		}
		if ((Goal.d_t != string_null))
		{
			Goal.team_drop = Goal.d_t;
		}
		if ((Goal.d_n != string_null))
		{
			Goal.non_team_drop = Goal.d_n;
		}
		if ((Goal.d_n_t != string_null))
		{
			Goal.netname_team_drop = Goal.d_n_t;
		}
		if ((Goal.d_n_n != string_null))
		{
			Goal.netname_non_team_drop = Goal.d_n_n;
		}
		if ((flagem_checked == minrate))
		{
			st = infokey (world, "flag_drop");
			if ((st == "on"))
			{
				toggleflags = (toggleflags | 8);
			}
			st = infokey (world, "flag_solid");
			if ((st == "on"))
			{
				toggleflags = (toggleflags | SBAR_240);
			}
			flag = stof (infokey (world, "flag_model"));
			if ((flag == SBAR_GRENS))
			{
				toggleflags = (toggleflags | 4096);
			}
			else
			{
				if ((flag == SBAR_PRINT))
				{
					toggleflags = (toggleflags | 8192);
				}
				else
				{
					if ((flag == AS_MELEE))
					{
						toggleflags = (toggleflags | 16384);
					}
				}
			}
			flagem_checked = SBAR_GRENS;
		}
		if ((toggleflags & 4096))
		{
			if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
			{
				precache_model2 ("progs/tf_flag.mdl");
				Goal.mdl = "progs/tf_flag.mdl";
				Goal.skin = SBAR_GRENS;
			}
			else
			{
				if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
				{
					precache_model2 ("progs/tf_flag.mdl");
					Goal.mdl = "progs/tf_flag.mdl";
					Goal.skin = SBAR_PRINT;
				}
				else
				{
					if (((Goal.mdl == "progs/tf_stan.mdl") || (Goal.mdl == "progs/flag.mdl")))
					{
						precache_model2 ("progs/tf_flag.mdl");
						Goal.mdl = "progs/tf_flag.mdl";
					}
				}
			}
		}
		else
		{
			if ((toggleflags & 8192))
			{
				if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
				{
					precache_model2 ("progs/tf_stan.mdl");
					Goal.mdl = "progs/tf_stan.mdl";
					Goal.skin = SBAR_GRENS;
				}
				else
				{
					if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
					{
						precache_model2 ("progs/tf_stan.mdl");
						Goal.mdl = "progs/tf_stan.mdl";
						Goal.skin = SBAR_PRINT;
					}
					else
					{
						if (((Goal.mdl == "progs/tf_flag.mdl") || (Goal.mdl == "progs/flag.mdl")))
						{
							precache_model2 ("progs/tf_stan.mdl");
							Goal.mdl = "progs/tf_stan.mdl";
						}
					}
				}
			}
			else
			{
				if ((toggleflags & 16384))
				{
					if ((((Goal.mdl == "progs/b_s_key.mdl") || (Goal.mdl == "progs/m_s_key.mdl")) || (Goal.mdl == "progs/w_s_key.mdl")))
					{
						precache_model2 ("progs/flag.mdl");
						Goal.mdl = "progs/flag.mdl";
						Goal.skin = SBAR_GRENS;
					}
					else
					{
						if ((((Goal.mdl == "progs/b_g_key.mdl") || (Goal.mdl == "progs/m_g_key.mdl")) || (Goal.mdl == "progs/w_g_key.mdl")))
						{
							precache_model2 ("progs/flag.mdl");
							Goal.mdl = "progs/flag.mdl";
							Goal.skin = SBAR_PRINT;
						}
						else
						{
							if (((Goal.mdl == "progs/tf_flag.mdl") || (Goal.mdl == "progs/tf_stan.mdl")))
							{
								precache_model2 ("progs/flag.mdl");
								Goal.mdl = "progs/flag.mdl";
							}
						}
					}
				}
			}
		}
		Goal.has_abbreviated = SBAR_GRENS;
	}
};

void () TF_PlaceItem =
{
	local float oldz;

	self.flags = 256;
	self.velocity = '0 0 0';
	if ((self.goal_activation & 2048))
	{
		self.movetype = 6;
		self.origin_z = (self.origin_z + 6);
		oldz = self.origin_z;
		if (!droptofloor ())
		{
			dprint ("GoalItem fell out of level at ");
			dprint (vtos (self.origin));
			dprint ("\n");
			dremove (self);
			return;
		}
	}
	self.movetype = minrate;
	self.oldorigin = self.origin;
	if ((self.goal_activation & 512))
	{
		if ((self.owned_by == SBAR_GRENS))
		{
			self.effects = (self.effects | 64);
		}
		else
		{
			if ((self.owned_by == SBAR_PRINT))
			{
				self.effects = (self.effects | 128);
			}
			else
			{
				self.effects = (self.effects | 8);
			}
		}
	}
	if ((item_list_bit == minrate))
	{
		item_list_bit = SBAR_GRENS;
	}
	self.item_list = item_list_bit;
	item_list_bit = (item_list_bit * SBAR_PRINT);
};

void () TF_StartItem =
{
	UpdateAbbreviations (self);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	if ((self.goal_state == AS_MELEE))
	{
		RemoveGoal (self);
	}
};

void () TF_PlaceGoal =
{
	local float oldz;

	if ((self.classname != "info_tfgoal_timer"))
	{
		if ((self.goal_activation & SBAR_GRENS))
		{
			self.touch = tfgoal_touch;
		}
	}
	else
	{
		self.think = tfgoal_timer_tick;
		self.nextthink = (time + self.search_time);
		self.classname = "info_tfgoal";
	}
	if ((self.goal_activation & 2048))
	{
		self.movetype = 6;
		self.origin_z = (self.origin_z + 6);
		oldz = self.origin_z;
		if (!droptofloor ())
		{
			dprint ("Goal fell out of level at ");
			dprint (vtos (self.origin));
			dprint ("\n");
			dremove (self);
			return;
		}
	}
	self.flags = 256;
	self.movetype = minrate;
	self.velocity = '0 0 0';
	self.oldorigin = self.origin;
};

void () TF_StartGoal =
{
	UpdateAbbreviations (self);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceGoal;
	self.use = info_tfgoal_use;
	if ((self.goal_state == AS_MELEE))
	{
		RemoveGoal (self);
	}
};

float () CheckExistence =
{
	UpdateAbbreviations (self);
	skill = cvar ("skill");
	if (((self.ex_skill_min == -1) && (skill < minrate)))
	{
		return (minrate);
	}
	else
	{
		if (((self.ex_skill_max == -1) && (skill > minrate)))
		{
			return (minrate);
		}
	}
	if (((self.ex_skill_min && (self.ex_skill_min != -1)) && (skill < self.ex_skill_min)))
	{
		return (minrate);
	}
	else
	{
		if (((self.ex_skill_max && (self.ex_skill_max != -1)) && (skill > self.ex_skill_max)))
		{
			return (minrate);
		}
	}
	return (SBAR_GRENS);
};

void () info_tfdetect =
{
	UpdateAbbreviations (self);
};

void () info_player_teamspawn =
{
	local entity te;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (((self.team_no <= minrate) || (self.team_no > AS_MISSILE)))
	{
		objerror ("error: bad team_no associated with info_player_teamspawn\n");
		dremove (self);
		return;
	}
	if ((number_of_teams < self.team_no))
	{
		number_of_teams = self.team_no;
	}
	if ((self.team_no == SBAR_GRENS))
	{
		self.team_str_home = "ts1";
	}
	else
	{
		if ((self.team_no == SBAR_PRINT))
		{
			self.team_str_home = "ts2";
		}
		else
		{
			if ((self.team_no == AS_MELEE))
			{
				self.team_str_home = "ts3";
			}
			else
			{
				if ((self.team_no == AS_MISSILE))
				{
					self.team_str_home = "ts4";
				}
			}
		}
	}
};

void () i_p_t =
{
	self.classname = "info_player_teamspawn";
	info_player_teamspawn ();
};

void () info_tfgoal =
{
	local float mapversion;

	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	mapversion = stof (infokey (world, "*bspversion"));
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	self.solid = SBAR_GRENS;
	if ((mapversion == 30))
	{
		CheckModel ();
		if (self.mdl)
		{
			precache_model (self.mdl);
			precache_model2 (self.mdl);
			setmodel (self, self.mdl);
			if ((self.goal_min == '0 0 0'))
			{
				self.goal_min = '-16 -16 -24';
			}
			if ((self.goal_max == '0 0 0'))
			{
				self.goal_max = '16 16 32';
			}
			setsize (self, self.goal_min, self.goal_max);
		}
		else
		{
			setmodel (self, self.model);
			self.movetype = minrate;
			self.modelindex = minrate;
			self.model = "";
		}
		self.touch = tfgoal_touch;
	}
	else
	{
		if (self.mdl)
		{
			precache_model (self.mdl);
			precache_model2 (self.mdl);
			setmodel (self, self.mdl);
		}
		if ((self.goal_min == '0 0 0'))
		{
			self.goal_min = '-16 -16 -24';
		}
		if ((self.goal_max == '0 0 0'))
		{
			self.goal_max = '16 16 32';
		}
		setsize (self, self.goal_min, self.goal_max);
		TF_StartGoal ();
	}
	if ((self.goal_state == minrate))
	{
		self.goal_state = SBAR_PRINT;
	}
};

void () i_t_g =
{
	self.classname = "info_tfgoal";
	info_tfgoal ();
};

void () info_tfgoal_timer =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (self.mdl)
	{
		CheckModel ();
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	if ((self.search_time <= minrate))
	{
		dprint ("Timer Goal created with no specified time.\n");
		dremove (self);
	}
	self.solid = minrate;
	if ((self.goal_state == minrate))
	{
		self.goal_state = SBAR_PRINT;
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-16 -16 -24';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '16 16 32';
	}
	setsize (self, self.goal_min, self.goal_max);
	TF_StartGoal ();
};

void () i_t_t =
{
	self.classname = "info_tfgoal_timer";
	info_tfgoal_timer ();
};

void () item_tfgoal =
{
	if ((CheckExistence () == minrate))
	{
		dremove (self);
		return;
	}
	if (self.mdl)
	{
		CheckModel ();
		precache_model (self.mdl);
		precache_model2 (self.mdl);
		setmodel (self, self.mdl);
	}
	else
	{
		self.mdl = "";
		setmodel (self, "");
	}
	precache_sound2 ("items/itembk2.wav");
	if (self.noise)
	{
		precache_sound (self.noise);
		precache_sound2 (self.noise);
	}
	self.touch = item_tfgoal_touch;
	if ((self.goal_state == minrate))
	{
		self.goal_state = SBAR_PRINT;
	}
	if (((self.goal_activation & 8192) || (toggleflags & SBAR_240)))
	{
		self.solid = SBAR_PRINT;
	}
	else
	{
		self.solid = SBAR_GRENS;
	}
	setorigin (self, self.origin);
	if (!self.netname)
	{
		self.netname = "goalitem";
	}
	if ((self.pausetime <= minrate))
	{
		self.pausetime = _2;
	}
	if (((self.delay != minrate) && (self.pausetime == minrate)))
	{
		self.pausetime = self.delay;
	}
	if ((self.goal_min == '0 0 0'))
	{
		self.goal_min = '-16 -16 -24';
	}
	if ((self.goal_max == '0 0 0'))
	{
		self.goal_max = '16 16 32';
	}
	setsize (self, self.goal_min, self.goal_max);
	TF_StartItem ();
};

void (entity AD) ParseTFDetect =
{
	local float fl;

	if ((AD.team_broadcast != string_null))
	{
		team_menu_string = AD.team_broadcast;
	}
	localcmd (AD.message);
	cvar_set ("sv_maxspeed", "600");
	if ((AD.hook_out == SBAR_GRENS))
	{
		allow_hook = SBAR_GRENS;
	}
	fl = stof (infokey (world, "t1maxplayers"));
	if (fl)
	{
		AD.ammo_medikit = fl;
	}
	fl = stof (infokey (world, "t2maxplayers"));
	if (fl)
	{
		AD.ammo_detpack = fl;
	}
	fl = stof (infokey (world, "t3maxplayers"));
	if (fl)
	{
		AD.maxammo_medikit = fl;
	}
	fl = stof (infokey (world, "t4maxplayers"));
	if (fl)
	{
		AD.maxammo_detpack = fl;
	}
	if ((AD.ammo_medikit < SBAR_GRENS))
	{
		AD.ammo_medikit = _d;
	}
	if ((AD.ammo_detpack < SBAR_GRENS))
	{
		AD.ammo_detpack = _d;
	}
	if ((AD.maxammo_medikit < SBAR_GRENS))
	{
		AD.maxammo_medikit = _d;
	}
	if ((AD.maxammo_detpack < SBAR_GRENS))
	{
		AD.maxammo_detpack = _d;
	}
	team1maxplayers = AD.ammo_medikit;
	team2maxplayers = AD.ammo_detpack;
	team3maxplayers = AD.maxammo_medikit;
	team4maxplayers = AD.maxammo_detpack;
	illegalclasses = AD.playerclass;
	fl = stof (infokey (world, "t1illclasses"));
	if (fl)
	{
		AD.maxammo_shells = fl;
	}
	fl = stof (infokey (world, "t2illclasses"));
	if (fl)
	{
		AD.maxammo_nails = fl;
	}
	fl = stof (infokey (world, "t3illclasses"));
	if (fl)
	{
		AD.maxammo_rockets = fl;
	}
	fl = stof (infokey (world, "t4illclasses"));
	if (fl)
	{
		AD.maxammo_cells = fl;
	}
	civilianteams = minrate;
	if ((AD.maxammo_shells == -1))
	{
		civilianteams = (civilianteams | SBAR_GRENS);
	}
	if ((AD.maxammo_nails == -1))
	{
		civilianteams = (civilianteams | SBAR_PRINT);
	}
	if ((AD.maxammo_rockets == -1))
	{
		civilianteams = (civilianteams | AS_MISSILE);
	}
	if ((AD.maxammo_cells == -1))
	{
		civilianteams = (civilianteams | 8);
	}
};

entity (float ino) Finditem =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "item_tfgoal");
	while (tg)
	{
		if ((tg.goal_no == ino))
		{
			return (tg);
		}
		tg = find (tg, classname, "item_tfgoal");
	}
	dprint ("Could not find an item with a goal_no of ");
	st = ftos (ino);
	dprint (st);
	dprint (".\n");
};

entity (float gno) Findgoal =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "info_tfgoal");
	while (tg)
	{
		if ((tg.goal_no == gno))
		{
			return (tg);
		}
		tg = find (tg, classname, "info_tfgoal");
	}
	dprint ("Could not find a goal with a goal_no of ");
	st = ftos (gno);
	dprint (st);
	dprint (".\n");
};

entity (float gno) Findteamspawn =
{
	local entity tg;
	local string st;

	tg = find (world, classname, "info_player_teamspawn");
	while (tg)
	{
		if ((tg.goal_no == gno))
		{
			return (tg);
		}
		tg = find (tg, classname, "info_player_teamspawn");
	}
	dprint ("Could not find a Teamspawn with a goal_no of ");
	st = ftos (gno);
	dprint (st);
	dprint (".\n");
};

void (entity Goal) InactivateGoal =
{
	if ((Goal.goal_state == SBAR_GRENS))
	{
		if ((Goal.search_time == minrate))
		{
			if ((((Goal.goal_activation & 8192) || (toggleflags & SBAR_240)) && (Goal.classname == "item_tfgoal")))
			{
				Goal.solid = SBAR_PRINT;
			}
			else
			{
				Goal.solid = SBAR_GRENS;
			}
		}
		Goal.goal_state = SBAR_PRINT;
		if ((Goal.mdl != string_null))
		{
			setmodel (Goal, Goal.mdl);
		}
	}
};

void (entity Goal) RestoreGoal =
{
	if ((Goal.goal_state == AS_MELEE))
	{
		if ((Goal.search_time == minrate))
		{
			if ((((Goal.goal_activation & 8192) || (toggleflags & SBAR_240)) && (Goal.classname == "item_tfgoal")))
			{
				Goal.solid = SBAR_PRINT;
			}
			else
			{
				Goal.solid = SBAR_GRENS;
			}
		}
		else
		{
			Goal.nextthink = (time + Goal.search_time);
		}
		Goal.goal_state = SBAR_PRINT;
		if ((Goal.mdl != string_null))
		{
			setmodel (Goal, Goal.mdl);
		}
	}
};

void (entity Goal) RemoveGoal =
{
	Goal.solid = minrate;
	Goal.goal_state = AS_MELEE;
	if ((Goal.mdl != string_null))
	{
		setmodel (Goal, string_null);
	}
};

float (entity Goal, entity Player, entity AP) IsAffectedBy =
{
	local float genv;

	if (!Player.playerclass)
	{
		return (minrate);
	}
	if ((Goal.goal_effects & space))
	{
		genv = pointcontents (Goal.origin);
		if ((pointcontents (Player.origin) != genv))
		{
			return (minrate);
		}
	}
	if ((Goal.t_length != minrate))
	{
		if ((vlen ((Goal.origin - Player.origin)) <= Goal.t_length))
		{
			if ((Goal.goal_effects & SBAR_240))
			{
				traceline (Goal.origin, Player.origin, SBAR_GRENS, Goal);
				if ((trace_fraction == SBAR_GRENS))
				{
					return (SBAR_GRENS);
				}
			}
			else
			{
				return (SBAR_GRENS);
			}
		}
	}
	if ((Goal.classname != "info_tfgoal_timer"))
	{
		if (((Goal.goal_effects & SBAR_GRENS) && (Player == AP)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & SBAR_PRINT) && (AP.team_no == Player.team_no)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & AS_MISSILE) && (AP.team_no != Player.team_no)))
		{
			return (SBAR_GRENS);
		}
		if (((Goal.goal_effects & 8) && (Player != AP)))
		{
			return (SBAR_GRENS);
		}
	}
	if (((Goal.maxammo_shells != minrate) && (Player.team_no == Goal.maxammo_shells)))
	{
		return (SBAR_GRENS);
	}
	if (((Goal.maxammo_nails != minrate) && (Player.team_no != Goal.maxammo_shells)))
	{
		return (SBAR_GRENS);
	}
	return (minrate);
};

void (entity Goal, entity Player, entity AP, float addb) Apply_Results =
{
	local entity oldself;
	local entity te;
	local entity oldte;
	local float captime;
	local string st;

	stuffcmd (Player, "bf\n");
	if ((Goal.classname == "item_tfgoal"))
	{
		Player.item_list = (Player.item_list | Goal.item_list);
	}
	if ((Player == AP))
	{
		if ((Goal.count > minrate))
		{
			if ((Player.team_no > minrate))
			{
				if (rounds)
				{
					if (speedcap)
					{
						te = find (world, classname, "round");
						captime = (time - te.invisible_time);
						if ((captime != minrate))
						{
							st = ftos (captime);
							bprint (SBAR_PRINT, Player.netname);
							bprint (SBAR_PRINT, " Captured the flag in ");
							bprint (SBAR_PRINT, st);
							bprint (SBAR_PRINT, " seconds\n");
						}
					}
					if (round_active)
					{
						tfs_winner = Player.team_no;
					}
				}
				TeamFortress_TeamIncreaseScore (Player.team_no, Goal.count);
				TeamFortress_TeamShowScores (SBAR_PRINT);
			}
		}
	}
	if (addb)
	{
		if ((Player.health > minrate))
		{
			if ((Goal.health > minrate))
			{
				T_Heal (Player, Goal.health, minrate);
			}
			if ((Goal.health < minrate))
			{
				if (((minrate - Player.health) > Goal.health))
				{
					TF_T_Damage (Player, Goal, Goal, (Player.health - Goal.health), SBAR_GRENS, minrate);
				}
				else
				{
					TF_T_Damage (Player, Goal, Goal, (minrate - Goal.health), SBAR_GRENS, minrate);
				}
			}
		}
		if ((Player.health > minrate))
		{
			if ((Goal.armortype > minrate))
			{
				Player.armortype = Goal.armortype;
			}
			else
			{
				if ((Goal.armorvalue > minrate))
				{
					Player.armortype = Player.armor_allowed;
				}
			}
			Player.armorvalue = (Player.armorvalue + Goal.armorvalue);
			if ((Goal.armorclass > minrate))
			{
				Player.armorclass = Goal.armorclass;
			}
			Player.ammo_shells = (Player.ammo_shells + Goal.ammo_shells);
			Player.ammo_nails = (Player.ammo_nails + Goal.ammo_nails);
			Player.ammo_rockets = (Player.ammo_rockets + Goal.ammo_rockets);
			Player.ammo_cells = (Player.ammo_cells + Goal.ammo_cells);
			Player.ammo_medikit = (Player.ammo_medikit + Goal.ammo_medikit);
			Player.ammo_detpack = (Player.ammo_detpack + Goal.ammo_detpack);
			Player.no_grenades_1 = (Player.no_grenades_1 + Goal.no_grenades_1);
			Player.no_grenades_2 = (Player.no_grenades_2 + Goal.no_grenades_2);
			if ((Player.no_grenades_1 > AS_MISSILE))
			{
				Player.no_grenades_1 = AS_MISSILE;
			}
			if ((Player.no_grenades_2 > AS_MISSILE))
			{
				Player.no_grenades_2 = AS_MISSILE;
			}
			if (((Player.tp_grenades_1 == AS_MELEE) && (Player.no_grenades_1 > SBAR_PRINT)))
			{
				Player.no_grenades_1 = SBAR_PRINT;
			}
			if (((Player.tp_grenades_2 == AS_MELEE) && (Player.no_grenades_2 > SBAR_PRINT)))
			{
				Player.no_grenades_2 = SBAR_PRINT;
			}
			if ((Player.ammo_detpack > Player.maxammo_detpack))
			{
				Player.ammo_detpack = Player.maxammo_detpack;
			}
			if ((Player.tfstate & SBAR_GRENS))
			{
				te = find (world, classname, "primer");
				while (te)
				{
					if ((te.owner == Player))
					{
						if (((te.impulse == 151) && (Player.no_grenades_2 <= minrate)))
						{
							Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
							Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
							dremove (te);
						}
						else
						{
							if (((te.impulse == 150) && (Player.no_grenades_1 <= minrate)))
							{
								Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
								Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
								dremove (te);
							}
						}
						te = world;
					}
					else
					{
						te = find (te, classname, "primer");
					}
				}
			}
			if ((Goal.invincible_finished > minrate))
			{
				Player.items = (Player.items | 1048576);
				Player.invincible_time = SBAR_GRENS;
				Player.invincible_finished = (time + Goal.invincible_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | space);
					Player.invincible_finished = (time + 666);
				}
			}
			if ((Goal.invisible_finished > minrate))
			{
				Player.items = (Player.items | 524288);
				Player.invisible_time = SBAR_GRENS;
				Player.invisible_finished = (time + Goal.invisible_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 64);
					Player.invisible_finished = (time + 666);
				}
			}
			if ((Goal.super_damage_finished > minrate))
			{
				Player.items = (Player.items | 4194304);
				Player.super_time = SBAR_GRENS;
				Player.super_damage_finished = (time + Goal.super_damage_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 128);
					Player.super_damage_finished = (time + 666);
				}
			}
			if ((Goal.radsuit_finished > minrate))
			{
				Player.items = (Player.items | 2097152);
				Player.rad_time = SBAR_GRENS;
				Player.radsuit_finished = (time + Goal.radsuit_finished);
				if ((Goal.classname == "item_tfgoal"))
				{
					Player.tfstate = (Player.tfstate | 256);
					Player.radsuit_finished = (time + 666);
				}
			}
		}
		if (Goal.frags)
		{
			if (((Goal.goal_effects == SBAR_GRENS) || !(toggleflags & 2048)))
			{
				TF_AddFrags (Player, Goal.frags, minrate);
			}
		}
		oldself = self;
		self = Player;
		TeamFortress_CheckClassStats ();
		W_SetCurrentAmmo ();
		self = oldself;
	}
	if (((Player.playerclass == 8) && (Goal.goal_result & SBAR_240)))
	{
		self.immune_to_check = (time + 5);
		Spy_RemoveDisguise (Player);
	}
	if (((Goal.items != minrate) && (Goal.classname != "item_tfgoal")))
	{
		te = Finditem (Goal.items);
		if (((te != world) && (te != Goal)))
		{
			tfgoalitem_GiveToPlayer (te, Player, Goal);
		}
	}
	if ((Goal.axhitme != minrate))
	{
		te = Finditem (Goal.axhitme);
		if ((te.owner == Player))
		{
			tfgoalitem_RemoveFromPlayer (te, Player, SBAR_GRENS);
		}
	}
	if ((Goal.remove_item_group != minrate))
	{
		te = find (world, classname, "item_tfgoal");
		while (te)
		{
			if (((te.group_no == Goal.remove_item_group) && (te.owner == AP)))
			{
				oldte = te;
				te = find (te, classname, "item_tfgoal");
				tfgoalitem_RemoveFromPlayer (oldte, Player, SBAR_GRENS);
			}
			else
			{
				te = find (te, classname, "item_tfgoal");
			}
		}
	}
	if ((Goal.display_item_status1 != minrate))
	{
		te = Finditem (Goal.display_item_status1);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status2 != minrate))
	{
		te = Finditem (Goal.display_item_status2);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status3 != minrate))
	{
		te = Finditem (Goal.display_item_status3);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.display_item_status4 != minrate))
	{
		te = Finditem (Goal.display_item_status4);
		if (te)
		{
			DisplayItemStatus (Goal, Player, te);
		}
		else
		{
			sprint (Player, SBAR_PRINT, "Item is missing.\n");
		}
	}
	if ((Goal.goal_result & space))
	{
		ForceRespawn (Player);
	}
};

void (entity Goal, entity Player) RemoveResults =
{
	local entity oldself;
	local entity te;
	local float puinvin;
	local float puinvis;
	local float puquad;
	local float purad;

	if ((Goal.classname == "item_tfgoal"))
	{
		if (!(Player.item_list & Goal.item_list))
		{
			return;
		}
		if ((Goal.goal_activation & 1024))
		{
			return;
		}
		Player.item_list = (Player.item_list - (Player.item_list & Goal.item_list));
	}
	if ((Goal.health > minrate))
	{
		TF_T_Damage (Player, Goal, Goal, Goal.health, SBAR_GRENS, minrate);
	}
	if ((Goal.health < minrate))
	{
		T_Heal (Player, (minrate - Goal.health), minrate);
	}
	Player.armortype = (Player.armortype - Goal.armortype);
	Player.armorvalue = (Player.armorvalue - Goal.armorvalue);
	Player.armorclass = (Player.armorclass - (Player.armorclass & Goal.armorclass));
	if (Goal.frags)
	{
		if (((Goal.goal_effects == SBAR_GRENS) || !(toggleflags & 2048)))
		{
			TF_AddFrags (Player, Goal.frags, minrate);
		}
	}
	Player.ammo_shells = (Player.ammo_shells - Goal.ammo_shells);
	Player.ammo_nails = (Player.ammo_nails - Goal.ammo_nails);
	Player.ammo_rockets = (Player.ammo_rockets - Goal.ammo_rockets);
	Player.ammo_cells = (Player.ammo_cells - Goal.ammo_cells);
	Player.ammo_medikit = (Player.ammo_medikit - Goal.ammo_medikit);
	Player.ammo_detpack = (Player.ammo_detpack - Goal.ammo_detpack);
	Player.no_grenades_1 = (Player.no_grenades_1 - Goal.no_grenades_1);
	Player.no_grenades_2 = (Player.no_grenades_2 - Goal.no_grenades_2);
	if ((Player.no_grenades_1 > AS_MISSILE))
	{
		Player.no_grenades_1 = AS_MISSILE;
	}
	if ((Player.no_grenades_2 > AS_MISSILE))
	{
		Player.no_grenades_2 = AS_MISSILE;
	}
	if (((Player.tp_grenades_1 == AS_MELEE) && (Player.no_grenades_1 > SBAR_PRINT)))
	{
		Player.no_grenades_1 = SBAR_PRINT;
	}
	if (((Player.tp_grenades_2 == AS_MELEE) && (Player.no_grenades_2 > SBAR_PRINT)))
	{
		Player.no_grenades_2 = SBAR_PRINT;
	}
	if ((Player.ammo_detpack > Player.maxammo_detpack))
	{
		Player.ammo_detpack = Player.maxammo_detpack;
	}
	if ((Player.tfstate & SBAR_GRENS))
	{
		te = find (world, classname, "primer");
		while (te)
		{
			if ((te.owner == Player))
			{
				if (((te.impulse == 151) && (Player.no_grenades_2 <= minrate)))
				{
					Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
					Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
					dremove (te);
				}
				else
				{
					if (((te.impulse == 150) && (Player.no_grenades_1 <= minrate)))
					{
						Player.tfstate = (Player.tfstate - (Player.tfstate & SBAR_GRENS));
						Player.tfstate = (Player.tfstate - (Player.tfstate & 1024));
						dremove (te);
					}
				}
				te = world;
			}
			else
			{
				te = find (te, classname, "primer");
			}
		}
	}
	puinvin = minrate;
	puinvis = minrate;
	puquad = minrate;
	purad = minrate;
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if (((te.owner == Player) && (te != Goal)))
		{
			if ((te.invincible_finished > minrate))
			{
				puinvin = SBAR_GRENS;
			}
			if ((te.invisible_finished > minrate))
			{
				puinvis = SBAR_GRENS;
			}
			if ((te.super_damage_finished > minrate))
			{
				puquad = SBAR_GRENS;
			}
			if ((te.radsuit_finished > minrate))
			{
				purad = SBAR_GRENS;
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (((Goal.invincible_finished > minrate) && !puinvin))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & space));
		Player.items = (Player.items | 1048576);
		Player.invincible_time = SBAR_GRENS;
		Player.invincible_finished = (time + Goal.invincible_finished);
	}
	if (((Goal.invisible_finished > minrate) && !puinvis))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 64));
		Player.items = (Player.items | 524288);
		Player.invisible_time = SBAR_GRENS;
		Player.invisible_finished = (time + Goal.invisible_finished);
	}
	if (((Goal.super_damage_finished > minrate) && !puquad))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 128));
		Player.items = (Player.items | 4194304);
		Player.super_time = SBAR_GRENS;
		Player.super_damage_finished = (time + Goal.super_damage_finished);
	}
	if (((Goal.radsuit_finished > minrate) && !purad))
	{
		Player.tfstate = (Player.tfstate - (Player.tfstate & 256));
		Player.items = (Player.items | 2097152);
		Player.rad_time = SBAR_GRENS;
		Player.radsuit_finished = (time + Goal.radsuit_finished);
	}
	oldself = self;
	self = Player;
	TeamFortress_CheckClassStats ();
	W_SetCurrentAmmo ();
	self = oldself;
};

float (entity Goal, entity AP) APMeetsCriteria =
{
	local float gotone;
	local entity te;
	local string db;

	if ((AP != world))
	{
		if (Goal.team_no)
		{
			if ((Goal.team_no != AP.team_no))
			{
				return (minrate);
			}
		}
		if (Goal.playerclass)
		{
			if ((Goal.playerclass != AP.playerclass))
			{
				return (minrate);
			}
		}
		if (Goal.items_allowed)
		{
			te = Finditem (Goal.items_allowed);
			if ((te.owner != AP))
			{
				return (minrate);
			}
		}
	}
	if (Goal.if_goal_is_active)
	{
		te = Findgoal (Goal.if_goal_is_active);
		if ((te.goal_state != SBAR_GRENS))
		{
			return (minrate);
		}
	}
	if (Goal.if_goal_is_inactive)
	{
		te = Findgoal (Goal.if_goal_is_inactive);
		if ((te.goal_state != SBAR_PRINT))
		{
			return (minrate);
		}
	}
	if (Goal.if_goal_is_removed)
	{
		te = Findgoal (Goal.if_goal_is_removed);
		if ((te.goal_state != AS_MELEE))
		{
			return (minrate);
		}
	}
	if (Goal.if_group_is_active)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_active))
			{
				if ((te.goal_state != SBAR_GRENS))
				{
					return (minrate);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_group_is_inactive)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_inactive))
			{
				if ((te.goal_state != SBAR_PRINT))
				{
					return (minrate);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_group_is_removed)
	{
		te = find (world, classname, "info_tfgoal");
		while (te)
		{
			if ((te.group_no == Goal.if_group_is_removed))
			{
				if ((te.goal_state != AS_MELEE))
				{
					return (minrate);
				}
			}
			te = find (te, classname, "info_tfgoal");
		}
	}
	if (Goal.if_item_has_moved)
	{
		te = Finditem (Goal.if_item_has_moved);
		if (te)
		{
			if (((te.goal_state != SBAR_GRENS) && (te.origin == te.oldorigin)))
			{
				return (minrate);
			}
		}
	}
	if (Goal.if_item_hasnt_moved)
	{
		te = Finditem (Goal.if_item_hasnt_moved);
		if (te)
		{
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return (minrate);
			}
		}
	}
	if ((AP != world))
	{
		gotone = minrate;
		if (Goal.has_item_from_group)
		{
			te = find (world, classname, "item_tfgoal");
			while (((te != world) && !gotone))
			{
				if (((te.group_no == Goal.has_item_from_group) && (te.owner == AP)))
				{
					gotone = SBAR_GRENS;
				}
				te = find (te, classname, "item_tfgoal");
			}
			if (!gotone)
			{
				return (minrate);
			}
		}
		if (Goal.hasnt_item_from_group)
		{
			te = find (world, classname, "item_tfgoal");
			while (((te != world) && !gotone))
			{
				if (((te.group_no == Goal.hasnt_item_from_group) && (te.owner == AP)))
				{
					return (minrate);
				}
				te = find (te, classname, "item_tfgoal");
			}
		}
	}
	return (SBAR_GRENS);
};

void (entity Goal) SetupRespawn =
{
	if ((Goal.search_time != minrate))
	{
		InactivateGoal (Goal);
		Goal.think = tfgoal_timer_tick;
		Goal.nextthink = (time + Goal.search_time);
		return;
	}
	if ((Goal.goal_result & SBAR_GRENS))
	{
		RemoveGoal (Goal);
		return;
	}
	if ((Goal.wait > minrate))
	{
		Goal.nextthink = (time + Goal.wait);
		Goal.think = DoRespawn;
		return;
	}
	else
	{
		if ((Goal.wait == -1))
		{
			return;
		}
	}
	InactivateGoal (Goal);
};

void () DoRespawn =
{
	RestoreGoal (self);
	InactivateGoal (self);
};

float (entity Goal, entity AP) Activated =
{
	local float APMet;
	local float RevAct;
	local float Act;

	if ((Goal.goal_state == SBAR_GRENS))
	{
		return (minrate);
	}
	if ((Goal.goal_state == AS_MELEE))
	{
		return (minrate);
	}
	if ((Goal.goal_state == AS_MISSILE))
	{
		return (minrate);
	}
	APMet = APMeetsCriteria (Goal, AP);
	if ((Goal.classname == "item_tfgoal"))
	{
		RevAct = (Goal.goal_activation & 64);
	}
	else
	{
		RevAct = (Goal.goal_activation & AS_MISSILE);
	}
	Act = minrate;
	if (APMet)
	{
		if (!RevAct)
		{
			Act = SBAR_GRENS;
		}
	}
	else
	{
		if (RevAct)
		{
			Act = SBAR_GRENS;
		}
	}
	return (Act);
};

void (entity Goal, entity AP, entity ActivatingGoal) AttemptToActivate =
{
	local entity te;
	local string st;

	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (Activated (Goal, AP))
	{
		if ((ActivatingGoal == Goal))
		{
			DoResults (Goal, AP, SBAR_GRENS);
		}
		else
		{
			if ((ActivatingGoal != world))
			{
				DoResults (Goal, AP, (ActivatingGoal.goal_result & SBAR_PRINT));
			}
			else
			{
				DoResults (Goal, AP, minrate);
			}
		}
	}
	else
	{
		if ((Goal.else_goal != minrate))
		{
			te = Findgoal (Goal.else_goal);
			if (te)
			{
				AttemptToActivate (te, AP, Goal);
			}
		}
	}
};

void (entity Goal, entity AP) DoGoalWork =
{
	local entity te;
	local entity RI;

	if ((Goal.activate_goal_no != minrate))
	{
		te = Findgoal (Goal.activate_goal_no);
		if (te)
		{
			AttemptToActivate (te, AP, Goal);
		}
	}
	if ((Goal.inactivate_goal_no != minrate))
	{
		te = Findgoal (Goal.inactivate_goal_no);
		if (te)
		{
			InactivateGoal (te);
		}
	}
	if ((Goal.restore_goal_no != minrate))
	{
		te = Findgoal (Goal.restore_goal_no);
		if (te)
		{
			RestoreGoal (te);
		}
	}
	if ((Goal.remove_goal_no != minrate))
	{
		te = Findgoal (Goal.remove_goal_no);
		if (te)
		{
			RemoveGoal (te);
		}
	}
	if ((Goal.return_item_no != minrate))
	{
		te = Finditem (Goal.return_item_no);
		if (te)
		{
			if ((te.goal_state == SBAR_GRENS))
			{
				tfgoalitem_RemoveFromPlayer (te, te.owner, SBAR_GRENS);
			}
			RI = spawn ();
			RI.enemy = te;
			RI.weapon = SBAR_PRINT;
			RI.think = ReturnItem;
			RI.nextthink = (time + 0.1);
			te.solid = minrate;
		}
	}
	if ((Goal.remove_spawnpoint != minrate))
	{
		te = Findteamspawn (Goal.remove_spawnpoint);
		if (te)
		{
			te.goal_state = AS_MELEE;
			te.team_str_home = string_null;
		}
	}
	if ((Goal.restore_spawnpoint != minrate))
	{
		te = Findteamspawn (Goal.restore_spawnpoint);
		if (te)
		{
			if ((te.goal_state == AS_MELEE))
			{
				te.goal_state = SBAR_PRINT;
				if ((te.team_no == SBAR_GRENS))
				{
					te.team_str_home = "ts1";
				}
				else
				{
					if ((te.team_no == SBAR_PRINT))
					{
						te.team_str_home = "ts2";
					}
					else
					{
						if ((te.team_no == AS_MELEE))
						{
							te.team_str_home = "ts3";
						}
						else
						{
							if ((te.team_no == AS_MISSILE))
							{
								te.team_str_home = "ts4";
							}
						}
					}
				}
			}
		}
	}
};

void (entity Goal, entity AP) DoGroupWork =
{
	local string st;
	local entity tg;
	local float allset;

	if ((Goal.all_active != minrate))
	{
		if ((Goal.last_impulse == minrate))
		{
			dprint ("Goal ");
			st = ftos (Goal.goal_no);
			dprint (st);
			dprint (" has a .all_active specified, but no .last_impulse\n");
		}
		else
		{
			allset = SBAR_GRENS;
			tg = find (world, classname, "info_tfgoal");
			while (tg)
			{
				if ((tg.group_no == Goal.all_active))
				{
					if ((tg.goal_state != SBAR_GRENS))
					{
						allset = minrate;
					}
				}
				tg = find (tg, classname, "info_tfgoal");
			}
			if (allset)
			{
				tg = Findgoal (Goal.last_impulse);
				if (tg)
				{
					DoResults (tg, AP, (Goal.goal_result & SBAR_PRINT));
				}
			}
		}
	}
	if ((Goal.activate_group_no != minrate))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.activate_group_no))
			{
				DoResults (tg, AP, minrate);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.inactivate_group_no != minrate))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.inactivate_group_no))
			{
				InactivateGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.remove_group_no != minrate))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.remove_group_no))
			{
				RemoveGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.restore_group_no != minrate))
	{
		tg = find (world, classname, "info_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Goal.restore_group_no))
			{
				RestoreGoal (tg);
			}
			tg = find (tg, classname, "info_tfgoal");
		}
	}
	if ((Goal.remove_spawngroup != minrate))
	{
		tg = find (world, classname, "info_player_teamspawn");
		while (tg)
		{
			if ((tg.group_no == Goal.remove_spawngroup))
			{
				tg.goal_state = AS_MELEE;
				tg.team_str_home = string_null;
			}
			tg = find (tg, classname, "info_player_teamspawn");
		}
	}
	if ((Goal.restore_spawngroup != minrate))
	{
		tg = find (world, classname, "info_player_teamspawn");
		while (tg)
		{
			if ((tg.group_no == Goal.restore_spawngroup))
			{
				tg.goal_state = SBAR_PRINT;
				if ((tg.team_no == SBAR_GRENS))
				{
					tg.team_str_home = "ts1";
				}
				else
				{
					if ((tg.team_no == SBAR_PRINT))
					{
						tg.team_str_home = "ts2";
					}
					else
					{
						if ((tg.team_no == AS_MELEE))
						{
							tg.team_str_home = "ts3";
						}
						else
						{
							if ((tg.team_no == AS_MISSILE))
							{
								tg.team_str_home = "ts4";
							}
						}
					}
				}
			}
			tg = find (tg, classname, "info_player_teamspawn");
		}
	}
};

void (entity Item, entity AP) DoItemGroupWork =
{
	local entity tg;
	local entity carrier;
	local float allcarried;
	local string st;

	allcarried = SBAR_GRENS;
	if ((Item.distance != minrate))
	{
		if ((Item.pain_finished == minrate))
		{
			dprint ("GoalItem ");
			st = ftos (Item.goal_no);
			dprint (st);
			dprint (" has a .distance specified, but no .pain_finished\n");
		}
		tg = find (world, classname, "item_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Item.distance))
			{
				if ((tg.goal_state != SBAR_GRENS))
				{
					allcarried = minrate;
				}
			}
			tg = find (tg, classname, "item_tfgoal");
		}
		if ((allcarried == SBAR_GRENS))
		{
			tg = Findgoal (Item.pain_finished);
			if (tg)
			{
				DoResults (tg, AP, (Item.goal_result & SBAR_PRINT));
			}
		}
	}
	allcarried = SBAR_GRENS;
	if ((Item.speed != minrate))
	{
		if ((Item.attack_finished == minrate))
		{
			dprint ("GoalItem ");
			st = ftos (Item.goal_no);
			dprint (st);
			dprint (" has a .speed specified, but no .attack_finished\n");
		}
		carrier = world;
		tg = find (world, classname, "item_tfgoal");
		while (tg)
		{
			if ((tg.group_no == Item.speed))
			{
				if ((tg.goal_state != SBAR_GRENS))
				{
					allcarried = minrate;
				}
				else
				{
					if ((carrier == world))
					{
						carrier = tg.owner;
					}
					else
					{
						if ((carrier != tg.owner))
						{
							allcarried = minrate;
						}
					}
				}
			}
			tg = find (tg, classname, "item_tfgoal");
		}
		if ((allcarried == SBAR_GRENS))
		{
			tg = Findgoal (Item.attack_finished);
			if (tg)
			{
				DoResults (tg, AP, (Item.goal_result & SBAR_PRINT));
			}
		}
	}
};

void (entity Goal, entity AP) DoTriggerWork =
{
	local entity t;

	if (Goal.killtarget)
	{
		t = world;
		do
		{
			t = find (t, targetname, Goal.killtarget);
			if ((t != world))
			{
				dremove (t);
			}

		} while ((t != world));
	}
	if (Goal.target)
	{
		t = world;
		activator = AP;
		do
		{
			t = find (t, targetname, Goal.target);
			if ((t == world))
			{
				return;
			}
			stemp = self;
			otemp = other;
			self = t;
			other = stemp;
			if ((self.use != SUB_Null))
			{
				if (self.use)
				{
					self.use ();
				}
			}
			self = stemp;
			other = otemp;
			activator = AP;

		} while ((t != world));
	}
};

void () DelayedResult =
{
	if ((self.enemy.goal_state == AS_MISSILE))
	{
		DoResults (self.enemy, self.owner, self.weapon);
	}
	dremove (self);
};

void (entity Goal, entity AP, float addb) DoResults =
{
	local entity te;
	local entity oldself;
	local string st;
	local float winners;
	local float gotone;

	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((Goal.goal_state == SBAR_GRENS))
	{
		return;
	}
	if (((Goal.delay_time > minrate) && (Goal.goal_state != AS_MISSILE)))
	{
		Goal.goal_state = AS_MISSILE;
		te = spawn ();
		te.think = DelayedResult;
		te.nextthink = (time + Goal.delay_time);
		te.owner = AP;
		te.enemy = Goal;
		te.weapon = addb;
		return;
	}
	UpdateAbbreviations (Goal);
	Goal.goal_state = SBAR_PRINT;
	if (((Goal.classname == "info_tfgoal") && (Goal.mdl != string_null)))
	{
		setmodel (Goal, string_null);
	}
	if (Goal.noise)
	{
		sound (other, AS_MELEE, Goal.noise, SBAR_GRENS, SBAR_GRENS);
	}
	winners = minrate;
	if ((Goal.increase_team1 != minrate))
	{
		TeamFortress_TeamIncreaseScore (SBAR_GRENS, Goal.increase_team1);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team2 != minrate))
	{
		TeamFortress_TeamIncreaseScore (SBAR_PRINT, Goal.increase_team2);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team3 != minrate))
	{
		TeamFortress_TeamIncreaseScore (AS_MELEE, Goal.increase_team3);
		winners = SBAR_GRENS;
	}
	if ((Goal.increase_team4 != minrate))
	{
		TeamFortress_TeamIncreaseScore (AS_MISSILE, Goal.increase_team4);
		winners = SBAR_GRENS;
	}
	if ((winners == SBAR_GRENS))
	{
		TeamFortress_TeamShowScores (SBAR_PRINT);
		te = find (world, classname, "observer");
		while ((te != world))
		{
			if ((Goal.netname != string_null))
			{
				CenterPrint3 (te, AP.netname, " captured the ", Goal.netname);
			}
			te = find (te, classname, "observer");
		}
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if ((AP != world))
		{
			if ((Goal.goal_no == SBAR_GRENS))
			{
				te = find (world, classname, "player");
				while ((te != world))
				{
					if ((te.team_no == SBAR_PRINT))
					{
						if ((te == AP))
						{
							winners = random ();
							if ((winners < 0.1))
							{
								CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nFlee!");
							}
							else
							{
								if ((winners < 0.2))
								{
									CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nHead for home!");
								}
								else
								{
									if ((winners < 0.6))
									{
										CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nReturn to base!");
									}
									else
									{
										if ((winners < 0.7))
										{
											CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n<Insert witty comment here>");
										}
										else
										{
											if ((winners < 0.8))
											{
												CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
											}
											else
											{
												if ((winners < 0.95))
												{
													CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
												}
												else
												{
													CenterPrint2 (te, "\n\n\n", "Is that a flag in your pocket\nor a you just happy to see me?");
												}
											}
										}
									}
								}
							}
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "Your team «œ‘ the ≈Œ≈ÕŸ flag!!");
						}
					}
					else
					{
						CenterPrint2 (te, "\n\n\n", "Your flag has been ‘¡À≈Œ!!");
					}
					te = find (te, classname, "player");
				}
				bprint (SBAR_PRINT, AP.netname);
				bprint (SBAR_PRINT, " «œ‘ the ¬Ã’≈ flag!\n");
				AP.items = (AP.items | 131072);
				AP.effects = (AP.effects | _P);
			}
			else
			{
				if ((Goal.goal_no == SBAR_PRINT))
				{
					te = find (world, classname, "player");
					while ((te != world))
					{
						if ((te.team_no == SBAR_GRENS))
						{
							if ((te == AP))
							{
								winners = random ();
								if ((winners < 0.1))
								{
									CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nFlee!");
								}
								else
								{
									if ((winners < 0.2))
									{
										CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nHead for home!");
									}
									else
									{
										if ((winners < 0.6))
										{
											CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nReturn to base!");
										}
										else
										{
											if ((winners < 0.7))
											{
												CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n<Insert witty comment here>");
											}
											else
											{
												if ((winners < 0.8))
												{
													CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\nRed's dead baby, Red's dead...");
												}
												else
												{
													if ((winners < 0.95))
													{
														CenterPrint2 (te, "\n\n\n", "You got the enemy flag!\n\n");
													}
													else
													{
														CenterPrint2 (te, "\n\n\n", "Is that a flag in your pocket\nor a you just happy to see me?");
													}
												}
											}
										}
									}
								}
							}
							else
							{
								CenterPrint2 (te, "\n\n\n", "Your team «œ‘ the ≈Œ≈ÕŸ flag!!");
							}
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "Your flag has been ‘¡À≈Œ!!");
						}
						te = find (te, classname, "player");
					}
					bprint (SBAR_PRINT, AP.netname);
					bprint (SBAR_PRINT, " «œ‘ the “≈ƒ flag!\n");
					AP.items = (AP.items | 262144);
					AP.effects = (AP.effects | 160);
				}
				else
				{
					if ((Goal.goal_no == AS_MELEE))
					{
						te = find (world, classname, "player");
						while ((te != world))
						{
							if ((te.team_no == SBAR_PRINT))
							{
								if ((te == AP))
								{
									CenterPrint2 (te, "\n\n\n", "You √¡–‘’“≈ƒ the flag!!");
								}
								else
								{
									CenterPrint2 (te, "\n\n\n", "Your flag was √¡–‘’“≈ƒ!!");
								}
							}
							else
							{
								CenterPrint2 (te, "\n\n\n", "Your team √¡–‘’“≈ƒ the flag!!");
							}
							te = find (te, classname, "player");
						}
						bprint (SBAR_PRINT, AP.netname);
						bprint (SBAR_PRINT, " √¡–‘’“≈ƒ the “≈ƒ flag!\n");
						AP.items = (AP.items - (AP.items & 262144));
						AP.effects = (AP.effects - (AP.effects & 160));
					}
					else
					{
						if ((Goal.goal_no == AS_MISSILE))
						{
							te = find (world, classname, "player");
							while ((te != world))
							{
								if ((te.team_no == SBAR_GRENS))
								{
									if ((te == AP))
									{
										CenterPrint2 (te, "\n\n\n", "You √¡–‘’“≈ƒ the flag!!");
									}
									else
									{
										CenterPrint2 (te, "\n\n\n", "Your flag was √¡–‘’“≈ƒ!!");
									}
								}
								else
								{
									CenterPrint2 (te, "\n\n\n", "Your team √¡–‘’“≈ƒ the flag!!");
								}
								te = find (te, classname, "player");
							}
							bprint (SBAR_PRINT, AP.netname);
							bprint (SBAR_PRINT, " √¡–‘’“≈ƒ the ¬Ã’≈ flag!\n");
							AP.items = (AP.items - (AP.items & 131072));
							AP.effects = (AP.effects - (AP.effects & _P));
						}
					}
				}
			}
		}
	}
	gotone = minrate;
	te = find (world, classname, "player");
	while ((te != world))
	{
		if (((Goal.broadcast != string_null) && (CTF_Map == minrate)))
		{
			CenterPrint2 (te, "\n\n\n", Goal.broadcast);
		}
		if (((Goal.netname_broadcast != string_null) && (CTF_Map == minrate)))
		{
			sprint (te, SBAR_PRINT, AP.netname);
			sprint (te, SBAR_PRINT, Goal.netname_broadcast);
		}
		if ((AP == te))
		{
			if ((Goal.message != string_null))
			{
				CenterPrint2 (te, "\n\n\n", Goal.message);
			}
		}
		else
		{
			if ((AP.team_no == te.team_no))
			{
				if (((Goal.owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					CenterPrint2 (te, "\n\n\n", Goal.owners_team_broadcast);
				}
				else
				{
					if ((Goal.team_broadcast != string_null))
					{
						CenterPrint2 (te, "\n\n\n", Goal.team_broadcast);
					}
				}
				if (((Goal.netname_owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					sprint (te, SBAR_PRINT, AP.netname);
					sprint (te, SBAR_PRINT, Goal.netname_owners_team_broadcast);
				}
				else
				{
					if ((Goal.netname_team_broadcast != string_null))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Goal.netname_team_broadcast);
					}
				}
			}
			else
			{
				if (((Goal.owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					CenterPrint2 (te, "\n\n\n", Goal.owners_team_broadcast);
				}
				else
				{
					if ((Goal.non_team_broadcast != string_null))
					{
						CenterPrint2 (te, "\n\n\n", Goal.non_team_broadcast);
					}
				}
				if (((Goal.netname_owners_team_broadcast != string_null) && (te.team_no == Goal.owned_by)))
				{
					sprint (te, SBAR_PRINT, AP.netname);
					sprint (te, SBAR_PRINT, Goal.netname_owners_team_broadcast);
				}
				else
				{
					if ((Goal.netname_non_team_broadcast != string_null))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Goal.netname_non_team_broadcast);
					}
				}
			}
		}
		if (IsAffectedBy (Goal, te, AP))
		{
			if (((Goal.search_time != minrate) && (Goal.goal_effects & 64)))
			{
				if (APMeetsCriteria (Goal, te))
				{
					Apply_Results (Goal, te, AP, addb);
					gotone = SBAR_GRENS;
				}
			}
			else
			{
				Apply_Results (Goal, te, AP, addb);
				gotone = SBAR_GRENS;
			}
		}
		te = find (te, classname, "player");
	}
	te = find (world, classname, "observer");
	while ((te != world))
	{
		if ((Goal.classname == "item_tfgoal"))
		{
			if ((Goal.netname != string_null))
			{
				CenterPrint3 (te, AP.netname, " took the ", Goal.netname);
			}
		}
		te = find (te, classname, "observer");
	}
	if ((Goal.classname != "item_tfgoal"))
	{
		Goal.goal_state = SBAR_GRENS;
	}
	if ((Goal.goal_result & AS_MISSILE))
	{
		TeamFortress_TeamShowScores (SBAR_GRENS);
		winners = TeamFortress_TeamGetWinner ();
		te = find (world, classname, "player");
		while (te)
		{
			te.takedamage = minrate;
			te.movetype = minrate;
			te.velocity = '0 0 0';
			te.avelocity = '0 0 0';
			te = find (te, classname, "player");
		}
		te = spawn ();
		te.nextthink = (time + 5);
		te.think = execute_changelevel;
		dremove (Goal);
		return;
	}
	DoGroupWork (Goal, AP);
	DoGoalWork (Goal, AP);
	DoTriggerWork (Goal, AP);
	if ((Goal.classname == "info_tfgoal"))
	{
		SetupRespawn (Goal);
	}
};

void () tfgoal_touch =
{
	local entity te;

	if (!(self.goal_activation & SBAR_GRENS))
	{
		return;
	}
	if ((other.classname != "player"))
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if ((self.goal_state == SBAR_GRENS))
	{
		return;
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if (((self.goal_no == AS_MELEE) && (other.team_no == SBAR_GRENS)))
		{
			te = Finditem (SBAR_GRENS);
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return;
			}
		}
		if (((self.goal_no == AS_MISSILE) && (other.team_no == SBAR_PRINT)))
		{
			te = Finditem (SBAR_PRINT);
			if (((te.goal_state == SBAR_GRENS) || (te.origin != te.oldorigin)))
			{
				return;
			}
		}
	}
	AttemptToActivate (self, other, self);
};

void () info_tfgoal_use =
{
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	AttemptToActivate (self, activator, self);
};

void () tfgoal_timer_tick =
{
	if ((self.goal_state != AS_MELEE))
	{
		if (APMeetsCriteria (self, world))
		{
			DoResults (self, world, SBAR_GRENS);
		}
		else
		{
			InactivateGoal (self);
			self.think = tfgoal_timer_tick;
			self.nextthink = (time + self.search_time);
		}
	}
};

void () item_tfgoal_touch =
{
	local string st;
	local entity te;

	if ((other.classname != "player"))
	{
		return;
	}
	if ((other.health <= minrate))
	{
		return;
	}
	if (cb_prematch)
	{
		return;
	}
	if (round_over)
	{
		return;
	}
	if (other.is_feigning)
	{
		return;
	}
	if ((other == self.owner))
	{
		return;
	}
	if ((CTF_Map == SBAR_GRENS))
	{
		if ((self.goal_no == SBAR_GRENS))
		{
			if ((self.origin != self.oldorigin))
			{
				if ((other.team_no == SBAR_GRENS))
				{
					bprint (SBAR_PRINT, other.netname);
					bprint (SBAR_PRINT, " “≈‘’“Œ≈ƒ the ¬Ã’≈ flag!\n");
					te = find (world, classname, "player");
					while ((te != world))
					{
						if ((te.team_no == SBAR_GRENS))
						{
							CenterPrint2 (te, "\n\n\n", "Your flag was “≈‘’“Œ≈ƒ!!");
						}
						else
						{
							CenterPrint2 (te, "\n\n\n", "The ≈Œ≈ÕŸ flag was “≈‘’“Œ≈ƒ!!");
						}
						te = find (te, classname, "player");
					}
					self.goal_state = SBAR_PRINT;
					self.solid = SBAR_GRENS;
					self.touch = item_tfgoal_touch;
					self.origin = self.oldorigin;
					setmodel (self, self.mdl);
					setorigin (self, self.origin);
					sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
					return;
				}
			}
			else
			{
				if ((other.team_no == SBAR_GRENS))
				{
					return;
				}
			}
		}
		else
		{
			if ((self.goal_no == SBAR_PRINT))
			{
				if ((self.origin != self.oldorigin))
				{
					if ((other.team_no == SBAR_PRINT))
					{
						bprint (SBAR_PRINT, other.netname);
						bprint (SBAR_PRINT, " “≈‘’“Œ≈ƒ the “≈ƒ flag!\n");
						te = find (world, classname, "player");
						while ((te != world))
						{
							if ((te.team_no == SBAR_PRINT))
							{
								CenterPrint (te, "\n\n\n Your flag was “≈‘’“Œ≈ƒ!!");
							}
							else
							{
								CenterPrint (te, "\n\n\n The ≈Œ≈ÕŸ flag was “≈‘’“Œ≈ƒ!!");
							}
							te = find (te, classname, "player");
						}
						self.goal_state = SBAR_PRINT;
						self.solid = SBAR_GRENS;
						self.touch = item_tfgoal_touch;
						self.origin = self.oldorigin;
						setmodel (self, self.mdl);
						setorigin (self, self.origin);
						sound (self, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
						return;
					}
				}
				else
				{
					if ((other.team_no == SBAR_PRINT))
					{
						return;
					}
				}
			}
		}
	}
	if (Activated (self, other))
	{
		tfgoalitem_GiveToPlayer (self, other, self);
		if ((other.health > minrate))
		{
			self.goal_state = SBAR_GRENS;
		}
	}
	else
	{
		if ((self.else_goal != minrate))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
	}
};

void (entity Item, entity AP, entity Goal) tfgoalitem_GiveToPlayer =
{
	local string sp;

	Item.owner = AP;
	if ((Item.mdl != string_null))
	{
		setmodel (Item, string_null);
	}
	Item.solid = minrate;
	if ((Item.goal_activation & SBAR_GRENS))
	{
		if ((Item.mdl == "progs/flag.mdl"))
		{
			if ((Item.owned_by == SBAR_GRENS))
			{
				AP.effects = (AP.effects | space);
			}
			else
			{
				if ((Item.owned_by == SBAR_PRINT))
				{
					AP.effects = (AP.effects | SBAR_240);
				}
			}
		}
		AP.effects = (AP.effects | 8);
	}
	if ((Item.goal_activation & SBAR_PRINT))
	{
		TeamFortress_SetSpeed (AP);
	}
	if ((Item.goal_activation & 512))
	{
		if ((Item.owned_by == SBAR_GRENS))
		{
			Item.effects = (Item.effects | 64);
		}
		else
		{
			if ((Item.owned_by == SBAR_PRINT))
			{
				Item.effects = (Item.effects | 128);
			}
			else
			{
				Item.effects = (Item.effects | 8);
			}
		}
	}
	if ((Item.items & 131072))
	{
		AP.items = (AP.items | 131072);
	}
	if ((Item.items & 262144))
	{
		AP.items = (AP.items | 262144);
	}
	if ((Goal != Item))
	{
		if ((Goal.goal_result & 8))
		{
			Item.goal_state = SBAR_GRENS;
			return;
		}
	}
	if (((AP.playerclass == 8) && (Item.goal_result & SBAR_240)))
	{
		AP.is_unabletospy = SBAR_GRENS;
	}
	DoResults (Item, AP, SBAR_GRENS);
	DoItemGroupWork (Item, AP);
};

void () ReturnItem =
{
	local entity te;

	self.enemy.goal_state = SBAR_PRINT;
	if ((self.enemy.classname == "item_tfgoal"))
	{
		if (((self.enemy.goal_activation & 8192) || (toggleflags & SBAR_240)))
		{
			self.enemy.solid = SBAR_PRINT;
		}
		else
		{
			self.enemy.solid = SBAR_GRENS;
		}
	}
	self.flags = (self.flags - (self.flags & 512));
	self.enemy.movetype = minrate;
	self.enemy.touch = item_tfgoal_touch;
	self.enemy.origin = self.enemy.oldorigin;
	if ((self.enemy.mdl != string_null))
	{
		setmodel (self.enemy, self.enemy.mdl);
	}
	setorigin (self.enemy, self.enemy.origin);
	sound (self.enemy, SBAR_PRINT, "items/itembk2.wav", SBAR_GRENS, SBAR_GRENS);
	tfgoalitem_checkgoalreturn (self.enemy);
	if ((self.weapon != SBAR_PRINT))
	{
		if (((self.enemy.noise3 != string_null) || (self.enemy.noise4 != string_null)))
		{
			te = find (world, classname, "player");
			while (te)
			{
				if ((te.team_no == self.enemy.owned_by))
				{
					CenterPrint2 (te, "\n\n\n", self.enemy.noise3);
				}
				else
				{
					CenterPrint2 (te, "\n\n\n", self.enemy.noise4);
				}
				te = find (te, classname, "player");
			}
		}
	}
	dremove (self);
};

void (entity Item, entity AP, float method) tfgoalitem_RemoveFromPlayer =
{
	local entity te;
	local float lighton;
	local float slowon;
	local float key1on;
	local float key2on;
	local float spyoff;
	local string db1;
	local entity DelayReturn;

	if ((Item == world))
	{
		objerror ("error: tfgoalitem_RemoveFromPlayer(): Item == world");
		return;
	}
	lighton = minrate;
	slowon = minrate;
	key1on = minrate;
	key2on = minrate;
	spyoff = minrate;
	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if (((te.owner == AP) && (te != Item)))
		{
			if ((te.goal_activation & SBAR_GRENS))
			{
				lighton = SBAR_GRENS;
			}
			if ((te.goal_activation & SBAR_PRINT))
			{
				slowon = SBAR_GRENS;
			}
			if ((te.items & 131072))
			{
				key1on = SBAR_GRENS;
			}
			if ((te.items & 262144))
			{
				key2on = SBAR_GRENS;
			}
			if ((te.goal_result & SBAR_240))
			{
				spyoff = SBAR_GRENS;
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (!lighton)
	{
		if ((AP.invincible_finished > (time + AS_MELEE)))
		{
			lighton = SBAR_GRENS;
		}
		else
		{
			if ((AP.super_damage_finished > (time + AS_MELEE)))
			{
				lighton = SBAR_GRENS;
			}
		}
	}
	if (!lighton)
	{
		AP.effects = (AP.effects - (AP.effects & 8));
		AP.effects = (AP.effects - (AP.effects & _P));
		AP.effects = (AP.effects - (AP.effects & 160));
	}
	if ((Item.goal_activation & 512))
	{
		if ((Item.owned_by == SBAR_GRENS))
		{
			Item.effects = (Item.effects | 64);
		}
		else
		{
			if ((Item.owned_by == SBAR_PRINT))
			{
				Item.effects = (Item.effects | 128);
			}
			else
			{
				Item.effects = (Item.effects | 8);
			}
		}
	}
	if (!spyoff)
	{
		AP.is_unabletospy = minrate;
	}
	if (!key1on)
	{
		AP.items = (AP.items - (AP.items & 131072));
	}
	if (!key2on)
	{
		AP.items = (AP.items - (AP.items & 262144));
	}
	te = find (world, classname, "player");
	while ((te != world))
	{
		if (IsAffectedBy (Item, te, AP))
		{
			RemoveResults (Item, te);
		}
		te = find (te, classname, "player");
	}
	if (((method == minrate) || (method == SBAR_PRINT)))
	{
		te = find (world, classname, "player");
		while ((te != world))
		{
			if ((te.team_no == Item.owned_by))
			{
				if ((Item.team_drop != string_null))
				{
					CenterPrint2 (te, "\n\n\n", Item.team_drop);
				}
				if ((Item.netname_team_drop != string_null))
				{
					if ((stof (infokey (world, "*bspversion")) == 30))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, " ");
						sprint (te, SBAR_PRINT, Item.netname_team_drop);
						sprint (te, SBAR_PRINT, "\n");
					}
					else
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Item.netname_team_drop);
					}
				}
			}
			else
			{
				if ((Item.non_team_drop != string_null))
				{
					CenterPrint2 (te, "\n\n\n", Item.non_team_drop);
				}
				if ((Item.netname_non_team_drop != string_null))
				{
					if ((stof (infokey (world, "*bspversion")) == 30))
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, " ");
						sprint (te, SBAR_PRINT, Item.netname_non_team_drop);
						sprint (te, SBAR_PRINT, "\n");
					}
					else
					{
						sprint (te, SBAR_PRINT, AP.netname);
						sprint (te, SBAR_PRINT, Item.netname_non_team_drop);
					}
				}
			}
			te = find (te, classname, "player");
		}
		if ((Item.goal_activation & 8))
		{
			DelayReturn = spawn ();
			DelayReturn.enemy = Item;
			if ((method == minrate))
			{
				DelayReturn.weapon = minrate;
			}
			else
			{
				DelayReturn.weapon = SBAR_GRENS;
			}
			DelayReturn.think = ReturnItem;
			DelayReturn.nextthink = (time + 0.5);
		}
		else
		{
			if ((Item.goal_activation & AS_MISSILE))
			{
				if (((method == SBAR_PRINT) && ((Item.goal_activation & 4096) || (toggleflags & 8))))
				{
					tfgoalitem_drop (Item, SBAR_GRENS, AP);
				}
				else
				{
					tfgoalitem_drop (Item, minrate, AP);
				}
			}
			else
			{
				Item.owner = world;
				dremove (Item);
				TeamFortress_SetSpeed (AP);
				return;
			}
		}
		Item.owner = world;
		Item.flags = (Item.flags - (Item.flags & 512));
		setsize (Item, Item.goal_min, Item.goal_max);
		TeamFortress_SetSpeed (AP);
		return;
	}
	else
	{
		if ((method == SBAR_GRENS))
		{
			if ((Item.goal_activation & SBAR_240))
			{
				DelayReturn = spawn ();
				DelayReturn.enemy = Item;
				DelayReturn.weapon = SBAR_PRINT;
				DelayReturn.think = ReturnItem;
				DelayReturn.nextthink = (time + 0.5);
				Item.owner = world;
				TeamFortress_SetSpeed (AP);
				return;
			}
			Item.solid = minrate;
			Item.owner = world;
			TeamFortress_SetSpeed (AP);
			return;
		}
	}
	objerror ("Invalid method passed into tfgoalitem_RemoveFromPlayer\n");
};

void () tfgoalitem_dropthink =
{
	local float pos;
	local string st;

	self.movetype = 6;
	if ((self.pausetime != minrate))
	{
		pos = pointcontents (self.origin);
		if ((pos == -4))
		{
			self.nextthink = (time + (self.pausetime / AS_MISSILE));
		}
		else
		{
			if ((pos == -5))
			{
				self.nextthink = (time + 5);
			}
			else
			{
				if (((pos == -2) || (pos == -6)))
				{
					if ((self.camdist < AS_MELEE))
					{
						self.origin = self.camangle;
						setorigin (self, self.origin);
						self.velocity_z = 400;
						self.velocity_x = (-50 + (random () * _d));
						self.velocity_y = (-50 + (random () * _d));
						self.goal_state = SBAR_PRINT;
						self.movetype = 6;
						if (((self.goal_activation & 8192) || (toggleflags & SBAR_240)))
						{
							self.solid = SBAR_PRINT;
						}
						else
						{
							self.solid = SBAR_GRENS;
						}
						if ((self.mdl != string_null))
						{
							setmodel (self, self.mdl);
						}
						setsize (self, self.goal_min, self.goal_max);
						self.camdist = (self.camdist + SBAR_GRENS);
						self.nextthink = (time + 5);
						self.think = tfgoalitem_dropthink;
						return;
					}
					else
					{
						self.nextthink = (time + SBAR_PRINT);
					}
				}
				else
				{
					self.nextthink = (time + self.pausetime);
				}
			}
		}
		st = infokey (world, "noreturn");
		if ((st != "on"))
		{
			self.think = tfgoalitem_remove;
		}
	}
};

void () tfgoalitem_droptouch =
{
	self.touch = item_tfgoal_touch;
	self.nextthink = (time + 4.25);
	self.think = tfgoalitem_dropthink;
};

void (entity Item, float PAlive, entity P) tfgoalitem_drop =
{
	Item.origin = Item.owner.origin;
	setorigin (Item, Item.origin);
	Item.camangle = (Item.owner.origin - '0 0 8');
	Item.camdist = minrate;
	Item.velocity_z = 400;
	Item.velocity_x = (-50 + (random () * _d));
	Item.velocity_y = (-50 + (random () * _d));
	Item.goal_state = SBAR_PRINT;
	Item.movetype = 6;
	if (((Item.goal_activation & 8192) || (toggleflags & SBAR_240)))
	{
		Item.solid = SBAR_PRINT;
	}
	else
	{
		Item.solid = SBAR_GRENS;
	}
	if ((Item.mdl != string_null))
	{
		setmodel (Item, Item.mdl);
	}
	setsize (Item, Item.goal_min, Item.goal_max);
	Item.owner = P;
	if ((PAlive == SBAR_GRENS))
	{
		makevectors (P.v_angle);
		if (P.v_angle_x)
		{
			Item.velocity = ((v_forward * 400) + (v_up * 200));
		}
		else
		{
			Item.velocity = aim (P, 10000);
			Item.velocity = (Item.velocity * 400);
			Item.velocity_z = 200;
		}
		Item.touch = SUB_Null;
		Item.nextthink = (time + 0.75);
		Item.think = tfgoalitem_droptouch;
	}
	else
	{
		Item.touch = item_tfgoal_touch;
		Item.nextthink = (time + 5);
		Item.think = tfgoalitem_dropthink;
	}
};

void () tfgoalitem_remove =
{
	local entity te;

	if ((self.goal_state == SBAR_GRENS))
	{
		return;
	}
	if ((self.goal_activation & space))
	{
		te = spawn ();
		te.enemy = self;
		te.weapon = AS_MELEE;
		te.nextthink = (time + 0.1);
		te.think = ReturnItem;
		return;
	}
	dremove (self);
};

void (entity Item) tfgoalitem_checkgoalreturn =
{
	local string st;
	local entity te;

	if ((Item.impulse != minrate))
	{
		te = Findgoal (Item.impulse);
		if (te)
		{
			te = Findgoal (Item.impulse);
			if (te)
			{
				AttemptToActivate (te, world, Item);
			}
		}
	}
};

void (entity Goal, entity Player, entity Item) DisplayItemStatus =
{
	if ((Item.goal_state == SBAR_GRENS))
	{
		if (((Goal.team_str_carried != string_null) || (Goal.non_team_str_carried != string_null)))
		{
			if ((Player.team_no == Item.owned_by))
			{
				sprint (Player, SBAR_PRINT, Goal.team_str_carried);
			}
			else
			{
				sprint (Player, SBAR_PRINT, Goal.non_team_str_carried);
			}
			sprint (Player, SBAR_PRINT, " ");
			if ((Player == Item.owner))
			{
				sprint (Player, SBAR_PRINT, "You");
			}
			else
			{
				sprint (Player, SBAR_PRINT, Item.owner.netname);
			}
			sprint (Player, SBAR_PRINT, ".\n");
		}
	}
	else
	{
		if ((Item.origin != Item.oldorigin))
		{
			if (((Goal.team_str_moved != string_null) || (Goal.non_team_str_moved != string_null)))
			{
				if ((Player.team_no == Item.owned_by))
				{
					sprint (Player, SBAR_PRINT, Goal.team_str_moved);
				}
				else
				{
					sprint (Player, SBAR_PRINT, Goal.non_team_str_moved);
				}
				sprint (Player, SBAR_PRINT, "\n");
			}
		}
		else
		{
			if (((Goal.team_str_home != string_null) || (Goal.non_team_str_home != string_null)))
			{
				if ((Player.team_no == Item.owned_by))
				{
					sprint (Player, SBAR_PRINT, Goal.team_str_home);
				}
				else
				{
					sprint (Player, SBAR_PRINT, Goal.non_team_str_home);
				}
				sprint (Player, SBAR_PRINT, "\n");
			}
		}
	}
};

void () info_player_team2 =
{
	CTF_Map = SBAR_GRENS;
	self.classname = "info_player_teamspawn";
	self.team_no = SBAR_PRINT;
	self.goal_effects = SBAR_GRENS;
	self.team_str_home = "ts2";
};

void () info_player_team1 =
{
	CTF_Map = SBAR_GRENS;
	self.classname = "info_player_teamspawn";
	self.team_no = SBAR_GRENS;
	self.goal_effects = SBAR_GRENS;
	self.team_str_home = "ts1";
};

void () item_flag_team1 =
{
	local entity dp;

	CTF_Map = SBAR_GRENS;
	UpdateAbbreviations (self);
	precache_model ("progs/flag.mdl");
	precache_sound ("ogre/ogwake.wav");
	precache_sound ("boss2/pop2.wav");
	self.classname = "item_tfgoal";
	self.netname = "Team 1 Flag";
	self.broadcast = " «œ‘ the enemy team's flag!\n";
	self.deathtype = "You've got the enemy flag!\n";
	self.noise = "ogre/ogwake.wav";
	self.mdl = "progs/flag.mdl";
	self.skin = SBAR_GRENS;
	setmodel (self, self.mdl);
	self.goal_no = SBAR_GRENS;
	self.goal_activation = (((((SBAR_GRENS | AS_MISSILE) | 128) | space) | SBAR_240) | 512);
	self.goal_effects = SBAR_GRENS;
	self.effects = 128;
	self.pausetime = 128;
	self.goal_min = '-16 -16 -24';
	self.goal_max = '16 16 32';
	setsize (self, self.goal_min, self.goal_max);
	self.touch = item_tfgoal_touch;
	self.goal_state = SBAR_PRINT;
	self.solid = SBAR_GRENS;
	setorigin (self, self.origin);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	dp = spawn ();
	dp.origin = self.origin;
	dp.classname = "info_tfgoal";
	dp.goal_activation = SBAR_GRENS;
	dp.team_no = SBAR_GRENS;
	dp.items_allowed = SBAR_PRINT;
	dp.goal_no = AS_MELEE;
	dp.goal_effects = AS_MELEE;
	dp.broadcast = " √¡–‘’“≈ƒ the enemy flag!\n";
	dp.message = "You √¡–‘’“≈ƒ the enemy flag!\n";
	dp.noise = "boss2/pop2.wav";
	dp.goal_result = SBAR_PRINT;
	dp.activate_goal_no = 5;
	dp.axhitme = SBAR_PRINT;
	dp.count = enter;
	dp.frags = enter;
	dp.solid = SBAR_GRENS;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
	dp = spawn ();
	dp.origin = dp.origin;
	dp.classname = "info_tfgoal";
	dp.goal_effects = SBAR_GRENS;
	dp.frags = 5;
	dp.goal_activation = minrate;
	dp.goal_no = 5;
	dp.solid = minrate;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
};

void () item_flag_team2 =
{
	local entity dp;

	CTF_Map = SBAR_GRENS;
	UpdateAbbreviations (self);
	precache_model ("progs/flag.mdl");
	precache_sound ("ogre/ogwake.wav");
	precache_sound ("boss2/pop2.wav");
	self.classname = "item_tfgoal";
	self.netname = "Team 2 Flag";
	self.broadcast = " «œ‘ the enemy team's flag!\n";
	self.deathtype = "You've got the enemy flag!\n";
	self.noise = "ogre/ogwake.wav";
	self.mdl = "progs/flag.mdl";
	setmodel (self, self.mdl);
	self.skin = SBAR_PRINT;
	self.goal_no = SBAR_PRINT;
	self.goal_activation = (((((SBAR_GRENS | AS_MISSILE) | 128) | space) | SBAR_240) | 512);
	self.goal_effects = SBAR_GRENS;
	self.pausetime = 128;
	self.effects = 64;
	self.goal_min = '-16 -16 -24';
	self.goal_max = '16 16 32';
	setsize (self, self.goal_min, self.goal_max);
	self.touch = item_tfgoal_touch;
	self.goal_state = SBAR_PRINT;
	self.solid = SBAR_GRENS;
	setorigin (self, self.origin);
	self.nextthink = (time + 0.2);
	self.think = TF_PlaceItem;
	dp = spawn ();
	dp.origin = self.origin;
	dp.classname = "info_tfgoal";
	dp.goal_activation = SBAR_GRENS;
	dp.team_no = SBAR_PRINT;
	dp.items_allowed = SBAR_GRENS;
	dp.goal_no = AS_MISSILE;
	dp.goal_effects = AS_MELEE;
	dp.broadcast = " √¡–‘’“≈ƒ the enemy flag!\n";
	dp.message = "You √¡–‘’“≈ƒ the enemy flag!\n";
	dp.noise = "boss2/pop2.wav";
	dp.goal_result = SBAR_PRINT;
	dp.activate_goal_no = 6;
	dp.axhitme = SBAR_GRENS;
	dp.count = enter;
	dp.frags = enter;
	dp.solid = SBAR_GRENS;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
	dp = spawn ();
	dp.origin = dp.origin;
	dp.classname = "info_tfgoal";
	dp.goal_effects = SBAR_GRENS;
	dp.frags = 5;
	dp.goal_activation = minrate;
	dp.goal_no = 6;
	dp.solid = minrate;
	dp.goal_state = SBAR_PRINT;
	dp.goal_min = '-16 -16 -24';
	dp.goal_max = '16 16 32';
	setsize (dp, dp.goal_min, dp.goal_max);
	dp.nextthink = (time + 0.2);
	dp.think = TF_PlaceGoal;
};

void () CTF_FlagCheck =
{
	local entity te;
	local float flagcount;
	local float pos;
	local string st;

	flagcount = minrate;
	te = find (world, classname, "item_tfgoal");
	while ((te != world))
	{
		if ((te.goal_no == SBAR_GRENS))
		{
			pos = pointcontents (te.origin);
			if (((pos == -2) || (pos == -6)))
			{
				dprint ("*****BUG*****\nFlag(s) outside world.\n");
				te.nextthink = (time + 0.2);
				te.think = tfgoalitem_remove;
			}
			flagcount = (flagcount + SBAR_GRENS);
		}
		else
		{
			if ((te.goal_no == SBAR_PRINT))
			{
				pos = pointcontents (te.origin);
				if (((pos == -2) || (pos == -6)))
				{
					dprint ("*****BUG*****\nFlag(s) outside world.\n");
					te.nextthink = (time + 0.2);
					te.think = tfgoalitem_remove;
				}
				flagcount = (flagcount + SBAR_GRENS);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
	if (!rounds)
	{
		if ((flagcount != SBAR_PRINT))
		{
			dprint ("*****BUG*****\nFlag(s) missing.\n");
		}
	}
	self.nextthink = (time + 30);
};

void (entity P) ForceRespawn =
{
	local entity spot;
	local entity te;
	local entity oldself;
	local string st;

	oldself = self;
	self = P;
	spot = SelectSpawnPoint ();
	if (self.playerclass)
	{
		spawn_tdeath (spot.origin, self);
	}
	self.observer_list = spot;
	self.origin = (spot.origin + '0 0 1');
	self.angles = spot.angles;
	self.fixangle = SBAR_GRENS;
	if (((spot.classname == "info_player_teamspawn") && !cb_prematch))
	{
		if ((spot.items != minrate))
		{
			te = Finditem (spot.items);
			if (te)
			{
				tfgoalitem_GiveToPlayer (te, self, self);
			}
			if (!(spot.goal_activation & SBAR_GRENS))
			{
				spot.items = minrate;
			}
		}
		if (spot.message)
		{
			CenterPrint (self, spot.message);
			if (!(spot.goal_activation & SBAR_PRINT))
			{
				spot.message = string_null;
			}
		}
		if ((spot.activate_goal_no != minrate))
		{
			te = Findgoal (spot.activate_goal_no);
			if (te)
			{
				AttemptToActivate (te, self, spot);
			}
		}
		if ((spot.goal_effects == SBAR_GRENS))
		{
			spot.classname = "deadpoint";
			spot.team_str_home = string_null;
			spot.nextthink = (time + SBAR_GRENS);
			spot.think = SUB_Remove;
		}
	}
	if ((deathmatch || coop))
	{
		makevectors (self.angles);
		if (self.playerclass)
		{
			spawn_tfog ((self.origin + (v_forward * 20)));
		}
	}
	self = oldself;
};

void () DropGoalItems =
{
	local entity te;

	te = find (world, classname, "item_tfgoal");
	while (te)
	{
		if ((te.owner == self))
		{
			if (((te.goal_activation & 4096) || (toggleflags & 8)))
			{
				tfgoalitem_RemoveFromPlayer (te, self, SBAR_PRINT);
			}
		}
		te = find (te, classname, "item_tfgoal");
	}
};

void () ShowVersion =
{
	sprint (self, SBAR_PRINT, "\n\n‘ËÈÛ†ÈÛ Hue†Team†Fortress ˆÂÚÛÈÔÓ 1.45         ‚˘ Andi\n\n”Â„È·Ï†ÙË·Ó¯†ÙÔ The Brazilian QWTF Community 2017 „ÚÂ·ÙÔÚÛ†ÔÊ Thanks to Mercury and all \n¡Ó‰†ÓÔÓÂ†ÔÙËÂÚ†ÙËÂÓ†ÙËÂ „ÚÂ·ÙÔÚÛ ÔÊ†\n\n Also thank you to ALL of the test dummies :).\n\n\nPlease visit ËÙÙ∫ØØ·ÆÒÁÏÆÔÚÁØÌÂÚ„ıÚ˘Ø for more info. \n\n\n");
};

void () Commands =
{
	sprint (self, SBAR_PRINT, "·‚ÔıÙ...... about the Oztf Mod\nÌÔ‰ÛÙ·ÙıÛ.. current settings\n‚ÚÂ·Î...... vote matchend/stop countdown\nÂÏÂ„Ù...... toggle admin election\n˘ÂÛ........ vote yes for current elective\nÓÔ......... change vote\nÊÏ·ÛË...... toggle flashlight\n");
	if ((self.is_admin == SBAR_GRENS))
	{
		if ((stof (infokey (world, "adminlevel")) > minrate))
		{
			sprint (self, SBAR_PRINT, "\nAdmin Commands:\n\n");
			sprint (self, SBAR_PRINT, "ÙÈÌÂ‰Ô˜Ó... decrease timelimit\nÙÈÌÂı..... increase timelimit\nÌ‰Ô˜Ó..... decrease prematch time\nÌı....... increase prematch time\n„Ê‰Ô˜Ó..... decrease ceasefire time\n„Êı....... increase ceasefire time\nÔÙ‰Ô˜Ó..... decrease overtime\nÔÙı....... increase overtime\nÊÚ·ÁÛ‰Ô˜Ó.. reduce fraglimit\nÊÚ·ÁÛı.... increase fraglimit\nÛÈÏÂÓ„Â.... toggle spectator talk\nÚÂÛÙ·ÚÙÌ·. restart the current map\nÛÙ·ÚÙÌ·Ù„Ë. starts clan match (requires clan mode on)\n");
			if ((stof (infokey (world, "adminlevel")) > SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "ÚÂÛÂÙ...... reset all settings to standard\n„Ï·ÓÛÂÙı.. set clan settings && restart\nÊÏ·ÛËÏÈÁËÙ. (dis)allow flashlight\n„Â·ÛÂÊÈÚÂ.. freeze the gameplay\nÊÚÂÂ˙Â..... (un)freeze the map\nÊ‚ÛÎÈÓÛ.... toggle full bright skins\nÊÚÍıÌ..... toggle forward rocketjump\nÔÈÓÙÈÓÁ... toggle pointing\nÂÓÂÌ˘...... toggle enemy printing\nÁÚÂÓ·„Î... toggle backpacks\nÁÛÂÂ‰..... modify maximum ground speed\nÙ......... modify teamplay\nÁÈ‚Û....... toggle gibs\nÛÁÙ˘Â..... toggle sentry type\nÛÁÊÈÚÂ..... toggle sentry fire\nÈÂ‰ÂÏ·˘.. (dis)allow pipebomb delay\nÛÔÏÈ‰‰ÂÙ... toggle solid detpacks\n");
			}
			if ((stof (infokey (world, "adminlevel")) > SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "‰Â·Ï....... kick a player\nÏÈÛÙÈÛ.... list players ip addresses\n");
			}
			sprint (self, SBAR_PRINT, "\n*** The following commands require a map restart ***\n\n");
			sprint (self, SBAR_PRINT, "ÙÂ·ÌÊÚ·ÁÛ.. toggle teamfrags\nÊıÏÏÙÛ..... toggle full team score\nÁÚ·ÏÂ.... toggle grapple\n");
			if ((stof (infokey (world, "adminlevel")) > SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "„Ï·Ó....... toggle clan mode\nÙÊˆÛ‰Ì..... toggle tfvsdm mode\nÙÊÛÙÚÈÎÂ... toggle tfstrike mode\nÚÔıÓ‰Û..... toggle rounds\n‰ıÂÏ....... toggle duel mode\nÛÂÂ‰„·... toggle speed capture mode\nËÈÁËÏ·Ó‰ÂÚ. toggle highlander mode\nÚ·„ÙÈ„Â... toggle practice mode\n");
			}
		}
	}
	if ((self.is_admin == AS_MELEE))
	{
		sprint (self, SBAR_PRINT, "\nAdmin Commands:\n\n");
		sprint (self, SBAR_PRINT, "ÙÈÌÂ‰Ô˜Ó... decrease timelimit\nÙÈÌÂı..... increase timelimit\nÌ‰Ô˜Ó..... decrease prematch time\nÌı....... increase prematch time\n„Ê‰Ô˜Ó..... decrease ceasefire time\n„Êı....... increase ceasefire time\nÔÙ‰Ô˜Ó..... decrease overtime\nÔÙı....... increase overtime\nÊÚ·ÁÛ‰Ô˜Ó.. reduce fraglimit\nÊÚ·ÁÛı.... increase fraglimit\nÛÈÏÂÓ„Â.... toggle spectator talk\nÚÂÛÙ·ÚÙÌ·. restart the current map\nÛÙ·ÚÙÌ·Ù„Ë. starts clan match (requires clan mode on)\nÚÂÛÂÙ...... reset all settings to standard\n„Ï·ÓÛÂÙı.. set clan settings && restart\n");
		sprint (self, SBAR_PRINT, "ÊÏ·ÛËÏÈÁËÙ. (dis)allow flashlight\n„Â·ÛÂÊÈÚÂ.. freeze the gameplay\nÊÚÂÂ˙Â..... (un)freeze the map\nÊ‚ÛÎÈÓÛ.... toggle full bright skins\nÊÚÍıÌ..... toggle forward rocketjump\nÔÈÓÙÈÓÁ... toggle pointing\nÂÓÂÌ˘...... toggle enemy printing\nÁÚÂÓ·„Î... toggle backpacks\nÁÛÂÂ‰..... modify maximum ground speed\nÙ......... modify teamplay\nÁÈ‚Û....... toggle gibs\nÛÁÙ˘Â..... toggle sentry type\nÛÁÊÈÚÂ..... toggle sentry fire\nÈÂ‰ÂÏ·˘.. (dis)allow pipebomb delay\nÛÔÏÈ‰‰ÂÙ... toggle solid detpacks\n");
		sprint (self, SBAR_PRINT, "‰Â·Ï....... kick a player\nÏÈÛÙÈÛ.... list players ip addresses\n");
		sprint (self, SBAR_PRINT, "\n*** The following commands require a map restart ***\n\n");
		sprint (self, SBAR_PRINT, "„Ï·Ó....... toggle clan mode\nÙÊˆÛ‰Ì..... toggle tfvsdm mode\nÙÊÛÙÚÈÎÂ... toggle tfstrike mode\nÙÂ·ÌÊÚ·ÁÛ.. toggle teamfrags\nÊıÏÏÙÛ..... toggle full team score\nÁÚ·ÏÂ.... toggle grapple\n");
		sprint (self, SBAR_PRINT, "ËÈÁËÏ·Ó‰ÂÚ. toggle highlander mode\nÚÔıÓ‰Û..... toggle rounds\n‰ıÂÏ....... toggle duel mode\nÛÂÂ‰„·... toggle speed capture mode\nÚ·„ÙÈ„Â... toggle practice mode\n");
	}
};

void (entity print) ShowFrags =
{
	local entity te;
	local float eff;
	local float ifrags;
	local string st;

	sprint (print, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	sprint (print, SBAR_PRINT, " Frags  TK's  Deaths  Eff  Name\n");
	sprint (print, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	te = find (world, classname, "player");
	while (te)
	{
		if ((te.real_frags <= minrate))
		{
			eff = minrate;
		}
		else
		{
			eff = ((te.real_frags / (te.real_frags + te.deaths)) * _d);
			eff = rint (eff);
		}
		st = ftos (te.real_frags);
		if ((te.real_frags < enter))
		{
			sprint3 (print, SBAR_PRINT, "  ", st, "     ");
		}
		else
		{
			if ((te.real_frags < _d))
			{
				sprint3 (print, SBAR_PRINT, "  ", st, "    ");
			}
			else
			{
				sprint3 (print, SBAR_PRINT, "  ", st, "   ");
			}
		}
		st = ftos (te.teamkills);
		if ((te.teamkills < enter))
		{
			sprint2 (print, SBAR_PRINT, st, "      ");
		}
		else
		{
			if ((te.teamkills < _d))
			{
				sprint2 (print, SBAR_PRINT, st, "     ");
			}
			else
			{
				sprint2 (print, SBAR_PRINT, st, "     ");
			}
		}
		st = ftos (te.deaths);
		if ((te.deaths < enter))
		{
			sprint2 (print, SBAR_PRINT, st, "      ");
		}
		else
		{
			if ((te.deaths < _d))
			{
				sprint2 (print, SBAR_PRINT, st, "     ");
			}
			else
			{
				sprint2 (print, SBAR_PRINT, st, "     ");
			}
		}
		st = ftos (eff);
		if ((eff < enter))
		{
			sprint2 (print, SBAR_PRINT, st, "     ");
		}
		else
		{
			if ((eff < _d))
			{
				sprint2 (print, SBAR_PRINT, st, "    ");
			}
			else
			{
				sprint2 (print, SBAR_PRINT, st, "   ");
			}
		}
		sprint2 (print, SBAR_PRINT, te.netname, "\n");
		te = find (te, classname, "player");
	}
	if ((number_of_teams == SBAR_PRINT))
	{
		sprint (print, SBAR_PRINT, "\nùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
		sprint (print, SBAR_PRINT, " Team Scores:\n Team1:   ");
		st = ftos (team1score);
		sprint2 (print, SBAR_PRINT, st, "     Team2:   ");
		st = ftos (team2score);
		sprint2 (print, SBAR_PRINT, st, "\n");
	}
	else
	{
		sprint (print, SBAR_PRINT, "\nùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
		sprint (print, SBAR_PRINT, " Team Scores:\n Team1:   ");
		st = ftos (team1score);
		sprint2 (print, SBAR_PRINT, st, "     Team2:   ");
		st = ftos (team2score);
		sprint2 (print, SBAR_PRINT, st, "\n Team3:   ");
		st = ftos (team3score);
		sprint2 (print, SBAR_PRINT, st, "     Team4:   ");
		st = ftos (team4score);
		sprint2 (print, SBAR_PRINT, st, "\n");
	}
	sprint (print, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
};

void () ShowFps =
{
	local entity te;
	local float r;
	local float fps;
	local string st;

	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	sprint (self, SBAR_PRINT, " Fps    Speed       Name\n");
	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	te = find (world, classname, "player");
	while (te)
	{
		fps = floor ((1000 / ((te.fAverageFrameTime / te.fFrameCount) * 1000)));
		st = ftos (fps);
		sprint3 (self, SBAR_PRINT, " ", st, "     ");
		r = fabs (((te.fAverageFrameTime * _d) / (time - te.real_time)));
		st = ftos (r);
		sprint2 (self, SBAR_PRINT, st, "%       ");
		sprint2 (self, SBAR_PRINT, te.netname, "\n");
		te = find (te, classname, "player");
	}
	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
};

void () ShowStats =
{
	local string st;
	local float eff;

	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	sprint3 (self, SBAR_PRINT, " ", self.netname, "'s Statistics\n");
	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
	if (self.enemy)
	{
		sprint3 (self, SBAR_PRINT, " Last enemy: ", self.enemy.netname, "\n");
	}
	st = ftos (self.real_frags);
	sprint3 (self, SBAR_PRINT, " Frags:      ", st, "\n");
	st = ftos (self.deaths);
	sprint3 (self, SBAR_PRINT, " Deaths:     ", st, "\n");
	st = ftos (self.deaths);
	sprint3 (self, SBAR_PRINT, " Teamkills:  ", st, "\n");
	if ((self.real_frags <= minrate))
	{
		eff = minrate;
	}
	else
	{
		eff = ((self.real_frags / (self.real_frags + self.deaths)) * _d);
		eff = rint (eff);
	}
	st = ftos (eff);
	sprint3 (self, SBAR_PRINT, " Efficiency: ", st, "\n\n");
	st = ftos (rint (self.dmg_inflicted));
	sprint3 (self, SBAR_PRINT, " Damage given:  ", st, "\n");
	st = ftos (rint (self.dmg_recieved));
	sprint3 (self, SBAR_PRINT, " Damage taken:  ", st, "\n");
	st = ftos (rint (self.dmg_self));
	sprint3 (self, SBAR_PRINT, " Damage self:   ", st, "\n");
	st = ftos (rint (self.dmg_team));
	sprint3 (self, SBAR_PRINT, " Damage team:   ", st, "\n");
	sprint (self, SBAR_PRINT, "ùûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûü\n");
};

void () ModStatus =
{
	local string tmp;
	local float f1;

	tmp = ftos (teamplay);
	sprint3 (self, SBAR_PRINT, "‘Â·ÌÏ·˘        ", tmp, "\n");
	tmp = ftos ((timelimit / SBAR_600));
	sprint3 (self, SBAR_PRINT, "‘ÈÌÂÏÈÌÈÙ       ", tmp, "  ");
	if ((timelimit < enter))
	{
		sprint (self, SBAR_PRINT, " ");
	}
	tmp = ftos (fraglimit);
	sprint3 (self, SBAR_PRINT, "\n∆Ú·ÁÏÈÌÈÙ       ", tmp, "\n");
	if (clanbattle)
	{
		sprint3 (self, SBAR_PRINT, "Clan Mode       ", tmp, "\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Clan Mode       off\n");
	}
	tmp = infokey (world, "overtime");
	if (stof (tmp))
	{
		sprint3 (self, SBAR_PRINT, "Overtime        ", tmp, "\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Overtime        off\n");
	}
	tmp = infokey (world, "teamfrags");
	if ((tmp == "on"))
	{
		sprint3 (self, SBAR_PRINT, "Teamfrags       ", tmp, "\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Teamfrags       off\n");
	}
	tmp = infokey (world, "fullteamscore");
	if ((tmp == "on"))
	{
		sprint3 (self, SBAR_PRINT, "Full Team Score ", tmp, "\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Full Team Score off\n");
	}
	tmp = ftos (gspeed);
	sprint (self, SBAR_PRINT, "Ground speed    ", tmp, "\n");
	if (tfvsdm)
	{
		sprint (self, SBAR_PRINT, "‘∆ˆÛƒÕ:         on\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "‘∆ˆÛƒÕ:         off\n");
	}
	if (tfstrike)
	{
		sprint (self, SBAR_PRINT, "TFStrike:       on\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "TFStrike:       off\n");
	}
	if (allow_grenpack)
	{
		sprint (self, SBAR_PRINT, "Gren Backpacks: on\n");
	}
	if (pipedelay)
	{
		sprint (self, SBAR_PRINT, "Pipebomb Delay: on\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Pipebomb Delay: off\n");
	}
	tmp = infokey (world, "gibs");
	if ((tmp == "off"))
	{
		sprint3 (self, SBAR_PRINT, "Player Gibs     ", tmp, " \n");
	}
	if (allow_hook)
	{
		sprint (self, SBAR_PRINT, "Grapple:        on\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Grapple:        off\n");
	}
	if (allow_flash)
	{
		sprint (self, SBAR_PRINT, "Flash light:    on\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "Flash light:    off\n");
	}
	if (!sentry_fire)
	{
		sprint (self, SBAR_PRINT, "Sentry Fire: Normal\n");
	}
	else
	{
		if ((sentry_fire == SBAR_GRENS))
		{
			sprint (self, SBAR_PRINT, "Sentry Fire: Lightning\n");
		}
		else
		{
			if ((sentry_fire == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "Sentry Fire: Laser\n");
			}
		}
	}
	tmp = infokey (world, "highlander");
	if ((tmp == "on"))
	{
		sprint (self, SBAR_PRINT, "Highlander mode on\n");
	}
	if (duel)
	{
		sprint (self, SBAR_PRINT, "Duel mode:      on\n");
	}
	if (speedcap)
	{
		sprint (self, SBAR_PRINT, "Speed capture:  on\n");
	}
	if (practice)
	{
		sprint (self, SBAR_PRINT, "Practice:       on\n");
	}
	if ((rounds < minrate))
	{
		sprint (self, SBAR_PRINT, "Rounds:         on\n");
	}
	else
	{
		if ((rounds > SBAR_GRENS))
		{
			tmp = ftos (rounds);
			sprint3 (self, SBAR_PRINT, "Rounds:        ", tmp, "\n");
		}
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 256))
	{
		sprint (self, SBAR_PRINT, "ÊıÏÏ‚ÚÈÁËÙ ÛÎÈÓÛ disabled\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "ÊıÏÏ‚ÚÈÁËÙ ÛÎÈÓÛ enabled\n");
	}
	f1 = stof (infokey (world, "fpd"));
	if ((f1 & 128))
	{
		sprint (self, SBAR_PRINT, "ÔÈÓÙÈÓÁ disabled\n");
	}
	else
	{
		sprint (self, SBAR_PRINT, "ÔÈÓÙÈÓÁ enabled\n");
	}
	if (elect)
	{
		tmp = ftos (elect);
		sprint3 (self, SBAR_PRINT, "\nElection in progress\nê", tmp, "ë votes received\n");
	}
};

void (float t) TimeDown =
{
	local string tmp;
	local float lowest;
	local float tl;

	lowest = minrate;
	tl = ((timelimit / SBAR_600) - t);
	if ((tl < SBAR_GRENS))
	{
		tl = lowest;
	}
	tmp = ftos (tl);
	bprint3 (SBAR_PRINT, "Õ·Ù„Ë ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	timelimit = (tl * SBAR_600);
	cvar_set ("timelimit", tmp);
};

void (float t) TimeUp =
{
	local string tmp;
	local float highest;
	local float tl;

	highest = _F;
	tl = ((timelimit / SBAR_600) + t);
	if ((tl > highest))
	{
		tl = highest;
	}
	tmp = ftos (tl);
	bprint3 (SBAR_PRINT, "Õ·Ù„Ë ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	timelimit = (tl * SBAR_600);
	cvar_set ("timelimit", tmp);
};

void (float t) PmTimeDown =
{
	local string tmp;
	local float lowest;
	local float pm;

	lowest = minrate;
	tmp = infokey (world, "prematch");
	pm = (stof (tmp) - t);
	if ((pm < lowest))
	{
		pm = lowest;
	}
	tmp = ftos (pm);
	bprint3 (SBAR_PRINT, "Prematch ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo prematch ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) PmTimeUp =
{
	local string tmp;
	local float highest;
	local float pm;

	highest = 15;
	tmp = infokey (world, "prematch");
	pm = stof (tmp);
	pm = (pm + t);
	if ((pm > highest))
	{
		pm = highest;
	}
	tmp = ftos (pm);
	bprint3 (SBAR_PRINT, "Prematch ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo prematch ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) CFTimeDown =
{
	local string tmp;
	local float lowest;
	local float cft;

	lowest = minrate;
	tmp = infokey (world, "cft");
	cft = (stof (tmp) - t);
	if ((cft < lowest))
	{
		cft = lowest;
	}
	tmp = ftos (cft);
	bprint3 (SBAR_PRINT, "Ceasefire time ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo cft ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) CFTimeUp =
{
	local string tmp;
	local float highest;
	local float cft;

	highest = 15;
	tmp = infokey (world, "cft");
	cft = stof (tmp);
	cft = (cft + t);
	if ((cft > highest))
	{
		cft = highest;
	}
	tmp = ftos (cft);
	bprint3 (SBAR_PRINT, "Ceasefire time ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo cft ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) OverTimeDown =
{
	local string tmp;
	local float lowest;
	local float ot;

	lowest = minrate;
	tmp = infokey (world, "overtime");
	ot = (stof (tmp) - t);
	if ((ot < lowest))
	{
		ot = lowest;
	}
	tmp = ftos (ot);
	bprint3 (SBAR_PRINT, "Overtime ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo overtime ");
	localcmd (tmp);
	localcmd ("\n");
};

void (float t) OverTimeUp =
{
	local string tmp;
	local float highest;
	local float ot;

	highest = enter;
	tmp = infokey (world, "overtime");
	ot = stof (tmp);
	ot = (ot + t);
	if ((ot > highest))
	{
		ot = highest;
	}
	tmp = ftos (ot);
	bprint3 (SBAR_PRINT, "Overtime ÏÂÓÁÙË ÛÂÙ ÙÔ ", tmp, " ÌÈÓıÙÂÛ\n");
	localcmd ("localinfo overtime ");
	localcmd (tmp);
	localcmd ("\n");
};

void () FragsDown =
{
	local string tmp;

	fraglimit = (fraglimit - enter);
	if ((fraglimit < minrate))
	{
		fraglimit = minrate;
	}
	tmp = ftos (fraglimit);
	bprint3 (SBAR_PRINT, "∆Ú·ÁÏÈÌÈÙ ÛÂÙ ÙÔ ", tmp, "\n");
	cvar_set ("fraglimit", tmp);
};

void () FragsUp =
{
	local string tmp;

	fraglimit = (fraglimit + enter);
	tmp = ftos (fraglimit);
	bprint3 (SBAR_PRINT, "∆Ú·ÁÏÈÌÈÙ ÛÂÙ ÙÔ ", tmp, "\n");
	cvar_set ("fraglimit", tmp);
};

void () ChangeTP =
{
	local string tmp;
	local string desc;

	if ((teamplay == SBAR_GRENS))
	{
		teamplay = SBAR_200;
		tmp = "11?TeamFortress";
		desc = "Team-members inflict half damamge.\n";
	}
	else
	{
		if ((teamplay == SBAR_200))
		{
			teamplay = 13;
			tmp = "13?TeamFortress";
			desc = "Team-members take half damage from area effects, No damage from direct fire.\n";
		}
		else
		{
			if ((teamplay == 13))
			{
				teamplay = 19;
				tmp = "19?TeamFortress";
				desc = "Team-members take half damage from direct fire.\n";
			}
			else
			{
				if ((teamplay == 19))
				{
					teamplay = 21;
					tmp = "21?TeamFortress";
					desc = "Team-members inflicts armor damage only.\n";
				}
				else
				{
					if ((teamplay == 21))
					{
						teamplay = 641;
						tmp = "641?TeamFortress";
						desc = "Team-members inflict half damage to armor.\n";
					}
					else
					{
						if ((teamplay == 641))
						{
							teamplay = 1301;
							tmp = "1301?TeamFortress";
							desc = "Team-members inflict no damage.\n";
						}
						else
						{
							if ((teamplay == 1301))
							{
								teamplay = 10241;
								tmp = "10241?TeamFortress";
								desc = "Team-members take half mirror damage.\n";
							}
							else
							{
								if ((teamplay == 10241))
								{
									teamplay = 20481;
									tmp = "20481?TeamFortress";
									desc = "Team-members take full mirror damage.\n";
								}
								else
								{
									teamplay = SBAR_GRENS;
									tmp = "1?TeamFortress";
									desc = "Teamplay On\n";
								}
							}
						}
					}
				}
			}
		}
	}
	cvar_set ("teamplay", tmp);
	ftos (teamplay);
	bprint3 (SBAR_PRINT, "Teamplay set to: ", ftos (teamplay), " - ");
	bprint (SBAR_PRINT, desc);
};

void () ClanMode =
{
	local string st;

	st = infokey (world, "clan");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo clan off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo clan on\n");
		bprint (SBAR_PRINT, "Map Restart needed to take affect!\n");
	}
	bprint3 (SBAR_PRINT, "Clan Mode set to ", st, "\n");
};

void () RestartMap =
{
	localcmd ("map ");
	localcmd (mapname);
	localcmd ("\n");
};

void () ToggleSpecTalk =
{
	local float tmp;
	local float tmp2;
	local string s1;

	tmp2 = stof (infokey (world, "fpd"));
	tmp2 = (tmp2 - (tmp2 & 64));
	tmp = stof (infokey (world, "spectalk"));
	bprint (SBAR_PRINT, "Spectalk ");
	if ((tmp != minrate))
	{
		localcmd ("sv_spectalk 0\nserverinfo fpd ");
		tmp2 = (tmp2 + 64);
		s1 = ftos (tmp2);
		localcmd (s1);
		localcmd ("\nlocalinfo spectalk 0\n");
		bprint (SBAR_PRINT, "off: Ï·˘ÂÚÛ „·Ó ÓÔ ÏÔÓÁÂÚ ËÂ·Ú ÛÂ„Ù·ÙÔÚÛ\n");
		return;
	}
	localcmd ("sv_spectalk 1\nserverinfo fpd ");
	s1 = ftos (tmp2);
	localcmd (s1);
	localcmd ("\nlocalinfo spectalk 1\n");
	bprint (SBAR_PRINT, "on: Ï·˘ÂÚÛ „·Ó ÓÔ˜ ËÂ·Ú ÛÂ„Ù·ÙÔÚÛ\n");
	return;
};

void () GroundSpeed =
{
	local string tmp;
	local string desc;

	if ((gspeed == minrate))
	{
		gspeed = SBAR_GRENS;
		desc = "Maximum Ground Speed set to maximum Class Speed.";
	}
	else
	{
		if ((gspeed == SBAR_GRENS))
		{
			gspeed = 1.25;
			desc = "Maximum Ground Speed set to 1.25 times the maximum Class Speed.";
		}
		else
		{
			if ((gspeed == 1.25))
			{
				gspeed = 1.5;
				desc = "Maximum Ground Speed set to 1.5 times the maximum Class Speed.";
			}
			else
			{
				if ((gspeed == 1.5))
				{
					gspeed = 1.75;
					desc = "Maximum Ground Speed set to 1.75 times the maximum Class Speed.";
				}
				else
				{
					if ((gspeed == 1.75))
					{
						gspeed = SBAR_PRINT;
						desc = "Maximum Ground Speed set to 2 times the maximum Class Speed.";
					}
					else
					{
						gspeed = minrate;
						desc = "Ground Speed Normal.";
					}
				}
			}
		}
	}
	bprint3 (SBAR_PRINT, desc, "\n");
	localcmd ("localinfo gspeed ");
	localcmd (ftos (gspeed));
	localcmd ("\n");
};

void () ToggleFreeze =
{
	if ((freeze == minrate))
	{
		freeze = SBAR_GRENS;
		localcmd ("localinfo freeze on\n");
		bprint2 (SBAR_PRINT, self.netname, " freezes map\n");
	}
	else
	{
		freeze = minrate;
		localcmd ("localinfo freeze off\n");
		bprint2 (SBAR_PRINT, self.netname, " unfreezes map\n");
	}
};

void () Toggle_TFvsDM =
{
	local string st;

	st = infokey (world, "tfvsdm");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo tfvsdm off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo tfvsdm on\n");
	}
	bprint3 (SBAR_PRINT, "TFvsDM Mode set to ", st, "\n");
};

void () Toggle_SpeedCap =
{
	local string st;

	st = infokey (world, "speedcap");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo speedcap off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo speedcap on\n");
	}
	bprint3 (SBAR_PRINT, "Speed Capture Mode set to ", st, "\n");
};

void () Toggle_Practice =
{
	local string st;

	st = infokey (world, "practice");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo practice off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo practice on\n");
	}
	bprint3 (SBAR_PRINT, "Practice Mode set to ", st, "\n");
};

void () Toggle_TFStrike =
{
	local string st;

	st = infokey (world, "tfstrike");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo tfstrike off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo tfstrike on\n");
	}
	bprint3 (SBAR_PRINT, "TFStrike Mode set to ", st, "\n");
};

void () Toggle_Duel =
{
	local string st;

	st = infokey (world, "duel");
	if ((st == "on"))
	{
		st = "off";
		localcmd ("localinfo duel off\n");
	}
	else
	{
		st = "on";
		localcmd ("localinfo duel on\n");
	}
	bprint3 (SBAR_PRINT, "Duel Mode set to ", st, "\n");
};

void () Toggle_Rounds =
{
	local string st;

	st = infokey (world, "rounds");
	if ((st == "off"))
	{
		st = "on";
		localcmd ("localinfo rounds on\n");
	}
	else
	{
		st = "off";
		localcmd ("localinfo rounds off\n");
	}
	bprint3 (SBAR_PRINT, "Rounds set to ", st, "\n");
};

void () ToggleFlash =
{
	local string st;

	st = infokey (world, "flashlight");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo flashlight ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Flash light set to ", st, " \n");
};

void () Check_illclasses =
{
	local string st;

	st = infokey (world, "cr_scout");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_scout 0\n");
	}
	st = infokey (world, "cr_sniper ");
	st = infokey (world, "cr_soldier");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_soldier 0\n");
	}
	st = infokey (world, "cr_demoman");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_demoman 0\n");
	}
	st = infokey (world, "cr_medic");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_medic 0\n");
	}
	st = infokey (world, "cr_hwguy");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_hwguy 0\n");
	}
	st = infokey (world, "cr_pyro");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_pyro 0\n");
	}
	st = infokey (world, "cr_spy");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_spy 0\n");
	}
	st = infokey (world, "cr_engineer");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_engineer 0\n");
	}
	st = infokey (world, "cr_random");
	if ((stof (st) == SBAR_GRENS))
	{
		localcmd ("localinfo cr_random 0\n");
	}
};

void () ResetSetup =
{
	cvar_set ("teamplay", "21?TeamFortress");
	cvar_set ("timelimit", "40");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo tfvsdm off\n");
	localcmd ("localinfo clan off\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	Check_illclasses ();
	RestartMap ();
};

void () ClanSetup =
{
	local float f1;

	cvar_set ("teamplay", "1?TeamFortress");
	cvar_set ("timelimit", "35");
	localcmd ("localinfo prematch 3\n");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo clan on\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	Check_illclasses ();
	f1 = stof (infokey (world, "fpd"));
	if (!(f1 & 256))
	{
		localcmd ("serverinfo fpd ");
		f1 = (f1 | 256);
		localcmd (ftos (f1));
		localcmd ("\n");
	}
	localcmd ("serverinfo fbskins 0\n");
	RestartMap ();
};

void () Toggle_Quad =
{
	cvar_set ("teamplay", "1?TeamFortress");
	cvar_set ("timelimit", "10");
	localcmd ("localinfo prematch 2\n");
	localcmd ("localinfo sentrytype 0\n");
	localcmd ("localinfo pipedelay on\n");
	localcmd ("localinfo clan on\n");
	localcmd ("localinfo teamfrags on\n");
	localcmd ("localinfo fullteamscore off\n");
	localcmd ("localinfo grapple off\n");
	localcmd ("localinfo flashlight off\n");
	localcmd ("localinfo rounds off\n");
	localcmd ("localinfo duel off\n");
	localcmd ("localinfo speedcap off\n");
	localcmd ("localinfo cr_soldier 1\n");
	RestartMap ();
};

void () Toggle_Teamfrags =
{
	local string st;

	st = infokey (world, "teamfrags");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo teamfrags ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Teamfrags set to ", st, " \n");
};

void () Toggle_Fullts =
{
	local string st;

	st = infokey (world, "fullteamscore");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo fullteamscore ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Full Team Score set to ", st, " \n");
};

void () Toggle_Grapple =
{
	local string st;

	st = infokey (world, "grapple");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo grapple ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Grapple set to ", st, " \n");
};

void () TogglePointing =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 128));
	if ((f1 & 128))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "ÔÈÓÙÈÓÁ enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 128);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "ÔÈÓÙÈÓÁ disabled\n");
	}
};

void () ToggleEnemy =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & space));
	if ((f1 & space))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "enemy reporting allowed\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + space);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "enemy reporting disallowed\n");
	}
};

void () ToggleFbskins =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 256));
	if ((f1 & 256))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		localcmd ("serverinfo fbskins 1\n");
		bprint (SBAR_PRINT, "Fullbright skins enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 256);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		localcmd ("serverinfo fbskins 0\n");
		bprint (SBAR_PRINT, "Fullbright skins disabled\n");
	}
};

void () Toggle_Frj =
{
	local float f1;
	local float f2;
	local string s1;

	f1 = stof (infokey (world, "fpd"));
	f2 = (f1 - (f1 & 32768));
	if ((f1 & 32768))
	{
		localcmd ("serverinfo fpd ");
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "Forward Rocketjump enabled\n");
		return;
	}
	else
	{
		localcmd ("serverinfo fpd ");
		f2 = (f2 + 32768);
		s1 = ftos (f2);
		localcmd (s1);
		localcmd ("\n");
		bprint (SBAR_PRINT, "Forward Rocketjump disabled\n");
	}
};

void () Toggle_flag_emu =
{
	local string st;
	local float fl;

	fl = stof (infokey (world, "flag_model"));
	if ((fl == minrate))
	{
		fl = SBAR_GRENS;
		st = "TF Flag.";
	}
	else
	{
		if ((fl == SBAR_GRENS))
		{
			fl = SBAR_PRINT;
			st = "TF Standard.";
		}
		else
		{
			if ((fl == SBAR_PRINT))
			{
				fl = AS_MELEE;
				st = "CTF Flag.";
			}
			else
			{
				fl = minrate;
				st = "Map default.";
			}
		}
	}
	localcmd ("localinfo flag_model ");
	localcmd (ftos (fl));
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Goal Item model set to ", st, " \n");
};

void () Toggle_Grenpacks =
{
	local string st;

	st = infokey (world, "grenpacks");
	if ((st == "on"))
	{
		st = "off";
		allow_grenpack = minrate;
		bprint (SBAR_PRINT, "Backpacks Normal.\n");
	}
	else
	{
		st = "on";
		allow_grenpack = SBAR_GRENS;
		bprint (SBAR_PRINT, "Backpacks now Include Grenades / Detpack.\n");
	}
	localcmd ("localinfo grenpacks ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_Gibs =
{
	local string st;

	st = infokey (world, "gibs");
	if ((st == "off"))
	{
		st = "on";
	}
	else
	{
		st = "off";
	}
	localcmd ("localinfo gibs ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Gibs set to ", st, " \n");
};

void () Toggle_Highlander =
{
	local string st;

	st = infokey (world, "highlander");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo highlander ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Highlander mode set to ", st, " \n");
};

void () Toggle_SentryType =
{
	local string st;
	local float fl;

	if ((sgtype == minrate))
	{
		sgtype = SBAR_GRENS;
		bprint (SBAR_PRINT, "Sentries Special (Oztf).\n");
	}
	else
	{
		sgtype = minrate;
		bprint (SBAR_PRINT, "Sentries Normal (TF 2.9).\n");
	}
	st = ftos (sgtype);
	localcmd ("localinfo sentrytype ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_GrenType =
{
	local string st;
	local float fl;

	if ((grentype == minrate))
	{
		grentype = SBAR_GRENS;
		bprint (SBAR_PRINT, "Grenades Special (Oztf).\n");
	}
	else
	{
		grentype = minrate;
		bprint (SBAR_PRINT, "Grenades Normal (TF 2.9).\n");
	}
	st = ftos (grentype);
	localcmd ("localinfo grentype ");
	localcmd (st);
	localcmd ("\n");
};

void () Toggle_SentryFire =
{
	local string st;
	local float fl;

	if (!sgtype)
	{
		if ((self == world))
		{
			dprint ("Sentry type is currently Normal. Change sentry type to enable firing mode.\n");
		}
		else
		{
			sprint (self, SBAR_PRINT, "Sentry type is currently Normal. Change sentry type to enable firing mode.\n");
		}
		return;
	}
	st = infokey (world, "sentryfire");
	fl = stof (st);
	if (((fl < SBAR_GRENS) || (fl > SBAR_PRINT)))
	{
		st = "Lightning";
		sentry_fire = SBAR_GRENS;
	}
	else
	{
		if ((fl == SBAR_GRENS))
		{
			st = "Laser";
			sentry_fire = SBAR_PRINT;
		}
		else
		{
			st = "Normal";
			sentry_fire = minrate;
		}
	}
	localcmd ("localinfo sentryfire ");
	localcmd (ftos (sentry_fire));
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Sentry Fire set to ", st, " \n");
};

void () Toggle_PipeDelay =
{
	local string st;

	st = infokey (world, "pipedelay");
	if ((st == "off"))
	{
		st = "on";
		pipedelay = SBAR_GRENS;
	}
	else
	{
		st = "off";
		pipedelay = minrate;
	}
	localcmd ("localinfo pipedelay ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Demoman Pipebomb Delay set to ", st, " \n");
};

void () Toggle_Detpack =
{
	local string st;

	st = infokey (world, "soliddet");
	if ((st == "on"))
	{
		st = "off";
	}
	else
	{
		st = "on";
	}
	localcmd ("localinfo soliddet ");
	localcmd (st);
	localcmd ("\n");
	bprint3 (SBAR_PRINT, "Solid Detpacks ÛÂÙ ÙÔ ", st, " \n");
};

void () Toggle_Lighting =
{
	if (lights)
	{
		Deluminate ();
	}
	else
	{
		Eluminate ();
	}
};

void (entity rhook) Reset_Grapple =
{
	sound (rhook.owner, SBAR_GRENS, "weapons/bounce.wav", SBAR_GRENS, minrate);
	rhook.owner.on_hook = minrate;
	rhook.owner.hook_out = minrate;
	rhook.owner.fire_held_down = minrate;
	rhook.owner.weaponframe = minrate;
	rhook.think = SUB_Remove;
	rhook.nextthink = time;
};

void () Grapple_Track =
{
	local vector spray;

	if ((!self.owner.on_hook || (self.owner.health <= minrate)))
	{
		Reset_Grapple (self);
		return;
	}
	if ((self.enemy.classname != "player"))
	{
		self.velocity = self.enemy.velocity;
	}
	self.nextthink = (time + 0.1);
};

entity () MakeLink =
{
	newmis = spawn ();
	newmis.movetype = 9;
	newmis.solid = minrate;
	newmis.owner = self;
	newmis.avelocity = '200 200 200';
	setmodel (newmis, "progs/s_spike.mdl");
	setorigin (newmis, self.origin);
	setsize (newmis, '0 0 0', '0 0 0');
	return (newmis);
};

void () Remove_Chain =
{
	self.think = SUB_Remove;
	self.nextthink = time;
	if (self.goalentity)
	{
		self.goalentity.think = SUB_Remove;
		self.goalentity.nextthink = time;
		if (self.goalentity.goalentity)
		{
			self.goalentity.goalentity.think = SUB_Remove;
			self.goalentity.goalentity.nextthink = time;
		}
	}
};

void () Update_Chain =
{
	local vector temp;

	if (!self.owner.hook_out)
	{
		self.think = Remove_Chain;
		self.nextthink = time;
		return;
	}
	temp = (self.owner.hook.origin - self.owner.origin);
	setorigin (self, (self.owner.origin + (temp * 0.25)));
	setorigin (self.goalentity, (self.owner.origin + (temp * 0.5)));
	setorigin (self.goalentity.goalentity, (self.owner.origin + (temp * 0.75)));
	self.nextthink = (time + 0.1);
};

void () Build_Chain =
{
	self.goalentity = MakeLink ();
	self.goalentity.think = Update_Chain;
	self.goalentity.nextthink = (time + 0.1);
	self.goalentity.owner = self.owner;
	self.goalentity.goalentity = MakeLink ();
	self.goalentity.goalentity.goalentity = MakeLink ();
};

float () Check_Overhead =
{
	local vector src;
	local vector end;

	makevectors (self.owner.angles);
	src = (self.owner.origin - '0 0 24');
	end = (self.owner.origin - '0 0 24');
	traceline (src, end, minrate, self.owner);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	src = ((self.owner.origin - '0 0 24') - (v_forward * SBAR_240));
	end = (((self.owner.origin - '0 0 24') - (v_forward * SBAR_240)) + '0 0 58');
	traceline (src, end, minrate, self.owner);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	src = ((self.owner.origin - '0 0 24') + (v_forward * SBAR_240));
	end = (((self.owner.origin - '0 0 24') + (v_forward * SBAR_240)) + '0 0 58');
	traceline (src, end, minrate, self.owner);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	src = ((self.owner.origin - '0 0 24') - (v_right * SBAR_240));
	end = (((self.owner.origin - '0 0 24') - (v_right * SBAR_240)) + '0 0 58');
	traceline (src, end, minrate, self.owner);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	src = ((self.owner.origin - '0 0 24') + (v_right * SBAR_240));
	end = (((self.owner.origin - '0 0 24') + (v_right * SBAR_240)) + '0 0 58');
	traceline (src, end, minrate, self.owner);
	if ((trace_fraction != SBAR_GRENS))
	{
		return (minrate);
	}
	return (SBAR_GRENS);
};

void () Anchor_Grapple =
{
	local float test;

	if ((other == self.owner))
	{
		return;
	}
	if (((((other.classname == "missile") || (other.classname == "grenade")) || (other.classname == "spike")) || (other.classname == "hook")))
	{
		return;
	}
	if ((pointcontents (self.origin) == -6))
	{
		Reset_Grapple (self);
		return;
	}
	if ((other.classname == "player"))
	{
		Reset_Grapple (self);
		return;
	}
	else
	{
		sound (self, SBAR_GRENS, "player/axhit2.wav", SBAR_GRENS, SBAR_GRENS);
		if (other.takedamage)
		{
			T_Damage (other, self, self.owner, SBAR_GRENS);
		}
		self.velocity = '0 0 0';
		self.avelocity = '0 0 0';
	}
	sound (self.owner, SBAR_GRENS, "weapons/tink1.wav", SBAR_GRENS, SBAR_GRENS);
	if (!self.owner.button0)
	{
		Reset_Grapple (self);
		return;
	}
	test = Check_Overhead ();
	if (!test)
	{
		Reset_Grapple (self);
		return;
	}
	self.owner.on_hook = SBAR_GRENS;
	if ((self.owner.flags & 512))
	{
		self.owner.flags = (self.owner.flags - 512);
		setorigin (self.owner, (self.owner.origin + '0 0 1'));
	}
	self.owner.lefty = SBAR_GRENS;
	self.enemy = other;
	self.think = Grapple_Track;
	self.nextthink = time;
	self.solid = minrate;
	self.touch = SUB_Null;
};

void () Throw_Grapple =
{
	if (self.hook_out)
	{
		return;
	}
	KickPlayer (-1, self);
	newmis = spawn ();
	newmis.movetype = 9;
	newmis.solid = SBAR_PRINT;
	newmis.owner = self;
	self.hook = newmis;
	newmis.classname = "hook";
	makevectors (self.v_angle);
	newmis.velocity = (v_forward * 800);
	newmis.angles = vectoangles (newmis.velocity);
	newmis.touch = Anchor_Grapple;
	newmis.think = Build_Chain;
	newmis.nextthink = (time + 0.1);
	setmodel (newmis, "progs/hook.mdl");
	setorigin (newmis, ((self.origin + (v_forward * SBAR_240)) + '0 0 16'));
	setsize (newmis, '0 0 0', '0 0 0');
	self.hook_out = SBAR_GRENS;
	self.fire_held_down = SBAR_GRENS;
};

void () Service_Grapple =
{
	local vector hook_dir;

	if (!self.button0)
	{
		self.fire_held_down = minrate;
		if ((self.current_weapon == SBAR_GRENS))
		{
			Reset_Grapple (self.hook);
		}
	}
	if ((self.hook.enemy.classname == "player"))
	{
		hook_dir = (self.hook.enemy.origin - self.origin);
	}
	else
	{
		if ((self.hook.enemy.classname != "player"))
		{
			hook_dir = (self.hook.origin - self.origin);
		}
	}
	self.velocity = ((normalize (hook_dir) * self.maxspeed) * 1.5);
	if (((vlen (hook_dir) <= _d) && self.lefty))
	{
		if (self.hook.goalentity)
		{
			self.hook.goalentity.think = Remove_Chain;
			self.hook.goalentity.nextthink = time;
		}
		self.lefty = minrate;
	}
};

void () TeamFortress_CTF_FlagInfo =
{
	local entity te;

	te = Finditem (SBAR_GRENS);
	if ((te.goal_state == SBAR_GRENS))
	{
		if ((self == te.owner))
		{
			sprint (self, SBAR_PRINT, "You have the enemy flag. ");
		}
		else
		{
			sprint (self, SBAR_PRINT, te.owner.netname);
			sprint (self, SBAR_PRINT, " has");
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, " your flag. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, " the enemy flag. ");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Your flag is lying about. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is lying about. ");
			}
		}
		else
		{
			if ((self.team_no == SBAR_GRENS))
			{
				sprint (self, SBAR_PRINT, "Your flag is in your base. ");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is in their base. ");
			}
		}
	}
	te = Finditem (SBAR_PRINT);
	if ((te.goal_state == SBAR_GRENS))
	{
		if ((self == te.owner))
		{
			sprint (self, SBAR_PRINT, "You have the enemy flag.\n");
		}
		else
		{
			sprint (self, SBAR_PRINT, te.owner.netname);
			sprint (self, SBAR_PRINT, " has");
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, " your flag.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, " the enemy flag.\n");
			}
		}
	}
	else
	{
		if ((te.origin != te.oldorigin))
		{
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "Your flag is lying about.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is lying about.\n");
			}
		}
		else
		{
			if ((self.team_no == SBAR_PRINT))
			{
				sprint (self, SBAR_PRINT, "Your flag is in your base.\n");
			}
			else
			{
				sprint (self, SBAR_PRINT, "The enemy flag is in their base.\n");
			}
		}
	}
};

void () DroppedKeyThink =
{
	self.think = SUB_Null;
	self.touch = key_touch;
	self.owner = world;
};

void () DropKey =
{
	if (((self.items & 131072) || (self.items & 262144)))
	{
		newmis = spawn ();
		if ((self.items & 131072))
		{
			self.items = (self.items - (self.items & 131072));
			newmis.items = 131072;
			if ((world.worldtype == minrate))
			{
				setmodel (newmis, "progs/w_s_key.mdl");
				newmis.netname = "silver key";
				newmis.noise = "misc/medkey.wav";
			}
			else
			{
				if ((world.worldtype == SBAR_GRENS))
				{
					setmodel (newmis, "progs/m_s_key.mdl");
					newmis.netname = "silver runekey";
					newmis.noise = "misc/runekey.wav";
				}
				else
				{
					if ((world.worldtype == SBAR_PRINT))
					{
						setmodel (newmis, "progs/b_s_key.mdl");
						newmis.netname = "silver keycard";
						newmis.noise = "misc/basekey.wav";
					}
				}
			}
		}
		else
		{
			if ((self.items & 262144))
			{
				self.items = (self.items - (self.items & 262144));
				newmis.items = 262144;
				if ((world.worldtype == minrate))
				{
					setmodel (newmis, "progs/w_g_key.mdl");
					newmis.netname = "gold key";
					newmis.noise = "misc/medkey.wav";
				}
				else
				{
					if ((world.worldtype == SBAR_GRENS))
					{
						setmodel (newmis, "progs/m_g_key.mdl");
						newmis.netname = "gold runekey";
						newmis.noise = "misc/runekey.wav";
					}
					else
					{
						if ((world.worldtype == SBAR_PRINT))
						{
							setmodel (newmis, "progs/b_g_key.mdl");
							newmis.netname = "gold keycard";
							newmis.noise = "misc/basekey.wav";
						}
					}
				}
			}
		}
		newmis.owner = self;
		newmis.touch = SUB_Null;
		setorigin (newmis, (self.origin + '0 0 16'));
		makevectors (self.v_angle);
		newmis.velocity = ((normalize (v_forward) * 300) + '0 0 200');
		newmis.movetype = 6;
		newmis.solid = SBAR_GRENS;
		newmis.deadflag = SBAR_GRENS;
		setsize (newmis, '-16 -16 -24', '16 16 32');
		newmis.think = DroppedKeyThink;
		newmis.nextthink = (time + 1.5);
	}
	else
	{
		sprint (self, SBAR_PRINT, "You don't have a key\n");
	}
};

float () DoorShouldOpen =
{
	local entity ptr;
	local float plyrcount;
	local entity plyr1;
	local entity plyr2;

	if ((coop != SBAR_PRINT))
	{
		return (SBAR_GRENS);
	}
	plyrcount = minrate;
	ptr = find (world, classname, "player");
	while ((ptr != world))
	{
		if ((((!(ptr.tf_items & self.items) && ptr.playerclass) && (ptr.solid != minrate)) && (ptr.model != string_null)))
		{
			plyrcount = (plyrcount + SBAR_GRENS);
			if ((plyrcount == SBAR_GRENS))
			{
				plyr1 = ptr;
			}
			else
			{
				if ((plyrcount == SBAR_PRINT))
				{
					plyr2 = ptr;
				}
			}
		}
		ptr = find (ptr, classname, "player");
	}
	if ((plyrcount != minrate))
	{
		if ((plyrcount == SBAR_GRENS))
		{
			bprint (SBAR_PRINT, plyr1.netname);
			bprint (SBAR_PRINT, " needs");
		}
		else
		{
			if ((plyrcount == SBAR_PRINT))
			{
				bprint (SBAR_PRINT, plyr1.netname);
				bprint (SBAR_PRINT, " && ");
				bprint (SBAR_PRINT, plyr2.netname);
				bprint (SBAR_PRINT, " need");
			}
			else
			{
				bprint (SBAR_PRINT, "More players need");
			}
		}
		bprint (SBAR_PRINT, " to unlock the ");
		if ((self.items & 131072))
		{
			bprint (SBAR_PRINT, "silver");
		}
		else
		{
			bprint (SBAR_PRINT, "gold");
		}
		bprint (SBAR_PRINT, " door\n");
		return (minrate);
	}
	bprint (SBAR_PRINT, "The ");
	if ((self.items & 131072))
	{
		bprint (SBAR_PRINT, "silver");
	}
	else
	{
		bprint (SBAR_PRINT, "gold");
	}
	bprint (SBAR_PRINT, " door has been unlocked\n");
	return (SBAR_GRENS);
};

void () TeamFortress_SaveMe =
{
	local entity te;
	local entity tl;

	if ((self.last_sound < time))
	{
		if ((random () < 0.8))
		{
			sound (self, SBAR_GRENS, "speech/saveme1.wav", SBAR_GRENS, SBAR_GRENS);
		}
		else
		{
			sound (self, SBAR_GRENS, "speech/saveme2.wav", SBAR_GRENS, SBAR_GRENS);
		}
		self.last_sound = (time + AS_MISSILE);
	}
	te = find (world, classname, "player");
	while (te)
	{
		if (((((self == te) || (te.playerclass == 5)) || (te.playerclass == 9)) || (te.playerclass == 8)))
		{
			if ((((te.team_no == self.team_no) && (self.team_no != minrate)) || (te.playerclass == 8)))
			{
				if (visible (te))
				{
					msg_entity = te;
					tl = spawn ();
					tl.origin = self.origin;
					tl.origin_z = (tl.origin_z + space);
					WriteByte (SBAR_GRENS, 23);
					WriteByte (SBAR_GRENS, 9);
					WriteEntity (SBAR_GRENS, tl);
					WriteCoord (SBAR_GRENS, tl.origin_x);
					WriteCoord (SBAR_GRENS, tl.origin_y);
					WriteCoord (SBAR_GRENS, (tl.origin_z + 24));
					WriteCoord (SBAR_GRENS, self.origin_x);
					WriteCoord (SBAR_GRENS, self.origin_y);
					WriteCoord (SBAR_GRENS, self.origin_z);
					dremove (tl);
				}
			}
		}
		te = find (te, classname, "player");
	}
};

void () TeamFortress_ID =
{
	local vector src;
	local string st;
	local string cls;

	src = (self.origin + (v_forward * enter));
	src_z = (self.absmin_z + (self.size_z * 0.7));
	traceline (src, (src + (v_forward * 2048)), minrate, self);
	if (((trace_ent != world) && (trace_ent.origin != world.origin)))
	{
		if (((trace_ent.classname == "player") && (trace_ent.health > minrate)))
		{
			if (((trace_ent.is_feigning && (self.team_no != minrate)) && (self.team_no != trace_ent.team_no)))
			{
				return;
			}
			self.StatusRefreshTime = (time + 1.5);
			if ((((self.team_no != minrate) && (self.team_no == trace_ent.team_no)) || (self.classname == "observer")))
			{
				cls = TeamFortress_GetClassName (trace_ent.playerclass);
				if ((self.playerclass == 5))
				{
					st = ftos (rint (trace_ent.health));
					centerprint (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls, "\n", st, " health\n");
					return;
				}
				else
				{
					if ((self.playerclass == 9))
					{
						st = ftos (rint (trace_ent.armorvalue));
						centerprint (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls, "\n", st, " armor\n");
						return;
					}
				}
				centerprint (self, "\n\n\n\n", trace_ent.netname, "\nFriendly ", cls);
				return;
			}
			if ((trace_ent.playerclass == 8))
			{
				cls = TeamFortress_GetClassName (trace_ent.undercover_skin);
				if (((self.team_no != minrate) && (self.team_no == trace_ent.undercover_team)))
				{
					if ((self.playerclass == 5))
					{
						st = ftos (rint (trace_ent.health));
						if ((trace_ent.undercover_skin != minrate))
						{
							centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls, "\n", st, " health\n");
						}
						else
						{
							centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n", st, " health\n");
						}
						return;
					}
					else
					{
						if ((self.playerclass == 9))
						{
							st = ftos (rint (trace_ent.armorvalue));
							if ((trace_ent.undercover_skin != minrate))
							{
								centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls, "\n", st, " armor\n");
							}
							else
							{
								centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n", st, " armor\n");
							}
							return;
						}
						else
						{
							st = ftos (rint (trace_ent.armorvalue));
							if ((trace_ent.undercover_skin != minrate))
							{
								centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly ", cls);
							}
							else
							{
								centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nFriendly Spy\n");
							}
							return;
						}
					}
				}
				if ((trace_ent.undercover_name != string_null))
				{
					if ((trace_ent.undercover_skin != minrate))
					{
						centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nEnemy ", cls);
					}
					else
					{
						centerprint (self, "\n\n\n\n", trace_ent.undercover_name, "\nEnemy Spy");
					}
				}
				else
				{
					if ((trace_ent.undercover_skin != minrate))
					{
						centerprint (self, "\n\n\n\n", trace_ent.netname, "\nEnemy ", cls);
					}
					else
					{
						centerprint (self, "\n\n\n\n", trace_ent.netname, "\nEnemy Spy");
					}
				}
			}
			else
			{
				cls = TeamFortress_GetClassName (trace_ent.playerclass);
				centerprint (self, "\n\n\n\n", trace_ent.netname, "\nEnemy ", cls);
			}
		}
		else
		{
			if ((trace_ent.classname == "building_dispenser"))
			{
				self.StatusRefreshTime = (time + 1.5);
				if ((self == trace_ent.real_owner))
				{
					centerprint (self, "\n\n\n\nYour Dispenser");
				}
				else
				{
					centerprint (self, "\n\n\n\nDispenser made by ", trace_ent.real_owner.netname);
				}
			}
			else
			{
				if (((trace_ent.classname == "building_sentrygun") || (trace_ent.classname == "building_sentrygun_base")))
				{
					self.StatusRefreshTime = (time + 1.5);
					if ((self == trace_ent.real_owner))
					{
						centerprint (self, "\n\n\n\nYour SentryGun");
					}
					else
					{
						if (!teamplay)
						{
							centerprint (self, "\n\n\n\nSentrygun made by\n", trace_ent.real_owner.netname);
						}
						else
						{
							if ((((self.team_no != minrate) && (self.team_no == trace_ent.team_no)) || !self.playerclass))
							{
								centerprint (self, "\n\n\n\nFriendly Sentrygun made by\n", trace_ent.real_owner.netname);
							}
							else
							{
								centerprint (self, "\n\n\n\nEnemy Sentrygun made by\n", trace_ent.real_owner.netname);
							}
						}
					}
				}
			}
		}
	}
};

void () TeamFortress_ReloadCurrentWeapon =
{
	local float rt;
	local entity tWeapon;

	if ((self.tfstate & SBAR_PRINT))
	{
		return;
	}
	if ((self.playerclass == SBAR_200))
	{
		return;
	}
	if (practice)
	{
		return;
	}
	if ((self.current_weapon == 128))
	{
		if ((self.ammo_shells == minrate))
		{
			sprint (self, SBAR_PRINT, "out of shells.\n");
			return;
		}
		if ((self.reload_shotgun == minrate))
		{
			sprint (self, SBAR_PRINT, "clip full.\n");
			return;
		}
		if (((8 - self.reload_shotgun) == self.ammo_shells))
		{
			sprint (self, SBAR_PRINT, "all shells are in the clip.\n");
			return;
		}
		if ((self.reload_shotgun < self.ammo_shells))
		{
			Attack_Finished (0.4);
			rt = ((8 - self.reload_shotgun) / 8);
			rt = (SBAR_PRINT - (SBAR_PRINT * rt));
			self.reload_shotgun = minrate;
			if ((self.ammo_shells < 8))
			{
				self.reload_shotgun = (8 - self.ammo_shells);
			}
			sprint (self, SBAR_PRINT, "reloading... \n");
			self.tfstate = (self.tfstate | SBAR_PRINT);
			tWeapon = spawn ();
			tWeapon.owner = self;
			tWeapon.classname = "timer";
			tWeapon.nextthink = (time + rt);
			tWeapon.think = W_Reload_shotgun;
			self.weaponmodel = "";
			self.weaponframe = minrate;
		}
		else
		{
			sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
		}
	}
	else
	{
		if ((self.current_weapon == 256))
		{
			if ((self.ammo_shells == minrate))
			{
				sprint (self, SBAR_PRINT, "out of shells.\n");
				return;
			}
			if ((self.reload_super_shotgun == minrate))
			{
				sprint (self, SBAR_PRINT, "clip full.\n");
				return;
			}
			if (((SBAR_240 - self.reload_super_shotgun) == self.ammo_shells))
			{
				sprint (self, SBAR_PRINT, "all shells are in the clip.\n");
				return;
			}
			if ((self.reload_super_shotgun < self.ammo_shells))
			{
				Attack_Finished (0.7);
				rt = ((SBAR_240 - self.reload_super_shotgun) / SBAR_240);
				rt = (AS_MELEE - (AS_MELEE * rt));
				self.reload_super_shotgun = minrate;
				if ((self.ammo_shells < SBAR_240))
				{
					self.reload_super_shotgun = (SBAR_240 - self.ammo_shells);
				}
				sprint (self, SBAR_PRINT, "reloading...\n");
				self.tfstate = (self.tfstate | SBAR_PRINT);
				tWeapon = spawn ();
				tWeapon.owner = self;
				tWeapon.classname = "timer";
				tWeapon.nextthink = (time + rt);
				tWeapon.think = W_Reload_super_shotgun;
				self.weaponmodel = "";
				self.weaponframe = minrate;
			}
			else
			{
				sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
			}
		}
		else
		{
			if ((self.current_weapon == 2048))
			{
				if ((self.ammo_rockets == minrate))
				{
					sprint (self, SBAR_PRINT, "out of grenades.\n");
					return;
				}
				if ((self.reload_grenade_launcher == minrate))
				{
					sprint (self, SBAR_PRINT, "clip full.\n");
					return;
				}
				if (((6 - self.reload_grenade_launcher) == self.ammo_rockets))
				{
					sprint (self, SBAR_PRINT, "all grenades are in the clip.\n");
					return;
				}
				if ((self.reload_grenade_launcher < self.ammo_rockets))
				{
					Attack_Finished (0.6);
					rt = ((6 - self.reload_grenade_launcher) / 6);
					rt = (AS_MISSILE - (AS_MISSILE * rt));
					self.reload_grenade_launcher = minrate;
					if ((self.ammo_rockets < 6))
					{
						self.reload_grenade_launcher = (6 - self.ammo_rockets);
					}
					sprint (self, SBAR_PRINT, "reloading...\n");
					self.tfstate = (self.tfstate | SBAR_PRINT);
					tWeapon = spawn ();
					tWeapon.owner = self;
					tWeapon.classname = "timer";
					tWeapon.nextthink = (time + rt);
					tWeapon.think = W_Reload_grenade_launcher;
					self.weaponmodel = "";
					self.weaponframe = minrate;
				}
				else
				{
					sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
				}
			}
			else
			{
				if ((self.current_weapon == 8192))
				{
					if ((self.ammo_rockets == minrate))
					{
						sprint (self, SBAR_PRINT, "out of rockets.\n");
						return;
					}
					if ((self.reload_rocket_launcher == minrate))
					{
						sprint (self, SBAR_PRINT, "clip full.\n");
						return;
					}
					if (((AS_MISSILE - self.reload_rocket_launcher) == self.ammo_rockets))
					{
						sprint (self, SBAR_PRINT, "all rockets are in the clip.\n");
						return;
					}
					if ((self.reload_rocket_launcher < self.ammo_rockets))
					{
						Attack_Finished (0.8);
						rt = ((AS_MISSILE - self.reload_rocket_launcher) / AS_MISSILE);
						rt = (5 - (5 * rt));
						self.reload_rocket_launcher = minrate;
						if ((self.ammo_rockets < AS_MISSILE))
						{
							self.reload_rocket_launcher = (AS_MISSILE - self.ammo_rockets);
						}
						sprint (self, SBAR_PRINT, "reloading...\n");
						self.tfstate = (self.tfstate | SBAR_PRINT);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + rt);
						tWeapon.think = W_Reload_rocket_launcher;
						self.weaponmodel = "";
						self.weaponframe = minrate;
					}
					else
					{
						sprint (self, SBAR_PRINT, "not enough ammo to reload\n");
					}
				}
			}
		}
	}
};
void () SpectatorDisconnect;
void () SpectatorImpulseCommand;
void () SpectatorThink;

void () SpectatorConnect =
{
	local string st;
	local float res;

	self.playerclass = minrate;
	self.classname = "observer";
	self.flags = 8;
	st = infokey (self, "adminpwd");
	Admin_Check (st);
	st = infokey (self, "em");
	if ((st == string_null))
	{
		st = infokey (self, "exec_map");
	}
	if ((st == "on"))
	{
		stuffcmd (self, "exec spectator.cfg\n");
		stuffcmd (self, "exec ");
		stuffcmd (self, mapname);
		stuffcmd (self, ".cfg\n");
	}
	self.motd = minrate;
	if (self.is_admin)
	{
		Admin_Aliases ();
	}
	CheckConnectRate ();
};

void () SpectatorDisconnect =
{
};

void () SpectatorImpulseCommand =
{
	local vector cam;

	if ((self.impulse == SBAR_GRENS))
	{
		self.goalentity = find (self.goalentity, classname, "info_player_deathmatch");
		if ((self.goalentity == world))
		{
			self.goalentity = find (self.goalentity, classname, "info_player_deathmatch");
		}
		if ((self.goalentity != world))
		{
			setorigin (self, self.goalentity.origin);
			self.angles = self.goalentity.angles;
			self.fixangle = SBAR_GRENS;
			self.last_impulse = self.impulse;
		}
		self.impulse = minrate;
		return;
	}
	else
	{
		if ((self.impulse == 9))
		{
			fadetoblack ();
			self.impulse = minrate;
			return;
		}
		else
		{
			if ((self.impulse == enter))
			{
				fadefromblack ();
				self.impulse = minrate;
				return;
			}
			else
			{
				if ((self.impulse == 185))
				{
					TeamFortress_ID ();
					self.impulse = minrate;
					return;
				}
				else
				{
					if ((self.impulse == 131))
					{
						TeamFortress_HelpMap ();
						self.impulse = minrate;
						return;
					}
					else
					{
						if ((self.impulse == _w))
						{
							TeamFortress_StatusQuery ();
							self.impulse = minrate;
							return;
						}
						else
						{
							if ((self.impulse == 145))
							{
								TeamFortress_TeamShowScores (minrate);
								self.impulse = minrate;
								return;
							}
						}
					}
				}
			}
		}
	}
	CommandImpulses ();
	self.impulse = minrate;
};

void () SpectatorThink =
{
	local vector cam;

	Check_Track ();
	if (self.impulse)
	{
		SpectatorImpulseCommand ();
	}
	if ((self.motd <= _A))
	{
		TeamFortress_MOTD ();
	}
	if (((time > self.StatusRefreshTime) && (self.StatusBarSize != minrate)))
	{
		RefreshStatusBar ();
	}
};

void () PrintMaps =
{
	local string str;
	local string str2;
	local float fl1;
	local float fl2;

	fl1 = _d;
	fl2 = (_d + _d);
	str2 = ftos (fl1);
	str = infokey (world, str2);
	sprint (self, SBAR_PRINT, "maplist:\n");
	while (((str != "") && (fl1 < fl2)))
	{
		fl1 = (fl1 + SBAR_GRENS);
		str2 = ftos ((fl1 - _d));
		sprint5 (self, SBAR_PRINT, "ê", str2, "ë ", str, "\n");
		str2 = ftos (fl1);
		str = infokey (world, str2);
	}
};

float () UserCmd =
{
	local float arg_num;
	local float fl;
	local string tmp;

	arg_num = argc ();
	if ((arg_num == minrate))
	{
		return (minrate);
	}
	if ((argv (minrate) == "test"))
	{
		sprint (self, SBAR_PRINT, "whazzup\n");
		return (SBAR_GRENS);
	}
	else
	{
		if ((argv (minrate) == "dlist"))
		{
			stuffcmd (self, "cmd demolist");
			if ((arg_num == SBAR_PRINT))
			{
				stuffcmd (self, " ");
				stuffcmd (self, argv (SBAR_GRENS));
			}
			stuffcmd (self, "\n");
			return (SBAR_GRENS);
		}
		else
		{
			if ((argv (minrate) == "dl"))
			{
				if ((arg_num == SBAR_PRINT))
				{
					stuffcmd (self, "cmd download demonum/");
					stuffcmd (self, argv (SBAR_GRENS));
					stuffcmd (self, "\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_GRENS))
				{
					sprint (self, SBAR_PRINT, "type: cmd dlist, for a list of available demos\n");
					sprint (self, SBAR_PRINT, "to download, type: cmd dl #, where # is the demo number\n");
					sprint (self, SBAR_PRINT, "\n");
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((argv (minrate) == "adminpwd"))
				{
					if ((arg_num == SBAR_PRINT))
					{
						if ((self.is_admin == AS_MELEE))
						{
							sprint (self, SBAR_PRINT, "You are already an admin\n");
							return (SBAR_GRENS);
						}
						if ((self.is_admin == SBAR_PRINT))
						{
							sprint (self, SBAR_PRINT, "You cannot input password while electing.\n");
							return (SBAR_GRENS);
						}
						Admin_Check (argv (SBAR_GRENS));
						if ((self.is_admin == AS_MELEE))
						{
							Admin_Aliases ();
							bprint2 (SBAR_PRINT, self.netname, " Á·ÈÓÛ ÊıÏÏ ·‰ÌÈÓ ÛÙ·ÙıÛ!");
							bprint (AS_MELEE, "\n");
							sprint (self, SBAR_PRINT, "Type „ÔÌÌ·Ó‰Û for admin commands.\n");
						}
						else
						{
							sprint (self, SBAR_PRINT, "incorrect admin password\n");
						}
						return (SBAR_GRENS);
					}
					if ((arg_num == SBAR_GRENS))
					{
						sprint (self, SBAR_PRINT, "usage: cmd adminpwd password, where password is the admin password\n");
						sprint (self, SBAR_PRINT, "\n");
						return (SBAR_GRENS);
					}
				}
				else
				{
					if ((argv (minrate) == "timelimit"))
					{
						if ((self.is_admin != AS_MELEE))
						{
							sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_PRINT))
						{
							localcmd ("timelimit ");
							localcmd (argv (SBAR_GRENS));
							localcmd ("\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_GRENS))
						{
							tmp = infokey (world, argv (minrate));
							sprint (self, SBAR_PRINT, "timelimit is ");
							sprint (self, SBAR_PRINT, "\"");
							sprint (self, SBAR_PRINT, tmp);
							sprint (self, SBAR_PRINT, "\"\n");
							return (SBAR_GRENS);
						}
					}
					else
					{
						if ((argv (minrate) == "prematch"))
						{
							if ((self.is_admin != AS_MELEE))
							{
								sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_PRINT))
							{
								localcmd ("prematch ");
								localcmd (argv (SBAR_GRENS));
								localcmd ("\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_GRENS))
							{
								tmp = infokey (world, argv (minrate));
								sprint (self, SBAR_PRINT, "prematch is ");
								sprint (self, SBAR_PRINT, "\"");
								sprint (self, SBAR_PRINT, tmp);
								sprint (self, SBAR_PRINT, "\"\n");
								return (SBAR_GRENS);
							}
						}
						else
						{
							if ((argv (minrate) == "fraglimit"))
							{
								if ((self.is_admin != AS_MELEE))
								{
									sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_PRINT))
								{
									localcmd ("fraglimit ");
									localcmd (argv (SBAR_GRENS));
									localcmd ("\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_GRENS))
								{
									tmp = infokey (world, argv (minrate));
									sprint (self, SBAR_PRINT, "fraglimit is ");
									sprint (self, SBAR_PRINT, "\"");
									sprint (self, SBAR_PRINT, tmp);
									sprint (self, SBAR_PRINT, "\"\n");
									return (SBAR_GRENS);
								}
							}
							else
							{
								if ((argv (minrate) == "teamplay"))
								{
									if ((self.is_admin != AS_MELEE))
									{
										sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_PRINT))
									{
										localcmd ("teamplay ");
										localcmd (argv (SBAR_GRENS));
										localcmd ("\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_GRENS))
									{
										tmp = infokey (world, argv (minrate));
										sprint (self, SBAR_PRINT, "teamplay is ");
										sprint (self, SBAR_PRINT, "\"");
										sprint (self, SBAR_PRINT, tmp);
										sprint (self, SBAR_PRINT, "\"\n");
										return (SBAR_GRENS);
									}
								}
								else
								{
									if ((argv (minrate) == "overtime"))
									{
										if ((self.is_admin != AS_MELEE))
										{
											sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_PRINT))
										{
											localcmd ("localinfo overtime ");
											localcmd (argv (SBAR_GRENS));
											localcmd ("\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_GRENS))
										{
											tmp = infokey (world, argv (minrate));
											sprint (self, SBAR_PRINT, "overtime is ");
											sprint (self, SBAR_PRINT, "\"");
											sprint (self, SBAR_PRINT, tmp);
											sprint (self, SBAR_PRINT, "\"\n");
											return (SBAR_GRENS);
										}
									}
									else
									{
										if ((argv (minrate) == "cft"))
										{
											if ((self.is_admin != AS_MELEE))
											{
												sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_PRINT))
											{
												localcmd ("localinfo cft ");
												localcmd (argv (SBAR_GRENS));
												localcmd ("\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_GRENS))
											{
												tmp = infokey (world, argv (minrate));
												sprint (self, SBAR_PRINT, "ceasefire time is ");
												sprint (self, SBAR_PRINT, "\"");
												sprint (self, SBAR_PRINT, tmp);
												sprint (self, SBAR_PRINT, "\"\n");
												return (SBAR_GRENS);
											}
										}
										else
										{
											if ((argv (minrate) == "password"))
											{
												if ((self.is_admin != AS_MELEE))
												{
													sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
													return (SBAR_GRENS);
												}
												if ((arg_num == SBAR_PRINT))
												{
													localcmd ("password ");
													localcmd (argv (SBAR_GRENS));
													localcmd ("\n");
													bprint ("\n");
													argv (SBAR_GRENS);
													bprint3 (SBAR_PRINT, "çServer Password changed to \"", argv (SBAR_GRENS), "\"\n");
													bprint ("\n");
													return (SBAR_GRENS);
												}
												if ((arg_num == SBAR_GRENS))
												{
													sprint (self, SBAR_PRINT, "usage: cmd password pwd\n");
													sprint (self, SBAR_PRINT, "\n");
													return (SBAR_GRENS);
												}
											}
											else
											{
												if ((argv (minrate) == "record"))
												{
													if ((self.is_admin != AS_MELEE))
													{
														sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
														return (SBAR_GRENS);
													}
													if ((arg_num == SBAR_PRINT))
													{
														localcmd ("record ");
														localcmd (argv (SBAR_GRENS));
														localcmd ("\n");
														return (SBAR_GRENS);
													}
													if ((arg_num == SBAR_GRENS))
													{
														sprint (self, SBAR_PRINT, "usage: cmd record demo, where demo is the demo name\n");
														sprint (self, SBAR_PRINT, "\n");
														return (SBAR_GRENS);
													}
												}
												else
												{
													if ((argv (minrate) == "easyrecord"))
													{
														if ((self.is_admin != AS_MELEE))
														{
															sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
															return (SBAR_GRENS);
														}
														if ((arg_num == SBAR_PRINT))
														{
															localcmd ("easyrecord ");
															localcmd (argv (SBAR_GRENS));
															localcmd ("\n");
															return (SBAR_GRENS);
														}
														if ((arg_num == SBAR_GRENS))
														{
															localcmd ("easyrecord\n");
															return (SBAR_GRENS);
														}
													}
													else
													{
														if ((argv (minrate) == "autorecord"))
														{
															if ((self.is_admin != AS_MELEE))
															{
																sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																return (SBAR_GRENS);
															}
															if ((arg_num == SBAR_PRINT))
															{
																localcmd ("localinfo demo_auto_left ");
																localcmd (argv (SBAR_GRENS));
																localcmd ("\n");
																return (SBAR_GRENS);
															}
															if ((arg_num == SBAR_GRENS))
															{
																tmp = infokey (world, "demo_auto_left");
																if ((stof (tmp) > minrate))
																{
																	dprint ("Auto-Recording off\n");
																	localcmd ("localinfo demo_auto_left 0\n");
																	return (SBAR_GRENS);
																}
																else
																{
																	dprint ("Auto-Recording the next match\n");
																	localcmd ("localinfo demo_auto_left 1\n");
																	return (SBAR_GRENS);
																}
															}
														}
														else
														{
															if ((argv (minrate) == "cancel"))
															{
																if ((self.is_admin != AS_MELEE))
																{
																	sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																	return (SBAR_GRENS);
																}
																localcmd ("cancel\n");
																return (SBAR_GRENS);
															}
															else
															{
																if ((argv (minrate) == "stop"))
																{
																	if ((self.is_admin != AS_MELEE))
																	{
																		sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																		return (SBAR_GRENS);
																	}
																	localcmd ("stop\n");
																	return (SBAR_GRENS);
																}
																else
																{
																	if ((argv (minrate) == "kick"))
																	{
																		if ((self.is_admin != AS_MELEE))
																		{
																			sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																			return (SBAR_GRENS);
																		}
																		Admin_CycleDeal ();
																		return (SBAR_GRENS);
																	}
																	else
																	{
																		if ((argv (minrate) == "map"))
																		{
																			if (((self.is_admin != SBAR_GRENS) && (self.is_admin != AS_MELEE)))
																			{
																				sprint (self, SBAR_PRINT, "You need admin rights to use this command\n");
																				return (SBAR_GRENS);
																			}
																			if ((self.is_admin != AS_MELEE))
																			{
																				if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																				{
																					sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																					self.impulse = minrate;
																					return (SBAR_GRENS);
																				}
																				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																				{
																					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																					self.impulse = minrate;
																					return (SBAR_GRENS);
																				}
																			}
																			if ((arg_num == SBAR_PRINT))
																			{
																				localcmd ("map ");
																				localcmd (argv (SBAR_GRENS));
																				localcmd ("\n");
																				return (SBAR_GRENS);
																			}
																			if ((arg_num == SBAR_GRENS))
																			{
																				sprint (self, SBAR_PRINT, "usage: cmd map mapname, where mapname is the map name you wish to change to\n");
																				sprint (self, SBAR_PRINT, "\n");
																				return (SBAR_GRENS);
																			}
																		}
																		else
																		{
																			if ((argv (minrate) == "maplist"))
																			{
																				PrintMaps ();
																				return (SBAR_GRENS);
																			}
																			else
																			{
																				if (((argv (minrate) == "help") || (argv (minrate) == "list")))
																				{
																					sprint (self, SBAR_PRINT, "Commands list:\n");
																					sprint (self, SBAR_PRINT, "cmd adminpwd\n");
																					sprint (self, SBAR_PRINT, "cmd dl\n");
																					sprint (self, SBAR_PRINT, "cmd dlist\n");
																					sprint (self, SBAR_PRINT, "cmd timelimit\n");
																					sprint (self, SBAR_PRINT, "cmd prematch\n");
																					sprint (self, SBAR_PRINT, "cmd fraglimit\n");
																					sprint (self, SBAR_PRINT, "cmd teamplay\n");
																					sprint (self, SBAR_PRINT, "cmd overtime\n");
																					sprint (self, SBAR_PRINT, "cmd cft\n");
																					sprint (self, SBAR_PRINT, "cmd password\n");
																					sprint (self, SBAR_PRINT, "cmd map\n");
																					sprint (self, SBAR_PRINT, "cmd record\n");
																					sprint (self, SBAR_PRINT, "cmd easyrecord\n");
																					sprint (self, SBAR_PRINT, "cmd autorecord\n");
																					sprint (self, SBAR_PRINT, "cmd cancel\n");
																					sprint (self, SBAR_PRINT, "cmd stop\n");
																					sprint (self, SBAR_PRINT, "cmd kick\n");
																					sprint (self, SBAR_PRINT, "cmd help || list (this command)\n");
																					sprint (self, SBAR_PRINT, "\n");
																					return (SBAR_GRENS);
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (minrate);
};

float () ConsoleCmd =
{
	local string tmp;
	local float arg_num;
	local float fl;

	arg_num = argc ();
	if ((arg_num == minrate))
	{
		return (minrate);
	}
	if ((argv (minrate) == "test"))
	{
		dprint ("whazzup\n");
		return (SBAR_GRENS);
	}
	else
	{
		if ((argv (minrate) == "info"))
		{
			if ((arg_num == AS_MELEE))
			{
				if ((argv (SBAR_PRINT) == "\\"))
				{
					localcmd ("localinfo ");
					localcmd (argv (SBAR_GRENS));
					localcmd (" \"");
					localcmd ("\"\n");
					dprint ("localinfo ");
					dprint (argv (SBAR_GRENS));
					dprint (" removed");
					dprint ("\n");
					return (SBAR_GRENS);
				}
				localcmd ("localinfo ");
				localcmd (argv (SBAR_GRENS));
				localcmd (" ");
				localcmd (argv (SBAR_PRINT));
				localcmd ("\n");
				return (SBAR_GRENS);
			}
			if ((arg_num == SBAR_PRINT))
			{
				tmp = infokey (world, argv (SBAR_GRENS));
				dprint ("localinfo ");
				dprint (argv (SBAR_GRENS));
				dprint (": \"");
				dprint (tmp);
				dprint ("\"\n");
				return (SBAR_GRENS);
			}
			if ((arg_num == SBAR_GRENS))
			{
				localcmd ("localinfo\n");
				return (SBAR_GRENS);
			}
		}
		else
		{
			if ((argv (minrate) == "svinfo"))
			{
				if ((arg_num == AS_MELEE))
				{
					if ((argv (SBAR_PRINT) == "\\"))
					{
						localcmd ("serverinfo ");
						localcmd (argv (SBAR_GRENS));
						localcmd (" \"");
						localcmd ("\"\n ");
						dprint ("serverinfo ");
						dprint (argv (SBAR_GRENS));
						dprint (" removed");
						dprint ("\n");
						return (SBAR_GRENS);
					}
					localcmd ("serverinfo ");
					localcmd (argv (SBAR_GRENS));
					localcmd (" ");
					localcmd (argv (SBAR_PRINT));
					localcmd ("\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_PRINT))
				{
					tmp = infokey (world, argv (SBAR_GRENS));
					dprint ("serverinfo ");
					dprint (argv (SBAR_GRENS));
					dprint (": \"");
					dprint (tmp);
					dprint ("\"\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_GRENS))
				{
					localcmd ("serverinfo\n");
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((argv (minrate) == "prematch"))
				{
					if ((arg_num == SBAR_PRINT))
					{
						localcmd ("localinfo prematch ");
						localcmd (argv (SBAR_GRENS));
						localcmd ("\n");
						return (SBAR_GRENS);
					}
					if ((arg_num == SBAR_GRENS))
					{
						tmp = infokey (world, argv (minrate));
						dprint ("prematch is ");
						dprint ("\"");
						dprint (tmp);
						dprint ("\"\n");
						return (SBAR_GRENS);
					}
				}
				else
				{
					if ((argv (minrate) == "overtime"))
					{
						if ((arg_num == SBAR_PRINT))
						{
							localcmd ("localinfo overtime ");
							localcmd (argv (SBAR_GRENS));
							localcmd ("\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_GRENS))
						{
							tmp = infokey (world, argv (minrate));
							dprint ("overtime is ");
							dprint ("\"");
							dprint (tmp);
							dprint ("\"\n");
							return (SBAR_GRENS);
						}
					}
					else
					{
						if ((argv (minrate) == "cft"))
						{
							if ((arg_num == SBAR_PRINT))
							{
								localcmd ("localinfo cft ");
								localcmd (argv (SBAR_GRENS));
								localcmd ("\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_GRENS))
							{
								tmp = infokey (world, argv (minrate));
								dprint ("ceasefire time is ");
								dprint ("\"");
								dprint (tmp);
								dprint ("\"\n");
								return (SBAR_GRENS);
							}
						}
						else
						{
							if ((argv (minrate) == "gspeed"))
							{
								if ((arg_num == SBAR_PRINT))
								{
									gspeed = stof (argv (SBAR_GRENS));
									if (((gspeed < minrate) || (gspeed > AS_MELEE)))
									{
										gspeed = minrate;
									}
									localcmd ("localinfo gspeed ");
									localcmd (argv (SBAR_GRENS));
									localcmd ("\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_GRENS))
								{
									tmp = infokey (world, argv (minrate));
									dprint ("ground speed is ");
									dprint ("\"");
									dprint (tmp);
									dprint ("\"\n");
									return (SBAR_GRENS);
								}
							}
							else
							{
								if ((argv (minrate) == "roundtime"))
								{
									if ((arg_num == SBAR_PRINT))
									{
										localcmd ("localinfo round_time ");
										localcmd (argv (SBAR_GRENS));
										localcmd ("\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_GRENS))
									{
										tmp = infokey (world, argv (minrate));
										dprint ("round time is ");
										dprint ("\"");
										dprint (tmp);
										dprint ("\"\n");
										return (SBAR_GRENS);
									}
								}
								else
								{
									if ((argv (minrate) == "rounds"))
									{
										if ((arg_num == SBAR_PRINT))
										{
											localcmd ("localinfo rounds ");
											localcmd (argv (SBAR_GRENS));
											localcmd ("\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_GRENS))
										{
											tmp = infokey (world, argv (minrate));
											dprint ("rounds is ");
											dprint ("\"");
											dprint (tmp);
											dprint ("\"\n");
											return (SBAR_GRENS);
										}
									}
									else
									{
										if ((argv (minrate) == "autorecord"))
										{
											if ((arg_num == SBAR_PRINT))
											{
												localcmd ("localinfo demo_auto_left ");
												localcmd (argv (SBAR_GRENS));
												localcmd ("\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_GRENS))
											{
												tmp = infokey (world, "demo_auto_left");
												if ((stof (tmp) > minrate))
												{
													dprint ("Auto-Recording off\n");
													localcmd ("localinfo demo_auto_left 0\n");
													return (SBAR_GRENS);
												}
												else
												{
													dprint ("Auto-Recording the next match\n");
													localcmd ("localinfo demo_auto_left 1\n");
													return (SBAR_GRENS);
												}
											}
										}
										else
										{
											if ((argv (minrate) == "restart"))
											{
												RestartMap ();
												return (SBAR_GRENS);
											}
											else
											{
												if ((argv (minrate) == "startmatch"))
												{
													fl = TeamFortress_NoTeams ();
													if ((fl < SBAR_GRENS))
													{
														dprint ("No teams in game\n");
														dprint ("Match cannot be started.\n");
														return (SBAR_GRENS);
													}
													pmtime = minrate;
													StartTimer ();
													return (SBAR_GRENS);
												}
												else
												{
													if ((argv (minrate) == "break"))
													{
														pmtime = minrate;
														StartTimer ();
														return (SBAR_GRENS);
													}
													else
													{
														if ((argv (minrate) == "clan"))
														{
															ClanMode ();
															return (SBAR_GRENS);
														}
														else
														{
															if ((argv (minrate) == "tfvsdm"))
															{
																Toggle_TFvsDM ();
																return (SBAR_GRENS);
															}
															else
															{
																if ((argv (minrate) == "practice"))
																{
																	Toggle_Practice ();
																	return (SBAR_GRENS);
																}
																else
																{
																	if ((argv (minrate) == "tfstrike"))
																	{
																		Toggle_TFStrike ();
																		return (SBAR_GRENS);
																	}
																	else
																	{
																		if ((argv (minrate) == "duel"))
																		{
																			Toggle_Duel ();
																			return (SBAR_GRENS);
																		}
																		else
																		{
																			if ((argv (minrate) == "teamfrags"))
																			{
																				Toggle_Teamfrags ();
																				return (SBAR_GRENS);
																			}
																			else
																			{
																				if ((argv (minrate) == "fullts"))
																				{
																					Toggle_Fullts ();
																					return (SBAR_GRENS);
																				}
																				else
																				{
																					if ((argv (minrate) == "clansetup"))
																					{
																						ClanSetup ();
																						return (SBAR_GRENS);
																					}
																					else
																					{
																						if ((argv (minrate) == "reset"))
																						{
																							ResetSetup ();
																							return (SBAR_GRENS);
																						}
																						else
																						{
																							if ((argv (minrate) == "fbskins"))
																							{
																								ToggleFbskins ();
																								return (SBAR_GRENS);
																							}
																							else
																							{
																								if ((argv (minrate) == "frj"))
																								{
																									Toggle_Frj ();
																									return (SBAR_GRENS);
																								}
																								else
																								{
																									if ((argv (minrate) == "silence"))
																									{
																										ToggleSpecTalk ();
																										return (SBAR_GRENS);
																									}
																									else
																									{
																										if ((argv (minrate) == "grapple"))
																										{
																											Toggle_Grapple ();
																											return (SBAR_GRENS);
																										}
																										else
																										{
																											if ((argv (minrate) == "ceasefire"))
																											{
																												Admin_CeaseFire ();
																												return (SBAR_GRENS);
																											}
																											else
																											{
																												if ((argv (minrate) == "freeze"))
																												{
																													ToggleFreeze ();
																													return (SBAR_GRENS);
																												}
																												else
																												{
																													if ((argv (minrate) == "speedcap"))
																													{
																														Toggle_SpeedCap ();
																														return (SBAR_GRENS);
																													}
																													else
																													{
																														if ((argv (minrate) == "flash"))
																														{
																															ToggleFlash ();
																															return (SBAR_GRENS);
																														}
																														else
																														{
																															if ((argv (minrate) == "flag_model"))
																															{
																																Toggle_flag_emu ();
																																return (SBAR_GRENS);
																															}
																															else
																															{
																																if ((argv (minrate) == "grenpacks"))
																																{
																																	Toggle_Grenpacks ();
																																	return (SBAR_GRENS);
																																}
																																else
																																{
																																	if ((argv (minrate) == "gibs"))
																																	{
																																		Toggle_Gibs ();
																																		return (SBAR_GRENS);
																																	}
																																	else
																																	{
																																		if ((argv (minrate) == "highlander"))
																																		{
																																			Toggle_Highlander ();
																																			return (SBAR_GRENS);
																																		}
																																		else
																																		{
																																			if ((argv (minrate) == "lights"))
																																			{
																																				Toggle_Lighting ();
																																				return (SBAR_GRENS);
																																			}
																																			else
																																			{
																																				if ((argv (minrate) == "detpack"))
																																				{
																																					Toggle_Detpack ();
																																					return (SBAR_GRENS);
																																				}
																																				else
																																				{
																																					if ((argv (minrate) == "pipedelay"))
																																					{
																																						Toggle_PipeDelay ();
																																						return (SBAR_GRENS);
																																					}
																																					else
																																					{
																																						if ((argv (minrate) == "grentype"))
																																						{
																																							Toggle_GrenType ();
																																							return (SBAR_GRENS);
																																						}
																																						else
																																						{
																																							if ((argv (minrate) == "sgfire"))
																																							{
																																								Toggle_SentryFire ();
																																								return (SBAR_GRENS);
																																							}
																																							else
																																							{
																																								if ((argv (minrate) == "sgtype"))
																																								{
																																									Toggle_SentryType ();
																																									return (SBAR_GRENS);
																																								}
																																								else
																																								{
																																									if ((argv (minrate) == "time"))
																																									{
																																										calltimeofday ();
																																										return (SBAR_GRENS);
																																									}
																																									else
																																									{
																																										if ((argv (minrate) == "commands"))
																																										{
																																											dprint ("modsv commands added:\n");
																																											dprint ("---------------------\n");
																																											dprint ("prematch\n");
																																											dprint ("overtime\n");
																																											dprint ("rounds\n");
																																											dprint ("roundtime\n");
																																											dprint ("cft\n");
																																											dprint ("gspeed\n");
																																											dprint ("info\n");
																																											dprint ("svinfo\n");
																																											dprint ("password\n");
																																											dprint ("autorecord\n");
																																											dprint ("restart\n");
																																											dprint ("startmatch\n");
																																											dprint ("break\n");
																																											dprint ("clan\n");
																																											dprint ("practice\n");
																																											dprint ("tfstrike\n");
																																											dprint ("tfvsdm\n");
																																											dprint ("duel\n");
																																											dprint ("teamfrags\n");
																																											dprint ("fullts\n");
																																											dprint ("reset\n");
																																											dprint ("clansetup\n");
																																											dprint ("fbskins\n");
																																											dprint ("frj\n");
																																											dprint ("silence\n");
																																											dprint ("grapple\n");
																																											dprint ("ceasefire\n");
																																											dprint ("freeze\n");
																																											dprint ("speedcap\n");
																																											dprint ("flash\n");
																																											dprint ("flag_model\n");
																																											dprint ("grenpacks\n");
																																											dprint ("gibs\n");
																																											dprint ("highlander\n");
																																											dprint ("lights\n");
																																											dprint ("detpack\n");
																																											dprint ("pipedelay\n");
																																											dprint ("grentype\n");
																																											dprint ("sgfire\n");
																																											dprint ("sgtype\n");
																																											dprint ("time\n");
																																											dprint ("commands\n");
																																											dprint ("------------\n");
																																											dprint ("42 Commands\n");
																																											return (SBAR_GRENS);
																																										}
																																									}
																																								}
																																							}
																																						}
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (minrate);
};

void (float sec, float min, float hour, float day, float mon, float year, string date) timeofday =
{
	local entity t;

	t = find (world, classname, "prematch");
	if ((t != world))
	{
		t.no_grenades_1 = sec;
		t.no_grenades_2 = min;
		t.tp_grenades_1 = hour;
		t.tp_grenades_2 = day;
		t.armorclass = mon;
		t.tf_items = year;
		return;
	}
	dprint (date);
	dprint ("\n");
};

void () monster_use =
{
	if (self.enemy)
	{
		return;
	}
	if ((self.health <= minrate))
	{
		return;
	}
	if ((activator.items & 524288))
	{
		return;
	}
	if ((activator.flags & 128))
	{
		return;
	}
	if ((activator.classname != "player"))
	{
		return;
	}
	self.enemy = activator;
	self.nextthink = (time + 0.1);
	self.think = FoundTarget;
};

void () monster_death_use =
{
	local entity ent;

	if ((self.flags & SBAR_GRENS))
	{
		self.flags = (self.flags - SBAR_GRENS);
	}
	if ((self.flags & SBAR_PRINT))
	{
		self.flags = (self.flags - SBAR_PRINT);
	}
	if (!self.target)
	{
		return;
	}
	activator = self.enemy;
	SUB_UseTargets ();
};

void () walkmonster_start_go =
{
	local entity etemp;

	self.origin_z = (self.origin_z + SBAR_GRENS);
	droptofloor ();
	if (!walkmove (minrate, minrate))
	{
		dprint ("walkmonster in wall at: ");
		dprint (vtos (self.origin));
		dprint ("\n");
		self.origin_z = (self.origin_z + 200);
	}
	self.takedamage = SBAR_PRINT;
	self.ideal_yaw = (self.angles * '0 1 0');
	if (!self.yaw_speed)
	{
		self.yaw_speed = 20;
	}
	self.view_ofs = '0 0 25';
	self.use = monster_use;
	self.flags = (self.flags | space);
	if (self.target)
	{
		self.movetarget = find (world, targetname, self.target);
		self.goalentity = find (world, targetname, self.target);
		self.ideal_yaw = vectoyaw ((self.goalentity.origin - self.origin));
		if (!self.movetarget)
		{
			dprint ("Monster can't find target at ");
			dprint (vtos (self.origin));
			dprint ("\n");
		}
		if ((self.movetarget.classname == "path_corner"))
		{
			self.th_walk ();
		}
		else
		{
			self.pausetime = 100000000;
		}
		self.th_stand ();
	}
	else
	{
		self.pausetime = 100000000;
		self.th_stand ();
	}
	self.nextthink = (self.nextthink + (random () * 0.5));
};

void () walkmonster_start =
{
	self.nextthink = (self.nextthink + (random () * 0.5));
	self.think = walkmonster_start_go;
	total_monsters = (total_monsters + SBAR_GRENS);
};

void () enforcer_fire =
{
	local vector org;

	muzzleflash ();
	makevectors (self.angles);
	org = (((self.origin + (v_forward * 30)) + (v_right * 8.5)) + '0 0 16');
	LaunchLaser (org, (self.enemy.origin - self.origin));
};

void () enf_stand1 = [ 0, enf_stand2 ]
{
	ai_stand ();
};

void () enf_stand2 = [ 1, enf_stand3 ]
{
	ai_stand ();
};

void () enf_stand3 = [ 2, enf_stand4 ]
{
	ai_stand ();
};

void () enf_stand4 = [ 3, enf_stand5 ]
{
	ai_stand ();
};

void () enf_stand5 = [ 4, enf_stand6 ]
{
	ai_stand ();
};

void () enf_stand6 = [ 5, enf_stand7 ]
{
	ai_stand ();
};

void () enf_stand7 = [ 6, enf_stand1 ]
{
	ai_stand ();
};

void () enf_walk1 = [ 7, enf_walk2 ]
{
	if ((random () < 0.2))
	{
		sound (self, SBAR_PRINT, "enforcer/idle1.wav", SBAR_GRENS, SBAR_PRINT);
	}
	ai_walk (SBAR_PRINT);
};

void () enf_walk2 = [ 8, enf_walk3 ]
{
	ai_walk (AS_MISSILE);
};

void () enf_walk3 = [ 9, enf_walk4 ]
{
	ai_walk (AS_MISSILE);
};

void () enf_walk4 = [ 10, enf_walk5 ]
{
	ai_walk (AS_MELEE);
};

void () enf_walk5 = [ 11, enf_walk6 ]
{
	ai_walk (SBAR_GRENS);
};

void () enf_walk6 = [ 12, enf_walk7 ]
{
	ai_walk (SBAR_PRINT);
};

void () enf_walk7 = [ 13, enf_walk8 ]
{
	ai_walk (SBAR_PRINT);
};

void () enf_walk8 = [ 14, enf_walk9 ]
{
	ai_walk (SBAR_GRENS);
};

void () enf_walk9 = [ 15, enf_walk10 ]
{
	ai_walk (SBAR_PRINT);
};

void () enf_walk10 = [ 16, enf_walk11 ]
{
	ai_walk (AS_MISSILE);
};

void () enf_walk11 = [ 17, enf_walk12 ]
{
	ai_walk (AS_MISSILE);
};

void () enf_walk12 = [ 18, enf_walk13 ]
{
	ai_walk (SBAR_GRENS);
};

void () enf_walk13 = [ 19, enf_walk14 ]
{
	ai_walk (SBAR_PRINT);
};

void () enf_walk14 = [ 20, enf_walk15 ]
{
	ai_walk (AS_MELEE);
};

void () enf_walk15 = [ 21, enf_walk16 ]
{
	ai_walk (AS_MISSILE);
};

void () enf_walk16 = [ 22, enf_walk1 ]
{
	ai_walk (SBAR_PRINT);
};

void () enf_run1 = [ 23, enf_run2 ]
{
	if ((random () < 0.2))
	{
		sound (self, SBAR_PRINT, "enforcer/idle1.wav", SBAR_GRENS, SBAR_PRINT);
	}
	ai_run (COLOR_GREEN);
};

void () enf_run2 = [ 24, enf_run3 ]
{
	ai_run (14);
};

void () enf_run3 = [ 25, enf_run4 ]
{
	ai_run (7);
};

void () enf_run4 = [ 26, enf_run5 ]
{
	ai_run (12);
};

void () enf_run5 = [ 27, enf_run6 ]
{
	ai_run (14);
};

void () enf_run6 = [ 28, enf_run7 ]
{
	ai_run (14);
};

void () enf_run7 = [ 29, enf_run8 ]
{
	ai_run (7);
};

void () enf_run8 = [ 30, enf_run1 ]
{
	ai_run (SBAR_200);
};

void () enf_atk1 = [ 31, enf_atk2 ]
{
	ai_face ();
};

void () enf_atk2 = [ 32, enf_atk3 ]
{
	ai_face ();
};

void () enf_atk3 = [ 33, enf_atk4 ]
{
	ai_face ();
};

void () enf_atk4 = [ 34, enf_atk5 ]
{
	ai_face ();
};

void () enf_atk5 = [ 35, enf_atk6 ]
{
	ai_face ();
};

void () enf_atk6 = [ 36, enf_atk7 ]
{
	enforcer_fire ();
};

void () enf_atk7 = [ 37, enf_atk8 ]
{
	ai_face ();
};

void () enf_atk8 = [ 38, enf_atk9 ]
{
	ai_face ();
};

void () enf_atk9 = [ 35, enf_atk10 ]
{
	ai_face ();
};

void () enf_atk10 = [ 36, enf_atk11 ]
{
	enforcer_fire ();
};

void () enf_atk11 = [ 37, enf_atk12 ]
{
	ai_face ();
};

void () enf_atk12 = [ 38, enf_atk13 ]
{
	ai_face ();
};

void () enf_atk13 = [ 39, enf_atk14 ]
{
	ai_face ();
};

void () enf_atk14 = [ 40, enf_run1 ]
{
	ai_face ();
	SUB_CheckRefire (enf_atk1);
};

void () enf_paina1 = [ 66, enf_paina2 ]
{
};

void () enf_paina2 = [ 67, enf_paina3 ]
{
};

void () enf_paina3 = [ 68, enf_paina4 ]
{
};

void () enf_paina4 = [ 69, enf_run1 ]
{
};

void () enf_painb1 = [ 70, enf_painb2 ]
{
};

void () enf_painb2 = [ 71, enf_painb3 ]
{
};

void () enf_painb3 = [ 72, enf_painb4 ]
{
};

void () enf_painb4 = [ 73, enf_painb5 ]
{
};

void () enf_painb5 = [ 74, enf_run1 ]
{
};

void () enf_painc1 = [ 75, enf_painc2 ]
{
};

void () enf_painc2 = [ 76, enf_painc3 ]
{
};

void () enf_painc3 = [ 77, enf_painc4 ]
{
};

void () enf_painc4 = [ 78, enf_painc5 ]
{
};

void () enf_painc5 = [ 79, enf_painc6 ]
{
};

void () enf_painc6 = [ 80, enf_painc7 ]
{
};

void () enf_painc7 = [ 81, enf_painc8 ]
{
};

void () enf_painc8 = [ 82, enf_run1 ]
{
};

void () enf_paind1 = [ 83, enf_paind2 ]
{
};

void () enf_paind2 = [ 84, enf_paind3 ]
{
};

void () enf_paind3 = [ 85, enf_paind4 ]
{
};

void () enf_paind4 = [ 86, enf_paind5 ]
{
	ai_painforward (SBAR_PRINT);
};

void () enf_paind5 = [ 87, enf_paind6 ]
{
	ai_painforward (SBAR_GRENS);
};

void () enf_paind6 = [ 88, enf_paind7 ]
{
};

void () enf_paind7 = [ 89, enf_paind8 ]
{
};

void () enf_paind8 = [ 90, enf_paind9 ]
{
};

void () enf_paind9 = [ 91, enf_paind10 ]
{
};

void () enf_paind10 = [ 92, enf_paind11 ]
{
};

void () enf_paind11 = [ 93, enf_paind12 ]
{
	ai_painforward (SBAR_GRENS);
};

void () enf_paind12 = [ 94, enf_paind13 ]
{
	ai_painforward (SBAR_GRENS);
};

void () enf_paind13 = [ 95, enf_paind14 ]
{
	ai_painforward (SBAR_GRENS);
};

void () enf_paind14 = [ 96, enf_paind15 ]
{
};

void () enf_paind15 = [ 97, enf_paind16 ]
{
};

void () enf_paind16 = [ 98, enf_paind17 ]
{
	ai_pain (SBAR_GRENS);
};

void () enf_paind17 = [ 99, enf_paind18 ]
{
	ai_pain (SBAR_GRENS);
};

void () enf_paind18 = [ 100, enf_paind19 ]
{
};

void () enf_paind19 = [ 101, enf_run1 ]
{
};

void (entity attacker, float damage) enf_pain =
{
	local float r;

	r = random ();
	if ((self.pain_finished > time))
	{
		return;
	}
	if ((r < 0.5))
	{
		sound (self, SBAR_PRINT, "enforcer/pain1.wav", SBAR_GRENS, SBAR_GRENS);
	}
	else
	{
		sound (self, SBAR_PRINT, "enforcer/pain2.wav", SBAR_GRENS, SBAR_GRENS);
	}
	if ((r < 0.2))
	{
		self.pain_finished = (time + SBAR_GRENS);
		enf_paina1 ();
	}
	else
	{
		if ((r < 0.4))
		{
			self.pain_finished = (time + SBAR_GRENS);
			enf_painb1 ();
		}
		else
		{
			if ((r < 0.7))
			{
				self.pain_finished = (time + SBAR_GRENS);
				enf_painc1 ();
			}
			else
			{
				self.pain_finished = (time + SBAR_PRINT);
				enf_paind1 ();
			}
		}
	}
};

void () enf_die1 = [ 41, enf_die2 ]
{
};

void () enf_die2 = [ 42, enf_die3 ]
{
};

void () enf_die3 = [ 43, enf_die4 ]
{
	self.solid = minrate;
	self.ammo_cells = 5;
	DropBackpack ();
};

void () enf_die4 = [ 44, enf_die5 ]
{
	ai_forward (14);
};

void () enf_die5 = [ 45, enf_die6 ]
{
	ai_forward (SBAR_PRINT);
};

void () enf_die6 = [ 46, enf_die7 ]
{
};

void () enf_die7 = [ 47, enf_die8 ]
{
};

void () enf_die8 = [ 48, enf_die9 ]
{
};

void () enf_die9 = [ 49, enf_die10 ]
{
	ai_forward (AS_MELEE);
};

void () enf_die10 = [ 50, enf_die11 ]
{
	ai_forward (5);
};

void () enf_die11 = [ 51, enf_die12 ]
{
	ai_forward (5);
};

void () enf_die12 = [ 52, enf_die13 ]
{
	ai_forward (5);
};

void () enf_die13 = [ 53, enf_die14 ]
{
};

void () enf_die14 = [ 54, enf_die14 ]
{
};

void () enf_fdie1 = [ 55, enf_fdie2 ]
{
};

void () enf_fdie2 = [ 56, enf_fdie3 ]
{
};

void () enf_fdie3 = [ 57, enf_fdie4 ]
{
	self.solid = minrate;
	self.ammo_cells = 5;
	DropBackpack ();
};

void () enf_fdie4 = [ 58, enf_fdie5 ]
{
};

void () enf_fdie5 = [ 59, enf_fdie6 ]
{
};

void () enf_fdie6 = [ 60, enf_fdie7 ]
{
};

void () enf_fdie7 = [ 61, enf_fdie8 ]
{
};

void () enf_fdie8 = [ 62, enf_fdie9 ]
{
};

void () enf_fdie9 = [ 63, enf_fdie10 ]
{
};

void () enf_fdie10 = [ 64, enf_fdie11 ]
{
};

void () enf_fdie11 = [ 65, enf_fdie11 ]
{
};

void () enf_die =
{
	if ((self.health < -35))
	{
		sound (self, SBAR_PRINT, "player/udeath.wav", SBAR_GRENS, SBAR_GRENS);
		ThrowHead ("progs/h_mega.mdl", self.health);
		ThrowGib ("progs/gib1.mdl", self.health);
		ThrowGib ("progs/gib2.mdl", self.health);
		ThrowGib ("progs/gib3.mdl", self.health);
		return;
	}
	sound (self, SBAR_PRINT, "enforcer/death1.wav", SBAR_GRENS, SBAR_GRENS);
	if ((random () > 0.5))
	{
		enf_die1 ();
	}
	else
	{
		enf_fdie1 ();
	}
};

void () spawn_hostage =
{
	self.solid = AS_MELEE;
	self.movetype = AS_MISSILE;
	self.oldorigin = self.origin;
	num_hostages = (num_hostages + SBAR_GRENS);
	setmodel (self, "progs/enforcer.mdl");
	setsize (self, '-16 -16 -24', '16 16 40');
	self.health = _x;
	walkmonster_start ();
};

void () hostage_entity =
{
	precache_model2 ("progs/enforcer.mdl");
	precache_model2 ("progs/h_mega.mdl");
	precache_model2 ("progs/laser.mdl");
	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/idle1.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
	self.th_stand = enf_stand1;
	self.th_walk = enf_walk1;
	self.th_run = enf_run1;
	self.th_pain = enf_pain;
	self.th_die = enf_die;
	spawn_hostage ();
};
