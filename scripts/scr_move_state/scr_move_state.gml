if gamepad_is_connected(0) {
	xdir = gamepad_axis_value(0, gp_axislh)
	gamepad_set_axis_deadzone(0, .3)
	space_pressed = gamepad_button_check_pressed(0, gp_face1)
	space_released = gamepad_button_check_released(0, gp_face1)
} else {
	input_right = keyboard_check(ord("D"))
	input_left =  keyboard_check(ord("A"))
	xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	space_pressed = keyboard_check_pressed(vk_space)
	space_held = keyboard_check(vk_space)              
	space_released = keyboard_check_released(vk_space)
	shift_held = keyboard_check(vk_shift)
}

if keyboard_check_pressed(ord("R")) {
	room_restart()	
}


//add gravity
if motiony < 0 {
	motiony += GRAVITY
} else {
	motiony += FALL_GRAVITY	
}

//jumping with buffer
if on_floor {
    coyote_buffer = 0
    if !has_jumped and jump_buffer < JUMP_BUFFER_LENGTH {
        jump_time = JUMP_TIME
        jump_buffer = JUMP_BUFFER_LENGTH
        has_jumped = true
        motiony = -JUMP_SPEED*3
    }
}
jump_buffer++

if space_pressed {
    jump_buffer = 0
    if !has_jumped and coyote_buffer < JUMP_BUFFER_LENGTH {
        jump_time = JUMP_TIME
        coyote_buffer = JUMP_BUFFER_LENGTH
        has_jumped = true
        motiony = -JUMP_SPEED*3
    }
}
coyote_buffer++

if space_held and jump_time > 0 and has_jumped {
	sprite_index = sPlayerJump
    motiony = -JUMP_SPEED
    jump_time--
}

if space_released {
    has_jumped = false
    jump_time = 0
    if motiony < 0 {
        motiony = lerp(motiony, 0, JUMP_FALLOFF_SPEED)
    }
}


//decelerate
//
if ((!input_right and motionx > 0 ) or (!input_left and motionx < 0)) { //if try to change direction mid run, the decelleration still remains, switching directions faster.
	motionx = lerp(motionx, 0, DECCELRATION)
	if motionx < DECCEL_CUTOFF and motionx > -DECCEL_CUTOFF {
		motionx = 0	
	}
}

//moving
if on_floor {
	if input_right { // moving right
		motionx += ACCELERATION
		if motionx >= MAX_SPEED {
			motionx -= ACCELERATION
			motionx = lerp(motionx, MAX_SPEED, DECCELRATION)
			at_max_speed = true
		}
	}
	if input_left { // moving left
		motionx -= ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx -= -ACCELERATION
			motionx = lerp(motionx, -MAX_SPEED, DECCELRATION)
			at_max_speed = true
		}
	}
} else {
	if input_right { // moving right
		motionx += AIR_ACCELERATION
		if motionx >= MAX_SPEED {
			motionx -= AIR_ACCELERATION
			motionx = lerp(motionx, MAX_SPEED, DECCELRATION)
		}
	}
	if input_left { // moving left
		motionx -= AIR_ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx -= -AIR_ACCELERATION
			motionx = lerp(motionx, -MAX_SPEED, DECCELRATION)
		}
	}	
}

//sprinting
if (shift_held) {
	MAX_SPEED = MAX_SPRINT_SPEED
	ACCELERATION = SPRINT_ACCELERATION
	AIR_ACCELERATION = SPRINT_AIR_ACCELERATION
}

else {
	MAX_SPEED = MAX_JOG_SPEED
	ACCELERATION = JOG_ACCELERATION
	AIR_ACCELERATION = JOG_AIR_ACCELERATION
}


//collision
if (place_meeting(x+motionx, y, oWall)) {
	while (!place_meeting(x+sign(motionx), y, oWall)) {
		x += sign(motionx);
	}
	motionx = 0;
}
x += motionx

if (place_meeting(x, y+motiony, oWall)) {
    jump_time = 0
    if sign(motiony) > 0 {
        on_floor = true
    }
    has_jumped = false
    while (!place_meeting(x, y+sign(motiony), oWall)) {
        y += sign(motiony);
    }
    motiony = 0;
} else {
    on_floor = false
}
y += motiony

//animation (new)

//if (on_floor) {
//	if (input_right or input_left) {
//		sprite_index = sPlayerRun;
//	} else {
//		sprite_index = sPlayerIdle;
//	}
	
//	if (shift_held) {
//		image_speed = 1.2
//	} else {
//		image_speed = 1;
//	}
//}

//if (input_right) facingRight = true;
//if (input_left) facingRight = false;

//if (motiony > 0) {
//	sprite_index = sPlayerFall;
//}


//if (facingRight) {
//	image_xscale = -1;
//} else {
//	image_xscale = 1;
//}
