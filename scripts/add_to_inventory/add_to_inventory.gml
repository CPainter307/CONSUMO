///@arg0 nearest_item
var nearest_item = argument0

oPlayer.image_index = 0
oPlayer.sprite_index = sPlayerPickup

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
	ni_array = [nearest_item.object_index, nearest_item.sprite_index, nearest_item.name, nearest_item.hp, nearest_item.attack, nearest_item.defense, nearest_item.spd]
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