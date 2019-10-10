//This code handles hand positions for holding food throughout our animations.

//idle
if (sprite_index == sPlayerIdle) {
	
	//facing right
	if (player_dir == 1) {
		if (floor(image_index) == 0) {
			hand_x = x + 20;
			hand_y = y + 12;
		}
		if (floor(image_index) == 1) {
			hand_x = x + 17;
			hand_y = y + 10;
		}
		if (floor(image_index) == 2) {
			hand_x = x + 16;
			hand_y = y + 9;
		}
		if (floor(image_index) == 3) {
			hand_x = x + 17;
			hand_y = y + 10;
		}	
	}
	
	//facing left
	if (player_dir == -1) {
		if (floor(image_index) == 0) {
			hand_x = x - 20;
			hand_y = y + 12;
		}
		if (floor(image_index) == 1) {
			hand_x = x - 17;
			hand_y = y + 10;
		}
		if (floor(image_index) == 2) {
			hand_x = x - 16;
			hand_y = y + 9;
		}
		if (floor(image_index) == 3) {
			hand_x = x - 17;
			hand_y = y + 10;
		}		
	}
}

//running

//jumping

//falling