//=-=-=-=-=

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
		totalp = (totalp + 1);
		if ((Player.playerclass && !Player.deadflag))
		{
			nump = (nump + 1);
			if ((Player.team_no == 1))
			{
				team1alive = (team1alive + 1);
			}
			if ((Player.team_no == 2))
			{
				team2alive = (team2alive + 1);
			}
			if ((Player.team_no == 3))
			{
				team3alive = (team3alive + 1);
			}
			if ((Player.team_no == 4))
			{
				team4alive = (team4alive + 1);
			}
		}
		Player = find (Player, classname, "player");
	}
	if (((nump > 0) && (totalp > 1)))
	{
		if ((((team1alive && !team2alive) && !team3alive) && !team4alive))
		{
			if (tfstrike)
			{
				Player = find (world, classname, "detpack");
				if ((Player != world))
				{
					return (0);
				}
			}
			return (1);
		}
		if ((((!team1alive && team2alive) && !team3alive) && !team4alive))
		{
			return (2);
		}
		if ((((!team1alive && !team2alive) && team3alive) && !team4alive))
		{
			return (3);
		}
		if ((((!team1alive && !team2alive) && !team3alive) && team4alive))
		{
			return (4);
		}
	}
	if (!nump)
	{
		if (tfstrike)
		{
			Player = find (world, classname, "detpack");
			if ((Player != world))
			{
				return (2);
			}
		}
		return (-1);
	}
	return (0);
};

void () RoundOver =
{
	local string st;

	round_over = 2;
	if ((tfs_winner == -1))
	{
		bprint (2, "Round Drawn!\n");
	}
	else
	{
		if ((tfs_winner == 1))
		{
			if (tfstrike)
			{
				sound (self, 2, "speech/ctwin.wav", 1, 0);
				bprint (2, "Counter Terrorists WIN!\n");
				TeamFortress_TeamIncreaseScore (tfs_winner, enter);
			}
			else
			{
				bprint (2, "Blue Team Wins the Round!\n");
			}
		}
		else
		{
			if ((tfs_winner == 2))
			{
				if (tfstrike)
				{
					sound (self, 2, "speech/terwin.wav", 1, 0);
					bprint (2, "Terrorists WIN!\n");
					TeamFortress_TeamIncreaseScore (tfs_winner, enter);
				}
				else
				{
					bprint (2, "Red Team Wins the Round!\n");
				}
			}
			else
			{
				if ((tfs_winner == 3))
				{
					bprint (2, "Yellow Team Wins the Round!\n");
				}
				else
				{
					if ((tfs_winner == 4))
					{
						bprint (2, "Green Team Wins the Round!\n");
					}
				}
			}
		}
	}
	if (TeamFortress_CheckDraw ())
	{
		if ((rounds == 1))
		{
			rounds = (rounds + 1);
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
		self.nextthink = (time + 3);
		return;
	}
	self.cnt2 = (self.cnt2 - 0.5);
	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - 1);
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}
	if (!self.cnt2)
	{
		if (((self.cnt == 1) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (2, "ê", tmp, "ë minute");
			if ((self.cnt != 1))
			{
				bprint (2, "s");
			}
			bprint (2, " remaining\n");
		}
		if (!self.cnt)
		{
			bprint (2, "ROUND TIME OVER\n");
			if (tfstrike)
			{
				tfs_winner = 1;
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
			bprint3 (2, "ê", tmp, "ë second");
			if ((self.cnt2 != 1))
			{
				bprint (2, "s");
			}
			bprint (2, " remaining\n");
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
		if (((te.team_no == 2) && te.playerclass))
		{
			counter = (counter + 1);
		}
		te = find (te, classname, "player");
	}
	if ((counter == 1))
	{
		the_one = counter;
	}
	else
	{
		if ((counter > 1))
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
		te.solid = 4;
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
			self.hook_out = 1;
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
					self.tfstate = 0;
				}
				self.takedamage = 2;
				self.flags = 8;
				self.air_finished = (time + 12);
				self.dmg = 2;
				self.super_damage_finished = 0;
				self.radsuit_finished = 0;
				self.invisible_finished = 0;
				self.invincible_finished = 0;
				self.effects = 0;
				self.invincible_time = 0;
				self.reload_shotgun = 0;
				self.reload_super_shotgun = 0;
				self.reload_grenade_launcher = 0;
				self.reload_rocket_launcher = 0;
				self.on_hook = 0;
				self.hook_out = 0;
				self.fire_held_down = 0;
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
				if (((self.team_no == 2) && self.playerclass))
				{
					counter = (counter + 1);
					if ((counter == bomber))
					{
						self.ammo_detpack = 1;
						stuffcmd (self, "topcolor 0\n");
						CenterPrint (self, "You have the bomb!\n");
						if ((self.playerclass == 8))
						{
							self.is_unabletospy = 1;
						}
					}
				}
			}
		}
		self = oldself;
		te = find (te, classname, "player");
	}
	bprint (2, "ROUND BEGINS NOW\n");
	round_active = 1;
	round_over = 0;
	if (speedcap)
	{
		self.invisible_time = time;
	}
	if (!self.cnt)
	{
		self.cnt = 3;
		self.cnt2 = 60;
	}
	else
	{
		counter = floor (self.cnt);
		if ((counter < self.cnt))
		{
			self.cnt2 = ((self.cnt - counter) * 60);
		}
		else
		{
			self.cnt2 = 60;
		}
		if ((self.cnt2 == 60))
		{
			self.cnt = (self.cnt - 1);
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
	if ((fl < 1))
	{
		self.nextthink = (time + 2);
		return;
	}
	self.cnt2 = (self.cnt2 - 1);
	if ((self.cnt2 == 2))
	{
		round_over = 2;
	}
	if ((self.cnt2 == 1))
	{
		p = find (world, classname, "player");
		while ((p != world))
		{
			if ((p.netname != ""))
			{
				p.takedamage = 0;
				p.solid = 0;
				p.movetype = 0;
				p.modelindex = 0;
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
					p.takedamage = 2;
					p.solid = 3;
					p.movetype = 3;
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
				cease_fire = 0;
				if (duel)
				{
					if ((self.cnt2 == 3))
					{
						stuffcmd (p, "play 3.wav\n");
					}
					else
					{
						if ((self.cnt2 == 2))
						{
							stuffcmd (p, "play 2.wav\n");
						}
						else
						{
							if ((self.cnt2 == 1))
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
	self.nextthink = (time + 1);
};

void () StartRound =
{
	local string st;
	local float fl;
	local entity te;
	local entity oldself;
	local entity gren;

	if ((rounds == 1))
	{
		NextLevel ();
		bprint (2, "Rounds Over!\n");
	}
	if ((rounds > 1))
	{
		rounds = (rounds - 1);
	}
	if (intermission_running)
	{
		return;
	}
	tfs_winner = 0;
	round_over = 1;


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
				self.hook_out = 1;
			}
			self.menu_count = 30;
			self.current_menu = 1;
			TeamFortress_ThrowGrenade ();
			TeamFortress_RemoveTimers ();
			if ((self.playerclass == 9))
			{
				Engineer_RemoveBuildings (self);
			}
			if (tfstrike)
			{
				if (((self.team_no == 2) && self.playerclass))
				{
					self.ammo_detpack = 0;
					stuffcmd (self, "topcolor ");
					fl = (TeamFortress_GetColor (self.team_no) - 1);
					st = ftos (fl);
					stuffcmd (self, st);
					stuffcmd (self, "\n");
				}
			}
			self = oldself;
			te = find (te, classname, "player");
		}
		round_active = 0;
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
		if ((te.weaponmode == 1))
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
			oldself.weapon = 3;
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
	if (((fl < 3) || (fl > 20)))
	{
		fl = enter;
	}
	te.cnt2 = fl;
	st = infokey (world, "round_time");
	te.cnt = stof (st);
	te.think = RoundInit;
	te.nextthink = (time + 2);
};
