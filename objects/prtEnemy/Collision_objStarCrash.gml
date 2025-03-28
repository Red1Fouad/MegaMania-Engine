if reflectProjectiles == false && damageStarCrash != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
	playerID = other.playerID;
    if dead == false
    {
        if canHit == true
        {
            healthpoints -= damageStarCrash;
            visible = false;
        }
        alarm[11] = 2;
        with other instance_destroy();
        
        if other.xspeed == 0 //When it is not yet fired
        {
            global.ammo[global.currentWeapon[global.playerID]][global.playerID] -= global.weaponAmmoContact[global.weaponSlot[global.currentWeapon[global.playerID]]];
            if global.ammo[global.currentWeapon[global.playerID]][global.playerID] <= 0
                global.ammo[global.currentWeapon[global.playerID]][global.playerID] = 0;
        }
        
        playSFX(sfxEnemyHit);
        
        if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
        {
            event_user(1);
        }
    }
}
else
{
    if dead == false
        event_user(0); //Reflect the projectiles
}

