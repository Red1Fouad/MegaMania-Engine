if instance_exists(objMegaman)
{
	playerID = objMegaman.playerID;
}
else
{
	playerID = 1;
}

blackAlphaTimer += 1;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha += blackAlphaDecrease;
    blackAlphaTimer = 0;
}

if blackAlpha >= 1 && canAlarm == true
{
    alarm[1] = 10;
    canAlarm = false;
}

