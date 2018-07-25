//@import - weapons.qc
void (float att_delay) Attack_Finished;
float () CheckForReload;

//@import - player.qc
void () player_rocket1;

//=-=-=-=-= Local Functions
void () TeamFortress_GrenadeLauncher;
void () W_FireGrenade;
void () PipebombTouch;
void () GrenadeTouch;
void () GrenadeExplode;
void (float tno) increment_team_pipebombs;
void (float tno) decrement_team_pipebombs;
float (float tno) num_team_pipebombs;
void (float tno) ExplodeOldPipebomb;
float () W_Check_Reload_Grenade_Launcher;
void () W_Reload_Grenade_Launcher_Start;
void () W_Reload_Grenade_Launcher_Finish;
//=-=-=-=-=

void () TeamFortress_GrenadeLauncher = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 1;
	self.AttackFunction 		= W_FireGrenade;
	self.CheckForReloadFunction = W_Check_Reload_Grenade_Launcher;
	self.ReloadStartFunction    = W_Reload_Grenade_Launcher_Start;
	self.ReloadEndFunction 	    = W_Reload_Grenade_Launcher_Start;	

	self.currentammo = self.ammo_rockets;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rock.mdl";
		self.weaponframe = 0;
	}
	self.weapon = 16;
	self.items = (self.items | 1024);	
};

void () W_FireGrenade =
{
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - 1);
		self.currentammo = self.ammo_rockets;
	}
	if (CheckForReload ())
		return;
	player_rocket1 ();
	sound (self, 1, "weapons/grenade.wav", 1, 1);
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.voided = 0;
	newmis.owner = self;
	newmis.movetype = enter;
	newmis.solid = 2;
	if (((self.weaponmode == 0) || cb_prematch))
	{
		newmis.weapon = 5;
		newmis.classname = "grenade";
		newmis.skin = 1;
		newmis.touch = GrenadeTouch;
		newmis.nextthink = (time + 2.5);
	}
	else
	{
		if ((self.team_no != 0))
		{
			increment_team_pipebombs (self.team_no);
			if ((num_team_pipebombs (self.team_no) > (num_max_pipebombs / number_of_teams)))
			{
				ExplodeOldPipebomb (self.team_no);
			}
		}
		else
		{
			num_world_pipebombs = (num_world_pipebombs + 1);
			if ((num_world_pipebombs > num_max_pipebombs))
			{
				ExplodeOldPipebomb (0);
			}
		}
		newmis.classname = "pipebomb";
		newmis.touch = PipebombTouch;
		newmis.skin = 2;
		newmis.nextthink = (time + _x);
		newmis.weapon = 11;
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
	self.reload_grenade_launcher = (self.reload_grenade_launcher + 1);
	self.StatusRefreshTime = (time + 0.1);
	CheckForReload ();
	Attack_Finished (0.6);
};

void () PipebombTouch =
{
	if ((other.classname != "worldspawn"))
	{
		return;
	}
	sound (self, 1, "weapons/bounce.wav", 1, 1);
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
	if ((other.takedamage == 2))
	{
		GrenadeExplode ();
		return;
	}
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () GrenadeExplode = {
	local float damage = 120;
	local entity te;

	if (self.voided)
	{
		return;
	}
	self.voided = 1;
	if ((self.classname == "pipebomb"))
	{
		num_world_pipebombs = (num_world_pipebombs - 1);
		decrement_team_pipebombs (self.team_no);
		if (!(self.flags & 512))
		{
			self.weapon = 40;
		}
	}
	if ((self.owner.has_disconnected != 1))
	{
		deathmsg = self.weapon;
		T_RadiusDamage (self, self.owner, damage, world);
	}
	if ((self.no_active_nail_grens != 0))
	{
		self.no_active_nail_grens = 0;
		self.owner.no_active_nail_grens = (self.owner.no_active_nail_grens - 1);
		te = find (world, classname, "grenade");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_nail_grens > 0)))
			{
				te.no_active_nail_grens = (te.no_active_nail_grens - 1);
			}
			te = find (te, classname, "grenade");
		}
	}
	WriteByte (4, 23);
	WriteByte (4, 3);
	WriteCoord (4, self.origin_x);
	WriteCoord (4, self.origin_y);
	WriteCoord (4, self.origin_z);
	multicast (self.origin, 1);
	dremove (self);
};

void (float tno) increment_team_pipebombs =
{
	if ((tno == 1))
	{
		num_team_pipebombs_1 = (num_team_pipebombs_1 + 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_pipebombs_2 = (num_team_pipebombs_2 + 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_pipebombs_3 = (num_team_pipebombs_3 + 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_pipebombs_4 = (num_team_pipebombs_4 + 1);
				}
			}
		}
	}
};

void (float tno) decrement_team_pipebombs =
{
	if ((tno == 1))
	{
		num_team_pipebombs_1 = (num_team_pipebombs_1 - 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_pipebombs_2 = (num_team_pipebombs_2 - 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_pipebombs_3 = (num_team_pipebombs_3 - 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_pipebombs_4 = (num_team_pipebombs_4 - 1);
				}
			}
		}
	}
};

float (float tno) num_team_pipebombs =
{
	if ((tno == 1))
	{
		return (num_team_pipebombs_1);
	}
	else
	{
		if ((tno == 2))
		{
			return (num_team_pipebombs_2);
		}
		else
		{
			if ((tno == 3))
			{
				return (num_team_pipebombs_3);
			}
			else
			{
				if ((tno == 4))
				{
					return (num_team_pipebombs_4);
				}
			}
		}
	}
	return (0);
};

void (float tno) ExplodeOldPipebomb =
{
	local entity old;
	local float index;

	if ((tno != 0))
	{
		index = num_team_pipebombs (tno);
		index = (index - (num_max_pipebombs / number_of_teams));
	}
	else
	{
		index = (num_world_pipebombs - num_max_pipebombs);
	}
	old = find (world, classname, "pipebomb");
	while ((index > 0))
	{
		if ((old == world))
		{
			num_world_pipebombs = 0;
			num_team_pipebombs_1 = 0;
			num_team_pipebombs_2 = 0;
			num_team_pipebombs_3 = 0;
			num_team_pipebombs_4 = 0;
			return;
		}
		if (((old.owner.team_no == tno) || (tno == 0)))
		{
			old.nextthink = (time + 0.5);
			index = (index - 1);
		}
		old = find (old, classname, "pipebomb");
	}
};

float () W_Check_Reload_Grenade_Launcher = 
{
	local float rt;
	local entity tWeapon;
	
	if ((self.reload_grenade_launcher >= 6) && (self.ammo_rockets > 0))
	{
		self.reload_grenade_launcher = 0;
		if ((self.ammo_rockets < 6))
		{
			self.reload_grenade_launcher = (6 - self.ammo_rockets);
		}
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + 4);
		tWeapon.think = W_Reload_Grenade_Launcher_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
};

void () W_Reload_Grenade_Launcher_Start = 
{
	local float rt;
	local entity tWeapon;

	if (self.ammo_rockets == 0)
	{
		sprint (self, 2, "out of grenades.\n");
		return;
	}
	if (self.reload_grenade_launcher == 0)
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if ((6 - self.reload_grenade_launcher) == self.ammo_rockets)
	{
		sprint (self, 2, "all grenades are in the clip.\n");
		return;
	}
	if (self.reload_grenade_launcher < self.ammo_rockets)
	{
		Attack_Finished (0.6);
		rt = ((6 - self.reload_grenade_launcher) / 6);
		rt = (4 - (4 * rt));
		self.reload_grenade_launcher = 0;
		if ((self.ammo_rockets < 6))
		{
			self.reload_grenade_launcher = (6 - self.ammo_rockets);
		}
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = W_Reload_Grenade_Launcher_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
};

void () W_Reload_Grenade_Launcher_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};