depth = -16000
var numberOfGamepads = gamepad_get_device_count()
for (var i = 0; i < 300; i++)
{
    global.gamepadUsed[i] = 0
    global.deviceID[i] = -1
}
global.numberOfGamepads = 0
global.gamepadIsAttachedP1 = 0
global.gamepadIsAttachedP2 = 0
global.gamepadIsAttachedP3 = 0
global.gamepadIsAttachedP4 = 0
