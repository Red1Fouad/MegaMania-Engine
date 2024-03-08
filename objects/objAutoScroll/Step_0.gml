if !global.frozen {
    if !started and insideView() and instance_exists(objMegaman) {
        started = true;
        x = objMegaman.x;
        y = objMegaman.y;
        with objMegaman {
            sectionLeft = global.viewX;
            sectionRight = global.viewX + global.viewWidth;
            sectionTop = global.viewY;
            sectionBottom = global.viewY + global.viewHeight;    
        }
    }
    else if started {
        x += xspeed;
        y += yspeed;
        with objMegaman {
            sectionLeft += other.xspeed;
            sectionRight += other.xspeed;
            sectionTop += other.yspeed;
            sectionBottom += other.yspeed;
            if !place_free(x + other.xspeed, y + other.yspeed) and ((other.xspeed > 0 and x < sectionLeft) or (other.xspeed < 0 and x + sprite_width > sectionRight) or (other.yspeed > 0 and y < sectionTop) or (other.yspeed < 0 and y + sprite_height > sectionBottom)) {
                global._health = 0;
            }
        }
    
        if instance_exists(objMegaman) {
            if xspeed > 0 and position_meeting(objMegaman.sectionRight - 16, objMegaman.sectionTop, objSectionBorderRight)
            or xspeed < 0 and position_meeting(objMegaman.sectionLeft, objMegaman.sectionTop, objSectionBorderLeft)
            or yspeed > 0 and position_meeting(objMegaman.sectionLeft, objMegaman.sectionBottom - 16, objSectionBorderBottom)
            or yspeed < 0 and position_meeting(objMegaman.sectionLeft, objMegaman.sectionTop, objSectionBorderTop) {
                instance_destroy();
            }
        }
    }
}


