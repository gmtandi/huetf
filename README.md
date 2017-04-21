# huetf

This project aims to improve OzTF 1.45 for the Brazilian QWTF Community - yes, we still play QWTF in 2017.

As the creator of the mod don't have source code for the OzTF 1.45 version, we had to decompile from original qwprogs.dat file.

For the next days probably we will gonna have many improvements mainly on clanmode, statistics, demo recording and parametrization on some features.

To compile this source you'll need to use fteqcc.

To run you must use MVDSV 0.30  with some modified built-in functions, or you can use the linux32 binary available in this repo.

The built-in functions required are:
 - calltimeofday = #102;
 - str2byte = #120;
 - str2short = #121;
 - newstr = #122;
 - freestr = #123;
 - locationname = #124


////

Some improvements already done to the code are:

 - Grenade timer on SBAR
 - Grenade timer sound  (client side: localinfo grensound 1);
 - 24 bits Skins support (server side: localinfo skins24b on);
 - Enable/disable flag return (server side: localinfo fnoreturn on); -- REMOVED, already exists on OzTF localinfo noreturn --
 - Sentry build on level 2 (skip lvl 1) -> (server side: localinfo sgbuildlvl2 on);
 - Sentry upgrade lvl 1 to 3 (skip lvl 2) -> (server side: localinfo sgnolvl2 on); // DO NOT USE sgb2 AND sgnl2, untested yet
 - Caltrop Canister wil only release when -gren1 (no more caltrop explosions);
 - Impact grenade replaces Caltrop for scout (localinfo impactgren 1);
 - Added adminmenu that allows admin to choose between few functions: kick, ban, clanmode, timelimit, captain;
 - Added "autospanner" (localinfo autospanner on), to make engineer's life easier by making a smart spanner to deal with his sentry gun;
 - .Loc file support: you just need to put your .loc in "fortress/locs" and the server will be able to decode coordinates into location names. Used in the improved "saveme";
 - Added "sniperpower" (localinfo sniperpower on), getting inspiration (...and some code) from Classic Fortress: Snipers have one shot per clip, added a meter to the SBAR to view the rifle power;
 - Headshot mechanics: We felt it was fair to increase the damage done by these weapons as the damage-per-projectile was fairly low. All of them have travel time, making it harder to hit properly, so we thought we could reward the headshots. A headshot does 50% more damage than a bodyshot (which remains the same!). Currently it works for:

 	1 - Scout's NailGun (projectile speed increased by 33%)

 	2 - Medic's Super Nailgun (projectile speed increased by 33%)

 	3 - Spy's Tranquilizer (no speed increase)

 	4 - Engineer's Railgun (projectile speed increased by 33%)

 	Toggle headshots: localinfo headshots on/off


