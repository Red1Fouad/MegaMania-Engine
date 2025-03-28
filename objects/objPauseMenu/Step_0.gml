switch phase
{
    case 0: //Fading in
        blackAlphaTimer += 1;
        if blackAlphaTimer >= blackAlphaTimerMax
        {
            blackAlphaTimer = 0;
            blackAlpha += blackAlphaIncrease;
            if blackAlpha >= 1
                phase = 1;
        }
    break;
    
    case 1: //Fading out
        event_user(0); //Moving the selection
            
        blackAlphaTimer += 1;
        if blackAlphaTimer >= blackAlphaTimerMax
        {
            blackAlphaTimer = 0;
            blackAlpha -= blackAlphaIncrease;
            if blackAlpha <= 0
                phase = 2;
        }
    break;
    
    case 2: //Idle
        event_user(0); //Moving the selection
            
        
        //Select the weapon/tank
        if keyJumpPressed || keyPausePressed || keyShootPressed
        {
            if option != global.totalWeapons+1 && option != global.totalWeapons+2
            {
                phase = 3;
                global.currentWeapon[playerID] = option;
                with prtPlayerProjectile instance_destroy();
                with objReflectedProjectile instance_destroy();
                with prtRush instance_destroy();
                with objRushJet instance_destroy(); //Could not be parented to prtRush since it's parented to prtMovingPlatformSolid
                with objMegaman
                {
                    if onRushJet == true
                    {
                        onRushJet = false;
                        canMove = true;
                    }
                }
                
                playSFX(sfxMenuSelect);
            }
            else if option == global.totalWeapons+1
            {
                if global.eTanks > 0 && global._health[playerID] < 28
                {
                    option = 99; //Nothing selected
                    phase = 5;
                    global.eTanks -= 1;
                    eTankTimer = 0;
                    sound_loop(sfxEnergyRestore);
                }
                else
                {
                    playSFX(sfxError);
                }
            }
            else if option == global.totalWeapons+2
            {
                if global.mTanks > 0
                {
                    var proceed;
                    proceed = false;
                    for(i = 1; i <= global.totalWeapons; i += 1)
                    {
                        if ceil(global.ammo[i][playerID]) < 28
                            proceed = true;
                    }
                    
                    if ceil(global._health[playerID]) < 28
                        proceed = true;
                        
                    if proceed == true //If proceed is still false after the past calculations, it seems there is nothing to fill
                    {
                        option = 99; //Nothing selected
                        phase = 6;
                        global.mTanks -= 1;
                        eTankTimer = 0;
                        sound_loop(sfxEnergyRestore);
                    }
                    else
                    {
                        playSFX(sfxError);
                    }
                }
                else
                {
                    playSFX(sfxError);
                }
            }
        }
    break;
    
    case 3: //Fading out
        blackAlphaTimer += 1;
        if blackAlphaTimer >= blackAlphaTimerMax
        {
            blackAlphaTimer = 0;
            blackAlpha += blackAlphaIncrease;
            if blackAlpha >= 1
            {
                phase = 4;
                if resetWeapon == true
                {
                    global.weapon[playerID] = oldWeapon;
                    with objMegaman event_user(0);
                }
            }
        }
    break;
    
    case 4: //Fading in
        blackAlphaTimer += 1;
        if blackAlphaTimer >= blackAlphaTimerMax
        {
            blackAlphaTimer = 0;
            blackAlpha -= blackAlphaIncrease;
            if blackAlpha <= 0
            {
                global.frozen = false;
                instance_destroy();
            }
        }
    break;
    
    case 5: //E-Tank restoring health
        if global._health[playerID] < 28
        {
            eTankTimer += 1;
            if eTankTimer >= 3
            {
                global._health[playerID] += 1;
                if global._health[playerID] > 28
                    global._health[playerID] = 28;
                eTankTimer = 0;
            }
        }
        else
        {
            eTankTimer = 0;
            phase = 2;
            option = oldWeapon;
            global.weapon[playerID] = oldWeapon;
            with objMegaman event_user(0);
            sound_stop(sfxEnergyRestore);
        }
    break;
    
    case 6: //M-Tank restoring energy
        eTankTimer += 1; //While it's technically an M-tank, we can use the same timer as the E-tank without any problems, since the two can't fill at the same time
        if eTankTimer >= 3
        {
            eTankTimer = 0;
            
            var proceed;
            proceed = false;
            for(i = 1; i <= global.totalWeapons; i += 1)
            {
                if global.ammo[i][playerID] < 28
                {
                    global.ammo[i][playerID] += 1;
                    if global.ammo[i][playerID] > 28
                        global.ammo[i][playerID] = 28;
                        
                    proceed = true;
                }
            }
            
            if global._health[playerID] < 28
            {
                global._health[playerID] += 1;
                if global._health[playerID] > 28
                    global._health[playerID] = 28;
                    
                proceed = true;
            }
            
            if proceed == false //If proceed is still false after all these calculations, it means everything has been filled
            {
                eTankTimer = 0;
                phase = 2;
                option = oldWeapon;
                global.weapon[playerID] = oldWeapon;
                with objMegaman event_user(0);
                sound_stop(sfxEnergyRestore);
            }
        }              
    break;
}

