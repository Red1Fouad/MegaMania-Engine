image_speed = 0.40000000000000002;
if (global.frozen == 0)
{
    spd += 0.25;
    spd = min(spd, 3.25);
    x += (sign(image_xscale) * spd);
	xspeed = x;
}

