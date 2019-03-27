/// @description Update to change sprite and angle

//follow above player
if (instance_exists(oPlayer)) {
	x = oPlayer.x;
	y = oPlayer.y - 100;
}

//rotate sprite 	
if (!gamepad_is_connected(0)) {
	sprite_index = sIndicatorArrow;
	image_angle = oPlayerPickUpRadius.imageDir;
	if ((!oPlayerInput.key_up && !oPlayerInput.key_left && !oPlayerInput.key_down && !oPlayerInput.key_right) && !oPlayer.isLocked) {
		sprite_index = sIndicatorCircle;
	}
}

if (gamepad_is_connected(0)) {
	sprite_index = sIndicatorArrow;
	image_angle = oPlayerPickUpRadius.imageDir;
	if (oPlayerInput.haxis == 0 && oPlayerInput.vaxis == 0) {
		sprite_index = sIndicatorCircle;
	}
}