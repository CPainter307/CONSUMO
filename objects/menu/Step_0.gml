if(keyboard_check_pressed(global.hard_pause) || keyboard_check_pressed(global.key_pause) || gamepad_button_check_pressed(0, global.key_pause)) { script_execute(pause_game); }

if(!global.pause) exit;

//hardcodes default values
hard_input_up_p			= keyboard_check_pressed(global.hard_up);
hard_input_down_p		= keyboard_check_pressed(global.hard_down);
hard_input_left_p		= keyboard_check_pressed(global.hard_left);
hard_input_right_p		= keyboard_check_pressed(global.hard_right);
hard_input_enter_p		= keyboard_check_pressed(global.hard_enter);

if (global.input_type == inputs.keyboard) {
	input_up_p			= keyboard_check_pressed(global.key_up);
	input_down_p		= keyboard_check_pressed(global.key_down);
	input_left_p		= keyboard_check_pressed(global.key_left);
	input_right_p		= keyboard_check_pressed(global.key_right);
	input_enter_p		= keyboard_check_pressed(global.key_jump);
}
else if (global.input_type == inputs.analog_stick) {
	input_up_p			= stick_menu_movement(global.key_up);
	input_down_p		= stick_menu_movement(global.key_down);
	input_left_p		= stick_menu_movement(global.key_left);
	input_right_p		= stick_menu_movement(global.key_right);
	input_enter_p		= gamepad_button_check_pressed(0, global.key_jump)
}
else {
	input_up_p			= gamepad_button_check_pressed(0, global.key_up);
	input_down_p		= gamepad_button_check_pressed(0, global.key_down);
	input_left_p		= gamepad_button_check_pressed(0, global.key_left);
	input_right_p		= gamepad_button_check_pressed(0, global.key_right);
	input_enter_p		= gamepad_button_check_pressed(0, global.key_jump);
}

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if(inputting) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var hard_hinput = hard_input_right_p - hard_input_left_p;
			var hinput = input_right_p - input_left_p; //horizontal input
			if(hard_hinput != 0 || hinput != 0) {
				//new input audio effect here
				ds_grid[# 3, menu_option[page]]	+= (hard_hinput + hinput);
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element_type.slider:
			switch(menu_option[page]) {
				case 0: if(!audio_is_playing(snd_menu_select)) { audio_play_sound(snd_menu_select,1,false); } break;
				case 1: if(!audio_is_playing(snd_chop_1)) { audio_play_sound(snd_chop_1,1,false); } break;
				case 2: if(!audio_is_playing(snd_main_theme)) { audio_play_sound(snd_main_theme,1,false); } break;
			}
			
			var hard_hinput = keyboard_check(global.hard_right) - keyboard_check(global.hard_left);
			if (global.input_type == inputs.keyboard) {
				var hinput = keyboard_check(global.key_right) - keyboard_check(global.key_left); //horizontal input
			}
			else if (global.input_type == inputs.analog_stick) {
				var hinput = (gamepad_axis_value(0, global.key_right) > 0) - (gamepad_axis_value(0, global.key_left) < 0);
			}
			else {
				var hinput = gamepad_button_check(0, global.key_right) - gamepad_button_check(0, global.key_left);
			}
			if(hard_hinput != 0 || hinput != 0) {
				ds_grid[# 3, menu_option[page]]	+= (hard_hinput + hinput)*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		break;
		
		case menu_element_type.toggle:
			var hard_hinput = hard_input_right_p - hard_input_left_p;
			var hinput = input_right_p - input_left_p; //horizontal input
			if(hard_hinput != 0 || hinput != 0) {
				//new input audio effect here
				ds_grid[# 3, menu_option[page]]	+=(hard_hinput + hinput);
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element_type.input:
		if (global.input_type == inputs.keyboard) {
			var kk = keyboard_lastkey; //last key pressed
		}
		else {
			kk = last_gamepad();	
		}
		if(kk != global.hard_enter && kk != global.key_jump) {
			if(kk != ds_grid[# 3, menu_option[page]]) //new input audio effect here
			ds_grid[# 3, menu_option[page]] = kk;
			variable_global_set(ds_grid[# 2, menu_option[page]], kk);
		}
			
		break;
	}
} else {
	var hard_ochange = hard_input_down_p - hard_input_up_p;
	var ochange = input_down_p - input_up_p;	//option change
	if(hard_ochange != 0 || ochange != 0) {
		menu_option[page] += (hard_ochange + ochange);
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
	
		//insert navigation audio here
	}
}

if(hard_input_enter_p || input_enter_p) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if(inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	//insert select audio here
}