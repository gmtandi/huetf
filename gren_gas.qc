//=-=-=-=-= Local Functions
void () GasGrenadeTouch;
void () GasGrenadeExplode;
void () GasGrenadeMakeGas;
//=-=-=-=-=

void () GasGrenadeTouch =
{
	sound (self, 1, "weapons/bounce.wav", 1, 1);
	if ((self.velocity == '0 0 0'))
	{
		self.avelocity = '0 0 0';
	}
};

void () GasGrenadeExplode =
{
	local vector tmpv;
	local entity te;
	local float pos;

	pos = pointcontents (self.origin);
	if ((pos == -1))
	{
		te = spawn ();
		te.think = GasGrenadeMakeGas;
		te.nextthink = (time + 0.1);
		te.classname = "grentimer";
		te.heat = 0;
		te.origin = self.origin;
		te.owner = self.owner;
		te.team_no = self.owner.team_no;
		te.weapon = 0;
		te.enemy = self;
	}
	else
	{
		pos = 0;
		while ((pos < enter))
		{
			newmis = spawn ();
			setmodel (newmis, "progs/s_bubble.spr");
			setorigin (newmis, self.origin);
			newmis.movetype = 8;
			newmis.solid = 0;
			newmis.velocity = '0 0 15';
			newmis.velocity_z = (enter + (random () * 20));
			newmis.nextthink = (time + 0.5);
			newmis.think = bubble_bob;
			newmis.classname = "bubble";
			newmis.frame = 0;
			newmis.cnt = 0;
			setsize (newmis, '-8 -8 -8', '8 8 8');
			pos = (pos + 1);
		}
	}
	dremove (self);
};

void () GasGrenadeMakeGas =
{
	local entity te;
	local entity timer;
	local float max_heat;
	local float dam_mult;

	if (shortergrens) {
		max_heat = 10;
	} 
	else {
		max_heat = 20;
	}

	if ((self.heat == 0))
	{
		self.owner.no_active_gas_grens = (self.owner.no_active_gas_grens + 1);
		if ((self.owner.no_active_gas_grens > 1))
		{
			te = find (world, classname, "grentimer");
			while ((te != world))
			{
				if (((te.owner == self.owner) && (te.no_active_gas_grens == 1)))
				{
					te.weapon = 24;
					te.think = RemoveGrenade;
					te.nextthink = (time + 0.1);
				}
				te = find (te, classname, "grentimer");
			}
		}
		self.no_active_gas_grens = self.owner.no_active_gas_grens;
	}
	self.nextthink = (time + 0.75);
	te = findradius (self.origin, 200);
	while ((te != world))
	{
		if ((((te.classname == "player") && (te.deadflag == 0)) && (te.has_disconnected != 1)))
		{
			deathmsg = 24;
			dam_mult = 1;
			if (shortergrens)
				dam_mult = 1.33;

			TF_T_Damage (te, world, self.owner, enter * dam_mult, (1 | 2), 0);
			if ((te.tfstate & TFSTATE_HALLUCINATING))
			{
				timer = find (world, classname, "timer");
				while ((((timer.owner != te) || (timer.think != HallucinationTimer)) && (timer != world)))
				{
					timer = find (timer, classname, "timer");
				}
				if ((timer != world))
				{
					timer.health = (timer.health + 25);
					if ((timer.health < 150))
					{
						timer.health = 150;
					}
				}
			}
			else
			{
				sprint (te, 2, "Run for cover! They're everywhere!\n");
				te.tfstate = (te.tfstate | TFSTATE_HALLUCINATING);
				timer = spawn ();
				timer.nextthink = (time + 0.3);
				timer.think = HallucinationTimer;
				timer.classname = "timer";
				timer.owner = te;
				timer.health = 150;
				timer.team_no = self.team_no;
			}
		}
		te = te.chain;
	}
	self.heat = (self.heat + 1);
	if ((self.heat == 1))
	{
		WriteByte (4, 23);
		WriteByte (4, 4);
		WriteCoord (4, self.origin_x);
		WriteCoord (4, self.origin_y);
		WriteCoord (4, self.origin_z);
		multicast (self.origin, 2);
		return;
	}
	if ((self.heat <= max_heat))
	{
		self.weapon = (self.weapon + 1);
		if ((self.weapon == 1))
		{
			WriteByte (4, 23);
			WriteByte (4, enter);
			WriteCoord (4, self.origin_x);
			WriteCoord (4, self.origin_y);
			WriteCoord (4, (self.origin_z - 24));
			multicast (self.origin, 2);
		}
		else
		{
			if ((self.weapon == 2))
			{
				self.weapon = 0;
			}
		}
		return;
	}
	RemoveGrenade ();
};

void () HallucinationTimer =
{
	local entity te;
	local float tmpx;
	local float tmpy;
	local float halltype;
	local float halltype2;
	local string st;

	self.health = (self.health - 3);
	if ((self.owner.playerclass == PC_MEDIC))
	{
		self.health = (self.health - 2);
	}
	if ((((self.health <= 0) || (self.owner.deadflag != 0)) || (self.owner.has_disconnected == 1)))
	{
		self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_HALLUCINATING));
	}
	if (((self.owner.deadflag != 0) || (self.owner.has_disconnected == 1)))
	{
		dremove (self);
		return;
	}
	if (!(self.owner.tfstate & TFSTATE_HALLUCINATING))
	{
		sprint (self.owner, 2, "You feel a little better now.\n");
		dremove (self);
		return;
	}
	self.nextthink = (time + 0.3);
	if ((random () < 0.5))
	{
		KickPlayer (-10, self.owner);
	}
	tmpx = ((random () * 800) - 400);
	tmpy = ((random () * 800) - 400);
	halltype = random ();
	halltype2 = random ();
	msg_entity = self.owner;
	if ((halltype < 0.4))
	{
		WriteByte (1, 23);
		if ((halltype < 0.25))
		{
			WriteByte (1, 3);
		}
		else
		{
			if ((halltype < 0.35))
			{
				WriteByte (1, 4);
			}
			else
			{
				WriteByte (1, enter);
			}
		}
		WriteCoord (1, (msg_entity.origin_x + tmpx));
		WriteCoord (1, (msg_entity.origin_y + tmpy));
		WriteCoord (1, msg_entity.origin_z);
		T_Damage (self.owner, self.owner, self.owner, 0);
	}
	else
	{
		if (halltype < 0.7)
		{
			WriteByte (1, 23);
			WriteByte (1, 11);
			WriteCoord (1, (msg_entity.origin_x + tmpx));
			WriteCoord (1, (msg_entity.origin_y + tmpy));
			WriteCoord (1, msg_entity.origin_z);
			if (halltype2 < 0.1)
				stuffcmd (self.owner, "play weapons/r_exp3.wav\n");
			else if (halltype2 < 0.15)
				stuffcmd (self.owner, "play weapons/rocket1i.wav\n");
			else if (halltype2 < 0.2)
				stuffcmd (self.owner, "play weapons/sgun1.wav\n");
			else if (halltype2 < 0.25)
				stuffcmd (self.owner, "play weapons/guncock.wav\n");
			else if (halltype2 < 0.3)
				stuffcmd (self.owner, "play weapons/ric1.wav\n");
			else if (halltype2 < 0.35)
				stuffcmd (self.owner, "play weapons/ric2.wav\n");
			else if (halltype2 < 0.4)
				stuffcmd (self.owner, "play weapons/ric3.wav\n");
			else if (halltype2 < 0.45)
				stuffcmd (self.owner, "play weapons/spike2.wav\n");
			else if (halltype2 < 0.5)
				stuffcmd (self.owner, "play weapons/tink1.wav\n");
			else if (halltype2 < 0.55)
			{
				CenterPrint2 (self.owner, "\n\n\n", "Your team ÃÁÐÔÕÒÅÄ the flag!!");
				stuffcmd (self.owner, "play weapons/grenade.wav\n");
			}
			else if (halltype2 < 0.6)
				stuffcmd (self.owner, "play weapons/bounce.wav\n");
			else if (halltype2 < 0.65)
				stuffcmd (self.owner, "play weapons/shotgn2.wav\n");
			else if (halltype2 < 0.7)
				stuffcmd (self.owner, "play wizard/wattack.wav\n");
			else if (halltype2 < 0.75)
				stuffcmd (self.owner, "play items/r_item1.wav\n");
			else if (halltype2 < 0.8)
				stuffcmd (self.owner, "play items/r_item2.wav\n");
			else if (halltype2 < 0.85)
			{
				CenterPrint (self.owner, "You are on fire!\n");
				stuffcmd (self.owner, "play weapons/lhit.wav\n");
			}
			else if (halltype2 < 0.9)
				stuffcmd (self.owner, "play misc/r_tele1.wav\n");
			else
				stuffcmd (self.owner, "play weapons/railgun.wav\n");
		}
		else
		{
			te = spawn ();
			te.origin_x = (msg_entity.origin_x + tmpx);
			te.origin_y = (msg_entity.origin_y + tmpy);
			te.origin_z = msg_entity.origin_z;
			WriteByte (1, 23);
			WriteByte (1, 6);
			WriteEntity (1, te);
			WriteCoord (1, te.origin_x);
			WriteCoord (1, te.origin_y);
			WriteCoord (1, te.origin_z);
			tmpx = ((random () * 800) - 400);
			tmpy = ((random () * 800) - 400);
			WriteCoord (1, (msg_entity.origin_x + tmpx));
			WriteCoord (1, (msg_entity.origin_y + tmpy));
			WriteCoord (1, msg_entity.origin_z);
			if (halltype2 < 0.1)
				stuffcmd (self.owner, "play weapons/detpack.wav\n");
			else if (halltype2 < 0.2)
				stuffcmd (self.owner, "play weapons/turrset.wav\n");
			else if (halltype2 < 0.3)
				stuffcmd (self.owner, "play weapons/turrspot.wav\n");
			else if (halltype2 < 0.4)
				stuffcmd (self.owner, "play weapons/turridle.wav\n");
			else if (halltype2 < 0.5)
				stuffcmd (self.owner, "play weapons/sniper.wav\n");
			else if (halltype2 < 0.6)
			{
				CenterPrint2 (self.owner, "\n\n\n", "Your flag has been ÔÁËÅÎ!!");
				stuffcmd (self.owner, "play weapons/flmfire2.wav\n");
			}
			else if (halltype2 < 0.7)
				stuffcmd (self.owner, "play weapons/flmgrexp.wav\n");
			else if (halltype2 < 0.8)
				stuffcmd (self.owner, "play misc/vapeur2.wav\n");
			else if (halltype2 < 0.9)
				stuffcmd (self.owner, "play weapons/asscan1.wav\n");
			else
				stuffcmd (self.owner, "play weapons/asscan2.wav\n");
		}
		if ((te != world))
		{
			dremove (te);
		}
	}
};