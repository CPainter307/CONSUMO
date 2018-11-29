/// @description What happens when we try to pick up a holdable object

var itemList = ds_list_create();
var proxList = collision_circle_list(x, y, 64, oHoldableObject, true, true, itemList, true);
var ID;

for (var i = 0; i < ds_list_size(itemList); i++) {
	if (!ds_list_find_value(itemList, i).followingR && 
	!ds_list_find_value(itemList, i).followingL) {
		ID = ds_list_find_value(itemList, i);
		weCanPickUp = true;
		break;
	}
}

if (weCanPickUp) {
if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)) {
	// if player isn't holding something in left hand, get picked up
	if (oPlayer.holdingL == false) {
			ID.followingL = true;
			oPlayer.holdingL = true; //not sure if this is the best place to put this yet
		
	}
	
}


if (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderr)) {
	//if player isn't holding something in right hand, get picked up
	if (oPlayer.holdingR == false) {
			ID.followingR = true;
			oPlayer.holdingR = true; //not sure if this is the best place to put this yet
	}
}
}

