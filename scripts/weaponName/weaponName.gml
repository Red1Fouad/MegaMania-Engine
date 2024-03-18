// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weaponName(){
	if instance_exists(objMegaman)
	{
		switch objMegaman.character
		{
			case "Megaman": global.weaponName[megabuster] = "M.BUSTER"; break;
			case "Protoman": global.weaponName[megabuster] = "P.BUSTER"; break;
			case "Bass": global.weaponName[megabuster] = "B.BUSTER"; break;
			case "Roll": global.weaponName[megabuster] = "R.BUSTER"; break;
		}
	}
}