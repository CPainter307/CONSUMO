global.pause			= false;
global.view_width		= view_wport[0];
global.view_height		= view_hport[0];

//Global Input Variables
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
global.key_room_reset		= ord("K");
//global.key_select		= vk_enter;
global.key_pause		= vk_escape;

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
	["Master",			menu_element_type.slider,			change_volume,			0.5,				[0,1]],
	["Sounds",			menu_element_type.slider,			change_volume,			0.2,				[0,1]],
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
	["Left Hand",		menu_element_type.input,			"key_L_hand",			mb_left],
	["Right Hand",		menu_element_type.input,			"key_R_hand",			mb_right],
	["Lock",			menu_element_type.input,			"key_lock",				vk_shift],
	["Interact",		menu_element_type.input,			"key_interact",			ord("E")],
	["Inventory",		menu_element_type.input,			"key_inventory",		ord("Q")],
	["Room Reset",		menu_element_type.input,			"key_room_reset",		ord("K")],
	//["Select",			menu_element_type.input,			"key_select",			vk_enter],
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

audio_group_load(audiogroup_soundeffects);
audio_group_load(audiogroup_music);