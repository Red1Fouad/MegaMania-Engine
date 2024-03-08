/// @description  drawSelf3Colors(col1, col2, col3)
/// @param col1
/// @param  col2
/// @param  col3
/// Draw sprite replacing MM colors (blue, cyan and black) by others
function drawSelf3ColorsFixed(argument0, argument1, argument2) {
	var col1 = argument0;
	var col2 = argument1;
	var col3 = argument2;

	shader_set(shColorReplace3);

	var shader_params;

	//Primary Color //make_colour_rgb(0, 112, 236)
	shader_params = shader_get_uniform(shColorReplace3, "colorIn1");
	shader_set_uniform_f(shader_params, 41.0 / 255.0, 123.0 / 255.0, 236.0 / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut1");
	shader_set_uniform_f(shader_params, color_get_red(col1) / 255.0, color_get_green(col1) / 255.0, color_get_blue(col1) / 255.0, 1.0);

	//Secondary Color   //make_colour_rgb(0, 232, 216);
	shader_params = shader_get_uniform(shColorReplace3, "colorIn2");
	shader_set_uniform_f(shader_params, 68.0 / 255.0, 189.0 / 255.0, 255.0 / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut2");
	shader_set_uniform_f(shader_params, color_get_red(col2) / 255.0, color_get_green(col2) / 255.0, color_get_blue(col2) / 255.0, 1.0);

	//Outline
	shader_params = shader_get_uniform(shColorReplace3, "colorIn3");
	//shader_set_uniform_f(shader_params, 2.0 / 255.0, 32.0 / 255.0, 73.0 / 255.0, 1.0);
	shader_set_uniform_f(shader_params, 0.0 / 255.0, 0.0 / 255.0, 0.0 / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut3");
	shader_set_uniform_f(shader_params, color_get_red(col3) / 255.0, color_get_green(col3) / 255.0, color_get_blue(col3) / 255.0, 1.0);

	drawSelf();

	shader_reset();



}
