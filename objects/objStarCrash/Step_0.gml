for (var m = 0; m < instance_number(objMegaman); m++) {
	var megaman = instance_find(objMegaman, m);
	if (megaman.playerID == playerID) {
		if global.frozen == false
		{
		    image_speed = 0.35;
    
		    //The init state, where the Star Crash grows until the normal size is reached
		    //The mask is still the same as the normal size, however, to make things more fair
		    //The sprite during this state is sprStarCrashInit
		    endInitTimer += 1;
		    if endInitTimer == floor((1/image_speed) * sprite_get_number(sprStarCrashInit))
		    {
		        sprite_index = sprStarCrash;
		        image_index = 0;
		    }
    
		    //Sticking to the player until fired or destroyed in any way
		    if followPlayer == true
		    {
		        if instance_exists(megaman) && megaman.playerID == playerID
		        {
		            x = sprite_get_xcenter_object(megaman);
		            y = sprite_get_ycenter_object(megaman);
		        }
		        else
		        {
		            instance_destroy();
		        }
        
		        if keyShootPressed && endInitTimer >= 8 //Do not shoot the weapon until the init state is over
		        {
		            var dir; //1 = firing to the right, -1 = firing to the left
		            if instance_exists(megaman)
		                dir = megaman.image_xscale;
		            else
		                dir = 1;
                
		            followPlayer = false;
		            xspeed = dir * spd;
            
		            global.ammo[global.currentWeapon[playerID]][playerID] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon[playerID]]];
		            if global.ammo[global.currentWeapon[playerID]][playerID] <= 0
		                global.ammo[global.currentWeapon[playerID]][playerID] = 0;
		        }
		    }
    
		    x += xspeed;
		    y += yspeed;
		}
		else
		{
		    image_speed = 0;
		}
	}
}
