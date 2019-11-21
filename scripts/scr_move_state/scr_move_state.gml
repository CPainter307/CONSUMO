//reset room
if (oPlayerInput.key_room_reset) {
	room_restart()	
}


//add gravity
if (!dash_lock) {
	if motiony < MAX_FALL_SPEED {
		if motiony < 0 {
			motiony += GRAVITY
		} else {
			motiony += FALL_GRAVITY	
		}
	}
}

//jumping with buffer
if (global.canMove) { //we can move
	if on_floor {
	    coyote_buffer = 0
	    if !has_jumped and jump_buffer < JUMP_BUFFER_LENGTH {
			if on_floor {
				var _dust_part = instance_create_layer(x, y+(sprite_height/2), "BGLayer", oDustParticle)
				_dust_part.sprite_index = sJumpParticle
			}
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
			if on_floor {
				var _dust_part = instance_create_layer(x, y+(sprite_height/2), "BGLayer", oDustParticle)
				_dust_part.sprite_index = sJumpParticle
			}
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

	if oPlayerInput.key_jump_released and has_jumped and motiony < 0 {
	    has_jumped = false
	    motiony = lerp(motiony, 0, JUMP_FALLOFF_SPEED)
	}

	if (!dash_lock) {
	
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
				if motionx == 0 and !place_meeting(x+1, y, oWall) { // fixes drawing a billion dust particles when holding a button into a wall
					var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
					_dust_part.sprite_index = sStartRunParticle
					_dust_part.image_xscale = -1
				}
				motionx += ACCELERATION*speedMultiplier
				if motionx >= MAX_SPEED {
					motionx -= ACCELERATION*speedMultiplier
					motionx = lerp(motionx, MAX_SPEED, DECCELRATION)
					at_max_speed = true
				}
			}
			if oPlayerInput.key_left { // moving left
				if motionx == 0 and !place_meeting(x+1, y, oWall)  {
					var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
					_dust_part.sprite_index = sStartRunParticle
					_dust_part.image_xscale = 1
				}
				motionx -= ACCELERATION*speedMultiplier
				if motionx <= -MAX_SPEED {
					motionx -= -ACCELERATION*speedMultiplier
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
			MAX_SPEED = MAX_SPRINT_SPEED*speedMultiplier
			ACCELERATION = SPRINT_ACCELERATION*speedMultiplier
			AIR_ACCELERATION = SPRINT_AIR_ACCELERATION
		}

		else {
			MAX_SPEED = MAX_JOG_SPEED*speedMultiplier
			ACCELERATION = JOG_ACCELERATION*speedMultiplier
			AIR_ACCELERATION = JOG_AIR_ACCELERATION
		}
	}

	//dash
	var _x = 0;
	var _y = 0;
	var spd = oPlayer.dash_speed;

		var dir8 = scr_get_8_dir();
		switch (dir8) {
			case direc.right:
				_x = 1;
				_y = 0;
				break;
			case direc.up_right:
				_x = 1;
				_y = -1;
				spd = oPlayer.dash_speed_diag;
				break;
			case direc.up:
				_x = 0;
				_y = -1;
				break;
			case direc.up_left:
				_x = -1;
				_y = -1;
				spd = oPlayer.dash_speed_diag;
				break;
			case direc.left:
				_x = -1;
				_y = 0;
				break;
			case direc.down_left:
				_x = -1;
				_y = 1;
				spd = oPlayer.dash_speed_diag;
				break;
			case direc.down:
				_x = 0;
				_y = 1;
				break;
			case direc.down_right:
				_x = 1;
				_y = 1;
				spd = oPlayer.dash_speed_diag;
				break;
			default:
				if (oPlayer.player_dir == -1) {
					_x = 1;
					_y = 0;
				}
				else {
					_x = -1;
					_y = 0;
				}
		}

	if (oPlayerInput.key_heavy_throw && !oPlayer.has_heavy_thrown) {
		oPlayer.motionx = 0;
		oPlayer.motiony = 0;
		oPlayer.dash_lock = true;
		oPlayer.motionx = (_x * spd);
		oPlayer.motiony = (_y * spd);
		oPlayer.has_heavy_thrown = true;
	}
} else { //we can't move
	motionx = 0;
	//motiony = 0; //this is commented out rn so that the player doesn't hover in the air during a cutscene
	sprite_index = sPlayerIdle	
}

//collision
up_slope = false;
down_slope = false;
//horizontal collision
if (place_meeting(x, y + 5, oWall) and !place_meeting(x + sign(motionx)*10, y + 1, oWall)) {
		down_slope = true;
		on_floor = true
}	

if (place_meeting(x+motionx, y, oWall)) {
	if (place_meeting(x, y + 5, oWall) and !place_meeting(x+motionx, y - abs(motionx), oWall)) {
		dy = 0;
			while place_meeting(x+motionx, y - dy, oWall) {
				dy++;	
			}
			up_slope = true;
			y = y - dy
			x = x + motionx
			motiony = 0;
			on_floor = true
	}
	else {
		
		var inst_list = ds_list_create();
		instance_place_list(x+motionx, y, oWall, inst_list, false);
		for (i = 0; i < ds_list_size(inst_list); i++) {
			var inst = inst_list[| i];
			if (inst.active) {
				while (!place_meeting(x+sign(motionx), y, inst)) {
					x += sign(motionx);
				}
			}
		}
	
		var any_active = false;
		instance_place_list(x+motionx, y, oWall, inst_list, false);
		for (i = 0; i < ds_list_size(inst_list); i++) {
			var inst = inst_list[| i];
			if (inst.active) {
				any_active = true;	
				break;
			}
		}
		if (any_active) {
			motionx = 0;
		}
	ds_list_destroy(inst_list);
	
	}
}


//vertical collision
if (place_meeting(x, y+motiony, oWall) ) {
	//if (!up_slope) {
	var inst_list = ds_list_create();
	instance_place_list(x, y+motiony, oWall, inst_list, false);
	for (i = 0; i < ds_list_size(inst_list); i++) {
		var inst = inst_list[| i];
		if (inst.active) {
			while (!place_meeting(x, y+sign(motiony), inst)) {
			    y += sign(motiony);
			}
			if (sign(motiony) > 0) {
				if (!on_floor) {
					var _dust_part = instance_create_layer(x, bbox_bottom, "BGLayer", oDustParticle)
					_dust_part.sprite_index = sLandParticle
				}
				on_floor = true
			}	
		}
	}
	var any_active = false;
	instance_place_list(x, y+motiony, oWall, inst_list, false);
	for (i = 0; i < ds_list_size(inst_list); i++) {
		var inst = inst_list[| i];
		if (inst.active) {
			any_active = true;	
			break;
		}
	}
	if (!any_active) {
		on_floor = false;
	}
	else {
		motiony = 0;	
	}
	ds_list_destroy(inst_list);
}
//} else {
	//on_floor = false;
//}

//corner collision (WIP)
if (place_meeting(x+motionx, y+motiony, oWall)) {
	var inst_list = ds_list_create();
	instance_place_list(x+motionx, y+motiony, oWall, inst_list, false);
	for (i = 0; i < ds_list_size(inst_list); i++) {
		var inst = inst_list[| i];
		if (inst.active) {
			while (!place_meeting(x+sign(motionx), y+sign(motiony), inst)) {
				x += sign(motionx);
				y += sign(motiony);
			}
		}
	}
	
	var any_active = false;
	instance_place_list(x+motionx, y+motiony, oWall, inst_list, false);
	for (i = 0; i < ds_list_size(inst_list); i++) {
		var inst = inst_list[| i];
		if (inst.active) {
			any_active = true;	
			break;
		}
	}
	if (any_active) {
		motionx = 0;
		motiony = 0;
	}
	ds_list_destroy(inst_list);
}
if !up_slope {
x += motionx
y += motiony
}

if (place_meeting(x, y+1, oHazard)) game_restart();

//animation (new)
if (!place_meeting(x, y + 2, oWall)) {
	on_floor = false;	
}
if (on_floor or up_slope or down_slope) {
	if (motionx != 0 or up_slope or down_slope) and (sprite_index != sPlayerThrow) and (sprite_index != sPlayerPickup) and global.canMove {
		sprite_index = sPlayerRun
	} else if sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerIdle
	}
	
	if (oPlayerInput.key_sprint_held) {
		image_speed = 1.2
	} else {
		image_speed = 1;
	}
} else {
	if (motiony > 0) and sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerFall
	} else if motiony <= 0 and sprite_index != sPlayerThrow and (sprite_index != sPlayerPickup) {
		sprite_index = sPlayerJump
	}
}

if (motionx > 0) and sprite_index != sPlayerThrow and sprite_index != sPlayerHurt {
	player_dir = -1;
} else if (motionx < 0) and sprite_index != sPlayerThrow and sprite_index != sPlayerHurt {
	player_dir = 1;
}