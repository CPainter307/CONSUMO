/// @description 
if instance_exists(steam) {
	steam.x = x
	steam.y = y-oPot.sprite_height
}

// checks to see if recipe is done
if (ds_list_size(item_list) >= 3) {
	// JUST RIGHT
	if (timeline_position >= 270 and timeline_position < 540) {
		scr_extract_recipe(0);
	}
	//burnt
	else if (timeline_position >= 540) {
		scr_extract_recipe(1);
	}
}

//pot inventory
if collision_circle(x, y, pot_radius, oPlayer, false, true) {
	if (oPlayerInput.key_interact and held == false) {
		held = true;	
	}
	//oPlayerInventory.show_inventory = true // show the player's inventory
	if (ds_list_size(item_list) < 3) { // if we click an item and the pot isnt full
		var ingr = global.inventory[# 0, oPlayerInventory.selected_slot] // get the inventory item selected
		if oPlayerInventory.selected_slot != -1 and ingr != 0 {
			if object_get_parent(ingr[0]) == oIngredient and ingr[7] { // only add ingredients to pots
				if oCursor.sprite_index != sPotDropCursor {
					oCursor.sprite_index = sPotDropCursor 
				}
				if mouse_check_button_pressed(mb_left) {
					var inst = instance_create_layer(oIngredientHolder.x, oIngredientHolder.y, "Objects", ingr[0]) // create item in world
					inst.prepared = ingr[7]
			
					add_to_pot(inst)
			
					global.inventory[# 1,  oPlayerInventory.selected_slot] -= 1 // decrement item by one
					if global.inventory[# 1, oPlayerInventory.selected_slot] == 0 { // destroy item if it was the last one
						global.inventory[# 0, oPlayerInventory.selected_slot] = 0
						//oPlayerInventory.pickup_slot = -1
					}
				}
			} else {
				if oCursor.sprite_index == sPotDropCursor {
					oCursor.sprite_index = sPointerCursor 
				}
			}
		}
	}
} else {
	if oCursor.sprite_index == sPotDropCursor {
		oCursor.sprite_index = sPointerCursor 
	}
}

vesselList = ds_list_create()
vesselRadius = collision_circle_list(x, y, pot_radius, oIngredient, false, true, vesselList, true)

if vesselRadius > 0 and vesselList[| 0].prepared {
	//if item is not held and pot is not full
	if (ds_list_size(item_list) < 3) { // if the item is currently being thrown, then it will be added to the pot
		add_to_pot(vesselList[| 0])
	}
}

if (ds_list_size(item_list) >= 3 && currentlyCooking == false) {	
	//set list of ingredients for script
	currentlyCooking = true;
	ing1 = ds_list_find_value(item_list, 0);
	ing2 = ds_list_find_value(item_list, 1);
	ing3 = ds_list_find_value(item_list, 2);
	//run timeline
	timeline_index = tl_cooking;
	timeline_position = 0;
	timeline_running = true;
	timeline_loop = false;
}
//oPlayerInventory.lineToggle = true;
if (held == true) {
	lineToggle = true;
	phy_position_x = oPlayer.x;
	phy_position_y = oPlayer.y - ((oPlayer.sprite_height + sprite_height) / 2);
	physics_world_gravity(0, 0);
	phy_linear_velocity_y = 0;
	phy_linear_velocity_x = 0;
}
if (oPlayerInput.key_throw && held == true) {
	lineToggle = false;
	oPlayer.image_index = 0
	oPlayer.sprite_index = sPlayerThrow
	oPlayer.player_dir = sign(oPlayer.x - mouse_x) // sets the player's direction to the direction they are throwing during the animation
	throw_object(self, mouse_x, mouse_y, throw_speed)	
	held = false;
	phy_fixed_rotation = true;
	phy_angular_velocity = 0;
	physics_world_gravity(0, gravity_loc)
}
phy_rotation = 0;
ds_list_destroy(vesselList)