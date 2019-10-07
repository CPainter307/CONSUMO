//SPECIAL TEMP BUG TESTING
if (keyboard_check(vk_left)) {
	hspeed = -5;
	//direction = 180;
}
if (keyboard_check(vk_up)) {
	vspeed = -5;
	//direction = 90;
}
if (keyboard_check(vk_right)) {
	hspeed = 5;
	//direction = 0;
}
if (keyboard_check(vk_down)) {
	vspeed = 5;
	//direction = 270;
}

//if (keyboard_check(vk_left) && keyboard_check(vk_right)) {
//	hspeed = 0;	
//}

if (keyboard_check_pressed(vk_tab)) {
	instance_create_layer(xstart, ystart, "Objects", oHoldableObject2);	
}

//Collision

//Horizontal
//colliding on right
/*if ((direction >= 0 && direction < 90) || (direction > 270 && direction < 360)) {
	if (place_meeting(x+abs(hspeed), y, oWall)) {
		while (!place_meeting(x+1, y, oWall)) {
			x += 1;
		}
		hspeed = 0;
	}
}
//colliding on left
if (direction > 90 && direction < 270) {
	if (place_meeting(x-abs(hspeed), y, oWall)) {
		while (!place_meeting(x-1, y, oWall)) {
			x -= 1;
		}
		hspeed = 0;
	}
}*/

//Horizontal
if (place_meeting(x+hspeed, y, oWall)) {
	while (!place_meeting(x+sign(hspeed), y, oWall)) {
		x += sign(hspeed);
	}
	hspeed = 0;
}

//Vertical
if (place_meeting(x, y+vspeed, oWall)) {
    vertWall = instance_place(x, y+vspeed, oWall);	//instance id of wall being collided with
	
	while (!place_meeting(x, y+sign(vspeed), oWall)) {
        y += sign(vspeed);
    }
    vspeed = 0;
}

if (vertWall != pointer_null && y+sprite_height == vertWall.y && //if if bottom of square is 1 above top of wall
((x < vertWall.x+vertWall.sprite_width-1) && (x > vertWall.x-sprite_width+1))	//left edge of square is on wall
) {		
	on_floor = true;	
}
else {
	on_floor = false;	
}



//Turns off Gravity if on floor
if (on_floor) {
	gravity = 0;	
}
else {
	gravity = GRAV;
}
//End Collision