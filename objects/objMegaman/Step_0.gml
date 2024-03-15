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

playerFollow();