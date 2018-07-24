//@import - player.qc
void () player_rocket1;

//@import - weapons.qc
void (float att_delay) Attack_Finished;

//=-=-=-=-= Local Functions
void () TeamFortress_Tribolt;
void () W_FireTriBolt;
void () Tribolt_Think;
void () W_TriboltBullet;
void () TriboltTouch 
void () TriboltExplode;
float () W_Check_Reload_Tribolt;
void () W_Reload_Tribolt_Start;
void () W_Reload_Tribolt_Finish;
//=-=-=-=-=

void () TeamFortress_Tribolt = {
	SUB_ResetWeaponFunctions();
	
	self.needsReload = 1;
	self.CheckForReloadFunction = W_Check_Reload_Tribolt;
	self.ReloadStartFunction    = W_Reload_Tribolt_Start;
	self.ReloadEndFunction 	    = W_Reload_Tribolt_Finish;	

	self.currentammo = self.ammo_rockets;
	if (!(self.tfstate & TFSTATE_RELOADING))
	{
		self.weaponmodel = "progs/v_rock.mdl";
		self.weaponframe = 0;
	}
	self.weapon = 16;
	self.items = (self.items | 1024);
};

void () W_FireTriBolt =
{
	local entity work;

	W_TriboltBullet();
	work = spawn();
   	work.think = Tribolt_Think;
   	work.owner = self;
   	work.cnt = 0;
   	work.nextthink = time +0.15;
};

void () Tribolt_Think =
{
   
   self.cnt = self.cnt + 1;
   if (self.cnt < 3 && self.owner.health > 0) {
   	self.nextthink = time + 0.15;
   }
   else {
   	dremove (self);
   	return;
   }
   self = self.owner;
   W_TriboltBullet();

};

void () W_TriboltBullet = {	
	if (self.ammo_rockets < 1)
		return;
	if (!practice)
	{
		self.ammo_rockets = (self.ammo_rockets - 1);
		self.currentammo = self.ammo_rockets;
	}
	player_rocket1 ();
	sound (self, 1, "weapons/grenade.wav", 1, 1);
	KickPlayer (-2, self);
	newmis = spawn ();
	newmis.voided = 0;
	newmis.owner = self;
	newmis.movetype = enter;
	newmis.solid = 2;
	newmis.weapon = 5;
	newmis.classname = "bolt";
	newmis.skin = 1;
	newmis.touch = TriboltTouch;
	newmis.nextthink = (time + 0.6);	

	makevectors (self.v_angle);
	if (self.v_angle_x)
	{
		newmis.velocity = ((((v_forward * 1000) + (v_up * 200)) + ((crandom () * v_right) * enter)) + ((crandom () * v_up) * enter));
	}
	else
	{
		newmis.velocity = aim (self, 10000);
		newmis.velocity = (newmis.velocity * 1000);
		newmis.velocity_z = 200;
	}
	newmis.avelocity = '300 300 300';
	newmis.angles = vectoangles (newmis.velocity);
	newmis.think = TriboltExplode;
	setmodel (newmis, "progs/hook.mdl");
	setsize (newmis, '0 0 0', '0 0 0');
	setorigin (newmis, self.origin);
};

void () TriboltTouch =
{
	if ((other == self.owner))
	{
		return;
	}
	if ((other == world) || (other.takedamage != 2))
	{
		self.movetype = 0;
		self.velocity = '0 0 0';
		//self.nextthink = time + 0.6;
		self.think = TriboltExplode;
	}
	else {
		TriboltExplode();
	}
	
	return;
};

void () TriboltExplode = {
	local float damage = 40
	local entity te;

	if (self.voided)
	{
		return;
	}
	self.voided = 1;
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
			if ((te.owner == self.owner) && (te.no_active_nail_grens > 0))
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

float () W_Check_Reload_Tribolt = 
{
	local float rt;
	local entity tWeapon;
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
		tWeapon.think = W_Reload_Tribolt_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
		return (1);
	}
};

void () W_Reload_Tribolt_Start =
{
	local float rt;
	local entity tWeapon;

	if ((self.ammo_rockets == 0))
	{
		sprint (self, 2, "out of bolts.\n");
		return;
	}
	if ((self.reload_tribolt == 0))
	{
		sprint (self, 2, "clip full.\n");
		return;
	}
	if (((12 - self.reload_tribolt) == self.ammo_rockets))
	{
		sprint (self, 2, "all bolts are in the clip.\n");
		return;
	}
	if ((self.reload_tribolt < self.ammo_rockets))
	{
		Attack_Finished (1.7);
		rt = ((12 - self.reload_tribolt) / 12);
		rt = (5 - (5 * rt));
		self.reload_tribolt = 0;
		if ((self.ammo_rockets < 6))
		{
			self.reload_tribolt = (12 - self.ammo_rockets);
		}
		sprint (self, 2, "reloading...\n");
		self.tfstate = (self.tfstate | TFSTATE_RELOADING);
		tWeapon = spawn ();
		tWeapon.owner = self;
		tWeapon.classname = "timer";
		tWeapon.nextthink = (time + rt);
		tWeapon.think = W_Reload_Tribolt_Finish;
		self.weaponmodel = "";
		self.weaponframe = 0;
	}
	else
	{
		sprint (self, 2, "not enough ammo to reload\n");
	}
};

void () W_Reload_Tribolt_Finish =
{
	self.owner.tfstate = (self.owner.tfstate - (self.owner.tfstate & TFSTATE_RELOADING));
	self.owner.weaponmodel = "progs/v_rock.mdl";
	sprint (self.owner, 2, "finished reloading\n");
	dremove (self);
	self.owner.StatusRefreshTime = (time + 0.1);
};