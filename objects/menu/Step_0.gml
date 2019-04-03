if(keyboard_check_pressed(global.key_pause)) { script_execute(pause_game); }

if(!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(vk_enter);

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if(inputting) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.input:
		var kk = keyboard_lastkey; //last key pressed
		if(kk != vk_enter) {
			if(kk != ds_grid[# 3, menu_option[page]]) //new input audio effect here
			ds_grid[# 3, menu_option[page]] = kk;
			variable_global_set(ds_grid[# 2, menu_option[page]], kk);
		}
			
		break;
	}
} else {
	var ochange = input_down_p - input_up_p;	//option change
	if(ochange != 0) {
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
	
		//insert navigation audio here
	}
}

if(input_enter_p) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	//insert select audio here
}