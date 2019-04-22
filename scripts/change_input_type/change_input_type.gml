//["Keyboard", "Analog Stick", "D-Pad"]
var type = 0;

switch (argument0) {
	case 0:
		global.input_type = inputs.keyboard;
		type = 0;
		
		//Assign Variables
		global.key_up			= ord("W");
		global.key_down			= ord("S");
		global.key_left			= ord("A");
		global.key_right		= ord("D");
		global.key_jump			= vk_space;
		global.key_L_hand		= mb_left;
		global.key_R_hand		= mb_right;
		global.key_lock			= vk_shift;
		global.key_interact		= ord("E");
		global.key_inventory	= ord("Q");
		global.key_room_reset	= ord("K");
		//global.key_select		= vk_enter;
		global.key_pause		= vk_escape;
	break;
	
	case 1:
		global.input_type = inputs.analog_stick;
		type = 1;
			
		//Assign Variables
		global.key_up			= gp_axislv;
		global.key_down			= gp_axislv;
		global.key_left			= gp_axislh;
		global.key_right		= gp_axislh;
		global.key_jump			= gp_face1;
		global.key_L_hand		= gp_shoulderl;
		global.key_R_hand		= gp_shoulderr;
		global.key_lock			= gp_shoulderrb;
		global.key_interact		= gp_face3;
		global.key_inventory	= gp_face4;
		global.key_room_reset	= gp_select;
		//global.key_select		= vk_enter;
		global.key_pause		= gp_start;
	break
	
	case 2:
		global.input_type = inputs.d_pad;
		type = 2;
		
		//Assign Variables
		global.key_up			= gp_padu;
		global.key_down			= gp_padd;
		global.key_left			= gp_padl;
		global.key_right		= gp_padr;
		global.key_jump			= gp_face1;
		global.key_L_hand		= gp_shoulderl;
		global.key_R_hand		= gp_shoulderr;
		global.key_lock			= gp_shoulderrb;
		global.key_interact		= gp_face3;
		global.key_inventory	= gp_face4;
		global.key_room_reset	= gp_select;
		//global.key_select		= vk_enter;
		global.key_pause		= gp_start;
	break;
}

//Overwrites values in ds_menu_controls
var grid = ds_menu_controls;

ds_grid_set(grid, 3, 0, type);
ds_grid_set(grid, 3, 1, global.key_up);
ds_grid_set(grid, 3, 2, global.key_down);
ds_grid_set(grid, 3, 3, global.key_left);
ds_grid_set(grid, 3, 4, global.key_right);
ds_grid_set(grid, 3, 5, global.key_jump);
ds_grid_set(grid, 3, 6, global.key_L_hand);
ds_grid_set(grid, 3, 7, global.key_R_hand);
ds_grid_set(grid, 3, 8, global.key_lock);
ds_grid_set(grid, 3, 9, global.key_interact);
ds_grid_set(grid, 3, 10, global.key_inventory);
ds_grid_set(grid, 3, 11, global.key_room_reset);
ds_grid_set(grid, 3, 12, global.key_pause);
