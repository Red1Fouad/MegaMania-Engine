imgSpd = 0.40000000000000002;

if (global.frozen == 0)
{
	if place_meeting(x,y,[objSolid, objTopSolid, objIce]) {instance_destroy()}	
    changeAngleFrames += 1;
    var wait = 21;
    if ((changeAngleMissile == 0))
        wait = 14;
    else if ((changeAngleMissile == 1) || (changeAngleMissile == 3) || (changeAngleMissile == 4))
        wait = 7;
    if ((changeAngleMissile == 2))
        wait += (horizontalDelay * 5);
    if ((changeAngleFrames > wait) && (abs(dir) < 270) && (changeAngleMissile < 4))
    {
        changeAngleFrames = 0;
        dir -= (45 * xDir);
        changeAngleMissile++;
    }
    image_xscale = 1;
    image_yscale = 1;
    if (((dir % 90) == 0))
    {
        sprite_index = sprSydeckaMissile;
        image_angle = (floor((dir / 90)) * 90);
    }
    else
    {
        sprite_index = sprSydeckaMissileDiag;
        if ((xDir > 0))
        {
            if ((changeAngleMissile == 1))
                image_angle = 0;
            else
                image_angle = 270;
        }
        else if ((changeAngleMissile == 1))
            image_angle = 90;
        else
            image_angle = 180;
    }

    // Move the object based on its direction
    var moveSpeedX = lengthdir_x(spd, dir);
    var moveSpeedY = lengthdir_y(spd, dir);
    x += moveSpeedX;
    y += moveSpeedY;
	xspeed = x;
	yspeed = y;
}
