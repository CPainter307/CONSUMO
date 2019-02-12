/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

//declare variables every frame
var stickDir;
var haxis;
var vaxis;
imageDir = 0;

//gamepad
padU = gamepad_button_check(0, gp_padu);
padL = gamepad_button_check(0, gp_padl);
padD = gamepad_button_check(0, gp_padd);
padR = gamepad_button_check(0, gp_padr);

//keyboard
keyU = keyboard_check(ord("W"));
keyL = keyboard_check(ord("A"));
keyD = keyboard_check(ord("S"));
keyR = keyboard_check(ord("D"));
keyLeftHand = keyboard_check_pressed(ord("J"));
keyRightHand = keyboard_check_pressed(ord("L"));


//gamepad controls throw
if (gamepad_is_connected(0)) {
		//east throw
		if (padR) {
			imageDir = 0;
			dir = 20;
		}
		//south throw
		if (padD) {
			imageDir = 270;
			dir = 270;
		}
		//north throw
		if (padU) {
			imageDir = 90;
			dir = 90;
		}
		//west throw
		if (padL) {
			imageDir = 180;
			dir = 160;
		}
		//northeast throw
		if (padU && padR) {
			imageDir = 45;
			dir = 55;
		}
		//nortwest throw
		if (padU && padL) {
			imageDir = 135;
			dir = 115;
		}
		//southwest throw
		if (padD && padL) {
			imageDir = 225;
			dir = 225;
		}
		//southeast throw
		if (padD && padR) {
			imageDir = 315;
			dir = 315;
		}
		//default drop
		if (!padU && !padL && !padD && !padR) {
			dir = 270;
		}
}

//keyboard controls throw
if (!gamepad_is_connected(0)) {
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

//gamepad control throw
if (gamepad_is_connected(0)) {
	//if we press the left button while an object is in left hand
	if (gamepad_button_check_pressed(0, gp_shoulderl)) {
		if (oPlayer.holdingL) {
			itemInLeftHand.followingL = false;
			throwingL = true;
			itemInLeftHand.speed = 25;
			itemInLeftHand.direction = dir;
		}
	}

	//if we press the right button while an object is in right hand
	if (gamepad_button_check_pressed(0, gp_shoulderr)) {
		if (oPlayer.holdingR) {
			itemInRightHand.followingR = false;
			throwingR = true;
			itemInRightHand.speed = 25;
			itemInRightHand.direction = dir;
		}
	}
}

//keyboard control throw
if (!gamepad_is_connected(0)) {
	//if we press the left button while an object is in left hand
	if (keyLeftHand) {
		if (oPlayer.holdingL) {
			itemInLeftHand.followingL = false;
			throwingL = true;
			itemInLeftHand.speed = 25;
			itemInLeftHand.direction = dir;
		}
	}

	//if we press the right button while an object is in right hand
	if (keyRightHand) {
		if (oPlayer.holdingR) {
			itemInRightHand.followingR = false;
			throwingR = true;
			itemInRightHand.speed = 25;
			itemInRightHand.direction = dir;
		}
	}
}
