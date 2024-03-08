if room == rmTestRoom && !instance_exists(objPauseMenu)
{
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	draw_set_font(global.MM3font);
	if showCon
	{
		draw_text(global.viewX + 256 - 10, global.viewY+2,"F9: SPAWN PLAYER 2");
		draw_text(global.viewX + 256 - 10, global.viewY+2+8,"F10: SPAWN PLAYER 1");
		draw_text(global.viewX + 256 - 10, global.viewY+2+8+8,"F5: TELEPORT P1 TO P2");
		draw_text(global.viewX + 256 - 10, global.viewY+2+8+8+8,"F6: TELEPORT P2 TO P1");
		draw_text(global.viewX + 256 - 10, global.viewY+2+8+8+8+8,"F11: DIE");
		draw_text(global.viewX + 256 - 10, global.viewY+2+8+8+8+8+8,"F12: HIDE/SHOW THIS MENU");
	}
}