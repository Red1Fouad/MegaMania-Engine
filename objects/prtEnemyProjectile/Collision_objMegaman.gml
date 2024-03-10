if ((other.character == "Protoman") && (other.sprite_index == sprProtomanJump))
{
    with (other.id)
    {
        if collision_rectangle((x + (7 * image_xscale)), (y - 5), (x + (13 * image_xscale)), (y + 14), prtEnemyProjectile, 0, 0)
        {
            with (other.id)
            {
                var i = instance_create(x, y, objProtoReflect);
                playSFX(sfxReflect);
                i.xspeed = (other.image_xscale * abs(xspeed));
                i.image_xscale = other.image_xscale;
                i.yspeed = (yspeed * -1);
                i.damage = contactDamage;
                i.sprite_index = sprite_index;
                i.image_speed = image_speed;
                i.image_index = image_index;
                i.image_yscale = image_yscale;
                instance_destroy();
            }
            exit;
        }
    }
}




if other.canHit == true
{  
    //Used to make the player face away from the enemy, but I then found out this wasn't done in the NES games
    /*if sprite_get_xcenter() > other.x
        other.image_xscale = 1;
    else
        other.image_xscale = -1;*/
        
    with other playerGetHit(other.contactDamage);
}

/* */
/*  */
