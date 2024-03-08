if instance_exists(objMegaman)
{
    x = objMegaman.x;
    y = objMegaman.y;
}

if increaseHealth == true
{
    if increaseHealthAmount > 0 && global._health[playerID] < 28
    {
        increaseTimer += 1;
        if increaseTimer >= 3
        {
            global._health[playerID] += 1;
            increaseHealthAmount -= 1;
            increaseTimer = 0;
        }
    }
    else
    {
        increaseHealth = false;
        if global._health[playerID] > 28
            global._health[playerID] = 28;
        global.frozen = false;
        increaseTimer = 0;
        sound_stop(sfxEnergyRestore);
    }
}
else if increaseAmmo == true
{
    if increaseAmmoAmount > 0 && global.ammo[global.currentWeapon[playerID]][playerID] < 28
    {
        increaseTimer += 1;
        if increaseTimer >= 3
        {
            global.ammo[global.currentWeapon[playerID]][playerID] += 1;
            increaseAmmoAmount -= 1;
            increaseTimer = 0;
        }
    }
    else
    {
        increaseAmmo = false;
        if global.ammo[global.currentWeapon[playerID]][playerID] > 28
            global.ammo[global.currentWeapon[playerID]][playerID] = 28;
        global.frozen = false;
        increaseTimer = 0;
        sound_stop(sfxEnergyRestore);
    }
}

