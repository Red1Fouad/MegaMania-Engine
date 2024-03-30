function stopMusic(){
	
	if global.msc >= 0
		audio_stop_sound(global.msc);
	GME_Stop();

}