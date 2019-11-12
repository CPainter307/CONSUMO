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
if (sprite_index == sPlayerRun) {
	
	//facing right
	if (player_dir == 1) {
		if (floor(image_index) == 0) {
			hand_x = x + 33;
			hand_y = y + 4;
		}
		if (floor(image_index) == 1) {
			hand_x = x + 18;
			hand_y = y + 6;
		}
		if (floor(image_index) == 2) {
			hand_x = x + 4;
			hand_y = y + 2;
		}
		if (floor(image_index) == 3) {
			hand_x = x - 17;
			hand_y = y - 3;
		}
		if (floor(image_index) == 4) {
			hand_x = x - 15;
			hand_y = y + 1;
		}
		if (floor(image_index) == 5) {
			hand_x = x - 5;
			hand_y = y + 4;
		}
	}	
	//facing left
	if (player_dir == -1) {
		if (floor(image_index) == 0) {
			hand_x = x - 33;
			hand_y = y + 4;
		}
		if (floor(image_index) == 1) {
			hand_x = x - 18;
			hand_y = y + 6;
		}
		if (floor(image_index) == 2) {
			hand_x = x - 4;
			hand_y = y + 2;
		}
		if (floor(image_index) == 3) {
			hand_x = x + 17;
			hand_y = y - 3;
		}
		if (floor(image_index) == 4) {
			hand_x = x + 15;
			hand_y = y + 1;
		}
		if (floor(image_index) == 5) {
			hand_x = x + 5;
			hand_y = y + 4;
		}
	}		
}

//jumping
if (sprite_index == sPlayerJump) {

    //facing right
    if (player_dir == 1) {
        hand_x = x + 24;
        hand_y = y - 3;
    }

    //facing left
    if (player_dir == -1) {
        hand_x = x - 24;
        hand_y = y - 3;
    }
}

//falling
if (sprite_index == sPlayerFall) {

    //facing right
    if (player_dir == 1) {
        hand_x = x + 30;
        hand_y = y;
    }

    //facing left
    if (player_dir == -1) {
        hand_x = x - 30;
        hand_y = y;
    }
}
