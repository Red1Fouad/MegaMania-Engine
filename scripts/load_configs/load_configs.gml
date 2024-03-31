// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_configs(){
	/// load_configs()

	var map = ds_map_secure_load("config.dat");

	if map > -1 {

	    //Keys P1
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
		selectkey = ds_map_find_value(map, "selectkey");
		
		//Keys P2
	    leftKey2 = ds_map_find_value(map, "leftKey2");
	    rightKey2 = ds_map_find_value(map, "rightKey2");
	    upKey2 = ds_map_find_value(map, "upKey2");
	    downKey2 = ds_map_find_value(map, "downKey2");
	    jumpKey2 = ds_map_find_value(map, "jumpKey2");
	    shootKey2 = ds_map_find_value(map, "shootKey2");
	    slideKey2 = ds_map_find_value(map, "slideKey2");
	    pauseKey2 = ds_map_find_value(map, "pauseKey2");
	    weaponSwitchLeftKey2 = ds_map_find_value(map, "weaponSwitchLeftKey2");
	    weaponSwitchRightKey2 = ds_map_find_value(map, "weaponSwitchRightKey2");
		selectkey2 = ds_map_find_value(map, "selectkey2");
    
	    //Buttons P1
	    leftButton = ds_map_find_value(map, "leftButton");
	    rightButton = ds_map_find_value(map, "rightButton");
	    upButton = ds_map_find_value(map, "upButton");
	    downButton = ds_map_find_value(map, "downButton");
	    jumpButton = ds_map_find_value(map, "jumpButton");
	    shootButton = ds_map_find_value(map, "shootButton");
	    slideButton = ds_map_find_value(map, "slideButton");
	    weaponSwitchLeftButton = ds_map_find_value(map, "weaponSwitchLeftButton");
	    weaponSwitchRightButton = ds_map_find_value(map, "weaponSwitchRightButton");
		
		//Buttons P2
		leftButton2 = ds_map_find_value(map, "leftButton2");
		rightButton2 = ds_map_find_value(map, "rightButton2");
		upButton2 = ds_map_find_value(map, "upButton2");
		downButton2 = ds_map_find_value(map, "downButton2");
		jumpButton2 = ds_map_find_value(map, "jumpButton2");
		shootButton2 = ds_map_find_value(map, "shootButton2");
		slideButton2 = ds_map_find_value(map, "slideButton2");
		weaponSwitchLeftButton2 = ds_map_find_value(map, "weaponSwitchLeftButton2");
		weaponSwitchRightButton2 = ds_map_find_value(map, "weaponSwitchRightButton2");


	}

}