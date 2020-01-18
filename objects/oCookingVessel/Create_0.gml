item_list = ds_list_create();
steam = noone;
ing1 = noone;
ing2 = noone;
ing3 = noone;
lineToggle = false;
vesselHp = 0;
vesselAttack = 0;
vesselDefense = 0;
vesselSpeed = 0;

currentlyCooking = false;

drawText = false;
textDisappearTimer = 0;

mealType = "";
mealType2 = "";
mealType3 = "";

shaderBuff = 0

pot_radius = 80
throw_speed = 1000;
gravity_loc = 150;
meter_per_pix =  0.1
update_speed = 120
grav = gravity_loc; // meter/sec^2
grav = grav / meter_per_pix   //  pix/sec^2
grav = grav /  sqr(update_speed)

held = false;

pickUpSound = snd_pickup_generic;
landSound = snd_object_land;

var fix;

fix = physics_fixture_create()
physics_fixture_set_circle_shape(fix, 8)
physics_fixture_set_linear_damping(fix, 0)
physics_fixture_set_angular_damping(fix, 100000)
physics_fixture_set_friction(fix, 0.5)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)

phy_active = true
phy_fixed_rotation = true;

physics_world_gravity(0, gravity_loc)
apply_gravity = true

mass = 270

play_hit_sound = true

outline_init()