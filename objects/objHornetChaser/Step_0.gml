event_inherited();

if !global.frozen
{
	if target < 0 and item < 0 and !place_meeting(x, y, objItemExplosion) {    //Choose target

	    image_xscale *= 2;
	    image_yscale *= 2;
	    target = instance_place(x, y, prtPickup);   //If touching an item
	    image_xscale /= 2;
	    image_yscale /= 2;

	    //Find an enemy
	    if target < 0 {
	        var n = 1;
	        while target < 0 or target.dead or !insideViewObj(target) or !target.targetable {
	            if n > instance_number(prtEnemy) {
	                target = -1;
	                break;
	            }
	            target = instance_nth_nearest(x, y, prtEnemy, n);
	            n++;
	        }
	    }
	    //If no enemy target found, find an item
	    var n = 1;
	    while target < 0 or !insideViewObj(target) or !target.targetable {
	        if n > instance_number(prtPickup) {
	            target = -1;
	            break;
	        }
	        target = instance_nth_nearest(x, y, prtPickup, n);
	        n++;
	    }
	}

	if target > -1 {    //Chasing
	    if instance_exists(target) {
	        var dx = sprite_get_xcenter_object(target) - x;
	        var dy = sprite_get_ycenter_object(target) - y;
	        var len = sqrt(dx*dx + dy*dy);
	        xspeed = dx * spd / len;
	        yspeed = dy * spd / len;
	    }
	    else {
	        target = -1;
	    }
	    if (object_get_parent(target.object_index) == prtPickup or object_get_parent(object_get_parent(target.object_index)) == prtPickup) and place_meeting(x, y, target) {
	        item = target;
	        target = -1;
	    }
	    else if (object_get_parent(target.object_index) == prtEnemy or object_get_parent(object_get_parent(target.object_index)) == prtEnemy) and target.dead {
	        target = -1;
	    }
	}

	if target < 0 and item > -1 {   //Bringing item
	    if instance_exists(item) {
	        if instance_exists(megamanID) {
	            var dx = sprite_get_xcenter_object(megamanID) - x;
	            var dy = sprite_get_ycenter_object(megamanID) - y;
	            var len = sqrt(dx*dx + dy*dy);
	            xspeed = dx * spd / len;
	            yspeed = dy * spd / len;
	        }
	        item.x = x + sprite_get_xoffset(item.sprite_index);
	        item.y = y + sprite_get_yoffset(item.sprite_index) - (8 - item.sprite_height / 2);
	        if image_xscale == -1 {
	            item.x -= item.sprite_width;
	            if item.sprite_width > 8 {
	                item.x += (8 - item.sprite_width / 2);
	            }
	        }
	        else if item.sprite_width <= 8 {
	            item.x -= item.sprite_width / 2 + 2;
	        }
	        item.yspeed = 0;
	        item.xspeed = 0;
	        with item alarm[0] = 0;
	    }
	    else {
	        item = -1;
	    }
	}

	//Facing direction
	if xspeed < 0 {
	    image_xscale = -1;
	}
	if xspeed > 0 {
	    image_xscale = 1;
	}

	//Animation
	if item < 0 {   //Not carrying any item
	    if image_index >= 2 {
	        image_index = 0;
	    }
	}
	else {
	    if item.sprite_width > 8 { //Large items
	        if image_index >= 4 or image_index < 2 {
	            image_index = 2;
	        }
	    }
	    else {  //Small items
	        if image_index >= 6 or image_index < 4 {
	            image_index = 4;
	        }
	    }
	}
	
	x += xspeed;
	y += yspeed;
}
else
{
	image_speed = 0;
}