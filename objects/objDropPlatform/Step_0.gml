event_inherited();

if global.frozen == false && dead == false
{
	for (var playerCounter = 1; playerCounter <= instance_number(objMegaman); playerCounter++)
	{
		var playerLoopObject = instance_find(objMegaman, (playerCounter - 1))
	    switch phase
	    {
	        //Idle
	        case 0:
	            if place_meeting(x, y-1, playerLoopObject)
	            {
	                if playerLoopObject.ground == true && playerLoopObject.bbox_bottom <= bbox_top//+global.yspeed[global.playerID]
	                && collision_rectangle(playerLoopObject.bbox_left, playerLoopObject.bbox_bottom, playerLoopObject.bbox_right, playerLoopObject.bbox_bottom+1, prtMovingPlatformSolid, false, true) < 0
	                && collision_rectangle(playerLoopObject.bbox_left, playerLoopObject.bbox_bottom, playerLoopObject.bbox_right, playerLoopObject.bbox_bottom+1, prtMovingPlatformJumpthrough, false, true) < 0
	                {
	                    phase = 1;
	                    timer = 0;
	                }
	            }
	        break;
        
        
	        //Preparing to drop down
	        case 1:
	            timer += 1;
	            if timer >= dropTimerMax
	            {
	                timer = 0;
	                phase = 2;
	            }
	        break;
        
        
	        //Dropping down animation
	        case 2:
	            timer += 1;
	            if timer mod 3 == 1
	            {
	                image_index += 1;
	                if image_index == 4
	                {
	                    with topSolidID instance_destroy();
	                    phase = 3;
	                    timer = 0;
	                }
	            }
	        break;
        
        
	        //Dropped down
	        case 3:
	            timer += 1;
	            if timer >= rebuildTimerMax
	            {
	                timer = 0;
	                phase = 4;
	            }
	        break;
        
        
	        //Rebuilding animation
	        case 4:
	            timer += 1;
	            if timer == 1
	            {
	                topSolidID = instance_create(x-16, y, objTopSolid);
	                    topSolidID.image_xscale = 2;
	            }
            
	            if timer mod 3 == 1
	            {
	                image_index -= 1;
	                if image_index == 0
	                {
	                    timer = 0;
	                    phase = 0;
	                }
	            }
	        break;
	    }
	}
}
