for(m = 1; m <= instance_number(objMegaman); m += 1)
{
	//Health 1
	draw_sprite(sprHealthbarBackground, 0, global.viewX+7+8+5, global.viewY+17);

	for(i = 1; i <= global._health[1]; i += 1)
	{
	    draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+8+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(252, 228, 160), 1);
	    draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+8+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(248, 248, 248), 1);
	}
	
	//Weapons 1
	if global.weapon[1] != 0
	{
	    draw_sprite(sprHealthbarBackground, 0, global.viewX+7+5, global.viewY+17);
    
	    for(i = 1; i <= ceil(global.ammo[global.currentWeapon[1]][1]); i += 1)
	    {
	        draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.primaryCol[1], 1);
	        draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.secondaryCol[1], 1);
	    }
	}
	
	if m > 1 || global.isMultiplayer
	{
		//Health 2
		draw_sprite(sprHealthbarBackground, 0, global.viewX+7+8+5+20, global.viewY+17);

		for(i = 1; i <= global._health[2]; i += 1)
		{
		    draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+8+1+5+20, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(252, 228, 160), 1);
		    draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+8+1+5+20, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(248, 248, 248), 1);
		}
		
		//Weapons 2
		if global.weapon[2] != 0
		{
		    draw_sprite(sprHealthbarBackground, 0, global.viewX+7+5+20, global.viewY+17);
    
		    for(i = 1; i <= ceil(global.ammo[global.currentWeapon[2]][2]); i += 1)
		    {
		        draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+1+5+20, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.primaryCol[2], 1);
		        draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+1+5+20, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.secondaryCol[2], 1);
		    }
		}
	
	}

}