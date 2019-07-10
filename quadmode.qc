//=-=-=-=-=

float () CheckWinningTeam =
{
	local float win_score = 0;
	local float winning_team = 0;

	if (team1score > win_score) {
		win_score = team1score;
		winning_team = 1;
	}
	
	if (team2score > win_score) {
		win_score = team2score;
		winning_team = 2;
	}
	else if (team2score == win_score) {
		winning_team = 0;
	}


	if (team3score > win_score) {
		win_score = team3score;
		winning_team = 3;
	}
	else if (team3score == win_score) {
		winning_team = 0;
	}

	if (team4score > win_score) {
		win_score = team4score;
		winning_team = 4;
	}
	else if (team4score == win_score) {
		winning_team = 0;
	}
	return winning_team;
};

void () QuadRoundOver =
{
	round_over = 2;

	self.think = StartQuadRound;
	self.nextthink = (time + 0.5);
};

void () QuadRoundThink =
{
	local string tmp;
	local float fl;

	if (rounds < 2) {
		if (CheckWinningTeam() != 0) {
			if (quad_winner != CheckWinningTeam()) {
				quad_winner = CheckWinningTeam();
				self.think = QuadRoundOver;
				self.nextthink = (time + 0.1);
				return;
			}
		}
	}

	if ((self.cnt == -1))
	{
		return;
	}

	if ( self.cnt == stof(infokey (world, "round_time")) - 1 && self.cnt2 == 59 )
	{
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt + 1);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}

	if (self.cnt2 == 1) {
		localcmd ("serverinfo status \"");
		tmp = ftos (self.cnt);
		localcmd (tmp);
		localcmd (" min left\"\n");
	}

	if ((self.cnt2 == -1))
	{
		self.cnt2 = 59;
		self.cnt = (self.cnt - 1);		
	}

	if (!cease_fire)
		self.cnt2 = (self.cnt2 - 1);

	localcmd (sprintf("timelimit %s\n", ftos( stof(infokey (world, "round_time")) ) ));
	if (!self.cnt2)
	{
		if (((self.cnt == 1) || (self.cnt == 5)))
		{
			tmp = ftos (self.cnt);
			bprint3 (2, "", tmp, "‘ minute");
			if ((self.cnt != 1))
			{
				bprint (2, "s");
			}
			bprint (2, " remaining\n");
		}
		if (!self.cnt)
		{
			if (rounds > 1)
				bprint (2, "ROUND TIME OVER\nNext round begins in 10 seconds\n");

			lightstyle (0, "e");
			localcmd("serverinfo status Countdown\n");

			self.think = QuadRoundOver;
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
			bprint3 (2, "", tmp, "‘ second");
			if ((self.cnt2 != 1))
			{
				bprint (2, "s");
			}
			bprint (2, " remaining\n");
		}
	}
	gametime++;
	self.nextthink = (time + 1);
};

void () QuadRoundBegin =
{
	local entity te;
	local entity oldself;
	local float counter;

	te = find (world, classname, "func_breakable");
	while (te)
	{
		setmodel (te, te.mdl);
		te.solid = 4;
		te = find (te, classname, "func_breakable");
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
				self.reload_tribolt = 0;
				self.reload_rocket_launcher = 0;
				if (sniperpower)
					self.reload_sniper_rifle = 0;
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
		}
		self = oldself;
		te = find (te, classname, "player");
	}
	lightstyle (0, "m");

	localcmd ("serverinfo status \"");
	localcmd ("Starting\"\n");


	bprint (2, "QUAD ROUND BEGINS NOW\n");
	round_active = 1;
	round_over = 0;
	if (speedcap)
	{
		self.invisible_time = time;
	}
	if (!self.cnt)
	{
		self.cnt = stof(infokey (world, "round_time")) - 1;		
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
//	localcmd (sprintf("timelimit %s\n", ftos( stof(infokey (world, "round_time"))  ) ));
	self.think = QuadRoundThink;
	self.nextthink = (time + 0.1);
};

void () QuadRoundInit =
{
	local string num;
	local float fl;
	local entity p;

	fl = TeamFortress_NoTeams ();
	if ((fl < 1) || cease_fire)
	{
		self.nextthink = (time + 2);
		if (self.cnt2 <= 5)
			self.cnt2 = 10;
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
			self.think = QuadRoundBegin;
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

void () StartQuadRound =
{
	local string st;
	local float fl;
	local entity te;
	local entity oldself;
	local entity gren;
	local entity p;
	clanbattle = 1;

	if ((rounds == 1))
	{
		quad_winner = CheckWinningTeam();
		if ((quad_winner == 0))
		{
			bprint (2, "Round Drawn!\n");
		}
		else
		{
			if ((quad_winner == 1))
			{
				bprint (2, "Blue Team Wins!\n");
			}
			else
			{
				if ((quad_winner == 2))
				{
					bprint (2, "Red Team Wins!\n");
				}
				else
				{
					if ((quad_winner == 3))
					{
						bprint (2, "Yellow Team Wins!\n");
					}
					else
					{
						if ((quad_winner == 4))
						{
							bprint (2, "Green Team Wins!\n");
						}
					}
				}
			}
		}
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
		bprint (2, "Rounds Over! Use \"cmd map <mapname>\" to go to the nextmap\n");
		clanbattle = 0;
		MapEndSequence();
		printedEndGame = 1;
		return;
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
	te.cnt2 = 10;
	st = infokey (world, "round_time");
	te.cnt = stof (st);
	quad_winner = CheckWinningTeam();	
	if (rounds > 1) {
		lightstyle (0, "e");
		localcmd("serverinfo status Countdown\n");
		te.think = QuadRoundBegin;
		te.nextthink = (time + 0.01);
	}
	else {
		lightstyle (0, "e");
		localcmd("serverinfo status Countdown\n");
		te.think = QuadRoundInit;
		te.nextthink = (time + 1); 
	}
};

void () EndRound = {
	if (infokey(world, "quadmode") == "on") {
		if (infokey(world,"status") != "Countdown" && infokey(world,"status") != "Standby") {
			if (rounds > 1) {
				bprint (2, "ROUND TIME OVER\nNext round begins in 10 seconds\n");

					lightstyle (0, "e");
					localcmd("serverinfo status Countdown\n");

					self.think = QuadRoundOver;
					self.nextthink = (time + 0.1);
			}
			else if (rounds == 1) {
				StartQuadRound();
			}
		}
	}
};