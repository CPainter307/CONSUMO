  event_inherited();
Class = "Adventurer";

//maxHealth = 200;
maxHealth = 100;
currentHealth = maxHealth;

baseAttack = 20;
baseDefense = 15;
baseSpeed = 20;

maxattack = 60;
maxdefense = 45;

healthMultiplier = 1;
attackMultiplier = 1;
defenseMultiplier = 1;
speedMultiplier = 1;

move_1 = [360, 20];
move_2 = [60, 5];

timer_m1 = 0;
timer_m2 = 0;

attackSprite = sRogueAttacking;
idleSprite = sRogueIdle;

instance_create_depth(x, y, -y, oOffscreenPointer)

facingRight = true;
global.canMove = true;

hsp = 0;
vsp = 0;
jumpspeed = 10;

has_jumped = false

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

in_air = false
dash_cd = 0
max_dash_cd = 30
dash_lock = false
dash_incrementer = 0;
dash_check = 10; // 15
dash_check_diag = 10; // 15
dash_speed = 25; // 20
dash_speed_diag = dash_speed/(sqrt(2));
post_dash_speed = 15; // 10
post_dash_speed_diag = 15; // 10
has_heavy_thrown = false;

// we need this because platforms are really funky, and need a specific position to work for some reason
platform_offset = 13
default_sprite = sprite_index

/// initialize variables in order to draw grid and the path
ds_gridpathfinding = noone ;
path_building = noone ;

/// Initialize variables for ennemy movement
max_speed = 4;
game_gravity = 1;
acceleration = 0.3;
game_friction = 0.1;
jump_height = -10;
speed_v = 0 ;
speed_h = 0 ;

/// Intialialize variables for follow the path
action = 0 ;
path_point = 0 ;
jump_action = 0 ;