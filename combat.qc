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
