//Hotfix for Mac users
if os_macosx room_speed = 60;

if instance_exists(objMegaman)
{
    x = objMegaman.x;
    y = objMegaman.y;
	global.playerID = objMegaman.playerID;
}

//Debug keys
if keyboard_check_pressed(vk_escape)
{
    sound_stop_all();
    game_restart();
}
    
if keyboard_check_pressed(vk_f4)
    window_set_fullscreen( !window_get_fullscreen() );
	
//TEMP FOR DEMO
if keyboard_check_pressed(vk_f12)
{
	showCon = !showCon
}


if keyboard_check_pressed(vk_f11)
{
	global._health[1] = 0;
	global._health[2] = 0;
}
//if keyboard_check_pressed(vk_escape) game_end();

//Rename weapon depending on character
weaponName();

//Resize Game
var sizeToWrite = -1
if keyboard_check_pressed(vk_f1)
    sizeToWrite = 1
else if keyboard_check_pressed(vk_f2)
    sizeToWrite = 2
else if keyboard_check_pressed(vk_f3)
    sizeToWrite = 3
else if keyboard_check_pressed(vk_f4)
    sizeToWrite = 4
else if keyboard_check_pressed(vk_f5)
    sizeToWrite = 5
switch sizeToWrite
{
    case 1:
        window_set_size(256, 240)
        window_set_fullscreen(false)
        alarm[8] = 1
        break
    case 2:
        window_set_size(512, 240*2)
        window_set_fullscreen(false)
        alarm[8] = 1
        break
    case 3:
        window_set_size(768, 240*3)
        window_set_fullscreen(false)
        alarm[8] = 1
        break
    case 4:
        window_set_size(1024, 240*4)
        window_set_fullscreen(false)
        alarm[8] = 1
        break
    case 5:
        window_set_size(1024, 240*4)
        window_set_fullscreen(true)
        break
}