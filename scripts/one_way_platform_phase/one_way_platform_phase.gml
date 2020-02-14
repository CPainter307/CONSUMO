if (sprite_index != -1) {
	my_sprite_index = sprite_index
}

if (y >  oOneWayPlatform.y   || place_meeting(x, y, oOneWayPlatform)  ){//|| oPlayer.motiony < 0) {
	mask_index = -1	
} else {
	mask_index = my_sprite_index	
}