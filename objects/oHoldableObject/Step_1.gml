//cancel gravity if thrown
if apply_gravity {
	physics_apply_force(phy_position_x,phy_position_y,0,phy_mass*mass)
}

if !apply_gravity {
	if alarm_get(0) <= 0 {
		apply_gravity = true	
	}
	
}

if place_meeting(phy_position_x, phy_position_y, oWall) {
	//----------------------------------UNCOMMENT FOR LANDING SOUNDS
	//if play_hit_sound {
	//	if object_index == oIngredient and !beingCooked {
	//		scr_pitchshift_sound(landSound, 4, false)
	//	}
	//	if object_index != oIngredient {
	//		scr_pitchshift_sound(landSound, 4, false)
	//	}
	//	play_hit_sound = false
	//}
	apply_gravity = true
//} else {
//	play_hit_sound = true
}