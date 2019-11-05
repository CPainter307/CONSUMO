if oPlayerInput.key_inventory { //TODO: change to global input
	show_inventory = !show_inventory
	//if global.input_type == inputs.keyboard {
	//	inventory_x = device_mouse_x_to_gui(0)
	//	inventory_y = device_mouse_y_to_gui(0)
	//} else {
	inventory_x = oPlayer.x
	inventory_y = oPlayer.y
	//}

	//set inventory position to the mouse cursor, clamp it to window boundaries
}
if keyboard_check_pressed(ord("T")) {
	if lineToggle {
		lineToggle = false;
		audio_play_sound(snd_toggle_line,10,false);
	}
	else {
		lineToggle = true;	
		audio_play_sound(snd_toggle_line,10,false);
	}
}
if show_inventory {
	inventory_x = clamp(oPlayer.x + 80, 0, window_get_width()-((cell_size+buffer)*inv_slot_width))
	inventory_y = clamp(oPlayer.y - 80, 0, window_get_height()-((cell_size+buffer)*inv_slot_height))	

}
if global.input_type == inputs.keyboard {
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
} 
if global.input_type == inputs.analog_stick {
	if gamepad_button_check_pressed(0, gp_padu) {
		gamepad_y-=1
	}
	if gamepad_button_check_pressed(0, gp_padd) {
		gamepad_y+=1
	}
	if gamepad_button_check_pressed(0, gp_padr) {
		gamepad_x+=1
	}
	if gamepad_button_check_pressed(0, gp_padl) {
		gamepad_x-=1
	}
	selected_slot = gamepad_x + (gamepad_y * inv_slot_width)
	if !mouse_in_inventory {
		selected_slot = -1	
	}
	if !show_inventory {
		mouse_in_inventory = false	
	} else {
		mouse_in_inventory = true
	}
}

var inv_grid = global.inventory
var ss_item = 0
var ps_item = 0
if selected_slot != -1
	ss_item = inv_grid[# 0, selected_slot]
if pickup_slot != -1
	ps_item = inv_grid[# 0, pickup_slot]

if pickup_slot != -1 {
	//if we click or close our inventory
	if oPlayerInput.key_throw || oPlayerInput.key_heavy_throw {
		if !mouse_in_inventory {
			#region drop item into the world
			inv_grid[# 1, pickup_slot] -= 1
		
			//create the item
			if instance_exists(oPlayer) {
				var _item = inv_grid[# 0, pickup_slot]
				if _item != 0 {
					var inst = instance_create_layer(oPlayer.x, oPlayer.y, "Objects", _item[0])
					if inst.object_index == oRecipe {
						inst.hp = _item[3]
						inst.attack = _item[4]
						inst.defense = _item[5]
						inst.spd = _item[6]
					}
					if global.input_type == inputs.keyboard {
						throw_object(inst, mouse_x, mouse_y, 20)
					} else if global.input_type == inputs.analog_stick {
						throw_object(inst, oPlayerInput.haxis, oPlayerInput.vaxis, 20)
					}
				}
			}
			//destroy item in inventory if it was the last one
			if inv_grid[# 1, pickup_slot] == 0 {
				inv_grid[# 0, pickup_slot] = 0
				pickup_slot = -1
			}
			#endregion
		//putting an item in an empty slot
		} else if ss_item != 0 {
			pickup_slot = selected_slot
		}
	}
} else if (ss_item != 0  and mouse_in_inventory) {
	//drop pickup item into new slot
	if oPlayerInput.key_throw || oPlayerInput.key_heavy_throw {
		pickup_slot = selected_slot
	}
}