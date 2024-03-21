drawSelf()
if ((flashing == 2))
{
    gpu_set_fog(true, c_white, 0, 0)
    drawSelf()
    gpu_set_fog(false, c_black, 0, 0)
}
