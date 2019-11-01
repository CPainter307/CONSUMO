scr_get_input();

//for taking input based on player position
x = oPlayer.x;
y = oPlayer.y;


if (keyboard_check_pressed(ord("8"))) {
		if (global.direction8) {
			global.direction8 = false;	
		}
		else {
			global.direction8 = true;	
		}
	}