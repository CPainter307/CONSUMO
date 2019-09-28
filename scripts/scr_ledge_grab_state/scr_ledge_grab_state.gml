if (oPlayerInput.key_jump) {
	scr_play_jump_sound();
	vsp = oPlayerInput.key_jump * -jumpspeed;
	state = scr_move_state;
}
