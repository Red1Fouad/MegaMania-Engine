if isMM == true && teleporting == false
{
    if absorbing == false
    {
        var destX;
        destX = round(global.viewX + (global.viewWidth/2));
        
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        if x < destX-2 || x > destX+2
        {
            if x < destX
            {
                xspeed = 1.296875;
                image_xscale = 1;
            }
            else if x > destX
            {
                xspeed = -1.296875;
                image_xscale = -1;
            }
            
            if (place_meeting(x+xspeed*8, y, objSolid) || place_meeting(x+xspeed*8, y, prtMovingPlatformSolid))
            && ground == true
            {
                if ((position_meeting(bbox_right+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_right+xspeed*8, bbox_top, prtMovingPlatformSolid))
                && image_xscale == 1)
                || ((position_meeting(bbox_left+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_left+xspeed*8, bbox_top, prtMovingPlatformSolid))
                && image_xscale == -1) //If we are blocked by a wall of at least 2 blocks high, perform a high jump
                    yspeed = -5.25;
                else //Else, perform a short, 1-block-high jump
                    yspeed = -3.5;
            }
            
            if ground == true
                sprite_index = asset_get_index("spr"+character+"Walk");
            else
                sprite_index = asset_get_index("spr"+character+"Jump");
                
                
            if prevGround == false && ground == true
                playSFX(sfxLand);
                
            prevGround = ground;
        }
        else
        {
            if canInitJump == true && ground == true
            {
                if global.weaponUnlocked[global.weaponID] == false //Only absorb the power if it's not already been unlocked
                {
                    canInitJump = false;
                    
                    x = destX;
                    sprite_index = asset_get_index("spr"+character+"Jump");
                    yspeed = -8;
                    xspeed = 0;
                }
                else
                {
                    //Teleport out
                    yspeed = 0;
                    teleporting = true;
                    alarm[2] = 60;
                    playSFX(sfxTeleportOut);
                    sprite_index = asset_get_index("spr"+character+"Teleport");;
                }
            }
            
            if yspeed > 0 && y >= global.viewY+112 && canInitJump == false && global.weaponUnlocked[global.weaponID] == false
            {
                y = global.viewY+112;
                absorbing = true;
            }
        }
        
        
        x += xspeed;
        y += yspeed;
    }
    else
    {
        //Absorbing the boss's power
        if !instance_exists(objAbsorbEffect)
        {
            if absorbAmount < 3
            {
                absorbAmount += 1;
                
                playSFX(sfxAbsorb);
                var ID, fastSpd, slowSpd, radius, angle;
                fastSpd = 7;
                slowSpd = 3;radius = global.viewWidth/2;
                angle = 0;
                
                repeat 8
                {
                    angle += 0.25*pi;
                    
                    ID = instance_create(sprite_get_xcenter() + radius*cos(angle), sprite_get_ycenter() + radius*sin(angle), objAbsorbEffect);
                        ID.spd = fastSpd;
                    ID = instance_create(sprite_get_xcenter() + radius*cos(angle), sprite_get_ycenter() + radius*sin(angle), objAbsorbEffect);
                        ID.spd = slowSpd; 
                }
            }
            else
            {
                checkGround();
                gravityCheckGround();
                generalCollision();
                
                if ground == true
                {
                    sprite_index = asset_get_index("spr"+character+"Stand");
                    image_speed = 0;
                    image_index = 0;
                    
                    startTeleportTimer += 1;
                    if startTeleportTimer >= 55
                    {
                        startTeleportTimer = 0;
                        yspeed = 0;
                        teleporting = true;
                        alarm[2] = 60;
                        playSFX(sfxTeleportOut);
                        sprite_index = asset_get_index("spr"+character+"Teleport");
                    }
                }
                
                y += yspeed;
            }
        }
    }
}

