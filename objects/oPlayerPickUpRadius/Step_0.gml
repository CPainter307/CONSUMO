/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

//if we press the left button while an object is in left hand
if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
	if (oPlayer.holdingL) {
		itemInLeftHand.followingL = false;
		throwingL = true;
		itemInLeftHand.speed = 20;
		if (oPlayer.facingRight) {
			itemInLeftHand.direction = 50;
		}
		else {
			itemInLeftHand.direction = 130;
		}
		//declare itemInLeftHand null here?
	}
}

//if we press the right button while an object is in right hand
if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
	if (oPlayer.holdingR) {
		itemInRightHand.followingR = false;
		throwingR = true;
		itemInRightHand.speed = 20;
		if (oPlayer.facingRight) {
			itemInRightHand.direction = 50;
		}
		else {
			itemInRightHand.direction = 130;
		}
		//declare itemInRightHand null here?
	}
}