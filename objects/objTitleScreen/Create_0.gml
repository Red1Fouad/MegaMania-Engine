if !audio_is_playing(mscTitleScreen)
	playMusicVolumeLoopPoint(mscTitleScreen, 1, 1135713/3960623 , 1);

drawText = false;
drawTextTimer = 0;
drawTextTimerMax = 25;
canProceed = false;

// Set initial positions for logo parts
logo1_x = -sprite_get_width(sprLogo) / 2;
logo1_y = global.viewHeight / 2 - 60;
logo2_x = global.viewWidth + sprite_get_width(sprLogo) / 2;
logo2_y = global.viewHeight / 2 - 60;

// Set merging variables
merging_speed = 5;
doneMerging = false;
alpha = 0.5;
