
if (global.input_type == inputs.keyboard) {
	key_up = keyboard_check(global.key_up);
	key_down = keyboard_check(global.key_down);
	key_left = keyboard_check(global.key_left);
	key_right = keyboard_check(global.key_right);
	key_jump = keyboard_check_pressed(global.key_jump);
	key_jump_held = keyboard_check(global.key_jump);
	key_jump_released = keyboard_check_released(global.key_jump);
	key_locked = keyboard_check(global.key_lock);
	key_interact = keyboard_check_pressed(global.key_interact);
	mouse_dir = point_direction(x, y, mouse_x, mouse_y);
	key_inventory = keyboard_check_pressed(global.key_inventory);
	key_room_reset = keyboard_check_pressed(global.key_room_reset);
	key_sprint_held = keyboard_check(global.key_sprint);
	key_throw = mouse_check_button_pressed(global.key_throw);
	key_heavy_throw = mouse_check_button_pressed(global.key_heavy_throw);
}


if (global.input_type == inputs.analog_stick) {
	key_up = (gamepad_axis_value(0, global.key_up) < 0);
	key_down = (gamepad_axis_value(0, global.key_down) > 0);
	key_left = (gamepad_axis_value(0, global.key_left) < 0);
	key_right = (gamepad_axis_value(0, global.key_right) > 0);
	key_jump = gamepad_button_check_pressed(0, global.key_jump);
	key_jump_held = gamepad_button_check(0, global.key_jump);
	key_jump_released = gamepad_button_check_released(0, global.key_jump);
	key_locked = gamepad_button_check(0, global.key_lock);
	key_interact = gamepad_button_check_pressed(0, global.key_interact);
	haxis = gamepad_axis_value(0, global.key_right);
	vaxis = gamepad_axis_value(0, global.key_up);
	stickDir = point_direction(0, 0, haxis, vaxis);
	key_inventory = gamepad_button_check_pressed(0, global.key_inventory);
	key_room_reset = gamepad_button_check(0, global.key_room_reset);
	key_sprint_held = gamepad_button_check(0, global.key_sprint);
	key_throw  = gamepad_button_check_pressed(0, global.key_throw);
	key_heavy_throw = gamepad_button_check_pressed(0, global.key_heavy_throw);
}

//if (global.input_type == inputs.d_pad) {
//	key_up = gamepad_button_check(0, global.key_up);
//	key_down = gamepad_button_check(0, global.key_down);
//	key_left = gamepad_button_check(0, global.key_left);
//	key_right = gamepad_button_check(0, global.key_right);
//	key_jump = gamepad_button_check_pressed(0, global.key_jump);
//	key_jump_held = gamepad_button_check(0, global.key_jump);
//	key_left_hand = gamepad_button_check_pressed(0, global.key_L_hand);
//	key_right_hand = gamepad_button_check_pressed(0, global.key_R_hand);
//	//key_locked = gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);
//	key_locked = gamepad_button_check(0, global.key_lock);
//	key_interact = gamepad_button_check_pressed(0, global.key_interact);
//	//haxis = gamepad_axis_value(0, global.key_right);
//	//vaxis = gamepad_axis_value(0, global.key_up);
//	//stickDir = point_direction(0, 0, haxis, vaxis);
//	key_inventory = gamepad_button_check_pressed(0, global.key_inventory);
//	key_room_reset = gamepad_button_check(0, global.key_room_reset);
//}