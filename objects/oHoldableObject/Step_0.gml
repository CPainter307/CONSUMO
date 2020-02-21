/// @description Here's what your average pickupabble item will do every frame.

//removes highlight if no longer in range of player 
if oPlayer.pickupRadius <= 0 { 
	highlighted = false	 
}

//play sound
scr_play_pickup_sound(pickUpSound);

//collision with one way platforms
var plat = collision_circle(x, y, 50, oOneWayPlatform, false, true)
var wall = collision_circle(x, y, 50, oWall, false, true)

if plat and !wall { // we're near the platform
	physics_remove_fixture(self, my_fix)
	physics_fixture_set_sensor(fix, false)
	if floor(y + (sprite_get_height(sprite_index)/2) - 20) > plat.y { // we're right below the platform
		physics_fixture_set_sensor(fix, true)
	}
	my_fix = physics_fixture_bind(fix, self)
} else {
	physics_remove_fixture(self, my_fix)
	physics_fixture_set_sensor(fix, false)
	my_fix = physics_fixture_bind(fix, self)
}
