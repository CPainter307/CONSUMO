//give the player objects


//left hand pickup
if (oPlayerInput.key_left_hand) {
	if (oPlayerPickUpRadius.itemInLeftHand == noone) {
		var  newItem = instance_create_layer(x, y, "Objects", itemType);
		newItem.image_xscale = 0.5;
		newItem.image_yscale = 0.5;
		newItem.followingL = true;
		oPlayerPickUpRadius.itemInLeftHand = newItem;
		newItem = noone;
	}
}

//right hand pickup
if (oPlayerInput.key_right_hand) {
	if (oPlayerPickUpRadius.itemInRightHand == noone) {
		var  newItem = instance_create_layer(x, y, "Objects", itemType);
		newItem.image_xscale = 0.5;
		newItem.image_yscale = 0.5;
		newItem.followingR = true;
		oPlayerPickUpRadius.itemInRightHand = newItem;
		newItem = noone;
	}	
}