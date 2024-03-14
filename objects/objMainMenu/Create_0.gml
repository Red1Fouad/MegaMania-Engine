draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

menu[0] = "NEW GAME";
var current_item = 1;

if os_browser == browser_not_a_browser {
    menu[current_item] = "KEY CONFIG";
    current_item++;
    menu[current_item] = "GAMEPAD CONFIG";
    current_item++;    
}

menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;