isLocked = true;

if (oPlayerInput.key_jump) {
	vsp -= JUMP_HEIGHT;
	state = scr_move_state;
}
