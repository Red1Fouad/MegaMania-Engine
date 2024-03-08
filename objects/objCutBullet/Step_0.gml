if !global.frozen 
{
    x += (xspeed)
    y += (yspeed)
    if ((x < (global.viewX + 8)) || (x > ((global.viewX + global.viewWidth) - 8)) || (y < (global.viewY + 8)) || (y > ((global.viewY + global.viewHeight) - 8)))
        GoBack = 1
    if (GoBack && instance_exists(parentID))
    {
        var angle = point_direction(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter_object(parentID), sprite_get_ycenter_object(parentID))
        xspeed = (cos(degtorad(angle)) * spd)
        yspeed = ((-sin(degtorad(angle))) * spd)
        if place_meeting(x, y, parentID)
            instance_destroy()
    }
    image_speed = (((-1 + (GoBack * 2)) / 4))
}
else
    image_speed = 0
if (!instance_exists(parentID))
    instance_destroy()
