gamepad_set_axis_deadzone(0, 0.35)

facingRight = true;
isLocked = false;
state = scr_move_state;
global.canMove = true;

em = part_emitter_create(global.ps);
part_emitter_region(global.ps, em, x-42.5, x+42.5, y+60, y+70, ps_shape_ellipse, ps_distr_gaussian);

grav = .4;
hsp = 0;
vsp = 0;
jumpspeed = 10;
movespeed = 7;
canjump = 0;
groundjumpbuffer = 0;
landed = false;

pickupRadius = noone
pickupRadiusSize = 80

previous_item = noone