 event_inherited()
Class = "Adventurer"

gamepad_set_axis_deadzone(0, 0.35)
physics_world_update_speed(120)
facingRight = true;
isLocked = false;
state = scr_move_state;
global.canMove = true;

em = part_emitter_create(global.ps);
part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);

hsp = 0;
vsp = 0;
jumpspeed = 10;

held_items = [noone, noone, noone];
held_x = 0;
held_y = -45;
pickupRadius = 0
itemRadiusList = noone
pickupRadiusSize = 80
up_slope = false;
down_slope = false;

#macro MAX_JOG_SPEED  6
#macro MAX_SPRINT_SPEED 11
#macro SPRINT_ACCELERATION  .3
#macro JOG_ACCELERATION  .5
#macro DECCELRATION .07
#macro DECCEL_CUTOFF 1
#macro GRAVITY .7
#macro FALL_GRAVITY .9
#macro PEAK_SPEED 15
#macro JUMP_FALLOFF_SPEED .5
#macro JUMP_SPEED 14
#macro SPRINT_AIR_ACCELERATION .40
#macro JOG_AIR_ACCELERATION .25
#macro JUMP_BUFFER_LENGTH 10
#macro SKID_TIME 60
#macro JUMP_TIME 8
#macro DASH_BUFFER_LENGTH 20
#macro MAX_FALL_SPEED 30


has_jumped = false
dash_lock = false
dash_incrementer = 0;
dash_check = 10; // 15
dash_check_diag = 10; // 15
dash_speed = 25; // 20
dash_speed_diag = dash_speed/(sqrt(2));
post_dash_speed = 15; // 10
post_dash_speed_diag = 15; // 10
has_heavy_thrown = false;

MAX_SPEED = 0
ACCELERATION = 0
AIR_ACCELERATION = 0;

motionx = 0
motiony = 0
at_max_speed = false

coyote_buffer = 0
jump_buffer = 0

on_floor = true
jump_time = 0

player_dir = 1

hand_x = x;
hand_y = y;

battleWindow = instance_create_depth(100, 100, -y, oBattlePortrait)
battleWindow.owner = self
battleWindow.portrait = sChefPortraitBattle

battleWindow.y = window_get_height()-95
battleWindow.scale_down = 3

baseAttack = 10
baseDefense = 10
baseSpeed = 10

attackMultiplier = 1
defenseMultiplier = 1
speedMultiplier = 1

attackTimer = 0
defenseTimer = 0
speedTimer = 0

currentHealth = 100
maxHealth = currentHealth

is_vulnerable = true

I_FRAME_LENGTH = 120
i_frames = I_FRAME_LENGTH

//for drawing text over the nearest item
nearest_item_x = 0
nearest_item_y = 0 
nearest_item_text = ""

dash_cd = 0
max_dash_cd = 30

in_air = false

KNOCKBACK_AMOUNT_X = 20
KNOCKBACK_AMOUNT_Y = 10

//sound effect values
step1 = false;
step2 = false;

//charles particle testing
auraEmitter = part_emitter_create(oPS);