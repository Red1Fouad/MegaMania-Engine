if global.frozen == false
{
    if sprite_index == sprRush || sprite_index == sprRushCoil
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
    }
    else
    {
        yspeed = 0;
    }
    
    if sprite_index == sprRush
        image_speed = 7/60;
    
    if canCoil == true
    {
        if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + 1, objMegaman, false, false) >= 0)
        {
            var instance = instance_place(bbox_left, bbox_top, objMegaman);
            if (instance != noone && instance.playerID == playerID &&
                global.yspeed[playerID] > 0 && instance.bbox_bottom <= bbox_top+global.yspeed[playerID] &&
                instance.climbing == false)
            {
                global.yspeed[playerID] = -7;
                instance.canMinJump = false;
                sprite_index = sprRushCoil;
                canCoil = false;
                alarm[0] = 60;
                
                global.ammo[global.currentWeapon[playerID]][playerID] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon[playerID]]];
                if global.ammo[global.currentWeapon[playerID]][playerID] <= 0
                    global.ammo[global.currentWeapon[playerID]][playerID] = 0;
            }
        }
    }
    
    if (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) >= 0 && sprite_index == sprRush)
    {
        event_perform(ev_alarm, 0);
    }
    
    y += yspeed;
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}
