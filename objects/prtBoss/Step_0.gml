if instance_exists(objMegaman)
{
	playerID = objMegaman.playerID;
}
else
{
	playerID = 1;
}
if global.frozen == false
{   
    if isIntro == true
    {
        if y < ystart
            gravityNoGround();
        else
        {
            y = ystart;
            sprite_index = pose;
            yspeed = 0;
            
            if image_speed == 0
                image_index = 0;
            image_speed = poseImgSpeed;
            
            if image_index >= image_number-1
            {
                image_index = image_number-1;
                image_speed = 0;
                isIntro = false;
            }
        }
    }
    
    
    //Starting the actual fight
    if startFight == true
    {
        startFight = false;
        isFight = true;
    }
    
    
    //Hitspark and death
    if healthpoints < prevHealthPoints
    {
        if healthpoints > 0
        {
            canHit = false;
            alarm[9] = 1;
            alarm[10] = 45/hitByBassBuster; //Being able to get hit again
            drawBoss = true;
            drawHitSpark = false;
            
            global.bossHealth = healthpoints;
        }
        else
        {
            global.bossHealth = 0;
            sound_stop_all();
            playSFX(sfxDeath);
            
            var i, explosionID;
                
            i = 0;
            repeat 8
            {
                explosionID = instance_create(x, y, objMegamanExplosion);
                    explosionID.dir = i;
                    explosionID.spd = 1.5;
                    
                i += 45;
            }
            
            i = 0;
            repeat 8
            {
                explosionID = instance_create(x, y, objMegamanExplosion);
                    explosionID.dir = i;
                    explosionID.spd = 2.5;
                    
                i += 45;
            }
            
            instance_destroy();
            var deathTimer = instance_create(x, y, objBossDeathTimer)
			deathTimer.playerID = playerID;
        }
    }
    
    prevHealthPoints = healthpoints;
	
	if isFight
    {
        if (instance_exists(objMegaman) && (!instance_exists(objBossDeathTimer)))
        {
            if ((x < objMegaman.sectionLeft))
                x = objMegaman.sectionLeft
            else if ((x > objMegaman.sectionRight))
                x = objMegaman.sectionRight
            if ((y < objMegaman.sectionTop))
                y = objMegaman.sectionTop
        }
    }
}
else
{
    if alarm[9] != -1
        alarm[9] += 1;
    if alarm[10] != -1
        alarm[10] += 1;
}

