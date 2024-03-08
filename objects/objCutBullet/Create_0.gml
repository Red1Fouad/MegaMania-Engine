event_inherited()
contactDamage = 4
reflectProjectiles = 0
grav = 0
spd = 3
if instance_exists(objMegaman)
{
    var angle = point_direction(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter_object(objMegaman), sprite_get_ycenter_object(objMegaman))
    xspeed = (cos(degtorad(angle)) * spd)
    yspeed = ((-sin(degtorad(angle))) * spd)
}
else
{
    xspeed = spd
    yspeed = 0
}
GoBack = 0
image_speed = ((-1 + (GoBack * 2)) / 4)
reflectable = 1
parentID = 0
