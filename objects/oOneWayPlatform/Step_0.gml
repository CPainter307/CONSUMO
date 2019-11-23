if ((ceil(oPlayer.y + (oPlayer.sprite_height/2) - 5) > y)  || oPlayerInput.key_down || place_meeting(x, y, oPlayer) ){//|| oPlayer.motiony < 0) {
	mask_index = -1	
} else {
	mask_index = sPlatform	
}