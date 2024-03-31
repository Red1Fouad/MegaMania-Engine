if !global.frozen {
    if !instance_exists(objMegaman) and insideView() {
        instance_destroy();
        exit;
    }
    if !leaving and sprite_index == sprRushTeleport {    //Teleporting in
        if image_index == 0 {   //Falling
            if yspeed == 0 and insideView() {
                y = global.viewY;
                yspeed = 7;
            }
            if (!called or abs(objMegaman.y - y) < 64) and place_meeting(x, y + yspeed, objSolid) and place_free(x, y) {
                image_speed = anim_spd * 2;
                while !place_meeting(x, y + 1, objSolid) {
                    y++;
                }
            }
            else {
                y += yspeed;
            }
        }
        else if image_index >= 2 {  //Morphing
            sprite_index = sprEddie;
            image_index = 1;
            while !place_meeting(x, y + 1, objSolid) {
                y++;
            }
            if objMegaman.x < x {
                image_xscale = -1;
            }
        }        
    }
    else if !leaving {  //Ready to work
        if !place_meeting(x, y + 1, objSolid) {
            yspeed += 0.25;
            y += yspeed;
        }
        else {
            yspeed = 0;
        }
        if !delivering and abs(objMegaman.x - x) > 48 { //Walking towards Mega Man
            xspeed = image_xscale * spd;
            x += xspeed;
            if image_index >= 3 and image_speed > 0 {
                image_speed = -anim_spd;
                image_index = 2.9;
            }
            else if image_index >= 3 and image_speed < 0 {
                image_speed = anim_spd;
                image_index = 0;
            }
        }
        else {  //Throw item
            delivering = true;
            if image_index < 3 and image_speed != 0 and !delivered {
                image_speed = anim_spd;
                image_index = 3;
            }
            else if image_index > 5 and !delivered {
                delivered = true;
                var item = choose(objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLife, objLife, objETank);
                var item_instance = instance_create(x + image_xscale * 8, y - 16, item);
                item_instance.xspeed = image_xscale;
                item_instance.yspeed = -4;
            }
            else if image_index > 5.5 and delivered {
                image_index = 5.5;
                image_speed = -anim_spd;
            }
            else if image_speed < 0 and image_index <= 4.2 and delivered {
                image_index = 1;
                image_speed = 0;
                alarm[0] = room_speed;
            }
        }
    }
    else {
        if image_index < 1 {
            image_speed = 0;
            yspeed = -7;
            y += yspeed;
        }
    }
}
else {
    if alarm[0] > 0 {
        alarm[0]++;
    }
}