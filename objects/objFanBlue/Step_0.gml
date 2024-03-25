var partWidth, i, boxLeft, boxRight, yDist;
event_inherited()
if !dead
{
    if ((!instance_exists(solidID)) || (solidID == -20))
    {
        if ((image_yscale == 1) && (alarm[0] < 0))
        {
            solidID = instance_create((x - 16), y, objSolid)
            solidID.image_xscale = 2
        }
        else if ((image_yscale == -1) && (alarm[0] < 0))
        {
            solidID = instance_create((x - 16), (y - 16), objSolid)
            solidID.image_xscale = 2
        }
    }
}
if !global.frozen && !dead
{
	for (var playerCounter = 1; playerCounter <= instance_number(objMegaman); playerCounter++)
	{
		var playerLoopObject = instance_find(objMegaman, (playerCounter - 1))
		
	    if instance_exists(objBossDeathTimer)
	        image_speed = 0
	    else
	        image_speed = (0.5)
	    if insideViewBox()
	    {
	        partWidth = 8
	        i = bbox_left
	        while ((i < bbox_right))
	        {
	            boxLeft = i
	            boxRight = (i + partWidth)
	            yDist = 16
	            if ((image_yscale == 1))
	            {
	                while ((!(collision_rectangle(boxLeft, ((y - yDist) + 1), boxRight, ((y - yDist) + 15), objSolid, 0, 0))) && (!(collision_rectangle(boxLeft, ((y - yDist) + 1), boxRight, ((y - yDist) + 15), prtMovingPlatformSolid, 0, 0))) && (yDist < 128))
	                    yDist += 8
	                if (collision_rectangle(boxLeft, (bbox_top - yDist), boxRight, bbox_top, playerLoopObject, 0, 0) && (!instance_exists(objBossDeathTimer)) && (playerLoopObject.climbing == 0) && (playerLoopObject.affectedByFan == 0))
	                {
	                    if ((affectingPlayer == 0))
	                    {
	                        affectingPlayer = 1
	                        soundTimer = 0
	                        if ((!audio_is_playing(sfxFanStart)) && (!audio_is_playing(sfxFanLoop)))
	                            playSFX(sfxFanStart)
	                    }
	                    soundTimer += 1
	                    if (((soundTimer >= 30) || (!audio_is_playing(sfxFanStart))) && (!audio_is_playing(sfxFanLoop)))
	                    {
	                        audio_stop_sound(sfxFanStart)
	                        loopSFX(sfxFanLoop)
	                    }
	                    if ((playerLoopObject.ground == 1))
	                    {
	                        with (playerLoopObject)
	                            y -= 1
	                    }
	                    playerLoopObject.affectedByFan = 1
	                    canProceed = 1
	                    with (playerLoopObject)
	                    {
	                        if (place_meeting(x, (y - 2), objSolid) || place_meeting(x, (y - 2), prtMovingPlatformSolid))
	                        {
	                            other.canProceed = 0
	                            y -= 1
	                            y = floor(y)
	                            while (place_meeting(x, (y - 1), objSolid) || place_meeting(x, (y - 1), prtMovingPlatformSolid))
	                                y++
	                            global.yspeed[playerLoopObject.playerID] = 0
	                        }
	                    }
	                    playerLoopObject.canMinJump = 0
	                    if ((canProceed == 1))
	                    {
	                        global.yspeed[playerLoopObject.playerID] -= (0.32500000000000001)
	                        if ((global.yspeed[playerLoopObject.playerID] < -4))
	                            global.yspeed[playerLoopObject.playerID] = -4
	                    }
	                    break
	                }
	                else
	                {
	                    if ((i >= (bbox_right - partWidth)))
	                    {
	                        affectingPlayer = 0
	                        if ((soundTimer > 0))
	                        {
	                            soundTimer = 0
	                            audio_stop_sound(sfxFanStart)
	                            audio_stop_sound(sfxFanLoop)
	                        }
	                    }
	                    i += partWidth
	                    continue
	                }
	            }
	            else
	            {
	                while ((!(collision_rectangle(boxLeft, ((y + (yDist * 2)) - 15), boxRight, ((y + (yDist * 2)) - 1), objSolid, 0, 0))) && (!(collision_rectangle(boxLeft, ((y + (yDist * 2)) - 15), boxRight, ((y + (yDist * 2)) - 1), prtMovingPlatformSolid, 0, 0))) && (yDist < 128))
	                    yDist += 8
	                if (collision_rectangle(boxLeft, bbox_bottom, boxRight, (bbox_bottom + yDist), playerLoopObject, 0, 0) && (!instance_exists(objBossDeathTimer)) && (playerLoopObject.climbing == 0) && (playerLoopObject.affectedByFan == 0))
	                {
	                    if ((affectingPlayer == 0))
	                    {
	                        affectingPlayer = 1
	                        soundTimer = 0
	                        if ((!audio_is_playing(sfxFanStart)) && (!audio_is_playing(sfxFanLoop)))
	                            playSFX(sfxFanStart)
	                    }
	                    soundTimer += 1
	                    if (((soundTimer >= 30) || (!audio_is_playing(sfxFanStart))) && (!audio_is_playing(sfxFanLoop)))
	                    {
	                        audio_stop_sound(sfxFanStart)
	                        loopSFX(sfxFanLoop)
	                    }
	                    if ((playerLoopObject.ground == 1))
	                    {
	                        with (playerLoopObject)
	                            y -= 1
	                    }
	                    playerLoopObject.affectedByFan = 1
	                    canProceed = 1
	                    with (playerLoopObject)
	                    {
	                        if (place_meeting(x, (y + 2), objSolid) || place_meeting(x, (y + 2), prtMovingPlatformSolid))
	                        {
	                            other.canProceed = 0
	                            y += 1
	                            y = ceil(y)
	                            global.yspeed[playerLoopObject.playerID] = 0
	                        }
	                    }
	                    playerLoopObject.canMinJump = 0
	                    if ((canProceed == 1))
	                    {
	                        global.yspeed[playerLoopObject.playerID] += (0.32500000000000001)
	                        if ((global.yspeed[playerLoopObject.playerID] > 9))
	                            global.yspeed[playerLoopObject.playerID] = 9
	                    }
	                    break
	                }
	                else
	                {
	                    if ((i >= (bbox_right - partWidth)))
	                    {
	                        affectingPlayer = 0
	                        if ((soundTimer > 0))
	                        {
	                            soundTimer = 0
	                            audio_stop_sound(sfxFanStart)
	                            audio_stop_sound(sfxFanLoop)
	                        }
	                    }
	                    i += partWidth
	                    continue
	                }
	            }
	        }
	    }
	    else
	    {
	        affectingPlayer = 0
	        if ((soundTimer > 0))
	        {
	            soundTimer = 0
	            audio_stop_sound(sfxFanStart)
	            audio_stop_sound(sfxFanLoop)
	        }
	    }
	}
}
else
{
    image_speed = 0
    if ((dead == 1))
    {
        if (instance_exists(solidID) && (solidID != -20))
        {
            with (solidID)
                instance_destroy()
        }
        affectingPlayer = 0
        soundTimer = 0
    }
}
