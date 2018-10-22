/// @desc Menu control

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;


//Keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up) || (gamepad_button_check_pressed(0, gp_padu)))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down) || (gamepad_button_check_pressed(0, gp_padd)))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter) || (gamepad_button_check_pressed(0,gp_face1)))
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		menu_control = false
	}
}

if (menu_x > gui_width) && (menu_committed != -1)
{
	switch(menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break; // Case 1 not included because as of now, it does the same thing as Case 1
		case 0: game_end(); break;
	}
}