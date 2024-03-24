for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if (gamepad_button_check_pressed(i, gp_padl) || gamepad_button_check_pressed(i, gp_padr) || gamepad_button_check_pressed(i, gp_padu) || gamepad_button_check_pressed(i, gp_padd) || gamepad_button_check_pressed(i, gp_face1) || gamepad_button_check_pressed(i, gp_face2) || gamepad_button_check_pressed(i, gp_face3) || gamepad_button_check_pressed(i, gp_face4) || gamepad_button_check_pressed(i, gp_start) || gamepad_button_check_pressed(i, gp_select) || (gamepad_axis_value(i, gp_axislh) > 0.5) || (gamepad_axis_value(i, gp_axislh) < -0.5) || (gamepad_axis_value(i, gp_axislv) > 0.5) || (gamepad_axis_value(i, gp_axislv) < -0.5))
    {
        if ((global.gamepadUsed[i] == 0))
        {
            global.gamepadUsed[i] = 1
            global.deviceID[global.numberOfGamepads] = i
            global.numberOfGamepads++
            if ((global.numberOfGamepads <= 4))
            {
                ccID = instance_create(x, y, objControllerConnected)
                switch global.numberOfGamepads
                {
                    case 1:
                        ccID.x = 10
                        ccID.subimg = 0
                        break
                    case 2:
                        ccID.x = 85
                        ccID.subimg = 1
                        break
                    case 3:
                        ccID.x = 162
                        ccID.subimg = 2
                        break
                    case 4:
                        ccID.x = 240
                        ccID.subimg = 3
                        break
                }

            }
            show_debug_message((("Controller #" + string(global.numberOfGamepads)) + " attached!"))
        }
    }
}
if ((global.numberOfGamepads >= 4))
    global.gamepadIsAttachedP4 = 1
if ((global.numberOfGamepads >= 3))
    global.gamepadIsAttachedP3 = 1
if ((global.numberOfGamepads >= 2))
    global.gamepadIsAttachedP2 = 1
if ((global.numberOfGamepads >= 1))
    global.gamepadIsAttachedP1 = 1
