// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_configs(){

	///save_configs()
	var map = ds_map_create();

	//Keys
	ds_map_add(map, "leftKey", objGlobalControl.leftKey);
	ds_map_add(map, "rightKey", objGlobalControl.rightKey);
	ds_map_add(map, "upKey", objGlobalControl.upKey);
	ds_map_add(map, "downKey", objGlobalControl.downKey);
	ds_map_add(map, "jumpKey", objGlobalControl.jumpKey);
	ds_map_add(map, "shootKey", objGlobalControl.shootKey);
	ds_map_add(map, "slideKey", objGlobalControl.slideKey);
	ds_map_add(map, "pauseKey", objGlobalControl.pauseKey);
	ds_map_add(map, "weaponSwitchLeftKey", objGlobalControl.weaponSwitchLeftKey);
	ds_map_add(map, "weaponSwitchRightKey", objGlobalControl.weaponSwitchRightKey);

	//Buttons
	ds_map_add(map, "leftButton", objGlobalControl.leftButton);
	ds_map_add(map, "rightButton", objGlobalControl.rightButton);
	ds_map_add(map, "upButton", objGlobalControl.upButton);
	ds_map_add(map, "downButton", objGlobalControl.downButton);
	ds_map_add(map, "jumpButton", objGlobalControl.jumpButton);
	ds_map_add(map, "shootButton", objGlobalControl.shootButton);
	ds_map_add(map, "slideButton", objGlobalControl.slideButton);
	ds_map_add(map, "pauseButton", objGlobalControl.pauseButton);
	ds_map_add(map, "weaponSwitchLeftButton", objGlobalControl.weaponSwitchLeftButton);
	ds_map_add(map, "weaponSwitchRightButton", objGlobalControl.weaponSwitchRightButton);

	ds_map_secure_save(map, "config.dat");

}