if isMM == true
{
    if teleporting == false
    {
        drawPlayer();
    }
    else
    {
        if teleportY == 0
        {
            if teleportTimer == 2
                image_index = 2;
            else if teleportTimer == 4
                image_index = 0;
            else if teleportTimer == 6
                image_index = 1;
            else if teleportTimer = 9
            {
                teleportY -= 7;
                image_speed = 0;
                image_index = 0;
                exit;
            }
            
            if global.frozen == false
                teleportTimer += 1;
        }
        else
        {
            //Teleporting upwards            
            if global.frozen == false
                teleportY -= 7;
        }
        
        //draw_sprite_ext(sprMegamanTeleport, image_index, round(x), round(y+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        drawSpriteColorSwap(asset_get_index("spr"+character+"Teleport"), image_index, round(x), round(y+teleportY), primary_color, secondary_color, outline_color,global.primaryCol[playerID],global.secondaryCol[playerID], global.outlineCol[playerID]);
    }
}

