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

key[0] = objGlobalControl.leftKey;
key[1] = objGlobalControl.rightKey;
key[2] = objGlobalControl.upKey;
key[3] = objGlobalControl.downKey;
key[4] = objGlobalControl.jumpKey;
key[5] = objGlobalControl.shootKey;
key[6] = objGlobalControl.weaponSwitchLeftKey;
key[7] = objGlobalControl.weaponSwitchRightKey;
key[8] = objGlobalControl.pauseKey;
var current_item = 9;
menu[current_item] = "SLIDE";
key[current_item] = objGlobalControl.slideKey;
current_item++;
menu[current_item] = "RESET";
current_item++;
menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;

