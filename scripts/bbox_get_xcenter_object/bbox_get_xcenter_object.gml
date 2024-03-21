// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbox_get_xcenter_object(){
	var v;
	v = argument0
	return round((v.bbox_left + ((v.bbox_right - v.bbox_left) * 0.5)));

}