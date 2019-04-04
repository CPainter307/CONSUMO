/// @description Ingredient specific turnaround (put this in general oHoldableObject later)
if (followingL || followingR) {
	if (oPlayer.facingRight) {
		image_xscale = 0.5;
	}
	else {
		image_xscale = -0.5;
	}
}

//inherit event
event_inherited();