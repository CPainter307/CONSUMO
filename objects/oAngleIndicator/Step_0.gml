/// @description Update to change sprite and angle

//follow above player
if (instance_exists(oPlayer)) {
	x = oPlayer.x;
	y = oPlayer.y - 100;
}

//rotate sprite 	
if (!gamepad_is_connected(0)) {
	keyU = keyboard_check(ord("W"));
	keyL = keyboard_check(ord("A"));
	keyD = keyboard_check(ord("S"));
	keyR = keyboard_check(ord("D"));
	sprite_index = sIndicatorArrow;
	image_angle = oPlayerPickUpRadius.imageDir;
	if ((!keyU && !keyL && !keyD && !keyR) && !oPlayer.isLocked) {
		sprite_index = sIndicatorCircle;
	}
}

if (gamepad_is_connected(0)) {
	padU = gamepad_button_check(0, gp_padu);
	padL = gamepad_button_check(0, gp_padl);
	padD = gamepad_button_check(0, gp_padd);
	padR = gamepad_button_check(0, gp_padr);
	sprite_index = sIndicatorArrow;
	image_angle = oPlayerPickUpRadius.imageDir;
	if (gamepad_axis_value(0, gp_axislh) == 0 && gamepad_axis_value(0, gp_axislv) == 0) {
		sprite_index = sIndicatorCircle;
	}
}