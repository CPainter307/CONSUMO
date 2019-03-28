//keyboard
if (!gamepad_is_connected(0)) {
	key_up = keyboard_check(ord("W"));
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_down = keyboard_check(ord("S"));
	key_jump = keyboard_check_pressed(vk_space);
	key_jump_held = keyboard_check(vk_space);
	key_left_hand = mouse_check_button_pressed(mb_left);
	key_right_hand = mouse_check_button_pressed(mb_right);
	key_locked = keyboard_check(vk_shift);
	key_interact = keyboard_check_pressed(ord("E"))
	mouse_dir = point_direction(x, y, mouse_x, mouse_y);
	key_inventory = keyboard_check_pressed(vk_tab);
}

//gamepad
if (gamepad_is_connected(0)) {
	key_up = (gamepad_axis_value(0,gp_axislv) < 0);
	key_left = (gamepad_axis_value(0,gp_axislh) < 0);
	key_right = (gamepad_axis_value(0,gp_axislh) > 0);
	key_down = (gamepad_axis_value(0,gp_axislv) > 0);
	key_jump = gamepad_button_check_pressed(0,gp_face1);
	key_jump_held = gamepad_button_check(0,gp_face1);
	key_left_hand = gamepad_button_check_pressed(0, gp_shoulderl);
	key_right_hand = gamepad_button_check_pressed(0, gp_shoulderr);
	key_locked = gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);
	key_interact = gamepad_button_check_pressed(0,gp_face3);
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	stickDir = point_direction(0, 0, haxis, vaxis);
	key_inventory = gamepad_button_check_pressed(0, gp_face4)
}