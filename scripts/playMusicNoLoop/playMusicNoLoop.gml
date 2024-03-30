/// @function playMusicNoLoop
/// @param sound
/// @description Plays music without looping it
function playMusicNoLoop(musicAsset)
{
	//Example: playMusicNoLoop(mscBeta)

	stopMusic();

	global.msc = audio_play_sound(musicAsset, 100, false);
}
