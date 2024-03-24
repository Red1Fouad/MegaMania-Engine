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
}
event_user(0);