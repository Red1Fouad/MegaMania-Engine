if (instance_exists(objFadeout)) exit;

var menu_actions = [
    rmPlayerSelect,         // "NEW GAME"
    rmKeyConfig,    // "KEY CONFIG"
    rmJoyConfig,    // "GAMEPAD CONFIG"
    rmDisclaimer    // "BACK"
];

if global.keyUpPressed {
    selected = (selected - 1 + num_menu_items) mod num_menu_items;
    playSFX(sfxMenuMove);
}
else if global.keyDownPressed {
    selected = (selected + 1) mod num_menu_items;
    playSFX(sfxMenuMove);
}
else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {
    playSFX(sfxMenuSelect);            
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    ID.myRoom = menu_actions[selected];
}
