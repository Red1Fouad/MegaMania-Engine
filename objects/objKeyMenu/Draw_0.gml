draw_set_halign(fa_center);
draw_text(room_width / 2, 30, "KEY CONFIG MENU");

// Menu items
var initial_y = 60;
var vspace = 16;
var left = room_width / 3;
draw_set_halign(fa_left);

for (var i = 0; i < num_menu_items; i++) {
    draw_text(left, i * vspace + initial_y, menu[| i]);
}

// Selection arrow
draw_sprite(sprPassArrow, 0, left - 10, selected * vspace + initial_y + 3);