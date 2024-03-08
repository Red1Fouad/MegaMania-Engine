event_inherited();
for (var m = 0; m < instance_number(objMegaman); m++) {
	var megaman = instance_find(objMegaman, m);
	if (megaman.playerID == playerID) {
		if global.frozen == false
		{   
		    if sprite_index == sprRushJet
		    {
		        if canJet == true //Waiting for Megaman
		        {
		            if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, megaman, false, false) >= 0)
		            {
		                var instance = instance_place(bbox_left, bbox_top, megaman);
		                if (instance != noone && instance.playerID == playerID && instance.ground == true && instance.bbox_bottom <= bbox_top && global.yspeed[playerID] >= 0)
		                {
		                    canJet = false;
		                    alarm[0] = -1;
		                }
		            }
		        }
		        else //Flying
		        {
		            xspeed = spd * image_xscale;
            
		            //Take away ammo
		            decreaseAmmoTimer += 1;
		            if decreaseAmmoTimer >= decreaseAmmoTimerMax
		            {
		                decreaseAmmoTimer = 0;
		                global.ammo[global.currentWeapon[playerID]][playerID] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon[playerID]]];
		                if global.ammo[global.currentWeapon[playerID]][playerID] <= 0
		                {
		                    global.ammo[global.currentWeapon[playerID]][playerID] = 0;
		                    event_perform(ev_alarm, 0);
		                }
		            }
            
		            if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, megaman, false, false) >= 0)
		            {               
		                var instance = instance_place(bbox_left, bbox_top, megaman);
		                if (instance != noone && instance.playerID == playerID && instance.ground == true && instance.bbox_bottom <= bbox_top && global.yspeed[playerID] >= 0)
		                {
		                    //Set player properties
		                    instance.canMove = false;
		                    global.xspeed[playerID] = 0;
		                    instance.onRushJet = true;
                    
		                    //Move vertically
		                    if (keyUp && !place_meeting(instance.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, objSolid) && !place_meeting(x, y-abs(yspeed)-1, objSolid))
		                    {
		                        if (!place_meeting(instance.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid) && !place_meeting(x, y-abs(yspeed)-1, prtMovingPlatformSolid))
		                            yspeed = -ySpd;
		                        else if (place_meeting(instance.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid))
		                        {
		                            if (instance_place(instance.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid).dead == true)
		                                yspeed = -ySpd;
		                            else
		                                yspeed = 0;
		                        }
		                        else
		                        {
		                            var instance_found = instance_place(x, y - sprite_get_height(mskMegaman) - abs(yspeed) - 1, prtMovingPlatformSolid);
		                            if (instance_found != noone && instance_found.dead == true)
		                                yspeed = -ySpd;
		                            else
		                                yspeed = 0;
		                        }
		                    }
		                    else if (keyDown && !place_meeting(x, y+abs(yspeed)+1, objSolid) && !place_meeting(x, y+abs(yspeed)+1, objTopSolid))
		                    {
		                        if (!place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid) && !place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformJumpthrough))
		                            yspeed = ySpd;
		                        else if (place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid))
		                        {
		                            if (instance_place(x, y+abs(yspeed)+1, prtMovingPlatformSolid).dead == true)
		                                yspeed = ySpd;
		                            else
		                                yspeed = 0;
		                        }
		                        else
		                        {
		                            if (instance_place(x, y+abs(yspeed)+1, prtMovingPlatformJumpthrough).dead == true)
		                                yspeed = ySpd;
		                            else
		                                yspeed = 0;
		                        }
		                    }
		                    else
		                        yspeed = 0;
		                }
		            }
		            else
		            {
		                with megaman
		                {
		                    if (onRushJet == true)
		                    {
		                        onRushJet = false;
		                        canMove = true;
		                    }
		                }
                
		                yspeed = 0;
		            }
		        }
        
		        if (place_meeting(x, y, objSolid))
		        {
		            event_perform(ev_alarm, 0);
		        }
		        else if (place_meeting(x, y, prtMovingPlatformSolid))
		        {
		            var platform_instance = instance_place(x, y, prtMovingPlatformSolid);
		            if (platform_instance != noone && platform_instance.dead == false)
		                event_perform(ev_alarm, 0);
		        }
        
		        image_speed = 0.25;
		    }
		}
		else
		{
		    image_speed = 0;
		    if (alarm[0] != -1)
		        alarm[0] += 1;
		}
	}
}
