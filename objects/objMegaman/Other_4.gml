//Create necessary objects
if instance_number(objMegaman) <= 1
{
	if !instance_exists(objGlobalControl)
	    instance_create(x, y, objGlobalControl);
	
	if !instance_exists(objControllerControl)
	    instance_create(x, y, objControllerControl); 

	if !instance_exists(objHealthWeaponBar)
	    instance_create(x, y, objHealthWeaponBar);
    
	if !instance_exists(objFadeIn)
	    instance_create(x, y, objFadeIn);

	if !instance_exists(objMultiplayerBorderL)
	    instance_create(x, y, objMultiplayerBorderL); 
	
	if !instance_exists(objMultiplayerBorderR)
	    instance_create(x, y, objMultiplayerBorderR); 
		
	if global.player2Active == false
	{
		if !instance_exists(objPlayerJoin)
		    instance_create(x, y, objPlayerJoin);
	}
	
	if global.player2Active == true
	{
		var _x = x;
		var _y = y;
		if room == rmArena {_x = 304; _y = 192}
		var p2 = instance_create(_x, _y, objMegaman)
		p2.character = global.playerName2;
		p2.playerID = 2;
	}
}
event_user(0);