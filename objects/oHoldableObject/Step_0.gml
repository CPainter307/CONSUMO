/// @description Here's what your average pickupabble item will do every frame.

//if we're holding in the left hand
if (followingL == true) {
	if (oPlayer.facingRight) {
		depth = 350;
		x = oFrontArm.x + 6;
		y = oFrontArm.y + 25;
	}
	else {
		depth = 450;
		x = oFrontArm.x - 50;
		y = oFrontArm.y +25;
	}
}

//if we're holding in the right hand
if (followingR == true) {
	if (oPlayer.facingRight) {
		depth = 350;
		x = oFrontArm.x + 50;
		y = oFrontArm.y + 25;
	}
	else {
		depth = 350;
		x = oFrontArm.x - 10;
		y = oFrontArm.y + 35;
	}
}

//if we're being thrown from left

//if we're being thrown from right

//if we're just bro-chad chilling homie
/**
if (!followingL && !followingR) {
	gravity = 4;
}
