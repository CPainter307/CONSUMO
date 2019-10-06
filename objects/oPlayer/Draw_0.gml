draw_self()
//draw_set_alpha(.5)
//draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
draw_set_alpha(1)

	if (oPlayer.facingRight) {
		held_x = oPlayer.x + 50;
		held_y = oPlayer.y + 25;

	}
	else {
		held_x = oPlayer.x - 10;
		held_y = oPlayer.y + 35;
	}
if (!(held_item == pointer_null) && !(oPlayerInventory.pickup_slot == -1)) {
	draw_sprite_ext(held_item, 0, held_x, held_y, 0.5, 0.5, 0, c_white, 1)
}


	
