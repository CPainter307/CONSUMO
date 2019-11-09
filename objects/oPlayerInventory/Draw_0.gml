if pickup_slot != -1 {
	if (lineToggle) {
		draw_throw_line()
	}
}

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
		//if our mouse is holding an item
		case pickup_slot:
			draw_set_color(c_yellow)
			draw_set_alpha(.7)
			draw_rectangle(xx-cell_size/2, yy-cell_size/2, xx+cell_size/2, yy+cell_size/2, false)
			draw_set_color(c_white)
			draw_set_alpha(1)
			if iitem != 0 {
				draw_sprite_ext(iitem[1], 0, xx, yy, item_scale, item_scale, 0, c_white, 1)
			}
			if selected_slot == pickup_slot {
				//set to grab cursor if hovering over an item
				if oCursor.sprite_index != sGrabCursor {
					oCursor.sprite_index = sGrabCursor
				}
			}
		break;
		
		//if we are hovering over the slot
		case selected_slot:
			//only highlight if there's an item in the slot
			if inv_grid[# 0, selected_slot] != 0 {
				draw_text(mouse_x+30, mouse_y+30, iitem[2])
				draw_set_alpha(.7)
				draw_rectangle(xx-cell_size/2, yy-cell_size/2, xx+cell_size/2, yy+cell_size/2, false)
				draw_set_alpha(1)
				if iitem != 0 {
					draw_sprite_ext(iitem[1], 0, xx, yy, item_scale, item_scale, 0, c_white, 1)
				}
				//set to grab cursor if hovering over an item
				if oCursor.sprite_index != sGrabCursor {
					oCursor.sprite_index = sGrabCursor
				}
			} else if oCursor.sprite_index != sPointerCursor { //set back to pointer if in a non-highlighted slot
				oCursor.sprite_index = sPointerCursor
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
	oPlayer.held_item = iitem[1]
}
