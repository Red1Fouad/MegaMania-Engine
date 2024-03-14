// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_keys(){
	/// reset_keys()

	//Keys
	with objGlobalControl
	{
		leftKey = vk_left;
		rightKey = vk_right;
		upKey = vk_up;
		downKey = vk_down;
		jumpKey = ord("Z");
		shootKey = ord("X");
		slideKey = ord("C");
		pauseKey = vk_space;
		weaponSwitchLeftKey = ord("A");
		weaponSwitchRightKey = ord("S");
	}
}