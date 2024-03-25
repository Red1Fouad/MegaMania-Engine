var acc, shouldShoot;
event_inherited()
if !global.frozen && !dead
{
    facePlayer()
    image_speed = ((1/3))
    if ((yspeed == 0) && (y == ystart))
        yspeed = -1
    if ((isShoot == 1))
    {
        sprite_index = sprCannopellerShoot
        shootTimer += (1)
        if ((shootTimer >= 5))
        {
            isShoot = 0
            shootTimer = 0
        }
    }
    else
        sprite_index = sprCannopeller
    acc = 0.02
    if ((y < ystart))
        yspeed += (acc)
    else if ((y > ystart))
        yspeed -= (acc)
    shouldShoot = 0
    if ((projectileID == -20))
        shouldShoot = 1
    else if (!instance_exists(projectileID))
        shouldShoot = 1
    canShootTimer += (1)
    if ((shouldShoot == 1) && (!(place_meeting(x, y, objSolid))) && (!(place_meeting(x, y, prtMovingPlatformSolid))) && (canShootTimer >= 60))
    {
        canShootTimer = 0
        isShoot = 1
        projectileID = instance_create((x + (image_xscale * ((-sprite_get_xoffset(sprite_index)) + 24))), ((y - sprite_get_yoffset(sprite_index)) + 7), objCannopellerProjectile)
        projectileID.dir = image_xscale
    }
}
else
{
    if dead
    {
        yspeed = 0
        projectileID = -20
        isShoot = 0
        shootTimer = 0
        canShootTimer = 0
    }
    image_speed = 0
}
