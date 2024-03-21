// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbox_get_ycenter(){
	return round((bbox_top + ((bbox_bottom - bbox_top) * 0.5)));
}