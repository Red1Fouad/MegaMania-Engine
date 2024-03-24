draw_set_halign(fa_center);

draw_text(room_width / 2, 30, "GAMEPAD CONFIG P2");

var initial_y = 50;
var vspace = 12;
var left = 70;

draw_set_halign(fa_left);

for (var i = 0; i < num_menu_items; i++) {
    if i >= num_menu_items - 2 {
        draw_set_halign(fa_center);
        draw_text(room_width / 2, i * vspace + initial_y, menu[i]);
    }
    else {
        draw_text(left, i * vspace + initial_y, menu[i]);
        if waiting and i == selected {
            draw_text(room_width / 2 + 20, i * vspace + initial_y, "PRESS..." + string(ceil(countdown/1000)));
        }
        else {
            draw_text(room_width / 2 + 20, i * vspace + initial_y, string_upper(button_to_string(key[i])));
        }
    }
}

if selected >= num_menu_items - 2 {
    draw_sprite(sprPassArrow, 0, room_width / 2 - 24, selected * vspace + initial_y + 3);
}
else {
    draw_sprite(sprPassArrow, 0, left - 10, selected * vspace + initial_y + 3);
}