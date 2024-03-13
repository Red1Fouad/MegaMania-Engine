event_inherited();

if (!global.frozen && !dead) {
    gravityCheckGround();
    generalCollision();
    checkGround();

    if (!visible) {
        facePlayer();
    }
    
    idleAnim += 0.1;
    if (idleAnim >= 4) {
        idleAnim -= 4;
    }

    switch (phase) {
        case 0:
            phaseFrames += 1;
            var wait = (previousPhase == 2) ? 100 : 70;
            if (phaseFrames > wait) {
                phaseFrames = 0;
                randomize();
                phase = irandom(1) ? 1 : 2;
                drillShoot = 0;
                missileShoot = 0;
                canShootMissile = 1;
                image_index = 0;
                sprite_index = (phase == 1) ? sprSydeckaAttackDrill : sprSydeckaAttackMissiles;
                previousPhase = phase;
            }
            break;

        case 1:
            var canAnimate = true;
            var floorImageIndex = floor(image_index);
            if ((floorImageIndex == 1 && phaseFrames < 40) || (floorImageIndex == 5 && phaseFrames < 20)) {
                canAnimate = false;
            }
            
            if (canAnimate) {
                image_index += 0.2;
            }

            if (drillShoot == 1 && floorImageIndex == 6) {
                image_index = 0;
                sprite_index = sprSydeckaIdle;
                phase = 0;
                idleAnim = 1;
                phaseFrames = 0;
            } else {
                phaseFrames += 1;
                if (floorImageIndex == 5 && drillShoot == 0) {
                    drillShoot = 1;
                    var projectileID = instance_create(x + sign(image_xscale) * 35, y, objSydeckaDrill);
                    projectileID.xDir = sign(image_xscale);
                    projectileID.image_xscale = sign(image_xscale);
                    playSFX(sfxSydeckaThrow);
                    phaseFrames = 0;
                }
            }
            break;

        case 2:
            var floorImageIndex = floor(image_index);
            if (floorImageIndex == 2 && phaseFrames < 12) {
                phaseFrames += 1;
                image_speed = 0;
            } else {
                image_speed = 0.2;
            }

            if (floorImageIndex == 2 && canShootMissile == 1) {
                canShootMissile = 0;
                missileShoot++;
                var projectileID = instance_create(x - sign(image_xscale) * 4, y - 21, objSydeckaMissile);
                projectileID.xDir = sign(image_xscale);
                projectileID.horizontalDelay = missileShoot - 1;
                playSFX(sfxSydeckaThrow);
                phaseFrames = 0;
            }
            break;
    }

    x += xspeed;
    y += yspeed;
} else if (dead == 1) {
    facePlayer();
    xspeed = 0;
    yspeed = 0;
    phase = 0;
    phaseFrames = 0;
    image_index = 0;
    sprite_index = sprSydeckaIdle;
}
