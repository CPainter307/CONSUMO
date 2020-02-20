//sprite control
if (on_floor or up_slope or down_slope) {
	if (motionx != 0 or up_slope or down_slope) and (sprite_index != sPlayerThrow) and (sprite_index != sPlayerPickup) and global.canMove {
		sprite_index = sPlayerRun;
		for(var i = 0; i < 3; i++) {
			if held_items[i] != noone {
				sprite_index = sPlayerRunHolding;
			} 
		}
		if holding_big_item sprite_index =  sPlayerRunHoldingBig;
	} else if sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerIdle;
		for(var i = 0; i < 3; i++) {
			if held_items[i] != noone {
				sprite_index = sPlayerIdleHolding;
			} 
		}
		if holding_big_item sprite_index = sPlayerIdleHoldingBig;
	}
	
	if (oPlayerInput.key_sprint_held) {
		image_speed = 1.2
	} else {
		image_speed = 1;
	}
} else {
	if (motiony > 0) and sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerFall;
		for(var i = 0; i < 3; i++) {
			if held_items[i] != noone {
				sprite_index = sPlayerFallHolding;
			}
		}
		if holding_big_item sprite_index = sPlayerFallHoldingBig;
	} else if motiony <= 0 and sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerJump;
		for(var i = 0; i < 3; i++) {
			if held_items[i] != noone {
				sprite_index = sPlayerJumpHolding;
			}
		}
		if holding_big_item sprite_index = sPlayerJumpHoldingBig;
	}
}

if (motionx > 0) and sprite_index != sPlayerThrow and (sprite_index != sPlayerHurt or sprite_index != sPlayerHurtHolding or sprite_index != sPlayerHurtHoldingBig) {
	player_dir = -1;
} else if (motionx < 0) and sprite_index != sPlayerThrow and (sprite_index != sPlayerHurt or sprite_index != sPlayerHurtHolding or sprite_index != sPlayerHurtHoldingBig) {
	player_dir = 1;
}