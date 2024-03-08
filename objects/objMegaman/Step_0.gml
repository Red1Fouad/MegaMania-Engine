if global.frozen == false
{
	// Check if global.xspeed and global.yspeed are not initialized as an array
	if (array_length_1d(global.xspeed) <= 0) {
	    global.xspeed = array_create(global.playersMax + 1, 0);
	}

	if (array_length_1d(global.yspeed) <= 0) {
	    global.yspeed = array_create(global.playersMax + 1, 0);
	}
    //Shooting (before sprite handling to update the sprites properly)
    playerShoot();
    
    //Handle the sprites
    playerHandleSprites();
    
    //General step event code
    playerStep();
    
    //Collision code
    playerCollision();
    
    //Handles moving platform collision
    playerMovingPlatform();
    
    //Pausing
    playerPause();
    
    //Camera
    playerCamera();
    
    //Moving from one section to the next, if possible
    playerSwitchSections();
    
    //Quick weapon switching
    playerSwitchWeapons();
}
else
{
    image_speed = 0;
}

if instance_exists(objSectionSwitcher) && instance_number(objMegaman) == 2
{

	switch objSectionSwitcher.playerID
	{
	case 1:
		var i;
		for (i = 0; i < instance_number(objMegaman); i++) {
			var megaman = instance_find(objMegaman, i);
			if (megaman.playerID == 2) {
				var megaman1 = instance_find(objMegaman, playerID == 1);
				if (megaman1 != noone) {
					megaman.newSectionXOffset = megaman1.newSectionXOffset;
					megaman.newSectionYOffset = megaman1.newSectionYOffset;
					megaman.sectionLeft = megaman1.sectionLeft;
					megaman.sectionRight = megaman1.sectionRight;
					megaman.sectionTop = megaman1.sectionTop;
					megaman.sectionBottom = megaman1.sectionBottom;
				    megaman.x = megaman1.x;
					if !climbing && !ground megaman.y = megaman1.y - 1 else megaman.y = megaman1.y;
					megaman.climbing = megaman1.climbing;
					megaman.canGravity = megaman1.canGravity;
					megaman.isSlide = megaman1.isSlide;				
					//megaman.ground = megaman1.ground;
				}
				break;
			}
		}
		break;
	case 2:
		var j;
		for (j = 0; j < instance_number(objMegaman); j++) {
			var megaman = instance_find(objMegaman, j);
			if (megaman.playerID == 1) {
				var megaman1 = instance_find(objMegaman, playerID == 2);
				if (megaman1 != noone) {
					megaman.newSectionXOffset = megaman1.newSectionXOffset;
					megaman.newSectionYOffset = megaman1.newSectionYOffset;
					megaman.sectionLeft = megaman1.sectionLeft;
					megaman.sectionRight = megaman1.sectionRight;
					megaman.sectionTop = megaman1.sectionTop;
					megaman.sectionBottom = megaman1.sectionBottom;
				    megaman.x = megaman1.x;
					if !climbing && !ground megaman.y = megaman1.y - 1 else megaman.y = megaman1.y;
					megaman.climbing = megaman1.climbing;
					megaman.canGravity = megaman1.canGravity;
					megaman.isSlide = megaman1.isSlide;
					//megaman.ground = megaman1.ground;
				}
				break;
			}
		}
		break;
	}
}
