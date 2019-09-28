//this script handles player movement, collision, and animation

	#region JUMP & MOVE
if (global.canMove) {
	
//locking
if (oPlayerInput.key_locked) {
	isLocked = true;
} else {
	isLocked = false;	
}

if (isLocked) {
	var move = 0;
} else {
	var move = oPlayerInput.key_right - oPlayerInput.key_left;	
}

//react to input
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

	
	canjump--; groundjumpbuffer--;
	if ((canjump > 0 or groundjumpbuffer > 0) and (oPlayerInput.key_jump)) {
		part_emitter_burst(global.ps, em, global.pt_dust, 50); // dust particles
		scr_play_jump_sound();
		vsp = oPlayerInput.key_jump * -jumpspeed;
		groundjumpbuffer = 0;
		canjump = 0;
		landed = false;
	}

	//analog jump height
	if (vsp < 0 and !oPlayerInput.key_jump_held) {
		if (vsp > -7) { // min jump height
			vsp = max(vsp, 0)
		}
	}


	
	//increase gravity if falling
	if (vsp > 0) { 
		vsp += grav*1.5
	 }

}
else {
	if (hsp != 0) {
		hsp = 0;
	}
	if (vsp < 0) {
		vsp = grav * 8
	}
}

#endregion

	#region COLLISION
	//horizontal collision
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	//vertical collision
	if (!landed and place_meeting(x, y+vsp+5, oWall)) {
		part_emitter_burst(global.ps, em, global.pt_dust, 50); // dust particles
		scr_play_land_sound();
		landed = true;
	}
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;

	//buffers
	if (place_meeting(x, y+vsp+10, oWall)) {
		canjump = 5 // coyote jump buffer time (5 frames)
		groundjumpbuffer = 10;	
	}
	#endregion

	#region ANIMATION
	//animation
	if(!place_meeting(x, y+1, oWall)) {
		if(sign(vsp) < 0) {
			sprite_index = sPlayerJump;
		} else if(sign(vsp) > 0) {
			sprite_index = sPlayerFall;
		} 
	} else {
		if(hsp == 0) {
			sprite_index = sPlayerIdle;
		} else {
			sprite_index = sPlayerRun;
		}
	}

	if (oPlayerInput.key_left) && (!isLocked) {
		facingRight = false;
		//image_xscale = -.5
	} 
	else if (oPlayerInput.key_right) && (!isLocked) {
		facingRight = true;
		//image_xscale = .5
	}

	if (facingRight)
	{
		image_xscale = 0.5;	
	}
	else
	{
		image_xscale = -0.5;	
	}
	#endregion



