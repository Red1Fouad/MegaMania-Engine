if (instance_exists(objFadeout)) exit;

// Move cursor
if (global.keyLeftPressed) {
    playSFX(sfxMenuMove);
    char--;
}
if global.keyRightPressed {
    playSFX(sfxMenuMove);
    char++;
}
if (char >= totalCharacters) char = 0;
if (char < 0) char = totalCharacters - 1;

// Select Player
if (global.keyPausePressed || global.keyJumpPressed) {
    playSFX(sfxMenuSelect);
    global.playerName = getCharacterName(char); // Set global variable with selected character name
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    ID.myRoom = global.targetRoom;         
}

// Go Back
if (global.keySlidePressed) {
    playSFX(sfxMenuSelect);
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    ID.myRoom = rmLevelSelect;         
}