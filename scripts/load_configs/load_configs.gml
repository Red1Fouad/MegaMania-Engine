// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_configs(){
	/// load_configs()

	var map = ds_map_secure_load("config.dat");

	if map > -1 {

	    //Keys
	    leftKey = ds_map_find_value(map, "leftKey");
	    rightKey = ds_map_find_value(map, "rightKey");
	    upKey = ds_map_find_value(map, "upKey");
	    downKey = ds_map_find_value(map, "downKey");
	    jumpKey = ds_map_find_value(map, "jumpKey");
	    shootKey = ds_map_find_value(map, "shootKey");
	    slideKey = ds_map_find_value(map, "slideKey");
	    pauseKey = ds_map_find_value(map, "pauseKey");
	    weaponSwitchLeftKey = ds_map_find_value(map, "weaponSwitchLeftKey");
	    weaponSwitchRightKey = ds_map_find_value(map, "weaponSwitchRightKey");
    
	    //Buttons
	    leftButton = ds_map_find_value(map, "leftButton");
	    rightButton = ds_map_find_value(map, "rightButton");
	    upButton = ds_map_find_value(map, "upButton");
	    downButton = ds_map_find_value(map, "downButton");
	    jumpButton = ds_map_find_value(map, "jumpButton");
	    shootButton = ds_map_find_value(map, "shootButton");
	    slideButton = ds_map_find_value(map, "slideButton");
	    pauseButton = ds_map_find_value(map, "pauseButton");
	    weaponSwitchLeftButton = ds_map_find_value(map, "weaponSwitchLeftButton");
	    weaponSwitchRightButton = ds_map_find_value(map, "weaponSwitchRightButton");

	}

}