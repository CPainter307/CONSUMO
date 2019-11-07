/// @description Initializes variables all holdable objects will have.
name = ""
followingL = false;
followingR = false;
highlighted = false;
playedPickupSound = false;
objDepth = depth;
placed = false;
collision_type = "circle";

image_xscale = .5
image_yscale = .5

pickUpSound = snd_pickup_generic;

var fix;
fix = physics_fixture_create()
physics_fixture_set_circle_shape(fix, 8)
physics_fixture_set_linear_damping(fix, 0.2)
physics_fixture_set_angular_damping(fix, 1)
physics_fixture_set_friction(fix, 1)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)
phy_active = true 

apply_gravity = true

mass = 1620 //originally 270