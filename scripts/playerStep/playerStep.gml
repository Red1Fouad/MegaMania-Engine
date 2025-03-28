/// @function playerStep
/// @description Handles general step event code for the player
function playerStep() {

var scarfSpeed = 0.15;
var useSpeed = 0;
	//Check for ground
	if place_meeting(x, y+global.yspeed[playerID]+1, objSolid) || (place_meeting(x, y+global.yspeed[playerID]+1, objTopSolid)  && global.yspeed[playerID] >= 0)
	|| (place_meeting(x, y+global.yspeed[playerID]+1, prtMovingPlatformJumpthrough) && global.yspeed[playerID] >= 0)
	|| (place_meeting(x, y+global.yspeed[playerID]+1, prtMovingPlatformSolid) && !place_meeting(x, y, prtMovingPlatformSolid))
	{
	    var endCheck;
	    endCheck = false;
    
	    //We are only on the ground if the moving platform is not 'dead' (despawned and ready to respawn)
	    if place_meeting(x, y+global.yspeed[playerID]+1, objSolid)
	    {
	        ground = true;
	        endCheck = true;
	    }
    
	    if place_meeting(x, y+global.yspeed[playerID]+1, objTopSolid) && endCheck == false
	    {
	        if bbox_bottom <= instance_place(x, y+global.yspeed[playerID]+1, objTopSolid).bbox_top
	            ground = true;
	        else
	            ground = false;
            
	        endCheck = true;
	    }
    
	    var pltfm, totalPlatforms;
	    pltfm = collision_rectangle(bbox_left, bbox_bottom+global.yspeed[playerID], bbox_right, bbox_bottom+global.yspeed[playerID]+1, prtMovingPlatformJumpthrough, false, true);
	    totalPlatforms = 0;
	    while pltfm >= 0 && endCheck == false
	    {
	        if pltfm.id == movedPlatformID || movedPlatformID == -20
	        {
	            if pltfm.dead == false
	            {
	                if bbox_bottom <= pltfm.bbox_top
	                {
	                    ground = true;
	                    endCheck = true;
	                }
	                else
	                    ground = false;
	            }
	            else
	                ground = false;
                
	            break;
	        }
        
	        platformID[totalPlatforms] = pltfm;
	        instance_deactivate_object(pltfm);
	        totalPlatforms += 1;
	        pltfm = collision_rectangle(bbox_left, bbox_bottom+global.yspeed[playerID], bbox_right, bbox_bottom+global.yspeed[playerID]+1, prtMovingPlatformJumpthrough, false, true);
	    }
    
	    var i;
	    for(i = 0; i < totalPlatforms; i += 1)
	        instance_activate_object(platformID[i]);
    
	    //The extra code is to check for multiple moving platforms at once
	    //Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
	    var maxID;
	    maxID = -1;
	    while place_meeting(x, y+global.yspeed[playerID]+1, prtMovingPlatformSolid) && endCheck == false
	    {
	        maxID += 1;
	        ID[maxID] = instance_place(x, y+global.yspeed[playerID]+1, prtMovingPlatformSolid);
        
	        if ID[maxID].dead == false
	        {
	            ground = true;
	            //endCheck = true;
	        }
	        else
	            ground = false;
            
	        instance_deactivate_object(ID[maxID]);
	    }
    
	    for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
	    {
	        instance_activate_object(ID[i]);
	    }
    
	    if !place_meeting(x, y+global.yspeed[playerID]+1, objSolid) && !place_meeting(x, y+global.yspeed[playerID]+1, objTopSolid)
	    && !place_meeting(x, y+global.yspeed[playerID]+1, prtMovingPlatformJumpthrough) && !place_meeting(x, y+global.yspeed[playerID]+1, prtMovingPlatformSolid)
	    {
	        ground = true;
	    }
	}
	else
	{
	    ground = false;
	    if prevGround == true
	        y += 1; //To make Mega Man able to fall through 1-block wide gaps
	}


	//Can we do a short hop? (Placed earlier in the code to fix the 'jump on the frame you land and you can't do a short hop' bug
	if !(ground == false && canGravity == true)
	{
	    jumpedFromSlide = 0;
		canMinJump = true;
	}


	//Should the landing sound be played when colliding with a floor? (Disabled on ladders, for example)
	//Lasts two frames because one extra frame is required for the collision to register
	if playLandSoundTimer < 2
	{
	    playLandSoundTimer += 1;
	}
	else
	{
	    playLandSound = true;
	}


	//Movement (includes initializing sidestep while on the ground)
	if canMove == true
	{
	    if ground == true
	    {
	        if keyLeft && !keyRight
	        {
	            if canInitStep == true
	            {
	                canInitStep = false;
	                isStep = true;
	                image_xscale = -1;
	            }
	            else if isStep == false
	            {
	                if !(place_meeting(x, y+1, objIce) && global.xspeed[playerID] > 0)
	                {
	                    //Normal physics
	                    if (!place_meeting(x-1, y, objSolid) xor place_meeting(x-1,y,prtSlope)) && !place_meeting(x-1, y, prtMovingPlatformSolid)
	                        global.xspeed[playerID] = -walkSpeed;
	                    else if place_meeting(x-1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x-1, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed[playerID] = -walkSpeed;
	                    }
	                }
	                else
	                {
	                    //Ice physics
	                    if (!place_meeting(x-1, y, objSolid) xor place_meeting(x-1,y,prtSlope)) && !place_meeting(x-1, y, prtMovingPlatformSolid)
	                        global.xspeed[playerID] -= iceDecWalk;
	                    else if place_meeting(x-1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x-1, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed[playerID] -= iceDecWalk;
	                    }
	                }
                    
	                image_xscale = -1;
                            
	                if canSpriteChange == true
	                {
	                    sprite_index = spriteWalk;
	                    image_speed = 0.15;
	                }
	            }
	        }
	        else if keyRight && !keyLeft
	        {
	            if canInitStep == true
	            {
	                canInitStep = false;
	                isStep = true;
	                image_xscale = 1;
	            }
	            else if isStep == false
	            {
	                if !(place_meeting(x, y+1, objIce) && global.xspeed[playerID] < 0)
	                {
	                    //Normal physics
	                    if (!place_meeting(x+1, y, objSolid) xor place_meeting(x+1,y,prtSlope)) && !place_meeting(x+1, y, prtMovingPlatformSolid)
	                        global.xspeed[playerID] = walkSpeed;
	                    else if place_meeting(x+1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x+1, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed[playerID] = walkSpeed;
	                    }
	                }
	                else
	                {
	                    //Ice physics
	                    if (!place_meeting(x-1, y, objSolid) xor place_meeting(x-1,y,prtSlope)) && !place_meeting(x-1, y, prtMovingPlatformSolid)
	                        global.xspeed[playerID] += iceDecWalk;
	                    else if place_meeting(x+1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x+1, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed[playerID] += iceDecWalk;
	                    }
	                }
                    
	                image_xscale = 1;
                
	                if canSpriteChange == true
	                {
	                    sprite_index = spriteWalk;
	                    image_speed = 0.15;
	                }
	            }
	        }
	        else
	        {
	            if !(place_meeting(x, y+1, objIce) && global.xspeed[playerID] != 0)
	            {
	                //Normal physics
	                global.xspeed[playerID] = 0;
	                canInitStep = true;
	            }
	            else
	            {
	                //Ice physics
	                if global.xspeed[playerID] > 0
	                    global.xspeed[playerID] -= iceDec;
	                else if global.xspeed[playerID] < 0
	                    global.xspeed[playerID] += iceDec;
                    
	                if global.xspeed[playerID] > -iceDec && global.xspeed[playerID] < iceDec
	                    global.xspeed[playerID] = 0;
	            }
            
	            if keyLeft && !keyRight
	                image_xscale = -1;
	            else if keyRight && !keyLeft
	                image_xscale = 1;
            
	            if canSpriteChange == true
	            {
	                sprite_index = spriteStand;
	                if character == "Megaman" || character == "Bass" || character == "Roll"
					{
						image_speed = 0;
		                image_index = blinkImage;
					}
					else if character == "Protoman"
					{
						image_speed = scarfSpeed;
					}
					
	            }
	        }
	    }
	    else
	    {
	        canInitStep = false;
	        isStep = false;
        
	        if canSpriteChange == true
	            sprite_index = spriteJump;
            
			if character == "Bass" && jumpedFromSlide == 1
	            useSpeed = slideSpeed
	        else
	            useSpeed = walkSpeed
			
	        if keyLeft && !keyRight && !place_meeting(x-1, y, objSolid)
	        {
	            if !place_meeting(x-1, y, prtMovingPlatformSolid)
	            {
	                global.xspeed[playerID] = -useSpeed;
	                image_xscale = -1;
	            }
	            else
	            {
	                if instance_place(x-1, y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
	                {
	                    global.xspeed[playerID] = -useSpeed;
	                    image_xscale = -1;
	                }
	            }
	        }
	        else if keyRight && !keyLeft && !place_meeting(x+1 + (prevXScale == -1), y, objSolid) //For some reason, while on the left of the wall and facing left, then jumping and holding right would clip you through it. Prevented by checking if the player was facing left on the previous frame, and if so, disallow Mega Man to move if 2 pixels away from the wall instead of 1
	        {
	            if !place_meeting(x+1 + (prevXScale == -1), y, prtMovingPlatformSolid)
	            {
	                global.xspeed[playerID] = useSpeed;
	                image_xscale = 1;
	            }
	            else
	            {
	                if instance_place(x+1 + (prevXScale == -1), y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
	                {
	                    global.xspeed[playerID] = useSpeed;
	                    image_xscale = 1;
	                }
	            }
	        }
	        else
	        {
	            global.xspeed[playerID] = 0;
            
	            if keyLeft && !keyRight
	                image_xscale = -1;
	            else if keyRight && !keyLeft
	                image_xscale = 1;
	        }
	    }
	}
	else if canSpriteChange == true
	{
	    //Even if canMove is false, we should still be able to change sprites
	    if ground == true
	    {
	        if global.xspeed[playerID] == 0
	        {
	            sprite_index = spriteStand;
	            if character == "Megaman" || character == "Bass" || character == "Roll"
				{
					image_index = blinkImage;
		            image_speed = 0;
				}
				else if character == "Protoman"
				{
					image_speed = scarfSpeed;
				}
	        }
	        else
	        {
	            sprite_index = spriteWalk;
	            image_speed = 0.15;
	        }
	    }
	    else
	    {
	        sprite_index = spriteJump;
	    }
	}


	//Blinking animation
	if character == "Megaman" || character == "Bass" || character == "Roll"
	{
		if sprite_index == asset_get_index("spr"+character+"Stand") //Don't use spriteStand as this could also be sprMegamanStandShoot! 
		{
		    if blinkImage == 0
		    {
		        blinkTimer += 1;
		        if blinkTimer >= blinkTimerMax
		        {
		            blinkImage = 1;
		            blinkTimer = 0;
		        }
		    }
		    else
		    {
		        blinkTimer += 1;
		        if blinkTimer >= blinkDuration
		        {
		            blinkImage = 0;
		            blinkTimer = 0;
		        }
		    }
		}
		else
		{
		    blinkTimer = 0;
		    blinkImage = 0;
		}
	}
	else if character == "Protoman"
	{
		if sprite_index == sprProtomanStand //Don't use spriteStand as this could also be sprMegamanStandShoot!
			{
				image_speed = scarfSpeed;
			}
	}

	//Sidestepping
	if isStep == true
	{
	    if (!place_meeting(x+image_xscale, y, objSolid) xor place_meeting(x+image_xscale,y,prtSlope)) && !place_meeting(x+image_xscale, y, prtMovingPlatformSolid)
	        global.xspeed[playerID] = stepSpeed * image_xscale;
	    else if place_meeting(x+image_xscale, y, prtMovingPlatformSolid)
	    {
	        if instance_place(x+image_xscale, y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
	            global.xspeed[playerID] = stepSpeed * image_xscale;
	    }
    
	    if canSpriteChange == true
	        sprite_index = spriteStep;
    
	    stepTimer += 1;
	    if stepTimer >= stepFrames
	    {
	        isStep = false;
	        stepTimer = 0;
	    }
	}


	//Allow movement
	move(global.xspeed[playerID], global.yspeed[playerID]);


	//Stop movement at section borders
	if x > sectionRight-6 && !place_meeting(x+6, y, objSectionArrowRight) && !place_meeting(x-global.xspeed[playerID], y, objSectionArrowRight)
	{
	    x = sectionRight-6;
	    global.xspeed[playerID] = 0;
	}
	else if x < sectionLeft+6 && !place_meeting(x-6, y, objSectionArrowLeft) && !place_meeting(x-global.xspeed[playerID], y, objSectionArrowLeft)
	{
	    x = sectionLeft+6;
	    global.xspeed[playerID] = 0;
	}
    
	if y < sectionTop-32
	    y = sectionTop-32;
	else if bbox_top > sectionBottom && !place_meeting(x, y, objSectionArrowDown)
	{
	    global._health[playerID] = 0;
	    deathByPit = true;
	}   
   
	//Stop movement at room borders
	if x > room_width-6
	    x = room_width-6;
	else if x < 6
	    x = 6;
    
	if y < -32
	    y = -32;
	else if bbox_top > room_height
	{
	    global._health[playerID] = 0;
	    deathByPit = true;
	}


	//Jumping
	if (canMove == true || isThrow == true || onRushJet == true) && ((ground == 1) || ((character == "Bass") && (global.enableDoubleJump == 1) && (didDoubleJump == 0) && (justClimbed == 0) && (climbing == 0))) && keyJumpPressed && !keyDown
	{
	    if isThrow == true  //We can jump-cancel the throwing animation (after throwing a Metal Blade, Pharaoh Shot etc)
	    {
	        canMove = true;
	        canSpriteChange = true;
	        shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
	    }
	    else if onRushJet == true
	    {
	        canMove = true;
	    }
		
		if ground == 0 && justClimbed == 0
	    {
	        didDoubleJump = 1
	        jumpedFromSlide = 0
	        canMinJump = 1
	        //instance_create(sprite_get_xcenter(), (bbox_bottom - 5), objDoubleJumpEffect)
	    }
	
	    global.yspeed[playerID] = -currentJumpSpeed;
	    ground = false;
	    y -= 1; //To negate the prevGround y += 1
	    sprite_index = spriteJump;
	}

	if ground == true
		didDoubleJump = 0;

	justClimbed = climbing;
	//Minjumping (lowering jump when the jump button is released)
	if ground == false && global.yspeed[playerID] < 0 && !keyJump && canMinJump == true
	{
	    canMinJump = false;
	    global.yspeed[playerID] = 0;
	}


	//Sliding
	var box;
	if image_xscale == 1
	    box = bbox_right;
	else
	    box = bbox_left;
    
	if global.enableSlide == true
	{
	    if ground == true && isSlide == false && ((keyJumpPressed && keyDown) || keySlidePressed)
	    && (canMove == true || isThrow == true)
	    && !position_meeting(box+image_xscale*5, bbox_bottom-8, objSolid)
	    {
	        var canSld;
	        canSld = false;
        
	        if !position_meeting(box+image_xscale*5, bbox_bottom-8, prtMovingPlatformSolid)
	            canSld = true;
	        else
	        {
	            if instance_position(box+image_xscale*5, bbox_bottom-8, prtMovingPlatformSolid).dead == true //We can still slide if the moving platform is despawned
	                canSld = true;
	        }
        
        
	        if canSld == true
	        {
	            if isThrow == true
	            {
	                isThrow = false;
	                shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
	            }
            
	            isSlide = true;
	            canMove = false;
	            canSpriteChange = false;
	            sprite_index = spriteSlide;
				if character == "Bass"
					mask_index = mskMegaman
				else
					mask_index = mskMegamanSlide;
            
				if (place_meeting(x,y,prtSlope)) {
					while (place_meeting(x,y,prtSlope)) {y--;}
				}
			
	            if image_xscale == -1
	                with instance_create(bbox_right-2, bbox_bottom-2, objSlideDust) image_xscale = -1;
	            else
	                instance_create(bbox_left+2, bbox_bottom-2, objSlideDust);
            
	            var endLoop;
	            endLoop = false;
	            while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false
	            {
	                if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
	                {
	                    if instance_place(x, y, prtMovingPlatformSolid).dead == true
	                        endLoop = true;
	                }
                
	                x += image_xscale;
	            }
            
	            global.xspeed[playerID] = slideSpeed * image_xscale;
	        }
	    }
    
    
	    //While sliding
	    if isSlide == true
	    {
	        isStep = false;
	        canInitStep = false;
	        slideTimer += 1;
        
	        var canProceed;
	        canProceed = true;
        
	        if (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)) && (ground == true || place_meeting(x-(slideSpeed-1), y+1, objSolid) || place_meeting(x-(slideSpeed-1), y+1, objTopSolid) || place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough) || place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformSolid)
	        || (place_meeting(x+(slideSpeed-1), y, objSolid) xor place_meeting(x+(slideSpeed-1), y, prtSlope)) || place_meeting(x+(slideSpeed-1), y, prtMovingPlatformSolid)) //Extra check because if Mega Man falls down while sliding and a wall is on the other side of him and a ceiling is on top of him, when turning around on the right frame he would zip through the solids
	        {            
	            if place_meeting(x, y-3, prtMovingPlatformSolid)
	            {
	                if instance_place(x, y-3, prtMovingPlatformSolid).dead == true
	                    canProceed = false;
	            }
	            if place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformSolid)
	            {
	                if instance_place(x-(slideSpeed-1), y+1, prtMovingPlatformSolid).dead == true
	                    canProceed = false;
	            }
	            if place_meeting(x+(slideSpeed-1), y, prtMovingPlatformSolid)
	            {
	                if instance_place(x+(slideSpeed-1), y, prtMovingPlatformSolid).dead == true
	                    canProceed = false;
	            }
	            if place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough)
	            {
	                if instance_place(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough).dead == true
	                    canProceed = false;
	            }
            
	            if canProceed == true
	            {
	                if keyLeft && !keyRight
	                {
	                    image_xscale = -1;
	                    global.xspeed[playerID] = -slideSpeed;
	                }
	                else if keyRight && !keyLeft
	                {
	                    image_xscale = 1;
	                    global.xspeed[playerID] = slideSpeed;
	                }
                
	                ground = true;  //For the bugfix as explained on the second line of the place_meeting checks
	            }
	        }
	        else
	        {
	            canProceed = false;
	        }
        
        
	        if canProceed == false
	        {
	            if ground == false || (keyLeft && !keyRight && image_xscale == 1)
	            || (keyRight && !keyLeft && image_xscale == -1)
	            || slideTimer >= slideFrames || (keyJumpPressed && !keyDown)
	            || (place_meeting(x+image_xscale*3, y, objSolid) xor place_meeting(x+image_xscale*3, y, prtSlope)) || place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
	            {
	                var stopSld;
	                stopSld = true;
                
	                if ground == false || (keyLeft && !keyRight && image_xscale == 1)
	                || (keyRight && !keyLeft && image_xscale == -1)
	                || slideTimer >= slideFrames || (keyJumpPressed && !keyDown)
	                || (place_meeting(x+image_xscale*3, y, objSolid) xor place_meeting(x+image_xscale*3, y, prtSlope))
	                {
	                    stopSld = true;
	                }
	                else if place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
	                {
	                    if instance_place(x+image_xscale*3, y, prtMovingPlatformSolid).dead == true //We should not stop sliding if the moving platform is despawned
	                        stopSld = false;
	                }
                
	                if stopSld == true
	                {
	                    isSlide = false;
	                    canMove = true;
	                    canSpriteChange = true;
	                    mask_index = mskMegaman;
	                    slideTimer = 0;
                    
	                    var endLoop;
	                    endLoop = false;
                    
						//go down if on slope
					    if (place_meeting(x,y+cfgMaxStep+1,prtSlope) or place_meeting(x-global.xspeed[playerID],y+cfgMaxStep+1,prtSlope)) {
                        while (!place_meeting(x,y+1,objSolid)) {
                            y++;
                        }
                    }
					
	                    //Pushing down until not inside a ceiling anymore
	                    while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false      //If your slide cancels right under a ceiling, move MM down
	                    {
	                        if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
	                        {
	                            if instance_place(x, y, prtMovingPlatformSolid).dead == true
	                                endLoop = true;
	                        }
                        
	                        if endLoop == false
	                        {
	                            y += 1;
	                            sprite_index = spriteJump;
	                            ground = false;
	                        }
	                    }
                        
	                    if !place_meeting(x, y+1, objIce)
	                        global.xspeed[playerID] = 0;
	                    else
	                        global.xspeed[playerID] = walkSpeed * image_xscale;
					
					
	                    if keyJumpPressed && (!keyDown)
	                    {
	                        global.yspeed[playerID] = -jumpSpeed;
	                        ground = false;
							jumpedFromSlide = 1;
	                        y -= 1; //To negate the prevGround y += 1
							/*if (ground == 0) && (slideTimer < slideFrames) && (character == "Bass") && (global.enableDoubleJump == 1) && (didDoubleJump == 0)
								didDoubleJump = 1;*/
	                    }
	                }
	            }
	        }
	    }
	    else
	    {
	        slideTimer = 0;
	    }
	}


	//CanSlide (before, if you slid on the exact frame you landed on the ground, you got wall collision and teleported a long distance)
	if ground == false
	{
	    canSlide = false;
	    canSlideTimer = 0;
	}
	else
	{
	    if canSlideTimer < 1
	        canSlideTimer += 1;
	    else
	        canSlide = true;
	jumpedFromSlide = 0;
	}


	//Climbing
	var ladder, ladderDown;
	ladder = collision_rectangle(sprite_get_xcenter()-3, bbox_top, sprite_get_xcenter()+3, bbox_bottom-1, objLadder, false, false);
	ladderDown = collision_rectangle(sprite_get_xcenter()-3, bbox_bottom+1, sprite_get_xcenter()+3, bbox_bottom+2, objLadder, false, false);
	if ((ladder >= 0 && keyUp && !keyDown)
	|| (ladderDown >= 0 && ground == true && keyDown && !keyUp && !place_meeting(x, y, objLadder)))
	&& (canMove == true || isSlide == true)
	{
	    isSlide = false;
	    mask_index = mskMegaman;
	    slideTimer = 0;
    
	    climbing = true;
	    canMove = false;
	    canSpriteChange = false;
	    canGravity = false;
    
	    global.xspeed[playerID] = 0;
	    global.yspeed[playerID] = 0;
    
	    if ladder >= 0
	        x = ladder.x+8;
	    else if ladderDown >= 0
	    {
	        x = ladderDown.x+8;
	        if otherTransition == 0 y += climbSpeed;
	        ground = false;
	    }
    
	    sprite_index = spriteClimb;
	    image_speed = 0;
    
	    ladderXScale = image_xscale;
	    climbShootXscale = ladderXScale;
	}


	//While climbing
	if climbing == true
	{
	    isStep = false;
	    canInitStep = false;
		jumpedFromSlide = 0;
		didDoubleJump = 0;
    
	    //Movement
	    if keyUp && !keyDown && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer += 1;
	        global.yspeed[playerID] = -climbSpeed;
			otherTransition = 0;
	    }
	    else if keyDown && !keyUp && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer += 1;
	        global.yspeed[playerID] = climbSpeed;
			otherTransition = 0;
	    }
	    else
	    {
	        global.yspeed[playerID] = 0;
	    }
    
	    //Left/right
	    if keyRight && !keyLeft
	        climbShootXscale = 1;
	    else if keyLeft && !keyRight
	        climbShootXscale = -1;
    
	    if climbSpriteTimer >= 8 && sprite_index == spriteClimb && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer = 0;
	        image_xscale = -image_xscale;
	    }
    
	    //Getup sprite
	    if !position_meeting(x, bbox_top+11, objLadder) && position_meeting(x, bbox_bottom+1, objLadder) //The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
	    {
	        sprite_index = spriteGetup;
	        if sprite_index == sprMegamanClimbGetup //not when shooting
	            image_xscale = 1;
	    }
	    else
	    {
	        sprite_index = spriteClimb;
	    }
    
	    //Releasing the ladder
	    if (ground == true && !keyUp) || !place_meeting(x, y, objLadder) || (keyJumpPressed && !keyUp)
	    {
	        climbing = false;
	        canMove = true;
	        canSpriteChange = true;
	        canGravity = true;
	        image_xscale = ladderXScale;
	        global.yspeed[playerID] = 0;
        
        
	        if position_meeting(x, bbox_bottom+15, objTopSolid) || ground == true
	        {
	            if (keyRight && !keyLeft) || (keyLeft && !keyRight)
	            {
	                sprite_index = spriteWalk;
                
	                if keyRight
	                {
	                    global.xspeed[playerID] = walkSpeed;
	                    image_xscale = 1;
	                }
	                else if keyLeft
	                {
	                    global.xspeed[playerID] = -walkSpeed;
	                    image_xscale = -1;
	                }
	            }
	            else
	                sprite_index = spriteStand;
	        }
	        else
	            sprite_index = spriteJump;
        
	        if !place_meeting(x, y, objLadder)
	        {
	            var topSolidID;
	            topSolidID = instance_place(x, y+2, objTopSolid);
	            if topSolidID >= 0
	                y = topSolidID.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
                
	            playLandSound = false;
	            playLandSoundTimer = 0;
	        }
	    }
	}


	//Water
	playerWater();

	//While being hit
	if isHit == true
	{
	    hitTimer += 1;
	    if hitTimer >= hitTime
	    {
	        isHit = false;
	        drawHitspark = false;
	        hitTimer = 0;
        
	        //When sliding and there's a solid above us, we should not experience knockback
	        //If we did, we would clip inside the ceiling above us
	        if !(isSlide == true && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
	        {
	            canMove = true;
	            canSpriteChange = true;
	        }
        
	        invincibilityTimer = 60;
	    }
	    else
	    {
	        if hitTimer mod 4 == 0 || hitTimer mod 4 == 1  //mod: modulo, %. Gives the remainder
	            drawHitspark = true;
	        else
	            drawHitspark = false;
	    }
	}


	//Invincibility
	if invincibilityTimer != 0
	{
	    invincibilityTimer -= 1;
	    if invincibilityTimer <= 0
	    {
	        invincibilityTimer = 0;
	        canHit = true;
	        visible = true;
	    }
	    else
	    {
	        if invincibilityTimer mod 2 == 1
	            visible = false;
	        else
	            visible = true;
	    }
	}


	//Dying
	if global._health[playerID] <= 0
	{
	    if deathByPit == false
	    {
	        var i, explosionID;
            
	        i = 0;
	        repeat 8
	        {
	            explosionID = instance_create(x, y, objMegamanExplosion);
	                explosionID.dir = i;
	                explosionID.spd = 1.5;
                
	            i += 45;
	        }
        
	        i = 0;
	        repeat 8
	        {
	            explosionID = instance_create(x, y, objMegamanExplosion);
	                explosionID.dir = i;
	                explosionID.spd = 2.5;
                
	            i += 45;
	        }
	    }
    
	    instance_create(x, y, objMegamanDeathTimer); //Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
		instance_destroy();
		
		if instance_number(objMegaman) == 0
	    sound_stop_all();
	    playSFX(sfxDeath);
	}


	//Gravity
	if ground == false && canGravity == true
	{
	    global.yspeed[playerID] += currentGrav;
	    if global.yspeed[playerID] > maxVspeed
	        global.yspeed[playerID] = maxVspeed;
	}


	//Variables on the previous frame
	prevGround = ground;
	prevXScale = image_xscale;


	if character == "Protoman" && canDuck && (global.xspeed[playerID] == 0 || place_meeting(x, y+1, objIce) && !keyLeft && !keyRight) && keyDown && canSpriteChange && ground == 1 && teleporting == 0 && global.frozen == 0 && !isSlide
		ducking = true;
	else
		ducking = false;
	
	if ducking == true
	{
		sprite_index = spriteDuck
	}
	else
	{
		if !isSlide mask_index = mskMegaman;
	}

	escapeWall();
}
