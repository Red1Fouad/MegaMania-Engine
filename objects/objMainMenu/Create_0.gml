/// Create Event

// Initialization
draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

global.player2Active = false;

// Play background music if not already playing
if !audio_is_playing(bgmMainMenu) {
    playMusicVolumeLoopPoint(bgmMainMenu, 1, 0, 1);
}

// Menu items
menu = ds_list_create();
menu[| 0] = "NEW GAME";
if os_browser == browser_not_a_browser && os_type != os_android && os_type != os_ios {
    menu[| ds_list_size(menu)] = "KEY CONFIG";
    menu[| ds_list_size(menu)] = "GAMEPAD CONFIG";
}
menu[| ds_list_size(menu)] = "BACK";

num_menu_items = ds_list_size(menu);
selected = 0;

// Define menu actions
if os_browser == browser_not_a_browser && os_type != os_android && os_type != os_ios
{
	menu_actions = [
	    rmPlayerSelect,         // "NEW GAME"
	    rmKeyMenu,            // "KEY CONFIG"
	    rmJoyMenu,            // "GAMEPAD CONFIG"
	    rmDisclaimer            // "BACK"
	];
}
else
{
	menu_actions = [
	    rmPlayerSelect,         // "NEW GAME"
	    rmDisclaimer            // "BACK"
	];
}