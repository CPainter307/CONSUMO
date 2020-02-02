///@description while the pot is being held, this script matches the pot's position to the animation

x_offset = 0;
y_offset = 0;

if (oPlayer.sprite_index == sPlayerIdleHoldingBig) {
	if (floor(oPlayer.image_index) == 0) {
		x_offset = 0;
		y_offset = 0;
	}
	if (floor(oPlayer.image_index) == 1) {
		x_offset = 0;
		y_offset = -1;
	}
	if (floor(oPlayer.image_index) == 2) {
		x_offset = 0;
		y_offset = -1;
	}
	if (floor(oPlayer.image_index) == 3) {
		x_offset = 0;
		y_offset = 0;
	}	
}

if (oPlayer.sprite_index == sPlayerRunHoldingBig) {
	if (oPlayer.player_dir == 1) {
		if (floor(oPlayer.image_index) == 0) {
			x_offset = 0;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 1) {
			x_offset = 1;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 2) {
			x_offset = 2;
			y_offset = 1;
		}
		if (floor(oPlayer.image_index) == 3) {
			x_offset = 3;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 4) {
			x_offset = 2;
			y_offset = 0;
		}	
		if (floor(oPlayer.image_index) == 5) {
			x_offset = 1;
			y_offset = 0;
		}
	} 
	if (oPlayer.player_dir == -1) {
		if (floor(oPlayer.image_index) == 0) {
			x_offset = 0;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 1) {
			x_offset = -1;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 2) {
			x_offset = -2;
			y_offset = 1;
		}
		if (floor(oPlayer.image_index) == 3) {
			x_offset = -3;
			y_offset = 0;
		}
		if (floor(oPlayer.image_index) == 4) {
			x_offset = -2;
			y_offset = 0;
		}	
		if (floor(oPlayer.image_index) == 5) {
			x_offset = -1;
			y_offset = 0;		
		}
	}
}