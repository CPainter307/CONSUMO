#region picking up


part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);
script_execute(state);

itemRadiusList = ds_list_create()
pickupRadius = collision_circle_list(x, y, pickupRadiusSize , oHoldableObject, false, true, itemRadiusList, true)

//highlighting items
if pickupRadius > 0 {
	for (var i = 0; i < itemRadiusList[| i]; i++) {
		itemRadiusList[| i].highlighted = false
	}
	itemRadiusList[| 0].highlighted = true
}

//go through doors
var _door = instance_place(x, y, oDoor)
if _door != noone {
	if (oPlayerInput.key_down) {
		if (room_exists(_door.new_room)) {
			room_goto(_door.new_room);
			x = _door.new_x;
			y = _door.new_y;
		}
	}
}

// if we press pickup and we are colliding with some holdable objects, then add the nearest one to our inventory
if oPlayerInput.key_interact {
	if pickupRadius > 0 {
		var nearest_item = itemRadiusList[| 0]
		var ni_array
		if nearest_item.object_index == oRecipe {
			ni_array = [nearest_item.object_index, nearest_item.sprite_index, nearest_item.name, nearest_item.hp, nearest_item.attack, nearest_item.defense, nearest_item.spd]
			with oPlayerInventory {
				var ds_inv = global.inventory
				var picked_up = false
			
				//add item to empty slot if it doesnt already exist
				if (!picked_up) {
					var yy = 0; repeat (inv_slots) {
						if ds_inv[# 0, yy] == 0 {
							ds_inv[# 0, yy] = ni_array
							ds_inv[# 1, yy] += 1
							picked_up = true
							break;
						} else {
							yy += 1	
						}
	 				}
				}
				//destroy item if picked up
				if picked_up {
					instance_destroy(nearest_item)	
				}
			}
		} else {
			ni_array = [nearest_item.object_index, nearest_item.sprite_index, nearest_item.name]
			with oPlayerInventory {
				var ds_inv = global.inventory
				var picked_up = false
			
				//check if item already exists in inventory
				var yy = 0; repeat (inv_slots) {
					var ds_inv_slot = ds_inv[# 0, yy]
					if ds_inv_slot != 0 {
						if ds_inv_slot[0] == ni_array[0] {
							ds_inv[# 1, yy] += 1
							picked_up = true
							break;
						}
					}
					yy += 1
		 		}
			
				//add item to empty slot if it doesnt already exist
				if (!picked_up) {
					var yy = 0; repeat (inv_slots) {
						if ds_inv[# 0, yy] == 0 {
							ds_inv[# 0, yy] = ni_array
							ds_inv[# 1, yy] += 99  ///////// SET THIS BACK TO 1!!!
							picked_up = true
							break;
						} else {
							yy += 1	
						}
		 			}
				}
				//destroy item if picked up
				if picked_up {
					instance_destroy(nearest_item)	
				}
			}
		} 
	}
}
ds_list_destroy(itemRadiusList)
#endregion

#region hand tracking

script_execute(scr_hand_track());


#endregion