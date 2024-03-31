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
menu[| 0] = "WIND MAN STAGE";
menu[| ds_list_size(menu)] = "CUT MAN STAGE";
menu[| ds_list_size(menu)] = "PVP ARENA";
menu[| ds_list_size(menu)] = "BACK";

num_menu_items = ds_list_size(menu);
selected = 0;

// Define menu actions
menu_actions = [
	rmWindman,
	rmTestStage,
	rmArena,
	rmMainMenu
];

