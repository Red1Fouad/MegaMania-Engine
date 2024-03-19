//Moving the screen and player (or rather, both the player and the clone of the player. See create event for more information on that)
if instance_number(objMegaman) == 2
{
	for (var m = 0; m < instance_number(objMegaman); m++) {
		var megaman = instance_find(objMegaman, m);
		if (megaman.playerID == playerID) {
			character = megaman.character;
			primary_color = megaman.primary_color;
			secondary_color = megaman.primary_color;
			outline_color = megaman.primary_color;
			with objMegaman visible = false;
		    sprite_index = megaman.sprite_index;
		    image_index = megaman.image_index;
		    imgSpd = megaman.image_speed;
		    image_speed = imgSpd;
		    image_xscale = megaman.image_xscale;
			if canStep == true && playerSpeedHorDoor != 0 //When the door is closing, we should not move
			{
			    if !(door == true && canProgressDoor == false)
			    {
			        //Right
			        if dir == "right"
			        {
			            global.viewX += screenSpeedHor;
            
			            if door == false
			            {
			                x += playerSpeedHor;
			                objMegaman.x += playerSpeedHor;
			            }
			            else
			            {
			                x += playerSpeedHorDoor;
			                objMegaman.x += playerSpeedHorDoor;
			            }
            
			            if global.viewX >= objMegaman.sectionLeft
			            {
			                global.viewX = objMegaman.sectionLeft;
                
			                if door == false
			                {
			                    global.frozen = false;
			                    objMegaman.visible = true;
			                    instance_destroy();
			                    with megaman playerDeactivateObjects();
			                }
			                else
			                {
			                    var bossdr;
			                    bossdr = instance_place(objMegaman.sectionLeft, y, objBossDoor);
			                    if bossdr >= 0
			                    {
									bossdr.playerID = playerID;
			                        bossdr.opening = false;
			                        bossdr.closing = true;
			                        image_speed = 0;
			                        playSFX(sfxDoor);
                        
			                        playerSpeedHorDoor = 0;
			                    }
			                    else
			                    {
			                        global.frozen = false;
			                        objMegaman.visible = true;
			                        instance_destroy();
			                        with megaman playerDeactivateObjects();
			                    }
			                }
			            }
			        }
        
			        //Left
			        else if dir == "left"
			        {
			            global.viewX -= screenSpeedHor;
            
			            if door == false
			            {
			                x -= playerSpeedHor;
			                objMegaman.x -= playerSpeedHor;
			            }
			            else
			            {
			                x -= playerSpeedHorDoor;
			                objMegaman.x -= playerSpeedHorDoor;
			            }
            
			            if global.viewX <= objMegaman.sectionRight-global.viewWidth
			            {
			                global.viewX = objMegaman.sectionRight-global.viewWidth;
                
			                if door == false
			                {
			                    global.frozen = false;
			                    objMegaman.visible = true;
			                    instance_destroy();
			                    with megaman playerDeactivateObjects();
			                }
			                else
			                {
			                    var bossdr;
			                    bossdr = instance_place(megaman.sectionRight, y, objBossDoor);
			                    if bossdr >= 0
			                    {
									bossdr.playerID = megaman.playerID;
			                        bossdr.opening = false;
			                        bossdr.closing = true;
			                        image_speed = 0;
			                        playSFX(sfxDoor);
                        
			                        playerSpeedHorDoor = 0;
			                    }
			                    else
			                    {
			                        global.frozen = false;
			                        objMegaman.visible = true;
			                        instance_destroy();
			                        with megaman playerDeactivateObjects();
			                    }
			                }
			            }
			        }
        
			        //Down
			        else if dir == "down"
			        {
			            global.viewY += screenSpeedVert;
            
			            if door == false
			            {
			                y += playerSpeedVert;
			                objMegaman.y += playerSpeedVert;
			            }
			            else
			            {
			                y += playerSpeedVertDoor;
			                objMegaman.y += playerSpeedVertDoor;
			            }            
            
			            if global.viewY >= objMegaman.sectionTop
			            {
			                global.viewY = objMegaman.sectionTop;
                
			                if door == false
			                {
			                    global.frozen = false;
			                    objMegaman.visible = true;
			                    instance_destroy();
			                    with megaman playerDeactivateObjects();
			                    instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
			                }
			                else
			                {
			                    var bossdr;
			                    bossdr = instance_place(x, megaman.sectionTop, objBossDoorH);
			                    if bossdr >= 0
			                    {
			                        bossdr.opening = false;
			                        bossdr.closing = true;
			                        image_speed = 0;
			                        playSFX(sfxDoor);
                        
			                        playerSpeedVertDoor = 0;
			                    }
			                    else
			                    {
			                        global.frozen = false;
			                        objMegaman.visible = true;
			                        instance_destroy();
			                        with megaman playerDeactivateObjects();
			                    }
			                }                
			            }
            
                        
			        }
        
			        //Up
			        else if dir == "up"
			        {
			            global.viewY -= screenSpeedVert;            
            
			            if door == false
			            {
			                y -= playerSpeedVert;
			                objMegaman.y -= playerSpeedVert;
			            }
			            else
			            {
			                y -= playerSpeedVertDoor;
			                objMegaman.y -= playerSpeedVertDoor;
			            }            

			            if global.viewY <= objMegaman.sectionBottom - view_hview[0]
			            {
			                global.viewY = objMegaman.sectionBottom - view_hview[0];

			                if door == false
			                {
			                    global.frozen = false;
			                    objMegaman.visible = true;
			                    instance_destroy();
			                    with megaman playerDeactivateObjects();
			                }
			                else
			                {
			                    var bossdr;
			                    bossdr = instance_place(x, megaman.sectionBottom, objBossDoorH);
			                    if bossdr >= 0
			                    {
			                        bossdr.opening = false;
			                        bossdr.closing = true;
			                        image_speed = 0;
			                        playSFX(sfxDoor);
                        
			                        playerSpeedVertDoor = 0;
			                    }
			                    else
			                    {
			                        global.frozen = false;
			                        objMegaman.visible = true;
			                        instance_destroy();
			                        with megaman playerDeactivateObjects();
			                    }
			                }                                        
			            }
            
            
			        }
        
        
        
			        //Climbing animation
			        if sprite_index == asset_get_index("spr"+character+"Climb")
			        {
			            climbTimer += 1;
			            if climbTimer >= 8
			            {
			                image_xscale = -image_xscale;
			                with objMegaman image_xscale = -image_xscale;
			                climbTimer = 0;
			            }
			        }
			    }
			}
		//Quick weapon switching
		with megaman playerSwitchWeapons();
		}
	}
}
else
{
	character = objMegaman.character;
	primary_color = objMegaman.primary_color;
	secondary_color = objMegaman.primary_color;
	outline_color = objMegaman.primary_color;
	with objMegaman visible = false;
	sprite_index = objMegaman.sprite_index;
	image_index = objMegaman.image_index;
	imgSpd = objMegaman.image_speed;
	image_speed = imgSpd;
	image_xscale = objMegaman.image_xscale;
	if canStep == true && playerSpeedHorDoor != 0 //When the door is closing, we should not move
	{
		if !(door == true && canProgressDoor == false)
		{
			//Right
			if dir == "right"
			{
				global.viewX += screenSpeedHor;
            
				if door == false
				{
				    x += playerSpeedHor;
				    objMegaman.x += playerSpeedHor;
				}
				else
				{
				    x += playerSpeedHorDoor;
				    objMegaman.x += playerSpeedHorDoor;
				}
            
				if global.viewX >= objMegaman.sectionLeft
				{
				    global.viewX = objMegaman.sectionLeft;
                
				    if door == false
				    {
				        global.frozen = false;
				        objMegaman.visible = true;
				        instance_destroy();
				        with objMegaman playerDeactivateObjects();
				    }
				    else
				    {
				        var bossdr;
				        bossdr = instance_place(objMegaman.sectionLeft, y, objBossDoor);
				        if bossdr >= 0
				        {
							bossdr.playerID = playerID;
				            bossdr.opening = false;
				            bossdr.closing = true;
				            image_speed = 0;
				            playSFX(sfxDoor);
                        
				            playerSpeedHorDoor = 0;
				        }
				        else
				        {
				            global.frozen = false;
				            objMegaman.visible = true;
				            instance_destroy();
				            with objMegaman playerDeactivateObjects();
				        }
				    }
				}
			}
        
			//Left
			else if dir == "left"
			{
				global.viewX -= screenSpeedHor;
            
				if door == false
				{
				    x -= playerSpeedHor;
				    objMegaman.x -= playerSpeedHor;
				}
				else
				{
				    x -= playerSpeedHorDoor;
				    objMegaman.x -= playerSpeedHorDoor;
				}
            
				if global.viewX <= objMegaman.sectionRight-global.viewWidth
				{
				    global.viewX = objMegaman.sectionRight-global.viewWidth;
                
				    if door == false
				    {
				        global.frozen = false;
				        objMegaman.visible = true;
				        instance_destroy();
				        with objMegaman playerDeactivateObjects();
				    }
				    else
				    {
				        var bossdr;
				        bossdr = instance_place(objMegaman.sectionRight, y, objBossDoor);
				        if bossdr >= 0
				        {
							bossdr.playerID = playerID;
				            bossdr.opening = false;
				            bossdr.closing = true;
				            image_speed = 0;
				            playSFX(sfxDoor);
                        
				            playerSpeedHorDoor = 0;
				        }
				        else
				        {
				            global.frozen = false;
				            objMegaman.visible = true;
				            instance_destroy();
				            with objMegaman playerDeactivateObjects();
				        }
				    }
				}
			}
        
			//Down
			else if dir == "down"
			{
				global.viewY += screenSpeedVert;
				y += playerSpeedVert;
				objMegaman.y += playerSpeedVert;
            
				if global.viewY >= objMegaman.sectionTop
				{
				    global.viewY = objMegaman.sectionTop;
				    global.frozen = false;
				    objMegaman.visible = true;
				    instance_destroy();
				    with objMegaman playerDeactivateObjects();
				    instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
				}
			}
        
			//Up
			else if dir == "up"
			{
				global.viewY -= screenSpeedVert;
				y -= playerSpeedVert;
				objMegaman.y -= playerSpeedVert;
            
				if global.viewY <= objMegaman.sectionBottom - global.viewHeight
				{
				    global.viewY = objMegaman.sectionBottom - global.viewHeight;
				    global.frozen = false;
				    objMegaman.visible = true;
				    instance_destroy();
				    with objMegaman playerDeactivateObjects();
				}
			}
        
        
        
			//Climbing animation
			if sprite_index == asset_get_index("spr"+character+"Climb")
			{
				climbTimer += 1;
				if climbTimer >= 8
				{
				    image_xscale = -image_xscale;
				    with objMegaman image_xscale = -image_xscale;
				    climbTimer = 0;
				}
			}
		}
	}
	//Quick weapon switching
	with objMegaman playerSwitchWeapons();
	
}

