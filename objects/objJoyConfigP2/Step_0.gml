if (instance_exists(objFadeout)) exit;
deviceID = global.deviceID[playerID-1];
key[0] = objGlobalControl.leftButton2;
key[1] = objGlobalControl.rightButton2;
key[2] = objGlobalControl.upButton2;
key[3] = objGlobalControl.downButton2;
key[4] = objGlobalControl.jumpButton2;
key[5] = objGlobalControl.shootButton2;
key[6] = objGlobalControl.weaponSwitchLeftButton2;
key[7] = objGlobalControl.weaponSwitchRightButton2;
key[8] = objGlobalControl.slideButton2;

if !waiting {
	countdown = 10000;
    if global.keyUpPressed || global.keyUp2Pressed {
        selected--;
        if selected < 0 {
            selected = num_menu_items - 1;
        }
        playSFX(sfxMenuMove);
    }
    else if global.keyDownPressed || global.keyDown2Pressed {
        selected++;
        if selected >= num_menu_items {
            selected = 0;
        }
        playSFX(sfxMenuMove);
    }
    else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed || global.keyPause2Pressed || global.keyJump2Pressed || global.keyShoot2Pressed {
        switch menu[selected] {
            case "RESET":
                reset_keys();
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
	countdown -= 50;
    if (countdown <= 0) {
		countdown = 10000;
        waiting = false;
    }
    var button = gamepad_button_check_pressed_all();
    if button != false {
        switch selected {
            case 0: objGlobalControl.leftButton2 = button; break;
            case 1: objGlobalControl.rightButton2 = button; break;
            case 2: objGlobalControl.upButton2 = button; break;
            case 3: objGlobalControl.downButton2 = button; break;
            case 4: objGlobalControl.jumpButton2 = button; break;
            case 5: objGlobalControl.shootButton2 = button; break;
            case 6: objGlobalControl.weaponSwitchLeftButton2 = button; break;
            case 7: objGlobalControl.weaponSwitchRightButton2 = button; break;
            case 8: objGlobalControl.slideButton2 = button; break;
        }
        waiting = false;
        save_configs();
    }
}