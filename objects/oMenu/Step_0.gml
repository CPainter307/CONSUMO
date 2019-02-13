/// @desc Menu control

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;


//Keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(ord("W")) || (gamepad_button_check_pressed(0, gp_padu)))
	{
		audio_play_sound(snd_menu_select, 8, false);
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(ord("S")) || (gamepad_button_check_pressed(0, gp_padd)))
	{
		audio_play_sound(snd_menu_select, 8, false);
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter) || (gamepad_button_check_pressed(0,gp_face1)) || (mouse_check_button_pressed(mb_left)))
	{
		audio_play_sound(snd_menu_confirm, 10, false);
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		menu_control = false
		audio_sound_gain(snd_main_theme,0,1000);
		if (audio_sound_get_gain(snd_main_theme) <= 0)
		{
			audio_stop_sound(snd_main_theme);	
		}
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);	
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