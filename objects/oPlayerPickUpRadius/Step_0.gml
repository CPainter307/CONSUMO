/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

//declare variables every frame
var stickDir;
var haxis;
var vaxis;
imageDir = 0;


//gamepad controls throw
if (gamepad_is_connected(0)) {
	keyLeftHand = gamepad_button_check_pressed(0, gp_shoulderl);
	keyRightHand = gamepad_button_check_pressed(0, gp_shoulderr);
	
	//throwing while moving
	if (!oPlayer.isLocked) {
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	stickDir = point_direction(0, 0, haxis, vaxis);
	
		//east throw
		if (stickDir >= 337.5 || stickDir < 22.5) {
			imageDir = 0;
			dir = 20;
		}
		//south throw
		if (stickDir >= 247.5 && stickDir < 292.5) {
			imageDir = 270;
			dir = 270;
		}
		//north throw
		if (stickDir >= 67.5 && stickDir < 112.5) {
			imageDir = 90;
			dir = 90;
		}
		//west throw
		if (stickDir >= 157.5 && stickDir < 202.5) {
			imageDir = 180;
			dir = 160;
		}
		//northeast throw
		if (stickDir >= 22.5 && stickDir < 67.5) {
			imageDir = 45;
			dir = 55;
		}
		//nortwest throw
		if (stickDir >= 112.5 && stickDir < 157.5) {
			imageDir = 135;
			dir = 115;
		}
		//southwest throw
		if (stickDir >= 202.5 && stickDir < 247.5) {
			imageDir = 225;
			dir = 225;
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
	
	//throwing while locked
	if (oPlayer.isLocked) {

		//throwing with left stick while locked
		if (gamepad_axis_value(0,gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0) {
			haxis = gamepad_axis_value(0, gp_axislh);
			vaxis = gamepad_axis_value(0, gp_axislv);
			dir = point_direction(0, 0, haxis, vaxis);
			imageDir = dir;		
			
			//east throw correction
			if (dir >= 337.5 || dir < 22.5) {
				dir = dir + 20;
			}
			//west throw correction
			if (dir >= 157.5 && dir < 202.5) {
				dir = dir - 20;
			}
		}

		//throwing with right stick while locked
		if (gamepad_axis_value(0,gp_axisrh) != 0 || gamepad_axis_value(0, gp_axisrv) != 0) {
			haxis = gamepad_axis_value(0, gp_axisrh);
			vaxis = gamepad_axis_value(0, gp_axisrv);
			dir = point_direction(0, 0, haxis, vaxis);	
			imageDir = dir;	

			//east throw correction
			if (dir >= 337.5 || dir < 22.5) {
				dir = dir + 20;
			}
			//west throw correction
			if (dir >= 157.5 && dir < 202.5) {
				dir = dir - 20;
			}
		}

	}
}

//keyboard controls throw
if (!gamepad_is_connected(0)) {
	keyLeftHand = mouse_check_button_pressed(mb_left);
	keyRightHand = mouse_check_button_pressed(mb_right);	
	keyU = keyboard_check(ord("W"));
	keyL = keyboard_check(ord("A"));
	keyD = keyboard_check(ord("S"));
	keyR = keyboard_check(ord("D"));
	
	//throwing while moving
	if (!oPlayer.isLocked) {
	
		//east throw
		if (keyR) {
			imageDir = 0;
			dir = 20;
		}
		//south throw
		if (keyD) {
			imageDir = 270;
			dir = 270;
		}
		//north throw
		if (keyU) {
			imageDir = 90;
			dir = 90;
		}
		//west throw
		if (keyL) {
			imageDir = 180;
			dir = 160;
		}
		//northeast throw
		if (keyU && keyR) {
			imageDir = 45;
			dir = 55;
		}
		//nortwest throw
		if (keyU && keyL) {
			imageDir = 135;
			dir = 115;
		}
		//southwest throw
		if (keyD && keyL) {
			imageDir = 225;
			dir = 225;
		}
		//southeast throw
		if (keyD && keyR) {
			imageDir = 315;
			dir = 315;
		}
		//default drop
		if (!keyU && !keyL && !keyD && !keyR) {
			dir = 270;
		}
	}
	
	//throwing while locked
	if (oPlayer.isLocked) {
		dir = point_direction(x, y, mouse_x, mouse_y);
		imageDir = dir;
		
		//east throw correction
		if (dir >= 337.5 || dir < 22.5) {
			dir = dir + 20;
		}
		//west throw correction
		if (dir >= 157.5 && dir < 202.5) {
			dir = dir - 20;
		}
	}
}

//throwing
	//if we press the left button while an object is in left hand
	if (keyLeftHand) {
		if (instance_exists(itemInLeftHand) and oPlayer.holdingL) {
			itemInLeftHand.followingL = false;
			throwingL = true;
			itemInLeftHand.speed = 25;
			itemInLeftHand.direction = dir;
		} else {
			oPlayer.holdingL = false;
			throwingL = false;
		}
	}

	//if we press the right button while an object is in right hand
	if (keyRightHand) {
		if (instance_exists(itemInRightHand) and oPlayer.holdingR) {
			itemInRightHand.followingR = false;
			throwingR = true;
			itemInRightHand.speed = 25;
			itemInRightHand.direction = dir;
		} else {
			oPlayer.holdingR = false;
			throwingR = false;
		}
	}
