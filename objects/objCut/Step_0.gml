event_inherited();

if (global.frozen == false) {
    if isFight {
        generalCollision();
        checkGround();
        gravityCheckGround();

        if (delay > 0) {
            delay -= 1;
        }

        if (phase == 0) {
            if (playedAttackSound == 0) {
                playedAttackSound = 1;
                playSFX(sfxCutmanAttack);
            }
        }

        switch (phase) {
            case 0:
                xspeed = 0;
                sprite_index = spriteStand[cutter];
                image_speed = 0.15;
                attackTimer -= 1;
                attackTimer = round(attackTimer);

                if (attackTimer <= 0) {
                    randomize();
                    if (attackTimer == -1)
                        phase = 1;
                    else
                        phase = 2;
                    attackTimer = 60;
                }
                break;

            case 1:
                image_speed = 0.15;

                if (ground) {
                    sprite_index = spriteRun[cutter];
                    xspeed = image_xscale * 1.5;
                    getLastXspeed = xspeed;
                } else {
                    sprite_index = spriteJump[cutter];
                    xspeed = getLastXspeed;
                }

                generalCollision();

                if (xspeed == 0 && ground)
                    yspeed = -6;

                if (instance_exists(objMegaman)) {
                    if (distance_to_point(getTarget().x, y) < 48 && ground) {
                        randomize();
                        if (cutter == 0)
                            phase = 3;
                        else {
                            phase = choose(0, 2);
                            if (phase == 0)
                                playedAttackSound = 0;
                        }
                        attackTimer = 60;
                    }
                }
                break;

            case 2:
                attackTimer = round(attackTimer);

                if (attackTimer == 60)
                    attackTimer = 30;

                attackTimer -= 1;
                xspeed = 0;
                sprite_index = sprCutThrow;
                image_speed = 0;

                if (attackTimer > 10) {
                    if (cutter == 0) {
                        phase = 3;
                        attackTimer = 60;
                    }
                    image_index = 0;
                } else if (attackTimer == 10) {
                    image_index = 1;
                    cutterID = instance_create(x, y, objCutBullet);
                    cutterID.parentID = id;
                }

                if (attackTimer <= 0) {
                    if (instance_exists(objMegaman)) {
                        if (distance_to_point(getTarget().x, y) > 48)
                            phase = 1;
                        else
                            phase = 3;
                    }
                    attackTimer = 60;
                }
                break;

            case 3:
                attackTimer = round(attackTimer);

                if (ground && attackTimer == 60 && delay == 0) {
                    attackTimer -= 1;
                    xspeed = image_xscale * 1.5;
                    getLastXspeed = xspeed;
                    yspeed = -6;
                }

                sprite_index = spriteJump[cutter];
                xspeed = getLastXspeed;

                if (ground) {
                    delay = 5;
                    randomize();
                    phase = 1;
                    attackTimer = 60;
                }
                break;
        }

        if (hasKnockback == 1 && knockbackTimer > -1) {
            if (knockbackTimer > 0) {
                if (yspeed < 0)
                    yspeed = 0;

                knockbackTimer -= 1;
                phase = 4;
                sprite_index = spriteRun[cutter];
                image_index = 1;
                xspeed = -0.5 * image_xscale;
            } else if (phase == 4) {
                if (ground == 1)
                    sprite_index = spriteStand[cutter];
                else
                    sprite_index = spriteJump[cutter];

                phase = 0;
                playedAttackSound = 1;
                attackTimer = 0;
                knockbackTimer = -2;
            }
        } else if (phase == 4) {
            if (ground == 1)
                sprite_index = spriteStand[cutter];
            else
                sprite_index = spriteJump[cutter];

            phase = 0;
            playedAttackSound = 1;
            attackTimer = 0;
            knockbackTimer = -2;
        }

        if (instance_exists(objMegaman) && (hasKnockback == 0 || (hasKnockback == 1 && knockbackTimer <= -1))) {
            if (x > getTarget().x)
                image_xscale = -1;
            else
                image_xscale = 1;
        }
    }

    if (instance_exists(cutterID))
        cutter = 0;
    else
        cutter = 1;

    if ((xspeed > 0 && !(place_meeting(x + xspeed + 2, y, objSolid))) || (xspeed < 0 && !(place_meeting(x + xspeed - 2, y, objSolid)))) {
        x += xspeed;
    }

    y += yspeed;
} else {
    image_speed = 0;
}
