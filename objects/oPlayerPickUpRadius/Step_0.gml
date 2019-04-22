/// @description following and hopefully throwing

//positioning
x = oPlayer.x;
y = oPlayer.y;

//declare variables every frame
imageDir = 0;


if (!showInv) {

	//gamepad controls throw
	if (global.input_type == inputs.analog_stick) {
	
		//throwing while moving
		if (!oPlayer.isLocked) {
	
			//east throw
			if (oPlayerInput.stickDir >= 337.5 || oPlayerInput.stickDir < 22.5) {
				imageDir = 0;
				dir = 20;
			}
			//south throw
			if (oPlayerInput.stickDir >= 247.5 && oPlayerInput.stickDir < 292.5) {
				imageDir = 270;
				dir = 270;
			}
			//north throw
			if (oPlayerInput.stickDir >= 67.5 && oPlayerInput.stickDir < 112.5) {
				imageDir = 90;
				dir = 90;
			}
			//west throw
			if (oPlayerInput.stickDir >= 157.5 && oPlayerInput.stickDir < 202.5) {
				imageDir = 180;
				dir = 160;
			}
			//northeast throw
			if (oPlayerInput.stickDir >= 22.5 && oPlayerInput.stickDir < 67.5) {
				imageDir = 45;
				dir = 55;
			}
			//nortwest throw
			if (oPlayerInput.stickDir >= 112.5 && oPlayerInput.stickDir < 157.5) {
				imageDir = 135;
				dir = 115;
			}
			//southwest throw
			if (oPlayerInput.stickDir >= 202.5 && oPlayerInput.stickDir < 247.5) {
				imageDir = 225;
				dir = 225;
			}
			//southeast throw
			if (oPlayerInput.stickDir >= 292.5 && oPlayerInput.stickDir < 337.5) {
				imageDir = 315;
				dir = 315;
			}
			//default drop
			if (oPlayerInput.haxis == 0 && oPlayerInput.vaxis == 0) {
				dir = 270;
			}
		}
	
		//throwing while locked
		if (oPlayer.isLocked) {

			//throwing with left stick while locked
			if (oPlayerInput.haxis != 0 || oPlayerInput.vaxis != 0) {
				dir = point_direction(0, 0, oPlayerInput.haxis, oPlayerInput.vaxis);
				imageDir = oPlayerInput.stickDir;		
			
				//east throw correction
				/**
				if (dir >= 337.5 || dir < 22.5) {
					dir = dir + 20;
				}
				//west throw correction
				if (dir >= 157.5 && dir < 202.5) {
					dir = dir - 20;
				}
				*/
			}
		}
	}

	//keyboard controls throw
	if (global.input_type == inputs.keyboard) {
	
		//throwing while moving
		if (!oPlayer.isLocked) {
	
			//east throw
			if (oPlayerInput.key_right) {
				imageDir = 0;
				dir = 20;
			}
			//south throw
			if (oPlayerInput.key_down) {
				imageDir = 270;
				dir = 270;
			}
			//north throw
			if (oPlayerInput.key_up) {
				imageDir = 90;
				dir = 90;
			}
			//west throw
			if (oPlayerInput.key_left) {
				imageDir = 180;
				dir = 160;
			}
			//northeast throw
			if (oPlayerInput.key_up && oPlayerInput.key_right) {
				imageDir = 45;
				dir = 55;
			}
			//nortwest throw
			if (oPlayerInput.key_up && oPlayerInput.key_left) {
				imageDir = 135;
				dir = 115;
			}
			//southwest throw
			if (oPlayerInput.key_down && oPlayerInput.key_left) {
				imageDir = 225;
				dir = 225;
			}
			//southeast throw
			if (oPlayerInput.key_down && oPlayerInput.key_right) {
				imageDir = 315;
				dir = 315;
			}
			//default drop
			if (!oPlayerInput.key_up && !oPlayerInput.key_left && !oPlayerInput.key_down && !oPlayerInput.key_right) {
				dir = 270;
			}
		}
	
		//throwing while locked
		if (oPlayer.isLocked) {
			imageDir = oPlayerInput.mouse_dir;
			dir = oPlayerInput.mouse_dir;
				
			//east throw correction
			/**
			if (oPlayerInput.mouse_dir >= 337.5 || oPlayerInput.mouse_dir < 22.5) {
				dir = dir + 20;
			
			}
			//west throw correction
			if (oPlayerInput.mouse_dir >= 157.5 && oPlayerInput.mouse_dir < 202.5) {
				dir = dir - 20;
			}
			**/
		
			//sprite flipping
			if (oPlayerInput.mouse_dir < 90 || oPlayerInput.mouse_dir >= 270) && (oPlayer.moveStateExecuted) {
				oPlayer.facingRight = true;
				oPlayer.image_xscale = 0.5;
			}
			if (oPlayerInput.mouse_dir < 270 && oPlayerInput.mouse_dir >= 90) && (oPlayer.moveStateExecuted) {
				oPlayer.facingRight = false;;
				oPlayer.image_xscale = -0.5;
			}

		}
	}

	//throwing
		//if we press the left button while an object is in left hand
		if (oPlayerInput.key_left_hand) {
			if (instance_exists(itemInLeftHand) and oPlayerPickUpRadius.itemInLeftHand != noone) {
				itemInLeftHand.followingL = false;
				throwingL = true;
				itemInLeftHand.x = x;
				itemInLeftHand.y = y;
				itemInLeftHand.speed = 25;
				itemInLeftHand.direction = dir;
			} else {
				throwingL = false;
			}
		}

		//if we press the right button while an object is in right hand
		if (oPlayerInput.key_right_hand) {
			if (instance_exists(itemInRightHand) and oPlayerPickUpRadius.itemInRightHand != noone) {
				itemInRightHand.followingR = false;
				throwingR = true;
				itemInRightHand.x = x;
				itemInRightHand.y = y;
				itemInRightHand.speed = 25;
				itemInRightHand.direction = dir;
			} else {
				throwingR = false;
			}
		}
}

if (oPlayer.moveStateExecuted) {
	//debugging line
}