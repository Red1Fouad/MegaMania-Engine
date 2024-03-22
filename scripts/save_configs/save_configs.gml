// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_configs(){

	///save_configs()
	var map = ds_map_create();

	//Keys P1
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
	
	//Keys P2
	ds_map_add(map, "leftKey2", objGlobalControl.leftKey2);
	ds_map_add(map, "rightKey2", objGlobalControl.rightKey2);
	ds_map_add(map, "upKey2", objGlobalControl.upKey2);
	ds_map_add(map, "downKey2", objGlobalControl.downKey2);
	ds_map_add(map, "jumpKey2", objGlobalControl.jumpKey2);
	ds_map_add(map, "shootKey2", objGlobalControl.shootKey2);
	ds_map_add(map, "slideKey2", objGlobalControl.slideKey2);
	ds_map_add(map, "pauseKey2", objGlobalControl.pauseKey2);
	ds_map_add(map, "weaponSwitchLeftKey2", objGlobalControl.weaponSwitchLeftKey2);
	ds_map_add(map, "weaponSwitchRightKey2", objGlobalControl.weaponSwitchRightKey2);

	//Buttons P1
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
	
	//Buttons P2
	ds_map_add(map, "leftButton2", objGlobalControl.leftButton2);
	ds_map_add(map, "rightButton2", objGlobalControl.rightButton2);
	ds_map_add(map, "upButton2", objGlobalControl.upButton2);
	ds_map_add(map, "downButton2", objGlobalControl.downButton2);
	ds_map_add(map, "jumpButton2", objGlobalControl.jumpButton2);
	ds_map_add(map, "shootButton2", objGlobalControl.shootButton2);
	ds_map_add(map, "slideButton2", objGlobalControl.slideButton2);
	ds_map_add(map, "pauseButton2", objGlobalControl.pauseButton2);
	ds_map_add(map, "weaponSwitchLeftButton2", objGlobalControl.weaponSwitchLeftButton2);
	ds_map_add(map, "weaponSwitchRightButton2", objGlobalControl.weaponSwitchRightButton2);


	ds_map_secure_save(map, "config.dat");

}