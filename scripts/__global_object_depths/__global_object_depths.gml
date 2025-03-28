function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // objSolid
	global.__objectDepths[1] = 0; // objIce
	global.__objectDepths[2] = 0; // objTopSolid
	global.__objectDepths[3] = -1000; // objGlobalControl
	global.__objectDepths[4] = 0; // objLadder
	global.__objectDepths[5] = 0; // prtShieldWeapon
	global.__objectDepths[6] = 0; // prtPlayerProjectile
	global.__objectDepths[7] = 0; // objSpike
	global.__objectDepths[8] = 0; // objWater
	global.__objectDepths[9] = -1; // objReflectedProjectile
	global.__objectDepths[10] = -1; // objBusterShot
	global.__objectDepths[11] = -2; // objMegaman
	global.__objectDepths[12] = -1; // objBusterShotCharged
	global.__objectDepths[13] = 0; // prtRush
	global.__objectDepths[14] = 0; // objRushCoil
	global.__objectDepths[15] = -1; // objBusterShotHalfCharged
	global.__objectDepths[16] = -3; // objRushJet
	global.__objectDepths[17] = -1; // objPharaohShot
	global.__objectDepths[18] = -1; // objPharaohShotCharged
	global.__objectDepths[19] = -3; // objStarCrash
	global.__objectDepths[20] = -1; // objSilverTomahawk
	global.__objectDepths[21] = -1; // objMetalBlade
	global.__objectDepths[22] = -2; // objPharaohShotCharging
	global.__objectDepths[23] = 0; // objMegamanSweat
	global.__objectDepths[24] = 0; // objMegamanDeathTimer
	global.__objectDepths[25] = -10000; // objFadeInNoDeactivation
	global.__objectDepths[26] = -10000; // objFadeout
	global.__objectDepths[27] = 0; // objMegamanExplosion
	global.__objectDepths[28] = 0; // objSuzi
	global.__objectDepths[29] = -100; // objHealthWeaponBar
	global.__objectDepths[30] = 0; // objScrewBomber
	global.__objectDepths[31] = -1; // objWindStorm
	global.__objectDepths[32] = 0; // objPicketMan
	global.__objectDepths[33] = 0; // objBigEye
	global.__objectDepths[34] = 0; // objMM1MetBullet
	global.__objectDepths[35] = 0; // objBeak
	global.__objectDepths[36] = -10000; // objFadeIn
	global.__objectDepths[37] = 0; // objMM1Met
	global.__objectDepths[38] = 0; // objBeakBullet
	global.__objectDepths[39] = 0; // objEnemyWindStorm
	global.__objectDepths[40] = 0; // objColton
	global.__objectDepths[41] = 0; // objColtonBullet
	global.__objectDepths[42] = 0; // objPicket
	global.__objectDepths[43] = 0; // prtEnemyProjectile
	global.__objectDepths[44] = -100; // objBossControl
	global.__objectDepths[45] = 0; // objAbsorbEffect
	global.__objectDepths[46] = 0; // prtBoss
	global.__objectDepths[47] = 0; // objPharaohManShot
	global.__objectDepths[48] = 0; // prtEnemy
	global.__objectDepths[49] = 0; // objBossDeathTimer
	global.__objectDepths[50] = 0; // prtPickup
	global.__objectDepths[51] = 0; // objPharaohManShotBig
	global.__objectDepths[52] = 0; // objLifeEnergyBig
	global.__objectDepths[53] = 10; // objBossDoor
	global.__objectDepths[54] = 0; // objLifeEnergySmall
	global.__objectDepths[55] = 0; // objPharaoh
	global.__objectDepths[56] = 0; // objWeaponEnergySmall
	global.__objectDepths[57] = 0; // objLife
	global.__objectDepths[58] = 0; // objSparkmanPlatformStop
	global.__objectDepths[59] = 1; // objYokuBlock
	global.__objectDepths[60] = 0; // objMM2Conveyor
	global.__objectDepths[61] = 0; // objETank
	global.__objectDepths[62] = 0; // prtGimmick
	global.__objectDepths[63] = 0; // objWeaponEnergyBig
	global.__objectDepths[64] = 0; // objMovingPlatformTest
	global.__objectDepths[65] = 0; // objSlideDust
	global.__objectDepths[66] = 0; // objAirBubble
	global.__objectDepths[67] = 0; // prtMovingPlatformJumpthrough
	global.__objectDepths[68] = 0; // objSplash
	global.__objectDepths[69] = 0; // objWeaponGet
	global.__objectDepths[70] = 0; // objMTank
	global.__objectDepths[71] = 0; // objStageSelect
	global.__objectDepths[72] = 0; // objDisclaimer
	global.__objectDepths[73] = 0; // objTitleScreen
	global.__objectDepths[74] = 0; // objIntroduction
	global.__objectDepths[75] = -100; // objSectionBorderLeftScreen
	global.__objectDepths[76] = -100; // objSectionBorderRightScreen
	global.__objectDepths[77] = -100; // objSectionBorderTopScreen
	global.__objectDepths[78] = -1000; // objPassMenu
	global.__objectDepths[79] = -100; // objSectionBorderBottomScreen
	global.__objectDepths[80] = -100; // objSectionBorderRight
	global.__objectDepths[81] = -100; // objSectionBorderLeft
	global.__objectDepths[82] = -100; // objSectionBorderBottom
	global.__objectDepths[83] = -100; // objSectionArrowLeft
	global.__objectDepths[84] = -100; // objSectionArrowRight
	global.__objectDepths[85] = -100; // objSectionArrowUp
	global.__objectDepths[86] = -100; // objSectionArrowDown
	global.__objectDepths[87] = -1000; // objPauseMenu
	global.__objectDepths[88] = 0; // objSectionSwitcher
	global.__objectDepths[89] = -100; // objSectionBorderTop
	global.__objectDepths[90] = 0; // objItemExplosion
	global.__objectDepths[91] = 0; // objSparkmanPlatform
	global.__objectDepths[92] = 0; // prtMovingPlatformSolid
	global.__objectDepths[93] = 0; // prtEffect
	global.__objectDepths[94] = 0; // objExplosion
	global.__objectDepths[95] = -100; // objCheckpoint
	global.__objectDepths[96] = 0; // objDropPlatform


	global.__objectNames[0] = "objSolid";
	global.__objectNames[1] = "objIce";
	global.__objectNames[2] = "objTopSolid";
	global.__objectNames[3] = "objGlobalControl";
	global.__objectNames[4] = "objLadder";
	global.__objectNames[5] = "prtShieldWeapon";
	global.__objectNames[6] = "prtPlayerProjectile";
	global.__objectNames[7] = "objSpike";
	global.__objectNames[8] = "objWater";
	global.__objectNames[9] = "objReflectedProjectile";
	global.__objectNames[10] = "objBusterShot";
	global.__objectNames[11] = "objMegaman";
	global.__objectNames[12] = "objBusterShotCharged";
	global.__objectNames[13] = "prtRush";
	global.__objectNames[14] = "objRushCoil";
	global.__objectNames[15] = "objBusterShotHalfCharged";
	global.__objectNames[16] = "objRushJet";
	global.__objectNames[17] = "objPharaohShot";
	global.__objectNames[18] = "objPharaohShotCharged";
	global.__objectNames[19] = "objStarCrash";
	global.__objectNames[20] = "objSilverTomahawk";
	global.__objectNames[21] = "objMetalBlade";
	global.__objectNames[22] = "objPharaohShotCharging";
	global.__objectNames[23] = "objMegamanSweat";
	global.__objectNames[24] = "objMegamanDeathTimer";
	global.__objectNames[25] = "objFadeInNoDeactivation";
	global.__objectNames[26] = "objFadeout";
	global.__objectNames[27] = "objMegamanExplosion";
	global.__objectNames[28] = "objSuzi";
	global.__objectNames[29] = "objHealthWeaponBar";
	global.__objectNames[30] = "objScrewBomber";
	global.__objectNames[31] = "objWindStorm";
	global.__objectNames[32] = "objPicketMan";
	global.__objectNames[33] = "objBigEye";
	global.__objectNames[34] = "objMM1MetBullet";
	global.__objectNames[35] = "objBeak";
	global.__objectNames[36] = "objFadeIn";
	global.__objectNames[37] = "objMM1Met";
	global.__objectNames[38] = "objBeakBullet";
	global.__objectNames[39] = "objEnemyWindStorm";
	global.__objectNames[40] = "objColton";
	global.__objectNames[41] = "objColtonBullet";
	global.__objectNames[42] = "objPicket";
	global.__objectNames[43] = "prtEnemyProjectile";
	global.__objectNames[44] = "objBossControl";
	global.__objectNames[45] = "objAbsorbEffect";
	global.__objectNames[46] = "prtBoss";
	global.__objectNames[47] = "objPharaohManShot";
	global.__objectNames[48] = "prtEnemy";
	global.__objectNames[49] = "objBossDeathTimer";
	global.__objectNames[50] = "prtPickup";
	global.__objectNames[51] = "objPharaohManShotBig";
	global.__objectNames[52] = "objLifeEnergyBig";
	global.__objectNames[53] = "objBossDoor";
	global.__objectNames[54] = "objLifeEnergySmall";
	global.__objectNames[55] = "objPharaoh";
	global.__objectNames[56] = "objWeaponEnergySmall";
	global.__objectNames[57] = "objLife";
	global.__objectNames[58] = "objSparkmanPlatformStop";
	global.__objectNames[59] = "objYokuBlock";
	global.__objectNames[60] = "objMM2Conveyor";
	global.__objectNames[61] = "objETank";
	global.__objectNames[62] = "prtGimmick";
	global.__objectNames[63] = "objWeaponEnergyBig";
	global.__objectNames[64] = "objMovingPlatformTest";
	global.__objectNames[65] = "objSlideDust";
	global.__objectNames[66] = "objAirBubble";
	global.__objectNames[67] = "prtMovingPlatformJumpthrough";
	global.__objectNames[68] = "objSplash";
	global.__objectNames[69] = "objWeaponGet";
	global.__objectNames[70] = "objMTank";
	global.__objectNames[71] = "objStageSelect";
	global.__objectNames[72] = "objDisclaimer";
	global.__objectNames[73] = "objTitleScreen";
	global.__objectNames[74] = "objIntroduction";
	global.__objectNames[75] = "objSectionBorderLeftScreen";
	global.__objectNames[76] = "objSectionBorderRightScreen";
	global.__objectNames[77] = "objSectionBorderTopScreen";
	global.__objectNames[78] = "objPassMenu";
	global.__objectNames[79] = "objSectionBorderBottomScreen";
	global.__objectNames[80] = "objSectionBorderRight";
	global.__objectNames[81] = "objSectionBorderLeft";
	global.__objectNames[82] = "objSectionBorderBottom";
	global.__objectNames[83] = "objSectionArrowLeft";
	global.__objectNames[84] = "objSectionArrowRight";
	global.__objectNames[85] = "objSectionArrowUp";
	global.__objectNames[86] = "objSectionArrowDown";
	global.__objectNames[87] = "objPauseMenu";
	global.__objectNames[88] = "objSectionSwitcher";
	global.__objectNames[89] = "objSectionBorderTop";
	global.__objectNames[90] = "objItemExplosion";
	global.__objectNames[91] = "objSparkmanPlatform";
	global.__objectNames[92] = "prtMovingPlatformSolid";
	global.__objectNames[93] = "prtEffect";
	global.__objectNames[94] = "objExplosion";
	global.__objectNames[95] = "objCheckpoint";
	global.__objectNames[96] = "objDropPlatform";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
