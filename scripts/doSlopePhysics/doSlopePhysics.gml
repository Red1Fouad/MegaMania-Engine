// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doSlopePhysics(){
	///doSlopePhysics(xs,ys)
	var xs = argument0;
	var ys = argument1;
	
	if (place_meeting(x,y,prtSlope)) {
	    if (!place_meeting(x,y-cfgMaxStep,prtSlope)) {
	        while (place_meeting(x,y,prtSlope)) {y--;}
	    }
	}
	else if (place_meeting(x,y+cfgMaxStep+1,prtSlope) or place_meeting(x-xs,y+cfgMaxStep+1,prtSlope)) {
	    var i = 0;
	    for (i = 0; i < cfgMaxStep and !place_meeting(x,y+1,objSolid); i++) {
	        y++;
	    }
	    if (i >= cfgMaxStep) {y -= i;}
	}
}