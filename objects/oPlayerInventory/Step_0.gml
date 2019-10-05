if keyboard_check_pressed(ord("Q")) { //TODO: change to global input
	show_inventory = !show_inventory
	//set inventory position to the mouse cursor, clamp it to window boundaries
	inventory_x = clamp(device_mouse_x(0), 0, window_get_width()-((cell_size+buffer)*inv_slot_width))
	inventory_y = clamp(device_mouse_y(0), 0, window_get_height()-((cell_size+buffer)*inv_slot_height))
}



#region MOUSE SLOT
mousex = device_mouse_x(0)
mousey = device_mouse_y(0)

var i_mousex = mousex - inventory_x+cell_size/2
var i_mousey = mousey - inventory_y+cell_size/2

var nx = i_mousex div (cell_size+buffer)
var ny = i_mousey div (cell_size+buffer)

mouse_in_inventory = true
//if mouse is inside of inventory
if (show_inventory and nx >= 0 and nx < inv_slot_width and ny >= 0 and ny < inv_slot_height) {
	m_slotx = nx;
	m_sloty = ny;
//if mouse is outside of inventory
} else {
	mouse_in_inventory = false
}


//set selected slot to mouse position
selected_slot = m_slotx + (m_sloty*inv_slot_width)
if !mouse_in_inventory {
	selected_slot = -1	
}
#endregion

var inv_grid = global.inventory
var ss_item = inv_grid[# 0, selected_slot]
var ps_item = inv_grid[# 0, pickup_slot]

if pickup_slot != -1 {
	//if we click or close our inventory
	if mouse_check_button_pressed(mb_left) { //TODO: change to global input
		if !mouse_in_inventory {
			#region drop item into the world
			inv_grid[# 1, pickup_slot] -= 1
		
			//create the item
			if instance_exists(oPlayer) {
				var _item = inv_grid[# 0, pickup_slot]
				if _item != 0 {
					instance_create_layer(oPlayer.x, oPlayer.y, "Objects", _item[0])
				}
			}
			//destroy item in inventory if it was the last one
			if inv_grid[# 1, pickup_slot] == 0 {
				inv_grid[# 0, pickup_slot] = 0
				pickup_slot = -1
			}
			#endregion
		//putting an item in an empty slot
		} else if ss_item == 0 {
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot]
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot]
			
			inv_grid[# 0, pickup_slot] = 0
			inv_grid[# 1, pickup_slot] = 0

			pickup_slot = -1
		//stacking two of the same items
		} else if (ss_item[0] == ps_item[0]) {
			if selected_slot != pickup_slot {
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot]
				inv_grid[# 0, pickup_slot] = 0
				inv_grid[# 1, pickup_slot] = 0
			}
			pickup_slot = -1
		//swapping two different items
		} else {
			var ss_item_num = inv_grid[# 1, selected_slot]
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot]
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot]
			
			inv_grid[# 0, pickup_slot] = ss_item
			inv_grid[# 1, pickup_slot] = ss_item_num
		}
	}
} else if (ss_item != 0  and mouse_in_inventory) {
	//drop item into game world
	if mouse_check_button_pressed(mb_right) {

		inv_grid[# 1, selected_slot] -= 1
		
		//create the item
		if instance_exists(oPlayer) {
			var _item = inv_grid[# 0, selected_slot]
			if _item != 0 {
				if (object_exists(_item[0])) {
				instance_create_layer(oPlayer.x, oPlayer.y, "Objects", _item[0])
				}
			}
		}
		//destroy item in inventory if it was the last one
		if inv_grid[# 1, selected_slot] == 0 {
			inv_grid[# 0, selected_slot] = 0	
		}
	}
	
	//drop pickup item into new slot
	if mouse_check_button_pressed(mb_left) { //TODO: change to global input
		pickup_slot = selected_slot
	}
}