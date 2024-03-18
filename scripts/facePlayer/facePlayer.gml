// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function facePlayer(){
	if instance_exists(objMegaman)
	{
        if ((sprite_get_xcenter() < sprite_get_xcenter_object(getTarget())))
            image_xscale = 1
        else
            image_xscale = -1
	}
}