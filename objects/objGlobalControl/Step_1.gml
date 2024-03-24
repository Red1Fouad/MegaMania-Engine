//Player 1
global.keyLeft = keyboard_check(leftKey) || gamepad_axis_value(global.deviceID[0], gp_axislh) < -0.2 || gamepad_button_check(global.deviceID[0], leftButton);
global.keyRight = keyboard_check(rightKey) || gamepad_axis_value(global.deviceID[0], gp_axislh) > 0.2 || gamepad_button_check(global.deviceID[0], rightButton);
global.keyUp = keyboard_check(upKey) || gamepad_axis_value(global.deviceID[0], gp_axislv) < -0.2 || gamepad_button_check(global.deviceID[0], upButton);
global.keyDown = keyboard_check(downKey) || gamepad_axis_value(global.deviceID[0], gp_axislv) > 0.2 || gamepad_button_check(global.deviceID[0], downButton);
global.keyJump = keyboard_check(jumpKey) || gamepad_button_check(global.deviceID[0], jumpButton);
global.keyShoot = keyboard_check(shootKey) || gamepad_button_check(global.deviceID[0], shootButton);
global.keyPause = keyboard_check(pauseKey) || gamepad_button_check(global.deviceID[0], pauseButton);
global.keyWeaponSwitchLeft = keyboard_check(weaponSwitchLeftKey) || gamepad_button_check(global.deviceID[0], weaponSwitchLeftButton);
global.keyWeaponSwitchRight = keyboard_check(weaponSwitchRightKey) || gamepad_button_check(global.deviceID[0], weaponSwitchRightButton);
global.keySlide = keyboard_check(slideKey) || gamepad_button_check(global.deviceID[0], slideButton);

global.keyLeftPressed = keyboard_check_pressed(leftKey) || gamepad_button_check_pressed(global.deviceID[0], leftButton);
global.keyRightPressed = keyboard_check_pressed(rightKey) || gamepad_button_check_pressed(global.deviceID[0], rightButton);
global.keyUpPressed = keyboard_check_pressed(upKey) || gamepad_button_check_pressed(global.deviceID[0], upButton);
global.keyDownPressed = keyboard_check_pressed(downKey) || gamepad_button_check_pressed(global.deviceID[0], downButton);
global.keyJumpPressed = keyboard_check_pressed(jumpKey) || gamepad_button_check_pressed(global.deviceID[0], jumpButton);
global.keyShootPressed = keyboard_check_pressed(shootKey) || gamepad_button_check_pressed(global.deviceID[0], shootButton);
global.keyPausePressed = keyboard_check_pressed(pauseKey) || gamepad_button_check_pressed(global.deviceID[0], pauseButton);
global.keyWeaponSwitchLeftPressed = keyboard_check_pressed(weaponSwitchLeftKey) || gamepad_button_check_pressed(global.deviceID[0], weaponSwitchLeftButton);
global.keyWeaponSwitchRightPressed = keyboard_check_pressed(weaponSwitchRightKey) || gamepad_button_check_pressed(global.deviceID[0], weaponSwitchRightButton);
global.keySlidePressed = keyboard_check_pressed(slideKey) || gamepad_button_check_pressed(global.deviceID[0], slideButton);

global.keyLeftReleased = keyboard_check_released(leftKey) || gamepad_button_check_released(global.deviceID[0], leftButton);
global.keyRightReleased = keyboard_check_released(rightKey || gamepad_button_check_released(global.deviceID[0], rightButton));
global.keyUpReleased = keyboard_check_released(upKey) || gamepad_button_check_released(global.deviceID[0], upButton);
global.keyDownReleased = keyboard_check_released(downKey) || gamepad_button_check_released(global.deviceID[0], downButton);
global.keyJumpReleased = keyboard_check_released(jumpKey) || gamepad_button_check_released(global.deviceID[0], jumpButton);
global.keyShootReleased = keyboard_check_released(shootKey) || gamepad_button_check_released(global.deviceID[0], shootButton);
global.keyPauseReleased = keyboard_check_released(pauseKey) || gamepad_button_check_released(global.deviceID[0], pauseButton);
global.keyWeaponSwitchLeftReleased = keyboard_check_released(weaponSwitchLeftKey) || gamepad_button_check_released(global.deviceID[0], weaponSwitchLeftButton);
global.keyWeaponSwitchRightReleased = keyboard_check_released(weaponSwitchRightKey) || gamepad_button_check_released(global.deviceID[0], weaponSwitchRightButton);
global.keySlideReleased = keyboard_check_released(slideKey) || gamepad_button_check_released(global.deviceID[0], slideButton);


//Player 2
global.keyLeft2 = keyboard_check(leftKey2) || gamepad_axis_value(global.deviceID[1], gp_axislh) < -0.2 || gamepad_button_check(global.deviceID[1], leftButton2);
global.keyRight2 = keyboard_check(rightKey2) || gamepad_axis_value(global.deviceID[1], gp_axislh) > 0.2 || gamepad_button_check(global.deviceID[1], rightButton2);
global.keyUp2 = keyboard_check(upKey2) || gamepad_axis_value(global.deviceID[1], gp_axislv) < -0.2 || gamepad_button_check(global.deviceID[1], upButton2);
global.keyDown2 = keyboard_check(downKey2) || gamepad_axis_value(global.deviceID[1], gp_axislv) > 0.2 || gamepad_button_check(global.deviceID[1], downButton2);
global.keyJump2 = keyboard_check(jumpKey2) || gamepad_button_check(global.deviceID[1], jumpButton2);
global.keyShoot2 = keyboard_check(shootKey2) || gamepad_button_check(global.deviceID[1], shootButton2);
global.keyPause2 = keyboard_check(pauseKey2) || gamepad_button_check(global.deviceID[1], pauseButton2);
global.keyWeaponSwitchLeft2 = keyboard_check(weaponSwitchLeftKey2) || gamepad_button_check(global.deviceID[1], weaponSwitchLeftButton2);
global.keyWeaponSwitchRight2 = keyboard_check(weaponSwitchRightKey2) || gamepad_button_check(global.deviceID[1], weaponSwitchRightButton2);
global.keySlide2 = keyboard_check(slideKey2) || gamepad_button_check(global.deviceID[1], slideButton2);

global.keyLeft2Pressed = keyboard_check_pressed(leftKey2) || gamepad_button_check_pressed(global.deviceID[1], leftButton2);
global.keyRight2Pressed = keyboard_check_pressed(rightKey2) || gamepad_button_check_pressed(global.deviceID[1], rightButton2);
global.keyUp2Pressed = keyboard_check_pressed(upKey2) || gamepad_button_check_pressed(global.deviceID[1], upButton2);
global.keyDown2Pressed = keyboard_check_pressed(downKey2) || gamepad_button_check_pressed(global.deviceID[1], downButton2);
global.keyJump2Pressed = keyboard_check_pressed(jumpKey2) || gamepad_button_check_pressed(global.deviceID[1], jumpButton2);
global.keyShoot2Pressed = keyboard_check_pressed(shootKey2) || gamepad_button_check_pressed(global.deviceID[1], shootButton2);
global.keyPause2Pressed = keyboard_check_pressed(pauseKey2) || gamepad_button_check_pressed(global.deviceID[1], pauseButton2);
global.keyWeaponSwitchLeft2Pressed = keyboard_check_pressed(weaponSwitchLeftKey2) || gamepad_button_check_pressed(global.deviceID[1], weaponSwitchLeftButton2);
global.keyWeaponSwitchRight2Pressed = keyboard_check_pressed(weaponSwitchRightKey2) || gamepad_button_check_pressed(global.deviceID[1], weaponSwitchRightButton2);
global.keySlide2Pressed = keyboard_check_pressed(slideKey2) || gamepad_button_check_pressed(global.deviceID[1], slideButton2);

global.keyLeft2Released = keyboard_check_released(leftKey2) || gamepad_button_check_released(global.deviceID[1], leftButton2);
global.keyRight2Released = keyboard_check_released(rightKey2 || gamepad_button_check_released(global.deviceID[1], rightButton2));
global.keyUp2Released = keyboard_check_released(upKey2) || gamepad_button_check_released(global.deviceID[1], upButton2);
global.keyDown2Released = keyboard_check_released(downKey2) || gamepad_button_check_released(global.deviceID[1], downButton2);
global.keyJump2Released = keyboard_check_released(jumpKey2) || gamepad_button_check_released(global.deviceID[1], jumpButton2);
global.keyShoot2Released = keyboard_check_released(shootKey2) || gamepad_button_check_released(global.deviceID[1], shootButton2);
global.keyPause2Released = keyboard_check_released(pauseKey2) || gamepad_button_check_released(global.deviceID[1], pauseButton2);
global.keyWeaponSwitchLeft2Released = keyboard_check_released(weaponSwitchLeftKey2) || gamepad_button_check_released(global.deviceID[1], weaponSwitchLeftButton2);
global.keyWeaponSwitchRight2Released = keyboard_check_released(weaponSwitchRightKey2) || gamepad_button_check_released(global.deviceID[1], weaponSwitchRightButton2);
global.keySlide2Released = keyboard_check_released(slideKey2) || gamepad_button_check_released(global.deviceID[1], slideButton2);

/*
global.keyLeft2 = keyboard_check(leftKey2);
global.keyRight2 = keyboard_check(rightKey2);
global.keyUp2 = keyboard_check(upKey2);
global.keyDown2 = keyboard_check(downKey2);
global.keyJump2 = keyboard_check(jumpKey2);
global.keyShoot2 = keyboard_check(shootKey2);
global.keySlide2 = keyboard_check(slideKey2);
global.keyPause2 = keyboard_check(pauseKey2);
global.keyWeaponSwitchLeft2 = keyboard_check(weaponSwitchLeftKey2);
global.keyWeaponSwitchRight2 = keyboard_check(weaponSwitchRightKey2);

global.keyLeft2Pressed = keyboard_check_pressed(leftKey2);
global.keyRight2Pressed = keyboard_check_pressed(rightKey2);
global.keyUp2Pressed = keyboard_check_pressed(upKey2);
global.keyDown2Pressed = keyboard_check_pressed(downKey2);
global.keyJump2Pressed = keyboard_check_pressed(jumpKey2);
global.keyShoot2Pressed = keyboard_check_pressed(shootKey2);
global.keySlide2Pressed = keyboard_check_pressed(slideKey2);
global.keyPause2Pressed = keyboard_check_pressed(pauseKey2);
global.keyWeaponSwitchLeft2Pressed = keyboard_check_pressed(weaponSwitchLeftKey2);
global.keyWeaponSwitchRight2Pressed = keyboard_check_pressed(weaponSwitchRightKey2);

global.keyLeft2Released = keyboard_check_released(leftKey2);
global.keyRight2Released = keyboard_check_released(rightKey2);
global.keyUp2Released = keyboard_check_released(upKey2);
global.keyDown2Released = keyboard_check_released(downKey2);
global.keyJump2Released = keyboard_check_released(jumpKey2);
global.keyShoot2Released = keyboard_check_released(shootKey2);
global.keySlide2Released = keyboard_check_released(slideKey2);
global.keyPause2Released = keyboard_check_released(pauseKey2);
global.keyWeaponSwitchLeft2Released = keyboard_check_released(weaponSwitchLeftKey2);
global.keyWeaponSwitchRight2Released = keyboard_check_released(weaponSwitchRightKey2);

//Player 2 gamepad
if (gamepad_button_check(1, gp_padl) || (gamepad_axis_value(1, gp_axislh) < -0.5))
    global.keyLeft2 = 1
if (gamepad_button_check(1, gp_padr) || (gamepad_axis_value(1, gp_axislh) > 0.5))
    global.keyRight2 = 1
if (gamepad_button_check(1, gp_padu) || (gamepad_axis_value(1, gp_axislv) < -0.5))
    global.keyUp2 = 1
if (gamepad_button_check(1, gp_padd) || (gamepad_axis_value(1, gp_axislv) > 0.5))
    global.keyDown2 = 1
if gamepad_button_check(1, gp_face1)
    global.keyJump2 = 1
if gamepad_button_check(1, gp_face3)
    global.keyShoot2 = 1
if gamepad_button_check(1, gp_face2)
    global.keySlide2 = 1
if gamepad_button_check(1, gp_start)
    global.keyPause2 = 1
if gamepad_button_check(1, gp_shoulderl)
    global.keyWeaponSwitchLeft2 = 1
if gamepad_button_check(1, gp_shoulderr)
    global.keyWeaponSwitchRight2 = 1
if (gamepad_button_check_pressed(1, gp_padl) || ((gamepad_axis_value(1, gp_axislh) < -0.5) && (prevHorAxis[1] >= -0.5)))
    global.keyLeft2Pressed = 1
if (gamepad_button_check_pressed(1, gp_padr) || ((gamepad_axis_value(1, gp_axislh) > 0.5) && (prevHorAxis[1] <= 0.5)))
    global.keyRight2Pressed = 1
if (gamepad_button_check_pressed(1, gp_padu) || ((gamepad_axis_value(1, gp_axislv) < -0.5) && (prevVertAxis[1] >= -0.5)))
    global.keyUp2Pressed = 1
if (gamepad_button_check_pressed(1, gp_padd) || ((gamepad_axis_value(1, gp_axislv) > 0.5) && (prevVertAxis[1] <= 0.5)))
    global.keyDown2Pressed = 1
if gamepad_button_check_pressed(1, gp_face1)
    global.keyJump2Pressed = 1
if gamepad_button_check_pressed(1, gp_face3)
    global.keyShoot2Pressed = 1
if gamepad_button_check_pressed(1, gp_face2)
    global.keySlide2Pressed = 1
if gamepad_button_check_pressed(1, gp_start)
    global.keyPause2Pressed = 1
if gamepad_button_check_pressed(1, gp_shoulderl)
    global.keyWeaponSwitchLeft2Pressed = 1
if gamepad_button_check_pressed(1, gp_shoulderr)
    global.keyWeaponSwitchRight2Pressed = 1
if (gamepad_button_check_released(1, gp_padl) || ((gamepad_axis_value(1, gp_axislh) >= -0.5) && (prevHorAxis[1] < -0.5)))
    global.keyLeft2Released = 1
if (gamepad_button_check_released(1, gp_padr) || ((gamepad_axis_value(1, gp_axislh) <= 0.5) && (prevHorAxis[1] > 0.5)))
    global.keyRight2Released = 1
if (gamepad_button_check_released(1, gp_padu) || ((gamepad_axis_value(1, gp_axislv) >= -0.5) && (prevVertAxis[1] < -0.5)))
    global.keyUp2Released = 1
if (gamepad_button_check_released(1, gp_padd) || ((gamepad_axis_value(1, gp_axislv) <= 0.5) && (prevVertAxis[1] > 0.5)))
    global.keyDown2Released = 1
if gamepad_button_check_released(1, gp_face1)
    global.keyJump2Released = 1
if gamepad_button_check_released(1, gp_face3)
    global.keyShoot2Released = 1
if gamepad_button_check_released(1, gp_face2)
    global.keySlide2Released = 1
if gamepad_button_check_released(1, gp_start)
    global.keyPause2Released = 1
if gamepad_button_check_released(1, gp_shoulderl)
    global.keyWeaponSwitchLeft2Released = 1
if gamepad_button_check_released(1, gp_shoulderr)
    global.keyWeaponSwitchRight2Released = 1
prevHorAxis[1] = gamepad_axis_value(1, gp_axislh)
prevVertAxis[1] = gamepad_axis_value(1, gp_axislv)
/*
for (i = 0; i < gamepad_get_device_count(); i++)
{
    if (gamepad_button_check(i, gp_padl) || (gamepad_axis_value(i, gp_axislh) < -0.5))
        global.keyLeft2 = 1
    if (gamepad_button_check(i, gp_padr) || (gamepad_axis_value(i, gp_axislh) > 0.5))
        global.keyRight2 = 1
    if (gamepad_button_check(i, gp_padu) || (gamepad_axis_value(i, gp_axislv) < -0.5))
        global.keyUp2 = 1
    if (gamepad_button_check(i, gp_padd) || (gamepad_axis_value(i, gp_axislv) > 0.5))
        global.keyDown2 = 1
    if gamepad_button_check(i, gp_face1)
        global.keyJump2 = 1
    if gamepad_button_check(i, gp_face3)
        global.keyShoot2 = 1
    if gamepad_button_check(i, gp_face2)
        global.keySlide2 = 1
    if gamepad_button_check(i, gp_start)
        global.keyPause2 = 1
    if gamepad_button_check(i, gp_shoulderl)
        global.keyWeaponSwitchLeft2 = 1
    if gamepad_button_check(i, gp_shoulderr)
        global.keyWeaponSwitchRight2 = 1
    if (gamepad_button_check_pressed(i, gp_padl) || ((gamepad_axis_value(i, gp_axislh) < -0.5) && (prevHorAxis[i] >= -0.5)))
        global.keyLeft2Pressed = 1
    if (gamepad_button_check_pressed(i, gp_padr) || ((gamepad_axis_value(i, gp_axislh) > 0.5) && (prevHorAxis[i] <= 0.5)))
        global.keyRight2Pressed = 1
    if (gamepad_button_check_pressed(i, gp_padu) || ((gamepad_axis_value(i, gp_axislv) < -0.5) && (prevVertAxis[i] >= -0.5)))
        global.keyUp2Pressed = 1
    if (gamepad_button_check_pressed(i, gp_padd) || ((gamepad_axis_value(i, gp_axislv) > 0.5) && (prevVertAxis[i] <= 0.5)))
        global.keyDown2Pressed = 1
    if gamepad_button_check_pressed(i, gp_face1)
        global.keyJump2Pressed = 1
    if gamepad_button_check_pressed(i, gp_face3)
        global.keyShoot2Pressed = 1
    if gamepad_button_check_pressed(i, gp_face2)
        global.keySlide2Pressed = 1
    if gamepad_button_check_pressed(i, gp_start)
        global.keyPause2Pressed = 1
    if gamepad_button_check_pressed(i, gp_shoulderl)
        global.keyWeaponSwitchLeft2Pressed = 1
    if gamepad_button_check_pressed(i, gp_shoulderr)
        global.keyWeaponSwitchRight2Pressed = 1
    if (gamepad_button_check_released(i, gp_padl) || ((gamepad_axis_value(i, gp_axislh) >= -0.5) && (prevHorAxis[i] < -0.5)))
        global.keyLeft2Released = 1
    if (gamepad_button_check_released(i, gp_padr) || ((gamepad_axis_value(i, gp_axislh) <= 0.5) && (prevHorAxis[i] > 0.5)))
        global.keyRight2Released = 1
    if (gamepad_button_check_released(i, gp_padu) || ((gamepad_axis_value(i, gp_axislv) >= -0.5) && (prevVertAxis[i] < -0.5)))
        global.keyUp2Released = 1
    if (gamepad_button_check_released(i, gp_padd) || ((gamepad_axis_value(i, gp_axislv) <= 0.5) && (prevVertAxis[i] > 0.5)))
        global.keyDown2Released = 1
    if gamepad_button_check_released(i, gp_face1)
        global.keyJump2Released = 1
    if gamepad_button_check_released(i, gp_face3)
        global.keyShoot2Released = 1
    if gamepad_button_check_released(i, gp_face2)
        global.keySlide2Released = 1
    if gamepad_button_check_released(i, gp_start)
        global.keyPause2Released = 1
    if gamepad_button_check_released(i, gp_shoulderl)
        global.keyWeaponSwitchLeft2Released = 1
    if gamepad_button_check_released(i, gp_shoulderr)
        global.keyWeaponSwitchRight2Released = 1
    prevHorAxis[i] = gamepad_axis_value(i, gp_axislh)
    prevVertAxis[i] = gamepad_axis_value(i, gp_axislv)
}