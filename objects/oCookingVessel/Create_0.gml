event_inherited()

item_grid = ds_grid_create(9, 3);
ds_grid_clear(item_grid, noone);

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
onFire = false;
pot_radius = 50
throw_speed = 1000;
gravity_loc = 150;
meter_per_pix =  0.1
update_speed = 120
grav = gravity_loc; // meter/sec^2
grav = grav / meter_per_pix   //  pix/sec^2
grav = grav /  sqr(update_speed)

held = false;
x_offset = 0;
y_offset = 0;

pickUpSound = snd_pickup_generic;
landSound = snd_object_land;

steam = instance_create_layer(x, y-oPot.sprite_height, "Objects", oSteam);

fix = physics_fixture_create()
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix, 7, 23);
physics_fixture_add_point(fix, 10, 12);
physics_fixture_add_point(fix, 20, 12);
physics_fixture_add_point(fix, 25, 23);
physics_fixture_add_point(fix, 22, 32);
physics_fixture_add_point(fix, 9, 32);
physics_fixture_set_linear_damping(fix, 0)
physics_fixture_set_angular_damping(fix, 1000000)
physics_fixture_set_friction(fix, .4)
physics_fixture_set_density(fix, 0.5);
physics_fixture_set_sensor(fix, false)
my_fix = physics_fixture_bind(fix, self)

apply_gravity = true

physics_world_gravity(0, gravity_loc)

mass = 270

play_hit_sound = true

//naming variables
all_different = false;
two_same01 = false;
two_same02 = false;
two_same12 = false;
all_same = false;


//for rotation
overtipped = false

//new pick up timer
//pick_up_timer = 0
//pick_up_timer_max = 20
cooking_progress = 0
//phy_fixed_rotation = true


outline_init()
name = ""