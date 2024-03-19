if instance_number(objMegaman) > 1
{
	for (var m = 0; m < instance_number(objMegaman); m++) {
		var megaman = instance_find(objMegaman, m);
		if (megaman.playerID == playerID) {
			if canOpen == true
			{
			    if instance_exists(megaman)
			    {
			        //Colliding with the player. We're checking x+7 because in the NES games, the player needs to be slightly inside the door
			        //for it to activate.
			        if (collision_rectangle(x, y+7, x+sprite_width, y+7, megaman, false, false) && dir == -1)
					|| (collision_rectangle(x, y+sprite_height-7, x+sprite_width, y+sprite_height-7, megaman, false, false) && dir == 1)
			        {
			            canOpen = false;
			            opening = true;
			            image_speed = openImgSpeed;
			            playSFX(sfxDoor);
			            with mySolid instance_destroy();
            
			            //Switch sections
			            if dir == -1 //Switch to the bottom
			            {
			                with megaman
			                {
			                    instance_activate_object(objSectionBorderLeft);
			                    instance_activate_object(objSectionBorderRight);
			                    instance_activate_object(objSectionBorderTop);
			                    instance_activate_object(objSectionBorderBottom);
			                    instance_activate_object(objSectionArrowLeft);
			                    instance_activate_object(objSectionArrowRight);
			                    instance_activate_object(objSectionArrowUp);
			                    instance_activate_object(objSectionArrowDown);
			                    newSectionXOffset = 0;
			                    newSectionYOffset = 64;
                    
			                    alarm[2] = 1;
			                }
			            }
			            else //Switch to the top
			            {
			                with megaman
			                {
			                    instance_activate_object(objSectionBorderLeft);
			                    instance_activate_object(objSectionBorderRight);
			                    instance_activate_object(objSectionBorderTop);
			                    instance_activate_object(objSectionBorderBottom);
			                    instance_activate_object(objSectionArrowLeft);
			                    instance_activate_object(objSectionArrowRight);
			                    instance_activate_object(objSectionArrowUp);
			                    instance_activate_object(objSectionArrowDown);
			                    newSectionXOffset = 0;
			                    newSectionYOffset = -64;
                    
			                    alarm[2] = 1;
			                }
			            }
			        }
			    }
			}


			if opening == true
			{
			    if floor(image_index) == 4
			    {
			        image_index = 4;
			        image_speed = 0;
			    }
			}

			if closing == true
			{
			    image_speed = openImgSpeed;
			    if floor(image_index) == 8
			    {
			        image_index = 8;
        
			        if dir == -1
			        {
			            mySolid = instance_create(x, y+16, objSolid);
			                mySolid.image_xscale = 4;
			        }
			        else
			        {
			            mySolid = instance_create(x, y, objSolid);
			                mySolid.image_xscale = 4;
			        }
            
			        with objSectionSwitcher
			        {
			            global.frozen = false;
			            objMegaman.visible = true;
			            instance_destroy();
			            with megaman playerDeactivateObjects();
			        }
        
			        closing = false;
			        image_speed = 0;
			    }
			}
		}
	}
}
else
{
	if canOpen == true
	{
		if instance_exists(objMegaman)
		{
			//Colliding with the player. We're checking x+7 because in the NES games, the player needs to be slightly inside the door
			//for it to activate.
			if (collision_rectangle(x, y+7, x+sprite_width, y+7, objMegaman, false, false) && dir == -1)
			|| (collision_rectangle(x, y+sprite_height-7, x+sprite_width, y+sprite_height-7, objMegaman, false, false) && dir == 1)
			{
				canOpen = false;
				opening = true;
				image_speed = openImgSpeed;
				playSFX(sfxDoor);
				with mySolid instance_destroy();
            
				//Switch sections
				if dir == -1 //Switch to the bottom
				{
				    with objMegaman
				    {
				        instance_activate_object(objSectionBorderLeft);
				        instance_activate_object(objSectionBorderRight);
				        instance_activate_object(objSectionBorderTop);
				        instance_activate_object(objSectionBorderBottom);
				        instance_activate_object(objSectionArrowLeft);
				        instance_activate_object(objSectionArrowRight);
				        instance_activate_object(objSectionArrowUp);
				        instance_activate_object(objSectionArrowDown);
				        newSectionXOffset = 0;
				        newSectionYOffset = 64;
                    
				        alarm[2] = 1;
				    }
				}
				else //Switch to the top
				{
				    with objMegaman
				    {
				        instance_activate_object(objSectionBorderLeft);
				        instance_activate_object(objSectionBorderRight);
				        instance_activate_object(objSectionBorderTop);
				        instance_activate_object(objSectionBorderBottom);
				        instance_activate_object(objSectionArrowLeft);
				        instance_activate_object(objSectionArrowRight);
				        instance_activate_object(objSectionArrowUp);
				        instance_activate_object(objSectionArrowDown);
				        newSectionXOffset = 0;
				        newSectionYOffset = -64;
                    
				        alarm[2] = 1;
				    }
				}
			}
		}
	}


	if opening == true
	{
		if floor(image_index) == 4
		{
			image_index = 4;
			image_speed = 0;
		}
	}

	if closing == true
	{
		image_speed = openImgSpeed;
		if floor(image_index) == 8
		{
			image_index = 8;
        
			if dir == -1
			{
				mySolid = instance_create(x, y+16, objSolid);
				    mySolid.image_xscale = 4;
			}
			else
			{
				mySolid = instance_create(x, y, objSolid);
				    mySolid.image_xscale = 4;
			}
            
			with objSectionSwitcher
			{
				global.frozen = false;
				objMegaman.visible = true;
				instance_destroy();
				with objMegaman playerDeactivateObjects();
			}
        
			closing = false;
			image_speed = 0;
		}
	}
}