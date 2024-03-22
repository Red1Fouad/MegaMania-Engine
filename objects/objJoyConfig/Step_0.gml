if (instance_exists(objFadeout)) exit;

key[0] = objGlobalControl.leftButton;
key[1] = objGlobalControl.rightButton;
key[2] = objGlobalControl.upButton;
key[3] = objGlobalControl.downButton;
key[4] = objGlobalControl.jumpButton;
key[5] = objGlobalControl.shootButton;
key[6] = objGlobalControl.weaponSwitchLeftButton;
key[7] = objGlobalControl.weaponSwitchRightButton;
key[8] = objGlobalControl.pauseButton;
key[9] = objGlobalControl.slideButton;

if !waiting {
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
        switch menu[selected] {
            case "RESET":
                reset_buttons();
                save_configs();
                break;
            case "BACK":
                playSFX(sfxMenuSelect);            
                var ID = instance_create(0, 0, objFadeout);
                ID.type = "room";
                ID.myRoom = rmJoyMenu;
                break;
            default:
                playSFX(sfxMenuSelect);
                waiting = true;
        }
    }
}
else {  //Set button
    var button = gamepad_button_check_pressed_all();
    if button != false {
        switch selected {
            case 0: objGlobalControl.leftButton = button; break;
            case 1: objGlobalControl.rightButton = button; break;
            case 2: objGlobalControl.upButton = button; break;
            case 3: objGlobalControl.downButton = button; break;
            case 4: objGlobalControl.jumpButton = button; break;
            case 5: objGlobalControl.shootButton = button; break;
            case 6: objGlobalControl.weaponSwitchLeftButton = button; break;
            case 7: objGlobalControl.weaponSwitchRightButton = button; break;
            case 8: objGlobalControl.pauseButton = button; break;
            case 9: objGlobalControl.slideButton = button; break;
        }
        waiting = false;
        save_configs();
    }
}