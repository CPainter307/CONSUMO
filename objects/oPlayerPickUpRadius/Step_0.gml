/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

//if we press the left button while an object is in left hand
var haxis;
var vaxis;
if (gamepad_is_connected(0)) {
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
}
var dir = point_direction(0, 0, haxis, vaxis);
if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
	if (oPlayer.holdingL) {
		itemInLeftHand.followingL = false;
		throwingL = true;
		itemInLeftHand.speed = 20;
		itemInLeftHand.direction = dir;
		//declare itemInLeftHand null here?
	}
}

//if we press the right button while an object is in right hand
if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
	if (oPlayer.holdingR) {
		itemInRightHand.followingR = false;
		throwingR = true;
		itemInRightHand.speed = 20;
		itemInRightHand.direction = dir;
		//declare itemInRightHand null here?
	}
}