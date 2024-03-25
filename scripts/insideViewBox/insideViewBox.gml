// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function insideViewBox(){

	return ((bbox_right > global.viewX) && (bbox_left < (global.viewX + global.viewWidth)) && (bbox_bottom > global.viewY) && (bbox_top < (global.viewY + global.viewHeight)));

}