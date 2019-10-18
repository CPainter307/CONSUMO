gamepad_set_axis_deadzone(0, 0.35)

facingRight = true;
isLocked = false;
state = scr_move_state;
global.canMove = true;

em = part_emitter_create(global.ps);
part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);

hsp = 0;
vsp = 0;
jumpspeed = 10;

held_item = pointer_null;
held_x = 0;
held_y = 0;
pickupRadius = 0
itemRadiusList = noone
pickupRadiusSize = 80


#macro MAX_JOG_SPEED  6
#macro MAX_SPRINT_SPEED 11
#macro SPRINT_ACCELERATION  .3
#macro JOG_ACCELERATION  .5
#macro DECCELRATION .07
#macro DECCEL_CUTOFF 1
#macro GRAVITY .7
#macro FALL_GRAVITY 1
#macro PEAK_SPEED 15
#macro JUMP_FALLOFF_SPEED .5
#macro JUMP_SPEED 10
#macro SPRINT_AIR_ACCELERATION .40
#macro JOG_AIR_ACCELERATION .25
#macro JUMP_BUFFER_LENGTH 6
#macro SKID_TIME 60
#macro JUMP_TIME 13
#macro DASH_BUFFER_LENGTH 20

window_set_size(1920, 1080)

has_jumped = true

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

s_index = sPlayerIdle
player_dir = 1

hand_x = x;
hand_y = y;