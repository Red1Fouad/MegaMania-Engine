/// @function playMusic
/// @param filename
/// @description Plays music
function playMusic(musicAsset)
{
	//Example: playMusic(mscBeta)

	stopMusic();
	global.msc = audio_play_sound(musicAsset, 100, true);
}
