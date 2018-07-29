//@import - pc_scout.qc | TODO: Move to concussion grenade specific file
void () ConcussionGrenadeTimer;

//@import - pc_spy.qc | TODO: Move to gas grenade specific file
void () HallucinationTimer;

//@import - weapons.qc
void (float att_delay) Attack_Finished;

//@import - weap_tranq.qc
void () TranquiliserTimer;

//@import - tfort.qc
void (entity pl, float fr, float type) TF_AddFrags;
void () BioInfection_Decay;
void () BioInfection_MonsterDecay;

//=-=-=-=-= Local Functions
void () TeamFortress_Medikit;
void () W_Attack_Medikit;
void () W_FireMedikit;
void () player_medikit1;
void () player_medikit2;
void () player_medikit3;
void () player_medikit4;
void () player_medikitb1;
void () player_medikitb2;
void () player_medikitb3;
void () player_medikitb4;
void () player_medikitc1;
void () player_medikitc2;
void () player_medikitc3;
void () player_medikitc4;
void () player_medikitd1;
void () player_medikitd2;
void () player_medikitd3;
void () player_medikitd4;
//=-=-=-=-=

void () TeamFortress_Medikit = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 0;
	self.AttackFunction = W_Attack_Medikit;
	self.currentammo = self.ammo_medikit;
	self.weaponmodel = "progs/v_medi.mdl";
	self.weaponframe = 0;
};

void () W_Attack_Medikit =
{
	sound (self, 1, "weapons/ax1.wav", 1, 1);
	local float r = random ();
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

void () W_FireMedikit =
{
	local vector source;
	local vector org;
	local float healam;
	local entity te;
	local entity BioInfection;
	local vector dist;

	source = (self.origin + '0 0 16');
	traceline (source, (source + (v_forward * 80)), 0, self);
	if ((trace_fraction == 1))
	{
		return;
	}
	org = (trace_endpos - (v_forward * 4));
	if (trace_ent.takedamage)
	{
		if ((trace_ent.classname == "player"))
		{
			dist = self.origin - trace_ent.origin;			
			if ((((trace_ent.team_no == self.team_no) && (self.team_no != 0)) || coop))
			{
				healam = 200;
				te = find (world, classname, "timer");
				while ((((te.owner != trace_ent) || (te.think != ConcussionGrenadeTimer)) && (te != world)))
				{
					te = find (te, classname, "timer");
				}
				if ((te != world))
				{
					SpawnBlood (org, 20);
					bprint (1, self.netname);
					bprint (1, " cured ");
					bprint (1, trace_ent.netname);
					bprint (1, "'s concussion\n");
					if ((te.team_no != self.team_no))
					{
						TF_AddFrags (self, 1, 0);
					}
					dremove (te);
				}
				if ((trace_ent.tfstate & TFSTATE_HALLUCINATING))
				{
					te = find (world, classname, "timer");
					while ((((te.owner != trace_ent) || (te.think != HallucinationTimer)) && (te != world)))
					{
						te = find (te, classname, "timer");
					}
					if ((te != world))
					{
						trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & TFSTATE_HALLUCINATING));
						SpawnBlood (org, 20);
						bprint (1, self.netname);
						bprint (1, " healed ");
						bprint (1, trace_ent.netname);
						bprint (1, " of his hallucinations\n");
						if ((te.team_no != self.team_no))
						{
							TF_AddFrags (self, 1, 0);
						}
						dremove (te);
					}
					else
					{
						dprint ("Warning: Error in Hallucination Timer logic.\n");
					}
				}
				if ((trace_ent.tfstate & TFSTATE_TRANQUILISED))
				{
					te = find (world, classname, "timer");
					while ((((te.owner != trace_ent) || (te.think != TranquiliserTimer)) && (te != world)))
					{
						te = find (te, classname, "timer");
					}
					if ((te != world))
					{
						trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & TFSTATE_TRANQUILISED));
						TeamFortress_SetSpeed (trace_ent);
						SpawnBlood (org, 20);
						bprint (1, self.netname);
						bprint (1, " healed ");
						bprint (1, trace_ent.netname);
						bprint (1, "'s tranquilisation\n");
						if ((te.team_no != self.team_no))
						{
							TF_AddFrags (self, 1, 0);
						}
						dremove (te);
					}
					else
					{
						dprint ("Warning: Error in Tranquilisation Timer logic.\n");
					}
				}
				if ((trace_ent.tfstate & TFSTATE_INFECTED))
				{
					healam = rint ((trace_ent.health / 2));
					trace_ent.tfstate = (trace_ent.tfstate - (trace_ent.tfstate & TFSTATE_INFECTED));
					deathmsg = 23;
					T_Damage (trace_ent, self, self, healam);
					SpawnBlood (org, 30);
					if ((self.classname == "player"))
					{
						bprint (1, self.netname);
						bprint (1, " cured ");
						bprint (1, trace_ent.netname);
						bprint (1, "'s infection\n");
						if ((trace_ent.infection_team_no != self.team_no))
						{
							TF_AddFrags (self, 1, 0);
						}
					}
					return;
				}
				if ((trace_ent.numflames > 0))
				{
					sound (trace_ent, 1, "items/r_item1.wav", 1, 1);
					trace_ent.numflames = 0;
					if ((self.classname == "player"))
					{
						bprint (1, self.netname);
						bprint (1, " put out ");
						bprint (1, trace_ent.netname);
						bprint (1, "'s fire.\n");
					}
					return;
				}
				if (((healam > 0) && (trace_ent.health < trace_ent.max_health)))
				{
					sound (trace_ent, 1, "items/r_item1.wav", 1, 1);
					trace_ent.axhitme = 1;
					SpawnBlood (org, 20);
					T_Heal (trace_ent, healam, 0);
				}
				else
				{
					if (((trace_ent.health >= trace_ent.max_health) && (trace_ent.health < (trace_ent.max_health + _2))))
					{
						healam = 5;
						if ((healam > (self.ammo_medikit * 5)))
						{
							healam = (self.ammo_medikit * 5);
						}
						if ((healam > 0))
						{
							sound (trace_ent, 3, "items/r_item2.wav", 1, 1);
							T_Heal (trace_ent, healam, 1);
							self.ammo_medikit = (self.ammo_medikit - rint ((healam / 5)));
							if (!(trace_ent.items & 65536))
							{
								trace_ent.items = (trace_ent.items | 65536);
								newmis = spawn ();
								newmis.nextthink = (time + 5);
								newmis.think = item_megahealth_rot;
								newmis.owner = trace_ent;
							}
						}
					}
				}
			}
			else if (vlen(dist) <= 64)
			{
				trace_ent.axhitme = 1;
				SpawnBlood (org, 20);
				deathmsg = 14;
				T_Damage (trace_ent, self, self, enter);
				if ((trace_ent.playerclass == PC_MEDIC))
				{
					return;
				}
				if (cb_prematch)
				{
					return;
				}
				if ((trace_ent.tfstate & 16))
				{
					return;
				}
				trace_ent.tfstate = (trace_ent.tfstate | TFSTATE_INFECTED);
				BioInfection = spawn ();
				BioInfection.classname = "timer";
				BioInfection.owner = trace_ent;
				BioInfection.nextthink = (time + 2);
				BioInfection.think = BioInfection_Decay;
				BioInfection.enemy = self;
				trace_ent.infection_team_no = self.team_no;
			}
		}
	}
	else
	{
		sound (self, 1, "player/axhit2.wav", 1, 1);
		WriteByte (4, 23);
		WriteByte (4, 2);
		WriteByte (4, 3);
		WriteCoord (4, org_x);
		WriteCoord (4, org_y);
		WriteCoord (4, org_z);
		multicast (org, 2);
	}
};


void () player_medikit1 = [ 119, player_medikit2 ]
{
	self.weaponframe = 1;
};

void () player_medikit2 = [ 120, player_medikit3 ]
{
	self.weaponframe = 2;
};

void () player_medikit3 = [ 121, player_medikit4 ]
{
	self.weaponframe = 3;
	W_FireMedikit ();
};

void () player_medikit4 = [ 122, player_run ]
{
	self.weaponframe = 4;
};

void () player_medikitb1 = [ 125, player_medikitb2 ]
{
	self.weaponframe = 5;
};

void () player_medikitb2 = [ 126, player_medikitb3 ]
{
	self.weaponframe = 6;
};

void () player_medikitb3 = [ 127, player_medikitb4 ]
{
	self.weaponframe = 7;
	W_FireMedikit ();
};

void () player_medikitb4 = [ 128, player_run ]
{
	self.weaponframe = 8;
};

void () player_medikitc1 = [ 131, player_medikitc2 ]
{
	self.weaponframe = 1;
};

void () player_medikitc2 = [ 132, player_medikitc3 ]
{
	self.weaponframe = 2;
};

void () player_medikitc3 = [ 133, player_medikitc4 ]
{
	self.weaponframe = 3;
	W_FireMedikit ();
};

void () player_medikitc4 = [ 134, player_run ]
{
	self.weaponframe = 4;
};

void () player_medikitd1 = [ 137, player_medikitd2 ]
{
	self.weaponframe = 5;
};

void () player_medikitd2 = [ 138, player_medikitd3 ]
{
	self.weaponframe = 6;
};

void () player_medikitd3 = [ 139, player_medikitd4 ]
{
	self.weaponframe = 7;
	W_FireMedikit ();
};

void () player_medikitd4 = [ 140, player_run ]
{
	self.weaponframe = 8;
};