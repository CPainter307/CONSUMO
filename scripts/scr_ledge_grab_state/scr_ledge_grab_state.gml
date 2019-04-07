//oPlayer.moveStateExecuted = false;
//isLocked = true;

if (oPlayerInput.key_jump) {
	scr_play_jump_sound();
	vsp = oPlayerInput.key_jump * -jumpspeed;
	state = scr_move_state;
}

/*
if (oPlayerInput.key_jump) {
	scr_play_jump_sound();
	vsp -= JUMP_HEIGHT;
	if (oPlayerInput.key_right) {
		oPlayer.facingRight = true;
		oPlayer.image_xscale = 0.5;
	} 
	else if (oPlayerInput.key_left) {
		oPlayer.facingRight = false;
		oPlayer.image_xscale = -0.5;
	}
	state = scr_move_state;
}

if (oPlayerPickUpRadius.itemInLeftHand != noone && oPlayerPickUpRadius.itemInRightHand != noone) {
	//oPlayer.moveStateExecuted = true
	state = scr_move_state;
}
