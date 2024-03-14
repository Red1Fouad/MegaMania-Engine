// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_button_check_any(){

	/// gamepad_button_check_any(button)
	var button = argument0;

	var gp_num = gamepad_get_device_count();
	var result = false;
	for (var i = 0; i < gp_num; i++) {
	    if gamepad_is_connected(i) {
	        result = result || gamepad_button_check(i, button);
	    }
	}
	return result;

}