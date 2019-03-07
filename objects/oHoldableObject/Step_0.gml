/// @description Here's what your average pickupabble item will do every frame.

//if we're holding in the left hand
if (followingL == true) {
	speed = 0;
	if (oPlayer.facingRight) {
		depth = 250;
		x = oFrontArm.x + 6;
		y = oFrontArm.y + 25;
	}
	else {
		depth = 350;
		x = oFrontArm.x - 50;
		y = oFrontArm.y + 25;
	}
	//still some glitchy placing here - not sure how to fix yet
	gravity = 0; 
	//other.solid = false; 
}

//if we're holding in the right hand
if (followingR == true) {
	speed = 0;
	if (oPlayer.facingRight) {
		depth = 250;
		x = oFrontArm.x + 50;
		y = oFrontArm.y + 25;

	}
	else {
		depth = 250;
		x = oFrontArm.x - 10;
		y = oFrontArm.y + 35;
	}
	//still some glitchy placing here - not sure how to fix yet
	gravity = 0;
	//other.solid = false; 
}

//if we're being thrown from left

//if we're being thrown from right

//if we're just bro-chad chilling homie
if (!followingL && !followingR && !position_meeting(x, y, oWall)) {
	gravity = 1;
}
