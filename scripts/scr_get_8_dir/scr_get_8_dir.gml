xx = oPlayer.x
yy = oPlayer.y

//draw_self();
//figure the mouse dir and distance for aiming and force
if global.input_type == inputs.keyboard {
	dir = point_direction(xx, yy, mouse_x, mouse_y);
	dir = round(dir/45)
	dir = dir * 45;
	if (dir == 0) {
		return direc.right;	
	}
	if (dir == 45) {
		return direc.up_right;	
	}
	if (dir == 90) {
		return direc.up;	
	}
	if (dir == 135) {
		return direc.up_left;	
	}
	if (dir == 180) {
		return direc.left;	
	}
	if (dir == 225) {
		return direc.down_left;	
	}
	if (dir == 270) {
		return direc.down;	
	}
	if (dir == 315) {
		return direc.down_right;	
	}
		
}
else if global.input_type == inputs.analog_stick {
	if (oPlayerInput.key_up) {
		//if true then direction is up-right
		if (oPlayerInput.key_right) {
			return direc.up_right;
		}
		//if true then direction is up-left
		if (oPlayerInput.key_left) {
			return direc.up_left;	
		}
		//no other checks so direction is up
		return direc.up;
	}
	if (oPlayerInput.key_down) {
		//if true then direction is down-right
		if (oPlayerInput.key_right) {
		return direc.down_right;	
		}
		//if true then direction is down-left
		if (oPlayerInput.key_left) {
			return direc.down_left;	
		}
		//no other checks so direction is down
		return direc.down;
	}
	//if true then direction is right
	if (oPlayerInput.key_right) {
		return direc.right;	
	}
	//if true then direction is left
	if (oPlayerInput.key_left) {
		return direc.left;	
	}
}
//no direction is active
return direc.none;