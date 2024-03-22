if (instance_exists(objFadeout)) exit;

key[0] = objGlobalControl.leftKey2;
key[1] = objGlobalControl.rightKey2;
key[2] = objGlobalControl.upKey2;
key[3] = objGlobalControl.downKey2;
key[4] = objGlobalControl.jumpKey2;
key[5] = objGlobalControl.shootKey2;
key[6] = objGlobalControl.weaponSwitchLeftKey2;
key[7] = objGlobalControl.weaponSwitchRightKey2;
key[8] = objGlobalControl.pauseKey2;
key[9] = objGlobalControl.slideKey2;

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
                reset_keys();
                save_configs();
                break;
            case "BACK":
                playSFX(sfxMenuSelect);            
                var ID = instance_create(0, 0, objFadeout);
                ID.type = "room";
                ID.myRoom = rmKeyMenu;
                break;
            default:
                playSFX(sfxMenuSelect);
                waiting = true;
                keyboard_lastkey = -1;
        }
    }
}
else {  //Set key
    if keyboard_check_pressed(vk_anykey) and keyboard_lastkey != vk_escape {
        switch selected {
            case 0: objGlobalControl.leftKey2 = keyboard_lastkey; break;
            case 1: objGlobalControl.rightKey2 = keyboard_lastkey; break;
            case 2: objGlobalControl.upKey2 = keyboard_lastkey; break;
            case 3: objGlobalControl.downKey2 = keyboard_lastkey; break;
            case 4: objGlobalControl.jumpKey2 = keyboard_lastkey; break;
            case 5: objGlobalControl.shootKey2 = keyboard_lastkey; break;
            case 6: objGlobalControl.weaponSwitchLeftKey2 = keyboard_lastkey; break;
            case 7: objGlobalControl.weaponSwitchRightKey2 = keyboard_lastkey; break;
            case 8: objGlobalControl.pauseKey2 = keyboard_lastkey; break;
            case 9: objGlobalControl.slideKey2 = keyboard_lastkey; break;
        }
        show_debug_message("PRESSED", keyboard_lastkey);
        waiting = false;
        save_configs();
    }
}