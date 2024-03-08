//Set position to above the player's head
if instance_exists(objMegaman)
{
	for (var m = 0; m < instance_number(objMegaman); m++) {
		var megaman = instance_find(objMegaman, m);
		if (megaman.playerID == playerID) {
		    x = megaman.x + megaman.image_xscale;
		    y = megaman.y - 20;
		}
	}
}
else
{
    instance_destroy();
}

