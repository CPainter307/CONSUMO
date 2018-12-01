/// @description What happens when we try to pick up a holdable object
// still trying to make a way to highlight objects - currently running into infinite loops

//creates a list of all holdable objects the player's radius is colliding with
var itemList = ds_list_create();
var proxList = collision_circle_list(x, y, 64, oHoldableObject, true, true, itemList, true);
var ID;

//indentifies the closest item that is not beind held and sets ID to that
for (var i = 0; i < ds_list_size(itemList); i++) {
	if (!ds_list_find_value(itemList, i).followingR && 
	!ds_list_find_value(itemList, i).followingL) {
		ID = ds_list_find_value(itemList, i);
		weCanPickUp = true;
	break;
	}
}

//if there is an item we can pick up
if (weCanPickUp) {
	//left hand pick up
	if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
		// if player isn't holding something in left hand, get picked up
		if (oPlayer.holdingL == false) {
				ID.followingL = true;
				ID.highlighted = false;
				itemInLeftHand = ID; //now we know what's in our left hand
				oPlayer.holdingL = true; //not sure if this is the best place to put this yet
				weCanPickUp = false; //prevents empty right hand crash
		}
	}
	//right hand pick up
	if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
		//if player isn't holding something in right hand, get picked up
		if (oPlayer.holdingR == false) {
				ID.followingR = true;
				ID.highlighted = false;
				itemInRightHand = ID; //now we know what's in our right hand
				oPlayer.holdingR = true; //not sure if this is the best place to put this yet
				weCanPickUp = false; //prevents empty left hand crash
		}
	}
}

