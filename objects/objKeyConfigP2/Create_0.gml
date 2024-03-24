countdown = 10000;
draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !audio_is_playing(bgmMainMenu)
{
	 playMusicVolumeLoopPoint(bgmMainMenu,0.6,0,1)
}

waiting = false;

menu[0] = "LEFT";
menu[1] = "RIGHT";
menu[2] = "UP";
menu[3] = "DOWN";
menu[4] = "JUMP";
menu[5] = "SHOOT";
menu[6] = "PREV WPN";
menu[7] = "NEXT WPN";
menu[8] = "PAUSE";

key[0] = objGlobalControl.leftKey2;
key[1] = objGlobalControl.rightKey2;
key[2] = objGlobalControl.upKey2;
key[3] = objGlobalControl.downKey2;
key[4] = objGlobalControl.jumpKey2;
key[5] = objGlobalControl.shootKey2;
key[6] = objGlobalControl.weaponSwitchLeftKey2;
key[7] = objGlobalControl.weaponSwitchRightKey2;
key[8] = objGlobalControl.pauseKey2;
var current_item = 9;
menu[current_item] = "SLIDE";
key[current_item] = objGlobalControl.slideKey2;
current_item++;
menu[current_item] = "RESET";
current_item++;
menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;

