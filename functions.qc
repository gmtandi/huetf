void (float tno) playerSetTeam = {
	local entity te;
	local string st;

	TeamFortress_TeamSet (tno);

	self.team_no = tno;

	stuffcmd (self, "color ");
	st = ftos (TeamFortress_TeamGetColor (tno) - 1);
	stuffcmd (self, st);
	stuffcmd (self, "\n");

	SetTeamName (self);
};

float () PlayerCount = {
	local entity te;
	local float tmp = 0;

	te = find (world, classname, "player");
	while (te != world) {
		tmp = tmp + 1;
		te = find (te, classname, "player");
	}

	return tmp;
};

float () SpectatorCount = {
	local entity te;
	local float tmp = 0;

	te = find (world, classname, "observer");
	while (te != world) {
		tmp = tmp + 1;
		te = find (te, classname, "observer");
	}
	return tmp;
};

void () nextCaptain = {
	local entity te;

	te = find (world, classname, "player");
	while (te != world) {

		if (te.captain == 4)
			te.captain = 3;
		else if (te.captain == 3)
			te.captain = 2;
		else if (te.captain == 2) {
			te.captain = 1;
			stuffcmd(te,"reload\n"); // Required to send one impulse in order to show menu
		} else if (te.captain == 1)
			te.captain = number_of_teams;

		te = find (te, classname, "player");

	}
};

void () disableCaptain = {
	local entity te;
	local entity temp;

	captainmode = 0;
	bprint(2, "\[\sCaptain Mode\s\]\s:\s Captain Mode Disabled!\n");
	te = self;
	temp = find (world, classname, "player");
	while (temp != world) {
		self = temp;
		temp.captain = 0;
		ResetMenu();
		temp = find (temp, classname, "player");
	}
	self = te;
};

void () randomizeCaptains = {
	local entity te;
	local float tmp = 0;
	local float teamno = 0;
	local float capteam[4] = {0, 0, 0, 0};

        te = find (world, classname, "player");
        while (te != world) {

                if (te.captain == 9 && tmp < number_of_teams) {
			do {
				teamno = floor((random() * number_of_teams));
			} while (capteam[teamno] == 1);

			capteam[teamno] = 1;
                        te.captain = teamno + 1;

			if (te.captain == 1)
				stuffcmd(te, "reload\n");

			tmp = tmp + 1;

		}

                te = find (te, classname, "player");
        }

};


void () randomizeTeams = {
	local entity te, temp;
	local float tmp = 0;
	local float teamno = 0;
	local float randteam[4] = {0, 0, 0, 0};

        te = find (world, classname, "player");
        while (te != world) {

		if (tmp >= number_of_teams) {
			tmp = 0;
			randteam[0] = 0;
			randteam[1] = 0;
			randteam[2] = 0;
			randteam[3] = 0;
		}

                if (tmp < number_of_teams) {
			do {
				teamno = floor((random() * number_of_teams));
			} while (randteam[teamno] == 1);

			randteam[teamno] = 1;

			temp = self;
			self = te;

			playerSetTeam(teamno + 1);

			self = temp;

			tmp = tmp + 1;

		}

                te = find (te, classname, "player");
        }
};

string (string text) clearString = {
	local float i;
	string specialChars[60] = {"�", "", "","","","","","","","	","","","","","","","","","",""," ","?","","‚","ƒ","„","…","†","‡","ˆ","‰","Š","‹","Œ","","Ž","","","‘","œ","Å","Å“","","ž","Ÿ", "<", ">", "|", ":", "*", "?", "\\", "/", "\"", "&", "~", "`", ",", " ", "."};
	text = strconv(1,1,1,text);
	text = strireplace("__", "_", text);
	for (i = 0; i < 58; i++) {
		text = strireplace(specialChars[i], "", text);
	}

	return text;
}