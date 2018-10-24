/// @desc (insert desc)
isPaused = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width-50;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 15;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = false;

menu[3] = "Resume Game";
menu[2] = "Controller Settings";
menu[1] = "Main Menu";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 3;

key_pressed = false;