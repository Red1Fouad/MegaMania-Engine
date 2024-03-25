// Draw character selection icons
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(global.viewX + 186,global.viewY + 10, global.viewX + 252, global.viewY + 10 + 15, false)
draw_set_color(c_white);
draw_set_alpha(1);

for (var i = 0; i < 4; i++) {
    var icon_x = global.viewX + 186 + (i * 17);
    var icon_y = global.viewY + 10;
    var _sprite_index = sprPlayerMugs[i];
    
    // Draw the respective subimage for each character
    draw_sprite(_sprite_index, i, icon_x, icon_y);
    
    // Draw red outline around selected icon
    if (i == global.selectedCharacterIndex) {
		draw_set_color(c_red);
		draw_sprite(sprPlayer2SelectRec,0,icon_x, icon_y);
    }
}
