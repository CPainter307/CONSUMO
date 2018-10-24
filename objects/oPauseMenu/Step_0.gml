/// @description Control pause menu
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) key_pressed = true;

if (key_pressed && isPaused == false)
{
	instance_deactivate_all(1);
	isPaused = true;
	menu_control = true;
	key_pressed = false;
}
if (key_pressed && isPaused == true)
{
	instance_activate_all();
	isPaused = false;
	menu_control = false;
	key_pressed = false;
}
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
		menu_x_target = gui_width-50;
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

if (menu_x < gui_width) && (menu_committed != -1)
{
	switch(menu_committed)
	{
		case 3: default:
		{
			instance_activate_all();
			isPaused = false;
			menu_committed = -1;
			break;
		}
		case 1: 
		{
			SlideTransition(TRANS_MODE.RESTART);
			instance_activate_object(oTransition);
			isPaused = false;
			break;
		}
		case 0: game_end(); break;
	}
}