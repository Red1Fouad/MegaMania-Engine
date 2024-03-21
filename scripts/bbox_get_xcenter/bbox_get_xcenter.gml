// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbox_get_xcenter(){
	return round((bbox_left + ((bbox_right - bbox_left) * 0.5)));
}