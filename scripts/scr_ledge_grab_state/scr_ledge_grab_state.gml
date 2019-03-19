oPlayer.moveStateExecuted = false;
isLocked = true;
show_debug_message("test")
if (oPlayerInput.key_jump) {
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

if (oPlayer.holdingL && oPlayer.holdingR) {
	//oPlayer.moveStateExecuted = true
	state = scr_move_state;
}
