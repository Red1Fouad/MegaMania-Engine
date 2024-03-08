if drawHealthBar == true
{
    draw_sprite(sprHealthbarBackground, 0, global.viewX+256-(+7+8+5), global.viewY+17);
    
    for(i = 1; i <= global.bossHealth; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+256-(+7+8+5)+1, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, healthBarPrimaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+256-(+7+8+5)+1, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, healthBarSecondaryCol, 1);
    }
}

