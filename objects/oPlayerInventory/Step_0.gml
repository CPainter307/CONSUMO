if oPlayerInput.key_inventory {
	show_inventory = !show_inventory
	inventory_x = oPlayer.x
	inventory_y = oPlayer.y
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
	inventory_x = clamp(oPlayer.x+150, 0, room_width)
	inventory_y = clamp(oPlayer.y, 0, room_height)	
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
		if oCursor.sprite_index != sPointerCursor and show_inventory { //set back to pointer if we are outside of inventory
			oCursor.sprite_index = sPointerCursor
		}
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
	if oPlayerInput.key_throw {
		if !mouse_in_inventory {
			#region drop item into the world
			inv_grid[# 1, pickup_slot] -= 1
		
			//create the item
			if instance_exists(oPlayer) {
				var _item = inv_grid[# 0, pickup_slot]
				if _item != 0 {
					var inst = instance_create_layer(oPlayer.x, oPlayer.y, "Objects", _item[0])
					if inst.object_index == oRecipe {
						// properties of recipe in inventory
						inst.sprite_index = _item[1]
						inst.name = _item[2]
						inst.hp = _item[3]
						inst.attack = _item[4]
						inst.defense = _item[5]
						inst.spd = _item[6]
					}
					if global.input_type == inputs.keyboard {
						oPlayer.image_index = 0
						oPlayer.sprite_index = sPlayerThrow
						oPlayer.player_dir = sign(oPlayer.x - mouse_x) // sets the player's direction to the direction they are throwing during the animation
						throw_object(inst, mouse_x, mouse_y, inst.throw_speed)
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
		//unequip currently held item
		} else if selected_slot == pickup_slot {
			pickup_slot = -1	
		//putting an item in an empty slot
		} else if ss_item != 0 {
			pickup_slot = selected_slot
		}
	}
} else if (ss_item != 0  and mouse_in_inventory) {
	//drop pickup item into new slot
	if oPlayerInput.key_throw {
		pickup_slot = selected_slot
	}
}