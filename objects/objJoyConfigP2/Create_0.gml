playerID = 2;
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

key[0] = objGlobalControl.leftButton2;
key[1] = objGlobalControl.rightButton2;
key[2] = objGlobalControl.upButton2;
key[3] = objGlobalControl.downButton2;
key[4] = objGlobalControl.jumpButton2;
key[5] = objGlobalControl.shootButton2;
key[6] = objGlobalControl.weaponSwitchLeftButton2;
key[7] = objGlobalControl.weaponSwitchRightButton2;
key[8] = objGlobalControl.pauseButton2;

var current_item = 9;
menu[current_item] = "SLIDE";
key[current_item] = objGlobalControl.slideButton2;
current_item++;


menu[current_item] = "RESET";
current_item++;
menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;

