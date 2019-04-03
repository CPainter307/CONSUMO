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
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			switch(current_val) {
				case vk_up:			current_val = "UP KEY"; break;
				case vk_down:		current_val = "DOWN KEY"; break;
				case vk_left:		current_val = "LEFT KEY"; break;
				case vk_right:		current_val = "RIGHT KEY"; break;
				case vk_space:		current_val = "SPACE"; break;
				case vk_shift:		current_val = "SHIFT"; break;
				case vk_enter:		current_val = "ENTER"; break;
				case vk_escape:		current_val = "ESCAPE"; break;
				case mb_left:		current_val = "LEFT MOUSE"; break;
				case mb_right:		current_val = "RIGHT MOUSE"; break;
				default: current_val = chr(current_val);
			}
			c = c_white;
			if (inputting and yy == menu_option[page]) { c = c_orange; }
			draw_text_color(rtx, rty, current_val, c,c,c,c, 1);
			
	}
	
	yy++;
}


draw_set_valign(fa_top);	//sets allignment back to default