//Initialize switching sections
if (newSectionXOffset != 0 || newSectionYOffset != 0) {

	if (newSectionXOffset > 0) { //Switching to the right
	    x = sectionRight - 6;
	    playerCameraInit();
	    with instance_create(x, y, objSectionSwitcher) {playerID = other.playerID; dir = "right";}
	} else if (newSectionXOffset < 0) { //Switching to the left
	    x = sectionLeft + 6;
	    playerCameraInit();
	    with instance_create(x, y, objSectionSwitcher) {playerID = other.playerID; dir = "left";}
	} else if (newSectionYOffset > 0) { //Switching down
	    y = sectionBottom - 6 + sprite_yoffset - (sprite_height / 2);
	    playerCameraInit();
	    with instance_create(x, y, objSectionSwitcher) {playerID = other.playerID; dir = "down";}
	} else if (newSectionYOffset < 0) { //Switching up
	    y = sectionTop + 6 + sprite_yoffset - (sprite_height / 2);
	    playerCameraInit();
	    with instance_create(x, y, objSectionSwitcher) {playerID = other.playerID; dir = "up";}
	}
}

