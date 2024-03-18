/// @description Draws the mobile input
if (isTouchDevice()) {
	var input_alpha = 0.8;
	draw_sprite_ext(sprMobileInputDpadBase, 0, 12 * global.inputSize[1], (156-vKeyDPADY) * global.inputSize[1], global.inputSize[1], global.inputSize[1], 0, c_white, 0.5);
	draw_sprite_ext(sprMobileInputDPad, global.keyUp, 31 * global.inputSize[1], (160-vKeyDPADY) * global.inputSize[1], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputDPad, global.keyDown, 31 * global.inputSize[1], (201-vKeyDPADY) * global.inputSize[1], global.inputSize[1], -global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputDPad, global.keyLeft, 16 * global.inputSize[1], (175-vKeyDPADY) * global.inputSize[1], -global.inputSize[1], global.inputSize[1], 90, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputDPad, global.keyRight, 57 * global.inputSize[1], (175-vKeyDPADY) * global.inputSize[1], global.inputSize[1], global.inputSize[1], -90, c_white, input_alpha);
	
	draw_sprite_ext(sprMobileButton, 0, 183 * global.inputSize[0], 154 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputMisc, 0 + global.keyShoot, 183 * global.inputSize[0], 154 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	
	draw_sprite_ext(sprMobileButton, 0, 204 * global.inputSize[0], 188 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputMisc, 2 + global.keyJump, 204 * global.inputSize[0], 188 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);

	draw_sprite_ext(sprMobileButton, 0, 155 * global.inputSize[0], 186 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputMisc, 8 + global.keySlide, 155 * global.inputSize[0], 186 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);

	draw_sprite_ext(sprMobileButton, 0, (211+3) * global.inputSize[0], 127 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputMisc, 4 + (global.keyWeaponSwitchLeft || global.keyWeaponSwitchRight), (221-6) * global.inputSize[0], 127 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	
	draw_sprite_ext(sprMobilePauseButton, 0, (224-8) * global.inputSize[0], 0 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
	draw_sprite_ext(sprMobileInputMisc, 6 + global.keyPause, (224-8) * global.inputSize[0], 0 * global.inputSize[0], global.inputSize[1], global.inputSize[1], 0, c_white, input_alpha);
}