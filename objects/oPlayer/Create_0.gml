gamepad_set_axis_deadzone(0, 0.35)

hsp = 0;
hsp_dir = 1;
vsp_dir = 1;
vsp = 0;
grv = .5;
walksp = 8;
buff = 0.3;
jumpQueuFramesElapsed = 10;
totalJumps = 1;
currentJumps = 0;
spriteTurnFrames = 0;
facingRight = true;
framesInAir = 0;
isLocked = false;
state = scr_move_state;
moveStateExecuted = true;
peakReached = false;

em = part_emitter_create(global.ps);
part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);


/*
grav = 7;
v0 = 0;
height = 50;
velx = 0;
xmid = 15;
isJumping = true;