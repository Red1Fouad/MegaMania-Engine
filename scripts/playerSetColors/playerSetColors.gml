// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerSetColors(){
	switch character 
	{
		case "Megaman": 
		primary_color = make_color_rgb(0,112,236);
		secondary_color = make_color_rgb(0,232,216);
		outline_color = make_color_rgb(0,0,0);
		break;
	
		case "Protoman":
		primary_color = make_color_rgb(222,41,0);
		secondary_color = make_color_rgb(189,189,189);
		outline_color = make_color_rgb(0,0,0);
		break;
	}

}