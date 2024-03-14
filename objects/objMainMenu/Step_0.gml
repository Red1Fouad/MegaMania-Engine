if (instance_exists(objFadeout)) exit;

if global.keyUpPressed {
    selected--;
    if selected < 0 {
        selected = num_menu_items - 1;
    }
    playSFX(sfxMenuMove);
}
else if global.keyDownPressed {
    selected++;
    if selected >= num_menu_items {
        selected = 0;
    }
    playSFX(sfxMenuMove);
}
else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {
    playSFX(sfxMenuSelect);            
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    switch menu[selected] {
        case "NEW GAME":
            ID.myRoom = rmTest;       
        break;
        case "KEY CONFIG":
            ID.myRoom = rmKeyConfig;
        break;
        case "GAMEPAD CONFIG":
            ID.myRoom = rmJoyConfig;
        break;
        case "BACK":
            ID.myRoom = rmDisclaimer;
        break;
        default:
            ID.myRoom = room;
    }
}