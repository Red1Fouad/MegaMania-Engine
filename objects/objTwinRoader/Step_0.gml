var prevGround;
event_inherited()
if !global.frozen && !dead
{
    checkGround()
    gravityCheckGround()
    generalCollision()
    if ((canFacePlayer == 1))
    {
        facePlayer()
        canFacePlayer = 0
    }
    if ((ground == 1))
    {
        if ((image_xscale == 1) && (xspeed < spd))
        {
            xspeed += acc
            if ((xspeed > spd))
                xspeed = spd
        }
        else if ((image_xscale == -1) && (xspeed > (-spd)))
        {
            xspeed -= acc
            if ((xspeed < (-spd)))
                xspeed = (-spd)
        }
    }
    prevGround = ground
    x += (xspeed)
    checkGround()
    if ((prevGround == 1) && (ground == 0) && instance_exists(objMegaman) && (turning == 0))
    {
        if (((sprite_get_xcenter() > sprite_get_xcenter_object(objMegaman)) && (image_xscale == 1)) || ((sprite_get_xcenter() < sprite_get_xcenter_object(objMegaman)) && (image_xscale == -1)))
        {
            turning = 1
            turnTimer = 0
        }
    }
    x -= (xspeed)
    checkGround()
    if ((ground == 0))
        xspeed = 0
    if (place_meeting(((x + xspeed) + sign(xspeed)), y, objSolid) && (turning == 0))
    {
        turning = 1
        turnTimer = 0
    }
    if ((turning == 1))
    {
        xspeed = 0
        turnTimer += (1)
        turnTimer = round(turnTimer)
        if ((turnTimer == round((turnTimerMax / 3))))
            image_index = 3
        else if ((turnTimer == round((turnTimerMax * (2/3)))))
        {
            image_index = 2
            image_xscale *= -1
        }
        else if ((turnTimer >= turnTimerMax))
        {
            turnTimer = 0
            turning = 0
            image_index = 0
            animTimer = 0
            xspeed = (image_xscale * spd)
        }
    }
    else
    {
        animTimer += (1)
        if ((animTimer >= 8))
        {
            animTimer = 0
            if ((image_index == 0))
                image_index = 1
            else
                image_index = 0
        }
    }
}
else
{
    image_speed = 0
    if dead
    {
        canFacePlayer = 1
        turning = 0
        turnTimer = 0
        animTimer = 0
        image_index = 0
    }
}
