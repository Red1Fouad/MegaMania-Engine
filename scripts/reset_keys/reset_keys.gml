// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_keys(){
	/// reset_keys()

	//Keys
	switch room
	{
		case rmKeyConfig:
			with objGlobalControl
			{
				leftKey = vk_left;
				rightKey = vk_right;
				upKey = vk_up;
				downKey = vk_down;
				jumpKey = ord("Z");
				shootKey = ord("X");
				slideKey = ord("C");
				pauseKey = vk_enter;
				weaponSwitchLeftKey = ord("A");
				weaponSwitchRightKey = ord("S");
			}
			print("Resetted P1 Keys");
		break;
		
		case rmKeyConfigP2:
			with objGlobalControl
			{
				leftKey2 = -1;
				rightKey2 = -1;
				upKey2 = -1;
				downKey2 = -1;
				jumpKey2 = -1;
				shootKey2 = -1;
				slideKey2 = -1;
				pauseKey2 = -1;
				weaponSwitchLeftKey2 = -1;
				weaponSwitchRightKey2 = -1;
			}
			print("Resetted P2 Keys");
		break;
		
		case rmJoyConfig:
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
				weaponSwitchLeftButton = gp_shoulderl;
				weaponSwitchRightButton = gp_shoulderr;
			}
			print("Resetted P1 Buttons");
		break;
		
		case rmJoyConfigP2:
			with objGlobalControl
			{
				leftButton2 = gp_padl;
				rightButton2 = gp_padr;
				upButton2 = gp_padu;
				downButton2 = gp_padd;
				jumpButton2 = gp_face1;
				shootButton2 = gp_face3;
				slideButton2 = gp_face2;
				pauseButton2 = gp_start;
				weaponSwitchLeftButton2 = gp_shoulderl;
				weaponSwitchRightButton2 = gp_shoulderr;
			}
			print("Resetted P2 Buttons");
		break;
	}
}