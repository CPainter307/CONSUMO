 if(!global.pause) exit;

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x = gwidth/2;

draw_set_font(fBattleTextThick);

//Draw Pause Menu "Back"
//var c = c_blue;
//draw_rectangle_color(0,0,gwidth, gheight, c,c,c,c, false);
draw_sprite_stretched(bg_cave, image_index, 0, 0, gwidth, gheight);


//Draw Elements of Left Side
//draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo;	//left text x, left text y, x offset

var yy = 0; repeat(ds_height) {
	lty = start_y + (yy*y_buffer);
	c = c_white;
	xo = 0;
	
	if(yy == menu_option[page]) {
		c = c_yellow;	
		xo = -(x_buffer/2);
	}
	
	draw_text_color(ltx+xo, lty, ds_grid[# 0, yy], c,c,c,c, 1);
	yy++;
}

//Draw Dividing Line
c = c_white;
draw_line_color(start_x, start_y-y_buffer, start_x, lty+y_buffer, c, c);

//Draw Elements on Right Side
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty;		//right text x, right text y

yy = 0; repeat(ds_height) {
	rty = start_y + (yy*y_buffer);
	
	switch(ds_grid[# 1, yy]) {
		
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<<    ";
			var right_shift = "    >>";
			var c = c_white;
			if(current_val == 0) left_shift = "";
			if(current_val == array_length_1d(ds_grid[# 4, yy])-1) right_shift = "";
			
			if(inputting and yy == menu_option[page]) { c = c_orange; }
			draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift, c,c,c,c, 1);
			
		break;
		
		case menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_white;
			
			draw_line_width_color(rtx, rty, rtx+len, rty, 2, c,c);
			
			if(inputting and yy == menu_option[page]) { c = c_orange; }
			draw_circle_color(rtx+(circle_pos*len), rty, 4, c,c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos*100))+"%", c,c,c,c, 1);
		break;
		
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = c_white;
			if(inputting and yy == menu_option[page]) { c = c_orange; }
			
			if(current_val == 0) { c1 = c; c2 = c_dkgray; }
			else				 { c1 = c_dkgray; c2 = c; }
			
			draw_text_color(rtx, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_color(rtx+48, rty, "OFF", c2,c2,c2,c2, 1);
		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			switch(current_val) {
				
				//Virtual Keyboard
				case vk_left:			current_val = "LEFT KEY"; break;
				case vk_right:			current_val = "RIGHT KEY"; break;
				case vk_up:				current_val = "UP KEY"; break;
				case vk_down:			current_val = "DOWN KEY"; break;
				case vk_enter:			current_val = "ENTER"; break;
				case vk_escape:			current_val = "ESCAPE"; break;
				case vk_space:			current_val = "SPACE"; break;
				case vk_shift:			current_val = "SHIFT"; break;
				case vk_control:		current_val = "CONTROL"; break;
				case vk_alt:			current_val = "ALT"; break;
				case vk_backspace:		current_val = "BACKSPACE"; break;
				case vk_tab:			current_val = "TAB"; break;
				case vk_home:			current_val = "HOME"; break;
				case vk_end:			current_val = "END"; break;
				case vk_delete:			current_val = "DELETE"; break;
				case vk_insert:			current_val = "INSERT"; break;
				case vk_pageup:			current_val = "PAGE UP"; break;
				case vk_pagedown:		current_val = "PAGE DOWN"; break;
				
				
				//Mouse
				case mb_left:			current_val = "LEFT MOUSE"; break;
				case mb_right:			current_val = "RIGHT MOUSE"; break;
				
				//Gamepad
				case gp_face1:			current_val = "BOTTOM FACE"; break;
				case gp_face2:			current_val = "RIGHT FACE"; break;
				case gp_face3:			current_val = "LEFT FACE"; break;
				case gp_face4:			current_val = "TOP FACE"; break;
				case gp_shoulderl:		current_val = "LEFT BUMPER"; break;
				case gp_shoulderlb:		current_val = "LEFT TRIGGER"; break;
				case gp_shoulderr:		current_val = "RIGHT BUMPER"; break;
				case gp_shoulderrb:		current_val = "RIGHT TRIGGER"; break;
				case gp_select:			current_val = "SELECT"; break;
				case gp_start:			current_val = "START"; break;
				case gp_stickl:			current_val = "L-STICK CLICK"; break;
				case gp_stickr:			current_val = "R-STICK CLICK"; break;
				case gp_padu:			current_val = "D-PAD UP"; break;
				case gp_padd:			current_val = "D-PAD DOWN"; break;
				case gp_padl:			current_val = "D-PAD LEFT"; break;
				case gp_padr:			current_val = "D-PAD RIGHT"; break;
				case gp_axislh:			current_val = "L-STICK HORIZONTAL"; break;
				case gp_axislv:			current_val = "L-STICK VERTICAL"; break;
				case gp_axisrh:			current_val = "R-STICK HORIZONTAL"; break;
				case gp_axisrv:			current_val = "R-STICK VERTICAL"; break;
				
				default: current_val = chr(current_val);
			}
			c = c_white;
			if (inputting and yy == menu_option[page]) { c = c_orange; }
			draw_text_color(rtx, rty, current_val, c,c,c,c, 1);
			
		break;
			
	}
	
	yy++;
}


draw_set_valign(fa_top);	//sets allignment back to default