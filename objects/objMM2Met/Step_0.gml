var box, ID;
event_inherited()
if !global.frozen && !dead
{
    checkGround()
    gravityCheckGround()
    generalCollision()
    switch phase
    {
        case 0:
            if instance_exists(objMegaman)
            {
                if ((distance_to_object(objMegaman) <= radius))
                {
                    phase = 1
                    image_index = 0
                }
                if ((x < objMegaman.x))
                    image_xscale = 1
                else
                    image_xscale = -1
            }
            break
        case 1:
            image_speed = (0.16666666666666666)
            if ((image_index >= (2 - image_speed)))
            {
                image_index = 2
                phase = 2
                if ((image_xscale == 1))
                    box = bbox_right
                else
                    box = bbox_left
                ID = instance_create(box, (y + 7), objEnemyBullet)
                ID.xscale = image_xscale
                ID.spd = 2
                ID.dir = 45
                ID = instance_create(box, (y + 7), objEnemyBullet)
                ID.xscale = image_xscale
                ID.spd = 2
                ID.dir = 0
                ID = instance_create(box, (y + 7), objEnemyBullet)
                ID.xscale = image_xscale
                ID.spd = 2
                ID.dir = 315
                playSFX(sfxEnemyShootClassic)
            }
            break
        case 2:
            image_speed = 0
            animTimer += (1)
            if ((animTimer >= 6))
            {
                animTimer = 0
                if ((image_index == 2))
                    image_index = 3
                else
                    image_index = 2
            }
            timer += (1)
            if ((timer >= 60))
            {
                timer = 0
                phase = 3
            }
            break
        case 3:
            image_speed = 0
            animTimer += (1)
            if ((animTimer >= 6))
            {
                animTimer = 0
                if ((image_index == 2))
                    image_index = 3
                else
                    image_index = 2
            }
            if (!(place_meeting((x + (image_xscale * 2)), y, objSolid)))
                xspeed = (image_xscale * 2)
            else
                xspeed = 0
            timer += (1)
            if ((timer >= 25))
            {
                timer = 0
                phase = 4
                xspeed = 0
                image_index = 2
            }
            break
        case 4:
            if ((image_index != 0))
            {
                image_speed = (-0.16666666666666666)
                if ((image_index <= (0 - image_speed)))
                {
                    image_index = 0
                    image_speed = 0
                    timer = 0
                    animTimer = 0
                }
            }
            else
            {
                timer += (1)
                if ((timer >= 60))
                {
                    timer = 0
                    phase = 0
                }
            }
            break
    }

    if ((image_index == 0))
        reflectProjectiles = 1
    else
        reflectProjectiles = 0
}
else
{
    image_speed = 0
    if ((dead == 1))
    {
        timer = 0
        animTimer = 0
        phase = 0
        image_index = 0
    }
}
