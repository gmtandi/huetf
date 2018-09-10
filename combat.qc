//=-=-=-=-=
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
		traceline (inflictor.origin, (0.5 * (targ.absmin + targ.absmax)), 1, self);
		if ((trace_fraction == 1))
		{
			return (1);
		}
		if ((trace_ent == targ))
		{
			return (1);
		}
		return (0);
	}
	traceline (inflictor.origin, targ.origin, 1, self);
	if ((trace_fraction == 1))
	{
		return (1);
	}
	traceline (inflictor.origin, (targ.origin + '15 15 0'), 1, self);
	if ((trace_fraction == 1))
	{
		return (1);
	}
	traceline (inflictor.origin, (targ.origin + '-15 -15 0'), 1, self);
	if ((trace_fraction == 1))
	{
		return (1);
	}
	traceline (inflictor.origin, (targ.origin + '-15 15 0'), 1, self);
	if ((trace_fraction == 1))
	{
		return (1);
	}
	traceline (inflictor.origin, (targ.origin + '15 -15 0'), 1, self);
	if ((trace_fraction == 1))
	{
		return (1);
	}
	return (0);
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
	if (((self.movetype == 7) || (self.movetype == 0)))
	{
		self.th_die ();
		self = oself;
		return;
	}
	self.enemy = attacker;
	if ((self.flags & space))
	{
		killed_monsters = (killed_monsters + 1);
		WriteByte (2, 27);
	}
	ClientObituary (self, attacker);
	self.takedamage = 0;
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
	local float prevHealth;
	local float prevArmor;

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
			damage = (damage * 4);
		}
		if ((targ.classname != "player"))
		{
			if (!Activated (targ, attacker))
			{
				if ((targ.else_goal != 0))
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
		targ.armortype = 0;
		targ.armorclass = 0;
		targ.items = (targ.items - (targ.items & ((8192 | 16384) | 32768)));
	}
	prevArmor = targ.armorvalue;
	targ.armorvalue = (targ.armorvalue - save);
	take = ceil ((damage - save));
	if ((targ.flags & 8))
	{
		targ.dmg_take = (targ.dmg_take + take);
		targ.dmg_save = (targ.dmg_save + save);
		targ.dmg_inflictor = inflictor;
	}
	if (((inflictor != world) && (targ.movetype == 3)))
	{
		targ.immune_to_check = (time + (damage / 20));
		dir = (targ.origin - ((inflictor.absmin + inflictor.absmax) * 0.5));
		dir = normalize (dir);
		if ((((damage < 60) & ((attacker.classname == "player") & (targ.classname == "player"))) & (attacker.netname != targ.netname)))
		{
			targ.velocity = (targ.velocity + ((dir * damage) * 11));
		}
		else
		{
			targ.velocity = (targ.velocity + ((dir * damage) * 8));
		}
		if ((((rj > 1) & ((attacker.classname == "player") & (targ.classname == "player"))) & (attacker.netname == targ.netname)))
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
			sound (targ, 3, "items/protect3.wav", 1, 1);
			self.invincible_sound = (time + 2);
		}
		return;
	}
	if (((attacker.classname == "player") && ((targ.classname == "player") || (targ.classname == "building_sentrygun"))))
	{
		if ((((targ.team_no > 0) && (targ.team_no == attacker.team_no)) && (targ != attacker)))
		{
			if ((teamplay & 16))
			{
				return;
			}
			else
			{
				if ((teamplay & 8))
				{
					take = (take / 2);
				}
			}
		}
	}
	if (((take < 1) && (take != 0)))
	{
		take = 1;
	}
	if ((practice && (targ.classname == "player")))
	{
		targ.health = (1000 + take);
	}
	else
	{
		prevHealth = targ.health;
		targ.health = (targ.health - take);
		if (take > prevHealth)
			take = prevHealth + prevArmor;
	}
	if ((targ.armorvalue < 1))
	{
		targ.armorclass = 0;
		targ.armorvalue = 0;
	}
	if ((attacker.classname == "player" || targ.classname == "player") && (take + save > 0)) {
		LogEventDamage(attacker, targ, inflictor, take + save);
	}
	if ((targ.health <= 0))
	{
		LogEventKill(attacker, targ, inflictor);
		Killed (targ, attacker);
		return;
	}
	oldself = self;
	self = targ;
	if (self.th_pain)
	{
		self.th_pain (attacker, take);
		if ((skill >= 3))
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
	local float prevHealth;
	local float prevArmor;

	if ((targ.takedamage == 0))
	{
		return;
	}
	if ((T_AttackType & 256))
	{
		targ.health = damage;
		return;
	}
	if ((cease_fire) && ((targ.classname != "building_dispenser") && (targ.classname != "building_sentrygun")) )
	{
		return;
	}
	no_damage = 0;
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
			damage = (damage * 4);
		}
		if ((((targ.classname != "player") && (targ.classname != "building_sentrygun")) && (targ.classname != "building_dispenser")))
		{
			if (!Activated (targ, attacker))
			{
				if ((targ.else_goal != 0))
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
	if (((targ.armorclass != 0) && (T_AttackType != 0)))
	{
		if (((targ.armorclass & 1) && (T_AttackType & 1)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & 2) && (T_AttackType & 2)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & 4) && (T_AttackType & 4)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & 8) && (T_AttackType & 8)))
		{
			damage = floor ((damage * 0.5));
		}
		if (((targ.armorclass & 16) && (T_AttackType & 16)))
		{
			damage = floor ((damage * 0.5));
		}
	}
	if ((T_flags & 1))
	{
		take = damage;
		save = 0;
	}
	else
	{
		save = ceil ((targ.armortype * damage));
		if ((((((attacker.classname == "player") && (targ.team_no > 0)) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & 2)))
		{
			if ((T_AttackType & 4))
			{
				if ((teamplay & 1024))
				{
					save = 0;
				}
				else
				{
					if ((teamplay & 512))
					{
						save = (save / 2);
					}
				}
			}
			else
			{
				if ((teamplay & 256))
				{
					save = 0;
				}
				else
				{
					if ((teamplay & 128))
					{
						save = (save / 2);
					}
				}
			}
		}
		if ((save >= targ.armorvalue))
		{
			save = targ.armorvalue;
			targ.armortype = 0;
			targ.armorclass = 0;
			targ.items = (targ.items - (targ.items & ((8192 | 16384) | 32768)));
		}
		prevArmor = targ.armorvalue;
		targ.armorvalue = (targ.armorvalue - save);
		take = ceil ((damage - save));
	}
	if ((targ.flags & 8))
	{
		targ.dmg_take = (targ.dmg_take + take);
		targ.dmg_save = (targ.dmg_save + save);
		targ.dmg_inflictor = inflictor;
	}
	if ((((inflictor != world) && (targ.movetype == 3)) && !(targ.tfstate & 65536)))
	{
		if ((deathmsg != 9))
		{
			targ.immune_to_check = (time + (damage / 20));
			dir = (targ.origin - ((inflictor.absmin + inflictor.absmax) * 0.5));
			dir = normalize (dir);
			if ((targ.playerclass == 6))
			{
				if (!classrework) {
					moment = (damage / 4);
					if ((damage <= _2))
					{
						moment = 0;
					}
				}
				else {
					moment = (damage / 2);
				}
			}
			else
			{
				moment = damage;
			}
			if (inflictor.classname == "bolt") {
				moment = moment*2;
				if ((targ.playerclass == 6))
					moment = moment*3.5;
			}
			if ((((moment < 60) && ((attacker.classname == "player") && (targ.classname == "player"))) && (attacker.netname != targ.netname)))
			{
				targ.velocity = (targ.velocity + ((dir * moment) * 11));
			}
			else
			{
				targ.velocity = (targ.velocity + ((dir * moment) * 8));
			}
			if ((((rj > 1) && ((attacker.classname == "player") && (targ.classname == "player"))) && (attacker.netname == targ.netname)))
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
			sound (targ, 3, "items/protect3.wav", 1, 1);
			self.invincible_sound = (time + 2);
		}
		return;
	}
	if (((attacker.classname == "player") && (((((targ.classname == "player") || (targ.classname == "building_sentrygun")) || (targ.classname == "building_dispenser")) || (targ.classname == "building_teleporter_entrance")) || (targ.classname == "building_teleporter_exit"))))
	{
		if (((((targ.team_no > 0) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & 2)))
		{
			if ((T_AttackType & 4))
			{
				if ((teamplay & 16))
				{
					no_damage = 1;
				}
				else
				{
					if ((teamplay & 8))
					{
						take = (take / 2);
					}
				}
			}
			else
			{
				if ((teamplay & 4))
				{
					no_damage = 1;
				}
				else
				{
					if ((teamplay & 2))
					{
						take = (take / 2);
					}
				}
			}
		}
	}
	if ((T_flags & 4))
	{
		if ((targ == attacker))
		{
			return;
		}
	}
	if ((take < 1))
	{
		take = 1;
	}
	take = rint (take);
	if ((no_damage == 0))
	{
		if ((practice && (targ.classname == "player")))
		{
			targ.health = (1000 + take);
		}
		else
		{
			prevHealth = targ.health;
			targ.health = (targ.health - take);
			if (take > prevHealth)
				take = prevHealth + prevArmor;
		}
	}
	if (((attacker.classname == "player") && (((targ.classname == "player") || (targ.classname == "building_sentrygun")) || (targ.classname == "building_dispenser"))))
	{
		if (((((targ.team_no > 0) && (targ.team_no == attacker.team_no)) && (targ != attacker)) && (T_flags & 2)))
		{
			olddmsg = deathmsg;
			if ((T_AttackType & 4))
			{
				deathmsg = 37;
				if ((teamplay & 16384))
				{
					TF_T_Damage (attacker, world, world, take, 1, 0);
				}
				else
				{
					if ((teamplay & 8192))
					{
						take = take/2;
						TF_T_Damage (attacker, world, world, take, 1, 0);
					}
				}
			}
			else
			{
				deathmsg = 37;
				if ((teamplay & 4096))
				{
					TF_T_Damage (attacker, world, world, take, 1, 0);
				}
				else
				{
					if ((teamplay & 2048))
					{
						take = take/2;
						TF_T_Damage (attacker, world, world, take, 1, 0);
					}
				}
			}
			deathmsg = olddmsg;
		}
	}
	if ((no_damage == 1))
	{
		return;
	}
	if ((attacker.classname == "player" || targ.classname == "player") && (take + save > 0)) {
		LogEventDamage(attacker, targ, inflictor, take + save);
	}
	if ((targ.armorvalue < 1))
	{
		targ.armorclass = 0;
		targ.armorvalue = 0;
	}
	if ((targ.health <= 0))
	{
		if ((((inflictor.classname == "detpack") && (inflictor.weaponmode == 1)) && (inflictor.enemy == targ)))
		{
			deathmsg = 16;
		}
		LogEventKill(attacker, targ, inflictor);
		Killed (targ, attacker);
		return;
	}
	oldself = self;
	self = targ;
	if (self.th_pain)
	{
		self.th_pain (attacker, take);
		if ((skill >= 3))
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
				if ((points < 0))
				{
					points = 0;
				}
				points = (damage - points);
				if ((head == attacker))
				{
					points = (points * 0.75);
				}
				if ((points > 0))
				{
					if (CanDamage (head, inflictor))
					{
						if ((inflictor.weapon == 33))
						{
							TF_T_Damage (head, inflictor, attacker, points, 2, 4);
							other = head;
							Napalm_touch ();
							if ((other.classname == "player"))
							{
								stuffcmd (other, "bf\nbf\n");
							}
						}
						else
						{
							TF_T_Damage (head, inflictor, attacker, points, 2, 4);
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
			if ((points > 0))
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
