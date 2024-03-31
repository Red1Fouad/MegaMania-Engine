global._lives -= 0;
global.firstTimeLevel = false;

if room == rmArena && instance_number(objMegaman) == 1
{
	global.player2Active = false;
	global.PVP = false;
	var ID = instance_create(x, y, objFadeout);
	ID.type = "room";
	ID.myRoom = rmLevelSelect;
}

if instance_number(objMegaman) <= 0 //|| instance_number(objMegaman) <= 1 && objMegaman.playerID != 1
{
	var ID;
	ID = instance_create(x, y, objFadeout);

	global.lastRoom = room;

	if global._lives >= 0
	    ID.type = "restart";
	else
	{
	    ID.type = "room";
	    ID.myRoom = rmPass;
	    global.passPlayVictory = false;
	    global.passContinueRoom = room;
	}
	instance_destroy();
}  


