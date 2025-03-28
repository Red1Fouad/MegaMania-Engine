/// @function playerCameraInit
/// @description Initialize the camera
///				 For the meanings of newSectionXOffset/newSectionYOffset, see playerSwitchSections
function playerCameraInit() {

	var dist;

	//Left
    dist = 0;
    while (!place_meeting(floor((x+newSectionXOffset)/16)*16 - dist, y+newSectionYOffset, objSectionBorderLeft)
    && dist <= 16 * 2000)
    {
        dist += 16;
    }

    if (dist >= 16 * 2000)
    {
        show_message("Got stuck on left");
    }
    else
    {
        var leftInstance = instance_place(floor((x+newSectionXOffset)/16)*16 - dist, y+newSectionYOffset, objSectionBorderLeft);
        if (leftInstance != noone) {
            sectionLeft = leftInstance.x;
			global.sectionLeft = sectionLeft;
        }
        else {
            show_message("Unable to find objSectionBorderLeft instance!");
        }
    }

	//Right
	dist = 0;
	while !place_meeting(ceil((x+newSectionXOffset)/16)*16 + dist, y+newSectionYOffset, objSectionBorderRight)
	&& dist <= 16 * 2000
	{
		dist += 16;
	}

	if dist >= 16 * 2000
	{
		show_message("Got stuck on right");
	}

	sectionRight = instance_place(ceil((x+newSectionXOffset)/16)*16 + dist, y+newSectionYOffset, objSectionBorderRight).x + 16;
	
	global.sectionRight = sectionRight;


	//Top
	dist = 0;
	while !place_meeting(x+newSectionXOffset, floor((y+newSectionYOffset)/16)*16 - dist, objSectionBorderTop)
	&& dist <= 16 * 2000
	{
		dist += 16;
	}

	if dist >= 16 * 2000
	{
		show_message("Got stuck on top");
	}


	sectionTop = instance_place(x+newSectionXOffset, floor((y+newSectionYOffset)/16)*16 - dist, objSectionBorderTop).y;
	global.sectionTop = sectionTop;


	//Bottom
	dist = 0;
	while !place_meeting(x+newSectionXOffset, ceil((y+newSectionYOffset)/16)*16 + dist, objSectionBorderBottom)
	&& dist <= 16 * 2000
	{
		dist += 16;
	}

	if dist >= 16 * 2000
	{
		show_message("Got stuck on bottom");
	}

	sectionBottom = instance_place(x+newSectionXOffset, ceil((y+newSectionYOffset)/16)*16 + dist, objSectionBorderBottom).y + 16;
		
	
}



