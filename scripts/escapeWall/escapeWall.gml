// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function escapeWall(){
	/// escapeWall(): avoids getting stuck into walls

	amount = 1;
	while !place_free(x, y) {
	    if place_free(x-amount, y) {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the left");
	        x -= amount;
	    }
	    else if place_free(x+amount, y) {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the right");
	        x += amount;
	    }
	    else if place_free(x, y-amount) {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel up");
	        y -= amount;
	    }
	    else if place_free(x, y+amount) {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel down");
	        y += amount;
	    }
	    else {
	        amount++;
	    }
	}


	if debug_mode && position_meeting(x, y+5, objSolid) {
	    //show_error("Stuck!", false);
	    show_debug_message("Stuck!");
	}

	if debug_mode && place_meeting(x, y, objSolid) {
	    //show_error("Stuck!", false);
	    show_debug_message("Stuck!?");
	}
}