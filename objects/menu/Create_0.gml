global.pause			= false;
global.view_width		= display_get_width()
global.view_height		= display_get_height()

//Analog Stick Check
global.up_check			= false;
global.down_check		= false;
global.left_check		= false;
global.right_check		= false;

//Analog
global.last_button		= noone;

//Hardcoded Input Variables
global.hard_up			= vk_up;
global.hard_down		= vk_down;
global.hard_left		= vk_left;
global.hard_right		= vk_right;
global.hard_enter		= vk_enter;
global.hard_pause		= vk_escape;



enum inputs {
	keyboard,
	analog_stick,
	d_pad
}

display_set_gui_size(global.view_width, global.view_height);

enum menu_page {
	//main,
	pause,
	settings,
	audio,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}


//Other Unrelated Enums

enum direc {
	none,
	right,
	up,
	left,
	down,
	up_right,
	up_left,
	down_left,
	down_right
}

global.direction8 = false;
global.switchBlue = true;

//End Other Enums


//CREATE MENU PAGES
/*ds_menu_main = create_menu_page(
	["New Game",	menu_element_type.script_runner,	new_game],
	["Continue",	menu_element_type.script_runner,	load_game],
	["Settings",	menu_element_type.page_transfer,	menu_page.settings],
	["Quit",		menu_element_type.script_runner,	exit_game]
);*/

ds_menu_pause = create_menu_page(
	["Resume Game",		menu_element_type.script_runner,	resume_game],
	["Settings",		menu_element_type.page_transfer,	menu_page.settings],
	//["Main Menu",		menu_element_type.page_transfer,	menu_page.main],
	["Quit",			menu_element_type.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["Audio",			menu_element_type.page_transfer,	menu_page.audio],
	["Graphics",		menu_element_type.page_transfer,	menu_page.graphics],
	["Controls",		menu_element_type.page_transfer,	menu_page.controls],
	["Back",			menu_element_type.page_transfer,	menu_page.pause]	
);

ds_menu_audio = create_menu_page(
	["Master",			menu_element_type.slider,			change_volume,			1,				[0,1]],
	["Sounds",			menu_element_type.slider,			change_volume,			1,				[0,1]],
	["Music",			menu_element_type.slider,			change_volume,			1,				[0,1]],
	["Back",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["Resolution",		menu_element_type.shift,			change_resolution,		4,				["384 x 216", "768, 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["Fullscreen",		menu_element_type.toggle,			change_window_mode,		1,				["Fullscreen", "Window"]],
	["Back",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["Controller Type",	menu_element_type.shift,			change_input_type,		0,				["Keyboard", "Analog Stick", "D-Pad"]],
	["Up",				menu_element_type.input,			"key_up",				ord("W")],
	["Down",			menu_element_type.input,			"key_down",				ord("S")],
	["Left",			menu_element_type.input,			"key_left",				ord("A")],
	["Right",			menu_element_type.input,			"key_right",			ord("D")],
	["Jump",			menu_element_type.input,			"key_jump",				vk_space],
	["Sprint",			menu_element_type.input,			"key_sprint",			vk_shift],
	["Throw",			menu_element_type.input,			"key_throw",			mb_left],
	["Heavy Throw",		menu_element_type.input,			"key_heavy_throw",		mb_right],
	["Interact",		menu_element_type.input,			"key_interact",			ord("E")],
	["Inventory",		menu_element_type.input,			"key_inventory",		ord("Q")],
	["Room Reset",		menu_element_type.input,			"key_room_reset",		ord("K")],
	["Pause",			menu_element_type.input,			"key_pause",			vk_escape],
	["Reset Controls",	menu_element_type.script_runner,	reset_controls],
	["Back",			menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;
menu_pages = [ds_menu_pause, ds_menu_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;

if(gamepad_is_connected(0)) {
	global.input_type = inputs.analog_stick;
	change_input_type(1);
}
else {
	global.input_type = inputs.keyboard;
	change_input_type(0);
}

audio_group_load(audiogroup_soundeffects);
audio_group_load(audiogroup_music);