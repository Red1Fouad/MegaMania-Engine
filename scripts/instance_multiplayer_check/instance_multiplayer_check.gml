// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_multiplayer_check(){

		var _instance_count = 0;

		for (var i = 0; i < instance_number(argument0); i++) {
		    var instance = instance_find(argument0, i);
		    if (instance.playerID == playerID) {
		        _instance_count++;
		    }
		}
		if (_instance_count < argument1) {
		    return 1;
		}
		else
			return 0;

}

