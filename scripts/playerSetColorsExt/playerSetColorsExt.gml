// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerSetColorsExt() {
	if instance_exists(objMegaman)
	{
		switch (objMegaman.character) {
			case "Megaman":
			    primary_color = make_color_rgb(0, 112, 236);
			    secondary_color = make_color_rgb(0, 232, 216);
			    outline_color = make_color_rgb(0, 0, 0);
			    break;

			case "Protoman":
			    primary_color = make_color_rgb(222, 41, 0);
			    secondary_color = make_color_rgb(189, 189, 189);
			    outline_color = make_color_rgb(0, 0, 0);
			    break;

			case "Bass":
			    primary_color = make_color_rgb(111, 111, 111);
			    secondary_color = make_color_rgb(248, 152, 56);
			    outline_color = make_color_rgb(0, 0, 0);
			    break;

			case "Roll":
			    primary_color = make_color_rgb(216, 40, 0);
			    secondary_color = make_color_rgb(245, 245, 245);
			    outline_color = make_color_rgb(0, 0, 0);
			    break;
		}
	}
}
