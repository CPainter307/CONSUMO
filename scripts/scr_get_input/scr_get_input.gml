//keyboard
if (!gamepad_is_connected(0)) {
	key_left = keyboard_check(ord("A"))
	key_right = keyboard_check(ord("D"))
	key_down = keyboard_check(ord("S"))
	key_jump = keyboard_check_pressed(vk_space)
	key_jump_held = keyboard_check(vk_space)
	key_locked = keyboard_check(vk_shift)
}

//gamepad
if (gamepad_is_connected(0)) {
	key_left = (gamepad_axis_value(0,gp_axislh) < 0);
	key_right = (gamepad_axis_value(0,gp_axislh) > 0);
	key_down = (gamepad_axis_value(0,gp_axislv) > 0);
	key_jump = gamepad_button_check_pressed(0,gp_face1);
	key_jump_held = gamepad_button_check(0,gp_face1);
	key_locked = gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);
}