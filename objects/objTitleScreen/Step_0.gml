// Move logo parts towards each other until merged
if (!doneMerging) {
    if (logo1_x < room_width / 2) {
        logo1_x += merging_speed;
    }
    if (logo2_x > room_width / 2) {
        logo2_x -= merging_speed;
    }
    
    // Check if logo parts are merged
    if (logo1_x >= room_width / 2 && logo2_x <= room_width / 2) {
		logo1_x = room_width / 2;
		logo2_x = room_width / 2;
        doneMerging = true;
    }
}

// Check if merging can be skipped
if (!doneMerging && global.keyPausePressed) {
    logo1_x = room_width / 2;
    logo2_x = room_width / 2;
    doneMerging = true;
}

if doneMerging
{
	alarm[0] = 1; //To make sure pressing start while merging doesn't go next screen
	alpha = 1; //Full Logo visibility
	//Timer for toggling the visibility of the "PRESS START" text
	if canProceed == true
	{
	    drawTextTimer += 1;
	    if drawTextTimer >= drawTextTimerMax
	    {
	        drawTextTimer = 0;
	        drawText = !drawText;
	    }
	}

	//Going to the stage select
	if global.keyPausePressed && canProceed == true
	{
	    canProceed = false;
	    drawText = false;
	    playSFX(sfxMenuSelect);
    
	    var ID;
	    ID = instance_create(0, 0, objFadeout);
	        ID.type = "room";
	        ID.myRoom = rmMainMenu;
	}
}