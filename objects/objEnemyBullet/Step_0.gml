var ID;
if !global.frozen 
{
    image_speed = imgSpd
    xspeed = ((cos(degtorad(dir)) * spd) * xscale)
    yspeed = ((-sin(degtorad(dir))) * spd)
    x += xspeed
    y += yspeed
    if stopAtSolid
    {
        if place_meeting(x, y, objSolid)
        {
            instance_destroy()
            instance_create(x, y, objExplosion)
        }
        else if place_meeting(x, y, prtMovingPlatformSolid)
        {
            ID = instance_place(x, y, prtMovingPlatformSolid)
            if ID >= objSolid
            {
                if ID.dead == 0
                {
                    instance_destroy()
                    instance_create(x, y, objExplosion)
                }
            }
        }
    }
}
else
    image_speed = 0
