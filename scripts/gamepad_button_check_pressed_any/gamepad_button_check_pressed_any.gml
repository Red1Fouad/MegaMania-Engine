// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_button_check_pressed_any(){
	/// gamepad_button_check_pressed_any(button)
	var button = argument0;

	var result = false;
	if gamepad_is_connected(deviceID) {
	    result = result || gamepad_button_check_pressed(deviceID, button);
	}
	
	return result;
}