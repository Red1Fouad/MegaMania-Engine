// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function controlsMenu(){
	switch controlsCounter
	{
	    case 0:
	        if ((deviceID != -1))
	            controlsCounter++
	        else if keyboard_check(vk_escape)
	        {
	            audio_play_sound(sfxDeath, 0, false)
	            instance_destroy()
	        }
	        break
	    case 1:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseJumpButton = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseJumpButton = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseJumpButton = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseJumpButton = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseJumpButton = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseJumpButton = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseJumpButton = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseJumpButton = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseJumpButton = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseJumpButton = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 2:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseShootButton = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseShootButton = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseShootButton = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseShootButton = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseShootButton = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseShootButton = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseShootButton = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseShootButton = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseShootButton = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseShootButton = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 3:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseS1Button = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseS1Button = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseS1Button = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseS1Button = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseS1Button = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseS1Button = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseS1Button = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseS1Button = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseS1Button = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseS1Button = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 4:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseS2Button = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseS2Button = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseS2Button = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseS2Button = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseS2Button = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseS2Button = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseS2Button = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseS2Button = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseS2Button = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseS2Button = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 5:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseSlideButton = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseSlideButton = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseSlideButton = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseSlideButton = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseSlideButton = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseSlideButton = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseSlideButton = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseSlideButton = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseSlideButton = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseSlideButton = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 6:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseStartButton = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseStartButton = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseStartButton = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseStartButton = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseStartButton = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseStartButton = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseStartButton = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseStartButton = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseStartButton = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseStartButton = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	        }
	        break
	    case 7:
	        if gamepad_button_check_pressed(deviceID, gp_face1)
	        {
	            chooseSelectButton = 32769
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face2)
	        {
	            chooseSelectButton = 32770
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face3)
	        {
	            chooseSelectButton = 32771
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_face4)
	        {
	            chooseSelectButton = 32772
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderl)
	        {
	            chooseSelectButton = 32773
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderlb)
	        {
	            chooseSelectButton = 32775
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderr)
	        {
	            chooseSelectButton = 32774
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_shoulderrb)
	        {
	            chooseSelectButton = 32776
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_select)
	        {
	            chooseSelectButton = 32777
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
	        else if gamepad_button_check_pressed(deviceID, gp_start)
	        {
	            chooseSelectButton = 32778
	            controlsCounter++
	            audio_play_sound(sfxImportantItem, 0, false)
	            isDone = 1
	        }
			break
	}

}