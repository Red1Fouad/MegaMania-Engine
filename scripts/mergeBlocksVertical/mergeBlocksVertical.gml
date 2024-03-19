// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mergeBlocksVertical(argument0){
	/// mergeBlocksVertical(type)
	var type = argument0;
	var next;

	with type {
	    if instance_exists(self) {
	        next = instance_position(x, y + sprite_height, type);
	        while(next > - 1 && image_xscale == next.image_xscale && object_index == next.object_index) {
	            image_yscale += next.image_yscale;
	            with next instance_destroy();
	            next = instance_position(x, y + sprite_height, type);
	        }
	    }
	}
}