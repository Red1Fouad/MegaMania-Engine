/// @function playerCollision
/// @description Handles the player's collision code
function playerCollision() {


	//Floor
	var mySolid = instance_place(x, y+global.yspeed[playerID], objSolid);
	if mySolid >= 0 && global.yspeed[playerID] > 0
	{
		var ind = object_get_parent(mySolid.object_index);
	    if ind == prtSlope {
	        y = mySolid.bbox_bottom;
	        while place_meeting(x, y, mySolid) {
	            y--;
	        }
	    }
    else {
        y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
    }
	    ground = true;
	    global.yspeed[playerID] = 0;
    
	    if playLandSound == true
	        playSFX(sfxLand);
    
	    //Note: there used to be a system here that set MM's sprite to the walking sprite when landing
	    //However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
	    //Therefore, it has been removed
	}


	//Wall
	mySolid = instance_place(x+global.xspeed[playerID], y, objSolid);
	if mySolid >= 0 && global.xspeed[playerID] != 0 {
	    var ind = object_get_parent(mySolid.object_index);
	    var ignore = ind == prtSlope;
	    if (!ignore) {
	        if (place_meeting(x+global.xspeed[playerID],y,prtSlope)) {ignore = true;}
	    }
    
	    if (!ignore) {
	        if global.xspeed[playerID] < 0
	            x = mySolid.x + mySolid.sprite_width + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
	        else
	            x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
            
	        global.xspeed[playerID] = 0;
	    }
	}


	//Ceiling
	mySolid = instance_place(x, y+global.yspeed[playerID], objSolid);
	if mySolid >= 0 && global.yspeed[playerID] < 0
	{
		y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
    
	    //For some reason, the code above would work correctly half the time, but clip MM inside the ceiling the other half
	    //This while-loop fixes the issue by forcing MM out of the ceiling
	    while place_meeting(x, y, mySolid)
	        y += 1;
		
	    global.yspeed[playerID] = 0;
	}


	//Topsolids
	mySolid = instance_place(x, y+global.yspeed[playerID], objTopSolid);
	if mySolid >= 0 && global.yspeed[playerID] > 0
	{
	    if !place_meeting(x, y, mySolid)
	    {
	        y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	        ground = true;
	        global.yspeed[playerID] = 0;
        
	        if playLandSound == true
	            playSFX(sfxLand);
	    }
	}


	//Spikes
	if !instance_exists(objSectionSwitcher)
	{
	    //Lots of extra checks to make solid collision take priority over spike collision
	    //What this means is that when jumping on a solid and spike at the same time, you won't die, unlike in Mega Engine 1.5
	    var wallOffset = 0;
	    if keyRight
	        wallOffset = 1;
	    else if keyLeft
	        wallOffset = -1;
        
	    var yDeduct;
	    if isSlide == false
	        yDeduct = sprite_get_bbox_top(mask_index);
	    else
	        yDeduct = 0;
        
	    //See if there are any solids (since spikes are also solid, we need to deactivate them first)
	    instance_deactivate_object(objSpike);
	    var onGround, onWall, onCeiling;
	    onGround = place_meeting(x, y+global.yspeed[playerID]+1, objSolid); //This is to make sure spikes directly next to floors are more fair (as in, you won't die immediately when touching them)
	    onWall = place_meeting(x+global.xspeed[playerID]+sign(global.xspeed[playerID]) + wallOffset, y, objSolid);
	    onCeiling = place_meeting(x, y+global.yspeed[playerID]-1 - yDeduct, objSolid);
	    instance_activate_object(objSpike);
        
	    if global.yspeed[playerID] != jumpSpeed
	        mySpikeFloor = instance_position(x, bbox_bottom+global.yspeed[playerID]+1, objSpike);
	    else
	        mySpikeFloor = instance_position(x, bbox_bottom+abs(global.yspeed[playerID])+1, objSpike);
	    mySpikeFloorLeft = instance_position(bbox_left, bbox_bottom+global.yspeed[playerID]+1, objSpike);
	    mySpikeFloorRight = instance_position(bbox_right, bbox_bottom+global.yspeed[playerID]+1, objSpike);
    
	    mySpikeWall = instance_place(x+global.xspeed[playerID]+sign(global.xspeed[playerID]) + wallOffset, y, objSpike);
    
	    mySpikeCeiling = instance_place(x, y+global.yspeed[playerID]-1 - yDeduct, objSpike);
    
	    if (((mySpikeFloor >= 0 || mySpikeFloorLeft >= 0 || mySpikeFloorRight >= 0) && onGround == false)
	     || (mySpikeWall >= 0 && onWall == false) || (mySpikeCeiling >= 0 && onCeiling == false)) && canHit == true
	    {
	        global._health[playerID] = 0;
	        exit;
	    }
	}

	escapeWall();
}
