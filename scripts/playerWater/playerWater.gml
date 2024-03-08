function playerWater(){
	var currentWater, useGrav, wtr;
	if (place_meeting(x, y, objWater) && inWater == 0)
	{
	    inWater = 1
	    playSFX(sfxSplash)
	    currentWater = instance_place(x, y, objWater)
	    if (currentWater.yDir == -1)
	        instance_create(x, (currentWater.bbox_top + 1), objSplash)
	    else if (currentWater.yDir == 1)
	        instance_create(x, (currentWater.bbox_bottom - 1), objSplash)
	    else
	        instance_create(x, sprite_get_ycenter(), objSplash)
	}
	if (object_index != objSectionSwitcher)
	{
	    if (inWater == 1)
	    {
	        currentGrav = gravWater
	        currentJumpSpeed = jumpSpeedWater
	        if (teleporting == 0)
	        {
	            bubbleTimer += 1
	            if (bubbleTimer >= 10)
	            {
	                bubbleTimer = 0
	                if (!instance_exists(objAirBubble))
	                    instance_create(x, y, objAirBubble)
	            }
	        }
	    }
	    else
	    {
	        useGrav = grav
	        currentGrav = useGrav
	        currentJumpSpeed = jumpSpeed
	        bubbleTimer = 0
	    }
	}
	if (inWater == 1 && place_meeting(x, y, objWater))
	    prevWaterID = instance_place(x, y, objWater)
	if (inWater == 1 && (!(place_meeting(x, y, objWater))))
	{
	    if (prevWaterID != -20 && didTouchWaterPrevious == 1)
	    {
	        wtr = prevWaterID
	        if (wtr >= objSolid)
	        {
	            if (((wtr.yDir == -1 || wtr.yDir == 0) && bbox_bottom < wtr.bbox_top) || ((wtr.yDir == 1 || wtr.yDir == 0) && bbox_top > wtr.bbox_bottom))
	            {
	                if (wtr.yDir == -1 || (wtr.yDir == 0 && bbox_bottom < wtr.bbox_top))
	                    instance_create(x, (wtr.bbox_top + 1), objSplash)
	                else
	                    instance_create(x, (wtr.bbox_bottom - 1), objSplash)
	                inWater = 0
	                playSFX(sfxSplash)
	            }
	        }
	        wtr = prevWaterID
	        if (wtr >= objSolid)
	        {
	            if (((wtr.xDir == -1 || wtr.xDir == 0) && bbox_right < wtr.bbox_left) || ((wtr.xDir == 1 || wtr.xDir == 0) && bbox_left > wtr.bbox_right))
	            {
	                if (wtr.xDir == -1 || (wtr.xDir == 0 && bbox_right < wtr.bbox_left))
	                    instance_create((wtr.bbox_left + 1), sprite_get_ycenter(), objSplash)
	                else
	                    instance_create((wtr.bbox_right - 1), sprite_get_ycenter(), objSplash)
	                inWater = 0
	                playSFX(sfxSplash)
	            }
	        }
	    }
	}
	didTouchWaterPrevious = place_meeting(x, y, objWater)
	if place_meeting(x, y, objWater)
	    inWater = 1
	else
	    inWater = 0
}