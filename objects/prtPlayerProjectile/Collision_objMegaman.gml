if other.playerID != playerID
{
	if ((other.character == "Protoman") && (other.sprite_index == sprProtomanJump || other.sprite_index == sprProtomanDuck))
	{
	    with (other.id)
	    {
			var x1,y1,x2,y2;
			if sprite_index == sprProtomanJump {x1 = 7; y1 = 5; x2 = 13; y2 = 14;}
			else if sprite_index == sprProtomanDuck {x1 = 6; y1 = 2; x2 = 11; y2 = 17;}
	        if collision_rectangle((x + (x1 * image_xscale)), (y - y1), (x + (x2 * image_xscale)), (y + y2), prtEnemyProjectile, 0, 0)
	        {
	            with (other.id)
	            {
	                var i = instance_create(x, y, objProtoReflect);
	                playSFX(sfxReflect);
	                i.xspeed = (other.image_xscale * abs(xspeed));
	                i.image_xscale = other.image_xscale;
	                i.yspeed = (yspeed * -1);
	                i.damage = damage;
	                i.sprite_index = sprite_index;
	                i.image_speed = image_speed;
	                i.image_index = image_index;
	                i.image_yscale = image_yscale;
					i.playerID = other.playerID;
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
        
	    with other playerGetHit(other.damage);
	}
}
/* */
/*  */
