sprite_index = sprRushTeleport;
playSFX(sfxTeleportOut);
image_index = 2.9;
image_speed = -anim_spd * 2;
leaving = true;
while place_meeting(x, y, objSolid) {
    y--;
}