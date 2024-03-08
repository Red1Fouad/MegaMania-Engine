///More stable moving platform code!

event_inherited();

if global.frozen == false && dead == false
{
    x += xspeed;
    y += yspeed;
for (var playerCounter = 1; playerCounter <= instance_number(objMegaman); playerCounter++)
{
	var playerLoopObject = instance_find(objMegaman, (playerCounter - 1))
    // Push the player in the direction we're moving
    if place_meeting(x, y, playerLoopObject)
    {
        if playerLoopObject.teleporting == false && playerLoopObject.showReady == false
        {
            var leftDist, rightDist, upDist, downDist, attempts;
            leftDist = 0;
            rightDist = 0;
            upDist = 0;
            downDist = 0;
            
            attempts = 0;
            while place_meeting(x + leftDist, y, playerLoopObject) && attempts < 500
            {
                leftDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x - rightDist, y, playerLoopObject) && attempts < 500
            {
                rightDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x, y + upDist, playerLoopObject) && attempts < 500
            {
                upDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x, y - downDist, playerLoopObject) && attempts < 500
            {
                downDist += 1;
                attempts += 1;
            }
                
            var minDist;
            minDist = min(leftDist, rightDist, upDist, downDist);
            if minDist == upDist || (yspeed < 0 && abs(minDist - upDist) <= 3)
                playerLoopObject.y -= upDist;
            else if minDist == leftDist || (xspeed < 0 && abs(minDist - leftDist) <= 3)
                playerLoopObject.x -= leftDist;
            else if minDist == rightDist || (xspeed > 0 && abs(minDist - rightDist) <= 3)
                playerLoopObject.x += rightDist;
            else if minDist == downDist || (yspeed > 0 && abs(minDist - downDist) <= 3)
                playerLoopObject.y += downDist;
                
            // Crush the player if necessary
            with playerLoopObject
            {
                instance_deactivate_object(other.id);
                var movingPltfm, meetingPlatform;
                movingPltfm = collision_rectangle(bbox_left+2, bbox_top+2 - (isSlide * 2), bbox_right-2, bbox_bottom-2 + (isSlide * 2), prtMovingPlatformSolid, false, false);
                
                meetingPlatform = false;
                if movingPltfm >= 0
                {
                    if movingPltfm.dead == false
                        meetingPlatform = true;
                }
                
                if collision_rectangle(bbox_left+2, bbox_top+2 - (isSlide * 2), bbox_right-2, bbox_bottom + (isSlide * 2), objSolid, false, false) >= 0
                || meetingPlatform == true
                    global._health[playerID] = 0;
                instance_activate_object(other.id);
            }
        }
    }
    
    // If the player is standing on us, move them
    var checkYspeed;
    if yspeed > 0
        checkYspeed = yspeed;
    else
        checkYspeed = 0;
        
    if place_meeting(x, y - checkYspeed - 1, playerLoopObject)
    {
        if playerLoopObject.ground == true && playerLoopObject.bbox_bottom <= bbox_top + abs(yspeed) + abs(global.yspeed[playerID]) + 2
        && playerLoopObject.movedByPlatform == false && playerLoopObject.teleporting == false
        && playerLoopObject.showReady == false
        {
            with playerLoopObject
            {
                var proceed, xsp, ysp;
                proceed = true;
                xsp = other.xspeed;
                ysp = other.yspeed;
                
                instance_deactivate_object(other.id);
                if place_meeting(x + xsp, y + ysp, objSolid) || place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
                    proceed = false;
                instance_activate_object(other.id);
                
                if proceed == true
                {
                    movedByPlatform = true;
                    x += xsp;
                    y += ysp;
                    y = round(y);
                    
                    if ysp < 0
                    {
                        var origY, attempts;
                        origY = y;
                        attempts = 0;
                        while !place_meeting(x, y + 1, other.id) && attempts < 100
                        {
                            y += 1;
                            attempts += 1;
                        }
                        
                        if attempts >= 100
                            y = origY;
                    }
                    
                    var origY, attempts;
                    origY = y;
                    attempts = 0;
                    while place_meeting(x, y, other.id) && attempts < 100
                    {
                        y -= 1;
                        attempts += 1;
                    }
                    
                    if attempts >= 100
                        y = origY;
                    
                    ground = true;
                }
            }
        }
    }
}
}