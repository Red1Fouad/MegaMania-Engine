if reflectProjectiles == false && damageBuster != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
	playerID = other.playerID;
    if dead == false
    {
        if canHit == true
        {
            healthpoints -= damageBuster;
            visible = false;
        }
        
        alarm[11] = 2;
        with other instance_destroy();
        
        sound_stop(sfxBuster);
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

