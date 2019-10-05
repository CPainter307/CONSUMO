draw_self()
/*draw_set_alpha(.5)
draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
draw_set_alpha(1)

	if (oPlayer.facingRight) {
		if (instance_exists(oFrontArm)) depth = oFrontArm.depth + 1;
		held_x = oFrontArm.x + 50;
		held_y = oFrontArm.y + 25;

	}
	else {
		if (instance_exists(oFrontArm)) depth = oFrontArm.depth + 1;
		held_x = oFrontArm.x - 10;
		held_y = oFrontArm.y + 35;
	}
if (!(held_item == pointer_null) && !(oPlayerInventory.pickup_slot == -1)) {
	draw_sprite_ext(held_item, 0, held_x, held_y, 0.5, 0.5, 0, c_white, 1)
}


	
