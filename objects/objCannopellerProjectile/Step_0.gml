var shouldDestroy, movingID;
event_inherited()
if !global.frozen && !dead
{
    xspeed = (dir * spd)
    timer += 1
    if ((timer >= 15))
        yspeed += 0.080000000000000002
    shouldDestroy = 0
    if (place_meeting(x, y, objSolid) || place_meeting(x, y, objTopSolid))
        shouldDestroy = 1
    movingID = instance_place(x, y, prtMovingPlatformSolid)
    if ((movingID >= objSolid))
    {
        if ((movingID.dead == 0))
            shouldDestroy = 1
    }
    movingID = instance_place(x, y, prtMovingPlatformJumpthrough)
    if ((movingID >= objSolid))
    {
        if ((movingID.dead == 0))
            shouldDestroy = 1
    }
    if ((shouldDestroy == 1))
    {
        instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion)
        instance_destroy()
    }
}
