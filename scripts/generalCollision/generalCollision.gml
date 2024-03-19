/// @function generalCollision
/// @description Handles a general object's collision code
function generalCollision() {

	var colliding = !place_free(x, y);

	//Floor
	var mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 and yspeed > 0 and !colliding {
	    var ind = object_get_parent(mySolid.object_index);
	    if ind == prtSlope {
	        y = mySolid.bbox_bottom;
	        if (!place_meeting(x,y,mySolid)) {
	            while (!place_meeting(x,y,mySolid)) {y--;}
	        }
	    }
	    else {
	        y = mySolid.bbox_top;
	    }
	        while place_meeting(x, y, mySolid)
	            y -= 1;
    
	    //y = mySolid.y - (sprite_height - sprite_yoffset);
	    ground = true;
	    yspeed = 0;
	}


	//Wall
	mySolid = instance_place(x+xspeed, y, objSolid);
	if mySolid >= 0 && xspeed != 0 && !colliding {    
	    var ind = object_get_parent(mySolid.object_index);
	    var ignore = ind == prtSlope;
	    if (!ignore) {
	        if (place_meeting(x+xspeed,y,prtSlope)) {ignore = true;}
	    }
    
	    if (!ignore) {
	        if xspeed < 0
	            x = mySolid.x + mySolid.sprite_width + (x - (bbox_left-1));
	        else
	            x = mySolid.x - (bbox_right+1 - x) - 1;
            
	        xspeed = 0;
	    }
	}


	//Ceiling
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed < 0
	{
	    y = mySolid.y + 16 + (y - (bbox_top-1));
	    yspeed = 0;
	}


	//Topsolids
	mySolid = instance_place(x, y+yspeed, objTopSolid);
	if mySolid >= 0 && yspeed > 0
	{
	    if !place_meeting(x, y, objTopSolid)
	    {
	        y = mySolid.y - (bbox_bottom+1 - y);
	        ground = true;
	        yspeed = 0;
	    }
	}


	//Floor (moving platform)
	var mySolid;
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && yspeed > 0
	{
	    if mySolid.object_index != objRushJet
	    {
	        y = mySolid.bbox_top;
	        while place_meeting(x, y, mySolid)
	            y -= 1;
	        ground = true;
	        yspeed = 0;
	    }
	}


	//Wall (moving platform)
	mySolid = instance_place(x+xspeed, y, prtMovingPlatformSolid);
	if mySolid >= 0 && xspeed != 0
	{    
	    if mySolid.object_index != objRushJet
	    {
	        if xspeed < 0
	            x = mySolid.bbox_right + (x - (bbox_left-1));
	        else
	            x = mySolid.bbox_left - (bbox_right+1 - x) - 1;
            
	        xspeed = 0;
	    }
	}


	//Ceiling (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
	if mySolid >= 0 && yspeed < 0
	{
	    if mySolid.object_index != objRushJet
	    {
	        y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index);
	        yspeed = 0;
	    }
	}


	//Topsolids (moving platform)
	mySolid = instance_place(x, y+yspeed, prtMovingPlatformJumpthrough);
	if mySolid >= 0 && yspeed > 0
	{
	    if mySolid.object_index != objRushJet
	    {
	        if !place_meeting(x, y, mySolid)
	        {
	            y = mySolid.bbox_top - (bbox_bottom+1 - y);
	            ground = true;
	            yspeed = 0;
	        }
	    }
	}


}
