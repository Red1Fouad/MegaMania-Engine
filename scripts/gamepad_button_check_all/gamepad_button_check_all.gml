// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_button_check_all(){
	/// gamepad_button_check_all() : Returns currently pressed button (any)
	for ( var i = gp_face1; i < gp_axisrv; i++ ) {
	    if ( gamepad_button_check_any( i ) ) return i;
	}
	return false;
}