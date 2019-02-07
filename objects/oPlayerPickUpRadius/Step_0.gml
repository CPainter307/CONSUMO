/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

var haxis;
var vaxis;
if (gamepad_is_connected(0)) {
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	var dir = point_direction(x, y, haxis, vaxis);
}
if (!gamepad_is_connected(0)) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
}

//if we press the left button while an object is in left hand
if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
	if (oPlayer.holdingL) {
		itemInLeftHand.followingL = false;
		throwingL = true;
		itemInLeftHand.speed = 20;
		itemInLeftHand.direction = dir;
		
	}
}

//if we press the right button while an object is in right hand
if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
	if (oPlayer.holdingR) {
		itemInRightHand.followingR = false;
		throwingR = true;
		itemInRightHand.speed = 20;
		itemInRightHand.direction = dir;
	}
}