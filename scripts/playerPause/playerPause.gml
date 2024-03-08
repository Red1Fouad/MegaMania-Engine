/// @function playerPause
/// @description Pauses the game when the pause button is pressed
function playerPause() {

	if keyPausePressed && canPause == true && instance_number(objPauseMenu) < 1
	{
	    global.frozen = true;
	    var pause = instance_create(x, y, objPauseMenu)
		pause.playerID = playerID;
		pause.primary_color = primary_color;
		pause.secondary_color = secondary_color;
		pause.outline_color = outline_color;
	    playSFX(sfxPause);
	}


}
