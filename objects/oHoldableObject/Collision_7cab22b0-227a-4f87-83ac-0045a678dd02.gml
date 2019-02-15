/// @description Collision with the walls

if (!followingL && !followingR) { //if we aren't in a hand
	//move_contact_solid(270, 12);
	speed = 0;
}
if (followingL || followingR) {
	other.solid = false;
} else {
	other.solid = true;	
}
/*
if (followingL) {
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
	//still some glitchy placing here - not sure how to fix yet
	gravity = 0; 
	//other.solid = false; 	
}

if (followingR) {
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
	//still some glitchy placing here - not sure how to fix yet
	gravity = 0;
	//other.solid = false; 	
}*/