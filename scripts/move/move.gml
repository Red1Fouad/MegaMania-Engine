// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move(){
	/// move(xs, ys)
	var xs = argument0;
	var ys = argument1;

	var canMoveH = place_free(x + xs, y);
	if (place_meeting(x+xs,y,prtSlope) and ground) {
	    canMoveH = true;
	}

	if canMoveH {
	    x += xs;
	    if (ground) {
	        doSlopePhysics(xs,ys);
	    }
	}

	if place_free(x, y + ys) {
	    y += ys;
	}
}