#region dash lock

if (dash_lock == true) {
	dash_incrementer++;
	if (dash_incrementer >= dash_check || on_floor) {
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
}

if (on_floor) {
	has_heavy_thrown = false;
}

#endregion

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

//this lets us pick up items if click on them in the world
if pickupRadius > 0 and !oPlayerInventory.show_inventory{
	for (var i = 0; i < pickupRadius; i++;) {
		var nearest_item = itemRadiusList[| i]
		if oCursor.sprite_index != sPointerCursor {
			oCursor.sprite_index = sPointerCursor
		}
		if !collision_point(mouse_x, mouse_y, nearest_item, true, false) {
			continue;
		}
		if oCursor.sprite_index != sGrabCursor {
			oCursor.sprite_index = sGrabCursor
		}
		if mouse_check_button_pressed(mb_left) {
			add_to_inventory(nearest_item)
		}
		break
	}
}


// if we press pickup and we are colliding with some holdable objects, then add the nearest one to our inventory
if oPlayerInput.key_interact {
	if pickupRadius > 0 {
		var nearest_item = itemRadiusList[| 0]
		add_to_inventory(nearest_item) 
	}
}
ds_list_destroy(itemRadiusList)
#endregion

#region hand tracking

script_execute(scr_hand_track());

#endregion