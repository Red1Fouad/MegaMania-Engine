/// @function playerGetHit
/// @param health
/// @description Makes the player get hit
///				 Call it like this: with objMegaman playerGetHit();
function playerGetHit(argument0) {


	if canHit == true
	{
		var damageMult
		if character == "Protoman" 
			damageMult = 1.5
		else 
			damageMult = 1;
		
		drawDamageNumber(x, y, ceil(argument0 * damageMult));
	    global._health[playerID] -= argument0*damageMult;
    
	    canHit = false;
	    isHit = true;
	    hitTimer = 0;
	    isStep = false;
	    climbing = false;
	    canGravity = true;
	    isShoot = false;
	    isThrow = false;
	    onRushJet = false;
    
	    //When sliding and there's a solid above us, we should not experience knockback
	    //If we did, we would clip inside the ceiling above us
	    if !(isSlide == true && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
	    {
	        canMove = false;
	        canSpriteChange = false;
	        isSlide = false;
	        mask_index = mskMegaman;
	        global.xspeed[playerID] = image_xscale * -0.5;
	        global.yspeed[playerID] = 0;
        
	        if global._health[playerID] > 0
	        {
	            sprite_index = spriteHit;
            
	            //Create sweat effects
	            instance_create(sprite_get_xcenter()-11, sprite_get_ycenter()-17, objMegamanSweat);
	            instance_create(sprite_get_xcenter(), sprite_get_ycenter()-17, objMegamanSweat);
	            instance_create(sprite_get_xcenter()+11, sprite_get_ycenter()-17, objMegamanSweat);
	        }
	    }
    
	    if global._health[playerID] > 0
	        playSFX(sfxHit);
	}


}
