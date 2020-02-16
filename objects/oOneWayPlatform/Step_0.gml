mask_index = sPlatform	
if round(oPlayer.y + (sprite_get_height(sPlayer)/2) - 5) > y  || oPlayerInput.key_down {//|| oPlayer.motiony < 0) {
	mask_index = -1	
}

//phy_active = true

if instance_exists(oHoldableObject) {
	for (var i = 0; i < instance_number(oHoldableObject); i++) {
		var inst = instance_find(oHoldableObject, i)
		if round(inst.y + (sprite_get_height(inst.sprite_index)/2) - 5) > y {
			//phy_active = false
		}
	}
}
