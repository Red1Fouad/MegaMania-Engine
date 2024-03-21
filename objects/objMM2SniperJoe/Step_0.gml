var box, shootID;
event_inherited()
if !global.frozen && !dead
{
    checkGround()
    gravityCheckGround()
    generalCollision()
    if instance_exists(objMegaman)
    {
        if ((x < objMegaman.x))
            image_xscale = 1
        else
            image_xscale = -1
    }
    if ((shooting == 0))
    {
        image_index = 0
        shootTimer += 1
        if ((shootTimer >= 90))
        {
            shooting = 1
            shootTimer = 0
        }
    }
    else
    {
        image_index = 1
        shootTimer += 1
        if ((shootTimer >= 30))
        {
            if ((shootAmount < 3))
            {
                shootTimer = 0
                if ((image_xscale == 1))
                    box = bbox_right
                else
                    box = bbox_left
                shootID = instance_create(box, ((y + 14) - 8), objEnemyBullet)
                shootID.dir = 0
                shootID.xscale = image_xscale
                shootID.spd = 2
                playSFX(sfxEnemyShootClassic)
                shootAmount += 1
            }
            if ((shootAmount >= 3))
            {
                shootTimer = 0
                shootAmount = 0
                shooting = 0
            }
        }
    }
    if ((image_index == 0))
    {
        if ((image_xscale == 1))
        {
            reflectProjectilesRight = 1
            reflectProjectilesLeft = 0
        }
        else
        {
            reflectProjectilesRight = 0
            reflectProjectilesLeft = 1
        }
    }
    else
    {
        reflectProjectilesRight = 0
        reflectProjectilesLeft = 0
    }
}
else if ((dead == 1))
{
    shootTimer = 0
    shooting = 0
    shootAmount = 0
    image_index = 0
}
