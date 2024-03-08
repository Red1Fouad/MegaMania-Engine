// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getTarget(){
var targetID;
if instance_exists(objMegaman)
        targetID = instance_nearest(x,y,objMegaman)//(objMegaman, 0)
    return targetID;
}