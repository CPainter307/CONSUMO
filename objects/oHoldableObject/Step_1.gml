//cancel gravity if thrown
if apply_gravity {
	physics_apply_local_force(phy_position_x,phy_position_y,0,phy_mass*mass*10)
}
//else {
//	physics_apply_force(phy_position_x,phy_position_y,0,-phy_mass*mass);
//}

//if !apply_gravity {
//	if alarm_get(0) <= 0 {
//		apply_gravity = true	
//	}
	
//}

if place_meeting(phy_position_x, phy_position_y, oWall) {
	apply_gravity = true
}