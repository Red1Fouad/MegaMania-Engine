if fading
{
    alphaTimer += 1
    if ((alphaTimer >= 5))
    {
        alphaTimer = 0
        alpha -= alphaDecreaseAmount
    }
}
if ((alpha <= 0))
    instance_destroy()
