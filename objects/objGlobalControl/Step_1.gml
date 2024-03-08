//Player 1	
global.keyLeft = keyboard_check(leftKey);
global.keyRight = keyboard_check(rightKey);
global.keyUp = keyboard_check(upKey);
global.keyDown = keyboard_check(downKey);
global.keyJump = keyboard_check(jumpKey);
global.keyShoot = keyboard_check(shootKey);
global.keySlide = keyboard_check(slideKey);
global.keyPause = keyboard_check(pauseKey);
global.keyWeaponSwitchLeft = keyboard_check(weaponSwitchLeftKey);
global.keyWeaponSwitchRight = keyboard_check(weaponSwitchRightKey);

global.keyLeftPressed = keyboard_check_pressed(leftKey);
global.keyRightPressed = keyboard_check_pressed(rightKey);
global.keyUpPressed = keyboard_check_pressed(upKey);
global.keyDownPressed = keyboard_check_pressed(downKey);
global.keyJumpPressed = keyboard_check_pressed(jumpKey);
global.keyShootPressed = keyboard_check_pressed(shootKey);
global.keySlidePressed = keyboard_check_pressed(slideKey);
global.keyPausePressed = keyboard_check_pressed(pauseKey);
global.keyWeaponSwitchLeftPressed = keyboard_check_pressed(weaponSwitchLeftKey);
global.keyWeaponSwitchRightPressed = keyboard_check_pressed(weaponSwitchRightKey);

global.keyLeftReleased = keyboard_check_released(leftKey);
global.keyRightReleased = keyboard_check_released(rightKey);
global.keyUpReleased = keyboard_check_released(upKey);
global.keyDownReleased = keyboard_check_released(downKey);
global.keyJumpReleased = keyboard_check_released(jumpKey);
global.keyShootReleased = keyboard_check_released(shootKey);
global.keySlideReleased = keyboard_check_released(slideKey);
global.keyPauseReleased = keyboard_check_released(pauseKey);
global.keyWeaponSwitchLeftReleased = keyboard_check_released(weaponSwitchLeftKey);
global.keyWeaponSwitchRightReleased = keyboard_check_released(weaponSwitchRightKey);

//Player 2
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

//Player 1 gamepad
if (gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < -0.5))
    global.keyLeft = 1
if (gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0.5))
    global.keyRight = 1
if (gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < -0.5))
    global.keyUp = 1
if (gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.5))
    global.keyDown = 1
if gamepad_button_check(0, gp_face1)
    global.keyJump = 1
if gamepad_button_check(0, gp_face3)
    global.keyShoot = 1
if gamepad_button_check(0, gp_face2)
    global.keySlide = 1
if gamepad_button_check(0, gp_start)
    global.keyPause = 1
if gamepad_button_check(0, gp_shoulderl)
    global.keyWeaponSwitchLeft = 1
if gamepad_button_check(0, gp_shoulderr)
    global.keyWeaponSwitchRight = 1
if (gamepad_button_check_pressed(0, gp_padl) || ((gamepad_axis_value(0, gp_axislh) < -0.5) && (prevHorAxis[0] >= -0.5)))
    global.keyLeftPressed = 1
if (gamepad_button_check_pressed(0, gp_padr) || ((gamepad_axis_value(0, gp_axislh) > 0.5) && (prevHorAxis[0] <= 0.5)))
    global.keyRightPressed = 1
if (gamepad_button_check_pressed(0, gp_padu) || ((gamepad_axis_value(0, gp_axislv) < -0.5) && (prevVertAxis[0] >= -0.5)))
    global.keyUpPressed = 1
if (gamepad_button_check_pressed(0, gp_padd) || ((gamepad_axis_value(0, gp_axislv) > 0.5) && (prevVertAxis[0] <= 0.5)))
    global.keyDownPressed = 1
if gamepad_button_check_pressed(0, gp_face1)
    global.keyJumpPressed = 1
if gamepad_button_check_pressed(0, gp_face3)
    global.keyShootPressed = 1
if gamepad_button_check_pressed(0, gp_face2)
    global.keySlidePressed = 1
if gamepad_button_check_pressed(0, gp_start)
    global.keyPausePressed = 1
if gamepad_button_check_pressed(0, gp_shoulderl)
    global.keyWeaponSwitchLeftPressed = 1
if gamepad_button_check_pressed(0, gp_shoulderr)
    global.keyWeaponSwitchRightPressed = 1
if (gamepad_button_check_released(0, gp_padl) || ((gamepad_axis_value(0, gp_axislh) >= -0.5) && (prevHorAxis[0] < -0.5)))
    global.keyLeftReleased = 1
if (gamepad_button_check_released(0, gp_padr) || ((gamepad_axis_value(0, gp_axislh) <= 0.5) && (prevHorAxis[0] > 0.5)))
    global.keyRightReleased = 1
if (gamepad_button_check_released(0, gp_padu) || ((gamepad_axis_value(0, gp_axislv) >= -0.5) && (prevVertAxis[0] < -0.5)))
    global.keyUpReleased = 1
if (gamepad_button_check_released(0, gp_padd) || ((gamepad_axis_value(0, gp_axislv) <= 0.5) && (prevVertAxis[0] > 0.5)))
    global.keyDownReleased = 1
if gamepad_button_check_released(0, gp_face1)
    global.keyJumpReleased = 1
if gamepad_button_check_released(0, gp_face3)
    global.keyShootReleased = 1
if gamepad_button_check_released(0, gp_face2)
    global.keySlideReleased = 1
if gamepad_button_check_released(0, gp_start)
    global.keyPauseReleased = 1
if gamepad_button_check_released(0, gp_shoulderl)
    global.keyWeaponSwitchLeftReleased = 1
if gamepad_button_check_released(0, gp_shoulderr)
    global.keyWeaponSwitchRightReleased = 1
prevHorAxis[0] = gamepad_axis_value(0, gp_axislh)
prevVertAxis[0] = gamepad_axis_value(0, gp_axislv)

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