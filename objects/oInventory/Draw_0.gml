if (showInv) {
	var invx, invy;
	//invx = (view_xport[0] + view_wport[0] * .5) - 326
	//invy = (view_yport[0] + view_hport[0] * .5) - 358

	invx = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2) - 326;
	invy = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2) - 358;

	var dirx = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2)
	var diry = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2)
	var _dir = point_direction(dirx, diry, mouse_x, mouse_y);
	draw_arrow(dirx, diry, mouse_x, mouse_y, 2);
	
	draw_sprite(sRadialMenu, 0, invx, invy);

	for (var i = 0; i < maxItems; i++) {
		slotSelected[i] = false;
	}
	
	if (_dir >= 60 and _dir < 120) { // slot 0
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[0], invy+slotY[0]);
		slotSelected[0] = true;
	}
	if (_dir >= 0 and _dir < 60) { // slot 1
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[1], invy+slotY[1]);
		slotSelected[1] = true;
	}
	if (_dir >= 300 and _dir < 360) { // slot 2
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[2], invy+slotY[2]);
		slotSelected[2] = true;
	}
	if (_dir >= 240 and _dir < 300) { // slot 3
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[3], invy+slotY[3]);
		slotSelected[3] = true;
	}
	if (_dir >= 180 and _dir < 240) { // slot 4
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[4], invy+slotY[4]);
		slotSelected[4] = true;
	}
	if (_dir >= 120 and _dir < 180) { // slot 5
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[5], invy+slotY[5]);
		slotSelected[5] = true;
	}
	
	for (var i = 0; i < maxItems; i++) {
		if (slotSelected[i]) {
			if (oPlayerInput.key_left_hand and instance_exists(oPlayerPickUpRadius.itemInLeftHand)) {
				var temp = oPlayerPickUpRadius.itemInLeftHand;
				oPlayerPickUpRadius.itemInLeftHand = global.inventory[i];
				global.inventory[i] = temp;
			}
			if (oPlayerInput.key_right_hand and instance_exists(oPlayerPickUpRadius.itemInRightHand)) {
				var temp = oPlayerPickUpRadius.itemInRightHand;
				oPlayerPickUpRadius.itemInRightHand = global.inventory[i];
				global.inventory[i] = temp;
			}
		}
	}
	
	for (var i = 0; i < maxItems; i++) {
		if (global.inventory[i] != noone) {
			//draw sprite corresponding to item into inventory
			draw_sprite(global.inventory[i].sprite_index, 0, invx+slotX[i], invy+slotY[i]);
		}
	}
}