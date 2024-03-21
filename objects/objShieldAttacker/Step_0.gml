var ded;
event_inherited()
if !global.frozen && !dead
{
    if ((isTurn == 0))
    {
        if ((xspeed > 0))
        {
            reflectProjectilesRight = 1
            reflectProjectilesLeft = 0
        }
        else if ((xspeed < 0))
        {
            reflectProjectilesLeft = 1
            reflectProjectilesRight = 0
        }
        if (place_meeting((x + xspeed), y, objSolid) || place_meeting((x + xspeed), y, prtMovingPlatformSolid) || place_meeting((x + xspeed), y, objShieldAttackerStopper))
        {
            if place_meeting((x + xspeed), y, prtMovingPlatformSolid)
                ded = (instance_place((x + xspeed), y, prtMovingPlatformSolid)).dead
            else
                ded = 0
            if ((ded == 0))
            {
                isTurn = 1
                sprite_index = spriteTurn
                image_index = 0
            }
        }
    }
    else
    {
        reflectProjectilesLeft = 0
        reflectProjectilesRight = 0
        if ((image_index >= (image_number - 1)))
        {
            image_index = 0
            isTurn = 0
            sprite_index = spriteNormal
            image_xscale *= -1
        }
    }
    if ((isTurn == 0))
    {
        xspeed = (image_xscale * 2)
        image_speed = (0.5)
    }
    else
    {
        xspeed = 0
        image_speed = (0.25)
    }
}
else
{
    image_speed = 0
    if ((dead == 1))
    {
        image_index = 0
        isTurn = 0
        sprite_index = spriteNormal
    }
}
