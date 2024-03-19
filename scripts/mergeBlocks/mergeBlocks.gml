// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mergeBlocks(){
	/// mergeBlocks()
	mergeBlocksHorizontal(objSolid);
	mergeBlocksHorizontal(objTopSolid);
	mergeBlocksHorizontal(objIce);
	mergeBlocksHorizontal(objSpike);
	mergeBlocksHorizontal(objWater);
	mergeBlocksHorizontal(objSectionArrowUp);
	mergeBlocksHorizontal(objSectionArrowDown);

	mergeBlocksVertical(objSolid);
	mergeBlocksVertical(objTopSolid);
	mergeBlocksVertical(objIce);
	mergeBlocksVertical(objSpike);
	mergeBlocksVertical(objWater);
	mergeBlocksVertical(objLadder);
	mergeBlocksVertical(objSectionArrowLeft);
	mergeBlocksVertical(objSectionArrowRight);
}