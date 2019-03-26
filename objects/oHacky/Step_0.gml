/// @description Insert description here
// You can write your code in this editor
if (instance_exists(oPlayer)) {
	if (!oPlayer.holdingL && !oPlayer.holdingR) {	
		x = oPlayer.x+xrad*sin(t+pi/2);
		y = oPlayer.y+yrad*sin(2*t);
		t += dt;
		if (t >= 2*pi) {
			t -= 2*pi;
		}
	}

	if (oPlayer.holdingL || oPlayer.holdingR) {
		image_angle = oPlayerPickUpRadius.imageDir
		if (image_angle > 90) && (image_angle < 270) {
			image_yscale = -1;	
		}
		else {
			image_yscale = 1;	
		}
		if (oPlayer.hsp = 0) {
			x = (oPlayer.x) + sin(get_timer()/700000) * 10; 
			y = (oPlayer.y - 75) + sin(get_timer()/750000) * 10;
		}
		//rotate sprite 	
		if (!gamepad_is_connected(0)) {
			keyU = keyboard_check(ord("W"));
			keyL = keyboard_check(ord("A"));
			keyD = keyboard_check(ord("S"));
			keyR = keyboard_check(ord("D"));
			if keyU {
				x = (oPlayer.x) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y - 110) + sin(get_timer()/350000) * 10;		
			}
			if keyL	{
				x = (oPlayer.x - 128) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y) + sin(get_timer()/350000) * 10;	
			}
			if keyR	{
				x = (oPlayer.x + 128) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y) + sin(get_timer()/350000) * 10;	
			}
			if keyD	{
				x = (oPlayer.x) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y + 100) + sin(get_timer()/350000) * 10;	
			}
			if keyD && keyR	{
				x = (oPlayer.x + 70) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y + 100) + sin(get_timer()/350000) * 10;
			}
			if keyU && keyR {
				x = (oPlayer.x + 70) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y - 100) + sin(get_timer()/350000) * 10;
			}
			if keyD && keyL {
				x = (oPlayer.x - 70) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y + 100) + sin(get_timer()/350000) * 10;
			}
			if keyU && keyL {
				x = (oPlayer.x - 70) + sin(get_timer()/400000) * 10;
				y = (oPlayer.y - 100) + sin(get_timer()/350000) * 10;
			}
			sprite_index = sHacky;
			if oPlayer.isLocked {
				x = mouse_x + sin(get_timer()/400000) * 10;
				y = mouse_y + sin(get_timer()/350000) * 10;
			}
			/*if ((!keyU && !keyL && !keyD && !keyR) && !oPlayer.isLocked) {
				sprite_index = sIndicatorCircle;
			}*/
		}	
		
		if (gamepad_is_connected(0)) {
			padU = gamepad_button_check(0, gp_padu);
			padL = gamepad_button_check(0, gp_padl);
			padD = gamepad_button_check(0, gp_padd);
			padR = gamepad_button_check(0, gp_padr);
			sprite_index = sHacky;
			x = (oPlayer.x + 30) + sin(get_timer()/400000) * 10;
			y = (oPlayer.y - 100) + sin(get_timer()/350000) * 10;
			/*if (gamepad_axis_value(0, gp_axislh) == 0 && gamepad_axis_value(0, gp_axislv) == 0) {
				sprite_index = sIndicatorCircle;
			}*/
		}
	}
}