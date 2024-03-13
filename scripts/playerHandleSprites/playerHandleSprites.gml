/// @function playerHandleSprites
/// @description Handles the player's sprites, e.g. use different sprites when shooting
///				 Note that some sprites like sliding are static and are thus not altered in this script
function playerHandleSprites() {

	if isShoot == true
	{
	    spriteStand = asset_get_index("spr"+character+"StandShoot");
	    spriteStep = asset_get_index("spr"+character+"StandShoot");
	    spriteJump = asset_get_index("spr"+character+"JumpShoot");
	    spriteWalk = asset_get_index("spr"+character+"WalkShoot");
	    spriteClimb = asset_get_index("spr"+character+"ClimbShoot");
	    spriteGetup = asset_get_index("spr"+character+"ClimbShoot");
	}
	
	else if isThrow == true
	{
		if global.weapon[playerID] == 0 && character == "Bass"
		{
		    spriteStand = sprBassStandShoot;
		    spriteStep = sprBassStandShoot;
		    spriteJump = sprBassJumpShoot;
		    spriteWalk = sprBassWalkShoot;
		    spriteClimb = sprBassClimbShoot;
		    spriteGetup = sprBassClimbShoot;	
		}
		else
		{
		    spriteStand = asset_get_index("spr"+character+"StandThrow");
		    spriteStep = asset_get_index("spr"+character+"StandThrow");
		    spriteJump = asset_get_index("spr"+character+"JumpThrow");
		    spriteWalk = asset_get_index("spr"+character+"WalkThrow");
		    spriteClimb = asset_get_index("spr"+character+"ClimbThrow");
		    spriteGetup = asset_get_index("spr"+character+"ClimbThrow");
		}
	}
	else
	{
	    spriteStand = asset_get_index("spr"+character+"Stand");
	    spriteStep = asset_get_index("spr"+character+"Step");
	    spriteJump = asset_get_index("spr"+character+"Jump");
	    spriteWalk = asset_get_index("spr"+character+"Walk");
	    spriteClimb = asset_get_index("spr"+character+"Climb");
	    spriteGetup = asset_get_index("spr"+character+"ClimbGetup");
	}


}
