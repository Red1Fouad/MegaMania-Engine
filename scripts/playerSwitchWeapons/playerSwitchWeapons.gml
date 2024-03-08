/// @function playerSwitchWeapons
/// @description Allows for quick weapon switching
///				 If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event
function playerSwitchWeapons() {

	//Switching to the left
	if keyWeaponSwitchLeftPressed
	{
	    var loops;
	    loops = 0;
    
	    while global.weaponUnlocked[global.currentWeapon[playerID]] == false || loops == 0
	    {
	        global.currentWeapon[playerID] -= 1;
	        if global.currentWeapon[playerID] < 0
	            global.currentWeapon[playerID] = global.totalWeapons;
            
	        loops += 1;
	    }
    
	    drawWeaponIcon = true;
	    drawWeaponIconTimer = 30;
    
	    global.weapon[playerID] = global.weaponSlot[global.currentWeapon[playerID]];
	    event_user(0); //Colors
    
	    with prtPlayerProjectile if playerID == other.playerID instance_destroy();
	    with objReflectedProjectile instance_destroy();
	    with prtRush instance_destroy();
	    with objRushJet instance_destroy();
    
	    if onRushJet == true
	    {
	        onRushJet = false;
	        canMove = true;
	    }
    
	    playSFX(sfxWeaponSwitch);
    
	    sound_stop(sfxCharging);
	    sound_stop(sfxCharged);
	}

	//Switching to the right
	if keyWeaponSwitchRightPressed
	{
	    var loops;
	    loops = 0;
    
	    while global.weaponUnlocked[global.currentWeapon[playerID]] == false || loops == 0
	    {
	        global.currentWeapon[playerID] += 1;
	        if global.currentWeapon[playerID] > global.totalWeapons
	            global.currentWeapon[playerID] = 0;
            
	        loops += 1;
	    }
    
	    drawWeaponIcon = true;
	    drawWeaponIconTimer = 30;
    
	    global.weapon[playerID] = global.weaponSlot[global.currentWeapon[playerID]];
	    event_user(0); //Colors
    
	    with prtPlayerProjectile if playerID == other.playerID instance_destroy();
	    with objReflectedProjectile instance_destroy();
	    with prtRush instance_destroy();
	    with objRushJet instance_destroy();
    
	    if onRushJet == true
	    {
	        onRushJet = false;
	        canMove = true;
	    }
    
	    playSFX(sfxWeaponSwitch);
    
	    sound_stop(sfxCharging);
	    sound_stop(sfxCharged);
	}

	//Holding the left and right weapon switch keys at the same time results in the Mega Buster being selected
	if keyWeaponSwitchLeft && keyWeaponSwitchRight && global.weapon[playerID] != megabuster
	{
	    global.currentWeapon[playerID] = 0;
    
	    drawWeaponIcon = true;
	    drawWeaponIconTimer = 30;
    
	    global.weapon[playerID] = global.weaponSlot[global.currentWeapon[playerID]];
	    event_user(0); //Colors
    
	    with prtPlayerProjectile if playerID == other.playerID instance_destroy();
	    with objReflectedProjectile instance_destroy();
	    with prtRush instance_destroy();
	    with objRushJet instance_destroy();
    
	    if onRushJet == true
	    {
	        onRushJet = false;
	        canMove = true;
	    }
    
	    playSFX(sfxWeaponSwitch);
    
	    sound_stop(sfxCharging);
	    sound_stop(sfxCharged);
	}

	//Timer
	if drawWeaponIconTimer != -1
	{
	    drawWeaponIconTimer -= 1;
	    if drawWeaponIconTimer == 0
	    {
	        drawWeaponIcon = false;
	    }
	}


}
