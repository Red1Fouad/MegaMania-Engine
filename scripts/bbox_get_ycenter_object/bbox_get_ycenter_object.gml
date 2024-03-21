// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbox_get_ycenter_object(){
	var v;
	v = argument0
	return round((v.bbox_top + ((v.bbox_bottom - v.bbox_top) * 0.5)));

}