// Draw logo parts
draw_sprite_ext(sprLogo, 0, logo1_x, logo1_y, 1, 1, 0, c_white, alpha);
draw_sprite_ext(sprLogo, 0, logo2_x, logo2_y, 1, 1, 0, c_white, alpha);

// Check if logo is fully merged
if (doneMerging) {
	var oldCol;
	oldCol = draw_get_color();
	draw_set_color(c_white);
	draw_set_font(global.MM3font);
	draw_set_halign(fa_center);

	draw_text(round(room_width/2), room_height-40-8, string_hash_to_newline("CREATED BY RED1 TEAM#" + string(current_year) +"##ORIGNAL ENGINE BY#WRECKINGPROGRAMS"));

	if drawText == true
	{
	    draw_text(round(room_width/2), 125, string_hash_to_newline("PRESS START"));
	}


	draw_set_color(oldCol);
	draw_set_halign(fa_left);
}
