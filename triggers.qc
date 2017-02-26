//=-=-=-=-=
entity stemp;
entity otemp;
entity s;
entity old;
void () TeamFortress_DetpackExplode;

void () trigger_reactivate =
{
	self.solid = 1;
};

void () multi_wait =
{
	if (self.max_health)
	{
		self.health = self.max_health;
		self.takedamage = 1;
		self.solid = 2;
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
		found_secrets = (found_secrets + 1);
		WriteByte (2, 28);
	}
	if (self.noise)
	{
		sound (self, 2, self.noise, 1, 1);
	}
	self.takedamage = 0;
	activator = self.enemy;
	SUB_UseTargets ();
	if ((self.wait > 0))
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
	if ((freeze == 1))
	{
		return;
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != 0))
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
		if (((v_forward * self.movedir) < 0))
		{
			return;
		}
	}
	self.enemy = other;
	multi_trigger ();
};

void () trigger_multiple =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	if ((self.sounds == 1))
	{
		precache_sound ("misc/secret.wav");
		self.noise = "misc/secret.wav";
	}
	else
	{
		if ((self.sounds == 2))
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
		if ((self.spawnflags & 1))
		{
			objerror ("health && notouch don't make sense\n");
		}
		self.max_health = self.health;
		self.th_die = multi_killed;
		self.takedamage = 1;
		self.solid = 2;
		setorigin (self, self.origin);
	}
	else
	{
		if (!(self.spawnflags & 1))
		{
			self.touch = multi_touch;
		}
	}
};

void () trigger_once =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.wait = -1;
	trigger_multiple ();
};

void () trigger_relay =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.use = SUB_UseTargets;
};

void () trigger_secret =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	total_secrets = (total_secrets + 1);
	self.wait = -1;
	if (!self.message)
	{
		self.message = "You found a secret area!";
	}
	if (!self.sounds)
	{
		self.sounds = 1;
	}
	if ((self.sounds == 1))
	{
		precache_sound ("misc/secret.wav");
		self.noise = "misc/secret.wav";
	}
	else
	{
		if ((self.sounds == 2))
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

	self.count = (self.count - 1);
	if ((self.count < 0))
	{
		return;
	}
	if ((self.count != 0))
	{
		if (((activator.classname == "player") && ((self.spawnflags & 1) == 0)))
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
					if ((self.count == 2))
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
	if (((activator.classname == "player") && ((self.spawnflags & 1) == 0)))
	{
		CenterPrint (activator, "Sequence completed!");
	}
	self.enemy = activator;
	multi_trigger ();
};

void () trigger_counter =
{
	if ((CheckExistence () == 0))
	{
		dremove (self);
		return;
	}
	self.wait = -1;
	if (!self.count)
	{
		self.count = 2;
	}
	self.use = counter_use;
};

void () play_teleport =
{
	local float v;
	local string tmpstr;

	v = (random () * 5);
	if ((v < 1))
	{
		tmpstr = "misc/r_tele1.wav";
	}
	else
	{
		if ((v < 2))
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
	sound (self, 2, tmpstr, 1, 1);
	remove (self);
};

void (vector org) spawn_tfog =
{
	s = spawn ();
	s.origin = org;
	s.nextthink = (time + 0.2);
	s.think = play_teleport;
	WriteByte (AS_MISSILE, 23);
	WriteByte (AS_MISSILE, 11);
	WriteCoord (AS_MISSILE, org_x);
	WriteCoord (AS_MISSILE, org_y);
	WriteCoord (AS_MISSILE, org_z);
	multicast (org, 1);
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
	death.movetype = 0;
	death.solid = 1;
	death.angles = '0 0 0';
	setsize (death, (death_owner.mins - '4 4 4'), (death_owner.maxs + '4 4 4'));
	setorigin (death, org);
	death.touch = tdeath_touch;
	death.nextthink = (time + 0.2);
	death.think = SUB_Remove;
	death.owner = death_owner;
	force_retouch = 2;
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
	if ((self.spawnflags & 1))
	{
		if ((other.classname != "player"))
		{
			return;
		}
	}
	if (!Activated (self, other))
	{
		if ((self.else_goal != 0))
		{
			te = Findgoal (self.else_goal);
			if (te)
			{
				AttemptToActivate (te, other, self);
			}
		}
		return;
	}
	if (((other.health <= 0) || (other.solid != AS_MELEE)))
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
		if (((other.weapon == 1) && other.hook_out))
		{
			sound (other, 1, "weapons/bounce2.wav", 1, 1);
			other.on_hook = 0;
			other.hook_out = 0;
			other.fire_held_down = 0;
			other.weaponframe = 0;
			other.attack_finished = (time + 0.75);
		}
		other.fixangle = 1;
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
	if ((CheckExistence () == 0))
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
	force_retouch = 2;
	self.think = SUB_Null;
};

void () trigger_teleport =
{
	local vector o;

	if ((CheckExistence () == 0))
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
	if (!(self.spawnflags & 2))
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
		if ((self.else_goal != 0))
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
		if ((self.else_goal != 0))
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
	self.attack_finished = (time + 2);
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
			sound (other, AS_MISSILE, "misc/talk.wav", 1, 1);
		}
	}
};

void () trigger_onlyregistered =
{
	if ((CheckExistence () == 0))
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
		ent.solid = 0;
	}
	else
	{
		ent.solid = 1;
	}
	ent.nextthink = -1;
};

void () hurt_on =
{
	self.solid = 1;
	self.nextthink = -1;
};

void () hurt_touch =
{
	local entity te;

	if (other.takedamage)
	{
		if (!Activated (self, other))
		{
			if ((self.else_goal != 0))
			{
				te = Findgoal (self.else_goal);
				if (te)
				{
					AttemptToActivate (te, other, self);
				}
			}
			return;
		}
		if ((self.cnt > 0))
		{
			self.cnt = (self.cnt - 1);
			if ((self.cnt == 0))
			{
				self.touch = SUB_Null;
				self.nextthink = (time + 0.1);
				self.think = SUB_Remove;
			}
		}
		self.solid = 0;
		deathmsg = 36;
		TF_T_Damage (other, self, self, self.dmg, 1, 0);
		self.think = hurt_on;
		self.nextthink = (time + 1);
	}
};

void () trigger_hurt =
{
	if ((CheckExistence () == 0))
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
		if ((self.else_goal != 0))
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
		if ((other.health > 0))
		{
			other.velocity = ((self.speed * self.movedir) * enter);
			if ((other.classname == "player"))
			{
				if ((other.fly_sound < time))
				{
					other.fly_sound = (time + 1.5);
					sound (other, 0, "ambience/windfly.wav", 1, 1);
				}
			}
		}
	}
	if ((self.spawnflags & 1))
	{
		dremove (self);
	}
};

void () trigger_push =
{
	if ((CheckExistence () == 0))
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
	if ((CheckExistence () == 0))
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
	if (((other.flags & ((space | 1) | 2)) != space))
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
	if ((CheckExistence () == 0))
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
