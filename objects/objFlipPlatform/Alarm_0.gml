canStep = 1
if ((image_xscale == -1))
{
    image_index = 5
    phase = 0
    topSolidID = instance_create((x - sprite_get_xoffset(sprite_index)), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
    topSolidID.image_xscale = 1.1875
}
else
{
    image_index = 0
    phase = 3
    topSolidID = instance_create(((x - sprite_get_xoffset(sprite_index)) + 31), ((y - sprite_get_yoffset(sprite_index)) + 7), objTopSolid)
    topSolidID.image_xscale = 1.1875
}
