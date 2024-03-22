function checkRoomChange(){
/// scr_CheckRoomChange()
// This script checks if the current room is different from the previous room.
// Returns: true if the room has changed, false if it's the same.

var previous_room;

// Check if the previous room variable exists
if (!variable_global_exists("previous_room")) {
    // If it doesn't exist, initialize it with the current room
    previous_room = room_get_name(room);
    global.previous_room = previous_room;
} else {
    // If it exists, compare it with the current room
    previous_room = global.previous_room;
}

var current_room = room_get_name(room);

// Check if the current room is different from the previous room
if (current_room != previous_room) {
    // Room has changed
    show_debug_message("Room has changed from " + string(previous_room) + " to " + string(current_room));
    // Update the previous room variable to the current room
    global.previous_room = current_room;
    return true;
} else {
    // Room hasn't changed
    show_debug_message("Still in the same room: " + string(current_room));
    return false;
}

}