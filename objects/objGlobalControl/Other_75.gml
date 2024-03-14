show_debug_message("Event = " + async_load[? "event_type"]);        // Debug cocde so you can see which event has been
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   // triggered and the pad associated with it.

if async_load[? "event_type"] == "gamepad discovered" {
    global.GP = async_load[? "pad_index"];
    show_debug_message("Default gamepad set to " + string(global.GP), "connected:", gamepad_is_connected(global.GP));
}