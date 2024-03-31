// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawDamageNumber(){
if (!global.enableDamageNumbers)
{
    return 0;
}


var damageString = instance_create(argument0, argument1, objDmgText);
damageString.vspeed = -1*random_range(1, 3);
damageString.hspeed = choose(-1, 1) * random_range(1, 2);
damageString.damageValue = argument2;
}