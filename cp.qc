void (entity cp) cp_players = {
	local float i;
	local vector max;
	local vector min;
	local entity te;

	max_x = cp.origin_x + cp.maxs_x;
	max_y = cp.origin_y + cp.maxs_y;
	max_z = cp.origin_z + 128;

	min_x = cp.origin_x + cp.mins_x;
	min_y = cp.origin_y + cp.mins_y;
	min_z = cp.origin_z;

	i = 0;
	te = find(world,classname,"player");
	while (te != world) {
		if ((te.origin_x > min_x && te.origin_y > min_y && te.origin_z > min_z ) 
			&& (te.origin_x < max_x && te.origin_y < max_y && te.origin_z < max_z))
		{
			cp.active_players[i] = te;
			i++;
		}
		te = find (te, classname, "player");
	}
}

void (float team, float numplayers, float percent) printCapMessage = {
	local string status;
	local entity te;
	status = strcat(status, "Team ");
	status = strcat(status, ftos(team));
	status = strcat(status, " CP");
	status = strcat(status, ftos(numplayers));
	status = strcat(status, " - ");
	status = strcat(status, ftos(floor(percent)));
	status = strcat(status, " % ");
	status = strcat(status, "\n");
			te = find(world,classname,"player");
		while (te != world) {
			CenterPrint(te, status);
			te = find (te, classname, "player");
		}
}

void () annouce = {
	local entity te;
	local float i;
	local float zeroteams;
	local float teamWithMaxPlayers
	local float maxPlayers;
	if (self.cp_active) {
		float playersPerTeam[4] = {0,0,0,0};

		self.active_players = memalloc(sizeof(*self.active_players)*cvar("maxclients"));
		cp_players(self);
		for (i = 0; i < cvar("maxclients"); i++) {
			if (self.active_players[i].classname == "player") {
				if (self.active_players[i].team_no == 1)
					playersPerTeam[0]++;
				else if (self.active_players[i].team_no == 2)
					playersPerTeam[1]++;
				else if (self.active_players[i].team_no == 3)
					playersPerTeam[2]++;
				else if (self.active_players[i].team_no == 4)
					playersPerTeam[3]++;
			}
		}
		for (i = 0; i < 4; i++) {
			if (playersPerTeam[i] == 0)
				zeroteams++;
			else if (playersPerTeam[i] > maxPlayers) {
				teamWithMaxPlayers = i+1;
				maxPlayers = playersPerTeam[i];
			}		
		}
		if (teamWithMaxPlayers > 0 && zeroteams == 3
			&& teamWithMaxPlayers != self.team_no
			&& (teamWithMaxPlayers == self.team || self.team == 0)) {			
			if (self.team == 0) {
				self.team = teamWithMaxPlayers;
			}
			self.power_time = time;
			if (maxPlayers == 1)
				self.power_full = self.power_full+0.33;
			else  {
				local float powermultiplier = 1;
				local float maxMultiply = ceil(TeamFortress_TeamGetNoPlayers(teamWithMaxPlayers)/2);
				if (maxPlayers < maxMultiply)
					powermultiplier = maxPlayers*0.33/maxMultiply;
				else
					powermultiplier = 2;
				self.power_full = self.power_full + (0.33*powermultiplier);
			}
			if (self.power_full > 100) {
				self.power_full = 100;
			}
			//printCapMessage(teamWithMaxPlayers, maxPlayers, self.power_full);
			if (self.power_full == 100) {
				self.team_no = teamWithMaxPlayers;
				self.team = 0;
				self.power_full = 0;
			}	
		}
		else if (zeroteams < 3) {
			self.power_time = time;
		}

		if ((self.team_no != self.team && self.team != 0) && time > self.power_time + 3) {
			if (self.power_full > 0) {
				self.power_full = self.power_full - 0.33;
				if (self.power_full < 0)
					self.power_full = 0;
				//printCapMessage(self.team, 0, self.power_full);
			}
			else {
				self.power_full = 0;
				self.team = 0;
			}
		}
	}
	self.nextthink = 0.1;
}

void () func_controlpoint =
{
	setmodel (self, self.model);
	self.solid = SOLID_BBOX;
	self.movetype = MOVETYPE_NONE;
	self.think = annouce;
	self.cp_active = 1;
	self.nextthink = 0.1;
};
