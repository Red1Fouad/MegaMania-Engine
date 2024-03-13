var pixelsInsideSolid;
if ((global.frozen == 0) && (canStep == 1))
{
    xspeed = ((cos(degtorad(angle)) * 5) * xscale);
    yspeed = ((-sin(degtorad(angle))) * 5);
    x += xspeed;
    y += yspeed;
    pixelsInsideSolid = 8;
    if (((place_meeting(x, y, objSolid) && ((xspeed >= 0) || place_meeting((x + pixelsInsideSolid), y, objSolid)) && ((xspeed <= 0) || place_meeting((x - pixelsInsideSolid), y, objSolid)) && ((yspeed >= 0) || place_meeting(x, (y + pixelsInsideSolid), objSolid)) && ((yspeed <= 0) || place_meeting(x, (y - pixelsInsideSolid), objSolid))) || (place_meeting(x, y, prtMovingPlatformSolid) && ((xspeed >= 0) || place_meeting((x + pixelsInsideSolid), y, prtMovingPlatformSolid)) && ((xspeed <= 0) || place_meeting((x - pixelsInsideSolid), y, prtMovingPlatformSolid)) && ((yspeed >= 0) || place_meeting(x, (y + pixelsInsideSolid), prtMovingPlatformSolid)) && ((yspeed <= 0) || place_meeting(x, (y - pixelsInsideSolid), prtMovingPlatformSolid)))))
    {
        instance_destroy();
        exit;
    }
}
