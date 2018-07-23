//=-=-=-=-= Local Functions
void (vector p1, vector p2, entity from, float damage) LightningDamage;
void (entity from, float damage) LightningHit;
//=-=-=-=-=

void (vector p1, vector p2, entity from, float damage) LightningDamage =
{
	local entity e1;
	local entity e2;
	local vector f;

	f = (p2 - p1);
	normalize (f);
	f_x = (0 - f_y);
	f_y = f_x;
	f_z = 0;
	f = (f * 16);
	e2 = world;
	e1 = world;
	traceline (p1, p2, 0, self);
	if (trace_ent.takedamage)
	{
		LightningHit (from, damage);
		if ((self.classname == "player"))
		{
			if ((other.classname == "player"))
			{
				trace_ent.velocity_z = (trace_ent.velocity_z + 400);
			}
		}
	}
	e1 = trace_ent;
	traceline ((p1 + f), (p2 + f), 0, self);
	if (((trace_ent != e1) && trace_ent.takedamage))
	{
		LightningHit (from, damage);
	}
	e2 = trace_ent;
	traceline ((p1 - f), (p2 - f), 0, self);
	if ((((trace_ent != e1) && (trace_ent != e2)) && trace_ent.takedamage))
	{
		LightningHit (from, damage);
	}
};

void (entity from, float damage) LightningHit =
{
	WriteByte (4, 23);
	WriteByte (4, 13);
	WriteCoord (4, trace_endpos_x);
	WriteCoord (4, trace_endpos_y);
	WriteCoord (4, trace_endpos_z);
	multicast (trace_endpos, 2);
	deathmsg = 7;
	TF_T_Damage (trace_ent, from, from, damage, 2, 8);
};