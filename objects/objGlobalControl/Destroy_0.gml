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