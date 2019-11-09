xx = oPlayer.x
yy = oPlayer.y

//draw_self();
//figure the mouse dir and distance for aiming and force

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

//no direction is active
return direc.none;