 //--------------PICKUP RADIUS DEBUG
//draw_set_alpha(.5)
//draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
//draw_set_alpha(1)

draw_sprite_ext(sprite_index, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha)



//draw the current item into the player's hand (unless they're throwing)
if (sprite_index != sPlayerThrow and sprite_index != sPlayerPickup) {
	if (!(held_item == pointer_null) && !(oPlayerInventory.pickup_slot == -1)) {
		draw_sprite_ext(held_item, 0, hand_x, hand_y, (player_dir * 0.5), 0.5, 0, c_white, image_alpha)
	}
}

//draw the arm over the player so that there is a layered arm
if (sprite_index == sPlayerIdle && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
	draw_sprite_ext(sLeftArmIdle,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);
}

if (sprite_index == sPlayerRun && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
	draw_sprite_ext(sLeftArmRun,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);
}

if (sprite_index == sPlayerJump && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
	draw_sprite_ext(sLeftArmJump,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
}

if (sprite_index == sPlayerFall && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
	draw_sprite_ext(sLeftArmFall,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
}

//---------------------------- UNCOMMENT FOR draw nearest item text
//draw_set_font(fBattleTextThick)
//if nearest_item_text != ""
//	draw_text_outlined(nearest_item_x-5, nearest_item_y+12, BROWN_COL, OFFWHITE_COL, nearest_item_text)