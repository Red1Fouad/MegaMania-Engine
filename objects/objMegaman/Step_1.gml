if playerID == 1
{
	keyLeft = global.keyLeft;
	keyRight = global.keyRight;
	keyUp = global.keyUp;
	keyDown = global.keyDown;
	keyJump = global.keyJump;
	keyShoot = global.keyShoot;
	keySlide = global.keySlide;
	keyPause = global.keyPause;
	keyWeaponSwitchLeft = global.keyWeaponSwitchLeft;
	keyWeaponSwitchRight = global.keyWeaponSwitchRight;

	keyLeftPressed = global.keyLeftPressed;
	keyRightPressed = global.keyRightPressed;
	keyUpPressed = global.keyUpPressed;
	keyDownPressed = global.keyDownPressed;
	keyJumpPressed = global.keyJumpPressed;
	keyShootPressed = global.keyShootPressed;
	keySlidePressed = global.keySlidePressed;
	keyPausePressed = global.keyPausePressed;
	keyWeaponSwitchLeftPressed = global.keyWeaponSwitchLeftPressed;
	keyWeaponSwitchRightPressed = global.keyWeaponSwitchRightPressed;

	keyLeftReleased = global.keyLeftReleased;
	keyRightReleased = global.keyRightReleased;
	keyUpReleased = global.keyUpReleased;
	keyDownReleased = global.keyDownReleased;
	keyJumpReleased = global.keyJumpReleased;
	keyShootReleased = global.keyShootReleased;
	keySlideReleased = global.keySlideReleased;
	keyPauseReleased = global.keyPauseReleased;
	keyWeaponSwitchLeftReleased = global.keyWeaponSwitchLeftReleased;
	keyWeaponSwitchRightReleased = global.keyWeaponSwitchRightReleased;
}
else
{
	keyLeft = global.keyLeft2;
	keyRight = global.keyRight2;
	keyUp = global.keyUp2;
	keyDown = global.keyDown2;
	keyJump = global.keyJump2;
	keyShoot = global.keyShoot2;
	keySlide = global.keySlide2;
	keyPause = global.keyPause2;
	keyWeaponSwitchLeft = global.keyWeaponSwitchLeft2;
	keyWeaponSwitchRight = global.keyWeaponSwitchRight2;

	keyLeftPressed = global.keyLeft2Pressed;
	keyRightPressed = global.keyRight2Pressed;
	keyUpPressed = global.keyUp2Pressed;
	keyDownPressed = global.keyDown2Pressed;
	keyJumpPressed = global.keyJump2Pressed;
	keyShootPressed = global.keyShoot2Pressed;
	keySlidePressed = global.keySlide2Pressed;
	keyPausePressed = global.keyPause2Pressed;
	keyWeaponSwitchLeftPressed = global.keyWeaponSwitchLeft2Pressed;
	keyWeaponSwitchRightPressed = global.keyWeaponSwitchRight2Pressed;

	keyLeftReleased = global.keyLeft2Released;
	keyRightReleased = global.keyRight2Released;
	keyUpReleased = global.keyUp2Released;
	keyDownReleased = global.keyDown2Released;
	keyJumpReleased = global.keyJump2Released;
	keyShootReleased = global.keyShoot2Released;
	keySlideReleased = global.keySlide2Released;
	keyPauseReleased = global.keyPause2Released;
	keyWeaponSwitchLeftReleased = global.keyWeaponSwitchLeft2Released;
	keyWeaponSwitchRightReleased = global.keyWeaponSwitchRight2Released;
}

//Debug
if !instance_exists(objSectionSwitcher) && !climbing && !isSlide && !global.frozen
{
	if playerID == 1 && keyboard_check_pressed(vk_f9) && teleporting == false && showReady == false && instance_number(objMegaman) == 1 && !(global._lives <= 0)
	{
		if global._health[2] <= 0 {global._health[1] = global._health[1]/2; global._health[2] = 28;}
		var p2 = instance_create(x + 10, y, objMegaman)
		p2.playerID = 2;
	}

	if playerID == 2 && keyboard_check_pressed(vk_f10) && teleporting == false && showReady == false && instance_number(objMegaman) == 1 && !(global._lives <= 0)
	{
		if global._health[1] <= 0 {global._health[2] = global._health[2]/2; global._health[1] = 28;}
		var p1 = instance_create(x + 10, y, objMegaman)
		p1.playerID = 1;
	}

	if instance_number(objMegaman) >= 2
	{
		// Step Event of a Controller Object (e.g., objController)

		if keyboard_check_pressed(vk_f5) {
		    // Find objMegaman instance with playerID 1 and move it to the position of playerID 2
		    var i;
		    for (i = 0; i < instance_number(objMegaman); i++) {
		        var megaman = instance_find(objMegaman, i);
		        if (megaman.playerID == 1) {
		            var megaman2 = instance_find(objMegaman, playerID == 2);
		            if (megaman2 != noone) {
		                megaman.x = megaman2.x;
		                megaman.y = megaman2.y;
		            }
		            break; // Exit loop after finding the first objMegaman with playerID 1
		        }
		    }
		}

		if keyboard_check_pressed(vk_f6) {
		    // Find objMegaman instance with playerID 2 and move it to the position of playerID 1
		    var i;
		    for (i = 0; i < instance_number(objMegaman); i++) {
		        var megaman = instance_find(objMegaman, i);
		        if (megaman.playerID == 2) {
		            var megaman1 = instance_find(objMegaman, playerID == 1);
		            if (megaman1 != noone) {
		                megaman.x = megaman1.x;
		                megaman.y = megaman1.y;
		            }
		            break; 
		        }
		    }
		}

	}
}


