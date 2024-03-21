event_inherited();
if !global.frozen && !dead && canStep == 1
{
    xspeed = (image_xscale * 1.125)
    yspeed = 0
    sinCounter += (0.044999999999999998)
    y = (ystart - (sin((sinCounter + pi)) * 32))
    //x += xspeed
    //y += yspeed
}
else if dead
{
    xspeed = 0
    yspeed = 0
    sinCounter = 0
}
