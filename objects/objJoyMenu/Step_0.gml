/// Step Event

if (instance_exists(objFadeout)) exit;

// Menu navigation
var _move = 0;
if (global.keyUpPressed) _move = -1;
else if (global.keyDownPressed) _move = 1;

if _move != 0 {
    selected = (selected + _move + num_menu_items) mod num_menu_items;
    playSFX(sfxMenuMove);
}

// Menu selection
if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {
	if global.gamepadIsAttachedP2
	{
		playSFX(sfxMenuSelect);
	    var ID = instance_create(0, 0, objFadeout);
	    ID.type = "room";
	    ID.myRoom = menu_actions[selected];
	}
	else if !global.gamepadIsAttachedP2
	{
		if selected == 1 playSFX(sfxError);
		else 
		{
			playSFX(sfxMenuSelect);
		    var ID = instance_create(0, 0, objFadeout);
		    ID.type = "room";
		    ID.myRoom = menu_actions[selected];
		}
	}
}
