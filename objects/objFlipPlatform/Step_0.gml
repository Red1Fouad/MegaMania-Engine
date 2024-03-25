var waitTimerMax, switchSpeed;
event_inherited()
if canStep
{
    if !global.frozen && !dead
    {
		for (var playerCounter = 1; playerCounter <= instance_number(objMegaman); playerCounter++)
		{
			var playerLoopObject = instance_find(objMegaman, (playerCounter - 1))
	        image_speed = 0
	        if ((phase != 2) && (phase != 5))
	        {
	            animTimer += (1)
	            if ((animTimer >= 15))
	            {
	                animTimer = 0
	                if ((phase < 2))
	                {
	                    if ((image_index == 5))
	                        image_index = 6
	                    else
	                        image_index = 5
	                }
	                else if ((image_index == 0))
	                    image_index = 1
	                else
	                    image_index = 0
	            }
	        }
	        waitTimerMax = 20
	        switchSpeed = 0.25
	        switch phase
	        {
	            case 0:
	                if place_meeting(x, y, playerLoopObject)
	                {
	                    if ((playerLoopObject.ground == 1) && (playerLoopObject.bbox_bottom <= ((y - sprite_get_yoffset(sprite_index)) + 8)) && (playerLoopObject.bbox_left <= sprite_get_xcenter()))
	                    {
	                        phase = 1
	                        timer = 0
	                    }
	                }
	                if (!instance_exists(topSolidID))
	                {
	                    topSolidID = instance_create((x - sprite_get_xoffset(sprite_index)), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                break
	            case 1:
	                if (!instance_exists(topSolidID))
	                {
	                    topSolidID = instance_create((x - sprite_get_xoffset(sprite_index)), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                timer += (1)
	                if ((timer >= waitTimerMax))
	                {
	                    timer = 0
	                    phase = 2
	                    image_index = 5
	                    if instance_exists(topSolidID)
	                    {
	                        with (topSolidID)
	                            instance_destroy()
	                    }
	                }
	                break
	            case 2:
	                image_speed = ((-switchSpeed))
	                if ((image_index <= (1 - image_speed)))
	                {
	                    image_index = 1
	                    phase = 3
	                    topSolidID = instance_create(((x - sprite_get_xoffset(sprite_index)) + 31), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                break
	            case 3:
	                if place_meeting(x, y, playerLoopObject)
	                {
	                    if ((playerLoopObject.ground == 1) && (playerLoopObject.bbox_bottom <= ((y - sprite_get_yoffset(sprite_index)) + 8)) && (playerLoopObject.bbox_right >= sprite_get_xcenter()))
	                    {
	                        phase = 4
	                        timer = 0
	                    }
	                }
	                if (!instance_exists(topSolidID))
	                {
	                    topSolidID = instance_create(((x - sprite_get_xoffset(sprite_index)) + 31), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                break
	            case 4:
	                if (!instance_exists(topSolidID))
	                {
	                    topSolidID = instance_create(((x - sprite_get_xoffset(sprite_index)) + 31), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                timer += (1)
	                if ((timer >= waitTimerMax))
	                {
	                    timer = 0
	                    phase = 5
	                    image_index = 2
	                    if instance_exists(topSolidID)
	                    {
	                        with (topSolidID)
	                            instance_destroy()
	                    }
	                }
	                break
	            case 5:
	                image_speed = (switchSpeed)
	                if ((image_index >= (5 - image_speed)))
	                {
	                    image_index = 5
	                    phase = 0
	                    topSolidID = instance_create((x - sprite_get_xoffset(sprite_index)), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
	                    topSolidID.image_xscale = 1.1875
	                }
	                break
	        }
		}
    }
    else
    {
        if ((dead == 1))
        {
            if instance_exists(topSolidID)
            {
                with (topSolidID)
                    instance_destroy()
            }
            animTimer = 0
            timer = 0
            if ((image_xscale == -1))
            {
                phase = 0
                image_index = 5
            }
            else
            {
                phase = 3
                image_index = 0
            }
        }
        image_speed = 0
    }
}
else
    image_speed = 0
