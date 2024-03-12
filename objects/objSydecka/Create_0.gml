event_inherited()
respawn = 1
healthpointsStart = 20
healthpoints = healthpointsStart
contactDamage = 6
reflectProjectiles = 0
reflectProjectilesRight = 0
reflectProjectilesLeft = 0
ground = 1
xspeed = 0
yspeed = 0
facePlayerOnSpawn = 0
animationFramesLegs = 0
phaseFrames = 0
previousPhase = 2
drillShoot = 0
missileShoot = 0
canShootMissile = 1
image_speed = 0
image_index = 0
phase = 0
canStep = 0
if instance_exists(objMegaman)
{
    if x >= objMegaman.x
        image_xscale = -1;
    else
        image_xscale = 1;
}
dir = image_xscale
alarm[0] = 1
damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 1;

damagePharaohShot = 2;
damagePharaohShotCharged = 6;

damageStarCrash = 6;

damageSilverTomahawk = 2;
damageWindStorm = 2;