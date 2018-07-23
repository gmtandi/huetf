void () player_run;
void () TeamFortress_DisplayDetectionItems;
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
float (entity other, entity projectile, float damage) headshot_calc;
void () W_Attack;
void () SniperRail_Think;
void () SniperRail_Touch;
void () HallucinationTimer;
void () TranquiliserTimer;
void () TeamFortress_CTF_FlagInfo;
void () TF_MovePlayer;
void () player_rocket1;
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
	if ((self.tfstate & TFSTATE_TRANQUILISED))
	{
		self.attack_finished = (time + (att_delay * 2));
	}
	else
	{
		self.attack_finished = (time + att_delay);
	}
};


vector () wall_velocity =
{
	local vector vel;

	vel = normalize (self.velocity);
	vel = normalize (((vel + (v_up * (random () - 0.5))) + (v_right * (random () - 0.5))));
	vel = (vel + (2 * trace_plane_normal));
	vel = (vel * 200);
	return (vel);
};

void (vector org, vector vel) SpawnMeatSpray =
{
	local entity missile;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = enter;
	missile.solid = 0;
	makevectors (self.angles);
	missile.velocity = vel;
	missile.velocity_z = ((missile.velocity_z + 250) + (_2 * random ()));
	missile.avelocity = '3000 1000 2000';
	missile.nextthink = (time + 1);
	missile.think = SUB_Remove;
	setmodel (missile, "progs/zom_gib.mdl");
	setsize (missile, '0 0 0', '0 0 0');
	setorigin (missile, org);
};

void (vector org, float damage) SpawnBlood =
{
	WriteByte (4, 23);
	WriteByte (4, 12);
	WriteByte (4, 1);
	WriteCoord (4, org_x);
	WriteCoord (4, org_y);
	WriteCoord (4, org_z);
	multicast (org, 2);
};

void (float damage) spawn_touchblood =
{
	local vector vel;

	vel = (wall_velocity () * 0.2);
	SpawnBlood ((self.origin + (vel * 0.01)), damage);
};

void (vector org, vector vel) SpawnChunk =
{
	particle (org, (vel * 0.02), 0, enter);
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
	multi_damage = 0;
	blood_count = 0;
	puff_count = 0;
};

void () ApplyMultiDamage =
{
	if (!multi_ent)
	{
		return;
	}
	TF_T_Damage (multi_ent, self, self, multi_damage, 2, 1);
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
		WriteByte (4, 23);
		WriteByte (4, 2);
		WriteByte (4, puff_count);
		WriteCoord (4, puff_org_x);
		WriteCoord (4, puff_org_y);
		WriteCoord (4, puff_org_z);
		multicast (puff_org, 2);
	}
	if (blood_count)
	{
		WriteByte (4, 23);
		WriteByte (4, 12);
		WriteByte (4, blood_count);
		WriteCoord (4, blood_org_x);
		WriteCoord (4, blood_org_y);
		WriteCoord (4, blood_org_z);
		multicast (puff_org, 2);
	}
};

void (float damage, vector dir) TraceAttack =
{
	local vector vel;
	local vector org;

	vel = normalize (((dir + (v_up * crandom ())) + (v_right * crandom ())));
	vel = (vel + (2 * trace_plane_normal));
	vel = (vel * 200);
	org = (trace_endpos - (dir * 4));
	if (trace_ent.takedamage)
	{
		blood_count = (blood_count + 1);
		blood_org = org;
		AddMultiDamage (trace_ent, damage);
	}
	else
	{
		puff_count = (puff_count + 1);
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
	traceline (src, (src + (dir * 2048)), 0, self);
	puff_org = (trace_endpos - (dir * 4));
	while ((shotcount > 0))
	{
		direction = ((dir + ((crandom () * spread_x) * v_right)) + ((crandom () * spread_y) * v_up));
		traceline (src, (src + (direction * 2048)), 0, self);
		if ((trace_fraction != 1))
		{
			if ((self.current_weapon != 32768))
			{
				TraceAttack (4, direction);
			}
			else
			{
				TraceAttack (5, direction);
			}
		}
		shotcount = (shotcount - 1);
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

float (entity other, entity projectile, float damage) headshot_calc = 
{
	if (headshots) {
		local vector dist;
		dist = projectile.origin - other.origin;
		if (vlen(dist) >=  HUETF_HEADSHOT_DISTANCE) {
			return HUETF_HEADSHOT_MULTIPLIER * damage;
		} 
		else {
			return damage;
		}
	} 
	else {
		return damage;
	}
}

float (float tno) num_team_flares =
{
	if ((tno == 1))
	{
		return (num_team_flares_1);
	}
	else
	{
		if ((tno == 2))
		{
			return (num_team_flares_2);
		}
		else
		{
			if ((tno == 3))
			{
				return (num_team_flares_3);
			}
			else
			{
				if ((tno == 4))
				{
					return (num_team_flares_4);
				}
			}
		}
	}
	return (0);
};

void (float tno) RemoveOldFlare =
{
	local entity old;
	local float index;

	if ((tno != 0))
	{
		index = num_team_flares (tno);
		index = (index - (num_max_flares / number_of_teams));
	}
	else
	{
		index = (num_world_flares - num_max_flares);
	}
	old = find (world, mdl, "flare");
	while ((index > 0))
	{
		if ((old == world))
		{
			num_world_flares = 0;
			num_team_flares_1 = 0;
			num_team_flares_2 = 0;
			num_team_flares_3 = 0;
			num_team_flares_4 = 0;
			return;
		}
		if (((old.weapon == tno) || (tno == 0)))
		{
			old.think = RemoveFlare;
			old.nextthink = (time + 0.1);
			index = (index - 1);
		}
		old = find (old, mdl, "flare");
	}
};

void (float tno) increment_team_flares =
{
	if ((tno == 1))
	{
		num_team_flares_1 = (num_team_flares_1 + 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_flares_2 = (num_team_flares_2 + 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_flares_3 = (num_team_flares_3 + 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_flares_4 = (num_team_flares_4 + 1);
				}
			}
		}
	}
};

void (float tno) decrement_team_flares =
{
	if ((tno == 1))
	{
		num_team_flares_1 = (num_team_flares_1 - 1);
	}
	else
	{
		if ((tno == 2))
		{
			num_team_flares_2 = (num_team_flares_2 - 1);
		}
		else
		{
			if ((tno == 3))
			{
				num_team_flares_3 = (num_team_flares_3 - 1);
			}
			else
			{
				if ((tno == 4))
				{
					num_team_flares_4 = (num_team_flares_4 - 1);
				}
			}
		}
	}
};

.float hit_z;

void () W_SetCurrentAmmo =
{
	local string st;

	if (((self.health <= 0) || (self.current_weapon == 0)))
	{
		return;
	}
	if (((self.current_weapon == 32768) && (self.tfstate & TFSTATE_AIMING)))
	{
		return;
	}
	player_run ();
	self.items = (self.items - (self.items & (((256 | 512) | 1024) | 2048)));
	self.weapon = 0;
	if ((self.current_weapon == 16))
	{
		self.currentammo = 0;
		if ((self.playerclass == PC_SPY))
		{
			if ((self.weaponmode == 0))
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
		self.weaponframe = 0;
	}
	else
	{
		if ((self.current_weapon == WEAP_HOOK))
		{
			self.currentammo = 0;
			self.weaponmodel = "progs/v_grap.mdl";
			self.weaponframe = 0;
		}
		else
		{
			if ((self.current_weapon == WEAP_SPANNER))
			{
				self.currentammo = self.ammo_cells;
				self.weaponmodel = "progs/v_span.mdl";
				self.weaponframe = 0;
			}
			else
			{
				if ((self.current_weapon == WEAP_SHOTGUN))
				{
					self.currentammo = self.ammo_shells;
					self.items = (self.items | 2048);
					if (!(self.tfstate & TFSTATE_RELOADING))
					{
						self.weaponmodel = "progs/v_shot.mdl";
						self.weaponframe = 0;
					}
					self.items = (self.items | 256);
					self.weapon = 1;
				}
				else
				{
					if ((self.current_weapon == WEAP_SUPER_SHOTGUN))
					{
						self.currentammo = self.ammo_shells;
						if (!(self.tfstate & TFSTATE_RELOADING))
						{
							self.weaponmodel = "progs/v_shot2.mdl";
							self.weaponframe = 0;
						}
						self.items = (self.items | 256);
						self.weapon = 2;
					}
					else
					{
						if ((self.current_weapon == WEAP_NAILGUN))
						{
							self.currentammo = self.ammo_nails;
							if (!(self.tfstate & TFSTATE_RELOADING))
							{
								self.weaponmodel = "progs/v_nail.mdl";
								self.weaponframe = 0;
							}
							self.items = (self.items | 512);
							self.weapon = 4;
						}
						else
						{
							if ((self.current_weapon == WEAP_SUPER_NAILGUN))
							{
								self.currentammo = self.ammo_nails;
								if (!(self.tfstate & TFSTATE_RELOADING))
								{
									self.weaponmodel = "progs/v_nail2.mdl";
									self.weaponframe = 0;
								}
								self.items = (self.items | 512);
								self.weapon = 8;
							}
							else
							{
								if ((self.current_weapon == WEAP_GRENADE_LAUNCHER))
								{
									self.currentammo = self.ammo_rockets;
									if (!(self.tfstate & TFSTATE_RELOADING))
									{
										self.weaponmodel = "progs/v_rock.mdl";
										self.weaponframe = 0;
									}
									self.weapon = 16;
									self.items = (self.items | 1024);
								}
								else
								{
									if ((self.current_weapon == WEAP_ROCKET_LAUNCHER))
									{
										self.currentammo = self.ammo_rockets;
										if (!(self.tfstate & TFSTATE_RELOADING))
										{
											self.weaponmodel = "progs/v_rock2.mdl";
											self.weaponframe = 0;
										}
										self.items = (self.items | 1024);
										self.weapon = space;
									}
									else
									{
										if ((self.current_weapon == WEAP_LIGHTNING))
										{
											self.currentammo = self.ammo_cells;
											if (!(self.tfstate & TFSTATE_RELOADING))
											{
												self.weaponmodel = "progs/v_light.mdl";
												self.weaponframe = 0;
											}
											self.items = (self.items | 2048);
											self.weapon = 64;
										}
										else
										{
											if ((self.current_weapon == WEAP_SNIPER_RIFLE))
											{
												self.currentammo = self.ammo_shells;
												if (!(self.tfstate & TFSTATE_RELOADING))
												{
													self.weaponmodel = "progs/v_srifle.mdl";
													self.weaponframe = 0;
												}
												self.items = (self.items | 256);
												self.weapon = 1;
											}
											else
											{
												if ((self.current_weapon == WEAP_AUTO_RIFLE))
												{
													self.currentammo = self.ammo_shells;
													if (!(self.tfstate & TFSTATE_RELOADING))
													{
														self.weaponmodel = "progs/v_srifle.mdl";
														self.weaponframe = 0;
													}
													self.items = (self.items | 256);
													self.weapon = 2;
												}
												else
												{
													if ((self.current_weapon == WEAP_ASSAULT_CANNON))
													{
														self.currentammo = self.ammo_shells;
														if (!(self.tfstate & TFSTATE_RELOADING))
														{
															self.weaponmodel = "progs/v_asscan.mdl";
															self.weaponframe = 0;
														}
														self.items = (self.items | 256);
														self.weapon = space;
													}
													else
													{
														if ((self.current_weapon == WEAP_FLAMETHROWER))
														{
															self.currentammo = self.ammo_cells;
															if (!(self.tfstate & TFSTATE_RELOADING))
															{
																self.weaponmodel = "progs/v_rock.mdl";
																self.weaponframe = 0;
															}
															self.items = (self.items | 2048);
															self.weapon = 8;
														}
														else
														{
															if ((self.current_weapon == WEAP_INCENDIARY))
															{
																self.currentammo = self.ammo_rockets;
																if (!(self.tfstate & TFSTATE_RELOADING))
																{
																	self.weaponmodel = "progs/v_rock2.mdl";
																	self.weaponframe = 0;
																}
																self.items = (self.items | 1024);
																self.weapon = 16;
															}
															else
															{
																if ((self.current_weapon == WEAP_MEDIKIT))
																{
																	self.currentammo = self.ammo_medikit;
																	self.weaponmodel = "progs/v_medi.mdl";
																	self.weaponframe = 0;
																}
																else
																{
																	if ((self.current_weapon == WEAP_BIOWEAPON))
																	{
																		self.currentammo = 0;
																		self.weaponmodel = "progs/v_bio.mdl";
																		self.weaponframe = 0;
																	}
																	else
																	{
																		if ((self.current_weapon == WEAP_TRANQ))
																		{
																			self.currentammo = self.ammo_shells;
																			if (!(self.tfstate & TFSTATE_RELOADING))
																			{
																				self.weaponmodel = "progs/v_shot.mdl";
																				self.weaponframe = 0;
																			}
																			self.items = (self.items | 256);
																			self.weapon = 1;
																		}
																		else
																		{
																			if ((self.current_weapon == WEAP_RAILGUN))
																			{
																				self.currentammo = self.ammo_nails;
																				if (!(self.tfstate & TFSTATE_RELOADING))
																				{
																					self.weaponmodel = "progs/v_rail.mdl";
																					self.weaponframe = 0;
																				}
																				self.items = (self.items | 512);
																				self.weapon = 1;
																			}
																			else if ((self.current_weapon == WEAP_TRIBOLT))
																			{
																				self.currentammo = self.ammo_rockets;
																				if (!(self.tfstate & TFSTATE_RELOADING))
																				{
																					self.weaponmodel = "progs/v_rock.mdl";
																					self.weaponframe = 0;
																				}
																				self.weapon = 16;
																				self.items = (self.items | 1024);
																			}
																			else if ((self.current_weapon == WEAP_SNIPERRAIL))
																			{
																				self.currentammo = self.ammo_shells;
																				if (!(self.tfstate & TFSTATE_RELOADING))
																				{
																					self.weaponmodel = "progs/v_srifle.mdl";
																					self.weaponframe = 0;
																				}
																				self.weapon = 16;
																				self.items = (self.items | 512);
																			}
																			else
																			{
																				self.currentammo = 0;
																				self.weaponmodel = "";
																				self.weaponframe = 0;
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

float () W_BestWeapon = {
    local float it;

    it = self.weapons_carried;
    if ((self.ammo_cells >= 1 && it & WEAP_LIGHTNING) && self.waterlevel <= 1)
        return WEAP_LIGHTNING;
    else if ((self.ammo_cells >= 7 && self.ammo_shells >= 1) && it & WEAP_ASSAULT_CANNON)
        return WEAP_ASSAULT_CANNON;
    else if (self.ammo_cells >= 1 && it & WEAP_FLAMETHROWER)
        return WEAP_FLAMETHROWER;
    else if (self.ammo_nails >= 2 && it & WEAP_SUPER_NAILGUN)
        return WEAP_SUPER_NAILGUN;
    else if (self.ammo_nails >= 1 && it & WEAP_RAILGUN)
        return WEAP_RAILGUN;
    else if (self.ammo_shells >= 2 && it & WEAP_SUPER_SHOTGUN)
        return WEAP_SUPER_SHOTGUN;
    else if (self.ammo_nails >= 1 && it & WEAP_NAILGUN)
        return WEAP_NAILGUN;
    else if (self.ammo_shells >= 1 && it & WEAP_SHOTGUN)
        return WEAP_SHOTGUN;
    else if (self.ammo_shells >= 1 && it & WEAP_TRANQ)
        return WEAP_TRANQ;
    else if (it & WEAP_MEDIKIT)
        return WEAP_MEDIKIT;
    else if (it & WEAP_SPANNER)
        return WEAP_SPANNER;
    else if (it & WEAP_AXE)
        return WEAP_AXE;

    return 0;
};

float () W_CheckNoAmmo = {

         if ( (self.current_weapon == WEAP_MEDIKIT) ||  (self.current_weapon == WEAP_AXE) || (self.current_weapon == WEAP_HOOK) || (self.current_weapon == WEAP_SPANNER) ) {

            return ( 1.000 );

         } else {

            if (self.current_weapon == WEAP_INCENDIARY) {

               if (self.weaponmode == 1)
               {
                 if (self.currentammo >= 2)
                   return ( 1 );
               } else if (self.currentammo >= 3)
                   return ( 1 );

         }
            else if ((self.current_weapon == WEAP_ASSAULT_CANNON) && (self.ammo_cells < 7.000))
            {
              sprint (self,2.000,"Insufficient cells to power up the Assault Cannon.\n");
              return (0.000);
            }
            else
            {
               if ( (self.currentammo > 0.000) )
               {
                  return ( 1.000 );
               }

            }

      }
      sprint (self,2.000,"not enough ammo.\n");
      return ( 0.000 );


};

void () W_Reload_shotgun =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_shot.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_super_shotgun =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_shot2.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_grenade_launcher =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_tribolt =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
	
};

void () W_Reload_rocket_launcher =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock2.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

void () W_Reload_sniper_rifle =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_srifle.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};

float () CheckForReload =
{
	local entity tWeapon;

	if (practice)
	{
		return (0);
	}
	if ((self.playerclass != 11))
	{
		if ((self.current_weapon == WEAP_SHOTGUN ))
		{
			if (((self.reload_shotgun >= 8) && (self.ammo_shells > 0)))
			{
				self.reload_shotgun = 0;
				if ((self.ammo_shells < 8))
				{
					self.reload_shotgun = (8 - self.ammo_shells);
				}
				sprint (self, 2, "reloading... \n");
				self.tfstate = (self.tfstate | TFSTATE_RELOADING);
				tWeapon = spawn ();
				tWeapon.owner = self;
				tWeapon.classname = "timer";
				tWeapon.nextthink = (time + 2);
				tWeapon.think = W_Reload_shotgun;
				self.weaponmodel = "";
				self.weaponframe = 0;
				return (1);
			}
		}
		else
		{
			if ((self.current_weapon == WEAP_SUPER_SHOTGUN))
			{
				if ((self.reload_super_shotgun > 16))
				{
					self.reload_super_shotgun = 16;
				}
				if (((self.reload_super_shotgun >= 16) && (self.ammo_shells > 0)))
				{
					self.reload_super_shotgun = 0;
					if ((self.ammo_shells < 16))
					{
						self.reload_super_shotgun = (16 - self.ammo_shells);
					}
					sprint (self, 2, "reloading... \n");
					self.tfstate = (self.tfstate | TFSTATE_RELOADING);
					tWeapon = spawn ();
					tWeapon.owner = self;
					tWeapon.classname = "timer";
					tWeapon.nextthink = (time + 3);
					tWeapon.think = W_Reload_super_shotgun;
					self.weaponmodel = "";
					self.weaponframe = 0;
					return (1);
				}
			}
			else
			{
				if ((self.current_weapon == WEAP_GRENADE_LAUNCHER))
				{
					if (((self.reload_grenade_launcher >= 6) && (self.ammo_rockets > 0)))
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
						tWeapon.think = W_Reload_grenade_launcher;
						self.weaponmodel = "";
						self.weaponframe = 0;
						return (1);
					}
				}
				else if ((self.current_weapon == WEAP_TRIBOLT))
				{
					if (((self.reload_tribolt >= 12) && (self.ammo_rockets > 0)))
					{
						self.reload_tribolt = 0;
						if ((self.ammo_rockets < 12))
						{
							self.reload_tribolt = (12 - self.ammo_rockets);
						}
						sprint (self, 2, "reloading...\n");
						self.tfstate = (self.tfstate | TFSTATE_RELOADING);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + 5);
						tWeapon.think = W_Reload_tribolt;
						self.weaponmodel = "";
						self.weaponframe = 0;
						return (1);
					}
				}
				else if ((self.current_weapon == WEAP_ROCKET_LAUNCHER))
				{
					if (((self.reload_rocket_launcher >= 4) && (self.ammo_rockets > 0)))
					{
						self.reload_rocket_launcher = 0;
						if ((self.ammo_rockets < 4))
						{
							self.reload_rocket_launcher = (4 - self.ammo_rockets);
						}
						sprint (self, 2, "reloading... \n");
						self.tfstate = (self.tfstate | TFSTATE_RELOADING);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + 5);
						tWeapon.think = W_Reload_rocket_launcher;
						self.weaponmodel = "";
						self.weaponframe = 0;
						return (1);
					}
				}				
				else if ((sniperpower) && (self.current_weapon == WEAP_SNIPER_RIFLE))
				{
					if (((self.reload_sniper_rifle >= 1) && (self.ammo_shells > 0)))
					{
						self.reload_sniper_rifle = 0;						
						sprint (self, 2, "reloading... \n");
						self.tfstate = (self.tfstate | TFSTATE_RELOADING);
						tWeapon = spawn ();
						tWeapon.owner = self;
						tWeapon.classname = "timer";
						tWeapon.nextthink = (time + 5);
						tWeapon.think = W_Reload_sniper_rifle;
						self.weaponmodel = "";
						self.weaponframe = 0;
						return (1);
					}
				}
				
			}
		}
	}
	return (0);
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
	if ((self.has_disconnected == 1))
	{
		return;
	}
	if (!self.playerclass)
	{
		return;
	}
	if ((self.tfstate & TFSTATE_RELOADING))
	{
		return;
	}
	if (((self.is_undercover || (self.undercover_team != 0)) || (self.undercover_skin != 0)))
	{
		Spy_RemoveDisguise (self);
	}
	makevectors (self.v_angle);
	self.show_hostile = (time + 1);
	if ((self.current_weapon == 16))
	{
		Attack_Finished (0.5);
		sound (self, 1, "weapons/ax1.wav", 1, 1);
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
			sound (self, 1, "weapons/ax1.wav", 1, 1);
			player_axe1 ();
		}
		else
		{
			if ((self.current_weapon == WEAP_HOOK))
			{
				if (!self.hook_out)
				{
					player_chain1 ();
				}
				Attack_Finished (0.1);
			}
			else
			{
				if ((self.current_weapon == WEAP_SHOTGUN))
				{
					if (CheckForReload ())
					{
						return;
					}
					player_shot1 ();
					W_FireShotgun ();
					self.reload_shotgun = (self.reload_shotgun + 1);
					self.StatusRefreshTime = (time + 0.1);
					CheckForReload ();
					Attack_Finished (0.5);
				}
				else
				{
					if ((self.current_weapon == WEAP_SUPER_SHOTGUN))
					{
						if (CheckForReload ())
						{
							return;
						}
						player_shot1 ();
						W_FireSuperShotgun ();
						self.reload_super_shotgun = (self.reload_super_shotgun + 2);
						self.StatusRefreshTime = (time + 0.1);
						CheckForReload ();
						Attack_Finished (0.7);
					}
					else
					{
						if ((self.current_weapon == WEAP_NAILGUN))
						{
							player_nail1 ();
						}
						else
						{
							if ((self.current_weapon == WEAP_SUPER_NAILGUN))
							{
								player_nail1 ();
							}
							else
							{
								if ((self.current_weapon == WEAP_GRENADE_LAUNCHER))
								{
									if (CheckForReload ())
									{
										return;
									}
									player_rocket1 ();
									W_FireGrenade ();
									self.reload_grenade_launcher = (self.reload_grenade_launcher + 1);
									self.StatusRefreshTime = (time + 0.1);
									CheckForReload ();
									Attack_Finished (0.6);
								}
								else
								{
									if ((self.current_weapon == WEAP_ROCKET_LAUNCHER))
									{
										if (CheckForReload ())
										{
											return;
										}
										player_rocket1 ();
										W_FireRocket ();
										self.reload_rocket_launcher = (self.reload_rocket_launcher + 1);
										self.StatusRefreshTime = (time + 0.1);
										CheckForReload ();
										Attack_Finished (0.8);
									}
									else if ((self.current_weapon == WEAP_LIGHTNING))
									{
										player_light1 ();
										Attack_Finished (0.1);
										sound (self, 0, "weapons/lstart.wav", 1, 1);
									}									 
									else if (sniperpower && (self.current_weapon == WEAP_SNIPER_RIFLE))
									{
										if (CheckForReload ())
										{
											return;
										}
										player_shot1 ();
										W_FireSniperRifle ();
										self.reload_sniper_rifle = (self.reload_sniper_rifle + 1);
										self.StatusRefreshTime = (time + 0.1);
										CheckForReload ();
										Attack_Finished (0.8);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if ((self.current_weapon == WEAP_SNIPER_RIFLE))
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
		if ((self.current_weapon == WEAP_AUTO_RIFLE))
		{
			player_autorifle1 ();
			W_FireAutoRifle ();
			Attack_Finished (0.1);
		}
		else
		{
			if ((self.current_weapon == WEAP_ASSAULT_CANNON))
			{
				if ((self.ammo_cells < 7))
				{
					sprint (self, 1, "Insufficient cells to power up the Assault Cannon.\n");
				}
				else
				{
					self.ammo_cells = (self.ammo_cells - 7);
					self.heat = 1;
					self.immune_to_check = (time + 5);
					self.tfstate = (self.tfstate | TFSTATE_AIMING);
					TeamFortress_SetSpeed (self);
					player_assaultcannonup1 ();
				}
			}
			else
			{
				if ((self.current_weapon == WEAP_FLAMETHROWER))
				{
					player_shot1 ();
					W_FireFlame ();
					if ((self.waterlevel > 2))
					{
						Attack_Finished (1);
					}
					else
					{
						Attack_Finished (0.15);
					}
				}
				else
				{
					if ((self.current_weapon == WEAP_INCENDIARY))
					{
						player_rocket1 ();
						W_FireIncendiaryCannon ();
						if ((self.weaponmode == 1))
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
						if ((self.current_weapon == WEAP_MEDIKIT))
						{
							sound (self, 1, "weapons/ax1.wav", 1, 1);
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
							if ((self.current_weapon == WEAP_BIOWEAPON))
							{
								sound (self, 1, "weapons/ax1.wav", 1, 1);
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
								if ((self.current_weapon == WEAP_TRANQ))
								{
									sound (self, 1, "weapons/dartgun.wav", 1, 1);
									player_shot1 ();
									W_FireTranq ();
									Attack_Finished (1.7);
								}
								else
								{
									if ((self.current_weapon == WEAP_RAILGUN))
									{
										sound (self, 1, "weapons/railgun.wav", 1, 1);
										player_shot1 ();
										W_FireRail ();
										Attack_Finished (0.4);
									}
									else if ((self.current_weapon == WEAP_TRIBOLT))
									{
										if (CheckForReload ())
										{
											return;
										}
										W_FireTriBolt ();
										self.reload_tribolt = (self.reload_tribolt + 3);
										self.StatusRefreshTime = (time + 0.1);
										CheckForReload ();
										Attack_Finished (1.7);
									}
									else if ((self.current_weapon == WEAP_SNIPERRAIL))
									{
										sound (self, 1, "weapons/sniper.wav", 1, 1);
										player_shot1 ();
										W_FireSniperRail ();
										Attack_Finished (2);
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
	if (((self.current_weapon == 16) && allow_hook))
	{
		if ((self.playerclass != 8))
		{
			sprint (self, 1, "Axe selected\n");
		}
	}
	else
	{
		if ((self.current_weapon == 1))
		{
			sprint (self, 1, "grappling hook selected\n");
		}
		else
		{
			if ((self.current_weapon == 2048))
			{
				if (((self.weaponmode == 0) && (self.playerclass != 11)))
				{
					sprint (self, 1, "Normal grenade mode\n");
				}
				else
				{
					if (cb_prematch)
					{
						sprint (self, 1, "Pipebomb mode not available in PreMatch\n");
					}
					else
					{
						if ((self.weaponmode == 1))
						{
							sprint (self, 1, "Pipebomb mode\n");
						}
					}
				}
			}
			else
			{
				if ((self.current_weapon == space))
				{
					sprint (self, 1, "Sniper rifle ready\n");
				}
				else
				{
					if ((self.current_weapon == 64))
					{
						sprint (self, 1, "rifle on fully auto\n");
					}
					else
					{
						if ((self.current_weapon == 262144))
						{
							sprint (self, 1, "Tranquiliser gun selected\n");
						}
						else
						{
							if ((self.current_weapon == 2))
							{
								sprint (self, 1, "BioWeapon readied\n");
							}
							else
							{
								if ((self.current_weapon == 4))
								{
									sprint (self, 1, "Medikit/Bioweapon readied\n");
								}
								else
								{
									if ((self.current_weapon == 16384))
									{
										if ((self.weaponmode == 0))
										{
											sprint (self, 1, "Heavy Incendiary Cannon\n");
										}
										else
										{
											if ((self.weaponmode == 1))
											{
												sprint (self, 1, "Light Incendiary Cannon\n");
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

	if ((self.tfstate & TFSTATE_RELOADING))
	{
		return;
	}
	it = self.weapons_carried;
	fl = self.current_weapon;
	am = 0;
	usable = 0;
	have_weapon = 1;
	if ((self.impulse == 1))
	{
		if (!(it & ((((1 | 2) | 4) | 16) | 8)))
		{
			have_weapon = 0;
		}
		while ((!usable && have_weapon))
		{
			if ((fl == 8))
			{
				fl = 2;
				if ((it & 2))
				{
					usable = 1;
				}
				usable = 0;
			}
			else
			{
				if ((fl == 2))
				{
					fl = 4;
					if ((it & 4))
					{
						usable = 1;
					}
				}
				else
				{
					if ((fl == 4))
					{
						fl = 1;
						if ((allow_hook && (fl & 1)))
						{
							usable = 1;
						}
						if (self.hook_out)
						{
							Reset_Grapple (self.hook);
						}
					}
					else
					{
						if ((fl == 1))
						{
							fl = 16;
							if ((it & 16))
							{
								usable = 1;
							}
						}
						else
						{
							fl = 8;
							if ((it & 8))
							{
								usable = 1;
							}
						}
					}
				}
			}
		}
	}
	else
	{
		if ((allow_hook && ((self.impulse == 22) || (self.impulse == 39))))
		{
			fl = 1;
		}
		else
		{
			if ((self.impulse == 40))
			{
				if (!(it & (((2 | 4) | 16) | 8)))
				{
					have_weapon = 0;
				}
				while ((!usable && have_weapon))
				{
					if ((fl == 8))
					{
						fl = 2;
						if ((it & 2))
						{
							usable = 1;
						}
						usable = 0;
					}
					else
					{
						if ((fl == 2))
						{
							fl = 4;
							if ((it & 4))
							{
								usable = 1;
							}
						}
						else
						{
							if ((fl == 4))
							{
								fl = 16;
								if ((it & 16))
								{
									usable = 1;
								}
							}
							else
							{
								fl = 8;
								if ((it & 8))
								{
									usable = 1;
								}
							}
						}
					}
				}
			}
			else
			{
				if ((self.impulse == 2))
				{
					if ((it & WEAP_SNIPER_RIFLE))
					{
						fl = WEAP_SNIPER_RIFLE;
						if ((self.ammo_shells < 1))
						{
							am = 1;
						}
					}
					else
					{
						if ((it & WEAP_SHOTGUN))
						{
							fl = WEAP_SHOTGUN;
							if ((self.ammo_shells < 1))
							{
								am = 1;
							}
						}
						else
						{
							if ((it & WEAP_TRANQ))
							{
								fl = WEAP_TRANQ;
								if ((self.ammo_shells < 1))
								{
									am = 1;
								}
							}
							else
							{
								if ((it & WEAP_RAILGUN))
								{
									fl = WEAP_RAILGUN;
									if ((self.ammo_nails < 1))
									{
										am = 1;
									}
								}
								else if ((it & WEAP_SNIPERRAIL))
								{
									fl = WEAP_SNIPERRAIL;
									if ((self.ammo_shells < 1))
									{
										am = 1;
									}
								}
								else
								{
									have_weapon = 0;
								}
							}
						}
					}
				}
				else
				{
					if ((self.impulse == 3))
					{
						if ((it & WEAP_AUTO_RIFLE))
						{
							fl = WEAP_AUTO_RIFLE;
							if ((self.ammo_shells < 1))
							{
								am = 1;
							}
						}
						else
						{
							fl = WEAP_SUPER_SHOTGUN;
							if ((self.ammo_shells < 2))
							{
								am = 1;
							}
						}
					}
					else
					{
						if ((self.impulse == 4))
						{
							fl = WEAP_NAILGUN;
							if ((self.ammo_nails < 1))
							{
								am = 1;
							}
						}
						else
						{
							if ((self.impulse == 5))
							{
								if ((it & WEAP_SUPER_NAILGUN))
								{
									fl = WEAP_SUPER_NAILGUN;
									if ((self.ammo_nails < 2))
									{
										am = 1;
									}
								}
								else
								{
									if ((it & WEAP_FLAMETHROWER))
									{
										fl = WEAP_FLAMETHROWER;
										if ((self.ammo_cells < 1))
										{
											am = 1;
										}
									}
								}
							}
							else
							{
								if ((self.impulse == 6))
								{
									if ((it & WEAP_INCENDIARY))
									{
										fl = WEAP_INCENDIARY;
										if ((self.ammo_rockets < 2))
										{
											am = 1;
										}
										wm = 1;
									}
									else
									{
										if ((it & WEAP_GRENADE_LAUNCHER))
										{
											fl = WEAP_GRENADE_LAUNCHER;
											if ((self.ammo_rockets < 1))
											{
												am = 1;
											}
											wm = 0;
										}
										else
										{
											have_weapon = 0;
										}
									}
								}
								else
								{
									if ((self.impulse == 7))
									{
										if ((it & WEAP_INCENDIARY))
										{
											fl = WEAP_INCENDIARY;
											if ((self.ammo_rockets < 3))
											{
												am = 1;
											}
											wm = 0;
										}
										else
										{
											if ((it & WEAP_ROCKET_LAUNCHER))
											{
												fl = WEAP_ROCKET_LAUNCHER;
												if ((self.ammo_rockets < 1))
												{
													am = 1;
												}
											}
											else
											{
												if ((it & WEAP_ASSAULT_CANNON))
												{
													fl = WEAP_ASSAULT_CANNON;
													if ((self.ammo_shells < 1))
													{
														am = 1;
													}
													else
													{
														if ((self.ammo_cells < 7))
														{
															am = 2;
														}
													}
												}
												else
												{
													if ((it & WEAP_GRENADE_LAUNCHER))
													{
														fl = WEAP_GRENADE_LAUNCHER;
														wm = 1;
														if ((self.ammo_rockets < 1))
														{
															am = 1;
														}
													}
													else {
														if ((it & WEAP_TRIBOLT))
														{
															fl = WEAP_TRIBOLT;		
															if ((self.ammo_rockets < 1))
															{
																am = 1;
															}
															wm = 0;
														}
														else
														{
															have_weapon = 0;
														}
													}
												}
											}
										}
									}
									else
									{
										if ((self.impulse == 8))
										{
											fl = WEAP_LIGHTNING;
											if ((self.ammo_cells < 1))
											{
												am = 1;
											}
										}
										else
										{
											if ((self.impulse == 176))
											{
												fl = WEAP_MEDIKIT;
												if ((it & 4))
												{
													usable = 1;
												}
											}
											else
											{
												if ((self.impulse == 12))
												{
													fl = self.last_weapon;
													if ((it & self.last_weapon))
													{
														usable = 1;
													}
													if (((fl & (WEAP_SNIPER_RIFLE | WEAP_AUTO_RIFLE | WEAP_SHOTGUN | WEAP_SUPER_SHOTGUN | WEAP_ASSAULT_CANNON | WEAP_TRANQ | WEAP_SNIPERRAIL)) != 0) && (self.ammo_shells < 1))
													{
														am = 1;
													}
													else
													{
														if (((fl & (WEAP_NAILGUN | WEAP_SUPER_NAILGUN | WEAP_RAILGUN | WEAP_SNIPERRAIL) != 0) && (self.ammo_nails < 1)))
														{
															am = 1;
														}
														else
														{
															if (((fl & (WEAP_GRENADE_LAUNCHER | WEAP_ROCKET_LAUNCHER | WEAP_TRIBOLT)) != 0) && (self.ammo_rockets < 1))
															{
																am = 1;
															}
															else
															{
																if (((fl & (WEAP_FLAMETHROWER | WEAP_LIGHTNING)) != 0) && (self.ammo_cells < 1))
																{
																	am = 1;
																}
																else
																{
																	if ((fl & WEAP_INCENDIARY) != 0)
																	{
																		if (self.weaponmode == 1)
																		{
																			if (self.ammo_rockets < 2)
																			{
																				am = 1;
																			}
																		}
																		else
																		{
																			if (self.ammo_rockets < 3)
																			{
																				am = 1;
																			}
																		}
																	}
																	else
																	{
																		if ((fl == WEAP_ASSAULT_CANNON) && (self.ammo_cells < 7))
																		{
																			am = 2;
																		}
																	}
																}
															}
														}
													}
													if ((am == 0))
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
	self.impulse = 0;
	if ((!have_weapon || !(it & fl)))
	{
		sprint (self, 2, "no weapon.\n");
		return;
	}
	if ((am == 1))
	{
		sprint (self, 2, "not enough ammo.\n");
		return;
	}
	if ((am == 2))
	{
		sprint (self, 2, "not enough cells to power assault cannon.\n");
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

	if (((self.weaponmodel == string_null) || (self.current_weapon == 0)))
	{
		return;
	}
	if ((self.tfstate & TFSTATE_RELOADING))
	{
		return;
	}
	it = self.weapons_carried;
	self.impulse = 0;
	loopcount = 0;
	lw = self.current_weapon;
	while (1)
	{
		am = 0;
		cont = 0;
		if ((self.current_weapon == WEAP_AXE))
		{
			self.current_weapon = WEAP_SPANNER;
		}
		else
		{
			if ((self.current_weapon == WEAP_SPANNER))
			{
				self.current_weapon = WEAP_SHOTGUN;
				if ((self.ammo_shells < 1))
				{
					am = 1;
				}
			}
			else
			{
				if ((self.current_weapon == WEAP_SHOTGUN))
				{
					self.current_weapon = WEAP_RAILGUN;
					if ((self.ammo_nails < 1))
					{
						am = 1;
					}
				}
				else
				{
					if ((self.current_weapon == WEAP_RAILGUN))
					{
						self.current_weapon = WEAP_TRANQ;
						if ((self.ammo_shells < 1))
						{
							am = 1;
						}
					}
					else
					{
						if ((self.current_weapon == WEAP_TRANQ))
						{
							self.current_weapon = WEAP_SNIPER_RIFLE;
							if ((self.ammo_shells < 1))
							{
								am = 1;
							}
						}
						else
						{
							if ((self.current_weapon == WEAP_SNIPER_RIFLE))
							{
								self.current_weapon = WEAP_AUTO_RIFLE;
								if ((self.ammo_shells < 1))
								{
									am = 1;
								}
							}
							else
							{
								if ((self.current_weapon == WEAP_AUTO_RIFLE))
								{
									self.current_weapon = WEAP_SUPER_SHOTGUN;
									if ((self.ammo_shells < 2))
									{
										am = 1;
									}
								}
								else
								{
									if ((self.current_weapon == WEAP_SUPER_SHOTGUN))
									{
										self.current_weapon = WEAP_NAILGUN;
										if ((self.ammo_nails < 1))
										{
											am = 1;
										}
									}
									else
									{
										if ((self.current_weapon == WEAP_NAILGUN))
										{
											self.current_weapon = WEAP_SUPER_NAILGUN;
											if ((self.ammo_nails < 2))
											{
												am = 1;
											}
										}
										else
										{
											if ((self.current_weapon == WEAP_SUPER_NAILGUN))
											{
												self.current_weapon = WEAP_GRENADE_LAUNCHER;
												self.weaponmode = 0;
												if ((self.ammo_rockets < 1))
												{
													am = 1;
												}
											}
											else
											{
												if (((self.current_weapon == WEAP_GRENADE_LAUNCHER) && (self.weaponmode == 0)))
												{
													if ((self.playerclass != 11))
													{
														self.current_weapon = WEAP_GRENADE_LAUNCHER;
														self.weaponmode = 1;
													}
													else
													{
														self.current_weapon = WEAP_ROCKET_LAUNCHER;
													}
													if ((self.ammo_rockets < 1))
													{
														am = 1;
													}
												}
												else
												{
													if (((self.current_weapon == WEAP_GRENADE_LAUNCHER) && (self.weaponmode == 1)))
													{
														self.current_weapon = WEAP_ROCKET_LAUNCHER;
														if ((self.ammo_rockets < 1))
														{
															am = 1;
														}
													}
													else
													{
														if ((self.current_weapon == WEAP_ROCKET_LAUNCHER))
														{
															self.current_weapon = WEAP_LIGHTNING;
															if ((self.ammo_cells < 1))
															{
																am = 1;
															}
														}
														else
														{
															if ((self.current_weapon == WEAP_LIGHTNING))
															{
																self.current_weapon = WEAP_FLAMETHROWER;
																if ((self.ammo_cells < 1))
																{
																	am = 1;
																}
															}
															else
															{
																if ((self.current_weapon == WEAP_FLAMETHROWER))
																{
																	self.current_weapon = WEAP_INCENDIARY;
																	self.weaponmode = 1;
																	if ((self.ammo_rockets < 3))
																	{
																		am = 1;
																	}
																}
																else
																{
																	if (((self.current_weapon == WEAP_INCENDIARY) && (self.weaponmode == 1)))
																	{
																		self.current_weapon = WEAP_INCENDIARY;
																		self.weaponmode = 0;
																		if ((self.ammo_rockets < 2))
																		{
																			am = 1;
																		}
																	}
																	else
																	{
																		if (((self.current_weapon == WEAP_INCENDIARY) && (self.weaponmode == 0)))
																		{
																			self.current_weapon = WEAP_ASSAULT_CANNON;
																			if ((self.ammo_cells < 7))
																			{
																				am = 1;
																			}
																			if ((self.ammo_shells < 1))
																			{
																				am = 1;
																			}
																		}
																		else
																		{
																			if ((self.current_weapon == WEAP_ASSAULT_CANNON))
																			{
																				self.current_weapon = WEAP_HOOK;
																				if (!allow_hook)
																				{
																					am = 1;
																				}
																			}
																			else
																			{
																				if ((self.current_weapon == WEAP_HOOK))
																				{
																					self.current_weapon = WEAP_MEDIKIT;
																				}
																				else
																				{
																					if ((self.current_weapon == WEAP_BIOWEAPON))
																					{
																						self.current_weapon = WEAP_MEDIKIT;
																					}
																					else
																					{
																						if ((self.current_weapon == WEAP_MEDIKIT))
																						{
																							self.current_weapon = WEAP_AXE;
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
		loopcount = (loopcount + 1);
		if (((self.weapons_carried & self.current_weapon) && (am == 0)))
		{
			if (((self.current_weapon != 2048) && (self.current_weapon != 16384)))
			{
				self.weaponmode = 0;
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
				self.impulse = 0;
				return;
			}
			if ((self.last_impulse == _G))
			{
				StatusRes (self.impulse);
				self.impulse = 0;
				return;
			}
		}
	}

	if (self.captain == 1) {
                self.current_menu = 24;
                self.current_menu_type = 5;
                self.current_menu_page = 1;
                self.menu_count = 30;
                self.menu_displaytime = 0;
                self.impulse = 0;
                return;
	}

	if ((self.impulse == 239))
	{
		self.current_menu = 24;
		self.current_menu_page = 1;
		self.menu_count = 30;
		self.menu_displaytime = 0;
		self.impulse = 0;
		return;
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
		self.impulse = 0;
		return;
	}
	if ((self.impulse == 171))
	{
		UseSpecialSkill ();
		return;
	}

	if (tfvsdm)
	{
		if (((self.team_no == 1) || (self.team_no == 3)))
		{
			if (((self.impulse == 8) && (self.current_menu != 6)))
			{
				self.current_menu = 6;
				self.menu_count = 30;
				self.menu_displaytime = 0;
				self.impulse = 0;
				return;
			}
		}
	}
	else
	{
		if (((self.impulse == 8) && (self.current_menu != 6)))
		{
			self.current_menu = 6;
			self.menu_count = 30;
			self.impulse = 0;
			return;
		}
	}
	if ((self.impulse == __) && !captainmode)
	{
		if ((clanbattle && !cb_prematch))
		{
			sprint (self, 2, "Clan Battle in progress....\n");
			self.impulse = 0;
			return;
		}
		self.current_menu = 2;
		self.menu_count = 30;
		self.impulse = 0;
		return;
	}
	if ((self.impulse == 168))
	{
		dprint ("hi\n");
		self.last_impulse = self.impulse;
		self.impulse = 0;
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
		self.impulse = 0;
		return;
	}
	if (((!self.is_building && !self.is_detpacking) && !self.is_feigning))
	{
		if ((((self.impulse >= 1) && (self.impulse < 9)) || (self.impulse == COLOR_RED)))
		{
			W_ChangeWeapon ();
			self.impulse = 0;
			return;
		}
		else
		{
			if ((allow_hook && ((self.impulse == 22) || (self.impulse == 39))))
			{
				W_ChangeWeapon ();
				self.impulse = 0;
				return;
			}
			else
			{
				if ((self.impulse == 40))
				{
					W_ChangeWeapon ();
					self.impulse = 0;
					return;
				}
				else
				{
					if ((self.impulse == enter))
					{
						CycleWeaponCommand ();
						self.impulse = 0;
						return;
					}
					else
					{
						if (((self.impulse == 12) && (self.last_weapon != 0)))
						{
							W_ChangeWeapon ();
							self.impulse = 0;
							return;
						}
						else
						{
							if ((self.impulse == 150))
							{
								TeamFortress_PrimeGrenade ();
								self.impulse = 0;
								return;
							}
							else
							{
								if ((self.impulse == 151))
								{
									TeamFortress_PrimeGrenade ();
									self.impulse = 0;
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
										self.impulse = 0;
										return;
									}
									else
									{
										if ((self.impulse == 164))
										{
											TeamFortress_SetDetpack (5);
											self.impulse = 0;
											return;
										}
										else
										{
											if ((self.impulse == 165))
											{
												TeamFortress_SetDetpack (20);
												self.impulse = 0;
												return;
											}
											else
											{
												if ((self.impulse == 166))
												{
													TeamFortress_SetDetpack (_2);
													self.impulse = 0;
													return;
												}
												else
												{
													if ((self.impulse == 167))
													{
														TeamFortress_SetDetpack (255);
														self.impulse = 0;
														return;
													}
													else
													{
														if ((self.impulse == 172))
														{
															self.current_menu = 4;
															self.menu_count = 30;
															self.impulse = 0;
															return;
														}
														else
														{
															if ((self.impulse == 184))
															{
																TeamFortress_Discard ();
																self.impulse = 0;
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
		self.impulse = 0;
		return;
	}
	else
	{
		if ((self.playerclass && (self.impulse == 181)))
		{
			TeamFortress_SaveMe ();
			self.impulse = 0;
			return;
		}
		else
		{
			if ((self.impulse == 152))
			{
				TeamFortress_ThrowGrenade ();
				self.impulse = 0;
				return;
			}
			else
			{
				if ((self.impulse == 185))
				{
					TeamFortress_ID ();
					self.impulse = 0;
					return;
				}
				else
				{
					if ((self.playerclass && (self.impulse == 194)))
					{
						DropGoalItems ();
						self.impulse = 0;
						return;
					}
					else
					{
						if ((self.impulse == 169))
						{
							TeamFortress_DetpackStop ();
							self.impulse = 0;
							return;
						}
						else
						{
							if (((self.impulse == 188) && (self.playerclass == PC_ENGINEER)))
							{
								DestroyBuilding (self, "building_sentrygun");
								self.impulse = 0;
								return;
							}
							else
							{
								if (((self.impulse == 187) && (self.playerclass == PC_ENGINEER)))
								{
									DestroyBuilding (self, "building_dispenser");
									self.impulse = 0;
									return;
								}
								else
								{
									if (((self.impulse == 177) && (self.playerclass == PC_SPY)))
									{
										TeamFortress_SpyGoUndercover ();
										self.impulse = 0;
										return;
									}
									else
									{
										if (((self.impulse == 178) && (self.playerclass == PC_SPY)))
										{
											TeamFortress_SpyFeignDeath (0);
											self.impulse = 0;
											return;
										}
										else
										{
											if (((self.impulse == 199) && (self.playerclass == PC_SPY)))
											{
												TeamFortress_SpyFeignDeath (1);
												self.impulse = 0;
												return;
											}
											else
											{
												if (((self.impulse == 179) && (self.playerclass == PC_ENGINEER)))
												{
													TeamFortress_EngineerBuild ();
													self.impulse = 0;
													return;
												}
												else
												{
													if ((self.impulse == 23))
													{
														if ((CTF_Map == 1))
														{
															TeamFortress_CTF_FlagInfo ();
														}
														else
														{
															TeamFortress_DisplayDetectionItems ();
														}
														self.impulse = 0;
														return;
													}
													else
													{
														if ((self.impulse == _v))
														{
															display_location ();
															self.impulse = 0;
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
	self.impulse = 0;
};

void () CommandImpulses =
{
	if ((self.impulse == 41))
	{
		Toggle_Tracking ();
		self.impulse = 0;
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
					sprint (self, 2, "Clan Battle in progress....\n");
					self.impulse = 0;
					return;
				}
			}
			if (self.playerclass)
			{
				return;
			}
			if ((self.tracking != 1))
			{
				return;
			}
			Pan_In (15);
			self.impulse = 0;
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
						sprint (self, 2, "Clan Battle in progress....\n");
						self.impulse = 0;
						return;
					}
				}
				if (self.playerclass)
				{
					return;
				}
				if ((self.tracking != 1))
				{
					return;
				}
				Pan_Out (15);
				self.impulse = 0;
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
							sprint (self, 2, "Clan Battle in progress....\n");
							self.impulse = 0;
							return;
						}
					}
					if ((self.playerclass || self.deadflag))
					{
						return;
					}
					Track_Player ();
					self.last_impulse = self.impulse;
					self.impulse = 0;
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
								sprint (self, 2, "Clan Battle in progress....\n");
								self.impulse = 0;
								return;
							}
						}
						if ((self.playerclass || self.deadflag))
						{
							return;
						}
						Track_Tfgoal ();
						self.last_impulse = self.impulse;
						self.impulse = 0;
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
									sprint (self, 2, "Clan Battle in progress....\n");
									self.impulse = 0;
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
							self.impulse = 0;
							return;
						}
						else
						{
							if ((self.impulse == 180))
							{
								Drop_detpack ();
								self.impulse = 0;
								return;
							}
							else
							{
								if ((self.impulse == _H))
								{
									ShowFrags (self);
									self.impulse = 0;
									return;
								}
								else
								{
									if ((self.impulse == _I))
									{
										ShowFps ();
										self.impulse = 0;
										return;
									}
									else
									{
										if ((self.impulse == _J))
										{
											ShowStats ();
											self.impulse = 0;
											return;
										}
										else
										{
											if ((self.impulse == _S))
											{
												VoteYes ();
												self.impulse = 0;
												return;
											}
											else
											{
												if ((self.impulse == _T))
												{
													VoteNo ();
													self.impulse = 0;
													return;
												}
												else
												{
													if ((self.impulse == _U))
													{
														PlayerBreak ();
														self.impulse = 0;
														return;
													}
													else
													{
														if ((self.impulse == _V))
														{
															if ((allow_flash == 1))
															{
																flash_toggle ();
															}
															self.impulse = 0;
															return;
														}
														else
														{
															if ((self.impulse == _X))
															{
																Commands ();
																self.impulse = 0;
																return;
															}
															else
															{
																if ((self.impulse == _W))
																{
																	ShowVersion ();
																	self.impulse = 0;
																	return;
																}
																else
																{
																	if ((self.impulse == _Y))
																	{
																		ModStatus ();
																		self.impulse = 0;
																		return;
																	}
																	else
																	{
																		if ((self.impulse == _R))
																		{
																			if (!stof (infokey (world, "adminlevel")))
																			{
																				sprint (self, 2, "Admins are not allowed on this server.\n");
																				self.impulse = 0;
																				return;
																			}
																			VoteAdmin ();
																			self.impulse = 0;
																			return;
																		}
																		else
																		{
																			if (((self.is_admin != 1) && (self.is_admin != 3)))
																			{
																				self.impulse = 0;
																				return;
																			}
																			else
																			{
																				if ((self.impulse == 192))
																				{
																					if ((self.is_admin != 3))
																					{
																						if (!stof (infokey (world, "adminlevel")))
																						{
																							sprint (self, 2, "Admins are not allowed on this server.\n");
																							self.impulse = 0;
																							return;
																						}
																					}
																					Admin_CountPlayers ();
																					self.impulse = 0;
																					return;
																				}
																				else
																				{
																					if ((self.impulse == 218))
																					{
																						if ((self.is_admin != 3))
																						{
																							if ((stof (infokey (world, "adminlevel")) < 3))
																							{
																								sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																								self.impulse = 0;
																								return;
																							}
																						}
																						Calibrate_Level ();
																						self.impulse = 0;
																						return;
																					}
																					else
																					{
																						if ((self.impulse == 189))
																						{
																							if ((self.is_admin != 3))
																							{
																								if ((stof (infokey (world, "adminlevel")) < 3))
																								{
																									sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																									self.impulse = 0;
																									return;
																								}
																							}
																							Admin_CycleDeal ();
																							self.impulse = 0;
																							return;
																						}
																						else
																						{
																							if (((self.impulse == 190) && (self.admin_mode == 1)))
																							{
																								if ((self.is_admin != 3))
																								{
																									if ((stof (infokey (world, "adminlevel")) < 3))
																									{
																										sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																										self.impulse = 0;
																										return;
																									}
																								}
																								Admin_DoKick ();
																								self.impulse = 0;
																								return;
																							}
																							else
																							{
																								if (((self.impulse == 195) && (self.admin_mode == 1)))
																								{
																									if ((self.is_admin != 3))
																									{
																										if ((stof (infokey (world, "adminlevel")) < 3))
																										{
																											sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																											self.impulse = 0;
																											return;
																										}
																									}
																									Admin_CycleDeal ();
																									self.impulse = 0;
																									return;
																								}
																								else
																								{
																									if ((self.impulse == 198))
																									{
																										if ((self.is_admin != 3))
																										{
																											if ((stof (infokey (world, "adminlevel")) < 3))
																											{
																												sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																												self.impulse = 0;
																												return;
																											}
																										}
																										Admin_ListIPs ();
																										self.impulse = 0;
																										return;
																									}
																									else
																									{
																										if ((self.impulse == 200))
																										{
																											if ((self.is_admin != 3))
																											{
																												if (!stof (infokey (world, "adminlevel")))
																												{
																													sprint (self, 2, "Admins are not allowed on this server.\n");
																													self.impulse = 0;
																													return;
																												}
																											}
																											if (((clanbattle == 1) && !cb_prematch))
																											{
																												sprint (self, 2, "Clan Battle in progress....\n");
																												self.impulse = 0;
																												return;
																											}
																											TimeDown (5);
																											self.impulse = 0;
																											return;
																										}
																										else
																										{
																											if ((self.impulse == 201))
																											{
																												if ((self.is_admin != 3))
																												{
																													if (!stof (infokey (world, "adminlevel")))
																													{
																														sprint (self, 2, "Admins are not allowed on this server.\n");
																														self.impulse = 0;
																														return;
																													}
																												}
																												if (((clanbattle == 1) && !cb_prematch))
																												{
																													sprint (self, 2, "Clan Battle in progress....\n");
																													self.impulse = 0;
																													return;
																												}
																												TimeUp (5);
																												self.impulse = 0;
																												return;
																											}
																											else
																											{
																												if ((self.impulse == 228))
																												{
																													if ((self.is_admin != 3))
																													{
																														if (!stof (infokey (world, "adminlevel")))
																														{
																															sprint (self, 2, "Admins are not allowed on this server.\n");
																															self.impulse = 0;
																															return;
																														}
																													}
																													if (((clanbattle == 1) && !cb_prematch))
																													{
																														sprint (self, 2, "Clan Battle in progress....\n");
																														self.impulse = 0;
																														return;
																													}
																													PmTimeDown (1);
																													self.impulse = 0;
																													return;
																												}
																												else
																												{
																													if ((self.impulse == 229))
																													{
																														if ((self.is_admin != 3))
																														{
																															if (!stof (infokey (world, "adminlevel")))
																															{
																																sprint (self, 2, "Admins are not allowed on this server.\n");
																																self.impulse = 0;
																																return;
																															}
																														}
																														if (((clanbattle == 1) && !cb_prematch))
																														{
																															sprint (self, 2, "Clan Battle in progress....\n");
																															self.impulse = 0;
																															return;
																														}
																														PmTimeUp (1);
																														self.impulse = 0;
																														return;
																													}
																													else
																													{
																														if ((self.impulse == 96))
																														{
																															if ((self.is_admin != 3))
																															{
																																if (!stof (infokey (world, "adminlevel")))
																																{
																																	sprint (self, 2, "Admins are not allowed on this server.\n");
																																	self.impulse = 0;
																																	return;
																																}
																															}
																															if (((clanbattle == 1) && !cb_prematch))
																															{
																																sprint (self, 2, "Clan Battle in progress....\n");
																																self.impulse = 0;
																																return;
																															}
																															CFTimeDown (1);
																															self.impulse = 0;
																															return;
																														}
																														else
																														{
																															if ((self.impulse == _a))
																															{
																																if ((self.is_admin != 3))
																																{
																																	if (!stof (infokey (world, "adminlevel")))
																																	{
																																		sprint (self, 2, "Admins are not allowed on this server.\n");
																																		self.impulse = 0;
																																		return;
																																	}
																																}
																																if (((clanbattle == 1) && !cb_prematch))
																																{
																																	sprint (self, 2, "Clan Battle in progress....\n");
																																	self.impulse = 0;
																																	return;
																																}
																																CFTimeUp (1);
																																self.impulse = 0;
																																return;
																															}
																															else
																															{
																																if ((self.impulse == _b))
																																{
																																	if ((self.is_admin != 3))
																																	{
																																		if (!stof (infokey (world, "adminlevel")))
																																		{
																																			sprint (self, 2, "Admins are not allowed on this server.\n");
																																			self.impulse = 0;
																																			return;
																																		}
																																	}
																																	if (((clanbattle == 1) && !cb_prematch))
																																	{
																																		sprint (self, 2, "Clan Battle in progress....\n");
																																		self.impulse = 0;
																																		return;
																																	}
																																	OverTimeDown (1);
																																	self.impulse = 0;
																																	return;
																																}
																																else
																																{
																																	if ((self.impulse == _c))
																																	{
																																		if ((self.is_admin != 3))
																																		{
																																			if (!stof (infokey (world, "adminlevel")))
																																			{
																																				sprint (self, 2, "Admins are not allowed on this server.\n");
																																				self.impulse = 0;
																																				return;
																																			}
																																		}
																																		if (((clanbattle == 1) && !cb_prematch))
																																		{
																																			sprint (self, 2, "Clan Battle in progress....\n");
																																			self.impulse = 0;
																																			return;
																																		}
																																		OverTimeUp (1);
																																		self.impulse = 0;
																																		return;
																																	}
																																	else
																																	{
																																		if ((self.impulse == 202))
																																		{
																																			if ((self.is_admin != 3))
																																			{
																																				if (!stof (infokey (world, "adminlevel")))
																																				{
																																					sprint (self, 2, "Admins are not allowed on this server.\n");
																																					self.impulse = 0;
																																					return;
																																				}
																																			}
																																			if (((clanbattle == 1) && !cb_prematch))
																																			{
																																				sprint (self, 2, "Clan Battle in progress....\n");
																																				self.impulse = 0;
																																				return;
																																			}
																																			pmtime = 0;
																																			StartTimer ();
																																			self.impulse = 0;
																																			return;
																																		}
																																		else
																																		{
																																			if ((self.impulse == 204))
																																			{
																																				if ((self.is_admin != 3))
																																				{
																																					if (!stof (infokey (world, "adminlevel")))
																																					{
																																						sprint (self, 2, "Admins are not allowed on this server.\n");
																																						self.impulse = 0;
																																						return;
																																					}
																																				}
																																				if (((clanbattle == 1) && !cb_prematch))
																																				{
																																					sprint (self, 2, "Clan Battle in progress....\n");
																																					self.impulse = 0;
																																					return;
																																				}
																																				FragsDown ();
																																				self.impulse = 0;
																																				return;
																																			}
																																			else
																																			{
																																				if ((self.impulse == 205))
																																				{
																																					if ((self.is_admin != 3))
																																					{
																																						if (!stof (infokey (world, "adminlevel")))
																																						{
																																							sprint (self, 2, "Admins are not allowed on this server.\n");
																																							self.impulse = 0;
																																							return;
																																						}
																																					}
																																					if (((clanbattle == 1) && !cb_prematch))
																																					{
																																						sprint (self, 2, "Clan Battle in progress....\n");
																																						self.impulse = 0;
																																						return;
																																					}
																																					FragsUp ();
																																					self.impulse = 0;
																																					return;
																																				}
																																				else
																																				{
																																					if ((self.impulse == 207))
																																					{
																																						if ((self.is_admin != 3))
																																						{
																																							if ((stof (infokey (world, "adminlevel")) < 2))
																																							{
																																								sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																								self.impulse = 0;
																																								return;
																																							}
																																						}
																																						ClanMode ();
																																						self.impulse = 0;
																																						return;
																																					}
																																					else
																																					{
																																						if ((self.impulse == 208))
																																						{
																																							if ((self.is_admin != 3))
																																							{
																																								if (!stof (infokey (world, "adminlevel")))
																																								{
																																									sprint (self, 2, "Admins are not allowed on this server.\n");
																																									self.impulse = 0;
																																									return;
																																								}
																																							}
																																							if (((clanbattle == 1) && !cb_prematch))
																																							{
																																								sprint (self, 2, "Clan Battle in progress....\n");
																																								self.impulse = 0;
																																								return;
																																							}
																																							RestartMap ();
																																							self.impulse = 0;
																																							return;
																																						}
																																						else
																																						{
																																							if ((self.impulse == 214))
																																							{
																																								if ((self.is_admin != 3))
																																								{
																																									if (!stof (infokey (world, "adminlevel")))
																																									{
																																										sprint (self, 2, "Admins are not allowed on this server.\n");
																																										self.impulse = 0;
																																										return;
																																									}
																																								}
																																								if (((clanbattle == 1) && !cb_prematch))
																																								{
																																									sprint (self, 2, "Clan Battle in progress....\n");
																																									self.impulse = 0;
																																									return;
																																								}
																																								ToggleSpecTalk ();
																																								self.impulse = 0;
																																								return;
																																							}
																																							else
																																							{
																																								if ((self.impulse == 216))
																																								{
																																									if ((self.is_admin != 3))
																																									{
																																										if ((stof (infokey (world, "adminlevel")) < 2))
																																										{
																																											sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																											self.impulse = 0;
																																											return;
																																										}
																																									}
																																									Toggle_TFvsDM ();
																																									self.impulse = 0;
																																									return;
																																								}
																																								else
																																								{
																																									if ((self.impulse == 94))
																																									{
																																										if ((self.is_admin != 3))
																																										{
																																											if ((stof (infokey (world, "adminlevel")) < 2))
																																											{
																																												sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																												self.impulse = 0;
																																												return;
																																											}
																																										}
																																										Toggle_Practice ();
																																										self.impulse = 0;
																																										return;
																																									}
																																									else
																																									{
																																										if ((self.impulse == _Q))
																																										{
																																											if ((self.is_admin != 3))
																																											{
																																												if ((stof (infokey (world, "adminlevel")) < 2))
																																												{
																																													sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																													self.impulse = 0;
																																													return;
																																												}
																																											}
																																											Toggle_SpeedCap ();
																																											self.impulse = 0;
																																											return;
																																										}
																																										else
																																										{
																																											if ((self.impulse == _P))
																																											{
																																												if ((self.is_admin != 3))
																																												{
																																													if ((stof (infokey (world, "adminlevel")) < 2))
																																													{
																																														sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																														self.impulse = 0;
																																														return;
																																													}
																																												}
																																												Toggle_Duel ();
																																												self.impulse = 0;
																																												return;
																																											}
																																											else
																																											{
																																												if ((self.impulse == _O))
																																												{
																																													if ((self.is_admin != 3))
																																													{
																																														if ((stof (infokey (world, "adminlevel")) < 2))
																																														{
																																															sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																															self.impulse = 0;
																																															return;
																																														}
																																													}
																																													Toggle_Rounds ();
																																													self.impulse = 0;
																																													return;
																																												}
																																												else
																																												{
																																													if ((self.impulse == _N))
																																													{
																																														if ((self.is_admin != 3))
																																														{
																																															if ((stof (infokey (world, "adminlevel")) < 2))
																																															{
																																																sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																self.impulse = 0;
																																																return;
																																															}
																																														}
																																														Toggle_TFStrike ();
																																														self.impulse = 0;
																																														return;
																																													}
																																													else
																																													{
																																														if ((self.impulse == 220))
																																														{
																																															if ((self.is_admin != 3))
																																															{
																																																if ((stof (infokey (world, "adminlevel")) < 2))
																																																{
																																																	sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																	self.impulse = 0;
																																																	return;
																																																}
																																															}
																																															if (((clanbattle == 1) && !cb_prematch))
																																															{
																																																sprint (self, 2, "Clan Battle in progress....\n");
																																																self.impulse = 0;
																																																return;
																																															}
																																															ResetSetup ();
																																															self.impulse = 0;
																																															return;
																																														}
																																														else
																																														{
																																															if ((self.impulse == 221))
																																															{
																																																if ((self.is_admin != 3))
																																																{
																																																	if (!stof (infokey (world, "adminlevel")))
																																																	{
																																																		sprint (self, 2, "Admins are not allowed on this server.\n");
																																																		self.impulse = 0;
																																																		return;
																																																	}
																																																}
																																																Toggle_Teamfrags ();
																																																self.impulse = 0;
																																																return;
																																															}
																																															else
																																															{
																																																if ((self.impulse == 222))
																																																{
																																																	if ((self.is_admin != 3))
																																																	{
																																																		if (!stof (infokey (world, "adminlevel")))
																																																		{
																																																			sprint (self, 2, "Admins are not allowed on this server.\n");
																																																			self.impulse = 0;
																																																			return;
																																																		}
																																																	}
																																																	Toggle_Fullts ();
																																																	self.impulse = 0;
																																																	return;
																																																}
																																																else
																																																{
																																																	if ((self.impulse == 223))
																																																	{
																																																		if ((self.is_admin != 3))
																																																		{
																																																			if (!stof (infokey (world, "adminlevel")))
																																																			{
																																																				sprint (self, 2, "Admins are not allowed on this server.\n");
																																																				self.impulse = 0;
																																																				return;
																																																			}
																																																		}
																																																		Toggle_Grapple ();
																																																		self.impulse = 0;
																																																		return;
																																																	}
																																																	else
																																																	{
																																																		if ((self.impulse == 217))
																																																		{
																																																			if ((self.is_admin != 3))
																																																			{
																																																				if (!stof (infokey (world, "adminlevel")))
																																																				{
																																																					sprint (self, 2, "Admins are not allowed on this server.\n");
																																																					self.impulse = 0;
																																																					return;
																																																				}
																																																			}
																																																			ToggleFlash ();
																																																			self.impulse = 0;
																																																			return;
																																																		}
																																																		else
																																																		{
																																																			if ((self.impulse == 224))
																																																			{
																																																				if ((self.is_admin != 3))
																																																				{
																																																					if ((stof (infokey (world, "adminlevel")) < 2))
																																																					{
																																																						sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																						self.impulse = 0;
																																																						return;
																																																					}
																																																				}
																																																				if (((clanbattle == 1) && !cb_prematch))
																																																				{
																																																					sprint (self, 2, "Clan Battle in progress....\n");
																																																					self.impulse = 0;
																																																					return;
																																																				}
																																																				ClanSetup ();
																																																				self.impulse = 0;
																																																				return;
																																																			}
																																																			else
																																																			{
																																																				if ((self.impulse == 230))
																																																				{
																																																					if ((self.is_admin != 3))
																																																					{
																																																						if (!stof (infokey (world, "adminlevel")))
																																																						{
																																																							sprint (self, 2, "Admins are not allowed on this server.\n");
																																																							self.impulse = 0;
																																																							return;
																																																						}
																																																					}
																																																					if (((clanbattle == 1) && !cb_prematch))
																																																					{
																																																						sprint (self, 2, "Clan Battle in progress....\n");
																																																						self.impulse = 0;
																																																						return;
																																																					}
																																																					Toggle_Gibs ();
																																																					self.impulse = 0;
																																																					return;
																																																				}
																																																				else
																																																				{
																																																					if ((self.impulse == 193))
																																																					{
																																																						if ((self.is_admin != 3))
																																																						{
																																																							if ((stof (infokey (world, "adminlevel")) < 2))
																																																							{
																																																								sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																								self.impulse = 0;
																																																								return;
																																																							}
																																																						}
																																																						Admin_CeaseFire ();
																																																						self.impulse = 0;
																																																						return;
																																																					}
																																																					else
																																																					{
																																																						if ((self.impulse == 215))
																																																						{
																																																							if ((self.is_admin != 3))
																																																							{
																																																								if ((stof (infokey (world, "adminlevel")) < 2))
																																																								{
																																																									sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																									self.impulse = 0;
																																																									return;
																																																								}
																																																							}
																																																							if (((clanbattle == 1) && !cb_prematch))
																																																							{
																																																								sprint (self, 2, "Clan Battle in progress....\n");
																																																								self.impulse = 0;
																																																								return;
																																																							}
																																																							ToggleFreeze ();
																																																							self.impulse = 0;
																																																							return;
																																																						}
																																																						else
																																																						{
																																																							if ((self.impulse == 231))
																																																							{
																																																								if ((self.is_admin != 3))
																																																								{
																																																									if ((stof (infokey (world, "adminlevel")) < 2))
																																																									{
																																																										sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																										self.impulse = 0;
																																																										return;
																																																									}
																																																								}
																																																								Toggle_Highlander ();
																																																								self.impulse = 0;
																																																								return;
																																																							}
																																																							else
																																																							{
																																																								if ((self.impulse == 206))
																																																								{
																																																									if ((self.is_admin != 3))
																																																									{
																																																										if ((stof (infokey (world, "adminlevel")) < 2))
																																																										{
																																																											sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																											self.impulse = 0;
																																																											return;
																																																										}
																																																									}
																																																									if (((clanbattle == 1) && !cb_prematch))
																																																									{
																																																										sprint (self, 2, "Clan Battle in progress....\n");
																																																										self.impulse = 0;
																																																										return;
																																																									}
																																																									ChangeTP ();
																																																									self.impulse = 0;
																																																									return;
																																																								}
																																																								else
																																																								{
																																																									if ((self.impulse == 213))
																																																									{
																																																										if ((self.is_admin != 3))
																																																										{
																																																											if ((stof (infokey (world, "adminlevel")) < 2))
																																																											{
																																																												sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																												self.impulse = 0;
																																																												return;
																																																											}
																																																										}
																																																										if (((clanbattle == 1) && !cb_prematch))
																																																										{
																																																											sprint (self, 2, "Clan Battle in progress....\n");
																																																											self.impulse = 0;
																																																											return;
																																																										}
																																																										GroundSpeed ();
																																																										self.impulse = 0;
																																																										return;
																																																									}
																																																									else
																																																									{
																																																										if ((self.impulse == 233))
																																																										{
																																																											if ((stof (infokey (world, "adminlevel")) < 2))
																																																											{
																																																												sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																												self.impulse = 0;
																																																												return;
																																																											}
																																																											if (((clanbattle == 1) && !cb_prematch))
																																																											{
																																																												sprint (self, 2, "Clan Battle in progress....\n");
																																																												self.impulse = 0;
																																																												return;
																																																											}
																																																											Toggle_Grenpacks ();
																																																											self.impulse = 0;
																																																											return;
																																																										}
																																																										else
																																																										{
																																																											if ((self.impulse == 225))
																																																											{
																																																												if ((self.is_admin != 3))
																																																												{
																																																													if ((stof (infokey (world, "adminlevel")) < 2))
																																																													{
																																																														sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																														self.impulse = 0;
																																																														return;
																																																													}
																																																												}
																																																												if (((clanbattle == 1) && !cb_prematch))
																																																												{
																																																													sprint (self, 2, "Clan Battle in progress....\n");
																																																													self.impulse = 0;
																																																													return;
																																																												}
																																																												ToggleFbskins ();
																																																												self.impulse = 0;
																																																												return;
																																																											}
																																																											else
																																																											{
																																																												if ((self.impulse == 226))
																																																												{
																																																													if ((self.is_admin != 3))
																																																													{
																																																														if ((stof (infokey (world, "adminlevel")) < 2))
																																																														{
																																																															sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																															self.impulse = 0;
																																																															return;
																																																														}
																																																													}
																																																													if (((clanbattle == 1) && !cb_prematch))
																																																													{
																																																														sprint (self, 2, "Clan Battle in progress....\n");
																																																														self.impulse = 0;
																																																														return;
																																																													}
																																																													ToggleEnemy ();
																																																													self.impulse = 0;
																																																													return;
																																																												}
																																																												else
																																																												{
																																																													if ((self.impulse == 227))
																																																													{
																																																														if ((self.is_admin != 3))
																																																														{
																																																															if ((stof (infokey (world, "adminlevel")) < 2))
																																																															{
																																																																sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																self.impulse = 0;
																																																																return;
																																																															}
																																																														}
																																																														if (((clanbattle == 1) && !cb_prematch))
																																																														{
																																																															sprint (self, 2, "Clan Battle in progress....\n");
																																																															self.impulse = 0;
																																																															return;
																																																														}
																																																														TogglePointing ();
																																																														self.impulse = 0;
																																																														return;
																																																													}
																																																													else
																																																													{
																																																														if ((self.impulse == 235))
																																																														{
																																																															if ((self.is_admin != 3))
																																																															{
																																																																if ((stof (infokey (world, "adminlevel")) < 2))
																																																																{
																																																																	sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																	self.impulse = 0;
																																																																	return;
																																																																}
																																																															}
																																																															if (((clanbattle == 1) && !cb_prematch))
																																																															{
																																																																sprint (self, 2, "Clan Battle in progress....\n");
																																																																self.impulse = 0;
																																																																return;
																																																															}
																																																															Toggle_Detpack ();
																																																															self.impulse = 0;
																																																															return;
																																																														}
																																																														else
																																																														{
																																																															if ((self.impulse == 236))
																																																															{
																																																																if ((self.is_admin != 3))
																																																																{
																																																																	if ((stof (infokey (world, "adminlevel")) < 2))
																																																																	{
																																																																		sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																		self.impulse = 0;
																																																																		return;
																																																																	}
																																																																}
																																																																Toggle_flag_emu ();
																																																																self.impulse = 0;
																																																																return;
																																																															}
																																																															else
																																																															{
																																																																if ((self.impulse == 232))
																																																																{
																																																																	if ((self.is_admin != 3))
																																																																	{
																																																																		if ((stof (infokey (world, "adminlevel")) < 2))
																																																																		{
																																																																			sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																			self.impulse = 0;
																																																																			return;
																																																																		}
																																																																	}
																																																																	if (((clanbattle == 1) && !cb_prematch))
																																																																	{
																																																																		sprint (self, 2, "Clan Battle in progress....\n");
																																																																		self.impulse = 0;
																																																																		return;
																																																																	}
																																																																	Toggle_SentryType ();
																																																																	self.impulse = 0;
																																																																	return;
																																																																}
																																																																else
																																																																{
																																																																	if ((self.impulse == 191))
																																																																	{
																																																																		if ((self.is_admin != 3))
																																																																		{
																																																																			if ((stof (infokey (world, "adminlevel")) < 2))
																																																																			{
																																																																				sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																				self.impulse = 0;
																																																																				return;
																																																																			}
																																																																		}
																																																																		if (((clanbattle == 1) && !cb_prematch))
																																																																		{
																																																																			sprint (self, 2, "Clan Battle in progress....\n");
																																																																			self.impulse = 0;
																																																																			return;
																																																																		}
																																																																		Toggle_SentryFire ();
																																																																		self.impulse = 0;
																																																																		return;
																																																																	}
																																																																	else
																																																																	{
																																																																		if ((self.impulse == 234))
																																																																		{
																																																																			if ((self.is_admin != 3))
																																																																			{
																																																																				if ((stof (infokey (world, "adminlevel")) < 2))
																																																																				{
																																																																					sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																					self.impulse = 0;
																																																																					return;
																																																																				}
																																																																			}
																																																																			if (((clanbattle == 1) && !cb_prematch))
																																																																			{
																																																																				sprint (self, 2, "Clan Battle in progress....\n");
																																																																				self.impulse = 0;
																																																																				return;
																																																																			}
																																																																			Toggle_PipeDelay ();
																																																																			self.impulse = 0;
																																																																			return;
																																																																		}
																																																																		else
																																																																		{
																																																																			if ((self.impulse == 238))
																																																																			{
																																																																				if ((self.is_admin != 3))
																																																																				{
																																																																					if ((stof (infokey (world, "adminlevel")) < 2))
																																																																					{
																																																																						sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																																																																						self.impulse = 0;
																																																																						return;
																																																																					}
																																																																				}
																																																																				if (((clanbattle == 1) && !cb_prematch))
																																																																				{
																																																																					sprint (self, 2, "Clan Battle in progress....\n");
																																																																					self.impulse = 0;
																																																																					return;
																																																																				}
																																																																				Toggle_Frj ();
																																																																				self.impulse = 0;
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
	if ((tfvsdm == 1))
	{
		if (((self.team_no == 1) || (self.team_no == 3)))
		{
			if (((self.impulse == 8) && (self.current_menu != 6)))
			{
				self.current_menu = 6;
				self.menu_count = 30;
				self.menu_displaytime = 0;
				self.impulse = 0;
				return (1);
			}
		}
	}
	else
	{
		if (((self.impulse == 8) && (self.current_menu != 6)))
		{
			self.current_menu = 6;
			self.menu_count = 30;
			self.menu_displaytime = 0;
			self.impulse = 0;
			return (1);
		}
	}
	if ((((self.impulse >= 1) && (self.impulse < 9)) || (self.impulse == COLOR_RED)))
	{
		W_ChangeWeapon ();
		self.impulse = 0;
		return (1);
	}
	else
	{
		if ((allow_hook && ((self.impulse == 22) || (self.impulse == 39))))
		{
			W_ChangeWeapon ();
			self.impulse = 0;
			return (1);
		}
		else
		{
			if ((self.impulse == 40))
			{
				W_ChangeWeapon ();
				self.impulse = 0;
				return (1);
			}
			else
			{
				if ((self.impulse == enter))
				{
					CycleWeaponCommand ();
					self.impulse = 0;
					return (1);
				}
			}
		}
	}
	if ((self.impulse == redlamp))
	{
		TeamFortress_Inventory ();
		self.impulse = 0;
		return (1);
	}
	else
	{
		if ((self.impulse == 185))
		{
			TeamFortress_ID ();
			self.impulse = 0;
			return (1);
		}
		else
		{
			if ((self.impulse == 23))
			{
				if ((CTF_Map == 1))
				{
					TeamFortress_CTF_FlagInfo ();
				}
				else
				{
					TeamFortress_DisplayDetectionItems ();
				}
				self.impulse = 0;
				return (1);
			}
			else
			{
				if ((self.impulse == _v))
				{
					display_location ();
					self.impulse = 0;
					return (1);
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
		self.impulse = 0;
		return (1);
	}
	else
	{
		if ((self.impulse == 174))
		{
			TeamFortress_AutoZoomToggle ();
			self.impulse = 0;
			return (1);
		}
		else
		{
			if ((self.impulse == bluelamp))
			{
				TeamFortress_DisplayLegalClasses ();
				self.impulse = 0;
				return (1);
			}
			else
			{
				if (((self.impulse > _d) && (self.impulse <= (_d + 11))))
				{
					TeamFortress_ChangeClass ((self.impulse - _d));
					self.impulse = 0;
					return (1);
				}
				else
				{
					if (((self.playerclass && (self.impulse == _c)) && !cb_prematch && !captainmode))
					{
						self.current_menu = 20;
						self.menu_count = 30;
						self.impulse = 0;
						return (1);
					}
					else
					{
						if ((self.impulse == _G))
						{
							self.last_impulse = self.impulse;
							return (1);
						}
					}
				}
			}
		}
	}
	if ((self.impulse == 131))
	{
		TeamFortress_HelpMap ();
		self.impulse = 0;
		return (1);
	}
	else
	{
		if ((self.impulse == _w))
		{
			TeamFortress_StatusQuery ();
			self.impulse = 0;
			return (1);
		}
		else
		{
			if ((self.impulse == 140))
			{
				if (((clanbattle == 1) && !cb_prematch))
				{
					sprint (self, 2, "Clan Battle in progress....\n");
					self.impulse = 0;
					return (1);
				}
				TeamFortress_TeamSet (1);
				self.impulse = 0;
				return (1);
			}
			else
			{
				if ((self.impulse == 141))
				{
					if (((clanbattle == 1) && !cb_prematch))
					{
						sprint (self, 2, "Clan Battle in progress....\n");
						self.impulse = 0;
						return (1);
					}
					TeamFortress_TeamSet (2);
					self.impulse = 0;
					return (1);
				}
				else
				{
					if ((self.impulse == 142))
					{
						if (((clanbattle == 1) && !cb_prematch))
						{
							sprint (self, 2, "Clan Battle in progress....\n");
							self.impulse = 0;
							return (1);
						}
						TeamFortress_TeamSet (3);
						self.impulse = 0;
						return (1);
					}
					else
					{
						if ((self.impulse == 143))
						{
							if (((clanbattle == 1) && !cb_prematch))
							{
								sprint (self, 2, "Clan Battle in progress....\n");
								self.impulse = 0;
								return (1);
							}
							TeamFortress_TeamSet (4);
							self.impulse = 0;
							return (1);
						}
						else
						{
							if ((self.impulse == 145))
							{
								TeamFortress_TeamShowScores (0);
								self.impulse = 0;
								return (1);
							}
							else
							{
								if ((self.impulse == 144))
								{
									TeamFortress_TeamShowMemberClasses (self);
									self.impulse = 0;
									return (1);
								}
								else
								{
									if (((self.playerclass == PC_SCOUT) && (self.impulse == 159)))
									{
										ScannerSwitch ();
										self.impulse = 0;
										return (1);
									}
									else
									{
										if (((self.playerclass == PC_SCOUT) && (self.impulse == 162)))
										{
											sprint (self, 2, "Scanner sound: ");
											if ((self.tf_items_flags & 4))
											{
												self.tf_items_flags = (self.tf_items_flags - 4);
												sprint (self, 2, "Off\n");
											}
											else
											{
												self.tf_items_flags = (self.tf_items_flags | 4);
												sprint (self, 2, "On\n");
											}
											self.impulse = 0;
											return (1);
										}
										else
										{
											if (((self.playerclass == PC_SCOUT) && (self.impulse == 160)))
											{
												sprint (self, 2, "Scanning for: ");
												if ((self.tf_items_flags & 1))
												{
													self.tf_items_flags = (self.tf_items_flags - 1);
													if ((self.tf_items_flags & 2))
													{
														sprint (self, 2, "Friendlies Only.\n");
													}
													else
													{
														sprint (self, 2, "Nothing\n");
													}
												}
												else
												{
													self.tf_items_flags = (self.tf_items_flags | 1);
													if ((self.tf_items_flags & 2))
													{
														sprint (self, 2, "Friendlies and Enemies\n");
													}
													else
													{
														sprint (self, 2, "Enemies Only\n");
													}
												}
												self.impulse = 0;
												return (1);
											}
											else
											{
												if (((self.playerclass == PC_SCOUT) && (self.impulse == 161)))
												{
													sprint (self, 2, "Scanning for: ");
													if ((self.tf_items_flags & 2))
													{
														self.tf_items_flags = (self.tf_items_flags - 2);
														if ((self.tf_items_flags & 1))
														{
															sprint (self, 2, "Enemies Only.\n");
														}
														else
														{
															sprint (self, 2, "Nothing\n");
														}
													}
													else
													{
														self.tf_items_flags = (self.tf_items_flags | 2);
														if ((self.tf_items_flags & 1))
														{
															sprint (self, 2, "Friendlies and Enemies\n");
														}
														else
														{
															sprint (self, 2, "Friendlies Only\n");
														}
													}
													self.impulse = 0;
													return (1);
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
														if (((self.StatusBarSize > enter) || (self.StatusBarSize < 1)))
														{
															self.StatusBarSize = 3;
														}
														StatusBar_On ();
														self.impulse = 0;
														return (1);
													}
													else
													{
														if ((self.impulse == 183))
														{
															self.StatusBarSize = 0;
															StatusBar_On ();
															self.impulse = 0;
															return (1);
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

	if (!(self.tfstate & TFSTATE_AIMING))
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
						self.impulse = 0;
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
				self.impulse = 0;
			}
			return;
		}
	}
	if ((self.current_menu > 0))
	{
		Player_Menu ();
		if (((self.impulse > 0) && (((self.current_menu == 21) || (self.current_menu == 22)) || (self.current_menu == 23))))
		{
			Menu_Input (self.impulse);
		}
		else
		{
			if (((self.impulse > 0) && (self.impulse < 11)))
			{
				Menu_Input (self.impulse);
				if ((self.impulse != 0))
				{
					if (((self.team_no == 0) && teamplay))
					{
						Menu_Team_Input (self.impulse);
					}
					else
					{
						if (!self.playerclass)
						{
							if (round_active || !captainmode)
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
	if (((self.impulse != 0) && (self.has_disconnected == 0)))
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
	if ((((self.is_building != 0) || (self.is_detpacking != 0)) || (self.is_feigning != 0)))
	{
		return;
	}
	if (!self.button0 && self.fire_held_down)
	{
		if (self.current_weapon == WEAP_ASSAULT_CANNON ) {
			self.fire_held_down = 0;
			self.tfstate = (self.tfstate - (self.tfstate & TFSTATE_AIMING));
			TeamFortress_SetSpeed (self);
			player_run ();
		}

		return;
	}
	if ((self.button0 && !self.fire_held_down))
	{
		if (((self.current_menu == 6) || (self.current_menu == 7)))
		{
			self.current_menu = 8;
			self.menu_count = 30;
			Attack_Finished (0.2);
		}
		else
		{
			if ( (self.current_weapon == WEAP_SNIPER_RIFLE)) {
				if (!(self.tfstate & TFSTATE_RELOADING)) {
	 	            if (self.tfstate & TFSTATE_AIMING) {
		                if (self.heat < 400) {
		                    self.heat = self.heat + 3;
		                    if (self.heat > 400)
		                    	self.heat = 400;
		                    if ((sniperpower) && (self.power_time < (time - 0.3))) {
		                        self.power_time = time;
		                        Status_Refresh(self);
		                    }
		                } else if ((sniperpower) && (!self.power_full)) {
		                    self.power_full = 1;
		                    Status_Refresh(self);
		                }
		            } else {
		                local vector tv = self.velocity;
		                tv_z = 0;
		                if (vlen(tv) <= 50) {
		                    SniperSight_Create();
		                    self.heat = 50;
		                    self.tfstate = self.tfstate | TFSTATE_AIMING;
		                    if (sniperpower)
		                    	self.power_full = 0;
		                    TeamFortress_SetSpeed(self);
		                }
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
			self.weaponmode = 0;
		}
		else
		{
			if ((self.tfstate & TFSTATE_AIMING))
			{
				if ((self.current_weapon != 32768))
				{
					W_Attack ();
				}
				self.tfstate = (self.tfstate - TFSTATE_AIMING);
				TeamFortress_SetSpeed (self);
				self.heat = 0;
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
			self.super_sound = (time + 1);
			sound (self, 4, "items/damage3.wav", 1, 1);
		}
	}
	return;
};

void () RemoveGrenade =
{
	local entity te;

	if ((self.no_active_napalm_grens > 0))
	{
		self.no_active_napalm_grens = 0;
		self.owner.no_active_napalm_grens = (self.owner.no_active_napalm_grens - 1);
		if ((self.owner.no_active_napalm_grens < 0))
		{
			self.owner.no_active_napalm_grens = 0;
		}
		te = find (world, classname, "grentimer");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_napalm_grens > 0)))
			{
				te.no_active_napalm_grens = (te.no_active_napalm_grens - 1);
			}
			te = find (te, classname, "grentimer");
		}
		dremove (self.enemy);
		dremove (self);
	}
	if ((self.no_active_gas_grens > 0))
	{
		self.no_active_gas_grens = 0;
		self.owner.no_active_gas_grens = (self.owner.no_active_gas_grens - 1);
		if ((self.owner.no_active_gas_grens < 0))
		{
			self.owner.no_active_gas_grens = 0;
		}
		te = find (world, classname, "grentimer");
		while (te)
		{
			if (((te.owner == self.owner) && (te.no_active_gas_grens > 0)))
			{
				te.no_active_gas_grens = (te.no_active_gas_grens - 1);
			}
			te = find (te, classname, "grentimer");
		}
		dremove (self);
	}
};
