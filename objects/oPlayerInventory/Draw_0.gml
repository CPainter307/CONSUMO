if !show_inventory {
	exit	
}

draw_set_color(c_white)

//draw bg
draw_set_alpha(.5)
draw_rectangle_color(inventory_x-(cell_size/2), inventory_y-(cell_size/2), inventory_x-(cell_size/2)+((cell_size+buffer)*inv_slot_width)-buffer, inventory_y-(cell_size/2)+((cell_size+buffer)*inv_slot_height-buffer), c_ltgray, c_ltgray, c_ltgray, c_ltgray, false)
draw_set_alpha(1)

var ii, ix, iy, xx, yy, iitem;
var ii = 0; ix = 0; iy = 0;
var inv_grid = global.inventory;

repeat (inv_slots) {
	//x and y location for slot
	xx = ((cell_size+buffer)*ix) + inventory_x
	yy = ((cell_size+buffer)*iy) + inventory_y
	
	//item and slot
	iitem = inv_grid[# 0, ii]
	
	switch (ii) {
		//if we are hovering over the slot
		case selected_slot:
			draw_set_alpha(.7)
			draw_rectangle(xx-cell_size/2, yy-cell_size/2, xx+cell_size/2, yy+cell_size/2, false)
			draw_set_alpha(1)
			if iitem != 0 {
				draw_sprite_ext(iitem[1], 0, xx, yy, item_scale, item_scale, 0, c_white, 1)
			}
		break;

		//if our mouse is holding an item
		case pickup_slot:
			if iitem != 0 {
				draw_sprite_ext(iitem[1], 0, xx, yy, item_scale, item_scale, 0, c_white, .2)
			}
		break;
		
		default:
			if iitem != 0 {
				draw_sprite_ext(iitem[1], 0, xx, yy, item_scale, item_scale, 0, c_white, 1)
			}
		break;
	}
	
	if iitem != 0 {
		var c = c_white;
		var number = inv_grid[# 1, ii];
		draw_text_color(xx, yy, string(number), c,c,c,c, 1)
	}
	
	//increment
	ii += 1;
	ix = ii mod inv_slot_width;
	iy = ii div inv_slot_width;
}

//if we have something picked up with the mouse
if (pickup_slot != -1) {
	iitem = inv_grid[# 0, pickup_slot]
	draw_sprite_ext(iitem[1], 0, mousex, mousey, item_scale, item_scale, 0, c_white, 1)
	var inum = inv_grid[# 1, pickup_slot]
	var c = c_white;
	draw_text_color(mousex, mousey, string(inum), c,c,c,c, 1)
}