with other instance_destroy();
instance_destroy();

if other.xspeed == 0 //When it is not yet fired
{
	with other
	{
	    global.ammo[global.currentWeapon[playerID]][playerID] -= global.weaponAmmoContact[global.weaponSlot[global.currentWeapon[playerID]]];
	    if global.ammo[global.currentWeapon[playerID]][playerID] <= 0
	        global.ammo[global.currentWeapon[playerID]][playerID] = 0;
	}
}

