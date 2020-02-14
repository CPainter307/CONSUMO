mask_index = sPlatform	
if (place_meeting(x, y + 2, oPlayer)  || oPlayerInput.key_down || place_meeting(x, y, oPlayer)  ){//|| oPlayer.motiony < 0) {
	mask_index = -1	
} else {
	mask_index = sPlatform	
}