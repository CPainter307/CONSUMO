/*var ds_grid = menu.menu_pages[menu.page], ds_height = ds_grid_height(ds_grid);

var default_array[
ord("W"),		//up
ord("S"),		//down
ord("A"),		//left
ord("D"),		//right
vk_space,		//jump
mb_left,		//left hand
mb_right,		//right hand
vk_shift,		//lock
ord("E"),		//interact
ord("F"),		//inventory
ord("K"),		//reset game
//global.key_select		= vk_enter;
vk_escape,		//pause game
]
var i = 0; repeat(ds_height) {
	ds_grid[# 3, menu.menu_option[menu.page]] = default_array[i];
	variable_global_set(ds_grid[# 2, menu.menu_option[menu.page]], default_array[i]);
	i++;
}*/
var input = 0;

if (global.input_type == inputs.keyboard) input = 0;
else if (global.input_type == inputs.analog_stick) input = 1;
else if (global.input_type == inputs.d_pad) input = 2;

change_input_type(input);