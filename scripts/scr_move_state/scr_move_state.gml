
#region JUMP & MOVE

if (global.canMove) {
	//react to input
	move = oPlayerInput.key_right - oPlayerInput.key_left;
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

	//ledge grab
	if (hsp != 0) {
		hsp_dir = sign(hsp);
	}

	var was_free = !position_meeting(x+(50*hsp_dir), yprevious-20, oWall);
	var is_not_free = position_meeting(x+(50*hsp_dir), y, oWall);
	var near_ground = position_meeting(x, y+100, oWall);

	if (!near_ground and was_free and is_not_free and vsp > 0) {
		hsp = 0;
		vsp = 0;
		//move against ledge
		while (!place_meeting(x+hsp_dir, y, oWall)) {
			x += hsp_dir;
		}
	
		//make sure we are the right height
		while(position_meeting(x+(50*hsp_dir), y-5, oWall)) {
			y--;
		}
	
		state = scr_ledge_grab_state;
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

#region ARMS
// Back Arm
//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0) {
		oBackArm.sprite_index = sBackArmL; //later swap for sBackArmLMoving
	}
	else {
		oBackArm.sprite_index = sBackArmL;	
	}
	oBackArm.x = oPlayer.x - 0;
	oBackArm.y = oPlayer.y - 8;
}

//if player facing left
else {
	if (oPlayer.hsp != 0) {
		oBackArm.sprite_index = sBackArmR; //later swap for sBackArmRMoving
	}
	else {
		oBackArm.sprite_index = sBackArmR;
	}
	oBackArm.x = oPlayer.x - 0;
	oBackArm.y = oPlayer.y - 12;
}

// Front Arm
//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0) {
		oFrontArm.sprite_index = sFrontArmRMoving;
	}
	else {
		oFrontArm.sprite_index = sFrontArmR;	
	}
	oFrontArm.x = oPlayer.x - 13;
	oFrontArm.y = oPlayer.y - 12;
}

//if player facing left
else {
	if (oPlayer.hsp != 0) {
		oFrontArm.sprite_index = sFrontArmL; //later swap for sFrontArmLMoving
	}
	else {
		oFrontArm.sprite_index = sFrontArmL;
	}
	oFrontArm.x = oPlayer.x + 21;
	oFrontArm.y = oPlayer.y - 12;
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

if (oPlayerInput.key_left) {
	facingRight = false;
	image_xscale = -.5
} 
else if (oPlayerInput.key_right) {
	facingRight = true;
	image_xscale = .5
}
#endregion


//show_message(string(groundjumpbuffer));

//show_message(string(groundjumpbuffer));
/*oPlayer.moveStateExecuted = true;
var framesInAir = 0;


//room restart
if(oPlayerInput.key_room_reset) {
	SlideTransition(TRANS_MODE.ROOM_RESTART);
}


if(oPlayerInput.key_jump) {
	jumpQueuFramesElapsed = 0;
}

//increases the Coyote Jump buffer if falling
if(!place_meeting(x, y + vsp, oWall)) {
	buff += 0.3;
}

if (buff >= 1.2 && currentJumps == 0) {
	currentJumps += 1;
}

//increase gravity if falling
if(vsp > 0) {
	vsp += .5
}

//calculate movement (player locking mechanics included)
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
 
 
if (vsp == 0 && place_meeting(x ,y + 1,oWall)) { 
	hsp = walksp * move;
} else if (hsp == 0) {
	hsp = walksp * move;
} else if (oPlayerInput.key_right && hsp < 0) {  //moving 
	hsp += (1/power(2, framesInAir));
	framesInAir += .01;
} else if (oPlayerInput.key_left && hsp > 0) {
	hsp -= (1/power(2, framesInAir));
	framesInAir += .01;
}
/*
if (((totalJumps - currentJumps) > 0) && (jumpQueuFramesElapsed <= 3)) {
	vsp = -JUMP_HEIGHT;
	currentJumps += 1;
}*/
/*
if  (vsp < 0 && !oPlayerInput.key_jump_held) {
	vsp = max(vsp, -8);
	currentJumps += 1;
}
*/
//show_debug_message(string(vsp));
/*if (oPlayerInput.key_jump_held and vsp > -JUMP_HEIGHT and !peakReached) {
	vsp -= 3
	if (vsp < -JUMP_HEIGHT) {
		peakReached = true;
	}
} else {
	vsp += grv;	
}
/*
if (oPlayerInput.key_jump_held && place_meeting(x,y + vsp,oWall)) {
	vsp += grv;
}*/
/*

if (hsp != 0) {
	hsp_dir = sign(hsp);	
}
if (vsp != 0) {
	vsp_dir = sign(vsp);
}


//horizontal collision
if(place_meeting(x+hsp, y, oWall)) {
	while(!place_meeting(x+sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0; 
}
x += hsp;
 
 
 
//vertical collision (includes Coyote Jump buffer reset)
if(place_meeting(x, y+vsp, oWall)) { 
	buff = 0.3;
	while(!place_meeting(x, y+sign(vsp), oWall)) {
		y += sign(vsp);
	}
	framesInAir = 0;
	vsp = 0;
}
y += vsp;
 
 
 
//ground detection
if(place_meeting(x, y+1, oWall)) {
	peakReached = false;
	currentJumps = 0;
	currentWallJumps = 0;
	spriteTurnFrames = 0;
	//sprite_index = sPlayerIdle;
}



//ledge grab
var spr_pos = (79/2)+6;
var offsetx = 30;
if (oPlayer.facingRight) {
	offsetx = 30
} else {
	offsetx = -30
}
var was_free = !position_meeting(x+((spr_pos)*hsp_dir+offsetx), yprevious-4, oWall);
var is_not_free = position_meeting(x+((spr_pos)*hsp_dir+offsetx), y-4, oWall);
var near_ground = position_meeting(x, y+(spr_pos*vsp_dir)+60, oWall);
var moving_down = yprevious < y;
if (!near_ground && was_free && is_not_free && moving_down && !(oPlayerPickUpRadius.itemInLeftHand != noone && oPlayerPickUpRadius.itemInRightHand != noone)) {
	hsp = 0;
	vsp = 0;
	
	//move against the ledge
	while (!place_meeting(x+hsp_dir, y, oWall)) {
		x += hsp_dir;
	}
	
	//make sure we are the right height
	while (position_meeting(x+(spr_pos*hsp_dir), y-5, oWall)) {
		y -= 1;	
	}
	
	state = scr_ledge_grab_state;
}
 
 
 */


//if (hsp != 0) image_xscale = sign(hsp);

	

/*
jumpQueuFramesElapsed++;
*/
