 //--------------PICKUP RADIUS DEBUG
//draw_set_alpha(.5)
//draw_circle_color(x, y, pickupRadiusSize, c_aqua, c_aqua, false)
//draw_set_alpha(1)

//scale battle portrait
battleWindow.scale_down = oDisplayManager.scale_factor

//draws the player
draw_sprite_ext(sprite_index, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha)

//draw the current item into the player's hand (unless they're throwing)
if (sprite_index != sPlayerThrow and sprite_index != sPlayerPickup) {
	for(var i = 0; i < 3; i++) {
		if held_items[i] != noone {
			draw_throw_line()
			if array_get(held_items[i], 0) == oRecipe {
				draw_sprite_ext(array_get(held_items[i] , 8), 0, x + (-20 * sign(oPlayer.player_dir)) + x_offset, y + 2 + y_offset, (player_dir), 1, 0, c_white, image_alpha)
				draw_sprite_ext(array_get(held_items[i] , 9), 0, x + (-20 * sign(oPlayer.player_dir)) + x_offset, y + 2 + y_offset, (player_dir), 1, 0, c_white, image_alpha)
				draw_sprite_ext(array_get(held_items[i] , 10), 0, x + (-20 * sign(oPlayer.player_dir)) + x_offset, y + 2 + y_offset, (player_dir), 1, 0, c_white, image_alpha)
			} else {
				draw_sprite_ext(array_get(held_items[i] , 1), 0, hand_x, hand_y - (i * 35), (player_dir), 1, 0, c_white, image_alpha)
			}
		}
	}
}

//draw the arms over the player if they're holding something big
if (sprite_index == sPlayerIdleHoldingBig) {
	draw_sprite_ext(sBigHoldingArmIdle, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
}

if (sprite_index == sPlayerRunHoldingBig) {
	draw_sprite_ext(sBigHoldingArmRun, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
}

if (sprite_index == sPlayerJumpHoldingBig) {
	draw_sprite_ext(sBigHoldingArmJump, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);		
}

if (sprite_index == sPlayerFallHoldingBig or sprite_index == sPlayerHurtHoldingBig) {
	draw_sprite_ext(sBigHoldingArmFall, image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
}


////draw the arm over the player so that there is a layered arm when holding one item (OLD)
//if (sprite_index == sPlayerIdle && held_item != noone && oPlayerInventory.pickup_slot != -1) {
//	draw_sprite_ext(sLeftArmIdle,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);
//}

//if (sprite_index == sPlayerRun && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
//	draw_sprite_ext(sLeftArmRun,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);
//}

//if (sprite_index == sPlayerJump && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
//	draw_sprite_ext(sLeftArmJump,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
//}

//if (sprite_index == sPlayerFall && held_item != pointer_null && oPlayerInventory.pickup_slot != -1) {
//	draw_sprite_ext(sLeftArmFall,image_index, x, y, player_dir, 1, image_angle, c_white, image_alpha);	
//}

//---------------------------- UNCOMMENT FOR draw nearest item text
draw_set_font(fBattleTextThick)
if nearest_item_text != ""
	draw_text_outlined(nearest_item_x-5, nearest_item_y+12, BROWN_COL, OFFWHITE_COL, nearest_item_text)