function reset_buttons(){
	/// reset_buttons()

	//Buttons
	with objGlobalControl
	{
		leftButton = gp_padl;
		rightButton = gp_padr;
		upButton = gp_padu;
		downButton = gp_padd;
		jumpButton = gp_face1;
		shootButton = gp_face3;
		slideButton = gp_face2;
		pauseButton = gp_start;
		weaponSwitchLeftButton = gp_shoulderlb;
		weaponSwitchRightButton = gp_shoulderrb;
	}
}