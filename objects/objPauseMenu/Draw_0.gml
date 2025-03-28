var oldCol, oldAlp;
oldCol = draw_get_color();
oldAlp = draw_get_alpha();


//Menu
if (phase >= 1 && phase <= 3) || phase == 5 || phase == 6
{
    draw_set_font(global.font);
    
    //BG
    draw_set_color(c_white);
    draw_set_alpha(1);
	if character == "Megaman"
	{
		draw_sprite(sprPauseMenuBG, 0, global.viewX, global.viewY);
	}
	else if character == "Protoman"
	{
		draw_sprite(sprPauseMenuBGP2, 0, global.viewX, global.viewY);
	}
    else if character == "Bass"
	{
		draw_sprite(sprPauseMenuBG, 0, global.viewX, global.viewY);
	}
	else if character == "Roll"
	{
		draw_sprite(sprPauseMenuBG, 0, global.viewX, global.viewY);
	}
    //Life
    var xx, yy, bgCol, i;
    xx = global.viewX+208;
    yy = global.viewY+183;
    bgCol = make_color_rgb(5, 5, 5);
    draw_sprite_ext(sprLife, 0, xx, yy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(sprLifePrimary, 0, xx, yy, 1, 1, 0, global.primaryCol[playerID], 1);
    draw_sprite_ext(sprLifeSecondary, 0, xx, yy, 1, 1, 0, global.secondaryCol[playerID], 1);
    draw_sprite_ext(sprLifeOutline, 0, xx, yy, 1, 1, 0, bgCol, 1);
    draw_text(xx + (41-25), yy + (201-183), string_hash_to_newline("0" + string(global._lives)));
    
    //Megaman
    xx = global.viewX+155;
    yy = global.viewY+192;
   //draw_sprite_ext(asset_get_index("spr"+character+"Stand, 0, xx, yy, 1, 1, 0, c_white, 1);
	drawSpriteColorSwap(asset_get_index("spr"+character+"Stand"), 0, xx, yy, primary_color, secondary_color, outline_color,global.primaryCol[playerID],global.secondaryCol[playerID], global.outlineCol[playerID]);
	/*
    draw_sprite_ext(asset_get_index("spr"+character+"StandPrimary, 0, xx, yy, 1, 1, 0, global.primaryCol[playerID], 1);
    draw_sprite_ext(asset_get_index("spr"+character+"StandSecondary, 0, xx, yy, 1, 1, 0, global.secondaryCol[playerID], 1);
    draw_sprite_ext(asset_get_index("spr"+character+"StandOutline, 0, xx, yy, 1, 1, 0, bgCol, 1);*/
    
    //Icons, ammo bars and names
    var maxI;
    if global.totalWeapons > 5 //a maximum of 6 weapons in the left column (0 is also a valid weapon ID, hence 5 instead of 6)
        maxI = 5;
    else
        maxI = global.totalWeapons;
        
    //Left column
    for(i = 0; i <= maxI; i += 1)
    {
        if global.weaponUnlocked[i] == true
        {
            //Icon
            if option == i
                draw_sprite_ext(sprWeaponIcons, global.weaponSlot[i], global.viewX+32, global.viewY+24+i*19, 1, 1, 0, c_white, 1);
            else
                draw_sprite_ext(sprWeaponIconsGray, global.weaponSlot[i], global.viewX+32, global.viewY+24+i*19, 1, 1, 0, c_white, 1);
                
            //Ammo bar
            var ammo;
            if i == 0
                ammo = global._health[playerID];
            else
                ammo = ceil(global.ammo[i][playerID]);
                
            if option == i
                draw_sprite_ext(sprPauseMenuBar, ammo, global.viewX+32+32, global.viewY+24+i*19+8, 1, 1, 0, c_white, 1);
            else
                draw_sprite_ext(sprPauseMenuBarGray, ammo, global.viewX+32+32, global.viewY+24+i*19+8, 1, 1, 0, c_white, 1);
            
            //The life bar at the bottom left
            if i == 0
                draw_sprite_ext(sprPauseMenuBarGray, global._health[playerID], global.viewX+128, global.viewY+208, 1, 1, 0, c_white, 1);
                
            //Name
            draw_set_font(global.font);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            
            if option == i
            {
                draw_set_color(make_color_rgb(255, 217, 162)); //Light yellow-ish
                draw_text(global.viewX+32+16+10, global.viewY+24+i*19+1, string_hash_to_newline(global.weaponName[ global.weaponSlot[i] ]));
                draw_set_color(c_white);
            }
            else
                draw_text(global.viewX+32+16+10, global.viewY+24+i*19+1, string_hash_to_newline(global.weaponName[ global.weaponSlot[i] ]));
        }
    }
    
    //Right column
    if global.totalWeapons > 5
    {
        for(i = 0; i < global.totalWeapons-5; i += 1)
        {
            if global.weaponUnlocked[i+6] == true
            {
                //Icon
                if option == i+6
                    draw_sprite_ext(sprWeaponIcons, global.weaponSlot[i+6], global.viewX+144, global.viewY+24+i*19, 1, 1, 0, c_white, 1);
                else
                    draw_sprite_ext(sprWeaponIconsGray, global.weaponSlot[i+6], global.viewX+144, global.viewY+24+i*19, 1, 1, 0, c_white, 1);
                    
                //Ammo bar
                var ammo;
                ammo = ceil(global.ammo[i+6][playerID]);
                    
                if option == i+6
                    draw_sprite_ext(sprPauseMenuBar, ammo, global.viewX+144+32, global.viewY+24+i*19+8, 1, 1, 0, c_white, 1);
                else
                    draw_sprite_ext(sprPauseMenuBarGray, ammo, global.viewX+144+32, global.viewY+24+i*19+8, 1, 1, 0, c_white, 1);
                    
                //Name
                draw_set_font(global.font);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
                
                if option == i+6
                {
                    draw_set_color(make_color_rgb(255, 217, 162)); //Light yellow-ish
                    draw_text(global.viewX+144+16+10, global.viewY+24+i*19+1, string_hash_to_newline(global.weaponName[ global.weaponSlot[i+6] ]));
                    draw_set_color(c_white);
                }
                else
                    draw_text(global.viewX+144+16+10, global.viewY+24+i*19+1, string_hash_to_newline(global.weaponName[ global.weaponSlot[i+6] ]));
            }
        }
    }
    
    //E-Tank
    if option == global.totalWeapons+1
    {
        draw_sprite_ext(sprETankPrimary, 0, global.viewX+24, global.viewY+184, 1, 1, 0, make_color_rgb(0, 120, 248), 1);
        draw_sprite_ext(sprETankSecondary, 0, global.viewX+24, global.viewY+184, 1, 1, 0, make_color_rgb(0, 232, 216), 1);
    }
    
    //M-Tank
    else if option == global.totalWeapons+2
    {
        draw_sprite_ext(sprMTankPrimary, 0, global.viewX+80, global.viewY+184, 1, 1, 0, make_color_rgb(0, 120, 248), 1);
        draw_sprite_ext(sprMTankSecondary, 0, global.viewX+80, global.viewY+184, 1, 1, 0, make_color_rgb(0, 232, 216), 1);
    }
    
    draw_text(global.viewX+41, global.viewY+201, string_hash_to_newline("0" + string(global.eTanks)));
    draw_text(global.viewX+96, global.viewY+201, string_hash_to_newline("0" + string(global.mTanks)));
}


//Black rectangle
draw_set_color(c_black);
draw_set_alpha(blackAlpha);
draw_rectangle(global.viewX, global.viewY, global.viewX+global.viewWidth, global.viewY+global.viewHeight, false);


draw_set_color(oldCol);
draw_set_alpha(oldAlp);

