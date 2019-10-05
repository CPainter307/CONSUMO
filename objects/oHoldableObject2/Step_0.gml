//SPECIAL TEMP BUG TESTING
if (keyboard_check(vk_left)) {
	hspeed = 5;
	direction = 180;
}
if (keyboard_check(vk_up)) {
	vspeed = 5;
	direction = 90;
}
if (keyboard_check(vk_right)) {
	hspeed = 5;
	direction = 0;
}
if (keyboard_check(vk_down)) {
	vspeed = 5;
	direction = 270;
}

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
    if (sign(vspeed) > 0) {
        on_floor = true
    }
    while (!place_meeting(x, y+sign(vspeed), oWall)) {
        y += sign(vspeed);
    }
    vspeed = 0;
} else {
    on_floor = false
}

//Turns off Gravity if on floor
if (on_floor) {
	gravity = 0;	
}
else {
	gravity = GRAV;	
}
//End Collision