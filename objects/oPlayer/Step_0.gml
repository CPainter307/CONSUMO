 #region dash lock

if (dash_lock == true) {
	var dash = instance_create_layer(x, y, "Objects", oDashEffect)
	dash.sprite_index = sprite_index
	dash.image_index = image_index
	dash.image_xscale = player_dir
	dash_incrementer++;
	if !in_air and !on_floor {
		in_air = true
	}
	if (dash_incrementer >= dash_check) {
		dash_lock = false;
		dash_incrementer = 0;
		//horizontal
		if (motionx > 0) {	//right
			motionx = post_dash_speed;
		}
		else if (motionx < 0) {	//left
			motionx = -post_dash_speed;
		}
		else {	//none
			motionx = 0;
		}
		//vertical
		if (motiony < 0) {	//up
			motiony = -post_dash_speed;
		}
		else if (motiony > 0) {	//down
			motiony = post_dash_speed;
		}
		else {	//none
			motiony = 0;
		}
	}
} else {
	//in_air = false	
}

if (on_floor) and in_air {
	has_heavy_thrown = false;
	in_air = false
} else if (on_floor) and !in_air {
	if dash_cd >= max_dash_cd {
		has_heavy_thrown = false
		dash_cd = 0
	} else {
		dash_cd++	
	}
}

#endregion

#region picking up


part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);
script_execute(state);

itemRadiusList = ds_list_create()
pickupRadius = collision_circle_list(x, y, pickupRadiusSize , oHoldableObject, false, true, itemRadiusList, true)

//highlighting items
if pickupRadius > 0 {
	nearest_item_text = ""
	for (var i = 0; i < itemRadiusList[| i]; i++) {
		itemRadiusList[| i].highlighted = false
	}
	itemRadiusList[| 0].highlighted = true
	nearest_item_text = itemRadiusList[| 0].name
	nearest_item_x = itemRadiusList[| 0].x
	nearest_item_y = itemRadiusList[| 0].y
} else {
	for (var i = 0; i < itemRadiusList[| i]; i++) {
		itemRadiusList[| i].highlighted = false
	}
	nearest_item_text = ""
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

//this lets us pick up items if click on them in the world
if pickupRadius > 0 {
	for (var i = 0; i < pickupRadius; i++;) {
		var nearest_item = itemRadiusList[| i]
		if oCursor.sprite_index != sPointerCursor {
			oCursor.sprite_index = sPointerCursor
		}
		if !collision_circle(mouse_x, mouse_y, 8, nearest_item, false, false) {
			continue;
		}
		nearest_item.highlighted = true
		if oCursor.sprite_index != sGrabCursor {
			oCursor.sprite_index = sGrabCursor
		}
		if mouse_check_button_pressed(mb_left) {
			//add_to_inventory(nearest_item)
		}
		break
	}
}

// if we press pickup and we are colliding with some holdable objects, then add the nearest one to our held items
if oPlayerInput.key_heavy_throw and !holding_big_item and !are_hands_full() {
	if pickupRadius > 0 {
		var nearest_item = itemRadiusList[| 0]
		var holding_recipe = false
		if nearest_item.object_index == oRecipe {
			for (var i = 0; i < 3; i++) {
				if held_items[i] != noone {
					if held_items[i].object_index == oRecipe {
						holding_recipe = true
					}
				}
			}
			if !holding_recipe and !is_holding_items() {
				add_to_inventory(nearest_item)
				holding_big_item = true
			}
		} else {
			add_to_inventory(nearest_item)
		}
	}
}
ds_list_destroy(itemRadiusList)
#endregion

if oPlayerInput.key_throw {
	for (var i = 0; i < 3; i++) {
		if held_items[i] != noone {
			holding_big_item = false
			var inst = instance_create_layer(oPlayer.x, oPlayer.y  - (i * 30), "Objects", array_get(held_items[i], 0));
			//assign values back to recipe
			if (inst.object_index == oRecipe) {
				inst.name = array_get(held_items[i], 2);
				inst.hp = array_get(held_items[i], 3);
				inst.attack = array_get(held_items[i], 4);
				inst.defense = array_get(held_items[i], 5);
				inst.spd = array_get(held_items[i], 6);
				inst.ing = array_get(held_items[i], 7);
				inst.bowl_sprite = array_get(held_items[i], 8);
				inst.broth_sprite = array_get(held_items[i], 9);
				inst.topping_sprite = array_get(held_items[i], 10);
			}
			throw_object(inst, mouse_x, mouse_y, inst.throw_speed)
			held_items[i] = noone;
		}
	}
}

#region hand tracking

hand_x = x;
hand_y = y-60;

//script_execute(scr_hand_track());

#endregion

//eating ---------------------------------------------- COMMENTED OUT FOR NOW BECAUSE NEW INVENTORY
//var inv_grid = global.inventory
//if keyboard_check_pressed(ord("F")) {
//	if oPlayerInventory.pickup_slot != -1 {
//		var _item = inv_grid[# 0, oPlayerInventory.pickup_slot]
//		if _item != 0 and _item[0] == oRecipe {
//			inv_grid[# 1, oPlayerInventory.pickup_slot] -= 1 // decrement by 1
//			if inv_grid[# 1, oPlayerInventory.pickup_slot] == 0 { // destroy recipe if it was the last one
//				inv_grid[# 0, oPlayerInventory.pickup_slot] = 0
//				oPlayerInventory.pickup_slot = -1
//			}
//			currentHealth = min(maxHealth, currentHealth+_item[3])
//			attackTimer = _item[4] * 60
//			defenseTimer = _item[5] * 60
//			speedTimer = _item[6] * 60
		
//			battleWindow.cur_atk = attackTimer
//			battleWindow.max_atk = attackTimer

//			battleWindow.cur_def = defenseTimer
//			battleWindow.max_def = defenseTimer

//			battleWindow.cur_spd = speedTimer
//			battleWindow.max_spd = speedTimer
//		}
//	}
//}

battleWindow.cur_health = lerp(battleWindow.cur_health, (currentHealth/maxHealth)*100, 0.3)
if attackTimer > 0 {
	attackTimer--
	battleWindow.cur_atk = lerp(battleWindow.cur_atk, attackTimer, 0.3)
}
if defenseTimer > 0 {
	defenseTimer--
	battleWindow.cur_def = lerp(battleWindow.cur_def, defenseTimer, 0.3)
	defenseMultiplier=2
} else {
	defenseMultiplier=1
}
if speedTimer > 0 {
	var dash = instance_create_layer(x, y, "Objects", oDashEffect)
	dash.sprite_index = sprite_index
	dash.image_index = image_index
	dash.image_xscale = player_dir
	speedTimer--
	battleWindow.cur_spd = lerp(battleWindow.cur_spd, speedTimer, 0.3)
	speedMultiplier=1.5
} else {
	speedMultiplier=1	
} 


//i frames
if place_meeting(x, y, Hitbox) and is_vulnerable {
	_hitbox = instance_place(x, y, Hitbox)
	is_vulnerable = false
	i_frames = I_FRAME_LENGTH
	motionx = 0
	motiony = 0
	if instance_exists(_hitbox) {
		motionx = (sign(_hitbox.x - oPlayer.x)*-1) * KNOCKBACK_AMOUNT_X
		motiony = -KNOCKBACK_AMOUNT_Y
	}
}
if !is_vulnerable {
	image_alpha = .5
	if (i_frames = I_FRAME_LENGTH) {
		audio_play_sound(snd_player_hurt, 1, 0)
	}
	i_frames--
	if i_frames > I_FRAME_LENGTH-30 {
		sprite_index = sPlayerHurt
		for(var i = 0; i < 3; i++) {
			if held_items[i] != noone {
				sprite_index = sPlayerHurtHolding
			}
		}
		if holding_big_item sprite_index = sPlayerHurtHoldingBig
		if instance_exists(_hitbox) {
			player_dir = sign(oPlayer.x-_hitbox.x)
		}
	}
}
if i_frames <= 0 {
	image_alpha = 1
	is_vulnerable = true
}

//player sounds
script_execute(scr_movement_sounds());
