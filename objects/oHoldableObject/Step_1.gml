//cancel gravity if thrown
if apply_gravity {
	//phy_speed_y += grav
}

if !apply_gravity {
	if alarm_get(0) <= 0 {
		apply_gravity = true	
	}
	
}

if place_meeting(phy_position_x, phy_position_y, oWall) {
	apply_gravity = true
	//----------------------------------UNCOMMENT FOR LANDING SOUNDS
//	if play_hit_sound {
//		if object_index == oIngredient and !beingCooked {
//			scr_pitchshift_sound(landSound, 4, false)
//		}
//		if object_index != oIngredient {
//			scr_pitchshift_sound(landSound, 4, false)
//		}
//		play_hit_sound = false
//	}
	
//} else {
//	play_hit_sound = true
}