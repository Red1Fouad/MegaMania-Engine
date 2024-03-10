door = false;
playerID = 1;
global.frozen = true;
global.switchingSections = true;

character = 0;
primary_color = 0;
secondary_color = 0;
outline_color = 0;

with prtEnemy beenOutsideView = true;
with prtPlayerProjectile instance_destroy();

deactivateUnimportantObjects();

if instance_exists(objMegaman) && instance_number(objMegaman) >= 2
{
    //Basically copy the player's appearance, so that the object can return to its original behaviour when done switching sections
	with objMegaman visible = false;
	for (var m = 0; m < instance_number(objMegaman); m++) 
	{
		var megaman = instance_find(objMegaman, m);
		if (megaman.playerID == playerID)
		{
		    sprite_index = megaman.sprite_index;
		    image_index = megaman.image_index;
		    imgSpd = megaman.image_speed;
		    image_speed = imgSpd;
		    image_xscale = megaman.image_xscale;
			alarm[0] = 1;
		}
	}
}
else if instance_number(objMegaman) <= 1
{
	sprite_index = objMegaman.sprite_index;
	image_index = objMegaman.image_index;
	imgSpd = objMegaman.image_speed;
	image_speed = imgSpd;
	image_xscale = objMegaman.image_xscale;
	alarm[0] = 1;
}
else
{
    instance_destroy();
    global.frozen = false;
}


//Variables that can me modified to make switching sections faster/slower
screenSpeedHor = 4; //The speed that the screen will move at if travelling horizontally
playerSpeedHor = 0.4; //The speed that Mega Man will move at if travelling horizontally
screenSpeedVert = 4; //Same as above but if travelling vertically
playerSpeedVert = 0.4; //Same as above but if travelling vertically

playerSpeedHorDoor = 0.7; //The speed that Mega Man will move at if travelling horizontally through a door


//Variables that cannot be modified
climbTimer = 0;
canProgressDoor = false;
canStep = false;

