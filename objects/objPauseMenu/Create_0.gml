blackAlpha = 0;
blackAlphaIncrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 2;
playerID = 1;
character = 0;
phase = 0;  //0: increasing the black rectangle's alpha
option = global.currentWeapon[global.playerID];
oldWeapon = global.weapon[playerID];
resetWeapon = false; //Should we, after exiting the menu, reset our weapon to the weapon that was used before the pause menu was opened? 

primary_color = make_color_rgb(0,0,0);
secondary_color = make_color_rgb(0,0,0);
outline_color = make_color_rgb(0,0,0);

with objMegaman event_user(0);

