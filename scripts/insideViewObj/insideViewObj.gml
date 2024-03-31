function insideViewObj(obj){
	if sprite_get_xcenter_object(obj) >= global.viewX && sprite_get_xcenter_object(obj) < global.viewX+global.viewWidth
	&& sprite_get_ycenter_object(obj) >= global.viewY && sprite_get_ycenter_object(obj) < global.viewY+global.viewHeight
	    return true;
	else
	    return false;
}