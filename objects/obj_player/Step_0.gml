/// @description Code that runs every frame (input/movement)
// Retrieve player input

//check for input
key_right = keyboard_check(vk_right) || (gamepad_axis_value(0, gp_axislh) > 0);
key_left = - (keyboard_check(vk_left) || (gamepad_axis_value(0, gp_axislh) < 0));
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));
key_jumpPressed = keyboard_check(vk_space) || (gamepad_button_check(0, gp_face1));

//react to input
move = key_left + key_right;
hSpd = move * moveSpeed;
if (vSpd < 10) vSpd += grav;

//jumps
if (place_meeting(x, y + 1, obj_wall)) {
	jumps = jumpsMax;
}
else {
	if (jumps == jumpsMax) jumps -= 1;
}

if (key_jump) && (jumps > 0) {
	jumps -= 1;
	vSpd = -jumpSpeed;
}
if (vSpd < 0) && (!key_jumpPressed) {
	vSpd = key_jumpPressed * max(vSpd, 0);
}

//horizontal collision
if (place_meeting(x + hSpd, y, obj_wall)) {
	while (!place_meeting(x + sign(hSpd), y, obj_wall)) {
		x += sign(hSpd);
	}
	hSpd = 0;
}
x += hSpd

//vertical collision
if (place_meeting(x, y + vSpd, obj_wall)) {
	while (!place_meeting(x, y + sign(vSpd), obj_wall)) {
		y += sign(vSpd);
	}
	vSpd = 0;
}
y += vSpd;

//animation
if (hSpd != 0) image_xscale = sign(hSpd);
