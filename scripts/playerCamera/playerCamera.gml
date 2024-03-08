/// @function playerCamera
/// @description Handles the camera. Call it in objMegaman
function playerCamera() {


		//Follow the player
		if instance_number(objMegaman) <= 1
		{
			global.viewX = round(x - (global.viewWidth / 2));
			global.viewY = round(y - (global.viewHeight / 2));
		}
		else
		{
			// Get the instances of objMegaman
			var megaman1 = instance_find(objMegaman, 0);
			var megaman2 = instance_find(objMegaman, 1);

			// Calculate the center of the horizontal gap
			var centerX = (megaman1.x + megaman2.x) / 2;

			// Adjust the camera position based on the center of the horizontal gap
			global.viewX = round(centerX - (global.viewWidth / 2));
			global.viewY = round(y - (global.viewHeight / 2));
		}


		//Stop at section borders
		if global.viewX > sectionRight - global.viewWidth
		    global.viewX = sectionRight - global.viewWidth;
		else if global.viewX < sectionLeft
		    global.viewX = sectionLeft;
    
		if global.viewY > sectionBottom - global.viewHeight
		    global.viewY = sectionBottom - global.viewHeight
		else if global.viewY < sectionTop
		    global.viewY = sectionTop;
    
    
		//Stop at room borders
		if global.viewX > room_width - global.viewWidth
		    global.viewX = room_width - global.viewWidth;
		else if global.viewX < 0
		    global.viewX = 0;
    
		if global.viewY > room_height - global.viewHeight
		    global.viewY = room_height - global.viewHeight;
		else if global.viewY < 0
		    global.viewY = 0;
	
	
		//Set the camera position
		//camera_set_view_pos(global.view, global.viewX, global.viewY);

}
