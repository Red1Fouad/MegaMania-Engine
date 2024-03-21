var xx, yy;
if insideView() && !global.frozen && !instance_exists(objSectionSwitcher) && canStep
{
    if ((bulletID == -20) || (!instance_exists(bulletID)))
    {
        timer -= 1
        if ((timer <= 0))
        {
            if ((image_xscale == -1))
                xx = ((global.viewX + global.viewWidth) - 4)
            else
                xx = (global.viewX + 4)
            if instance_exists(objMegaman)
                yy = (objMegaman.bbox_top - 8)
            else
                yy = ((global.viewY + round((global.viewHeight / 2))) - 8)
            bulletID = instance_create(xx, yy, objKillerBullet)
            bulletID.image_xscale = image_xscale
            bulletID.respawn = 0
            bulletID.spawner = id
        }
    }
}
