draw_self()
//draw_set_alpha(.5)
//draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
draw_set_alpha(1)
if (!(held_item == pointer_null) && !(oPlayerInventory.pickup_slot == -1)) {
	draw_sprite_ext(held_item, 0, oPlayer.x, oPlayer.y, 0.5, 0.5, 0, c_white, 1)
}


	
