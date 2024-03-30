function playNSF(FILE, TRACK){
	
	stopMusic();
	global.currentMusic = GME_LoadSong(FILE)
	audio_sound_gain(global.currentMusic, 0.5, 0);
	GME_StartTrack(TRACK);
	GME_Play();

}