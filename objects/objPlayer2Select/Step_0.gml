x = objMegaman;
y = objMegaman;

if !global.frozen && !instance_exists(objSectionSwitcher)
{
	// Handle character selection and scrolling
	if (global.keyLeft2Pressed) {
		playSFX(sfxWeaponSwitch);
	    global.selectedCharacterIndex -= 1;
	    if (global.selectedCharacterIndex < 0) {
	        global.selectedCharacterIndex = 3;
	    }
	}
	if (global.keyRight2Pressed) {
		playSFX(sfxWeaponSwitch);
	    global.selectedCharacterIndex += 1;
	    if (global.selectedCharacterIndex > 3) {
	        global.selectedCharacterIndex = 0;
	    }
	}

	// Set selected character name
	global.playerName2 = getCharacterName(global.selectedCharacterIndex);

	// Create player 2 object when character is selected
	if (global.keyPause2Pressed) {
	    var p2 = instance_create(objMegaman.x, objMegaman.y, objMegaman)
		p2.playerID = 2;
		p2.character = global.playerName2;
		instance_destroy();
	}
}
