//=-=-=-=-=

void () monster_use =
{
	if (self.enemy)
	{
		return;
	}
	if ((self.health <= 0))
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

	if ((self.flags & 1))
	{
		self.flags = (self.flags - 1);
	}
	if ((self.flags & 2))
	{
		self.flags = (self.flags - 2);
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

	self.origin_z = (self.origin_z + 1);
	droptofloor ();
	if (!walkmove (0, 0))
	{
		dprint ("walkmonster in wall at: ");
		dprint (vtos (self.origin));
		dprint ("\n");
		self.origin_z = (self.origin_z + 200);
	}
	self.takedamage = 2;
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
	total_monsters = (total_monsters + 1);
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
		sound (self, 2, "enforcer/idle1.wav", 1, 2);
	}
	ai_walk (2);
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
	ai_walk (1);
};

void () enf_walk6 = [ 12, enf_walk7 ]
{
	ai_walk (2);
};

void () enf_walk7 = [ 13, enf_walk8 ]
{
	ai_walk (2);
};

void () enf_walk8 = [ 14, enf_walk9 ]
{
	ai_walk (1);
};

void () enf_walk9 = [ 15, enf_walk10 ]
{
	ai_walk (2);
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
	ai_walk (1);
};

void () enf_walk13 = [ 19, enf_walk14 ]
{
	ai_walk (2);
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
	ai_walk (2);
};

void () enf_run1 = [ 23, enf_run2 ]
{
	if ((random () < 0.2))
	{
		sound (self, 2, "enforcer/idle1.wav", 1, 2);
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
	ai_run (11);
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
	ai_painforward (2);
};

void () enf_paind5 = [ 87, enf_paind6 ]
{
	ai_painforward (1);
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
	ai_painforward (1);
};

void () enf_paind12 = [ 94, enf_paind13 ]
{
	ai_painforward (1);
};

void () enf_paind13 = [ 95, enf_paind14 ]
{
	ai_painforward (1);
};

void () enf_paind14 = [ 96, enf_paind15 ]
{
};

void () enf_paind15 = [ 97, enf_paind16 ]
{
};

void () enf_paind16 = [ 98, enf_paind17 ]
{
	ai_pain (1);
};

void () enf_paind17 = [ 99, enf_paind18 ]
{
	ai_pain (1);
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
		sound (self, 2, "enforcer/pain1.wav", 1, 1);
	}
	else
	{
		sound (self, 2, "enforcer/pain2.wav", 1, 1);
	}
	if ((r < 0.2))
	{
		self.pain_finished = (time + 1);
		enf_paina1 ();
	}
	else
	{
		if ((r < 0.4))
		{
			self.pain_finished = (time + 1);
			enf_painb1 ();
		}
		else
		{
			if ((r < 0.7))
			{
				self.pain_finished = (time + 1);
				enf_painc1 ();
			}
			else
			{
				self.pain_finished = (time + 2);
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
	self.solid = 0;
	self.ammo_cells = 5;
	DropBackpack ();
};

void () enf_die4 = [ 44, enf_die5 ]
{
	ai_forward (14);
};

void () enf_die5 = [ 45, enf_die6 ]
{
	ai_forward (2);
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
	self.solid = 0;
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
		sound (self, 2, "player/udeath.wav", 1, 1);
		ThrowHead ("progs/h_mega.mdl", self.health);
		ThrowGib ("progs/gib1.mdl", self.health);
		ThrowGib ("progs/gib2.mdl", self.health);
		ThrowGib ("progs/gib3.mdl", self.health);
		return;
	}
	sound (self, 2, "enforcer/death1.wav", 1, 1);
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
	num_hostages = (num_hostages + 1);
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
