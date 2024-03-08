playerID = other.playerID

instance_destroy();

if global.ammo[global.currentWeapon[playerID]][playerID] < 28
{
    global.frozen = true;
    with objHealthWeaponBar
    {
		playerID = other.playerID;
        increaseAmmo = true;
        increaseAmmoAmount = other.hlth;
    }
    
    sound_stop(sfxEnergyRestore);
    sound_loop(sfxEnergyRestore);
}

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

