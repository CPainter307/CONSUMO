/// @description Collision with the walls

if (!followingL && !followingR) { //if we aren't in a hand
	move_contact_solid(270, 12);
	speed = 0;
}

