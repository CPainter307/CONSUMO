//--------------PICKUP RADIUS DEBUG
//draw_set_alpha(.5)
//draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
//draw_set_alpha(1)


draw_sprite_ext(sprite_index, image_index, x, y, player_dir, 1, image_angle, c_white, 1)

//draw the current item into the player's hand
if (!(held_item == pointer_null) && !(oPlayerInventory.pickup_slot == -1)) {
	draw_sprite_ext(held_item, 0, hand_x, hand_y, (player_dir * 0.5), 0.5, 0, c_white, 1)
}
