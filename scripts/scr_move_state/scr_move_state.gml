if (oPlayerInput.key_room_reset) {
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
		var _dust_part = instance_create_layer(x, y+(sprite_height/2), "BGLayer", oDustParticle)
		_dust_part.sprite_index = sJumpParticle
        jump_time = JUMP_TIME
        jump_buffer = JUMP_BUFFER_LENGTH
        has_jumped = true
    }
	has_jumped = false // Jackson added in this line because we couldn't jump the first time we tried, and this is supposed to fix it. However, if we start seeing additional issues, try removing this line.
}
jump_buffer++

if oPlayerInput.key_jump {
    jump_buffer = 0
    if !has_jumped and coyote_buffer < JUMP_BUFFER_LENGTH {  
		var _dust_part = instance_create_layer(x, y+(sprite_height/2), "BGLayer", oDustParticle)
		_dust_part.sprite_index = sJumpParticle
		jump_time = JUMP_TIME
        coyote_buffer = JUMP_BUFFER_LENGTH
        has_jumped = true
    }
}
coyote_buffer++

if oPlayerInput.key_jump_held and jump_time > 0 and has_jumped {
    jump_time--
	motiony = -JUMP_SPEED
}

if oPlayerInput.key_jump_released and has_jumped {
    has_jumped = false
    motiony = lerp(motiony, 0, JUMP_FALLOFF_SPEED)
}

//decelerate
if ((!oPlayerInput.key_right and motionx > 0 ) or (!oPlayerInput.key_left and motionx < 0)) { //if try to change direction mid run, the decelleration still remains, switching directions faster.
	motionx = lerp(motionx, 0, DECCELRATION)
	if motionx < DECCEL_CUTOFF and motionx > -DECCEL_CUTOFF {
		motionx = 0	
	}
}

//moving
if on_floor {
	if oPlayerInput.key_right { // moving right
		if motionx == 0 {
			var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
			_dust_part.sprite_index = sStartRunParticle
			_dust_part.image_xscale = -1
		}
		motionx += ACCELERATION
		if motionx >= MAX_SPEED {
			motionx -= ACCELERATION
			motionx = lerp(motionx, MAX_SPEED, DECCELRATION)
			at_max_speed = true
		}
	}
	if oPlayerInput.key_left { // moving left
		if motionx == 0 {
			var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
			_dust_part.sprite_index = sStartRunParticle
			_dust_part.image_xscale = 1
		}
		motionx -= ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx -= -ACCELERATION
			motionx = lerp(motionx, -MAX_SPEED, DECCELRATION)
			at_max_speed = true
		}
	}
} else {
	if oPlayerInput.key_right { // moving right
		motionx += AIR_ACCELERATION
		if motionx >= MAX_SPEED {
			motionx -= AIR_ACCELERATION
			motionx = lerp(motionx, MAX_SPEED, DECCELRATION)
		}
	}
	if oPlayerInput.key_left { // moving left
		motionx -= AIR_ACCELERATION
		if motionx <= -MAX_SPEED {
			motionx -= -AIR_ACCELERATION
			motionx = lerp(motionx, -MAX_SPEED, DECCELRATION)
		}
	}	
}

//sprinting
if (oPlayerInput.key_sprint_held) {
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
    while (!place_meeting(x, y+sign(motiony), oWall)) {
        y += sign(motiony);
    }
	if sign(motiony) > 0 {
		if !on_floor {
			var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
			_dust_part.sprite_index = sLandParticle
		}
		on_floor = true
	}
    motiony = 0;
} else {
	on_floor = false	
}
y += motiony

//animation (new)

if (on_floor) {
	if (motionx != 0) {
		//s_index = sPlayerRun;
		sprite_index = sPlayerRun
	} else {
		//s_index = sPlayerIdle;
		sprite_index = sPlayerIdle
	}
	
	if (oPlayerInput.key_sprint_held) {
		image_speed = 1.2
	} else {
		image_speed = 1;
	}
} else {
	if (motiony > 0) {
		//s_index = sPlayerFall;
		sprite_index = sPlayerFall
	} else if motiony <= 0 {
		//s_index = sPlayerJump;
		sprite_index = sPlayerJump
	}
}

if (motionx > 0) {
	player_dir = -1;
	//image_xscale = -1
} else if (motionx < 0) {
	player_dir = 1;
	//image_xscale = 1
}