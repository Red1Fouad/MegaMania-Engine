if !global.frozen
{
	// Blinking "PRESS START" message
	blink_timer += 1;
	if (blink_timer >= 30) {
	    show_press_start = !show_press_start;
	    blink_timer = 0;
	}

	// Check for player 2 input to join
	if (global.keyPause2Pressed && !player2_joined) {
		playSFX(sfxMenuSelect);
	    // Show character selection
	    state = "character_select";
	    player2_joined = true;
		instance_create(x, y, objPlayer2Select);
		instance_destroy();
	}
}
if instance_exists(objMegaman)
{
	x = objMegaman.x;
	y = objMegaman.y;
}
