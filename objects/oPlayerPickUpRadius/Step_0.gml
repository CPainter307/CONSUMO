/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

var stickDir;
var haxis;
var vaxis;

//gamepad controls
if (gamepad_is_connected(0)) {
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	stickDir = point_direction(0, 0, haxis, vaxis);
		//east throw
		if (stickDir >= 337.5 || stickDir < 22.5) {
			imageDir = 0;
			dir = 20;
		}
		//northeast throw
		if (stickDir >= 22.5 && stickDir < 67.5) {
			imageDir = 45;
			dir = 55;
		}
		//north throw
		if (stickDir >= 67.5 && stickDir < 112.5) {
			imageDir = 90;
			dir = 90;
		}
		//nortwest throw
		if (stickDir >= 112.5 && stickDir < 157.5) {
			imageDir = 135;
			dir = 115;
		}
		//west throw
		if (stickDir >= 157.5 && stickDir < 202.5) {
			imageDir = 180;
			dir = 160;
		}
		//southwest throw
		if (stickDir >= 202.5 && stickDir < 247.5) {
			imageDir = 225;
			dir = 225;
		}
		//south throw
		if (stickDir >= 247.5 && stickDir < 292.5) {
			imageDir = 270;
			dir = 270;
		}
		//southeast throw
		if (stickDir >= 292.5 && stickDir < 337.5) {
			imageDir = 315;
			dir = 315;
		}
		//default drop
		if (haxis == 0 && vaxis == 0) {
			dir = 270;
		}
}
//keyboard controls
if (!gamepad_is_connected(0)) {
	dir = point_direction(x, y, mouse_x, mouse_y);
}

//if we press the left button while an object is in left hand
if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
	if (oPlayer.holdingL) {
		itemInLeftHand.followingL = false;
		throwingL = true;
		itemInLeftHand.speed = 25;
		itemInLeftHand.direction = dir;
		
	}
}

//if we press the right button while an object is in right hand
if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
	if (oPlayer.holdingR) {
		itemInRightHand.followingR = false;
		throwingR = true;
		itemInRightHand.speed = 25;
		itemInRightHand.direction = dir;
	}
}