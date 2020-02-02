/// @description Ingredient specific turnaround (put this in general oHoldableObject later)
if (followingL || followingR) {
	if (oPlayer.facingRight) {
		image_xscale = 1;
	}
	else {
		image_xscale = -1;
	}
}

//prepared update code
if (prepared && !beingCooked) {
	if (prepared_i == 0) {
		sprite_index = prepared_sprite;	//prepared_i makes sure it only happens once to avoid unnecessary index asssignment
	}
	//if (prepared_i < prepared_check) {	//increments prepared timer
	//	prepared_i++;	
	//}
	//else {	//timer expired; no longer prepared
	//	prepared_i = 0;
	//	prepared = false;
	//	sprite_index = unprepared_sprite;
	//}
}

//inside target check
if (in_target) {
	if (!place_meeting(x,y, oPrepTarget)) {
		in_target = false;	
	}
}

//inherit event
event_inherited();