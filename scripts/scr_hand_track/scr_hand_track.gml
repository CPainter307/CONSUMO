//This code handles hand positions for holding food throughout our animations.

//idle
if (sprite_index == sPlayerIdle) {
	
	//facing right
	if (player_dir == 1) {
		if (image_number == 0) {
			hand_x = x + 10;
			hand_y = y + 24;
		}
		if (image_number == 1) {
			hand_x = x + 7;
			hand_y = y + 20;
		}
		if (image_number == 2) {
			hand_x = x + 6;
			hand_y = y + 19;
		}
		if (image_number == 3) {
			hand_x = x + 7;
			hand_y = y + 20;
		}	
	}
	
	//facing left
	if (player_dir == -1) {
		if (image_number == 0) {
			hand_x = x - 10;
			hand_y = y + 24;
		}
		if (image_number == 1) {
			hand_x = x - 7;
			hand_y = y + 20;
		}
		if (image_number == 2) {
			hand_x = x - 6;
			hand_y = y + 19;
		}
		if (image_number == 3) {
			hand_x = x - 7;
			hand_y = y + 20;
		}		
	}
}

//running

//jumping

//falling