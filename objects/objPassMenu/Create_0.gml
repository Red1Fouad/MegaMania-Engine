option = 0;
selectedOption = false;
global.checkpoint = false;
global.levelStart = true;

if global._lives < 0
{
    global._lives = 2;
    gameOver = true;
    canSelectOption = false;
    playMusicNoLoopVolume(mscGameOver, 1);
    alarm[0] = 240;
}
else
{
    gameOver = false;
    canSelectOption = true;
    
    if global.passPlayVictory == true
        playMusicVolume(mscWeaponGet, 1);
}
    
var i;
for(i = 0; i <= global.totalWeapons; i += 1)
{
    global.ammo[1][i] = 28;
	global.ammo[2][i] = 28;
}

