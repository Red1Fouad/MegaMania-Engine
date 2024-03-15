function playerFollow() {
	function playerFollowStep(follower, target) {
    follower.newSectionXOffset = target.newSectionXOffset;
    follower.newSectionYOffset = target.newSectionYOffset;
    follower.sectionLeft = target.sectionLeft;
    follower.sectionRight = target.sectionRight;
    follower.sectionTop = target.sectionTop;
    follower.sectionBottom = target.sectionBottom;
    follower.x = target.x;
    if (!climbing && !ground) follower.y = target.y - 1;
    else follower.y = target.y;
    follower.climbing = target.climbing;
    follower.canGravity = target.canGravity;
    follower.isSlide = target.isSlide;
    // follower.ground = target.ground; // Uncomment if necessary
	}
	
    if instance_exists(objSectionSwitcher) && instance_number(objMegaman) == 2 {
        var playerID_1 = instance_find(objMegaman, 0);
        var playerID_2 = instance_find(objMegaman, 1);

        if (playerID_1 != noone && playerID_2 != noone) {
            switch (objSectionSwitcher.playerID) {
                case 1:
                    playerFollowStep(playerID_2, playerID_1);
                    break;
                case 2:
                    playerFollowStep(playerID_1, playerID_2);
                    break;
            }
        }
    }
}

